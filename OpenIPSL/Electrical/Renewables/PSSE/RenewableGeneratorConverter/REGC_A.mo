within OpenIPSL.Electrical.Renewables.PSSE.RenewableGeneratorConverter;
model REGC_A "Renewable energy generator/converter model A"
  extends BaseClasses.baseRenewableGenerator;
  Modelica.Blocks.Sources.RealExpression Vt(y=VT)
    annotation (Placement(transformation(extent={{-130,40},{-110,60}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{-90,20},{-70,40}})));
  Modelica.Blocks.Sources.Constant Vo_limit(k=Volim)
    annotation (Placement(transformation(extent={{-130,14},{-110,34}})));
  Modelica.Blocks.Nonlinear.Limiter min_limiter(uMax=Modelica.Constants.inf,
      uMin=0) annotation (Placement(transformation(extent={{-30,20},{-10,40}})));
  Modelica.Blocks.Math.Add add1(k2=-1)
    annotation (Placement(transformation(extent={{78,78},{98,98}})));
  Modelica.Blocks.Nonlinear.Limiter IOLIM(uMax=Modelica.Constants.inf,
                                                    uMin=Iolim)
    annotation (Placement(transformation(extent={{112,78},{132,98}})));
  OpenIPSL.Electrical.Renewables.PSSE.RenewableGeneratorConverter.BaseClasses.LVACM
    LVACM(lvpnt0=lvpnt0, lvpnt1=lvpnt1)
    annotation (Placement(transformation(extent={{62,-80},{82,-60}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag simpleLag(
    K=1,
    T=Tfltr,
    y_start=v_0)
    annotation (Placement(transformation(extent={{44,-80},{24,-60}})));
  OpenIPSL.Electrical.Renewables.PSSE.RenewableGeneratorConverter.BaseClasses.LVPL
    LVPL(
    Brkpt=Brkpt,
    Lvpl1=Lvpl1,
    Zerox=Zerox)
    annotation (Placement(transformation(extent={{10,-80},{-10,-60}})));
  Modelica.Blocks.Math.Product IP
    annotation (Placement(transformation(extent={{100,-20},{120,0}})));
public
  Modelica.Blocks.Math.Gain KHV(k=Khv)
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-80,-90})));
  Modelica.Blocks.Sources.BooleanConstant Lvplsw_logic(k=Lvplsw)
    annotation (Placement(transformation(extent={{-30,-100},{-50,-80}})));
  Modelica.Blocks.Nonlinear.Limiter limiter4(uMax=rrpwr, uMin=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-82,-40},{-62,-20}})));
  Modelica.Blocks.Math.Add add2(k2=-1)
    annotation (Placement(transformation(extent={{-110,-40},{-90,-20}})));
  Modelica.Blocks.Sources.RealExpression Terminal_Voltage1(y=Vt.y) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={34,-100})));
  Modelica.Blocks.Sources.RealExpression LowerLimit(y=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
  Modelica.Blocks.Math.Add add3(k2=-1)
    annotation (Placement(transformation(extent={{-86,64},{-66,84}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=Iqrmax, uMin=Iqrmin)
    annotation (Placement(transformation(extent={{-58,64},{-38,84}})));
  Modelica.Blocks.Continuous.Integrator integrator(
    k=1/Tg,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=Iq0)
    annotation (Placement(transformation(extent={{-18,64},{2,84}})));
  Modelica.Blocks.Math.Gain gain(k=-1)
    annotation (Placement(transformation(extent={{-120,70},{-100,90}})));
  Modelica.Blocks.Sources.RealExpression Constant(y=Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-30,-124},{-50,-104}})));
  Modelica.Blocks.Continuous.Integrator integrator1(
    k=1/Tg,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=Ip0)
    annotation (Placement(transformation(extent={{-52,-40},{-32,-20}})));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter
    annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
