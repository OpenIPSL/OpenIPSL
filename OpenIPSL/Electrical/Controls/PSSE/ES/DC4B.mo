within OpenIPSL.Electrical.Controls.PSSE.ES;
model DC4B "IEEE 421.5 2005 DC4B Excitation System"
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  import OpenIPSL.NonElectrical.Functions.SE;
  import
    OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.calculate_dc_exciter_params;
  import      Modelica.Units.SI;
  parameter SI.Time T_R=0.004 "Regulator input filter time constant (sec)";
  parameter SI.PerUnit K_P=13 "Voltage regulator proportional gain (pu)";
  parameter SI.TimeAging K_I=4 "Voltage regulator integral gain (pu)";
  parameter SI.PerUnit K_D=6 "Voltage regulator derivative gain (pu)";
  parameter SI.Time T_D=0.03 "Voltage regulator derivative channel time constant (sec)";
  parameter SI.PerUnit V_RMAX=10.8 "Maximum regulator output (pu)";
  parameter SI.PerUnit V_RMIN=-7 "Minimum regulator output (pu)";
  parameter SI.PerUnit K_A=10.8 "Voltage regulator gain (pu)";
  parameter SI.Time T_A=0.01 "Voltage regulator time constant (sec)";
  parameter SI.PerUnit K_E=1  "Exciter field proportional constant";
  parameter SI.Time T_E=0.8 "Exciter field time constant";
  parameter SI.PerUnit K_F=0.03 "Rate feedback excitation system stabilizer gain";
  parameter SI.Time T_F=1 "Rate feedback time constant";
  parameter SI.PerUnit E_1=2.4  "Exciter output voltage for saturation factor S_E(E_1)";
  parameter SI.PerUnit S_EE_1=0.03 "Exciter saturation factor at exciter output voltage E1";
  parameter SI.PerUnit E_2=5.0000 "Exciter output voltage for saturation factor S_E(E_2)";
  parameter SI.PerUnit S_EE_2=0.50000 "Exciter saturation factor at exciter output voltage E2";
  parameter Integer UEL=1 "Under Excitation Limiter flag";
  parameter Integer OEL=1 "Over Excitation Limiter flag";
  OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.RotatingExciterLimited
    rotatingExciterLimited(
    T_E=T_E,
    K_E=K_E0,
    E_1=E_1,
    E_2=E_2,
    S_EE_1=S_EE_1,
    S_EE_2=S_EE_2,
    Efd0=Efd0)
    annotation (Placement(transformation(extent={{116,-28},{172,28}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag
                                     TransducerDelay(
    K=1,
    T=T_R,
    y_start=ECOMP0)
    annotation (Placement(transformation(extent={{-166,-10},{-146,10}})));
  Modelica.Blocks.Math.Add Vpss_Add
    annotation (Placement(transformation(extent={{-88,28},{-68,48}})));
  Modelica.Blocks.Math.Add3 add3_1(k3=-1)
    annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
  Modelica.Blocks.Continuous.Derivative derivativeLag(
    k=K_F,
    T=T_F,
    x_start=Efd0,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{-24,-86},{-44,-66}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{72,130},{92,150}})));
  OpenIPSL.NonElectrical.Logical.LV_GATE lV_GATE
    annotation (Placement(transformation(extent={{64,-52},{92,-38}})));
  OpenIPSL.NonElectrical.Logical.HV_GATE hV_GATE
    annotation (Placement(transformation(extent={{16,-56},{44,-42}})));
  NonElectrical.Logical.Switch_VUEL switch_VUEL(n=UEL) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-130,-150})));
  NonElectrical.Logical.Switch_VOEL switch_VOEL(n=OEL) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-150})));
  Modelica.Blocks.Math.Add VUEL_VOEL_add annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-130,-80})));
  Modelica.Blocks.Math.Gain gain(k=V_RMIN)  annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={132,-150})));
  Modelica.Blocks.Math.Gain gain1(k=V_RMAX)  annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={160,-150})));
  NonElectrical.Continuous.PID_No_Windup_DC4B pID_No_Windup(
    K_P=K_P,
    K_I=K_I,
    K_D=K_D,
    T_D=T_D,
    V_RMAX=V_RMAX/K_A,
    V_RMIN=V_RMIN/K_A,
    K_A=K_A,
    VR0=VR0,
    VT0=VT0) annotation (Placement(transformation(extent={{-20,-18},{26,10}})));
  Modelica.Blocks.Interfaces.RealInput VT annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={152,-200}), iconTransformation(
        extent={{-10,-10},{10,10}},
        origin={-110,-70})));
  NonElectrical.Continuous.First_Order_Lag_Non_Windup first_Order_Lag_Non_Windup(
    K_I=K_A,
    T_I=max(T_A, 1e-14),
    y_start=VR0)
    annotation (Placement(transformation(extent={{80,40},{100,60}})));
protected
  parameter SI.PerUnit SE_Efd0(fixed=false);
  parameter SI.PerUnit VR0(fixed=false);
  parameter SI.PerUnit V_RMAX0(fixed=false);
  parameter SI.PerUnit K_E0(fixed=false);
  parameter SI.PerUnit V_RMIN0(fixed=false);
  parameter SI.PerUnit VT0(fixed=false);
