/*
File: ieee_cigre_export.h (OpenIPSL, Resources/C-Sources/IEEE_CIGRE/include)

Export and calling-convention macros and prototypes of the entry points of the IEEE/CIGRE DLL Modeling
Standard (API V2), so that one model source builds unchanged as a Windows DLL (MSVC or MinGW) and as a Linux
shared object (gcc). Written for OpenIPSL on 2026-10-25; the two macros replace, in the same positions, the
"__declspec(dllexport) <type> __cdecl <name>" decorations and the #include <windows.h> of the model sources in
OpenIPSL pull request #362:  IEEE_CIGRE_EXPORT <type> IEEE_CIGRE_CALL <name>(...).
(One macro in front of the type cannot carry the calling convention: MSVC rejects "__cdecl <type> <name>".)
The standard's own headers (IEEE_Cigre_DLLInterface.h, IEEE_Cigre_DLLInterface_types.h) keep their content as
distributed in PR #362, without the PR's rec_struct and with an OpenIPSL provenance block added at the top.

IEEE_CIGRE_EXPORT expands to
  - nothing                                   when IEEE_CIGRE_STATIC is defined (model linked statically,
                                              e.g. into a test program, so that nothing is re-exported);
  - __declspec(dllimport)                     on Windows when IEEE_CIGRE_IMPORT is defined (a program that
                                              links against the DLL, e.g. test/adapter_test.c);
  - __declspec(dllexport)                     on Windows otherwise (building the DLL);
  - __attribute__((visibility("default")))    with gcc/clang elsewhere (the library is compiled with
                                              -fvisibility=hidden, so only marked functions are exported).
IEEE_CIGRE_CALL expands to __cdecl on Windows (the convention the standard prescribes; on x64 it is the only
one) and to nothing elsewhere.

Copyright (c) 2016-2026 Luigi Vanfretti, ALSETLab (formerly SmarTS Lab) and contributors.
BSD 3-Clause License, see the LICENSE file of OpenIPSL.
*/
#ifndef OIPSL_IEEE_CIGRE_EXPORT_H
#define OIPSL_IEEE_CIGRE_EXPORT_H

#if defined(IEEE_CIGRE_STATIC)
#  define IEEE_CIGRE_EXPORT
#elif defined(_WIN32)
#  if defined(IEEE_CIGRE_IMPORT)
#    define IEEE_CIGRE_EXPORT __declspec(dllimport)
#  else
#    define IEEE_CIGRE_EXPORT __declspec(dllexport)
#  endif
#elif defined(__GNUC__) && (__GNUC__ >= 4)
#  define IEEE_CIGRE_EXPORT __attribute__((visibility("default")))
#else
#  define IEEE_CIGRE_EXPORT
#endif

#if defined(_WIN32)
#  define IEEE_CIGRE_CALL __cdecl
#else
#  define IEEE_CIGRE_CALL
#endif

#include "IEEE_Cigre_DLLInterface.h"

#ifdef __cplusplus
extern "C" {
#endif

/* The eight entry points of the standard (header IEEE_Cigre_DLLInterface.h describes them as function
   pointer types). Model_FirstCall and Model_Iterate are optional; the models shipped with OpenIPSL
   (SCRX9, GFM_GFL_IBR) implement the other six. Return codes: IEEE_Cigre_DLLInterface_Return_Value. */
IEEE_CIGRE_EXPORT const IEEE_Cigre_DLLInterface_Model_Info* IEEE_CIGRE_CALL Model_GetInfo(void);
IEEE_CIGRE_EXPORT int32_T IEEE_CIGRE_CALL Model_FirstCall(IEEE_Cigre_DLLInterface_Instance* instance);
IEEE_CIGRE_EXPORT int32_T IEEE_CIGRE_CALL Model_CheckParameters(IEEE_Cigre_DLLInterface_Instance* instance);
IEEE_CIGRE_EXPORT int32_T IEEE_CIGRE_CALL Model_Initialize(IEEE_Cigre_DLLInterface_Instance* instance);
IEEE_CIGRE_EXPORT int32_T IEEE_CIGRE_CALL Model_Outputs(IEEE_Cigre_DLLInterface_Instance* instance);
IEEE_CIGRE_EXPORT int32_T IEEE_CIGRE_CALL Model_Iterate(IEEE_Cigre_DLLInterface_Instance* instance);
IEEE_CIGRE_EXPORT int32_T IEEE_CIGRE_CALL Model_Terminate(IEEE_Cigre_DLLInterface_Instance* instance);
IEEE_CIGRE_EXPORT int32_T IEEE_CIGRE_CALL Model_PrintInfo(void);

#ifdef __cplusplus
}
#endif

#endif /* OIPSL_IEEE_CIGRE_EXPORT_H */
