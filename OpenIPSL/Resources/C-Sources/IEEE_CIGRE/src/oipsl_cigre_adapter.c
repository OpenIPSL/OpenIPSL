/*
File: oipsl_cigre_adapter.c (OpenIPSL, Resources/C-Sources/IEEE_CIGRE/src)

Generic OpenIPSL adapter between Modelica external functions and one model written according to the
IEEE/CIGRE DLL Modeling Standard (API V2). It is compiled INTO each model library together with the model
source, with -DOIPSL_PREFIX=<Name>, and drives the model through the standard entry points
(Model_GetInfo, Model_CheckParameters, Model_Initialize, Model_Outputs, Model_Terminate). The interface is
documented in include/oipsl_cigre_adapter.h. Written for OpenIPSL on 2026-10-25 to replace the
model-specific glue of OpenIPSL pull request #362 (H. Chang and L. Vanfretti, American Modelica Conference
2024, DOI 10.3384/ecp20772).

What it does, following the calling sequence the standard prescribes for a simulation tool:
  - lays out the input, output and parameter blocks from Model_GetInfo() with the natural-alignment rule of
    C structures (offset rounded up to the alignment of each field's type; Width scalars per port; the block
    size rounded up to its largest alignment), so that they match the private structures of the model, e.g.
    for SCRX9 seven doubles, the int32 CSwitch and the double RCdRFD give 64 bytes, CSwitch at byte 48 and
    RCdRFD at byte 56;
  - converts the doubles it receives from Modelica to each port or parameter DataType and back;
  - calls Model_CheckParameters and Model_Initialize once, Model_Outputs once per step, Model_Terminate
    once at the end, each with LastErrorMessage and LastGeneralMessage set to an empty string (not NULL), so
    that a model may test them before it sets them, as the TB 958 Appendix E example of SCRX9 does;
  - reports through return codes and stderr only (no ModelicaUtilities, no files, no global state of its
    own). Global state of a vendor model (e.g. a static message buffer) is shared by its instances.

Copyright (c) 2016-2026 Luigi Vanfretti, ALSETLab (formerly SmarTS Lab) and contributors.
BSD 3-Clause License, see the LICENSE file of OpenIPSL.
*/
#include <limits.h>
#include <math.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "ieee_cigre_export.h"
#include "oipsl_cigre_adapter.h"

#define OIPSL_MESSAGE_SIZE 512

/* Value of LastErrorMessage and LastGeneralMessage before every call of the model: an empty string, never NULL.
   A model may read them before it sets them: the SCRX9 example printed in CIGRE TB 958 Appendix E tests
   instance->LastErrorMessage[0] at the end of Model_CheckParameters, Model_Initialize and Model_Outputs, and a
   NULL pointer there makes it crash. */
static const char oipsl_noMessage[] = "";

/* One adapter object = one model instance */
typedef struct OipslCigre {
    const IEEE_Cigre_DLLInterface_Model_Info* info;
    IEEE_Cigre_DLLInterface_Instance* instance;
    unsigned char* inputs;
    unsigned char* outputs;
    unsigned char* parameters;
    size_t* inputOffsets;
    size_t* outputOffsets;
    size_t* parameterOffsets;
    size_t nInputs;      /* scalar inputs */
    size_t nOutputs;     /* scalar outputs */
    size_t nParameters;
    int32_T* intStates;
    real32_T* floatStates;
    real64_T* doubleStates;
    int status;
    int terminate;       /* 1 once Model_CheckParameters has been called */
    char lastMessage[OIPSL_MESSAGE_SIZE];
} OipslCigre;

/* Layout of one block */
typedef struct OipslLayout {
    int valid;
    size_t bytes;
    size_t scalars;
} OipslLayout;

/* Alignment of each standard type inside a structure, as the compiler of this library lays it out */
typedef struct { char c; char_T x; } OipslAlignChar;
typedef struct { char c; int8_T x; } OipslAlignInt8;
typedef struct { char c; uint8_T x; } OipslAlignUint8;
typedef struct { char c; int16_T x; } OipslAlignInt16;
typedef struct { char c; uint16_T x; } OipslAlignUint16;
typedef struct { char c; int32_T x; } OipslAlignInt32;
typedef struct { char c; uint32_T x; } OipslAlignUint32;
typedef struct { char c; real32_T x; } OipslAlignReal32;
typedef struct { char c; real64_T x; } OipslAlignReal64;
typedef struct { char c; const char_T* x; } OipslAlignString;