equation
  [IP.y;  IOLIM.y] = -[cos(delta), sin(delta); -sin(delta), cos(delta)]*[p.ir/CoB; p.ii/CoB];
  V_t = VT;
  Pgen = -(1/CoB)*(p.vr*p.ir + p.vi*p.ii);
  Qgen = -(1/CoB)*(p.vi*p.ir - p.vr*p.ii);
  IQ0 = Iq0;
  IP0 = Ip0;
  V_0 = v_0;
  p_0 = p0;
  q_0 = q0;

  connect(add.y,KHV. u)
    annotation (Line(points={{-69,30},{-62,30}},
                                              color={0,0,127}));
  connect(LVPL.V,simpleLag. y)
    annotation (Line(points={{11,-70},{23,-70}}, color={0,0,127}));
  connect(LVACM.y,IP. u2) annotation (Line(points={{83,-70},{92,-70},{92,-16},
          {98,-16}},         color={0,0,127}));
  connect(switch1.u1,LVPL. y)
    annotation (Line(points={{-68,-82},{-56,-82},{-56,-70},{-11,-70}},
                                                           color={0,0,127}));
  connect(Lvplsw_logic.y,switch1. u2) annotation (Line(points={{-51,-90},{-68,-90}},
                                color={255,0,255}));
  connect(KHV.y,min_limiter. u)
    annotation (Line(points={{-39,30},{-32,30}},
                                               color={0,0,127}));
  connect(Vt.y,add. u1) annotation (Line(points={{-109,50},{-94,50},{-94,36},{-92,
          36}},      color={0,0,127}));
  connect(simpleLag.u,LVACM. Vt) annotation (Line(points={{46,-70},{61,-70}},
                                                           color={0,0,127}));
  connect(Vo_limit.y,add. u2)
    annotation (Line(points={{-109,24},{-92,24}},color={0,0,127}));
  connect(add2.y,limiter4. u)
    annotation (Line(points={{-89,-30},{-84,-30}}, color={0,0,127}));
  connect(Terminal_Voltage1.y,LVACM. Vt) annotation (Line(points={{45,-100},{54,
          -100},{54,-70},{61,-70}},  color={0,0,127}));
  connect(add3.y,limiter1. u)
    annotation (Line(points={{-65,74},{-60,74}},color={0,0,127}));
  connect(limiter1.y,integrator. u)
    annotation (Line(points={{-37,74},{-20,74}},
                                               color={0,0,127}));
  connect(integrator.y,add3. u2) annotation (Line(points={{3,74},{8,74},{8,56},
          {-92,56},{-92,68},{-88,68}},     color={0,0,127}));
  connect(gain.y,add3. u1) annotation (Line(points={{-99,80},{-88,80}},
                               color={0,0,127}));
  connect(gain.u, Iqcmd) annotation (Line(points={{-122,80},{-160,80}},
                      color={0,0,127}));
  connect(Ipcmd,add2. u1) annotation (Line(points={{-160,-60},{-130,-60},{-130,-24},
          {-112,-24}},          color={0,0,127}));
  connect(Constant.y, switch1.u3) annotation (Line(points={{-51,-114},{-62,-114},
          {-62,-98},{-68,-98}}, color={0,0,127}));
  connect(limiter4.y, integrator1.u)
    annotation (Line(points={{-61,-30},{-54,-30}}, color={0,0,127}));
  connect(LowerLimit.y, variableLimiter.limit2) annotation (Line(points={{-59,
          -60},{-28,-60},{-28,-38},{-22,-38}}, color={0,0,127}));
  connect(integrator1.y, variableLimiter.u)
    annotation (Line(points={{-31,-30},{-22,-30}}, color={0,0,127}));
  connect(variableLimiter.limit1, switch1.y) annotation (Line(points={{-22,-22},
          {-26,-22},{-26,-4},{-124,-4},{-124,-90},{-91,-90}}, color={0,0,127}));
  connect(variableLimiter.y, add2.u2) annotation (Line(points={{1,-30},{26,-30},
          {26,-10},{-118,-10},{-118,-36},{-112,-36}}, color={0,0,127}));
  connect(IP.u1, add2.u2) annotation (Line(points={{98,-4},{-24,-4},{-24,-10},
          {-118,-10},{-118,-36},{-112,-36}},
                            color={0,0,127}));
  connect(add1.y, IOLIM.u)
    annotation (Line(points={{99,88},{110,88}}, color={0,0,127}));
  connect(add1.u1, integrator.y) annotation (Line(points={{76,94},{8,94},{8,
          74},{3,74}}, color={0,0,127}));
  connect(min_limiter.y, add1.u2) annotation (Line(points={{-9,30},{68,30},{
          68,82},{76,82}}, color={0,0,127}));
  annotation (Icon(graphics={Text(
          extent={{-90,70},{90,-70}},
          textColor={0,0,255},
          textString="REGCA")}));
end REGC_A;
