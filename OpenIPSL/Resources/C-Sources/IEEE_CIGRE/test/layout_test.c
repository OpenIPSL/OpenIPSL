/*
File: layout_test.c (OpenIPSL, Resources/C-Sources/IEEE_CIGRE/test)

Layout test of one IEEE/CIGRE model library. The OpenIPSL adapter builds the input, output and parameter blocks
of a model from Model_GetInfo() alone (natural alignment, see src/oipsl_cigre_adapter.c); the model reads them
through its own private structures (MyModelInputs, MyModelOutputs, MyModelParameters). This program compiles
the model source itself, with this compiler, its entry points renamed and nothing exported, and compares
  - the counts and the sample time that the adapter in the library reports with the source's Model_Info,
  - offsetof/sizeof of the three private structures with the offsets and block sizes that the adapter in the
    library computes (count(10..12), count(1000 + i), count(2000 + i), count(3000 + i)).
Compiled once per model with -DOIPSL_PREFIX=<Name> and -DOIPSL_TEST_SCRX9 or -DOIPSL_TEST_GFM_GFL_IBR (see
CMakeLists.txt); links against the library like adapter_test.c.
Exit code: number of failed checks (0 = pass).

Copyright (c) 2016-2026 Luigi Vanfretti, ALSETLab (formerly SmarTS Lab) and contributors.
BSD 3-Clause License, see the LICENSE file of OpenIPSL.
*/
#include <stddef.h>
#include <stdio.h>
#include <string.h>

/* The model source is compiled into this program without exports and with renamed entry points, so that it
   cannot clash with the library's own Model_* functions. */
#define IEEE_CIGRE_STATIC
#define Model_GetInfo layout_Model_GetInfo
#define Model_FirstCall layout_Model_FirstCall
#define Model_CheckParameters layout_Model_CheckParameters
#define Model_Initialize layout_Model_Initialize
#define Model_Outputs layout_Model_Outputs
#define Model_Iterate layout_Model_Iterate
#define Model_Terminate layout_Model_Terminate
#define Model_PrintInfo layout_Model_PrintInfo

/* The vendor code keeps its own warnings (left alone on purpose, see README.md); they are not this test's.
   "Potentially uninitialized" warnings come from the optimiser after the pop below, so they are switched off
   for the whole file (the test's own code has no such variables). */
#if defined(_MSC_VER)
#  pragma warning(disable : 4701 4703)
#  pragma warning(push, 0)
#elif defined(__GNUC__)
#  pragma GCC diagnostic ignored "-Wpragmas"
#  pragma GCC diagnostic ignored "-Wmaybe-uninitialized"
#  pragma GCC diagnostic ignored "-Wsometimes-uninitialized"
#  pragma GCC diagnostic push
#  pragma GCC diagnostic ignored "-Wunused-variable"
#  pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#  pragma GCC diagnostic ignored "-Wunused-parameter"
#endif

#if defined(OIPSL_TEST_SCRX9)
#  include "SCRX9.c"
#  define OIPSL_PARAMETER_FIELDS X(TAdTB) X(TB) X(K) X(TE) X(EMin) X(EMax) X(CSwitch) X(RCdRFD)
#  define OIPSL_INPUT_FIELDS X(VRef) X(Ec) X(Vs) X(IFD) X(VT) X(VUEL) X(VOEL)
#  define OIPSL_OUTPUT_FIELDS X(EFD)
#elif defined(OIPSL_TEST_GFM_GFL_IBR)
#  include "GFM_GFL_IBR.c"
#  define OIPSL_PARAMETER_FIELDS                                                                              \
    X(Vbase) X(Sbase) X(Vdcbase) X(KpI) X(KiI) X(wtype) X(KpPLL) X(KiPLL) X(del_f_limit) X(KpP) X(KiP) X(Qflag) \
    X(KpQ) X(KiQ) X(KpV) X(KiV) X(KpVq) X(KiVq) X(Imax) X(Pmax) X(Pmin) X(Qmax) X(Qmin) X(PQflag) X(KfDroop)     \
    X(KvDroop) X(K_POD) X(T_POD) X(T1_POD) X(T2_POD) X(POD_min) X(POD_max) X(Vdip) X(Vup) X(KpVdq) X(KiVdq)     \
    X(Tr) X(Rchoke) X(Lchoke) X(Cfilt) X(Rdamp)
#  define OIPSL_INPUT_FIELDS X(Va) X(Vb) X(Vc) X(Ia) X(Ib) X(Ic) X(IaL1) X(IbL1) X(IcL1) X(Pref) X(Qref) X(Vref)
#  define OIPSL_OUTPUT_FIELDS                                                                                 \
    X(Ea) X(Eb) X(Ec) X(Idrefout) X(Idout) X(Iqrefout) X(Iqout) X(Vdout) X(Vqout) X(Freqpll) X(Pout) X(Qout)
#else
#  error "Define OIPSL_TEST_SCRX9 or OIPSL_TEST_GFM_GFL_IBR"
#endif

#if defined(_MSC_VER)
#  pragma warning(pop)
#elif defined(__GNUC__)
#  pragma GCC diagnostic pop
#endif

#include "oipsl_cigre_adapter.h"

#define count_ OIPSL_FUNCTION(_oipsl_count)
#define sampleTime_ OIPSL_FUNCTION(_oipsl_sampleTime)

static int failures = 0;
static int checks = 0;