/* Size of one scalar of a standard data type (0 if unknown); its alignment goes to *alignment */
static size_t oipsl_typeSize(int dataType, size_t* alignment)
{
    switch (dataType) {
    case IEEE_Cigre_DLLInterface_DataType_char_T:
        *alignment = offsetof(OipslAlignChar, x);
        return sizeof(char_T);
    case IEEE_Cigre_DLLInterface_DataType_int8_T:
        *alignment = offsetof(OipslAlignInt8, x);
        return sizeof(int8_T);
    case IEEE_Cigre_DLLInterface_DataType_uint8_T:
        *alignment = offsetof(OipslAlignUint8, x);
        return sizeof(uint8_T);
    case IEEE_Cigre_DLLInterface_DataType_int16_T:
        *alignment = offsetof(OipslAlignInt16, x);
        return sizeof(int16_T);
    case IEEE_Cigre_DLLInterface_DataType_uint16_T:
        *alignment = offsetof(OipslAlignUint16, x);
        return sizeof(uint16_T);
    case IEEE_Cigre_DLLInterface_DataType_int32_T:
        *alignment = offsetof(OipslAlignInt32, x);
        return sizeof(int32_T);
    case IEEE_Cigre_DLLInterface_DataType_uint32_T:
        *alignment = offsetof(OipslAlignUint32, x);
        return sizeof(uint32_T);
    case IEEE_Cigre_DLLInterface_DataType_real32_T:
        *alignment = offsetof(OipslAlignReal32, x);
        return sizeof(real32_T);
    case IEEE_Cigre_DLLInterface_DataType_real64_T:
        *alignment = offsetof(OipslAlignReal64, x);
        return sizeof(real64_T);
    case IEEE_Cigre_DLLInterface_DataType_c_string_T:
        *alignment = offsetof(OipslAlignString, x);
        return sizeof(const char_T*);
    default:
        *alignment = 1;
        return 0;
    }
}

/* Places one field of width scalars after *end; returns 0 for an unknown type or a width below 1 */
static int oipsl_place(int dataType, int32_T width, size_t* end, size_t* maxAlignment, size_t* offset)
{
    size_t alignment = 1;
    size_t size = oipsl_typeSize(dataType, &alignment);
    if ((size == 0) || (width < 1)) {
        return 0;
    }
    *end = ((*end + alignment - 1) / alignment) * alignment;
    *offset = *end;
    *end += ((size_t)width) * size;
    if (alignment > *maxAlignment) {
        *maxAlignment = alignment;
    }
    return 1;
}

/* Layout of a port block; offsets (n entries) may be NULL */
static OipslLayout oipsl_signalLayout(const IEEE_Cigre_DLLInterface_Signal* signals, int32_T n, size_t* offsets)
{
    OipslLayout layout = {0, 0, 0};
    size_t end = 0;
    size_t maxAlignment = 1;
    size_t offset = 0;
    int32_T i;
    if ((n < 0) || ((n > 0) && (signals == NULL))) {
        return layout;
    }
    for (i = 0; i < n; i++) {
        if (!oipsl_place((int)signals[i].DataType, signals[i].Width, &end, &maxAlignment, &offset)) {
            return layout;
        }
        if (offsets != NULL) {
            offsets[i] = offset;
        }
        layout.scalars += (size_t)signals[i].Width;
    }
    layout.bytes = ((end + maxAlignment - 1) / maxAlignment) * maxAlignment;
    layout.valid = 1;
    return layout;
}

/* Layout of the parameter block (parameters are scalars); offsets (n entries) may be NULL */
static OipslLayout oipsl_parameterLayout(const IEEE_Cigre_DLLInterface_Parameter* parameters, int32_T n,
                                         size_t* offsets)
{
    OipslLayout layout = {0, 0, 0};
    size_t end = 0;
    size_t maxAlignment = 1;
    size_t offset = 0;
    int32_T i;
    if ((n < 0) || ((n > 0) && (parameters == NULL))) {
        return layout;
    }
    for (i = 0; i < n; i++) {
        if (!oipsl_place((int)parameters[i].DataType, 1, &end, &maxAlignment, &offset)) {
            return layout;
        }
        if (offsets != NULL) {
            offsets[i] = offset;
        }
        layout.scalars += 1;
    }
    layout.bytes = ((end + maxAlignment - 1) / maxAlignment) * maxAlignment;
    layout.valid = 1;
    return layout;
}

