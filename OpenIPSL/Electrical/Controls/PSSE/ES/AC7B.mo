within OpenIPSL.Electrical.Controls.PSSE.ES;
model AC7B
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  import OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.invFEX;
  import OpenIPSL.NonElectrical.Functions.SE;
  parameter Real T_R "Filter time constant (s)";
  parameter Real K_PR "Voltage regulator proportional gain (pu)";
  parameter Real K_IR "Voltage regulator integral gain (pu)";
  parameter Real K_DR "Voltage regulator derivative gain (pu)";
  parameter Real T_DR "Lag time constant (s)";
  parameter Real V_RMIN "Minimum voltage regulator output (pu)";
  parameter Real V_RMAX "Maximum voltage regulator output (pu)";
  parameter Real K_PA "Voltage regulator proportional gain (pu)";
  parameter Real K_IA "Voltage regulator integral gain(pu)";
  parameter Real VA_MIN "Minimum voltage regulator output (pu)";
  parameter Real VA_MAX "Maximum voltage regulator output (pu)";
  parameter Real K_P "Potential circuit gain coefficient (pu)";
  parameter Real K_L "Exciter field voltage lower limit parameter (pu)";
  parameter Real T_E "Exciter time constant, integration rate associated with exciter
  control (s)";
  parameter Real K_C "Rectifier loading factor proportional to commutating reactance(pu)";
  parameter Real K_D "Demagnetizing factor, a function of exciter alternator
reactances(pu)";
  parameter Real K_E "Exciter constant related to self-excited field(pu)";
  parameter Real K_F1 "Excitation control system stabilizer gain(pu)";
  parameter Real K_F2 "Excitation control system stabilizer gain(pu)";
  parameter Real K_F3 "Excitation control system stabilizer gain(pu)";
  parameter Real T_F3 "Excitation control system stabilizer time constant (s)";
  parameter Real VE_MIN "Minimum exciter voltage output(pu)";
  parameter Real VFEMAX "Exciter field current limit reference(pu)";
  parameter Real E_1 "Exciter alternator output voltages back of commutating
  reactance at which saturation is defined (pu)";
  parameter Real S_EE_1 "Exciter saturation function value at the corresponding exciter 
  voltage, E1, back of commutating reactance (pu)";
  parameter Real E_2 "Exciter alternator output voltages back of commutating
  reactance at which saturation is defined (pu)";
  parameter Real S_EE_2 "Exciter saturation function value at the corresponding exciter
    voltage, E2, back of commutating reactance(pu)";

  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    k=K_F3,
    T=T_F3,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{-54,-114},{-74,-94}})));
  Modelica.Blocks.Math.Add3 add3_2
    annotation (Placement(transformation(extent={{-114,36},{-94,56}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag
                                     TransducerDelay(
    K=1,
    T=T_R,
    y_start=ECOMP0)
    annotation (Placement(transformation(extent={{-168,-10},{-148,10}})));
  Modelica.Blocks.Math.Add add1(k2=-1)
    annotation (Placement(transformation(extent={{20,100},{40,120}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-6,46})));
  Modelica.Blocks.Math.Gain gain1(k=K_F2) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={16,-44})));
  Modelica.Blocks.Math.Gain gain2(k=K_F1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-6,-70})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{174,100},{194,120}})));
  Modelica.Blocks.Math.Gain gain4(k=K_P)
    annotation (Placement(transformation(extent={{106,130},{126,150}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.RotatingExciterWithDemagnetizationVarLim
    rotatingExciterWithDemagnetizationVarLim(
    T_E=T_E,
    K_E=K_E,
    E_1=E_1,
    E_2=E_2,
    S_EE_1=S_EE_1,
    S_EE_2=S_EE_2,
    Efd0=VE0,
    K_D=K_D,
    EFD(start=VE0),
    outMax(start=max_lim0))
             annotation (Placement(transformation(extent={{52,-50},{82,-20}})));
  Modelica.Blocks.Sources.Constant lowLim(k=VE_MIN)
    annotation (Placement(transformation(extent={{116,-16},{96,4}})));
  Modelica.Blocks.Sources.Constant FEMAX(k=VFEMAX)
    annotation (Placement(transformation(extent={{-74,-24},{-54,-4}})));
  Modelica.Blocks.Math.Add DiffV2(k2=-1)
    annotation (Placement(transformation(extent={{-38,-34},{-18,-14}})));
  OpenIPSL.NonElectrical.Functions.ImSE
                               se1(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2) annotation (Placement(transformation(
        extent={{-9,-6},{9,6}},
        rotation=180,
        origin={157,30})));
  Modelica.Blocks.Sources.Constant const(k=K_E)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={162,0})));
  Modelica.Blocks.Math.Add DiffV3
    annotation (Placement(transformation(extent={{114,18},{94,38}})));
  Modelica.Blocks.Math.Division division annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={52,6})));
  Modelica.Blocks.Math.Gain gain5(k=K_D)  annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-28,-150})));
  Modelica.Blocks.Interfaces.RealInput VT annotation (Placement(transformation(
          extent={{-122,68},{-100,90}}), iconTransformation(extent={{-122,68},{-100,
            90}})));
  Modelica.Blocks.Math.Add add3(k2=-1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-76,102})));
  NonElectrical.Continuous.PID_No_Windup_AC7B pID_No_Windup(
    K_IR=K_IR,
    K_DR=K_DR,
    T_DR=T_DR,
    V_RMAX=V_RMAX,
    V_RMIN=V_RMIN,
    K_PR=K_PR,
    VR0=VR0)
    annotation (Placement(transformation(extent={{-36,110},{-14,126}})));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={120,64})));
  Modelica.Blocks.Sources.Constant Upper_Limit(k=Modelica.Constants.inf)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={180,82})));
  Modelica.Blocks.Math.Gain gain(k=-K_L) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={172,46})));
  OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.RectifierCommutationVoltageDrop
    rectifierCommutationVoltageDrop(K_C=K_C)
    annotation (Placement(transformation(extent={{150,-68},{184,-34}})));

  NonElectrical.Continuous.PI_No_Windup pI_No_Windup(
    K_P=K_PA,
    K_I=K_IA,
    V_RMAX=VA_MAX,
    V_RMIN=VA_MIN,
    y_start=VA0)
    annotation (Placement(transformation(extent={{78,100},{100,120}})));
