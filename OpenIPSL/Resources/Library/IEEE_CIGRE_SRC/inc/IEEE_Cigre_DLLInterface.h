/*
File: IEEE_Cigre_DLLInterface.h

This is C header file for power system models written according to the IEEE/Cigre DLL Modeling Standard, API Version 2.
This version 2 of the API uses structures for all inputs, outputs and parameters, which allows other data types (whereas
V1 of the API only allowed Double variable types).

The IEEE/Cigre DLL standard is based highly on the IEC 61400-27-1 DLL standard, with minor changes:
- in how state variables are allocated
- added support for different variable types
- general changes so all variables and documentation are independant of any specific simulation tool
- focus on fixed time step controllers (as are used in real-code firmware in the field)

A model written according to the DLL standard, can then  be used in ANY power system
simulation program by running the "DLLImport" tool that comes with each program.

*/
#ifndef __IEEE_Cigre_DLLInterface__
#define __IEEE_Cigre_DLLInterface__

// Use standard data types
#include "IEEE_Cigre_DLLInterface_types.h"


// Input/Output have the same signal structure
typedef struct _IEEE_Cigre_DLLInterface_Signal
{
    const char_T * const                        Name;           // Input/Output signal name (must be valid C variable name syntax)
    const char_T * const                        Description;    // Signal Description
    const char_T * const                        Unit;           // Units text
    const enum IEEE_Cigre_DLLInterface_DataType DataType;       // Signal data type
    const int32_T                               Width;          // Signal array dimension
} IEEE_Cigre_DLLInterface_Signal;

union DefaultValueU {
    const char_T            Char_Val;
    const char_T * const    Char_Ptr;
    const int8_T            Int8_Val;
    const uint8_T           Uint8_Val;
    const int16_T           Int16_Val;
    const uint16_T          Uint16_Val;
    const  int32_T           Int32_Val;
    const uint32_T          Uint32_Val;
    const real32_T          Real32_Val;
    const real64_T          Real64_Val;
};

union MinMaxValueU {
    const char_T            Char_Val;
    const int8_T            Int8_Val;
    const uint8_T           Uint8_Val;
    const int16_T           Int16_Val;
    const uint16_T          Uint16_Val;
    const int32_T           Int32_Val;
    const uint32_T          Uint32_Val;
    const real32_T          Real32_Val;
    const real64_T          Real64_Val;
};


// Static parameter information; only scalar parameters are allowed.
// The one exception is a char pointer type is handled as a pointer to a null-terminated C-style string.
// Strings have a default value, but do not have a minimum or maximum value
typedef struct _IEEE_Cigre_DLLInterface_Parameter
{
    const char_T * const                        Name;           // Parameter name (must be valid C variable name syntax)
    const char_T * const                        GroupName;      // Parameter grouping field
    const char_T * const                        Description;    // Description
    const char_T * const                        Unit;           // Unit
    const enum IEEE_Cigre_DLLInterface_DataType DataType;       // parameter data type
    const int32_T                               FixedValue;     // 0 for parameters which can be modified at any time, 1 for parameters which need to be defined at Time=0.0 but cannot be changed.
    union DefaultValueU DefaultValue;
    union MinMaxValueU  MinValue;
    union MinMaxValueU  MaxValue;
} IEEE_Cigre_DLLInterface_Parameter;