/* Rounds v to an integer in [lo, hi]; *exact becomes 0 if v was not integral or had to be saturated */
static double oipsl_toInteger(double v, double lo, double hi, int* exact)
{
    double r;
    if (v != v) {
        *exact = 0;
        return 0.0;
    }
    r = (v < 0.0) ? ceil(v - 0.5) : floor(v + 0.5);
    if (r < lo) {
        r = lo;
    }
    if (r > hi) {
        r = hi;
    }
    if (fabs(r - v) > 1e-9 * ((fabs(v) > 1.0) ? fabs(v) : 1.0)) {
        *exact = 0;
    }
    return r;
}

/* Writes v as dataType at p; a c_string_T slot receives text. Returns 0 if v was changed by the conversion */
static int oipsl_writeValue(unsigned char* p, int dataType, double v, const char_T* text)
{
    int exact = 1;
    switch (dataType) {
    case IEEE_Cigre_DLLInterface_DataType_char_T: {
        char_T x = (char_T)oipsl_toInteger(v, (double)CHAR_MIN, (double)CHAR_MAX, &exact);
        memcpy(p, &x, sizeof(x));
        break;
    }
    case IEEE_Cigre_DLLInterface_DataType_int8_T: {
        int8_T x = (int8_T)oipsl_toInteger(v, (double)CHAR_MIN, (double)CHAR_MAX, &exact);
        memcpy(p, &x, sizeof(x));
        break;
    }
    case IEEE_Cigre_DLLInterface_DataType_uint8_T: {
        uint8_T x = (uint8_T)oipsl_toInteger(v, 0.0, (double)UCHAR_MAX, &exact);
        memcpy(p, &x, sizeof(x));
        break;
    }
    case IEEE_Cigre_DLLInterface_DataType_int16_T: {
        int16_T x = (int16_T)oipsl_toInteger(v, (double)SHRT_MIN, (double)SHRT_MAX, &exact);
        memcpy(p, &x, sizeof(x));
        break;
    }
    case IEEE_Cigre_DLLInterface_DataType_uint16_T: {
        uint16_T x = (uint16_T)oipsl_toInteger(v, 0.0, (double)USHRT_MAX, &exact);
        memcpy(p, &x, sizeof(x));
        break;
    }
    case IEEE_Cigre_DLLInterface_DataType_int32_T: {
        int32_T x = (int32_T)oipsl_toInteger(v, (double)INT_MIN, (double)INT_MAX, &exact);
        memcpy(p, &x, sizeof(x));
        break;
    }
    case IEEE_Cigre_DLLInterface_DataType_uint32_T: {
        uint32_T x = (uint32_T)oipsl_toInteger(v, 0.0, (double)UINT_MAX, &exact);
        memcpy(p, &x, sizeof(x));
        break;
    }
    case IEEE_Cigre_DLLInterface_DataType_real32_T: {
        real32_T x = (real32_T)v;
        memcpy(p, &x, sizeof(x));
        break;
    }
    case IEEE_Cigre_DLLInterface_DataType_real64_T: {
        real64_T x = (real64_T)v;
        memcpy(p, &x, sizeof(x));
        break;
    }
    case IEEE_Cigre_DLLInterface_DataType_c_string_T: {
        const char_T* x = text;
        memcpy(p, &x, sizeof(x));
        break;
    }
    default:
        break;
    }
    return exact;
}

/* Reads the value of dataType at p as a double (0 for a string) */
static double oipsl_readValue(const unsigned char* p, int dataType)
{
    switch (dataType) {
    case IEEE_Cigre_DLLInterface_DataType_char_T: {
        char_T x;
        memcpy(&x, p, sizeof(x));
        return (double)x;
    }
    case IEEE_Cigre_DLLInterface_DataType_int8_T: {
        int8_T x;
        memcpy(&x, p, sizeof(x));
        return (double)x;
    }
    case IEEE_Cigre_DLLInterface_DataType_uint8_T: {
        uint8_T x;
        memcpy(&x, p, sizeof(x));
        return (double)x;
    }
    case IEEE_Cigre_DLLInterface_DataType_int16_T: {
        int16_T x;
        memcpy(&x, p, sizeof(x));
        return (double)x;
    }
    case IEEE_Cigre_DLLInterface_DataType_uint16_T: {
        uint16_T x;
        memcpy(&x, p, sizeof(x));
        return (double)x;
    }
    case IEEE_Cigre_DLLInterface_DataType_int32_T: {
        int32_T x;
        memcpy(&x, p, sizeof(x));
        return (double)x;
    }
    case IEEE_Cigre_DLLInterface_DataType_uint32_T: {
        uint32_T x;
        memcpy(&x, p, sizeof(x));
        return (double)x;
    }
    case IEEE_Cigre_DLLInterface_DataType_real32_T: {
        real32_T x;
        memcpy(&x, p, sizeof(x));
        return (double)x;
    }
    case IEEE_Cigre_DLLInterface_DataType_real64_T: {
        real64_T x;
        memcpy(&x, p, sizeof(x));
        return (double)x;
    }
    default:
        return 0.0;
    }
}

