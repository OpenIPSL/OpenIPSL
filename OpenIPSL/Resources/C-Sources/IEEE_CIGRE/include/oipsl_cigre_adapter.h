/*
File: oipsl_cigre_adapter.h (OpenIPSL, Resources/C-Sources/IEEE_CIGRE/include)

Prototypes of the OpenIPSL adapter that every IEEE/CIGRE model library of OpenIPSL exports next to the
standard's entry points. Every standard DLL exports the same names (Model_GetInfo, Model_Outputs, ...), so a
Modelica model that links two of them could not tell them apart; the adapter functions therefore carry a
model-specific prefix, set at compile time with -DOIPSL_PREFIX=<Name> (e.g. SCRX9_oipsl_create). The same
generic source, src/oipsl_cigre_adapter.c, is compiled into each model library.

  void*  <P>_oipsl_create(parameters, nParameters, initialInputs, nInputs, initialOutputs, nOutputs, simToolMode)
         Builds one model instance: input, output and parameter blocks laid out from Model_GetInfo() with
         natural alignment, state arrays, then Model_CheckParameters and Model_Initialize. Parameters are given
         as doubles in ParametersInfo order and converted to each parameter's DataType; initial inputs and
         outputs as doubles in port order (Width scalars per port). simToolMode: 1 = EMT, 2 = RMS.
         Returns NULL on any failure (size mismatch, unsupported data type, simToolMode other than 1 or 2,
         a return code 2); the reason is written to stderr.
  void   <P>_oipsl_free(obj)                 Model_Terminate, then releases everything; NULL is a no-op.
  int    <P>_oipsl_step(obj, t, inputs, nInputs, outputs, nOutputs)
         One FixedStepBaseSampleTime step: copies the inputs, sets Time = t, calls Model_Outputs once and
         copies the outputs. Returns the model's code (0 OK, 1 message, 2 error), -1 for a NULL object and
         -2 for a size mismatch.
  double <P>_oipsl_sampleTime(void)          Model_GetInfo()->FixedStepBaseSampleTime in seconds.
  int    <P>_oipsl_count(what)               see OIPSL_COUNT_* below; -1 for an unknown request.
  int    <P>_oipsl_status(obj)               status of the last call on obj (codes as for step; -1 for NULL).

Messages (LastErrorMessage, LastGeneralMessage, size mismatches, parameters outside their Min/Max) are
written to stderr with the model name and the time, each distinct text once in a row. Before every call of
the model, LastErrorMessage and LastGeneralMessage are set to an empty string, never NULL (the TB 958
Appendix E example of SCRX9 reads them before it sets them). The adapter never calls ModelicaUtilities (a DLL
cannot import functions from the simulation executable that loads it).

Limits of this generic adapter (none of them affects SCRX9 or GFM_GFL_IBR, whose ports are all real64_T and
whose only non-real64_T parameter is the int32_T CSwitch of SCRX9):
  - A c_string_T parameter always receives its ParametersInfo default; the double passed for it is ignored.
    A c_string_T input port receives NULL.
  - Inputs of an integer or real32_T port are rounded to the nearest integer and saturated to the type's
    range, or rounded to float, without a message (parameters get a stderr warning when they change).
  - Model_FirstCall and Model_Iterate (optional in the standard) are never called.
  - Instances of one library share the vendor model's global data (e.g. a static message buffer). Stepping
    instances of one library from several threads at once keeps states and outputs correct, but messages
    can be lost or reported by the wrong instance.

Copyright (c) 2016-2026 Luigi Vanfretti, ALSETLab (formerly SmarTS Lab) and contributors.
BSD 3-Clause License, see the LICENSE file of OpenIPSL.
*/
#ifndef OIPSL_CIGRE_ADAPTER_H
#define OIPSL_CIGRE_ADAPTER_H

#include <stddef.h>

#include "ieee_cigre_export.h"

#if !defined(OIPSL_PREFIX)
#  error "Define OIPSL_PREFIX as the model library name, e.g. -DOIPSL_PREFIX=SCRX9"
#endif

