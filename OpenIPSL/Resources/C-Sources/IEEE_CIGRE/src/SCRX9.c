/*
Provenance and licence (block added for OpenIPSL, 2026-10-25; origin corrected 2026-10-28)
-------------------------------------------------------------------------------------------
File: OpenIPSL/Resources/C-Sources/IEEE_CIGRE/src/SCRX9.c

Origin: the "SCRX9" example model of the IEEE/CIGRE DLL Modeling Standard, API V2 (DLLInterfaceVersion
1.1.0.0), written by Garth D. Irwin (Electranix), September 14, 2021 (original header comment below,
unchanged). The original is the file "Static Exciter Model/SCRX9.c" in the folder DLL_V1_1 of the example code
distributed by CIGRE JWG B4.82 (file date 2022-02-14, 27298 bytes, SHA-256
f4515d7ddb22aa27e177b42a579826645e497707bb34fc0a5b57472af8d219c4). CIGRE Technical Brochure 958, Appendix E
"Example Model Source Code (Synchronous Machine Exciter SCRX)" prints another revision of the same model, with
the same control code: it adds, at the end of Model_CheckParameters, Model_Initialize and Model_Outputs, tests of
instance->LastErrorMessage[0] and instance->LastGeneralMessage[0] that return the Error or Message code, and
empty Model_FirstCall and Model_Iterate entry points. This file follows the B4.82 revision. TB 958: CIGRE JWG
B4.82/IEEE, "Guidelines for use of real-code in EMT models for HVDC, FACTs and inverter based generators in
power systems analysis," Technical Brochure 958, Paris, 2025.
It reached OpenIPSL through pull request #362 by Hao Chang (head 3c15968f, file
OpenIPSL/Resources/Library/IEEE_CIGRE_SRC/src/SCRX9.c), where it was integrated in Modelica tools for:
  H. Chang and L. Vanfretti, "Integrating the IEEE/CIGRE DLL Modeling Standard to Use 'Real Code' Models for
  Power System Analysis in Modelica Tools," Proceedings of the American Modelica Conference 2024, October
  14-16, 2024, Storrs, Connecticut, USA. DOI: 10.3384/ecp20772
See also:
  H. Chang and L. Vanfretti, "EMT Modelling and Simulation of Grid Following Converters in Modelica Integrating
  the IEEE/CIGRE 'Real Code'/DLL Modelling Guidelines," CIGRE Paris Session 2026, paper C4-10724, Paris,
  France, August 2026.

Licence: example code of the standard, distributed by CIGRE JWG B4.82 and printed (in the revision described
above) in TB 958 Appendix E; copyright stays with its author and with CIGRE/IEEE as publishers of the standard.
It is not covered by the OpenIPSL licence.

Differences from the B4.82 original (compared on 2026-10-28 with diff --strip-trailing-cr -w):
 a. Made in PR #362 and kept: sprintf_s replaced by snprintf in the five messages (two in
    Model_CheckParameters, three in Model_Initialize), with the same text and buffer size; sprintf_s is only
    provided by MSVC. The messages and the behaviour are unchanged. Also made in PR #362: LF line endings.
 b. Made here: changes 2 and 3 below.
There are no other differences: the control code equals the original.

Modified for OpenIPSL (2026-10-25) against the copy of PR #362, and only as listed here:
 1. Deleted the Modelica glue and test scaffolding of PR #362 (old lines 554-639: my_sum, init_test_rec,
    init_scrx_model, deinit_scrx_model, update_scrx_input, model_calculate, init_efd). OpenIPSL drives the
    model through the standard entry points from oipsl_cigre_adapter.c, compiled into the same library.
 2. Removed #include <windows.h> (old line 39); nothing in the model uses it. No other include had to be
    added: after step 1 the file calls no malloc, free or memset.
 3. Replaced "__declspec(dllexport) <type> __cdecl" by "IEEE_CIGRE_EXPORT <type> IEEE_CIGRE_CALL" on the six
    entry points Model_GetInfo, Model_CheckParameters, Model_Initialize, Model_Outputs, Model_Terminate and
    Model_PrintInfo (macros defined in ieee_cigre_export.h, included after IEEE_Cigre_DLLInterface.h: export
    on Windows and Linux, __cdecl on Windows only, in the original positions), and made ErrorMessage,
    InputSignals, OutputSignals, Parameters, Model_Info, REALPOLE and LEADLAG static, so that only the entry
    points are exported (Model_Info stays reachable through Model_GetInfo).
 4. Added this comment block.
The control logic, the signal, parameter and state definitions, the Model_Info constants and the original
comments below are unchanged.
*/
/*
This is an example of a power system model written in C, according to the IEEE/Cigre DLL Modeling Standard (API V2).

This SCRX9 model is an SCRX type sychrounous machine exciter - it will output a machine field voltage in order to control
the machine AC voltage to a reference set-point.

This model has:
- 7 inputs:
   - VRef   (pu - Reference voltage)
   - Ec     (pu - Measured voltage)
   - Vs     (pu - Stabilizer signal)
   - IFD    (pu - Field current)
   - VT     (pu - Generator terminal voltage)
   - VUEL   (pu - Under excitation limit)
   - VOEL   (pu - Over  excitation limit)
- 1 output:
   - EFD    (pu, Output machine field voltage)
- 8 parameters:
   - TAdTB  (Ratio of leadlag TA divided by TB smoothing time constants)
   - TB     (sec - Denominator of leadlag smoothing time constant)
   - K      (pu  - Controller gain)
   - TE     (sec - Controller time constant)
   - EMin   (pu  - Minimum field voltage)
   - EMax   (pu  - Maximum field voltage)
   - CSwitch(Power source: 0=VT bus-fed gen terminal voltage , 1=1.0 independant supply)
   - RCdRFD (Ratio of field discharge resistance to field winding resistance)

This model will be compiled into a DLL, and then can be used in ANY power system
simulation program by running the "DLLImport" tool that comes with each program.

The IEEE/Cigre DLL standard is based on concepts from the IEC 61400-27-1 DLL standard, with changes:
- in how state variables are allocated
- added support for different variable types
- general changes so all variables and documentation are independant of any specific simulation tool
- focus on fixed time step controllers (as are used in real-code firmware in the field)

September 14, 2021, GDI
*/
#include <stdio.h>