/* Value of a Min/Max union for a numeric data type */
static double oipsl_limitValue(const union MinMaxValueU* u, int dataType)
{
    switch (dataType) {
    case IEEE_Cigre_DLLInterface_DataType_char_T:
        return (double)u->Char_Val;
    case IEEE_Cigre_DLLInterface_DataType_int8_T:
        return (double)u->Int8_Val;
    case IEEE_Cigre_DLLInterface_DataType_uint8_T:
        return (double)u->Uint8_Val;
    case IEEE_Cigre_DLLInterface_DataType_int16_T:
        return (double)u->Int16_Val;
    case IEEE_Cigre_DLLInterface_DataType_uint16_T:
        return (double)u->Uint16_Val;
    case IEEE_Cigre_DLLInterface_DataType_int32_T:
        return (double)u->Int32_Val;
    case IEEE_Cigre_DLLInterface_DataType_uint32_T:
        return (double)u->Uint32_Val;
    case IEEE_Cigre_DLLInterface_DataType_real32_T:
        return (double)u->Real32_Val;
    case IEEE_Cigre_DLLInterface_DataType_real64_T:
        return (double)u->Real64_Val;
    default:
        return 0.0;
    }
}

/* Writes one message line to stderr; with an object, a text identical to the previous one is skipped */
static void oipsl_message(OipslCigre* a, double t, const char* origin, const char* text)
{
    size_t n;
    size_t kept;
    const char* modelName = "?";
    if ((text == NULL) || (text[0] == '\0')) {
        return;
    }
    n = strlen(text);
    while ((n > 0) && ((text[n - 1] == '\n') || (text[n - 1] == '\r'))) {
        n--;
    }
    if (n == 0) {
        return;
    }
    kept = (n < (OIPSL_MESSAGE_SIZE - 1)) ? n : (OIPSL_MESSAGE_SIZE - 1);
    if (a != NULL) {
        if ((strlen(a->lastMessage) == kept) && (memcmp(a->lastMessage, text, kept) == 0)) {
            return;
        }
        memcpy(a->lastMessage, text, kept);
        a->lastMessage[kept] = '\0';
        if ((a->info != NULL) && (a->info->ModelName != NULL)) {
            modelName = a->info->ModelName;
        }
    }
    fprintf(stderr, "OpenIPSL IEEE/CIGRE library %s (model %s), t = %g s, %s: %.*s\n", OIPSL_NAME, modelName, t,
            origin, (int)n, text);
    fflush(stderr);
}

/* Reports the messages of one call of the model and maps its return code to a status */
static int oipsl_report(OipslCigre* a, double t, const char* function, int32_T rc)
{
    char origin[96];
    const char* text;
    if ((rc == IEEE_Cigre_DLLInterface_Return_OK) || (rc == IEEE_Cigre_DLLInterface_Return_Message)) {
        snprintf(origin, sizeof(origin), "%s message", function);
        oipsl_message(a, t, origin, a->instance->LastGeneralMessage);
        return (int)rc;
    }
    text = a->instance->LastErrorMessage;
    if ((text == NULL) || (text[0] == '\0')) {
        text = a->instance->LastGeneralMessage;
    }
    snprintf(origin, sizeof(origin), "%s error (return code %d)", function, (int)rc);
    if ((text == NULL) || (text[0] == '\0')) {
        text = "no message given by the model";
    }
    oipsl_message(a, t, origin, text);
    return OIPSL_STATUS_ERROR;
}