#define OIPSL_CONCAT_(a, b) a##b
#define OIPSL_CONCAT(a, b) OIPSL_CONCAT_(a, b)
#define OIPSL_STRINGIFY_(x) #x
#define OIPSL_STRINGIFY(x) OIPSL_STRINGIFY_(x)

/* Adapter function names: OIPSL_FUNCTION(_oipsl_step) -> <prefix>_oipsl_step */
#define OIPSL_FUNCTION(suffix) OIPSL_CONCAT(OIPSL_PREFIX, suffix)
/* Library name as a string, e.g. "SCRX9" */
#define OIPSL_NAME OIPSL_STRINGIFY(OIPSL_PREFIX)

/* Status codes (step, status) */
#define OIPSL_STATUS_OK 0
#define OIPSL_STATUS_MESSAGE 1
#define OIPSL_STATUS_ERROR 2
#define OIPSL_STATUS_NO_OBJECT (-1)
#define OIPSL_STATUS_SIZE_MISMATCH (-2)

/* Requests for count(what). 0-3 are what the Modelica wrappers use; the others describe the memory layout
   the adapter builds from Model_GetInfo() (used by test/adapter_test.c, useful for any host). */
#define OIPSL_COUNT_INPUTS 0               /* scalar inputs (sum of the input port widths) */
#define OIPSL_COUNT_OUTPUTS 1              /* scalar outputs (sum of the output port widths) */
#define OIPSL_COUNT_PARAMETERS 2           /* parameters (all scalar in the standard) */
#define OIPSL_COUNT_DOUBLE_STATES 3        /* NumDoubleStates */
#define OIPSL_COUNT_INT_STATES 4           /* NumIntStates */
#define OIPSL_COUNT_FLOAT_STATES 5         /* NumFloatStates */
#define OIPSL_COUNT_INPUT_PORTS 6          /* NumInputPorts */
#define OIPSL_COUNT_OUTPUT_PORTS 7         /* NumOutputPorts */
#define OIPSL_COUNT_INPUT_BYTES 10         /* size of the input block in bytes */
#define OIPSL_COUNT_OUTPUT_BYTES 11        /* size of the output block in bytes */
#define OIPSL_COUNT_PARAMETER_BYTES 12     /* size of the parameter block in bytes */
#define OIPSL_COUNT_PARAMETER_OFFSET 1000  /* + i: byte offset of parameter i in its block */
#define OIPSL_COUNT_INPUT_OFFSET 2000      /* + i: byte offset of input port i in its block */
#define OIPSL_COUNT_OUTPUT_OFFSET 3000     /* + i: byte offset of output port i in its block */

#ifdef __cplusplus
extern "C" {
#endif

IEEE_CIGRE_EXPORT void* IEEE_CIGRE_CALL OIPSL_FUNCTION(_oipsl_create)(const double* parameters, size_t nParameters,
                                                                      const double* initialInputs, size_t nInputs,
                                                                      const double* initialOutputs, size_t nOutputs,
                                                                      int simToolMode);
IEEE_CIGRE_EXPORT void IEEE_CIGRE_CALL OIPSL_FUNCTION(_oipsl_free)(void* obj);
IEEE_CIGRE_EXPORT int IEEE_CIGRE_CALL OIPSL_FUNCTION(_oipsl_step)(void* obj, double t, const double* inputs, size_t nInputs,
                                                                  double* outputs, size_t nOutputs);
IEEE_CIGRE_EXPORT double IEEE_CIGRE_CALL OIPSL_FUNCTION(_oipsl_sampleTime)(void);
IEEE_CIGRE_EXPORT int IEEE_CIGRE_CALL OIPSL_FUNCTION(_oipsl_count)(int what);
IEEE_CIGRE_EXPORT int IEEE_CIGRE_CALL OIPSL_FUNCTION(_oipsl_status)(void* obj);

#ifdef __cplusplus
}
#endif

#endif /* OIPSL_CIGRE_ADAPTER_H */