// Static (not instance specific) model information
typedef struct _IEEE_Cigre_DLLInterface_Model_Info
{
    const uint8_T                                   DLLInterfaceVersion[4];   // DLL Standard version number (Version 1.1.0.0 release)
    const char_T * const                            ModelName;                // Model name
    const char_T * const                            ModelVersion;             // Model version
    const char_T * const                            ModelDescription;         // Model description
    const char_T * const                            GeneralInformation;       // General info
    const char_T * const                            ModelCreated;             // Model created on
    const char_T * const                            ModelCreator;             // Model created by
    const char_T * const                            ModelLastModifiedDate;    // Model last modified on
    const char_T * const                            ModelLastModifiedBy;      // Model last modified by
    const char_T * const                            ModelModifiedComment;     // Model modified comment
    const char_T * const                            ModelModifiedHistory;     // Model modified history
    const real64_T                                  FixedStepBaseSampleTime;  // Base sample time (seconds)
    const uint8_T                                   EMT_RMS_Mode;             // Mode: EMT = 1, RMS = 2, EMT & RMS = 3, otherwise: 0

    // Input/Output/Parameter structures
    const int32_T                                   NumInputPorts;            // Number of inputs
    const IEEE_Cigre_DLLInterface_Signal * const    InputPortsInfo;           // Pointer to input signal description array
    const int32_T                                   NumOutputPorts;           // Number of outputs
    const IEEE_Cigre_DLLInterface_Signal * const    OutputPortsInfo;          // Pointer to output signal description array
    const int32_T                                   NumParameters;            // Number of parameters
    const IEEE_Cigre_DLLInterface_Parameter * const ParametersInfo;           // Pointer to parameter description array

    // Number of State Variables
    const int32_T                                   NumIntStates;             // Number of Integer states
    const int32_T                                   NumFloatStates;           // Number of Float states
    const int32_T                                   NumDoubleStates;          // Number of Double states
} IEEE_Cigre_DLLInterface_Model_Info;

// Instance specific model information
typedef struct _IEEE_Cigre_DLLInterface_Instance
{
    void *          ExternalInputs;         // Input signals array
    void *          ExternalOutputs;        // Output signals array
    void *          Parameters;             // Parameters array
    real64_T        Time;                   // Current simulation time
    const uint8_T   SimTool_EMT_RMS_Mode;   // Mode: EMT = 1, RMS = 2
    const char_T *  LastErrorMessage;       // Error string pointer
    const char_T *  LastGeneralMessage;     // General message
    int32_T *       IntStates;              // Int State array
    real32_T *      FloatStates;            // Float State array
    real64_T *      DoubleStates;           // Double State array
} IEEE_Cigre_DLLInterface_Instance;

typedef struct rec_struct
{
  double rec1;
  double rec2;
}rec_struct;


/* Function pointer types used when DLL is loaded explicitely via LoadLibrary
typedef const IEEE_Cigre_DLLInterface_Model_Info *(__cdecl* Model_GetInfo)(void);

// Functions below return a integer value:
// return 0 - fine
// return 1 - general message (see LastGeneralMessage)
// return 2 - error message and terminate (see LastErrorMessage)

typedef int32_T (__cdecl* Model_FirstCall) (IEEE_Cigre_DLLInterface_Instance *pModelInstance);
  // Model_FirstCall is called in the first step of a simulation (so any malloc or creation needed
  // inside the DLL code be done).  Note memory for the pModelInstance is created by the calling
  // simulation tool (not by the DLL).

typedef int32_T (__cdecl* Model_CheckParameters) (IEEE_Cigre_DLLInterface_Instance *pModelInstance);
  // Model_CheckParameters is called in the first step of a simulation (so model writers can perform
  // more complex checks on input parameters in addition to simple min/max checks).

typedef int32_T (__cdecl* Model_Initialize) (IEEE_Cigre_DLLInterface_Instance *pModelInstance);
  // Model_Initialize is called at Time=0.0 of a simulation, but could also be called repeatedly
  // if models are to be held at initial conditions until a certain release time.

typedef int32_T (__cdecl* Model_Outputs) (IEEE_Cigre_DLLInterface_Instance *pModelInstance);
  // Model_Outputs is called once every FixedStepBaseSampleTime seconds (with sample/hold logic that is added externally in
  // interface code in the main simulation program).  
  // The model code should also update/store its state variables at the end of this call before returning.

typedef int32_T (__cdecl* Model_Iterate) (IEEE_Cigre_DLLInterface_Instance *pModelInstance);
  // Model_Iterate is only called for RMS programs, N times after Model_Outputs is called.
  // It can be used for RMS programs to approximate fast control action (such as fault behaviour) which cannot directly
  // be simulated with large time step RMS programs.
  // The model code should also update/store its state variables at the end of this call before returning.

typedef int32_T (__cdecl* Model_Terminate) (IEEE_Cigre_DLLInterface_Instance *pModelInstance);
  // Called by the main simulation program at the end of a simulation (or in the event the simulation is terminated).

typedef int32_T (__cdecl* Model_PrintInfo) (void)
  // Called in the first step of a simulation to allow model writers to write general model info to the main simulation.

*/


#endif /* __IEEE_Cigre_DLLInterface__ */