/* Copies the scalar values v into a port block */
static void oipsl_writeSignals(unsigned char* block, const IEEE_Cigre_DLLInterface_Signal* signals, int32_T nPorts,
                               const size_t* offsets, const double* v)
{
    int32_T i;
    int32_T k;
    size_t j = 0;
    size_t alignment = 1;
    for (i = 0; i < nPorts; i++) {
        size_t size = oipsl_typeSize((int)signals[i].DataType, &alignment);
        for (k = 0; k < signals[i].Width; k++) {
            (void)oipsl_writeValue(block + offsets[i] + ((size_t)k) * size, (int)signals[i].DataType, v[j], NULL);
            j++;
        }
    }
}

/* Copies the scalar values of a port block into v */
static void oipsl_readSignals(const unsigned char* block, const IEEE_Cigre_DLLInterface_Signal* signals,
                              int32_T nPorts, const size_t* offsets, double* v)
{
    int32_T i;
    int32_T k;
    size_t j = 0;
    size_t alignment = 1;
    for (i = 0; i < nPorts; i++) {
        size_t size = oipsl_typeSize((int)signals[i].DataType, &alignment);
        for (k = 0; k < signals[i].Width; k++) {
            v[j] = oipsl_readValue(block + offsets[i] + ((size_t)k) * size, (int)signals[i].DataType);
            j++;
        }
    }
}

/* Releases all memory of an adapter object (no call into the model) */
static void oipsl_release(OipslCigre* a)
{
    if (a == NULL) {
        return;
    }
    free(a->instance);
    free(a->inputs);
    free(a->outputs);
    free(a->parameters);
    free(a->inputOffsets);
    free(a->outputOffsets);
    free(a->parameterOffsets);
    free(a->intStates);
    free(a->floatStates);
    free(a->doubleStates);
    free(a);
}

/* Model_Terminate (if Model_CheckParameters was called), then release */
static void oipsl_destroy(OipslCigre* a)
{
    if (a == NULL) {
        return;
    }
    if (a->terminate && (a->instance != NULL)) {
        int32_T rc;
        a->instance->LastErrorMessage = oipsl_noMessage;
        a->instance->LastGeneralMessage = oipsl_noMessage;
        rc = Model_Terminate(a->instance);
        (void)oipsl_report(a, a->instance->Time, "Model_Terminate", rc);
    }
    oipsl_release(a);
}

/* calloc that never asks for zero bytes */
static void* oipsl_calloc(size_t count, size_t size)
{
    return calloc((count > 0) ? count : 1, (size > 0) ? size : 1);
}

