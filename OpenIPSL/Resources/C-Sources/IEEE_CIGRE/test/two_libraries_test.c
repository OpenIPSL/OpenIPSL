/*
File: two_libraries_test.c (OpenIPSL, Resources/C-Sources/IEEE_CIGRE/test)

Test of two IEEE/CIGRE model libraries in one program, linked as a Modelica tool links them when one model uses
both (-lSCRX9 -lGFM_GFL_IBR, or the other order; CMakeLists.txt builds both orders). Both libraries export the
same Model_* entry points; the adapter in each library must still drive its own model. On ELF platforms this
needs the libraries to be linked with -Bsymbolic: without it the adapter of the second library calls the
Model_* functions of the first one (symbol interposition), which this test detects through count(),
sampleTime(), create() and the outputs. Windows DLLs bind their internal calls at link time.
Compiled with -DIEEE_CIGRE_IMPORT. Exit code: number of failed checks (0 = pass).

Copyright (c) 2016-2026 Luigi Vanfretti, ALSETLab (formerly SmarTS Lab) and contributors.
BSD 3-Clause License, see the LICENSE file of OpenIPSL.
*/
#include <math.h>
#include <stddef.h>
#include <stdio.h>

#include "ieee_cigre_export.h"

/* Adapter prototypes of both libraries (oipsl_cigre_adapter.h declares one prefix per compilation) */
#define OIPSL_DECLARE_ADAPTER(P)                                                                               \
    IEEE_CIGRE_EXPORT void* IEEE_CIGRE_CALL P##_oipsl_create(const double* parameters, size_t nParameters,     \
                                                             const double* initialInputs, size_t nInputs,     \
                                                             const double* initialOutputs, size_t nOutputs,   \
                                                             int simToolMode);                                \
    IEEE_CIGRE_EXPORT void IEEE_CIGRE_CALL P##_oipsl_free(void* obj);                                          \
    IEEE_CIGRE_EXPORT int IEEE_CIGRE_CALL P##_oipsl_step(void* obj, double t, const double* inputs,           \
                                                         size_t nInputs, double* outputs, size_t nOutputs);   \
    IEEE_CIGRE_EXPORT double IEEE_CIGRE_CALL P##_oipsl_sampleTime(void);                                       \
    IEEE_CIGRE_EXPORT int IEEE_CIGRE_CALL P##_oipsl_count(int what);

OIPSL_DECLARE_ADAPTER(SCRX9)
OIPSL_DECLARE_ADAPTER(GFM_GFL_IBR)

#define OIPSL_STEPS 2000

static int failures = 0;
static int checks = 0;

static void check(int condition, const char* what, double value)
{
    checks++;
    printf("%s %s: %.15g\n", condition ? "ok     " : "FAILED ", what, value);
    if (!condition) {
        failures++;
    }
    fflush(stdout);
}