static void checkSize(size_t value, size_t expected, const char* what, const char* name)
{
    checks++;
    if (value == expected) {
        printf("ok      %s%s%s = %u\n", what, (name[0] != '\0') ? " " : "", name, (unsigned)value);
    } else {
        failures++;
        printf("FAILED  %s%s%s = %u (model source: %u)\n", what, (name[0] != '\0') ? " " : "", name,
               (unsigned)value, (unsigned)expected);
    }
    fflush(stdout);
}

/* count(what) as a size; a negative answer (an error of the adapter) becomes a value no structure has */
static size_t countSize(int what)
{
    int n = count_(what);
    return (n < 0) ? (size_t)-1 : (size_t)n;
}

int main(void)
{
    const IEEE_Cigre_DLLInterface_Model_Info* info = layout_Model_GetInfo();
    static const size_t parameterOffsets[] = {
#define X(field) offsetof(MyModelParameters, field),
        OIPSL_PARAMETER_FIELDS
#undef X
    };
    static const char* const parameterFields[] = {
#define X(field) #field,
        OIPSL_PARAMETER_FIELDS
#undef X
    };
    static const size_t inputOffsets[] = {
#define X(field) offsetof(MyModelInputs, field),
        OIPSL_INPUT_FIELDS
#undef X
    };
    static const char* const inputFields[] = {
#define X(field) #field,
        OIPSL_INPUT_FIELDS
#undef X
    };
    static const size_t outputOffsets[] = {
#define X(field) offsetof(MyModelOutputs, field),
        OIPSL_OUTPUT_FIELDS
#undef X
    };
    static const char* const outputFields[] = {
#define X(field) #field,
        OIPSL_OUTPUT_FIELDS
#undef X
    };
    const size_t nParameters = sizeof(parameterOffsets) / sizeof(parameterOffsets[0]);
    const size_t nInputs = sizeof(inputOffsets) / sizeof(inputOffsets[0]);
    const size_t nOutputs = sizeof(outputOffsets) / sizeof(outputOffsets[0]);
    size_t i;
    char name[160];

    printf("layout_test for library %s, model %s, compiled with %s\n", OIPSL_NAME, info->ModelName,
#if defined(_MSC_VER)
           "MSVC"
#elif defined(__clang__)
           "clang"
#elif defined(__GNUC__)
           "gcc"
#else
           "an unknown compiler"
#endif
    );

    /* The library and this copy of the source describe the same model */
    checkSize(countSize(OIPSL_COUNT_PARAMETERS), (size_t)info->NumParameters, "count(2), parameters", "");
    checkSize(countSize(OIPSL_COUNT_INPUT_PORTS), (size_t)info->NumInputPorts, "count(6), input ports", "");
    checkSize(countSize(OIPSL_COUNT_OUTPUT_PORTS), (size_t)info->NumOutputPorts, "count(7), output ports", "");
    checkSize(countSize(OIPSL_COUNT_DOUBLE_STATES), (size_t)info->NumDoubleStates, "count(3), double states", "");
    checks++;
    if (sampleTime_() == info->FixedStepBaseSampleTime) {
        printf("ok      sampleTime() = %g\n", sampleTime_());
    } else {
        failures++;
        printf("FAILED  sampleTime() = %g (model source: %g)\n", sampleTime_(), info->FixedStepBaseSampleTime);
    }
    /* The field lists of this test cover the structures completely */
    checkSize(nParameters, (size_t)info->NumParameters, "fields listed for MyModelParameters", "");
    checkSize(nInputs, (size_t)info->NumInputPorts, "fields listed for MyModelInputs", "");
    checkSize(nOutputs, (size_t)info->NumOutputPorts, "fields listed for MyModelOutputs", "");

    /* Offsets and sizes: adapter (library) against the model's structures (this compiler) */
    for (i = 0; (i < nParameters) && (i < (size_t)info->NumParameters); i++) {
        snprintf(name, sizeof(name), "%s (ParametersInfo %s)", parameterFields[i], info->ParametersInfo[i].Name);
        checkSize(countSize(OIPSL_COUNT_PARAMETER_OFFSET + (int)i), parameterOffsets[i], "offset of parameter", name);
    }
    checkSize(countSize(OIPSL_COUNT_PARAMETER_BYTES), sizeof(MyModelParameters), "count(12) = sizeof", "MyModelParameters");
    for (i = 0; (i < nInputs) && (i < (size_t)info->NumInputPorts); i++) {
        snprintf(name, sizeof(name), "%s (InputPortsInfo %s)", inputFields[i], info->InputPortsInfo[i].Name);
        checkSize(countSize(OIPSL_COUNT_INPUT_OFFSET + (int)i), inputOffsets[i], "offset of input", name);
    }
    checkSize(countSize(OIPSL_COUNT_INPUT_BYTES), sizeof(MyModelInputs), "count(10) = sizeof", "MyModelInputs");
    for (i = 0; (i < nOutputs) && (i < (size_t)info->NumOutputPorts); i++) {
        snprintf(name, sizeof(name), "%s (OutputPortsInfo %s)", outputFields[i], info->OutputPortsInfo[i].Name);
        checkSize(countSize(OIPSL_COUNT_OUTPUT_OFFSET + (int)i), outputOffsets[i], "offset of output", name);
    }
    checkSize(countSize(OIPSL_COUNT_OUTPUT_BYTES), sizeof(MyModelOutputs), "count(11) = sizeof", "MyModelOutputs");

    printf("%d checks, %d failed\n", checks, failures);
    return failures;
}