protected
parameter Real VA0(fixed=false);
parameter Real VR0(fixed=false);
parameter Real VFE0(fixed=false);
parameter Real Ifd0(fixed=false);
parameter Real VE0(fixed=false);
parameter Real VT0(fixed=false);
parameter Real Efd0(fixed=false);
parameter Real max_lim0(fixed=false);

initial equation
  // Finding initial value of excitation voltage, VE0, via going through conditions of FEX function
  VE0 = invFEX(
    K_C=K_C,
    Efd0=Efd0,
    Ifd0=Ifd0);
  // Case IN>0 not checked because it will be resolved in the next iteration
  VFE0 = VE0*(SE(
    VE0,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2) + K_E) + Ifd0*K_D;
  VA0 = VFE0/(K_P*VT0);
  VR0 = Efd0*K_F1 + VFE0*K_F2;
  V_REF = ECOMP0;
  VT0 = VT;
  Ifd0 = XADIFD;
  max_lim0 = (VFEMAX - K_D*Ifd0)/(K_E + SE(VE0,S_EE_1,S_EE_2,E_1,E_2));

equation
  connect(DiffV.u2, TransducerDelay.y) annotation (Line(points={{-122,-6},{-134,
          -6},{-134,0},{-147,0}},      color={0,0,127}));
  connect(TransducerDelay.u, ECOMP)
    annotation (Line(points={{-170,0},{-200,0}}, color={0,0,127}));
  connect(gain1.y, add.u2)
    annotation (Line(points={{16,-33},{16,16},{0,16},{0,34}},
                                                 color={0,0,127}));
  connect(add.y, add1.u2) annotation (Line(points={{-6,57},{-6,104},{18,104}},
                    color={0,0,127}));
  connect(product.u1, gain4.y) annotation (Line(points={{172,116},{172,128},{127,
          128},{127,140}}, color={0,0,127}));
  connect(gain2.y, add.u1) annotation (Line(points={{-6,-59},{-6,-12},{-12,-12},
          {-12,34}},                        color={0,0,127}));
  connect(FEMAX.y,DiffV2. u1) annotation (Line(points={{-53,-14},{-40,-14},{-40,
          -18}},          color={0,0,127}));
  connect(gain5.y, DiffV2.u2) annotation (Line(points={{-28,-139},{-28,-94},{-44,
          -94},{-44,-30},{-40,-30}},
                 color={0,0,127}));
  connect(se1.VE_OUT, DiffV3.u1) annotation (Line(points={{147.46,30},{132,30},{
          132,34},{116,34}}, color={0,0,127}));
  connect(const.y, DiffV3.u2) annotation (Line(points={{151,0},{136,0},{136,22},
          {116,22}},color={0,0,127}));
  connect(DiffV2.y, division.u1) annotation (Line(points={{-17,-24},{22,-24},{22,
          46},{58,46},{58,18}},
                            color={0,0,127}));
  connect(DiffV3.y, division.u2)
    annotation (Line(points={{93,28},{46,28},{46,18}}, color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.V_EX,
    rotatingExciterWithDemagnetizationVarLim.EFD) annotation (Line(points={{148.3,
          -51},{146,-51},{146,-48},{138,-48},{138,-34},{118,-34},{118,-35},{83.875,
          -35}},                                                      color={0,0,
          127}));
  connect(gain2.u, EFD) annotation (Line(points={{-6,-82},{196,-82},{196,0},{210,
          0}},                       color={0,0,127}));
  connect(rotatingExciterWithDemagnetizationVarLim.V_FE, gain1.u) annotation (
      Line(points={{50.125,-44.375},{50.125,-52},{50,-52},{50,-60},{16,-60},{16,
          -56}}, color={0,0,127}));
  connect(VOTHSG, add3_2.u1) annotation (Line(points={{-200,90},{-124,90},{-124,
          54},{-116,54}}, color={0,0,127}));
  connect(VUEL, add3_2.u2) annotation (Line(points={{-130,-200},{-130,-78},{-128,
          -78},{-128,46},{-116,46}}, color={0,0,127}));
  connect(DiffV.y, add3_2.u3) annotation (Line(points={{-99,0},{-94,0},{-94,22},
          {-124,22},{-124,38},{-116,38}}, color={0,0,127}));
  connect(add3_2.y, add3.u1) annotation (Line(points={{-93,46},{-82,46},{-82,90}},
                     color={0,0,127}));
  connect(imDerivativeLag.y, add3.u2) annotation (Line(points={{-75,-104},{-82,-104},
          {-82,10},{-70,10},{-70,90}},
                              color={0,0,127}));
  connect(add3.y, pID_No_Windup.u)
    annotation (Line(points={{-76,113},{-76,120},{-38,120}}, color={0,0,127}));
  connect(VT, gain4.u) annotation (Line(points={{-111,79},{-96,79},{-96,140},{104,
          140}}, color={0,0,127}));
  connect(gain.u, rotatingExciterWithDemagnetizationVarLim.V_FE) annotation (
      Line(points={{184,46},{190,46},{190,18},{126,18},{126,-60},{50.125,-60},{50.125,
          -44.375}}, color={0,0,127}));
  connect(product.y, variableLimiter.u) annotation (Line(points={{195,110},{198,
          110},{198,64},{132,64}}, color={0,0,127}));
  connect(pID_No_Windup.y, add1.u1) annotation (Line(points={{-13,120},{6,120},
          {6,116},{18,116}}, color={0,0,127}));
  connect(imDerivativeLag.u, gain1.u) annotation (Line(points={{-52,-104},{50,-104},
          {50,-60},{16,-60},{16,-56}},                      color={0,0,127}));
  connect(Upper_Limit.y, variableLimiter.limit1) annotation (Line(points={{169,82},
          {152,82},{152,72},{132,72}}, color={0,0,127}));
  connect(gain.y, variableLimiter.limit2) annotation (Line(points={{161,46},{152,
          46},{152,56},{132,56}}, color={0,0,127}));
  connect(se1.VE_IN, rotatingExciterWithDemagnetizationVarLim.EFD) annotation (
      Line(points={{166.9,30},{182,30},{182,-20},{138,-20},{138,-34},{118,-34},{
          118,-35},{83.875,-35}}, color={0,0,127}));
  connect(lowLim.y, rotatingExciterWithDemagnetizationVarLim.outMin)
    annotation (Line(points={{95,-6},{92,-6},{92,-23.75},{83.875,-23.75}},
        color={0,0,127}));
  connect(division.y, rotatingExciterWithDemagnetizationVarLim.outMax)
    annotation (Line(points={{52,-5},{52,-14},{50.125,-14},{50.125,-23.75}},
        color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.EFD, EFD) annotation (Line(points={{185.7,
          -51},{196,-51},{196,0},{210,0}}, color={0,0,127}));
  connect(gain5.u, XADIFD) annotation (Line(points={{-28,-162},{-28,-172},{80,
          -172},{80,-200}}, color={0,0,127}));
  connect(rotatingExciterWithDemagnetizationVarLim.XADIFD, XADIFD) annotation (
      Line(points={{67,-51.875},{67,-146},{80,-146},{80,-200}}, color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.XADIFD, XADIFD) annotation (Line(
        points={{167,-69.7},{167,-172},{80,-172},{80,-200}}, color={0,0,127}));
  connect(variableLimiter.y, rotatingExciterWithDemagnetizationVarLim.I_C)
    annotation (Line(points={{109,64},{68,64},{68,60},{32,60},{32,-35},{50.125,
          -35}}, color={0,0,127}));
  connect(pI_No_Windup.y, product.u2) annotation (Line(points={{101,110},{164,
          110},{164,104},{172,104}}, color={0,0,127}));
  connect(add1.y, pI_No_Windup.u)
    annotation (Line(points={{41,110},{78,110}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-200,-200},{200,160}})),
      Icon(coordinateSystem(extent={{-200,-200},{200,160}}), graphics={
                             Text(
          extent={{-96,-60},{-26,-80}},
          lineColor={28,108,200},
          textString="
          
          "),                 Text(
          extent={{-104,90},{-22,70}},
          lineColor={28,108,200},
          textString="ETERM"),
        Text(
          extent={{-16,80},{86,46}},
          textColor={28,108,200},
          textString="AC7B")}),
    conversion(noneFromVersion=""));
end AC7B;
