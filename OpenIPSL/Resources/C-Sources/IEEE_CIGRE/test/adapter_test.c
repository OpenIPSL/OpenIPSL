/*
File: adapter_test.c (OpenIPSL, Resources/C-Sources/IEEE_CIGRE/test)

Test of one IEEE/CIGRE model library through its OpenIPSL adapter, as a simulation tool uses it: the program
links against the shared library (import library on Windows) and calls only exported functions. Compiled once
per model with -DOIPSL_PREFIX=<Name> -DIEEE_CIGRE_IMPORT and -DOIPSL_TEST_SCRX9 or -DOIPSL_TEST_GFM_GFL_IBR
(see CMakeLists.txt). For each model it checks
  - count() and sampleTime() against Model_GetInfo() and the known model data,
  - the layout of the parameter block (SCRX9: 64 bytes, CSwitch at 48, RCdRFD at 56; GFM_GFL_IBR: 41 doubles),
  - a steady start: create with the ParametersInfo defaults and the initial inputs and outputs that
    Model_Initialize works back from, 2000 steps with constant inputs, outputs finite and settled,
  - model-specific behaviour that depends on the parameter layout and on the initialisation,
  - the error paths (size mismatches, rejected parameters, simToolMode other than 1 or 2, NULL objects).
Messages printed by the library on stderr during the error-path checks are expected.
Exit code: number of failed checks (0 = pass).

Copyright (c) 2016-2026 Luigi Vanfretti, ALSETLab (formerly SmarTS Lab) and contributors.
BSD 3-Clause License, see the LICENSE file of OpenIPSL.
*/
#include <math.h>
#include <stdio.h>
#include <string.h>

#include "ieee_cigre_export.h"
#include "oipsl_cigre_adapter.h"

#define OIPSL_TEST_STEPS 2000
#define OIPSL_TEST_MAX_VALUES 64

#define create_ OIPSL_FUNCTION(_oipsl_create)
#define free_ OIPSL_FUNCTION(_oipsl_free)
#define step_ OIPSL_FUNCTION(_oipsl_step)
#define sampleTime_ OIPSL_FUNCTION(_oipsl_sampleTime)
#define count_ OIPSL_FUNCTION(_oipsl_count)
#define status_ OIPSL_FUNCTION(_oipsl_status)

static int failures = 0;
static int checks = 0;

static void check(int condition, const char* what)
{
    checks++;
    if (condition) {
        printf("ok      %s\n", what);
    } else {
        failures++;
        printf("FAILED  %s\n", what);
    }
    fflush(stdout);
}

static void checkInt(int value, int expected, const char* what)
{
    char text[512];
    snprintf(text, sizeof(text), "%.300s = %d (expected %d)", what, value, expected);
    check(value == expected, text);
}

static void checkReal(double value, double expected, double tolerance, const char* what)
{
    char text[512];
    snprintf(text, sizeof(text), "%.300s = %.15g (expected %.15g, tolerance %g)", what, value, expected, tolerance);
    check(fabs(value - expected) <= tolerance, text);
}

static int allFinite(const double* v, size_t n)
{
    size_t i;
    for (i = 0; i < n; i++) {
        if (!(v[i] == v[i]) || (fabs(v[i]) > 1e300)) {
            return 0;
        }
    }
    return 1;
}

/* Parameter vector from the ParametersInfo defaults (numeric types only) */
static size_t defaultParameters(double* p, size_t capacity)
{
    const IEEE_Cigre_DLLInterface_Model_Info* info = Model_GetInfo();
    int32_T i;
    for (i = 0; (i < info->NumParameters) && ((size_t)i < capacity); i++) {
        const IEEE_Cigre_DLLInterface_Parameter* q = &info->ParametersInfo[i];
        switch ((int)q->DataType) {
        case IEEE_Cigre_DLLInterface_DataType_int32_T:
            p[i] = (double)q->DefaultValue.Int32_Val;
            break;
        case IEEE_Cigre_DLLInterface_DataType_real64_T:
            p[i] = q->DefaultValue.Real64_Val;
            break;
        default:
            p[i] = 0.0;
            break;
        }
    }
    return (size_t)info->NumParameters;
}

static int parameterIndex(const char* name)
{
    const IEEE_Cigre_DLLInterface_Model_Info* info = Model_GetInfo();
    int32_T i;
    for (i = 0; i < info->NumParameters; i++) {
        if (strcmp(info->ParametersInfo[i].Name, name) == 0) {
            return (int)i;
        }
    }
    return -1;
}

