/*
This is an example of a source control model written in C, according to the IEEE/Cigre DLL Modeling Standard (API V2).

This IBR PWM model can be both a grid following or grid forming IBR depending on the flag settings

At the moment, this model has only been tested in PSCAD. Yet to develop code to interface this model to positive 
sequence simulation programs or other EMT domain programs

Further in grid forming mode, either PLL, Droop, VSM, or dVOC controls architecture can used.

The content of this model is based on the following three papers:
1: B. Johnson, T. Roberts, O. Ajala, A. D. Dominguez-Garcia, S. Dhople, D. Ramasubramanian, A. Tuohy, 
   D. Divan, and B. Kroposki, “A Generic Primary-control Model for Grid-forming Inverters: Towards 
   Interoperable Operation & Control,” 2022 55th Hawaii International Conference on System Sciences (HICSS), 
   Maui, HI, USA, 2022 https://scholarspace.manoa.hawaii.edu/handle/10125/79751

2: D. Ramasubramanian, “Differentiating between plant level and inverter level voltage control to bring about 
   operation of 100% inverter-based resource grids,” Electric Power Systems Research, vol. 205, no. 107739, Apr 2022 
   https://www.sciencedirect.com/science/article/pii/S0378779621007203

3: Ramasubramanian, D., Baker, W., Matevosyan, J., Pant, S., Achilles, S.: Asking for fast terminal voltage control in 
   grid following plants could provide benefits of grid forming behavior. IET Gener. Transm. Distrib. 00, 1– 16 (2022). 
   https://doi.org/10.1049/gtd2.12421

Notes:
1: In PLL mode, still need to resolve use of Vq in voltage - Iqref loop, especially for higher loading levels. Gains are zero 
for now.
2: Need to fine tune fault response, with and without use of Vq (especially during the fault)
3: Added Droop control but have to raise the output up carefully during grid connected mode. Otherwise it is unstable.
   Also, using Q_meas leads to instability
4: Yet to add code for VSM and dVOC mode
5: Yet to add negative sequence voltage control code

This model has:
- 12 inputs:
   - Va   	(kV - A phase point of control voltage)
   - Vb     (kV - B phase point of control voltage)
   - Vc     (kV - C phase point of control voltage)
   - Ia   	(kA - A phase point of control current)
   - Ib     (kA - B phase point of control current)
   - Ic     (kA - C phase point of control current)
   - IaL1	(kA - A phase before capacitor current)
   - IbL1   (kA - B phase before capacitor current)
   - IcL1   (kA - C phase before capacitor current)
   - Pref	(MW - active power reference)
   - Qref	(Mvar - reactive power reference)
   - Vref	(pu - voltage magnitude reference)
- 12 outputs:
   - Ea    (kV, A phase inverter voltage)
   - Eb    (kV, B phase inverter voltage)
   - Ec    (kV, C phase inverter voltage)
   - Idref (pu, d-axis reference current)
   - Id    (pu, d-axis current)
   - Iqref (pu, q-axis reference current)
   - Iq    (pu, q-axis current)
   - Vd    (pu, d-axis voltage)
   - Vq    (pu, q-axis voltage)
   - Freq_pll (Hz, PLL frequency)
   - Pelec (MW, active power output)
   - Qelec (Mvar, reactive power output)
- 41 parameters:
   - Vbase  (kV - RMS L-L base voltage)
   - Sbase  (MVA - Power base)
   - Vdcbase(kV - dc base voltage)
   - KpI    (pu/pu - Current controller proportional gain)
   - KiI    (pu/pu - Current controller integral gain)
   - wtype  (0 - PLL, 1 - Droop, 2 - VSM, 3 - dVOC)
   - KpPLL  (pu/rad/s - PLL proportional gain)
   - KiPLL  (pu/rad/s - PLL integral gain)
   - del_f_limit (Hz - Delta frequency limit)
   - KpP    (pu/pu - Active power controller proportional gain)
   - KiP    (pu/pu - Active power controller integral gain)
   - Qflag  (0 - Q control, 1 - V control)
   - KpQ    (pu/pu - Reactive power controller proportional gain)
   - KiQ    (pu/pu - Reactive power controller integral gain)
   - KpV    (pu/pu - Voltage magnitude controller (PLL based) proportional gain)
   - KiV    (pu/pu - Voltage magnitude controller (PLL based) integral gain)
   - KpVq   (pu/pu - q-axis voltage magnitude controller (PLL based) proportional gain)
   - KiVq   (pu/pu - q-axis voltage magnitude controller (PLL based) integral gain)
   - Imax   (pu - Maximum value of current magnitude)
   - Pmax   (pu - Maximum value of active power)
   - Pmin   (pu - Minimum value of active power)
   - Qmax   (pu - Maximum value of reactive power)
   - Qmin   (pu - Minimum value of reactive power)
   - PQflag (0 - Ppriority, 1 - Qpriority)
   - KfDroop (pu - Frequency droop gain)
   - KvDroop (pu - Voltage droop gain)
   - K_POD  (pu - Power Oscillation Damper Gain)
   - T_POD  (s - Power Oscillation Damper Time constant)
   - T1_POD (s - Power Oscillation Damper Lead)
   - T2_POD (s - Power Oscillation Damper Lag)
   - POD_min(pu - Power Oscillation Damper Min Limit)
   - POD_max(pu - Power Oscillation Damper Max Limit)
   - Vdip   (pu - Value of voltage below which states are frozen)
   - Vup    (pu - Value of voltage above which states are frozen)
   - KpVdq  (pu/pu - Vd and Vq controller (droop, VSM, dVOC) proportional gain)
   - KiVdq  (pu/pu - Vd and Vq controller (droop, VSM, dVOC) integral gain)
   - Tr     (s - Power measurement transducer time constant)
   - Rchoke (pu - Filter resistance)
   - Lchoke (pu - Filter inductance)
   - Cfilt  (pu - Filter capacitance)
   - Rdamp  (pu - Filter damper resistance)

This model will be compiled into a DLL, and then can be used in ANY power system
simulation program by running the "DLLImport" tool that comes with each program.

The IEEE/Cigre DLL standard is based on concepts from the IEC 61400-27-1 DLL standard, with changes:
- in how state variables are allocated
- added support for different variable types
- general changes so all variables and documentation are independant of any specific simulation tool
- focus on fixed time step controllers (as are used in real-code firmware in the field)

This is a draft model that may still need further modifications and improvements
January 27, 2022, Deepak Ramasubramanian, EPRI (dramasubramanian@epri.com)
*/
#include <windows.h>
#include <stdio.h>
#include <math.h>
#define PI 3.14159265

#include "IEEE_Cigre_DLLInterface.h"

char ErrorMessage[1000];

// ----------------------------------------------------------------------
// Structures defining inputs, outputs, parameters and program structure
// to be called by the DLLImport Tool
// ----------------------------------------------------------------------

typedef struct _MyModelInputs {
    real64_T Va;
    real64_T Vb;
    real64_T Vc;
    real64_T Ia;
    real64_T Ib;
    real64_T Ic;
    real64_T IaL1;
    real64_T IbL1;
    real64_T IcL1;
    real64_T Pref;
	real64_T Qref;
    real64_T Vref;
} MyModelInputs;

