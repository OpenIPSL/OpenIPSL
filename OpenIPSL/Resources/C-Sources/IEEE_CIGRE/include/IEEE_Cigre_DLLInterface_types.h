/*
Provenance (block added for OpenIPSL, 2026-10-25, origin corrected 2026-10-28; the original header comment
follows unchanged)
File: OpenIPSL/Resources/C-Sources/IEEE_CIGRE/include/IEEE_Cigre_DLLInterface_types.h
Interface file of the IEEE/CIGRE DLL Modeling Standard, API V2, published in CIGRE Technical Brochure 958,
Appendix D: CIGRE JWG B4.82/IEEE, "Guidelines for use of real-code in EMT models for HVDC, FACTs and inverter
based generators in power systems analysis," Technical Brochure 958, Paris, 2025. Copyright CIGRE and IEEE;
not covered by the OpenIPSL licence.
The original is the file of the same name in the folder DLL_V1_1 of the example code distributed by CIGRE JWG
B4.82 (file date 2022-02-14, SHA-256 1e7bc245b46a1dd6bc9c2aa5f4a24cefc88646e7d1ffe1098d64d64f3fee9f0a). It
reached OpenIPSL unchanged through pull request #362 by Hao Chang (head 3c15968f, file
OpenIPSL/Resources/Library/IEEE_CIGRE_SRC/inc/IEEE_Cigre_DLLInterface_types.h). Apart from this block, LF line
endings and a final newline the file is identical to the original. Its code matches the text of TB 958
Appendix D token for token (compared on 2026-10-28).
*/
/*
* File: IEEE_Cigre_DLLInterface_types.h
*/
typedef char            char_T;
typedef char            int8_T;
typedef unsigned char   uint8_T;
typedef short           int16_T;
typedef unsigned short  uint16_T;
typedef int             int32_T;
typedef unsigned int    uint32_T;
typedef float           real32_T;
typedef double          real64_T;


enum IEEE_Cigre_DLLInterface_DataType {
    IEEE_Cigre_DLLInterface_DataType_char_T     = 1,
    IEEE_Cigre_DLLInterface_DataType_int8_T     = 2,
    IEEE_Cigre_DLLInterface_DataType_uint8_T    = 3,
    IEEE_Cigre_DLLInterface_DataType_int16_T    = 4,
    IEEE_Cigre_DLLInterface_DataType_uint16_T   = 5,
    IEEE_Cigre_DLLInterface_DataType_int32_T    = 6,
    IEEE_Cigre_DLLInterface_DataType_uint32_T   = 7,
    IEEE_Cigre_DLLInterface_DataType_real32_T   = 8,
    IEEE_Cigre_DLLInterface_DataType_real64_T   = 9,
    IEEE_Cigre_DLLInterface_DataType_c_string_T = 10  // c_string is used to indicate a c-style null terminated char string
};

enum IEEE_Cigre_DLLInterface_Return_Value {
    IEEE_Cigre_DLLInterface_Return_OK = 0,
    IEEE_Cigre_DLLInterface_Return_Message = 1,
    IEEE_Cigre_DLLInterface_Return_Error = 2
};