initial equation
  SE_Efd0 = OpenIPSL.NonElectrical.Functions.SE(
    EFD0,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2);
  (V_RMAX0,V_RMIN0,K_E0) = calculate_dc_exciter_params(
    V_RMAX,
    V_RMIN,
    K_E,
    E_2,
    S_EE_2,
    Efd0,
    SE_Efd0);
  VR0 = Efd0*(K_E0 + SE_Efd0);
  V_REF = ECOMP0;
  VT0 = VT;
equation
  connect(rotatingExciterLimited.EFD, EFD)
    annotation (Line(points={{175.5,0},{210,0}}, color={0,0,127}));
  connect(ECOMP, TransducerDelay.u)
    annotation (Line(points={{-200,0},{-168,0}}, color={0,0,127}));
  connect(TransducerDelay.y, DiffV.u2) annotation (Line(points={{-145,0},{-134,
          0},{-134,-6},{-122,-6}}, color={0,0,127}));
  connect(VOTHSG, Vpss_Add.u1) annotation (Line(points={{-200,90},{-96,90},{-96,
          44},{-90,44}},                        color={0,0,127}));
  connect(DiffV.y, Vpss_Add.u2)
    annotation (Line(points={{-99,0},{-94,0},{-94,32},{-90,32}},
                                               color={0,0,127}));
  connect(Vpss_Add.y, add3_1.u1) annotation (Line(points={{-67,38},{-64,38},{-64,
          8},{-60,8}}, color={0,0,127}));
  connect(derivativeLag.u, rotatingExciterLimited.EFD) annotation (Line(points=
          {{-22,-76},{180,-76},{180,0},{175.5,0}}, color={0,0,127}));
  connect(VUEL,switch_VUEL. u)
    annotation (Line(points={{-130,-200},{-130,-162}}, color={0,0,127}));
  connect(VOEL, switch_VOEL.u)
    annotation (Line(points={{-70,-200},{-70,-162}}, color={0,0,127}));
  connect(switch_VUEL.y1, VUEL_VOEL_add.u1)
    annotation (Line(points={{-136,-139},{-136,-92}}, color={0,0,127}));
  connect(switch_VOEL.y1, VUEL_VOEL_add.u2) annotation (Line(points={{-76,-139},
          {-76,-100},{-124,-100},{-124,-92}}, color={0,0,127}));
  connect(VUEL_VOEL_add.y, add3_1.u2) annotation (Line(points={{-130,-69},{-130,
          -20},{-80,-20},{-80,0},{-60,0}}, color={0,0,127}));
  connect(derivativeLag.y, add3_1.u3) annotation (Line(points={{-45,-76},{-76,-76},
          {-76,-8},{-60,-8}},                           color={0,0,127}));
  connect(VT,gain. u) annotation (Line(points={{152,-200},{152,-172},{132,-172},
          {132,-162}},
                    color={0,0,127}));
  connect(gain1.u,gain. u) annotation (Line(points={{160,-162},{160,-172},{132,-172},
          {132,-162}},
                     color={0,0,127}));
  connect(product1.u1, gain.u) annotation (Line(points={{70,146},{50,146},{50,
          158},{194,158},{194,-172},{132,-172},{132,-162}}, color={0,0,127}));
  connect(add3_1.y, pID_No_Windup.u) annotation (Line(points={{-37,0},{-28,0},{
          -28,-0.5},{-24.1818,-0.5}},
                                  color={0,0,127}));
  connect(product1.y, first_Order_Lag_Non_Windup.u) annotation (Line(points={{
          93,140},{106,140},{106,106},{70,106},{70,50},{78,50}}, color={0,0,127}));
  connect(first_Order_Lag_Non_Windup.y, rotatingExciterLimited.I_C) annotation (
     Line(points={{101,50},{106,50},{106,0},{112.5,0}}, color={0,0,127}));
  connect(gain1.y, first_Order_Lag_Non_Windup.V_RMAX) annotation (Line(points={
          {160,-139},{160,-88},{186,-88},{186,70},{98,70},{98,62}}, color={0,0,
          127}));
  connect(gain.y, first_Order_Lag_Non_Windup.V_RMIN) annotation (Line(points={{
          132,-139},{132,-38},{108,-38},{108,-10},{82,-10},{82,38}}, color={0,0,
          127}));
  connect(pID_No_Windup.y, hV_GATE.u2) annotation (Line(points={{28.0909,
          -0.5},{40,-0.5},{40,-32},{2,-32},{2,-53.2},{13.2,-53.2}}, color=
         {0,0,127}));
  connect(switch_VUEL.y2, hV_GATE.u1) annotation (Line(points={{-124,-139},
          {-124,-122},{-98,-122},{-98,-44.8},{13.2,-44.8}}, color={0,0,
          127}));
  connect(hV_GATE.y, lV_GATE.u2) annotation (Line(points={{45.4,-49},{
          45.4,-49.2},{61.2,-49.2}}, color={0,0,127}));
  connect(switch_VOEL.y2, lV_GATE.u1) annotation (Line(points={{-64,-139},
          {-64,-100},{52,-100},{52,-40.8},{61.2,-40.8}}, color={0,0,127}));
  connect(lV_GATE.y, product1.u2) annotation (Line(points={{93.4,-45},{
          100,-45},{100,-20},{60,-20},{60,134},{70,134}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -200},{200,160}}), graphics={
                             Text(
          extent={{-112,-60},{-42,-80}},
          lineColor={28,108,200},
          textString="VT"), Text(
          extent={{-8,96},{86,50}},
          textColor={28,108,200},
          textString="DC4B")}),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{200,
            160}})),
    conversion(noneFromVersion=""));
end DC4B;