IEEE_CIGRE_EXPORT void* IEEE_CIGRE_CALL OIPSL_FUNCTION(_oipsl_create)(const double* parameters, size_t nParameters,
                                                                      const double* initialInputs, size_t nInputs,
                                                                      const double* initialOutputs, size_t nOutputs,
                                                                      int simToolMode)
{
    const IEEE_Cigre_DLLInterface_Model_Info* info = Model_GetInfo();
    OipslCigre* a;
    OipslLayout inputLayout;
    OipslLayout outputLayout;
    OipslLayout parameterLayout;
    int32_T rc;
    int statusCheck;
    int statusInit;
    int32_T i;
    char text[OIPSL_MESSAGE_SIZE];

    if (info == NULL) {
        oipsl_message(NULL, 0.0, "create", "Model_GetInfo returned NULL");
        return NULL;
    }
    if ((simToolMode != 1) && (simToolMode != 2)) {
        snprintf(text, sizeof(text), "simToolMode = %d; the standard defines only 1 (EMT) and 2 (RMS)", simToolMode);
        oipsl_message(NULL, 0.0, "create", text);
        return NULL;
    }
    if ((info->NumInputPorts < 0) || (info->NumOutputPorts < 0) || (info->NumParameters < 0)
        || (info->NumIntStates < 0) || (info->NumFloatStates < 0) || (info->NumDoubleStates < 0)) {
        oipsl_message(NULL, 0.0, "create", "Model_GetInfo reports a negative number of ports, parameters or states");
        return NULL;
    }
    a = (OipslCigre*)calloc(1, sizeof(OipslCigre));
    if (a == NULL) {
        oipsl_message(NULL, 0.0, "create", "out of memory");
        return NULL;
    }
    a->info = info;
    a->inputOffsets = (size_t*)oipsl_calloc((size_t)info->NumInputPorts, sizeof(size_t));
    a->outputOffsets = (size_t*)oipsl_calloc((size_t)info->NumOutputPorts, sizeof(size_t));
    a->parameterOffsets = (size_t*)oipsl_calloc((size_t)info->NumParameters, sizeof(size_t));
    if ((a->inputOffsets == NULL) || (a->outputOffsets == NULL) || (a->parameterOffsets == NULL)) {
        oipsl_message(a, 0.0, "create", "out of memory");
        oipsl_release(a);
        return NULL;
    }
    inputLayout = oipsl_signalLayout(info->InputPortsInfo, info->NumInputPorts, a->inputOffsets);
    outputLayout = oipsl_signalLayout(info->OutputPortsInfo, info->NumOutputPorts, a->outputOffsets);
    parameterLayout = oipsl_parameterLayout(info->ParametersInfo, info->NumParameters, a->parameterOffsets);
    if (!inputLayout.valid || !outputLayout.valid || !parameterLayout.valid) {
        oipsl_message(a, 0.0, "create",
                      "Model_GetInfo describes a port or parameter with an unknown DataType or a Width below 1");
        oipsl_release(a);
        return NULL;
    }
    a->nInputs = inputLayout.scalars;
    a->nOutputs = outputLayout.scalars;
    a->nParameters = parameterLayout.scalars;
    if ((nParameters != a->nParameters) || (nInputs != a->nInputs) || (nOutputs != a->nOutputs)) {
        snprintf(text, sizeof(text),
                 "create received %lu parameters, %lu initial inputs and %lu initial outputs; the model has %lu "
                 "parameters, %lu scalar inputs and %lu scalar outputs",
                 (unsigned long)nParameters, (unsigned long)nInputs, (unsigned long)nOutputs,
                 (unsigned long)a->nParameters, (unsigned long)a->nInputs, (unsigned long)a->nOutputs);
        oipsl_message(a, 0.0, "size mismatch", text);
        oipsl_release(a);
        return NULL;
    }
    if (((nParameters > 0) && (parameters == NULL)) || ((nInputs > 0) && (initialInputs == NULL))
        || ((nOutputs > 0) && (initialOutputs == NULL))) {
        oipsl_message(a, 0.0, "create", "NULL array of parameters, initial inputs or initial outputs");
        oipsl_release(a);
        return NULL;
    }
    a->inputs = (unsigned char*)oipsl_calloc(inputLayout.bytes, 1);
    a->outputs = (unsigned char*)oipsl_calloc(outputLayout.bytes, 1);
    a->parameters = (unsigned char*)oipsl_calloc(parameterLayout.bytes, 1);
    a->instance = (IEEE_Cigre_DLLInterface_Instance*)calloc(1, sizeof(IEEE_Cigre_DLLInterface_Instance));
    if (info->NumIntStates > 0) {
        a->intStates = (int32_T*)calloc((size_t)info->NumIntStates, sizeof(int32_T));
    }
    if (info->NumFloatStates > 0) {
        a->floatStates = (real32_T*)calloc((size_t)info->NumFloatStates, sizeof(real32_T));
    }
    if (info->NumDoubleStates > 0) {
        a->doubleStates = (real64_T*)calloc((size_t)info->NumDoubleStates, sizeof(real64_T));
    }
    if ((a->inputs == NULL) || (a->outputs == NULL) || (a->parameters == NULL) || (a->instance == NULL)
        || ((info->NumIntStates > 0) && (a->intStates == NULL))
        || ((info->NumFloatStates > 0) && (a->floatStates == NULL))
        || ((info->NumDoubleStates > 0) && (a->doubleStates == NULL))) {
        oipsl_message(a, 0.0, "create", "out of memory");
        oipsl_release(a);
        return NULL;
    }

    /* Parameters in ParametersInfo order, converted to each DataType; Min/Max are checked and reported */
    for (i = 0; i < info->NumParameters; i++) {
        const IEEE_Cigre_DLLInterface_Parameter* p = &info->ParametersInfo[i];
        int dataType = (int)p->DataType;
        double v = parameters[i];
        if (dataType == IEEE_Cigre_DLLInterface_DataType_c_string_T) {
            (void)oipsl_writeValue(a->parameters + a->parameterOffsets[i], dataType, 0.0, p->DefaultValue.Char_Ptr);
            continue;
        }
        if ((v < oipsl_limitValue(&p->MinValue, dataType)) || (v > oipsl_limitValue(&p->MaxValue, dataType))) {
            snprintf(text, sizeof(text), "parameter %s = %g is outside its range [%g, %g] given in ParametersInfo",
                     (p->Name != NULL) ? p->Name : "?", v, oipsl_limitValue(&p->MinValue, dataType),
                     oipsl_limitValue(&p->MaxValue, dataType));
            oipsl_message(a, 0.0, "warning", text);
        }
        if (!oipsl_writeValue(a->parameters + a->parameterOffsets[i], dataType, v, NULL)) {
            snprintf(text, sizeof(text),
                     "parameter %s = %g does not fit its integer data type; it was rounded or saturated",
                     (p->Name != NULL) ? p->Name : "?", v);
            oipsl_message(a, 0.0, "warning", text);
        }
    }
    oipsl_writeSignals(a->inputs, info->InputPortsInfo, info->NumInputPorts, a->inputOffsets, initialInputs);
    oipsl_writeSignals(a->outputs, info->OutputPortsInfo, info->NumOutputPorts, a->outputOffsets, initialOutputs);

    /* The instance structure has a const member (SimTool_EMT_RMS_Mode): build it locally and copy it */
    {
        IEEE_Cigre_DLLInterface_Instance init = {
            .ExternalInputs = a->inputs,
            .ExternalOutputs = a->outputs,
            .Parameters = a->parameters,
            .Time = 0.0,
            .SimTool_EMT_RMS_Mode = (uint8_T)simToolMode,
            .LastErrorMessage = oipsl_noMessage,
            .LastGeneralMessage = oipsl_noMessage,
            .IntStates = a->intStates,
            .FloatStates = a->floatStates,
            .DoubleStates = a->doubleStates
        };
        memcpy(a->instance, &init, sizeof(init));
    }

    a->terminate = 1;
    rc = Model_CheckParameters(a->instance);
    statusCheck = oipsl_report(a, 0.0, "Model_CheckParameters", rc);
    if (statusCheck == OIPSL_STATUS_ERROR) {
        oipsl_destroy(a);
        return NULL;
    }
    a->instance->LastErrorMessage = oipsl_noMessage;
    a->instance->LastGeneralMessage = oipsl_noMessage;
    rc = Model_Initialize(a->instance);
    statusInit = oipsl_report(a, 0.0, "Model_Initialize", rc);
    if (statusInit == OIPSL_STATUS_ERROR) {
        oipsl_destroy(a);
        return NULL;
    }
    a->status = (statusCheck > statusInit) ? statusCheck : statusInit;
    return a;
}

