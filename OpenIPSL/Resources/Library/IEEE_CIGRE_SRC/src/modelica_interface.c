#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define PI 3.14159265

#include "IEEE_Cigre_DLLInterface.h"

typedef int int32_T;
typedef int32_T(__cdecl* ModelOutputsFunc)(IEEE_Cigre_DLLInterface_Instance* instance);
typedef int32_T(__cdecl* ModelInitializeFunc)(IEEE_Cigre_DLLInterface_Instance* instance);


extern void* init_gfm_model(IEEE_Cigre_DLLInterface_Instance* instance)
{
	IEEE_Cigre_DLLInterface_Instance* instance = (IEEE_Cigre_DLLInterface_Instance*)malloc(sizeof(IEEE_Cigre_DLLInterface_Instance));

	HINSTANCE hDll = LoadLibrary("GFM_GFL_IBR.dll");

	ModelInitializeFunc Model_Initialize = (ModelInitializeFunc)GetProcAddress(hDll, "Model_Initialize");
	ModelOutputsFunc Model_Outputs = (ModelOutputsFunc)GetProcAddress(hDll, "Model_Outputs");

    MyModelInputs* inputs = (MyModelInputs*)malloc(sizeof(MyModelInputs));

    inputs->Va;
    inputs->Vb;
    inputs->Vc;
    inputs->Ia;
    inputs->Ib;
    inputs->Ic;
    inputs->IaL1;
    inputs->IbL1;
    inputs->IcL1;
    inputs->Pref;
    inputs->Qref;
    inputs->Vref;

    instance->ExternalInputs = inputs;

    MyModelOutputs* outputs = (MyModelOutputs*)malloc(sizeof(MyModelOutputs));
    outputs->Ea = 0;
    outputs->Eb = 0;
    outputs->Ec = 0;
    outputs->Idrefout = 0;
    outputs->Idout = 0;
    outputs->Iqrefout = 0;
    outputs->Iqout = 0;
    outputs->Vdout = 0;
    outputs->Vqout = 0;
    outputs->Freqpll = 0;
    outputs->Pout = 0;
    outputs->Qout = 0;

    instance->ExternalOutputs = outputs;

    MyModelParameters* model_parameters = (MyModelParameters*)malloc(sizeof(MyModelParameters));

    model_parameters->Vbase = Vbase;
    model_parameters->Sbase = Sbase;
    model_parameters->Vdcbase = VDC_base;
    model_parameters->KpI = 0.5;
    model_parameters->KiI = 1.0;
    model_parameters->wtype = w_type;
    model_parameters->KpPLL = 20;
    model_parameters->KiPLL = 200;
    model_parameters->del_f_limit = 12;
    model_parameters->KpP = 0.5;
    model_parameters->KiP = 10;
    model_parameters->Qflag = 1;
    model_parameters->KpQ = 0.5;
    model_parameters->KiQ = 20;
    model_parameters->KpV = 0.5;
    model_parameters->KiV = 150;
    model_parameters->KpVq = 0;
    model_parameters->KiVq = 0;
    model_parameters->Imax = 1.2;
    model_parameters->Pmax = 1;
    model_parameters->Pmin = 0;
    model_parameters->Qmax = 1;
    model_parameters->Qmin = -1;
    model_parameters->PQflag = 1;
    model_parameters->KfDroop = 33;
    model_parameters->KvDroop = 3;
    model_parameters->K_POD = 0;
    model_parameters->T_POD = 0.01;
    model_parameters->T1_POD = 0.01;
    model_parameters->T2_POD = 0.001;
    model_parameters->POD_min = -0.5;
    model_parameters->POD_max = 0.5;
    model_parameters->Vdip = 0.8;
    model_parameters->Vup = 1.2;
    model_parameters->KpVdq = 3;
    model_parameters->KiVdq = 10;
    model_parameters->Tr = 0.001;
    model_parameters->Rchoke = 0;
    model_parameters->Lchoke = 0.15;
    model_parameters->Cfilt = 0.01666;
    model_parameters->Rdamp = 9.4868;

    instance->Parameters = model_parameters;

    double* states = malloc(36 * sizeof(double));
    instance->DoubleStates = states;

    Model_Initialize(instance);

    return (void*)instance;

}