/* Checks shared by both models */
static void commonChecks(int nIn, int nOut, int nPar, int nDouble, double Ts, int parameterBytes)
{
    const IEEE_Cigre_DLLInterface_Model_Info* info = Model_GetInfo();
    int i;
    char text[128];
    check(info != NULL, "Model_GetInfo() returns the model information");
    printf("model   %s, version %s, interface %d.%d.%d.%d, library %s\n", info->ModelName, info->ModelVersion,
           (int)info->DLLInterfaceVersion[0], (int)info->DLLInterfaceVersion[1], (int)info->DLLInterfaceVersion[2],
           (int)info->DLLInterfaceVersion[3], OIPSL_NAME);
    checkInt(count_(OIPSL_COUNT_INPUTS), nIn, "count(0), scalar inputs");
    checkInt(count_(OIPSL_COUNT_OUTPUTS), nOut, "count(1), scalar outputs");
    checkInt(count_(OIPSL_COUNT_PARAMETERS), nPar, "count(2), parameters");
    checkInt(count_(OIPSL_COUNT_DOUBLE_STATES), nDouble, "count(3), double states");
    checkInt(count_(OIPSL_COUNT_INT_STATES), 0, "count(4), int states");
    checkInt(count_(OIPSL_COUNT_FLOAT_STATES), 0, "count(5), float states");
    checkInt(count_(OIPSL_COUNT_INPUT_PORTS), (int)info->NumInputPorts, "count(6) = Model_Info.NumInputPorts");
    checkInt(count_(OIPSL_COUNT_OUTPUT_PORTS), (int)info->NumOutputPorts, "count(7) = Model_Info.NumOutputPorts");
    checkInt(count_(OIPSL_COUNT_INPUT_BYTES), 8 * nIn, "count(10), input block bytes (all real64_T)");
    checkInt(count_(OIPSL_COUNT_OUTPUT_BYTES), 8 * nOut, "count(11), output block bytes (all real64_T)");
    checkInt(count_(OIPSL_COUNT_PARAMETER_BYTES), parameterBytes, "count(12), parameter block bytes");
    for (i = 0; i < nIn; i++) {
        snprintf(text, sizeof(text), "count(%d), offset of input %s", OIPSL_COUNT_INPUT_OFFSET + i,
                 info->InputPortsInfo[i].Name);
        checkInt(count_(OIPSL_COUNT_INPUT_OFFSET + i), 8 * i, text);
    }
    checkInt(count_(OIPSL_COUNT_PARAMETER_OFFSET + nPar), -1, "count() of a parameter index out of range");
    checkInt(count_(99), -1, "count() of an unknown request");
    checkReal(sampleTime_(), Ts, 0.0, "sampleTime() = Model_Info.FixedStepBaseSampleTime");
    checkInt(status_(NULL), OIPSL_STATUS_NO_OBJECT, "status(NULL)");
    free_(NULL);
    check(1, "free(NULL) is a no-op");
}

#if defined(OIPSL_TEST_SCRX9)