#include "IEEE_Cigre_DLLInterface.h"
#include "ieee_cigre_export.h"

static char ErrorMessage[1000];

// ----------------------------------------------------------------------
// Structures defining inputs, outputs, parameters and program structure
// to be called by the DLLImport Tool
// ----------------------------------------------------------------------

typedef struct _MyModelInputs {
    real64_T VRef;
    real64_T Ec;
    real64_T Vs;
    real64_T IFD;
    real64_T VT;
    real64_T VUEL;
    real64_T VOEL;
} MyModelInputs;

// Define Input Signals
static IEEE_Cigre_DLLInterface_Signal InputSignals[] = {
    [0] = {
        .Name = "VRef",                                         // Input Signal name
        .Description = "Reference voltage",                     // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    },
    [1] = {
        .Name = "Ec",                                           // Input Signal name
        .Description = "Measured voltage",                      // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    },
    [2] = {
        .Name = "Vs",                                           // Input Signal name
        .Description = "Stabilizer signal",                     // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    },

    [3] = {
        .Name = "IFD",                                          // Input Signal name
        .Description = "Field Current",                         // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    },
    [4] = {
        .Name = "VT",                                           // Input Signal name
        .Description = "Terminal voltage",                      // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    },
    [5] = {
        .Name = "VUEL",                                         // Input Signal name
        .Description = "Under excitation limit",                // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    },
    [6] = {
        .Name = "VOEL",                                         // Input Signal name
        .Description = "Over excitation limit",                 // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Signal Dimension
    }
};

typedef struct _MyModelOutputs {
    real64_T EFD;
} MyModelOutputs;

// Define Output Signals
static IEEE_Cigre_DLLInterface_Signal OutputSignals[] = {    
    [0] = {
        .Name = "EFD",                                          // Output machine field voltage
        .Description = "Output Field Voltage",                  // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .Width = 1                                              // Array Dimension
    }
};


typedef struct _MyModelParameters {
    real64_T TAdTB;
    real64_T TB;
    real64_T K;
    real64_T TE;
    real64_T EMin;
    real64_T EMax;
    int32_T  CSwitch;
    real64_T RCdRFD;
} MyModelParameters;

// Define Parameters
static IEEE_Cigre_DLLInterface_Parameter Parameters[] = {
    [0] = {
        .Name = "TAdTB",                                        // Parameter Names
        .Description = "Smoothing Time Constant",               // Description
        .Unit = "sec",                                          // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.1,                         // Default value
        .MinValue.Real64_Val = 0.001,                           // Minimum value
        .MaxValue.Real64_Val = 100.0                            // Maximum value
    },
    [1] = {
        .Name = "TB",                                           // Parameter Names
        .Description = "Smoothing Time Constant",               // Description
        .Unit = "sec",                                          // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 10.0,                        // Default value
        .MinValue.Real64_Val = 0.001,                           // Minimum value
        .MaxValue.Real64_Val = 100.0                            // Maximum value
    },    
    [2] = {
        .Name = "K",                                            // Parameter Names
        .Description = "Gain",                                  // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 100.0,                       // Default value
        .MinValue.Real64_Val = 0.001,                           // Minimum value
        .MaxValue.Real64_Val = 1000.0                           // Maximum value
    },
    [3] = {
        .Name = "TE",                                           // Parameter Names
        .Description = "Time Constant",                         // Description
        .Unit = "sec",                                          // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 0.05,                        // Default value
        .MinValue.Real64_Val = 0.001,                           // Minimum value
        .MaxValue.Real64_Val = 100.0                            // Maximum value
    },
    [4] = {
        .Name = "EMin",                                         // Parameter Names
        .Description = "Min Field Voltage",                     // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = -5.0,                        // Default value
        .MinValue.Real64_Val = -100.0,                          // Minimum value
        .MaxValue.Real64_Val = -1.0                             // Maximum value
    },
    [5] = {
        .Name = "EMax",                                         // Parameter Names
        .Description = "Max Field Voltage",                     // Description
        .Unit = "pu",                                           // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 5.0,                         // Default value
        .MinValue.Real64_Val = 1.0,                             // Minimum value
        .MaxValue.Real64_Val = 100.0                            // Maximum value
    },
    [6] = {
        .Name = "CSwitch",                                      // Parameter Names
        .Description = "Power source: 0=VT, 1=1.0",             // Description
        .Unit = "",                                             // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_int32_T,   // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Int32_Val = 1,                            // Default value
        .MinValue.Int32_Val = 0,                                // Minimum value
        .MaxValue.Int32_Val = 1                                 // Maximum value
    },
    [7] = {
        .Name = "RCdRFD",                                       // Parameter Names
        .Description = "Field resistance ratio",                // Description
        .Unit = "",                                             // Units
        .DataType = IEEE_Cigre_DLLInterface_DataType_real64_T,  // Signal Type
        .FixedValue = 0,                                        // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at T0 but cannot be changed.
        .DefaultValue.Real64_Val = 10.0,                        // Default value
        .MinValue.Real64_Val = 0.001,                           // Minimum value
        .MaxValue.Real64_Val = 100.0                            // Maximum value
    }
};



static IEEE_Cigre_DLLInterface_Model_Info Model_Info = {
    .DLLInterfaceVersion = { 1, 1, 0, 0 },                              // Release number of the API used during code generation
    .ModelName = "SCRX9",                                               // Model name
    .ModelVersion = "1.1.0.0",                                          // Model version
    .ModelDescription = "SCRX9 - Bus fed or Solid Fed Static Exciter",  // Model description
    .GeneralInformation = "General Information",                        // General information
    .ModelCreated = "September 14, 2021",                               // Model created on
    .ModelCreator = "gdi",                                              // Model created by
    .ModelLastModifiedDate = "September 14, 2021",                      // Model last modified on
    .ModelLastModifiedBy = "gdi",                                       // Model last modified by
    .ModelModifiedComment = "Version 1.1.0.0 for IEEE/Cigre DLL API V2",// Model modified comment
    .ModelModifiedHistory = "History of Changes: V1.0.0.0 Initial model for API V1; V1.1.0.0 for API V2",     // Model modified history
    .FixedStepBaseSampleTime = 0.005,                                   // Time Step sampling time (sec)

    // Inputs
    .NumInputPorts = 7,                                                 // Number of Input Signals
    .InputPortsInfo = InputSignals,                                     // Inputs structure defined above

    // Outputs
    .NumOutputPorts = 1,                                                // Number of Output Signals
    .OutputPortsInfo = OutputSignals,                                   // Outputs structure defined above

    // Parameters
    .NumParameters = 8,                                                 // Number of Parameters
    .ParametersInfo = Parameters,                                       // Parameters structure defined above

    // Number of State Variables
    .NumIntStates = 0,                                                  // Number of Integer states
    .NumFloatStates = 0,                                                // Number of Float states
    .NumDoubleStates = 6                                                // Number of Double states
};

// ----------------------------------------------------------------
// Subroutines that can be called by the main power system program
// ----------------------------------------------------------------
IEEE_CIGRE_EXPORT const IEEE_Cigre_DLLInterface_Model_Info* IEEE_CIGRE_CALL Model_GetInfo() {
    /* Returns Model Information
    */
    return &Model_Info;
};

// ----------------------------------------------------------------
IEEE_CIGRE_EXPORT int32_T IEEE_CIGRE_CALL Model_CheckParameters(IEEE_Cigre_DLLInterface_Instance* instance) {
    /*   Checks the parameters on the given range
       Arguments: Instance specific model structure containing Inputs, Parameters and Outputs
       Return:    Integer status 0 (normal), 1 if messages are written, 2 for errors.  See IEEE_Cigre_DLLInterface_types.h
    */
    // Parameter checks done by the program
    // Note - standard min/max checks should be done by the higher level GUI/Program
    MyModelParameters* parameters = (MyModelParameters*)instance->Parameters;

    double TAdTB = parameters->TAdTB;
    double TB = parameters->TB;
    double K = parameters->K;
    double TE = parameters->TE;
    double EMin = parameters->EMin;
    double EMax = parameters->EMax;
    int CSwitch = parameters->CSwitch;
    double RCdRFD = parameters->RCdRFD;
    //
    double delt = Model_Info.FixedStepBaseSampleTime;

    ErrorMessage[0] = '\0';
    if (TE < 2.0*delt) {
        // write error message
        snprintf(ErrorMessage, sizeof(ErrorMessage), "SCRX9 Error - Parameter TE is: %f, but has been reset to be 2 times the time step: %f .\n", TE, delt);
        parameters->TE = 2.0*delt;
    }
    if (TB < 2.0*delt) {
        // write error message
        snprintf(ErrorMessage, sizeof(ErrorMessage), "SCRX9 Error - Parameter TB is: %f, but has been reset to be 2 times the time step: %f .\n", TB, delt);
        parameters->TB = 2.0*delt;
    }
    instance->LastGeneralMessage = ErrorMessage;
    return IEEE_Cigre_DLLInterface_Return_OK;
};

// ----------------------------------------------------------------
IEEE_CIGRE_EXPORT int32_T IEEE_CIGRE_CALL Model_Initialize(IEEE_Cigre_DLLInterface_Instance* instance) {
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
    // local variables
    double OControl;
    double OLeadLag;
    double Verr;
    double VOffset;
    // Retrieve variables from Input, Output and State
    double TAdTB = parameters->TAdTB;
    double TB = parameters->TB;
    double K = parameters->K;
    double TE = parameters->TE;
    double EMin = parameters->EMin;
    double EMax = parameters->EMax;
    int CSwitch = parameters->CSwitch;
    double RCdRFD = parameters->RCdRFD;
    //
    double delt = Model_Info.FixedStepBaseSampleTime;
    //
    MyModelInputs* inputs = (MyModelInputs*)instance->ExternalInputs;
    double VRef = inputs->VRef;
    double Ec = inputs->Ec;
    double Vs = inputs->Vs;
    double IFD = inputs->IFD;
    double VT = inputs->VT;
    double VUEL = inputs->VUEL;
    double VOEL = inputs->VOEL;

    // Working back from initial output
    MyModelOutputs* outputs = (MyModelOutputs*)instance->ExternalOutputs;
    double EFD = outputs->EFD;
    ErrorMessage[0] = '\0';
    // test if  initial conditions use negative field logic
    if (IFD < 0.0) {
        snprintf(ErrorMessage, sizeof(ErrorMessage), "SCRX9 Warning - initial field current: %f is negative.\n", IFD);
    }

    // check if bus-fed or independent supply
    if (CSwitch == 1) {
        OControl = EFD;
    } else {
        OControl = EFD / VT;
    }
    // test EFD initial condition is on a EMax or EMin limit
    if (OControl < EMin) {
        snprintf(ErrorMessage, sizeof(ErrorMessage), "SCRX9 Warning - initial field voltage is %f and is < EMin: %f.\n", OControl, EMin);
        OControl = EMin;
    }
    if (OControl > EMax) {
        snprintf(ErrorMessage, sizeof(ErrorMessage), "SCRX9 Warning - initial field voltage is %f and is > EMax: %f.\n", OControl, EMax);
        OControl = EMax;
    }
    OLeadLag = OControl / K;
    Verr = OLeadLag;
    VOffset = Verr;

    // save state variables
    instance->DoubleStates[0] = OLeadLag;
    instance->DoubleStates[1] = Verr;
    instance->DoubleStates[2] = OControl;
    instance->DoubleStates[3] = VOffset;  // offset needed to add to input voltage summation loop (constant)
    instance->DoubleStates[4] = OControl;
    instance->DoubleStates[5] = OLeadLag*(1.0 - TAdTB);
    instance->LastGeneralMessage = ErrorMessage;
    return IEEE_Cigre_DLLInterface_Return_OK;
};

// first order lag with gain G, time constant T, with non-windup internal limits
static double REALPOLE(double G, double T, double x, double x_old, double y_old, double ymin, double ymax, double delt) {
    double y;
    double Kint = (delt*0.5) / T;

    y = (y_old + Kint*(G*x + G*x_old - y_old)) / (1.0 + Kint);
    if (y > ymax)  y = ymax;
    if (y < ymin)  y = ymin;
    return y;
};


// first order leadlag with gain G, lead time constant T1, lag time constant T2, with non-windup internal limits
static double LEADLAG(double G, double T1, double T2, double x, double x_old, double y_old, double ymin, double ymax, double delt) {
    double y;
    double Kint = (delt*0.5) / T2;
    if (T1 < 1.0E-8) {
        y = REALPOLE(G, T2, x, x_old, y_old, ymin, ymax, delt);
    } else {
        y = (y_old + (G*T1 / T2)*(x - x_old) + Kint*(G*x + G*x_old - y_old)) / (1.0 + Kint);
        if (y > ymax)  y = ymax;
        if (y < ymin)  y = ymin;
    }
    return y;
};


// ----------------------------------------------------------------
IEEE_CIGRE_EXPORT int32_T IEEE_CIGRE_CALL Model_Outputs(IEEE_Cigre_DLLInterface_Instance* instance) {
    /*   Calculates output equation
       Arguments: Instance specific model structure containing Inputs, Parameters and Outputs
       Return:    Integer status 0 (normal), 1 if messages are written, 2 for errors.  See IEEE_Cigre_DLLInterface_types.h
    */
    ErrorMessage[0] = '\0';

    MyModelParameters* parameters = (MyModelParameters*)instance->Parameters;
    // Retrieve variables from Input, Output and State
    double TAdTB = parameters->TAdTB;
    double TB = parameters->TB;
    double K = parameters->K;
    double TE = parameters->TE;
    double EMin = parameters->EMin;
    double EMax = parameters->EMax;
    int CSwitch = parameters->CSwitch;
    double RCdRFD = parameters->RCdRFD;
    //
    double delt = Model_Info.FixedStepBaseSampleTime;
    //
    MyModelInputs* inputs = (MyModelInputs*)instance->ExternalInputs;
    double VRef = inputs->VRef;
    double Ec = inputs->Ec;
    double Vs = inputs->Vs;
    double IFD = inputs->IFD;
    double VT = inputs->VT;
    double VUEL = inputs->VUEL;
    double VOEL = inputs->VOEL;
    //
    double OldOLeadlag = instance->DoubleStates[0];
    double OldVerr = instance->DoubleStates[1];
    double OldOControl = instance->DoubleStates[2];
    // offset needed to add to input voltage summation loop (constant)
    double VOffset = instance->DoubleStates[3];
    double S_OControl = instance->DoubleStates[4];
    double S_OLeadLag = instance->DoubleStates[5];

    MyModelOutputs* outputs = (MyModelOutputs*)instance->ExternalOutputs;
    double EFD = outputs->EFD;
    // local variables
    double Verr;
    double OLeadlag;
    double OControl;
    double OControl2;

    // Code:
    // Voltage summation loop (including initial offset from initial conditions - needed due to proportional gain control)
    Verr = VRef - Ec + Vs + VUEL + VOEL + VOffset;
    // Leadlag with no limits
    OLeadlag = LEADLAG(1.0, (TAdTB*TB), TB, Verr, OldVerr, OldOLeadlag, -1.0E10, 1.0E10, delt);
    // Real pole with limits
    OControl = REALPOLE(K, TE, OLeadlag, OldOLeadlag, OldOControl, EMin, EMax, delt);
    if (CSwitch == 1) {
        OControl2 = OControl;
    } else {
        OControl2 = OControl * VT;
    }
    // negative current logic
    if ((IFD < 0.0) && (RCdRFD > 1.0E-8)) {
        EFD = -1.0 * IFD * RCdRFD;
    } else {
        EFD = OControl2;
    }
    // hack - should final EFD be limited to EMin/EMax?

    // Outputs
    outputs->EFD = EFD;
    // save state variables
    instance->DoubleStates[0] = OLeadlag;
    instance->DoubleStates[1] = Verr;
    instance->DoubleStates[2] = OControl;
    // Note:   IN->DoubleStates[3] is VERR and is the constant Offset - do not update this (as it is set in Initialize)
    instance->DoubleStates[4] = S_OControl;
    instance->DoubleStates[5] = S_OLeadLag;
    instance->LastGeneralMessage = ErrorMessage;
    return IEEE_Cigre_DLLInterface_Return_OK;
};

// ----------------------------------------------------------------
IEEE_CIGRE_EXPORT int32_T IEEE_CIGRE_CALL Model_Terminate(IEEE_Cigre_DLLInterface_Instance* instance) {
    /*   Destroys any objects allocated by the model code - not used
    */

    return IEEE_Cigre_DLLInterface_Return_OK;
};
// ----------------------------------------------------------------
IEEE_CIGRE_EXPORT int32_T IEEE_CIGRE_CALL Model_PrintInfo() {
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