IEEE_CIGRE_EXPORT void IEEE_CIGRE_CALL OIPSL_FUNCTION(_oipsl_free)(void* obj)
{
    oipsl_destroy((OipslCigre*)obj);
}

IEEE_CIGRE_EXPORT int IEEE_CIGRE_CALL OIPSL_FUNCTION(_oipsl_step)(void* obj, double t, const double* inputs, size_t nInputs,
                                                                  double* outputs, size_t nOutputs)
{
    OipslCigre* a = (OipslCigre*)obj;
    int32_T rc;
    if (a == NULL) {
        return OIPSL_STATUS_NO_OBJECT;
    }
    if ((nInputs != a->nInputs) || (nOutputs != a->nOutputs) || ((nInputs > 0) && (inputs == NULL))
        || ((nOutputs > 0) && (outputs == NULL))) {
        char text[OIPSL_MESSAGE_SIZE];
        snprintf(text, sizeof(text),
                 "step received %lu inputs and %lu outputs; the model has %lu scalar inputs and %lu scalar outputs",
                 (unsigned long)nInputs, (unsigned long)nOutputs, (unsigned long)a->nInputs,
                 (unsigned long)a->nOutputs);
        oipsl_message(a, t, "size mismatch", text);
        if (outputs != NULL) {
            size_t j;
            for (j = 0; j < nOutputs; j++) {
                outputs[j] = 0.0;
            }
        }
        a->status = OIPSL_STATUS_SIZE_MISMATCH;
        return a->status;
    }
    oipsl_writeSignals(a->inputs, a->info->InputPortsInfo, a->info->NumInputPorts, a->inputOffsets, inputs);
    a->instance->Time = t;
    a->instance->LastErrorMessage = oipsl_noMessage;
    a->instance->LastGeneralMessage = oipsl_noMessage;
    rc = Model_Outputs(a->instance);
    oipsl_readSignals(a->outputs, a->info->OutputPortsInfo, a->info->NumOutputPorts, a->outputOffsets, outputs);
    a->status = oipsl_report(a, t, "Model_Outputs", rc);
    return a->status;
}