/* SCRX9: inputs VRef, Ec, Vs, IFD, VT, VUEL, VOEL; output EFD */
static void runModelTests(void)
{
    double p[OIPSL_TEST_MAX_VALUES];
    double pBusFed[OIPSL_TEST_MAX_VALUES];
    double u[7] = {1.0, 1.0, 0.0, 1.32497, 1.0, 0.0, 0.0};
    double uA[7];
    double uB[7];
    double y0[1] = {1.3};
    double y[1] = {0.0};
    double yB[1] = {0.0};
    double maxDeviation = 0.0;
    double lastChange = 0.0;
    double previous = y0[0];
    double Ts = sampleTime_();
    size_t nPar;
    int k;
    int rc = 0;
    int finite = 1;
    void* obj;
    void* objA;
    void* objB;
    char text[256];
    int cswitch = parameterIndex("CSwitch");
    int rcdrfd = parameterIndex("RCdRFD");

    commonChecks(7, 1, 8, 6, 0.005, 64);
    checkInt(cswitch, 6, "ParametersInfo index of CSwitch");
    checkInt(rcdrfd, 7, "ParametersInfo index of RCdRFD");
    checkInt((int)Model_GetInfo()->ParametersInfo[cswitch].DataType, IEEE_Cigre_DLLInterface_DataType_int32_T,
             "CSwitch DataType is int32_T");
    for (k = 0; k < 6; k++) {
        snprintf(text, sizeof(text), "count(%d), offset of parameter %s", OIPSL_COUNT_PARAMETER_OFFSET + k,
                 Model_GetInfo()->ParametersInfo[k].Name);
        checkInt(count_(OIPSL_COUNT_PARAMETER_OFFSET + k), 8 * k, text);
    }
    checkInt(count_(OIPSL_COUNT_PARAMETER_OFFSET + 6), 48, "count(1006), offset of parameter CSwitch (int32_T)");
    checkInt(count_(OIPSL_COUNT_PARAMETER_OFFSET + 7), 56, "count(1007), offset of parameter RCdRFD");

    /* Steady start: EFD0 = 1.3, VRef = Ec, so that the controller holds EFD (Model_Initialize works back) */
    nPar = defaultParameters(p, OIPSL_TEST_MAX_VALUES);
    obj = create_(p, nPar, u, 7, y0, 1, 2);
    check(obj != NULL, "create(defaults, steady inputs, EFD0 = 1.3, RMS) returns an object");
    if (obj == NULL) {
        return;
    }
    checkInt(status_(obj), OIPSL_STATUS_OK, "status after create");
    for (k = 0; k < OIPSL_TEST_STEPS; k++) {
        rc |= step_(obj, k * Ts, u, 7, y, 1);
        finite = finite && allFinite(y, 1);
        if (fabs(y[0] - y0[0]) > maxDeviation) {
            maxDeviation = fabs(y[0] - y0[0]);
        }
        lastChange = fabs(y[0] - previous);
        previous = y[0];
    }
    checkInt(rc, OIPSL_STATUS_OK, "2000 steps return 0");
    check(finite, "EFD finite in all 2000 steps");
    snprintf(text, sizeof(text), "EFD stays at EFD0 = 1.3 for 2000 steps (10 s): max |EFD - 1.3| = %.3g", maxDeviation);
    check(maxDeviation < 1e-12, text);
    snprintf(text, sizeof(text), "EFD settled: last step change %.3g", lastChange);
    check(lastChange < 1e-14, text);
    checkReal(y[0], 1.3, 1e-12, "EFD after 2000 steps");

    /* Error paths */
    checkInt(step_(obj, 10.0, u, 6, y, 1), OIPSL_STATUS_SIZE_MISMATCH, "step with 6 inputs (size mismatch)");
    checkInt(status_(obj), OIPSL_STATUS_SIZE_MISMATCH, "status after the size mismatch");
    checkInt(step_(NULL, 0.0, u, 7, y, 1), OIPSL_STATUS_NO_OBJECT, "step(NULL)");
    free_(obj);
    check(create_(p, nPar - 1, u, 7, y0, 1, 2) == NULL, "create with 7 parameters returns NULL");
    check(create_(p, nPar, u, 7, y0, 0, 2) == NULL, "create with 0 initial outputs returns NULL");
    check(create_(p, nPar, u, 7, y0, 1, 0) == NULL, "create with simToolMode 0 returns NULL (only 1 = EMT, 2 = RMS)");
    check(create_(p, nPar, u, 7, y0, 1, 3) == NULL, "create with simToolMode 3 returns NULL");

    /* Parameter layout seen through the model's behaviour. A VT step changes EFD only when CSwitch = 0
       (bus-fed: EFD = OControl * VT), so a misplaced CSwitch would show; IFD < 0 gives EFD = -IFD * RCdRFD,
       so a misplaced RCdRFD would show. Two instances are stepped interleaved (instance independence). */
    memcpy(pBusFed, p, sizeof(p));
    pBusFed[cswitch] = 0.0;
    memcpy(uA, u, sizeof(u));
    memcpy(uB, u, sizeof(u));
    uA[4] = 0.5;
    uB[4] = 0.5;
    objA = create_(p, nPar, uA, 7, y0, 1, 2);
    objB = create_(pBusFed, nPar, uB, 7, y0, 1, 2);
    check((objA != NULL) && (objB != NULL), "create two instances, CSwitch = 1 and CSwitch = 0, VT = 0.5");
    if ((objA == NULL) || (objB == NULL)) {
        free_(objA);
        free_(objB);
        return;
    }
    for (k = 0; k < 10; k++) {
        (void)step_(objA, k * Ts, uA, 7, y, 1);
        (void)step_(objB, k * Ts, uB, 7, yB, 1);
    }
    checkReal(y[0], 1.3, 1e-12, "CSwitch = 1, VT = 0.5: EFD steady");
    checkReal(yB[0], 1.3, 1e-12, "CSwitch = 0, VT = 0.5: EFD steady (OControl = 2.6)");
    uA[4] = 0.6;
    uB[4] = 0.6;
    (void)step_(objA, 10 * Ts, uA, 7, y, 1);
    (void)step_(objB, 10 * Ts, uB, 7, yB, 1);
    checkReal(y[0], 1.3, 1e-12, "CSwitch = 1 (int32 at byte 48): VT 0.5 -> 0.6 leaves EFD at 1.3");
    checkReal(yB[0], 1.56, 1e-12, "CSwitch = 0 (int32 at byte 48): VT 0.5 -> 0.6 gives EFD = 2.6 * 0.6 = 1.56");
    uA[3] = -0.1;
    (void)step_(objA, 11 * Ts, uA, 7, y, 1);
    checkReal(y[0], 1.0, 1e-12, "IFD = -0.1 gives EFD = -IFD * RCdRFD = 1.0 (RCdRFD = 10 read at byte 56)");
    free_(objA);
    free_(objB);
}

