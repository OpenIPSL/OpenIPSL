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
        .Name = "Pref",                                         // Input Signal name
        .Description = "Active power reference ",               // Description
        .Unit = "MW",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    },
    [7] = {
        .Name = "Qref",                                         // Input Signal name
        .Description = "Reactive power reference",              // Description
        .Unit = "Mvar",                                         // Units
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
    .ModelName = "GFM-PR-CON",                               // Model name
    .ModelVersion = "1.0.0.0",                                          // Model version
    .ModelDescription = "GFM-PR-CON",                              // Model description
    .GeneralInformation = "General Information",                        // General information
    .ModelCreated = "January 27, 2021",                                 // Model created on
    .ModelCreator = "Deepak Ramasubramanian",                           // Model created by
    .ModelLastModifiedDate = "January 6, 2025",                        // Model last modified on
    .ModelLastModifiedBy = "Hao Chang",                    // Model last modified by
    .ModelModifiedComment = "Changed to using PR controller",// Model modified comment
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
    instance->DoubleStates[8] = Pout / Sbase;
    instance->DoubleStates[9] = 0.0;
    instance->DoubleStates[10] = 0.0;
    instance->DoubleStates[11] = -Qout / Sbase;
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