// Define Input Signals
IEEE_Cigre_DLLInterface_Signal InputSignals[] = {
    [0] = {
        .Name = "Va",                                           // Input Signal name
        .Description = "A phase point of control voltage",      // Description
        .Unit = "kV",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    },
    [1] = {
        .Name = "Vb",                                           // Input Signal name
        .Description = "B phase point of control voltage",      // Description
        .Unit = "kV",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    },
    [2] = {
        .Name = "Vc",                                           // Input Signal name
        .Description = "C phase point of control voltage",      // Description
        .Unit = "kV",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    },
    [3] = {
        .Name = "Ia",                                           // Input Signal name
        .Description = "A phase point of control current",      // Description
        .Unit = "kA",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    },
    [4] = {
        .Name = "Ib",                                           // Input Signal name
        .Description = "B phase point of control current",      // Description
        .Unit = "kA",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    },
    [5] = {
        .Name = "Ic",                                           // Input Signal name
        .Description = "C phase point of control current",      // Description
        .Unit = "kA",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    },
    [6] = {
        .Name = "IaL1",                                         // Input Signal name
        .Description = "A phase before capacitor current",      // Description
        .Unit = "kA",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    },
    [7] = {
        .Name = "IbL1",                                         // Input Signal name
        .Description = "B phase before capacitor current",      // Description
        .Unit = "kA",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    },
    [8] = {
        .Name = "IcL1",                                         // Input Signal name
        .Description = "C phase before capacitor current",      // Description
        .Unit = "kA",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    },
    [9] = {
        .Name = "Pref",                                         // Input Signal name
        .Description = "Active power reference ",               // Description
        .Unit = "MW",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    },
	[10] = {
        .Name = "Qref",                                         // Input Signal name
        .Description = "Reactive power reference",              // Description
        .Unit = "Mvar",                                         // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    },
    [11] = {
        .Name = "Vref",                                         // Input Signal name
        .Description = "Voltage magnitude reference",           // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    }
};

typedef struct _MyModelOutputs {
    real64_T Ea;
	real64_T Eb;
	real64_T Ec;
    real64_T Idrefout;
    real64_T Idout;
    real64_T Iqrefout;
    real64_T Iqout;
    real64_T Vdout;
    real64_T Vqout;
    real64_T Freqpll;
    real64_T Pout;
    real64_T Qout;
} MyModelOutputs;

// Define Output Signals
IEEE_Cigre_DLLInterface_Signal OutputSignals[] = {    
    [0] = {
        .Name = "Ea",                                           // Output signal name
        .Description = "A phase inverter voltage",              // Description
        .Unit = "kV",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Array Dimension
    },
	[1] = {
        .Name = "Eb",                                           // Output signal name
        .Description = "B phase inverter voltage",              // Description
        .Unit = "kV",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Array Dimension
    },
	[2] = {
        .Name = "Ec",                                           // Output signal name
        .Description = "C phase inverter voltage",              // Description
        .Unit = "kV",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Array Dimension
    },
    [3] = {
        .Name = "Idref",                                        // Output signal name
        .Description = "d reference current",                   // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Array Dimension
    },
    [4] = {
        .Name = "Id",                                           // Output signal name
        .Description = "d axis current",                        // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Array Dimension
    },
    [5] = {
        .Name = "Iqref",                                        // Output signal name
        .Description = "q reference current",                   // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Array Dimension
    },
    [6] = {
        .Name = "Iq",                                           // Output signal name
        .Description = "q axis current",                        // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Array Dimension
    },
    [7] = {
        .Name = "Vd",                                           // Output signal name
        .Description = "d axis voltage",                        // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Array Dimension
    },
    [8] = {
        .Name = "Vq",                                           // Output signal name
        .Description = "q axis voltage",                        // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Array Dimension
    },
    [9] = {
        .Name = "Freq_pll",                                     // Output signal name
        .Description = "PLL frequency",                         // Description
        .Unit = "Hz",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Array Dimension
    },
    [10] = {
        .Name = "Pout",                                         // Output signal name
        .Description = "Output active power",                   // Description
        .Unit = "MW",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Array Dimension
    },
    [11] = {
        .Name = "Qout",                                         // Output signal name
        .Description = "Output reactive power",                 // Description
        .Unit = "Mvar",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Array Dimension
    }
};


typedef struct _MyModelParameters {
    real64_T Vbase;
    real64_T Sbase;
    real64_T Vdcbase;
    real64_T KpI;
    real64_T KiI;
    real64_T wtype;
    real64_T KpPLL;
    real64_T KiPLL;
    real64_T del_f_limit;
    real64_T KpP;
    real64_T KiP;
    real64_T Qflag;
    real64_T KpQ;
    real64_T KiQ;
    real64_T KpV;
    real64_T KiV;
    real64_T KpVq;
    real64_T KiVq;
    real64_T Imax;
    real64_T Pmax;
    real64_T Pmin;
    real64_T Qmax;
    real64_T Qmin;
    real64_T PQflag;
    real64_T KfDroop;
    real64_T KvDroop;
    real64_T K_POD;
    real64_T T_POD;
    real64_T T1_POD;
    real64_T T2_POD;
    real64_T POD_min;
    real64_T POD_max;
    real64_T Vdip;
    real64_T Vup;
    real64_T KpVdq;
    real64_T KiVdq;
    real64_T Tr;
    real64_T Rchoke;
	real64_T Lchoke;
    real64_T Cfilt;
    real64_T Rdamp;
} MyModelParameters;

// Define Parameters
IEEE_Cigre_DLLInterface_Parameter Parameters[] = {
    [0] = {
        .Name = "Vbase",                                        // Parameter Names
        .Description = "RMS L-L base voltage",			        // Description
        .Unit = "kV",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.65,                        // Default value
        .MinValue.Real64_Val = 0.001,                           // Minimum value
        .MaxValue.Real64_Val = 1000.0                           // Maximum value
    },
    [1] = {
        .Name = "Sbase",                                        // Parameter Names
        .Description = "MVA base",                              // Description
        .Unit = "MVA",                                          // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 1000.0,                      // Default value
        .MinValue.Real64_Val = 0.001,                           // Minimum value
        .MaxValue.Real64_Val = 10000.0                          // Maximum value
    },    
    [2] = {
        .Name = "Vdcbase",                                      // Parameter Names
        .Description = "dc base voltage",                       // Description
        .Unit = "kV",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 1.3,                         // Default value
        .MinValue.Real64_Val = 0.001,                           // Minimum value
        .MaxValue.Real64_Val = 1000.0                           // Maximum value
    },
    [3] = {
        .Name = "KpI",                                          // Parameter Names
        .Description = "Current control proportional gain",     // Description
        .Unit = "pu/pu",                                        // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.5,                         // Default value
        .MinValue.Real64_Val = 0.001,                           // Minimum value
        .MaxValue.Real64_Val = 100.0                            // Maximum value
    },
    [4] = {
        .Name = "KiI",                                          // Parameter Names
        .Description = "Current control integral gain",         // Description
        .Unit = "pu/pu",                                        // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 1.0,                         // Default value
        .MinValue.Real64_Val = 0.0,                             // Minimum value
        .MaxValue.Real64_Val = 100.0                            // Maximum value
    },
    [5] = {
        .Name = "Wtype",                                        // Parameter Names
        .Description = "Frequency generation control type",     // Description
        .Unit = "N/A",                                          // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.0,                         // Default value
        .MinValue.Real64_Val = 0.0,                             // Minimum value
        .MaxValue.Real64_Val = 100.0                            // Maximum value
    },
    [6] = {
        .Name = "KpPLL",                                        // Parameter Names
        .Description = "PLL proportional gain",                 // Description
        .Unit = "pu/rad/s",                                     // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 20.0,                        // Default value
        .MinValue.Real64_Val = 1.0,                             // Minimum value
        .MaxValue.Real64_Val = 500.0                            // Maximum value
    },
    [7] = {
        .Name = "KiPLL",                                        // Parameter Names
        .Description = "PLL integral gain",                     // Description
        .Unit = "pu/rad/s",                                     // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 200,                         // Default value
        .MinValue.Real64_Val = 0.1,                             // Minimum value
        .MaxValue.Real64_Val = 5000.0                           // Maximum value
    },
    [8] = {
        .Name = "del_f_limit",                                  // Parameter Names
        .Description = "Delta Frequency Limit",                 // Description
        .Unit = "Hz",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 12,                          // Default value
        .MinValue.Real64_Val = 10.0,                            // Minimum value
        .MaxValue.Real64_Val = 20.0                             // Maximum value
    },
    [9] = {
        .Name = "KpP",                                          // Parameter Names
        .Description = "Active power control proportional gain",// Description
        .Unit = "pu/pu",                                        // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.5,                         // Default value
        .MinValue.Real64_Val = 0.001,                           // Minimum value
        .MaxValue.Real64_Val = 100.0                            // Maximum value
    },
    [10] = {
        .Name = "KiP",                                          // Parameter Names
        .Description = "Active power control integral gain",    // Description
        .Unit = "pu/pu",                                        // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 10.0,                        // Default value
        .MinValue.Real64_Val = 0.0,                             // Minimum value
        .MaxValue.Real64_Val = 100.0                            // Maximum value
    },
    [11] = {
        .Name = "Qflag",                                        // Parameter Names
        .Description = "Q control (0-Q,1-V)",                   // Description
        .Unit = "N/A",                                          // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 1.0,                         // Default value
        .MinValue.Real64_Val = 0.0,                             // Minimum value
        .MaxValue.Real64_Val = 1.0                              // Maximum value
    },
    [12] = {
        .Name = "KpQ",                                          // Parameter Names
        .Description = "Reactive power control proportional gain",// Description
        .Unit = "pu/pu",                                        // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.5,                         // Default value
        .MinValue.Real64_Val = 0.001,                           // Minimum value
        .MaxValue.Real64_Val = 100.0                            // Maximum value
    },
    [13] = {
        .Name = "KiQ",                                          // Parameter Names
        .Description = "Reactive power control integral gain",    // Description
        .Unit = "pu/pu",                                        // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 20.0,                        // Default value
        .MinValue.Real64_Val = 0.0,                             // Minimum value
        .MaxValue.Real64_Val = 100.0                            // Maximum value
    },
    [14] = {
        .Name = "KpV",                                          // Parameter Names
        .Description = "Voltage magnitude control (PLL-base) proportional gain",// Description
        .Unit = "pu/pu",                                        // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.5,                        // Default value
        .MinValue.Real64_Val = 0.001,                           // Minimum value
        .MaxValue.Real64_Val = 100.0                            // Maximum value
    },
    [15] = {
        .Name = "KiV",                                          // Parameter Names
        .Description = "Voltage magnitude control (PLL-base) integral gain",    // Description
        .Unit = "pu/pu",                                        // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 150.0,                        // Default value
        .MinValue.Real64_Val = 0.0,                              // Minimum value
        .MaxValue.Real64_Val = 1000.0                            // Maximum value
    },
    [16] = {
        .Name = "KpVq",                                         // Parameter Names
        .Description = "q-axis voltage magnitude control (PLL-base) proportional gain",// Description
        .Unit = "pu/pu",                                        // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.0,                         // Default value
        .MinValue.Real64_Val = 0.0,                             // Minimum value
        .MaxValue.Real64_Val = 100.0                            // Maximum value
    },
    [17] = {
        .Name = "KiVq",                                         // Parameter Names
        .Description = "q-axis voltage magnitude control (PLL-base) integral gain",    // Description
        .Unit = "pu/pu",                                        // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.0,                         // Default value
        .MinValue.Real64_Val = 0.0,                             // Minimum value
        .MaxValue.Real64_Val = 1000.0                           // Maximum value
    },
    [18] = {
        .Name = "Imax",                                         // Parameter Names
        .Description = "Maximum value of current magnitude",    // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 1.2,                         // Default value
        .MinValue.Real64_Val = 1.0,                             // Minimum value
        .MaxValue.Real64_Val = 1.7                              // Maximum value
    },
    [19] = {
        .Name = "Pmax",                                         // Parameter Names
        .Description = "Maximum value of active power",         // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 1.0,                         // Default value
        .MinValue.Real64_Val = 0.0,                             // Minimum value
        .MaxValue.Real64_Val = 1.0                              // Maximum value
    },
    [20] = {
        .Name = "Pmin",                                         // Parameter Names
        .Description = "Minimum value of active power",         // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.0,                         // Default value
        .MinValue.Real64_Val = -1.0,                            // Minimum value
        .MaxValue.Real64_Val = 0.0                              // Maximum value
    },
    [21] = {
        .Name = "Qmax",                                         // Parameter Names
        .Description = "Maximum value of reactive power",       // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 1.0,                         // Default value
        .MinValue.Real64_Val = 0.0,                             // Minimum value
        .MaxValue.Real64_Val = 1.0                              // Maximum value
    },
    [22] = {
        .Name = "Qmin",                                         // Parameter Names
        .Description = "Minimum value of reactive power",       // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = -1.0,                        // Default value
        .MinValue.Real64_Val = -1.0,                            // Minimum value
        .MaxValue.Real64_Val = 0.0                              // Maximum value
    },
    [23] = {
        .Name = "PQflag",                                       // Parameter Names
        .Description = "PQ priority (0-P,1-Q)",                 // Description
        .Unit = "N/A",                                          // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 1.0,                         // Default value
        .MinValue.Real64_Val = 0.0,                             // Minimum value
        .MaxValue.Real64_Val = 1.0                              // Maximum value
    },
    [24] = {
        .Name = "KfDroop",                                      // Parameter Names
        .Description = "Frequency droop gain",                  // Description
        .Unit = "pu/pu",                                        // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 30.0,                        // Default value
        .MinValue.Real64_Val = 0.0,                             // Minimum value
        .MaxValue.Real64_Val = 500.0                            // Maximum value
    },
    [25] = {
        .Name = "KvDroop",                                      // Parameter Names
        .Description = "Voltage droop gain",                    // Description
        .Unit = "pu/pu",                                        // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 22.22,                       // Default value
        .MinValue.Real64_Val = 0.0,                             // Minimum value
        .MaxValue.Real64_Val = 500.0                            // Maximum value
    },
    [26] = {
        .Name = "K_POD",                                        // Parameter Names
        .Description = "Power Oscillation Damper Gain",         // Description
        .Unit = "pu/pu",                                        // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.0,                         // Default value
        .MinValue.Real64_Val = 0.0,                             // Minimum value
        .MaxValue.Real64_Val = 50.0                             // Maximum value
    },
    [27] = {
        .Name = "T_POD",                                        // Parameter Names
        .Description = "Power Oscillation Damper Time constant",// Description
        .Unit = "s",                                            // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.01,                        // Default value
        .MinValue.Real64_Val = 0.001,                           // Minimum value
        .MaxValue.Real64_Val = 1.0                              // Maximum value
    },
    [28] = {
        .Name = "T1_POD",                                       // Parameter Names
        .Description = "Power Oscillation Damper Lead",         // Description
        .Unit = "s",                                            // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.01,                        // Default value
        .MinValue.Real64_Val = 0.001,                           // Minimum value
        .MaxValue.Real64_Val = 1.0                              // Maximum value
    },
    [29] = {
        .Name = "T2_POD",                                       // Parameter Names
        .Description = "Power Oscillation Damper Lag",          // Description
        .Unit = "s",                                            // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.001,                       // Default value
        .MinValue.Real64_Val = 0.001,                           // Minimum value
        .MaxValue.Real64_Val = 1.0                              // Maximum value
    },
    [30] = {
        .Name = "POD_min",                                      // Parameter Names
        .Description = "Power Oscillation Damper Min Limit",    // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = -0.5,                        // Default value
        .MinValue.Real64_Val = -1.0,                            // Minimum value
        .MaxValue.Real64_Val = 0.0                              // Maximum value
    },
    [31] = {
        .Name = "POD_max",                                      // Parameter Names
        .Description = "Power Oscillation Damper Max Limit",    // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.5,                         // Default value
        .MinValue.Real64_Val = 0.0,                             // Minimum value
        .MaxValue.Real64_Val = 1.0                              // Maximum value
    },
    [32] = {
        .Name = "Vdip",                                         // Parameter Names
        .Description = "Under voltage threshold to freeze",     // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.8,                         // Default value
        .MinValue.Real64_Val = 0.7,                             // Minimum value
        .MaxValue.Real64_Val = 0.9                              // Maximum value
    },
    [33] = {
        .Name = "Vup",                                          // Parameter Names
        .Description = "Over voltage threshold to freeze",      // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 1.2,                         // Default value
        .MinValue.Real64_Val = 1.1,                             // Minimum value
        .MaxValue.Real64_Val = 1.3                              // Maximum value
    },
    [34] = {
        .Name = "KpVdq",                                        // Parameter Names
        .Description = "Vd and Vq proportional gain",           // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 3.0,                         // Default value
        .MinValue.Real64_Val = 0.0,                             // Minimum value
        .MaxValue.Real64_Val = 100.0                            // Maximum value
    },
    [35] = {
        .Name = "KiVdq",                                        // Parameter Names
        .Description = "Vd and Vq proportional gain",           // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 10.0,                        // Default value
        .MinValue.Real64_Val = 0.0,                             // Minimum value
        .MaxValue.Real64_Val = 100.0                            // Maximum value
    },
    [36] = {
        .Name = "Tr",                                           // Parameter Names
        .Description = "Power measurement transducer",          // Description
        .Unit = "s",                                            // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.001,                       // Default value
        .MinValue.Real64_Val = 0.0,                             // Minimum value
        .MaxValue.Real64_Val = 0.1                              // Maximum value
    },
    [37] = {
        .Name = "Rchoke",                                       // Parameter Names
        .Description = "Filter resistance",                     // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.00,                        // Default value
        .MinValue.Real64_Val = 0.00,                            // Minimum value
        .MaxValue.Real64_Val = 1.0                              // Maximum value
    },
	[38] = {
        .Name = "Lchoke",                                       // Parameter Names
        .Description = "Filter inductance",                     // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.15,                        // Default value
        .MinValue.Real64_Val = 0.001,                           // Minimum value
        .MaxValue.Real64_Val = 1.0                              // Maximum value
    },
    [39] = {
        .Name = "Cfilt",                                        // Parameter Names
        .Description = "Filter capacitance",                    // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.01666,                     // Default value
        .MinValue.Real64_Val = 0.001,                           // Minimum value
        .MaxValue.Real64_Val = 1.0                              // Maximum value
    },
    [40] = {
        .Name = "Rdamp",                                        // Parameter Names
        .Description = "Filter damper resistance",              // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 9.4868,                      // Default value
        .MinValue.Real64_Val = 0.001,                           // Minimum value
        .MaxValue.Real64_Val = 10.0                             // Maximum value
    }
};



IEEE_Cigre_DLLInterface_Model_Info Model_Info = {
    .DLLInterfaceVersion = { 1, 1, 0, 0 },                              // Release number of the API used during code generation
    .ModelName = "GFM-GFL-IBR-PWM-Model",                               // Model name
    .ModelVersion = "1.1.0.0",                                          // Model version
    .ModelDescription = "GFM-GFL-IBR-PWM",                              // Model description
    .GeneralInformation = "General Information",                        // General information
    .ModelCreated = "January 27, 2021",                                 // Model created on
    .ModelCreator = "Deepak Ramasubramanian",                           // Model created by
    .ModelLastModifiedDate = "January 27, 2022",                        // Model last modified on
    .ModelLastModifiedBy = "Deepak Ramasubramanian",                    // Model last modified by
    .ModelModifiedComment = "Version 1.1.0.0 for IEEE/Cigre DLL API V2",// Model modified comment
    .ModelModifiedHistory = "First instance",                           // Model modified history
    .FixedStepBaseSampleTime = 0.00001,                                 // Time Step sampling time (sec)

    // Inputs
    .NumInputPorts = 12,                                                // Number of Input Signals
    .InputPortsInfo = InputSignals,                                     // Inputs structure defined above

    // Outputs
    .NumOutputPorts = 12,                                               // Number of Output Signals
    .OutputPortsInfo = OutputSignals,                                   // Outputs structure defined above

    // Parameters
    .NumParameters = 41,                                                // Number of Parameters
    .ParametersInfo = Parameters,                                       // Parameters structure defined above

    // Number of State Variables
    .NumIntStates = 0,                                                  // Number of Integer states
    .NumFloatStates = 0,                                                // Number of Float states
    .NumDoubleStates = 36                                               // Number of Double states
};

// ----------------------------------------------------------------
// Subroutines that can be called by the main power system program
// ----------------------------------------------------------------
__declspec(dllexport) const IEEE_Cigre_DLLInterface_Model_Info* __cdecl Model_GetInfo() {
    /* Returns Model Information
    */
    return &Model_Info;
};

// ----------------------------------------------------------------
__declspec(dllexport) int32_T __cdecl Model_CheckParameters(IEEE_Cigre_DLLInterface_Instance* instance) {
    /*   Checks the parameters on the given range
       Arguments: Instance specific model structure containing Inputs, Parameters and Outputs
       Return:    Integer status 0 (normal), 1 if messages are written, 2 for errors.  See IEEE_Cigre_DLLInterface_types.h
    */
    // Parameter checks done by the program
    // Note - standard min/max checks should be done by the higher level GUI/Program
    MyModelParameters* parameters = (MyModelParameters*)instance->Parameters;

    double Vbase = parameters->Vbase;
    double Sbase = parameters->Sbase;
    double Vdcbase = parameters->Vdcbase;
    double KpI = parameters->KpI;
    double KiI = parameters->KiI;
    double wtype = parameters->wtype;
    double KpPLL = parameters->KpPLL;
    double KiPLL = parameters->KiPLL;
    double del_f_limit = parameters->del_f_limit;
    double KpP = parameters->KpP;
    double KiP = parameters->KiP;
    double Qflag = parameters->Qflag;
    double KpQ = parameters->KpQ;
    double KiQ = parameters->KiQ;
    double KpV = parameters->KpV;
    double KiV = parameters->KiV;
    double KpVq = parameters->KpVq;
    double KiVq = parameters->KiVq;
    double Imax = parameters->Imax;
    double Pmax = parameters->Pmax;
    double Pmin = parameters->Pmin;
    double Qmax = parameters->Qmax;
    double Qmin = parameters->Qmin;
    double PQflag = parameters->PQflag;
    double KfDroop = parameters->KfDroop;
    double KvDroop = parameters->KvDroop;
    double K_POD = parameters->K_POD;
    double T_POD = parameters->T_POD;
    double T1_POD = parameters->T1_POD;
    double T2_POD = parameters->T2_POD;
    double POD_min = parameters->POD_min;
    double POD_max = parameters->POD_max;
    double Vdip = parameters->Vdip;
    double Vup = parameters->Vup;
    double KpVdq = parameters->KpVdq;
    double KiVdq = parameters->KiVdq;
    double Tr = parameters->Tr;
    double Rchoke = parameters->Rchoke;
	double Lchoke = parameters->Lchoke;
    double Cfilt = parameters->Cfilt;
    double Rdamp = parameters->Rdamp;
    //
    double delt = Model_Info.FixedStepBaseSampleTime;

    ErrorMessage[0] = '\0';
    if ((1.0/KiI) < 2.0*delt) {
        // write error message
        sprintf_s(ErrorMessage, sizeof(ErrorMessage), "GFL-IBR Error - Parameter KiI is: %f, but has been reset to be reciprocal of 2 times the time step: %f .\n", KiI, delt);
        parameters->KiI = 1.0/(2.0*delt);
    }
    if ((1.0/KiPLL) < 2.0*delt) {
        // write error message
        sprintf_s(ErrorMessage, sizeof(ErrorMessage), "GFL-IBR Error - Parameter KiPLL is: %f, but has been reset to be reciprocal of 2 times the time step: %f .\n", KiPLL, delt);
        parameters->KiPLL = 1.0/(2.0*delt);
    }
    if ((1.0 / KiP) < 2.0 * delt) {
        // write error message
        sprintf_s(ErrorMessage, sizeof(ErrorMessage), "GFL-IBR Error - Parameter KiP is: %f, but has been reset to be reciprocal of 2 times the time step: %f .\n", KiP, delt);
        parameters->KiP = 1.0 / (2.0 * delt);
    }
    if ((1.0 / KiQ) < 2.0 * delt) {
        // write error message
        sprintf_s(ErrorMessage, sizeof(ErrorMessage), "GFL-IBR Error - Parameter KiQ is: %f, but has been reset to be reciprocal of 2 times the time step: %f .\n", KiQ, delt);
        parameters->KiQ = 1.0 / (2.0 * delt);
    }
    if ((1.0 / KiV) < 2.0 * delt) {
        // write error message
        sprintf_s(ErrorMessage, sizeof(ErrorMessage), "GFL-IBR Error - Parameter KiV is: %f, but has been reset to be reciprocal of 2 times the time step: %f .\n", KiV, delt);
        parameters->KiV = 1.0 / (2.0 * delt);
    }
    instance->LastGeneralMessage = ErrorMessage;
    return IEEE_Cigre_DLLInterface_Return_OK;
};

// ----------------------------------------------------------------
__declspec(dllexport) int32_T __cdecl Model_Initialize(IEEE_Cigre_DLLInterface_Instance* instance) {
    /*   Initializes the system by resetting the internal states
       Arguments: Instance specific model structure containing Inputs, Parameters and Outputs
       Return:    Integer status 0 (normal), 1 if messages are written, 2 for errors.  See IEEE_Cigre_DLLInterface_types.h
    */
    //
    // Note that the initial conditions for all models are determined by the main calling program
    // and are passed to this routine via the instance->ExternalOutputs vector.
    // instance->ExternalOutputs is normally the output of this routine, but in the first time step
    // the main program must set the instance->ExternalOutputs to initial values.
    //
    MyModelParameters* parameters = (MyModelParameters*)instance->Parameters;
    // local variables, if any
    
    // Retrieve variables from Input, Output and State
    double Vbase = parameters->Vbase;
    double Sbase = parameters->Sbase;
    double Vdcbase = parameters->Vdcbase;
    double KpI = parameters->KpI;
    double KiI = parameters->KiI;
    double wtype = parameters->wtype;
    double KpPLL = parameters->KpPLL;
    double KiPLL = parameters->KiPLL;
    double del_f_limit = parameters->del_f_limit;
    double KpP = parameters->KpP;
    double KiP = parameters->KiP;
    double Qflag = parameters->Qflag;
    double KpQ = parameters->KpQ;
    double KiQ = parameters->KiQ;
    double KpV = parameters->KpV;
    double KiV = parameters->KiV;
    double KpVq = parameters->KpVq;
    double KiVq = parameters->KiVq;
    double Imax = parameters->Imax;
    double Pmax = parameters->Pmax;
    double Pmin = parameters->Pmin;
    double Qmax = parameters->Qmax;
    double Qmin = parameters->Qmin;
    double PQflag = parameters->PQflag;
    double KfDroop = parameters->KfDroop;
    double KvDroop = parameters->KvDroop;
    double K_POD = parameters->K_POD;
    double T_POD = parameters->T_POD;
    double T1_POD = parameters->T1_POD;
    double T2_POD = parameters->T2_POD;
    double POD_min = parameters->POD_min;
    double POD_max = parameters->POD_max;
    double Vdip = parameters->Vdip;
    double Vup = parameters->Vup;
    double KpVdq = parameters->KpVdq;
    double KiVdq = parameters->KiVdq;
    double Tr = parameters->Tr;
    double Rchoke = parameters->Rchoke;
	double Lchoke = parameters->Lchoke;
    double Cfilt = parameters->Cfilt;
    double Rdamp = parameters->Rdamp;
    //
    double delt = Model_Info.FixedStepBaseSampleTime;
    //
    MyModelInputs* inputs = (MyModelInputs*)instance->ExternalInputs;
    double Va = inputs->Va;
    double Vb = inputs->Vb;
    double Vc = inputs->Vc;
    double Ia = inputs->Ia;
    double Ib = inputs->Ib;
    double Ic = inputs->Ic;
    double IaL1 = inputs->IaL1;
    double IbL1 = inputs->IbL1;
    double IcL1 = inputs->IcL1;
    double Pref = inputs->Pref;
	double Qref = inputs->Qref;
    double Vref = inputs->Vref;

    // Working back from initial output
    MyModelOutputs* outputs = (MyModelOutputs*)instance->ExternalOutputs;
    double Ea = outputs->Ea;
	double Eb = outputs->Eb;
	double Ec = outputs->Ec;
    double Idrefout = outputs->Idrefout;
    double Idout = outputs->Idout;
    double Iqrefout = outputs->Iqrefout;
    double Iqout = outputs->Iqout;
    double Vdout = outputs->Vdout;
    double Vqout = outputs->Vqout;
    double Freqpll = outputs->Freqpll;
    double Pout = outputs->Pout;
    double Qout = outputs->Qout;
    ErrorMessage[0] = '\0';

    // save state variables
    instance->DoubleStates[0] = 0.0;
    instance->DoubleStates[1] = 0.0;
    instance->DoubleStates[2] = 0.0;
    instance->DoubleStates[3] = 0.0;
    instance->DoubleStates[4] = 0.0;
    instance->DoubleStates[5] = 0.0;
	instance->DoubleStates[6] = 0.0;
    instance->DoubleStates[7] = 0.0;
    instance->DoubleStates[8] = Pout/Sbase;
    instance->DoubleStates[9] = 0.0;
    instance->DoubleStates[10] = 0.0;
    instance->DoubleStates[11] = -Qout/Sbase;
    instance->DoubleStates[12] = 0.0;
    instance->DoubleStates[13] = 0.0;
    instance->DoubleStates[14] = 0.0;
    instance->DoubleStates[15] = 0.0;
    instance->DoubleStates[16] = 0.0;
    instance->DoubleStates[17] = 0.0;
    instance->DoubleStates[18] = 0.0;
    instance->DoubleStates[19] = Pout / Sbase;
    instance->DoubleStates[20] = Pout / Sbase;
    instance->DoubleStates[21] = Qout / Sbase;
    instance->DoubleStates[22] = Qout / Sbase;
    instance->DoubleStates[23] = 0.0;
    instance->DoubleStates[24] = 0.0;
    instance->DoubleStates[25] = 0.0;
    instance->DoubleStates[26] = 0.0;
    instance->DoubleStates[27] = 0.0;
    instance->DoubleStates[28] = 0.0;
    instance->DoubleStates[29] = 0.0;
    instance->DoubleStates[30] = 0.0;
    instance->DoubleStates[31] = 0.0;
    instance->DoubleStates[32] = 0.0;
    instance->DoubleStates[33] = 0.0;
    instance->DoubleStates[34] = 0.0;
    instance->DoubleStates[35] = 0.0;
    instance->LastGeneralMessage = ErrorMessage;
    return IEEE_Cigre_DLLInterface_Return_OK;
};

// Integrator with time constant T
double INTEGRATOR(double T, double x, double x_old, double y_old, double delt) {
    double y;
    double Kint = (delt * 0.5) / T;

    y = y_old +  Kint * (x + x_old);

    return y;
};

// PI with gain K and integrator with time constant T
double PICONTROLLER(double K, double T, double x, double x_old, double y_old, double delt) {
    double y;
    double Kint = (delt*0.5) / T;

    y = y_old + K*(x - x_old) + Kint*(x + x_old);
    
    return y;
};

// first order lag with gain G, time constant T, with non-windup internal limits
double REALPOLE(double G, double T, double x, double x_old, double y_old, double ymin, double ymax, double delt) {
    double y;
    double Kint = (delt*0.5) / T;

    y = (y_old + Kint*(G*x + G*x_old - y_old)) / (1.0 + Kint);
    if (y > ymax)  y = ymax;
    if (y < ymin)  y = ymin;
    return y;
};

// second order complex pole with gain G, time constant T, damping B. Only first state represented as C function cannot return two variables
double CMPLXPOLE(double G, double T, double B, double x, double x_old, double yp_old, double y_old, double delt) {
    double yp;
    double Kint = (delt * 0.5) / T;

    yp = ((1 - Kint * B - Kint * Kint) * yp_old + Kint * (G * x + G * x_old - 2 * y_old)) / (1 + Kint * B + Kint * Kint);
    // In main code, use yp to evaluate integration of final output y
    return yp;
};

// first order differential pole with gain G, time constant T. Total numerator gain is G*T
double DIFFPOLE(double G, double T, double x, double x_old, double y_old, double delt) {
    double y;
    double Kint = (delt * 0.5) / T;

    y = (G * (x - x_old) + (1 - Kint) * y_old) / (1 + Kint);
    return y;
};

// first order leadlag with gain G, lead time constant T1, lag time constant T2, with non-windup internal limits
double LEADLAG(double G, double T1, double T2, double x, double x_old, double y_old, double ymin, double ymax, double delt) {
    double y;
    double Kint = (delt*0.5) / T2;
    if (T1 < 1.0E-8) {
        y = REALPOLE(G, T2, x, x_old, y_old, ymin, ymax, delt);
    } 
    else {
        y = (y_old + (G*T1 / T2)*(x - x_old) + Kint*(G*x + G*x_old - y_old)) / (1.0 + Kint);
        if (y > ymax)  y = ymax;
        if (y < ymin)  y = ymin;
    }
    return y;
};


// ----------------------------------------------------------------
__declspec(dllexport) int32_T __cdecl Model_Outputs(IEEE_Cigre_DLLInterface_Instance* instance) {
    /*   Calculates output equation
       Arguments: Instance specific model structure containing Inputs, Parameters and Outputs
       Return:    Integer status 0 (normal), 1 if messages are written, 2 for errors.  See IEEE_Cigre_DLLInterface_types.h
    */
    ErrorMessage[0] = '\0';

    MyModelParameters* parameters = (MyModelParameters*)instance->Parameters;
    // Retrieve variables from Input, Output and State
    double Vbase = parameters->Vbase;
    double Sbase = parameters->Sbase;
    double Vdcbase = parameters->Vdcbase;
    double KpI = parameters->KpI;
    double KiI = parameters->KiI;
    double wtype = parameters->wtype;
    double KpPLL = parameters->KpPLL;
    double KiPLL = parameters->KiPLL;
    double del_f_limit = parameters->del_f_limit;
    double KpP = parameters->KpP;
    double KiP = parameters->KiP;
    double Qflag = parameters->Qflag;
    double KpQ = parameters->KpQ;
    double KiQ = parameters->KiQ;
    double KpV = parameters->KpV;
    double KiV = parameters->KiV;
    double KpVq = parameters->KpVq;
    double KiVq = parameters->KiVq;
    double Imax = parameters->Imax;
    double Pmax = parameters->Pmax;
    double Pmin = parameters->Pmin;
    double Qmax = parameters->Qmax;
    double Qmin = parameters->Qmin;
    double PQflag = parameters->PQflag;
    double KfDroop = parameters->KfDroop;
    double KvDroop = parameters->KvDroop;
    double K_POD = parameters->K_POD;
    double T_POD = parameters->T_POD;
    double T1_POD = parameters->T1_POD;
    double T2_POD = parameters->T2_POD;
    double POD_min = parameters->POD_min;
    double POD_max = parameters->POD_max;
    double Vdip = parameters->Vdip;
    double Vup = parameters->Vup;
    double KpVdq = parameters->KpVdq;
    double KiVdq = parameters->KiVdq;
    double Tr = parameters->Tr;
    double Rchoke = parameters->Rchoke;
	double Lchoke = parameters->Lchoke;
    double Cfilt = parameters->Cfilt;
    double Rdamp = parameters->Rdamp;
    //
    double delt = Model_Info.FixedStepBaseSampleTime;
    //
    MyModelInputs* inputs = (MyModelInputs*)instance->ExternalInputs;
    double Va = inputs->Va;
    double Vb = inputs->Vb;
    double Vc = inputs->Vc;
    double Ia = inputs->Ia;
    double Ib = inputs->Ib;
    double Ic = inputs->Ic;
    double IaL1 = inputs->IaL1;
    double IbL1 = inputs->IbL1;
    double IcL1 = inputs->IcL1;
    double Pref = inputs->Pref;
	double Qref = inputs->Qref;
    double Vref = inputs->Vref;
    //
	double OldVq = instance->DoubleStates[0];
	double Olddel_omega = instance->DoubleStates[1];
	double Oldphi_IBR = instance->DoubleStates[2];
	double OldIderr = instance->DoubleStates[3];
	double Olductrld = instance->DoubleStates[4];
	double OldIqerr = instance->DoubleStates[5];
	double Olductrlq = instance->DoubleStates[6];
    double OldPerr = instance->DoubleStates[7];
    double OldIdref = instance->DoubleStates[8];
    double OldQerr = instance->DoubleStates[9];
    double OldVerr = instance->DoubleStates[10];
    double OldIqref = instance->DoubleStates[11];
    double OldVd_filter_s1 = instance->DoubleStates[12];
    double OldVd_filter_s2 = instance->DoubleStates[13];
    double OldVd = instance->DoubleStates[14];
    double OldPOD_s1 = instance->DoubleStates[15];
    double OldPOD_s2 = instance->DoubleStates[16];
    double OldVd_err = instance->DoubleStates[17];
    double OldVq_err = instance->DoubleStates[18];
    double OldPelec = instance->DoubleStates[19];
    double OldPelec_meas = instance->DoubleStates[20];
    double OldQelec = instance->DoubleStates[21];
    double OldQelec_meas = instance->DoubleStates[22];
    double Olddel_omega_calc = instance->DoubleStates[23];
    double OldVd_calc = instance->DoubleStates[24];
    double OldVq_filter_s1 = instance->DoubleStates[25];
    double OldVq_filter_s2 = instance->DoubleStates[26];
    double OldVq_calc = instance->DoubleStates[27];
    double OldId_calc = instance->DoubleStates[28];
    double OldId_filter_s1 = instance->DoubleStates[29];
    double OldId_filter_s2 = instance->DoubleStates[30];
    double OldId = instance->DoubleStates[31];
    double OldIq_calc = instance->DoubleStates[32];
    double OldIq_filter_s1 = instance->DoubleStates[33];
    double OldIq_filter_s2 = instance->DoubleStates[34];
    double OldIq = instance->DoubleStates[35];

    MyModelOutputs* outputs = (MyModelOutputs*)instance->ExternalOutputs;
    double Ea = outputs->Ea;
	double Eb = outputs->Eb;
	double Ec = outputs->Ec;
    double Idrefout = outputs->Idrefout;
    double Idout = outputs->Idout;
    double Iqrefout = outputs->Iqrefout;
    double Iqout = outputs->Iqout;
    double Vdout = outputs->Vdout;
    double Vqout = outputs->Vqout;
    double Freqpll = outputs->Freqpll;
    double Pout = outputs->Pout;
    double Qout = outputs->Qout;
    
	// local variables
    double Vpeak;
    double Ibase;
    double Vd, Vq, Vd_err;
    double Vd_calc, Vq_calc;
	double del_omega, omega0, phi_IBR;
    double Id, Iq;
    double Id_calc, Iq_calc;
    double Pref_calc, Qref_calc;
    double Pelec, Qelec, Pelec_meas, Qelec_meas;
    double Perr, Qerr, Verr;
    double Idref, Iqref;
    double Imax_d, Imin_d, Imax_q, Imin_q;
    double IdL1, IqL1;
	double Iderr, Iqerr;
	double uctrld, uctrlq;
	double Ed, Eq;
	double Eabs, Eang, m;
    double Ki_Vfrz;
    double Vd_filter_s1, Vd_filter_s2;
    double Vq_filter_s1, Vq_filter_s2;
    double Id_filter_s1, Id_filter_s2;
    double Iq_filter_s1, Iq_filter_s2;
    double POD_s1, POD_s2;

    double del_omega_calc;
	

    // Begin Code
    Ki_Vfrz = 0.00001;

    // Evaluate V and I base quantities
    Ibase = Sbase / (sqrt(3) * Vbase);
    Vpeak = sqrt(2.0 / 3.0) * Vbase;
	
	// Generate Vd and Vq
    Vd_calc = (2.0 / 3.0) * (((Va / Vpeak) * cos(Oldphi_IBR)) + ((Vb / Vpeak) * cos(Oldphi_IBR - (2 * PI / 3))) + ((Vc / Vpeak) * cos(Oldphi_IBR + (2 * PI / 3))));
    Vq_calc = -1.0 * (2.0 / 3.0) * (((Va / Vpeak) * sin(Oldphi_IBR)) + ((Vb / Vpeak) * sin(Oldphi_IBR - (2 * PI / 3))) + ((Vc / Vpeak) * sin(Oldphi_IBR + (2 * PI / 3))));

    // Filter Vd anv Vq through 3rd order low pass butterworth
    Vd_filter_s1 = REALPOLE(1.0, (1.0 / (2 * PI * 120.0)), Vd_calc, OldVd_calc, OldVd_filter_s1, -99.0, 99.0, delt);
    Vd_filter_s2 = CMPLXPOLE(1.0, (1.0 / (2 * PI * 120.0)), 1.0, Vd_filter_s1, OldVd_filter_s1, OldVd_filter_s2, OldVd, delt);
    Vd = OldVd + (delt * 0.5 * 2 * PI * 120.0) * (Vd_filter_s2 + OldVd_filter_s2);

    Vq_filter_s1 = REALPOLE(1.0, (1.0 / (2 * PI * 120.0)), Vq_calc, OldVq_calc, OldVq_filter_s1, -99.0, 99.0, delt);
    Vq_filter_s2 = CMPLXPOLE(1.0, (1.0 / (2 * PI * 120.0)), 1.0, Vq_filter_s1, OldVq_filter_s1, OldVq_filter_s2, OldVq, delt);
    Vq = OldVq + (delt * 0.5 * 2 * PI * 120.0) * (Vq_filter_s2 + OldVq_filter_s2);
    
    // Generate Id and Iq
    Id_calc = (2.0 / 3.0) * (((Ia / (sqrt(2) * Ibase)) * cos(Oldphi_IBR)) + ((Ib / (sqrt(2) * Ibase)) * cos(Oldphi_IBR - (2 * PI / 3))) + ((Ic / (sqrt(2) * Ibase)) * cos(Oldphi_IBR + (2 * PI / 3))));
    Iq_calc = -1.0 * (2.0 / 3.0) * (((Ia / (sqrt(2) * Ibase)) * sin(Oldphi_IBR)) + ((Ib / (sqrt(2) * Ibase)) * sin(Oldphi_IBR - (2 * PI / 3))) + ((Ic / (sqrt(2) * Ibase)) * sin(Oldphi_IBR + (2 * PI / 3))));

    // Filter Id anv Iq through 3rd order low pass butterworth
    Id_filter_s1 = REALPOLE(1.0, (1.0 / (2 * PI * 120.0)), Id_calc, OldId_calc, OldId_filter_s1, -99.0, 99.0, delt);
    Id_filter_s2 = CMPLXPOLE(1.0, (1.0 / (2 * PI * 120.0)), 1.0, Id_filter_s1, OldId_filter_s1, OldId_filter_s2, OldId, delt);
    Id = OldId + (delt * 0.5 * 2 * PI * 120.0) * (Id_filter_s2 + OldId_filter_s2);

    Iq_filter_s1 = REALPOLE(1.0, (1.0 / (2 * PI * 120.0)), Iq_calc, OldIq_calc, OldIq_filter_s1, -99.0, 99.0, delt);
    Iq_filter_s2 = CMPLXPOLE(1.0, (1.0 / (2 * PI * 120.0)), 1.0, Iq_filter_s1, OldIq_filter_s1, OldIq_filter_s2, OldIq, delt);
    Iq = OldIq + (delt * 0.5 * 2 * PI * 120.0) * (Iq_filter_s2 + OldIq_filter_s2);

    // Evaluate Pelec and Qelec
    Pelec = Vd * Id + Vq * Iq;
    Qelec = -Vd * Iq + Vq * Id;

    omega0 = 2 * PI * 60.0;
	
    if (wtype == 0.0) {
        // PLL loop
        if (Vd < Vdip || Vd > Vup) {
            del_omega = PICONTROLLER(KpPLL, (1.0 / (KiPLL / 2.0)), Vq, OldVq, Olddel_omega, delt);
        }
        else {
            del_omega = PICONTROLLER(KpPLL, (1.0 / KiPLL), Vq, OldVq, Olddel_omega, delt);
        }
    }
    if (wtype == 1.0) {
        // Droop loop
        Pelec_meas = REALPOLE(1.0, Tr, Pelec, OldPelec, OldPelec_meas, -1.0, 1.0, delt);
        Qelec_meas = REALPOLE(1.0, Tr, Qelec, OldQelec, OldQelec_meas, -1.0, 1.0, delt);
        del_omega_calc = (1 / KfDroop)* (Pref / Sbase - Pelec_meas)* omega0;
        del_omega = REALPOLE(1.0, 0.00001, del_omega_calc, Olddel_omega_calc, Olddel_omega, -99.0, 99.0, delt);
    }
	
    if (del_omega > (2 * PI * del_f_limit)) {
        del_omega = (2 * PI * del_f_limit);
    }
    if (del_omega < (-2 * PI * del_f_limit)) {
        del_omega = (-2 * PI * del_f_limit);
    }
	phi_IBR = INTEGRATOR(1.0, (omega0+del_omega), (omega0+Olddel_omega), Oldphi_IBR, delt);

    // Generate IdL1 and IqL1
    IdL1 = (2.0 / 3.0) * (((IaL1 / (sqrt(2) * Ibase)) * cos(phi_IBR)) + ((IbL1 / (sqrt(2) * Ibase)) * cos(phi_IBR - (2 * PI / 3))) + ((IcL1 / (sqrt(2) * Ibase)) * cos(phi_IBR + (2 * PI / 3))));
    IqL1 = -1.0 * (2.0 / 3.0) * (((IaL1 / (sqrt(2) * Ibase)) * sin(phi_IBR)) + ((IbL1 / (sqrt(2) * Ibase)) * sin(phi_IBR - (2 * PI / 3))) + ((IcL1 / (sqrt(2) * Ibase)) * sin(phi_IBR + (2 * PI / 3))));

    if (wtype == 0.0) {
        // 1. Generate current references with PLL control type

        // Power Oscillation Damper
        POD_s1 = DIFFPOLE(K_POD, T_POD, (del_omega / omega0), (Olddel_omega / omega0), OldPOD_s1, delt);
        POD_s2 = LEADLAG(1.0, T1_POD, T2_POD, POD_s1, OldPOD_s1, OldPOD_s2, POD_min, POD_max, delt);

        // Active and reactive power control loop
        Pref_calc = (Pref / Sbase) - KfDroop * del_omega / omega0;
        if (Pref_calc > Pmax) { Pref_calc = Pmax; }
        if (Pref_calc < Pmin) { Pref_calc = Pmin; }
        Perr = Pref_calc - Pelec;

        Qref_calc = (Qref / Sbase);
        if (Qref_calc > Qmax) { Qref_calc = Qmax; }
        if (Qref_calc < Qmin) { Qref_calc = Qmin; }
        Qerr = Qref_calc - Qelec;
        Verr = Vref + Qerr / KvDroop + POD_s2 - sqrt((Vd * Vd) + (Vq * Vq));
        if (Vd < Vdip || Vd > Vup) {
            Idref = PICONTROLLER(KpP, (1.0 / Ki_Vfrz), Perr, OldPerr, OldIdref, delt) - (Vq * Cfilt * (omega0 + del_omega) / omega0) + (Vd / Rdamp);
            if (Qflag == 0) {
                // Q control
                Iqref = (INTEGRATOR((1.0 / Ki_Vfrz), Qerr, OldQerr, OldIqref, delt) + KpQ * Qerr) * -1.0 + (Vd * Cfilt * (omega0 + del_omega) / omega0) + (Vq / Rdamp);
            }
            else {
                // V control
                Iqref = (INTEGRATOR((1.0 / Ki_Vfrz), (Verr + KiVq * Vq), OldVerr, OldIqref, delt) + 2.0*KpV * (Verr + KpVq * Vq)) * -1.0 + (Vd * Cfilt * (omega0 + del_omega) / omega0) + (Vq / Rdamp);
            }
        }
        else {
            Idref = PICONTROLLER(KpP, (1.0 / KiP), Perr, OldPerr, OldIdref, delt) - (Vq * Cfilt * (omega0 + del_omega) / omega0) + (Vd / Rdamp);
            if (Qflag == 0) {
                // Q control
                Iqref = (INTEGRATOR((1.0 / KiQ), Qerr, OldQerr, OldIqref, delt) + KpQ * Qerr) * -1.0 + (Vd * Cfilt * (omega0 + del_omega) / omega0) + (Vq / Rdamp);
            }
            else {
                // V control
                Iqref = (INTEGRATOR((1.0 / KiV), (Verr + KiVq * Vq), OldVerr, OldIqref, delt) + KpV * (Verr + KpVq * Vq)) * -1.0 + (Vd * Cfilt * (omega0 + del_omega) / omega0) + (Vq / Rdamp);
            }
        }
    }
    if (wtype == 1.0) {
        // 2: Generate current references with droop control type
        Vd_err = Vref + ((Qref / Sbase) - Qelec) / KvDroop - Vd;
        Idref = PICONTROLLER(KpVdq, (1.0 / KiVdq), Vd_err, OldVd_err, OldIdref, delt) - (Vq * Cfilt * (omega0 + del_omega) / omega0) + (Vd / Rdamp);
        Iqref = PICONTROLLER(KpVdq, (1.0 / KiVdq), (-1.0 * Vq), OldVq_err, OldIqref, delt) + (Vd * Cfilt * (omega0 + del_omega) / omega0) + (Vq / Rdamp);
    }

    // Apply current limits
    if (PQflag == 0.0) {
        // P priority
        Imax_d = Imax;
        Imin_d = -Imax;
        if (Idref > Imax_d) { Idref = Imax_d; }
        if (Idref < Imin_d) { Idref = Imin_d; }

        Imax_q = sqrt((Imax * Imax) - (Idref * Idref));
        Imin_q = -sqrt((Imax * Imax) - (Idref * Idref));
        if (Iqref > Imax_q) { Iqref = Imax_q; }
        if (Iqref < Imin_q) { Iqref = Imin_q; }
    }
    if (PQflag == 1.0) {
        // Q priority
        Imax_q = Imax;
        Imin_q = -Imax;
        if (Iqref > Imax_q) { Iqref = Imax_q; }
        if (Iqref < Imin_q) { Iqref = Imin_q; }

        Imax_d = sqrt((Imax * Imax) - (Iqref * Iqref));
        Imin_d = -sqrt((Imax * Imax) - (Iqref * Iqref));
        if (Idref > Imax_d) { Idref = Imax_d; }
        if (Idref < Imin_d) { Idref = Imin_d; }
    }
	
	// Current control loop
    Iderr = Idref - IdL1;
    uctrld = PICONTROLLER(KpI, (1.0 / KiI), Iderr, OldIderr, Olductrld, delt);
	Iqerr = Iqref - IqL1;
    uctrlq = PICONTROLLER(KpI, (1.0 / KiI), Iqerr, OldIqerr, Olductrlq, delt);
	
	// Generate Ed and Eq and check modulation index
    Ed = Vd - (IqL1 * Lchoke * 0.5 * (omega0 + del_omega) / omega0) + (IdL1 * Rchoke) + uctrld;
    Eq = Vq + (IdL1 * Lchoke * 0.5 * (omega0 + del_omega) / omega0) + (IqL1 * Rchoke) + uctrlq;
	Eabs = sqrt((Ed*Ed)+(Eq*Eq));
	Eang = atan2(Eq,Ed);
	m = Eabs*2.0*Vpeak/Vdcbase;
	if (m >= 1.15){
		m = 1.15;
	}
	if (m <=0.2){
		m = 0.2;
	}
	Ed = m*cos(Eang);
	Eq = m*sin(Eang);
	
	// Generate output Ea, Eb, Ec
	Ea = (Ed*cos(phi_IBR) - Eq*sin(phi_IBR));
	Eb = (Ed*cos(phi_IBR-(2*PI/3)) - Eq*sin(phi_IBR-(2*PI/3)));
	Ec = (Ed*cos(phi_IBR+(2*PI/3)) - Eq*sin(phi_IBR+(2*PI/3)));

    // Outputs
    outputs->Ea = Ea*Vdcbase/2.0;
	outputs->Eb = Eb*Vdcbase/2.0;
	outputs->Ec = Ec*Vdcbase/2.0;
    outputs->Idrefout = Idref;
    outputs->Idout = IdL1;
    outputs->Iqrefout = Iqref;
    outputs->Iqout = IqL1;
    outputs->Vdout = Vd;
    outputs->Vqout = Vq;
    outputs->Freqpll = (omega0 + del_omega) / (2 * PI);
    outputs->Pout = Pelec * Sbase;
    outputs->Qout = Qelec * Sbase;
    // save state variables
    instance->DoubleStates[0] = Vq;
    instance->DoubleStates[1] = del_omega;
    instance->DoubleStates[2] = phi_IBR;
	instance->DoubleStates[3] = Iderr;
    instance->DoubleStates[4] = uctrld;
    instance->DoubleStates[5] = Iqerr;
    instance->DoubleStates[6] = uctrlq;
    if (wtype == 0.0) {
        instance->DoubleStates[7] = Perr;
        instance->DoubleStates[9] = Qerr;
        instance->DoubleStates[10] = Verr + KiVq * Vq;
        if (Qflag == 0) {
            instance->DoubleStates[11] = (Iqref - (Vd * Cfilt * (omega0 + del_omega) / omega0) - (Vq / Rdamp)) * -1.0 - KpQ * Qerr;
        }
        else {
            if (Vd < Vdip || Vd > Vup) {
                instance->DoubleStates[11] = (Iqref - (Vd * Cfilt * (omega0 + del_omega) / omega0) - (Vq / Rdamp)) * -1.0 - 2.0 * KpV * (Verr + KpVq * Vq);
            }
            else {
                instance->DoubleStates[11] = (Iqref - (Vd * Cfilt * (omega0 + del_omega) / omega0) - (Vq / Rdamp)) * -1.0 - KpV * (Verr + KpVq * Vq);
            }
        }
        instance->DoubleStates[15] = POD_s1;
        instance->DoubleStates[16] = POD_s2;
        instance->DoubleStates[17] = 0.0;
        instance->DoubleStates[19] = 0.0;
        instance->DoubleStates[20] = 0.0;
        instance->DoubleStates[21] = 0.0;
        instance->DoubleStates[22] = 0.0;
        instance->DoubleStates[23] = 0.0;
    }
    else {
        instance->DoubleStates[7] = 0.0;
        instance->DoubleStates[9] = 0.0;
        instance->DoubleStates[10] = 0.0;
        instance->DoubleStates[11] = Iqref - (Vd * Cfilt * (omega0 + del_omega) / omega0) - (Vq / Rdamp);
        instance->DoubleStates[15] = 0.0;
        instance->DoubleStates[16] = 0.0;
        instance->DoubleStates[17] = Vd_err;
        instance->DoubleStates[19] = Pelec;
        instance->DoubleStates[20] = Pelec_meas;
        instance->DoubleStates[21] = Qelec;
        instance->DoubleStates[22] = Qelec_meas;
        instance->DoubleStates[23] = del_omega_calc;
        
    }
    instance->DoubleStates[8] = Idref + (Vq * Cfilt * (omega0 + del_omega) / omega0) - (Vd / Rdamp);
    instance->DoubleStates[12] = Vd_filter_s1;
    instance->DoubleStates[13] = Vd_filter_s2;
    instance->DoubleStates[14] = Vd;
    instance->DoubleStates[18] = -1.0 * Vq;
    instance->DoubleStates[24] = Vd_calc;
    instance->DoubleStates[25] = Vq_filter_s1;
    instance->DoubleStates[26] = Vq_filter_s2;
    instance->DoubleStates[27] = Vq_calc;
    instance->DoubleStates[28] = Id_calc;
    instance->DoubleStates[29] = Id_filter_s1;
    instance->DoubleStates[30] = Id_filter_s2;
    instance->DoubleStates[31] = Id;
    instance->DoubleStates[32] = Iq_calc;
    instance->DoubleStates[33] = Iq_filter_s1;
    instance->DoubleStates[34] = Iq_filter_s2;
    instance->DoubleStates[35] = Iq;
    instance->LastGeneralMessage = ErrorMessage;
    return IEEE_Cigre_DLLInterface_Return_OK;
};

// ----------------------------------------------------------------
__declspec(dllexport) int32_T __cdecl Model_Terminate(IEEE_Cigre_DLLInterface_Instance* instance) {
    /*   Destroys any objects allocated by the model code - not used
    */

    return IEEE_Cigre_DLLInterface_Return_OK;
};
// ----------------------------------------------------------------
__declspec(dllexport) int32_T __cdecl Model_PrintInfo() {
    /* Prints Model Information once
    */
    int Printed = 0;
    if (!Printed) {
        printf("Cigre/IEEE DLL Standard\n");
        printf("Model name:             %s\n", Model_Info.ModelName);
        printf("Model version:          %s\n", Model_Info.ModelVersion);
        printf("Model description:      %s\n", Model_Info.ModelDescription);
        printf("Model general info:     %s\n", Model_Info.GeneralInformation);
        printf("Model created on:       %s\n", Model_Info.ModelCreated);
        printf("Model created by:       %s\n", Model_Info.ModelCreator);
        printf("Model last modified:    %s\n", Model_Info.ModelLastModifiedDate);
        printf("Model last modified by: %s\n", Model_Info.ModelLastModifiedBy);
        printf("Model modified comment: %s\n", Model_Info.ModelModifiedComment);
        printf("Model modified history: %s\n", Model_Info.ModelModifiedHistory);
        printf("Time Step Sampling Time (sec): %0.5g\n", Model_Info.FixedStepBaseSampleTime);
        switch (Model_Info.EMT_RMS_Mode) {
            case 1:
                printf("EMT/RMS mode:           EMT\n");
                break;
            case 2:
                printf("EMT/RMS mode:           RMS\n");
                break;
            case 3:
                printf("EMT/RMS mode:           EMT and RMS\n");
                break;
            default:
                printf("EMT/RMS mode:           <not available>\n");
        }
        printf("Number of inputs:       %d\n", Model_Info.NumInputPorts);
        printf("Input description:\n");
        for (int k = 0; k < Model_Info.NumInputPorts; k++) {
            printf("  %s\n", Model_Info.InputPortsInfo[k].Name);
        }
        printf("Number of outputs:      %d\n", Model_Info.NumOutputPorts);
        printf("Output description:\n");
        for (int k = 0; k < Model_Info.NumOutputPorts; k++) {
            printf("  %s\n", Model_Info.OutputPortsInfo[k].Name);
        }
        
        printf("Number of parameters:   %d\n", Model_Info.NumParameters);
        printf("Parameter description:");
        for (int k = 0; k < Model_Info.NumParameters; k++) {
            printf("  %s\n", Model_Info.ParametersInfo[k].Name);
        }

        printf("Number of int    state variables:   %d\n", Model_Info.NumIntStates);
        printf("Number of float  state variables:   %d\n", Model_Info.NumFloatStates);
        printf("Number of double state variables:   %d\n", Model_Info.NumDoubleStates);
        printf("\n");
        fflush(stdout);
    }
    Printed = 1;

    return IEEE_Cigre_DLLInterface_Return_OK;
};