#elif defined(OIPSL_TEST_GFM_GFL_IBR)

/* GFM_GFL_IBR: inputs Va, Vb, Vc, Ia, Ib, Ic, IaL1, IbL1, IcL1, Pref, Qref, Vref;
   outputs Ea, Eb, Ec, Idref, Id, Iqref, Iq, Vd, Vq, Freq_pll, Pelec, Qelec */
static void runModelTests(void)
{
    double p[OIPSL_TEST_MAX_VALUES];
    double pBad[OIPSL_TEST_MAX_VALUES];
    double u[12];
    double y0[12];
    double y[12];
    double yPrevious[12];
    double expected[12] = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 60.0, 0.0, 0.0};
    double maxChange = 0.0;
    double amplitude = 0.0;
    double amplitudeMin = 1e300;
    double amplitudeMax = 0.0;
    double maxSum = 0.0;
    double Ts = sampleTime_();
    double Sbase;
    double Vdcbase;
    size_t nPar;
    int k;
    int j;
    int rc = 0;
    int finite = 1;
    int ok = 1;
    void* obj;
    char text[256];
    int iWtype = parameterIndex("Wtype");
    int iPQflag = parameterIndex("PQflag");

    commonChecks(12, 12, 41, 36, 1e-5, 41 * 8);
    for (k = 0; k < 41; k++) {
        if (count_(OIPSL_COUNT_PARAMETER_OFFSET + k) != 8 * k) {
            ok = 0;
        }
        if ((int)Model_GetInfo()->ParametersInfo[k].DataType != IEEE_Cigre_DLLInterface_DataType_real64_T) {
            ok = 0;
        }
    }
    check(ok, "41 real64_T parameters at offsets 0, 8, ..., 320 (block of 41 * 8 = 328 bytes)");
    checkInt(iWtype, 5, "ParametersInfo index of Wtype");
    checkInt(iPQflag, 23, "ParametersInfo index of PQflag");

    /* Rest state: no voltage, no current, zero references, zero initial outputs (Model_Initialize seeds the
       power states from Pout and Qout, here 0). The angle turns at 60 Hz, so Ea, Eb, Ec are a balanced
       three-phase set whose amplitude settles; the other outputs settle to constants. */
    nPar = defaultParameters(p, OIPSL_TEST_MAX_VALUES);
    Sbase = p[1];
    Vdcbase = p[2];
    memset(u, 0, sizeof(u));
    memset(y0, 0, sizeof(y0));
    memset(y, 0, sizeof(y));
    obj = create_(p, nPar, u, 12, y0, 12, 1);
    check(obj != NULL, "create(defaults, zero inputs, zero initial outputs, EMT) returns an object");
    if (obj == NULL) {
        return;
    }
    checkInt(status_(obj), OIPSL_STATUS_OK, "status after create");
    for (k = 0; k < OIPSL_TEST_STEPS; k++) {
        memcpy(yPrevious, y, sizeof(y));
        rc |= step_(obj, k * Ts, u, 12, y, 12);
        finite = finite && allFinite(y, 12);
        if (k >= OIPSL_TEST_STEPS - 100) {
            for (j = 3; j < 12; j++) {
                if (fabs(y[j] - yPrevious[j]) > maxChange) {
                    maxChange = fabs(y[j] - yPrevious[j]);
                }
            }
            amplitude = sqrt((2.0 / 3.0) * (y[0] * y[0] + y[1] * y[1] + y[2] * y[2]));
            if (amplitude < amplitudeMin) {
                amplitudeMin = amplitude;
            }
            if (amplitude > amplitudeMax) {
                amplitudeMax = amplitude;
            }
            if (fabs(y[0] + y[1] + y[2]) > maxSum) {
                maxSum = fabs(y[0] + y[1] + y[2]);
            }
        }
    }
    checkInt(rc, OIPSL_STATUS_OK, "2000 steps return 0");
    check(finite, "all 12 outputs finite in all 2000 steps (0.02 s)");
    snprintf(text, sizeof(text), "outputs 4-12 settled: max change over the last 100 steps %.3g", maxChange);
    check(maxChange < 1e-12, text);
    for (j = 3; j < 12; j++) {
        snprintf(text, sizeof(text), "output %s after 2000 steps", Model_GetInfo()->OutputPortsInfo[j].Name);
        checkReal(y[j], expected[j], 1e-9, text);
    }
    snprintf(text, sizeof(text),
             "Ea, Eb, Ec balanced and settled: amplitude in [%.12g, %.12g] kV over the last 100 steps, max |Ea+Eb+Ec| = %.3g",
             amplitudeMin, amplitudeMax, maxSum);
    check((amplitudeMax - amplitudeMin < 1e-9) && (maxSum < 1e-6), text);
    checkReal(amplitude, 0.2 * Vdcbase / 2.0, 1e-6,
              "phase voltage amplitude = minimum modulation index 0.2 * Vdcbase / 2 (kV)");
    free_(obj);

    /* Initial outputs seed the integrators (change 5 of the provenance block): Pout0 = 0.5 Sbase and
       Qout0 = 0.2 Sbase give Idref = 0.5 and Iqref = 0.2 at the first step (PR #362 gave 0 and 0). */
    y0[10] = 0.5 * Sbase;
    y0[11] = 0.2 * Sbase;
    obj = create_(p, nPar, u, 12, y0, 12, 1);
    check(obj != NULL, "create with Pout0 = 0.5 Sbase, Qout0 = 0.2 Sbase");
    if (obj != NULL) {
        checkInt(step_(obj, 0.0, u, 12, y, 12), OIPSL_STATUS_OK, "first step returns 0");
        checkReal(y[3], 0.5, 1e-12, "Idref at the first step = Pout0 / Sbase");
        checkReal(y[5], 0.2, 1e-12, "Iqref at the first step = Qout0 / Sbase");
        free_(obj);
    }

    /* Error paths */
    memset(y0, 0, sizeof(y0));
    check(create_(p, nPar, u, 11, y0, 12, 1) == NULL, "create with 11 initial inputs returns NULL");
    check(create_(p, nPar, u, 12, y0, 12, 300) == NULL, "create with simToolMode 300 returns NULL");
    memcpy(pBad, p, sizeof(p));
    pBad[iWtype] = 2.0;
    check(create_(pBad, nPar, u, 12, y0, 12, 1) == NULL, "create with Wtype = 2 (VSM, not implemented) returns NULL");
    memcpy(pBad, p, sizeof(p));
    pBad[iPQflag] = 0.5;
    check(create_(pBad, nPar, u, 12, y0, 12, 1) == NULL, "create with PQflag = 0.5 returns NULL");
    memcpy(pBad, p, sizeof(p));
    pBad[iWtype] = 1.0;
    pBad[iPQflag] = 0.0;
    obj = create_(pBad, nPar, u, 12, y0, 12, 1);
    check(obj != NULL, "create with Wtype = 1 (droop) and PQflag = 0 (P priority) returns an object");
    if (obj != NULL) {
        checkInt(step_(obj, 0.0, u, 12, y, 12), OIPSL_STATUS_OK, "droop mode: first step returns 0");
        check(allFinite(y, 12), "droop mode: outputs finite");
        checkInt(step_(obj, Ts, u, 12, y, 11), OIPSL_STATUS_SIZE_MISMATCH, "step with 11 outputs (size mismatch)");
        free_(obj);
    }
}

#else
#  error "Define OIPSL_TEST_SCRX9 or OIPSL_TEST_GFM_GFL_IBR"
#endif

int main(void)
{
    printf("adapter_test for library %s\n", OIPSL_NAME);
    runModelTests();
    printf("%d checks, %d failed\n", checks, failures);
    return failures;
}
