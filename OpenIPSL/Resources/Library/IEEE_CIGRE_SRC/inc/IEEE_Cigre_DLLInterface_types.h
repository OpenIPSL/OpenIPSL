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