IEEE_CIGRE_EXPORT double IEEE_CIGRE_CALL OIPSL_FUNCTION(_oipsl_sampleTime)(void)
{
    const IEEE_Cigre_DLLInterface_Model_Info* info = Model_GetInfo();
    return (info != NULL) ? info->FixedStepBaseSampleTime : 0.0;
}

IEEE_CIGRE_EXPORT int IEEE_CIGRE_CALL OIPSL_FUNCTION(_oipsl_count)(int what)
{
    const IEEE_Cigre_DLLInterface_Model_Info* info = Model_GetInfo();
    size_t* offsets;
    OipslLayout layout;
    int index;
    int32_T n;
    int result = -1;
    if (info == NULL) {
        return -1;
    }
    switch (what) {
    case OIPSL_COUNT_INPUTS:
        layout = oipsl_signalLayout(info->InputPortsInfo, info->NumInputPorts, NULL);
        return layout.valid ? (int)layout.scalars : -1;
    case OIPSL_COUNT_OUTPUTS:
        layout = oipsl_signalLayout(info->OutputPortsInfo, info->NumOutputPorts, NULL);
        return layout.valid ? (int)layout.scalars : -1;
    case OIPSL_COUNT_PARAMETERS:
        return (int)info->NumParameters;
    case OIPSL_COUNT_DOUBLE_STATES:
        return (int)info->NumDoubleStates;
    case OIPSL_COUNT_INT_STATES:
        return (int)info->NumIntStates;
    case OIPSL_COUNT_FLOAT_STATES:
        return (int)info->NumFloatStates;
    case OIPSL_COUNT_INPUT_PORTS:
        return (int)info->NumInputPorts;
    case OIPSL_COUNT_OUTPUT_PORTS:
        return (int)info->NumOutputPorts;
    case OIPSL_COUNT_INPUT_BYTES:
        layout = oipsl_signalLayout(info->InputPortsInfo, info->NumInputPorts, NULL);
        return layout.valid ? (int)layout.bytes : -1;
    case OIPSL_COUNT_OUTPUT_BYTES:
        layout = oipsl_signalLayout(info->OutputPortsInfo, info->NumOutputPorts, NULL);
        return layout.valid ? (int)layout.bytes : -1;
    case OIPSL_COUNT_PARAMETER_BYTES:
        layout = oipsl_parameterLayout(info->ParametersInfo, info->NumParameters, NULL);
        return layout.valid ? (int)layout.bytes : -1;
    default:
        break;
    }
    if ((what >= OIPSL_COUNT_PARAMETER_OFFSET) && (what < OIPSL_COUNT_INPUT_OFFSET)) {
        index = what - OIPSL_COUNT_PARAMETER_OFFSET;
        n = info->NumParameters;
    } else if ((what >= OIPSL_COUNT_INPUT_OFFSET) && (what < OIPSL_COUNT_OUTPUT_OFFSET)) {
        index = what - OIPSL_COUNT_INPUT_OFFSET;
        n = info->NumInputPorts;
    } else if ((what >= OIPSL_COUNT_OUTPUT_OFFSET) && (what < OIPSL_COUNT_OUTPUT_OFFSET + 1000)) {
        index = what - OIPSL_COUNT_OUTPUT_OFFSET;
        n = info->NumOutputPorts;
    } else {
        return -1;
    }
    if ((n <= 0) || (index >= n)) {
        return -1;
    }
    offsets = (size_t*)oipsl_calloc((size_t)n, sizeof(size_t));
    if (offsets == NULL) {
        return -1;
    }
    if (what < OIPSL_COUNT_INPUT_OFFSET) {
        layout = oipsl_parameterLayout(info->ParametersInfo, n, offsets);
    } else if (what < OIPSL_COUNT_OUTPUT_OFFSET) {
        layout = oipsl_signalLayout(info->InputPortsInfo, n, offsets);
    } else {
        layout = oipsl_signalLayout(info->OutputPortsInfo, n, offsets);
    }
    if (layout.valid) {
        result = (int)offsets[index];
    }
    free(offsets);
    return result;
}

IEEE_CIGRE_EXPORT int IEEE_CIGRE_CALL OIPSL_FUNCTION(_oipsl_status)(void* obj)
{
    const OipslCigre* a = (const OipslCigre*)obj;
    return (a != NULL) ? a->status : OIPSL_STATUS_NO_OBJECT;
}