int main(void)
{
    /* ParametersInfo defaults of src/SCRX9.c and src/GFM_GFL_IBR.c, in ParametersInfo order */
    static const double scrx9Parameters[8] = {0.1, 10.0, 100.0, 0.05, -5.0, 5.0, 1.0, 10.0};
    static const double gfmParameters[41] = {
        0.65, 1000.0, 1.3, 0.5, 1.0, 0.0, 20.0, 200.0, 12.0, 0.5, 10.0, 1.0, 0.5, 20.0,
        0.5, 150.0, 0.0, 0.0, 1.2, 1.0, 0.0, 1.0, -1.0, 1.0, 30.0, 22.22, 0.0, 0.01,
        0.01, 0.001, -0.5, 0.5, 0.8, 1.2, 3.0, 10.0, 0.001, 0.0, 0.15, 0.01666, 9.4868};
    /* SCRX9 steady start (as in adapter_test.c): VRef = Ec = 1, VT = 1, EFD0 = 1.3; GFM_GFL_IBR at rest */
    static const double scrx9Inputs[7] = {1.0, 1.0, 0.0, 1.32497, 1.0, 0.0, 0.0};
    static const double scrx9Output0[1] = {1.3};
    static const double gfmInputs[12] = {0.0};
    static const double gfmOutputs0[12] = {0.0};
    double scrx9Output[1] = {0.0};
    double gfmOutputs[12] = {0.0};
    double maxDeviation = 0.0;
    void* scrx9;
    void* gfm;
    int rc = 0;
    int finite = 1;
    int k;
    int j;

    printf("two_libraries_test: SCRX9 and GFM_GFL_IBR in one program\n");
    check(SCRX9_oipsl_count(0) == 7, "SCRX9_oipsl_count(0) = 7 scalar inputs", (double)SCRX9_oipsl_count(0));
    check(SCRX9_oipsl_count(2) == 8, "SCRX9_oipsl_count(2) = 8 parameters", (double)SCRX9_oipsl_count(2));
    check(SCRX9_oipsl_count(3) == 6, "SCRX9_oipsl_count(3) = 6 double states", (double)SCRX9_oipsl_count(3));
    check(SCRX9_oipsl_sampleTime() == 0.005, "SCRX9_oipsl_sampleTime() = 0.005 s", SCRX9_oipsl_sampleTime());
    check(GFM_GFL_IBR_oipsl_count(0) == 12, "GFM_GFL_IBR_oipsl_count(0) = 12 scalar inputs",
          (double)GFM_GFL_IBR_oipsl_count(0));
    check(GFM_GFL_IBR_oipsl_count(2) == 41, "GFM_GFL_IBR_oipsl_count(2) = 41 parameters",
          (double)GFM_GFL_IBR_oipsl_count(2));
    check(GFM_GFL_IBR_oipsl_count(3) == 36, "GFM_GFL_IBR_oipsl_count(3) = 36 double states",
          (double)GFM_GFL_IBR_oipsl_count(3));
    check(GFM_GFL_IBR_oipsl_sampleTime() == 1e-5, "GFM_GFL_IBR_oipsl_sampleTime() = 1e-5 s",
          GFM_GFL_IBR_oipsl_sampleTime());

    scrx9 = SCRX9_oipsl_create(scrx9Parameters, 8, scrx9Inputs, 7, scrx9Output0, 1, 2);
    gfm = GFM_GFL_IBR_oipsl_create(gfmParameters, 41, gfmInputs, 12, gfmOutputs0, 12, 1);
    check(scrx9 != NULL, "SCRX9_oipsl_create (defaults, steady start, RMS) returns an object", scrx9 != NULL);
    check(gfm != NULL, "GFM_GFL_IBR_oipsl_create (defaults, at rest, EMT) returns an object", gfm != NULL);
    if ((scrx9 != NULL) && (gfm != NULL)) {
        /* Both instances stepped interleaved */
        for (k = 0; k < OIPSL_STEPS; k++) {
            rc |= SCRX9_oipsl_step(scrx9, k * 0.005, scrx9Inputs, 7, scrx9Output, 1);
            rc |= GFM_GFL_IBR_oipsl_step(gfm, k * 1e-5, gfmInputs, 12, gfmOutputs, 12);
            if (fabs(scrx9Output[0] - 1.3) > maxDeviation) {
                maxDeviation = fabs(scrx9Output[0] - 1.3);
            }
            for (j = 0; j < 12; j++) {
                if (!(gfmOutputs[j] == gfmOutputs[j]) || (fabs(gfmOutputs[j]) > 1e300)) {
                    finite = 0;
                }
            }
        }
        check(rc == 0, "2000 interleaved steps of both return 0", (double)rc);
        check(maxDeviation < 1e-12, "SCRX9: EFD stays at EFD0 = 1.3, max |EFD - 1.3|", maxDeviation);
        check(finite, "GFM_GFL_IBR: all 12 outputs finite", (double)finite);
        check(fabs(gfmOutputs[9] - 60.0) < 1e-9, "GFM_GFL_IBR: Freq_pll = 60 Hz", gfmOutputs[9]);
    }
    SCRX9_oipsl_free(scrx9);
    GFM_GFL_IBR_oipsl_free(gfm);

    printf("%d checks, %d failed\n", checks, failures);
    return failures;
}
