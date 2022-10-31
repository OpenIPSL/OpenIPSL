within OpenIPSL.Electrical.Renewables.PSSE.RenewableElectricalController;
model REECA1 "Electrical control model for large scale wind (TEST)"
  extends
    OpenIPSL.Electrical.Renewables.PSSE.RenewableElectricalController.BaseClasses.BaseREECA(
     Iqcmd(start=Iq0), Ipcmd(start=Ip0));

  parameter OpenIPSL.Types.PerUnit Vdip = -99 "Low voltage threshold to activate reactive current injection logic (0.85 – 0.9 pu)";
  parameter OpenIPSL.Types.PerUnit Vup = 99 "Voltage above which reactive current injection logic is activated (>1.1 pu)";
  parameter OpenIPSL.Types.Time Trv = 0.01 "Filter time constant for voltage measurement (0.01 – 0.02 s)";
  parameter OpenIPSL.Types.PerUnit dbd1 = -0.05 "Voltage error dead band lower threshold (-0.1 – 0 pu)";
  parameter OpenIPSL.Types.PerUnit dbd2 = 0.05 "Voltage error dead band upper threshold (0 – 0.1 pu)";
  parameter Real Kqv = 0 "Reactive current injection gain during over and undervoltage conditions (0 – 10)";
  parameter OpenIPSL.Types.PerUnit Iqh1 = 1.05 "Upper limit on reactive current injection Iqinj (1 – 1.1 pu)";
  parameter OpenIPSL.Types.PerUnit Iql1 = -1.05 "Lower limit on reactive current injection Iqinj (-1.1 – 1 pu)";
  parameter OpenIPSL.Types.PerUnit vref0 = 0 "User defined voltage reference (0.95 – 1.05 pu)";
  parameter OpenIPSL.Types.PerUnit Iqfrz = 0.15 "Value at which Iqinj is held for Thld seconds following a voltage dip if Thld > 0";
  parameter OpenIPSL.Types.Time Thld = 0 "Time for which Iqinj is held at Iqfrz after voltage dip returns to zero";
  parameter OpenIPSL.Types.Time Tp = 0.05 "Filter time constant for electrical power (0.01 - 0.1 s)";
  parameter OpenIPSL.Types.PerUnit Qmax = 0.4 "Upper limits of the limit for reactive power regulator (0.4 – 1.0 pu)";
  parameter OpenIPSL.Types.PerUnit Qmin = -0.4 "Lower limits of the  limit for reactive power regulator (-1.0 – -0.4 pu)";
  parameter OpenIPSL.Types.PerUnit Vmax = 1.1 "Maximum limit for voltage control (1.05 – 1.1 pu)";
  parameter OpenIPSL.Types.PerUnit Vmin = 0.9 "Lower limits of input signals (0.9 – 0.95 pu)";
  parameter Real Kqp = 0 "Reactive power regulator proportional gain (No predefined range)";
  parameter Real Kqi = 0.1 "Reactive power regulator integral gain (No predefined range)";
  parameter Real Kvp = 0 "Voltage regulator proportional gain (No predefined range)";
  parameter Real Kvi = 120 "Voltage regulator integral gain (No predefined range)";
  parameter OpenIPSL.Types.PerUnit Vbias = 0 "User-defined reference/bias on the inner-loop voltage control (No predefined range)";
  parameter OpenIPSL.Types.Time Tiq = 0.02 "Time constant on lag delay (0.01 - 0.02 s)";
  parameter Real dPmax = 99 "Power reference maximum ramp rate (No predefined range pu/s)";
  parameter Real dPmin = -99 "Lower limits of input signals (No predefined range pu/s)";
  parameter OpenIPSL.Types.PerUnit Pmax = 1 "Maximum power limit (1 pu)";
  parameter OpenIPSL.Types.PerUnit Pmin = 0 "Minimum power limit (0 pu)";
  parameter OpenIPSL.Types.PerUnit Imax = 1.7 "Maximum limit on total converter current (1.1 – 1.3 pu)";
  parameter OpenIPSL.Types.Time Tpord = 0.04 "Power filter time constant (0.01 - 0.02 s) ";
  parameter OpenIPSL.Types.PerUnit Vq1 = 0.29 "Reactive Power V-I pair, voltage (user defined)";
  parameter OpenIPSL.Types.PerUnit Iq1 = 1.25 "Reactive Power V-I pair, current (user defined)";
  parameter OpenIPSL.Types.PerUnit Vq2 = 1.33 "Reactive Power V-I pair, voltage (user defined)";
  parameter OpenIPSL.Types.PerUnit Iq2 = 0.00    "Reactive Power V-I pair, current (user defined)";
  parameter OpenIPSL.Types.PerUnit Vq3 = 1.33 "Reactive Power V-I pair, voltage (user defined)";
  parameter OpenIPSL.Types.PerUnit Iq3 = 0.00 "Reactive Power V-I pair, current (user defined)";
  parameter OpenIPSL.Types.PerUnit Vq4 = 1.33 "Reactive Power V-I pair, voltage (user defined)";
  parameter OpenIPSL.Types.PerUnit Iq4 = 0.00 "Reactive Power V-I pair, current (user defined)";
  parameter OpenIPSL.Types.PerUnit Vp1 = 0.00 "Real Power V-I pair, voltage (user defined)";
  parameter OpenIPSL.Types.PerUnit Ip1 = 1.15 "Real Power V-I pair, current (user defined)";
  parameter OpenIPSL.Types.PerUnit Vp2 = 1.1 "Real Power V-I pair, voltage (user defined)";
  parameter OpenIPSL.Types.PerUnit Ip2 = 1.24 "Real Power V-I pair, current (user defined)";
  parameter OpenIPSL.Types.PerUnit Vp3 = 2 "Real Power V-I pair, voltage (user defined)";
  parameter OpenIPSL.Types.PerUnit Ip3 = 1.24 "Real Power V-I pair, current (user defined)";
  parameter OpenIPSL.Types.PerUnit Vp4 = 2 "Real Power V-I pair, voltage (user defined)";
  parameter OpenIPSL.Types.PerUnit Ip4 = 1.24 "Real Power V-I pair, current (user defined)";

  Boolean Voltage_dip;

  Modelica.Blocks.Sources.BooleanConstant PfFlag_logic(k=pfflag)
    annotation (Placement(transformation(extent={{-230,80},{-210,100}})));
  Modelica.Blocks.Logical.Switch PfFlag
    "Constant Q (False) or PF (True) local control."
    annotation (Placement(transformation(extent={{-190,116},{-170,136}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=Qmax, uMin=Qmin)
    annotation (Placement(transformation(extent={{-156,116},{-136,136}})));
  Modelica.Blocks.Math.Add add1(k2=-1)
    annotation (Placement(transformation(extent={{-126,110},{-106,130}})));
  Modelica.Blocks.Sources.BooleanConstant Vflag_logic(k=vflag)
    annotation (Placement(transformation(extent={{-80,80},{-60,100}})));
  Modelica.Blocks.Logical.Switch VFlag
    "Constant Q (False) or PF (True) local control."
    annotation (Placement(transformation(extent={{4,104},{24,124}})));
  Modelica.Blocks.Nonlinear.Limiter limiter3(uMax=Vmax, uMin=Vmin)
    annotation (Placement(transformation(extent={{34,104},{54,124}})));
  Modelica.Blocks.Math.Add add4(k2=-1)
    annotation (Placement(transformation(extent={{66,104},{86,124}})));
  Modelica.Blocks.Sources.RealExpression Vt_filt2(y=VFilter.y)
    annotation (Placement(transformation(extent={{86,104},{66,84}})));
  Modelica.Blocks.Sources.RealExpression IQMAX_(y=CCL_REECA.Iqmax)
                                                             annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={178,134})));
  Modelica.Blocks.Sources.RealExpression IQMIN_(y=CCL_REECA.Iqmin)
                                                             annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={178,84})));
  Modelica.Blocks.Logical.Switch QFlag
    annotation (Placement(transformation(extent={{206,64},{226,84}})));
  Modelica.Blocks.Sources.BooleanConstant QFLAG(k=qflag)
    annotation (Placement(transformation(extent={{166,46},{186,66}})));
  Modelica.Blocks.Math.Add add6(k2=+1)
    annotation (Placement(transformation(extent={{240,70},{260,90}})));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter
    annotation (Placement(transformation(extent={{274,70},{294,90}})));
  Modelica.Blocks.Sources.RealExpression IQMIN(y=CCL_REECA.Iqmin)
    annotation (Placement(transformation(extent={{294,70},{274,50}})));
  Modelica.Blocks.Sources.RealExpression IQMAX(y=CCL_REECA.Iqmax)
    annotation (Placement(transformation(extent={{294,94},{274,114}})));
  Modelica.Blocks.Math.Add add7(k2=-1)
    annotation (Placement(transformation(extent={{60,-26},{80,-6}})));
  Modelica.Blocks.Continuous.Integrator integrator2(k=1/Tiq,
    initType=Modelica.Blocks.Types.Init.InitialState,        y_start=-Iq0
         - (-V0 + Vref0)*Kqv)
    annotation (Placement(transformation(extent={{140,-20},{160,0}})));
  Modelica.Blocks.Sources.RealExpression Vt_filt1(y=VFilter.y)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Modelica.Blocks.Nonlinear.Limiter limiter4(uMax=Modelica.Constants.inf, uMin=0.01)
    annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{20,-20},{40,0}})));
  Modelica.Blocks.Tables.CombiTable1Ds VDL1(
    table=[(Vq1 + 2*Modelica.Constants.eps),Iq1; (Vq2 + 3*Modelica.Constants.eps),
        Iq2; (Vq3 + 4*Modelica.Constants.eps),Iq3; (Vq4 + 5*Modelica.Constants.eps),
        Iq4])
    annotation (Placement(transformation(extent={{64,-80},{84,-60}})));
  Modelica.Blocks.Tables.CombiTable1Ds VDL2(table=[(Vp1 + 2*Modelica.Constants.eps),Ip1; (Vp2 + 3*Modelica.Constants.eps),
        Ip2; (Vp3 + 4*Modelica.Constants.eps),Ip3; (Vp4 + 5*Modelica.Constants.eps),
        Ip4])
    annotation (Placement(transformation(extent={{64,-80},{84,-100}})));
  Modelica.Blocks.Continuous.Integrator integrator3(k=1/Tpord, y_start=Ip0*V0)
    annotation (Placement(transformation(extent={{-140,-176},{-120,-156}})));
  Modelica.Blocks.Math.Add add8(k2=-1)
    annotation (Placement(transformation(extent={{-202,-156},{-182,-176}})));
  Modelica.Blocks.Nonlinear.Limiter limiter5(uMax=dPmax, uMin=dPmin)
    annotation (Placement(transformation(extent={{-170,-176},{-150,-156}})));
  Modelica.Blocks.Nonlinear.Limiter limiter6(uMax=Pmax, uMin=Pmin)
    annotation (Placement(transformation(extent={{-60,-176},{-40,-156}})));
  Modelica.Blocks.Math.Product product5
    annotation (Placement(transformation(extent={{-238,-162},{-218,-182}})));
  Modelica.Blocks.Sources.RealExpression GeneratorSpeed(y=if pflag == true
         then Wg else 1)
    annotation (Placement(transformation(extent={{-272,-168},{-252,-188}})));
  Modelica.Blocks.Math.Division division1
    annotation (Placement(transformation(extent={{-20,-182},{0,-162}})));
  Modelica.Blocks.Nonlinear.Limiter limiter7(uMax=Modelica.Constants.inf, uMin=0.01)
    annotation (Placement(transformation(extent={{-60,-220},{-40,-200}})));
  Modelica.Blocks.Sources.RealExpression Vt_filt3(y=VFilter.y)
    annotation (Placement(transformation(extent={{-100,-220},{-80,-200}})));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter1
    annotation (Placement(transformation(extent={{60,-182},{80,-162}})));
  Modelica.Blocks.Sources.RealExpression IPMAX(y=CCL_REECA.Ipmax)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,-142})));
  Modelica.Blocks.Sources.RealExpression IPMIN(y=CCL_REECA.Ipmin)
    annotation (Placement(transformation(extent={{78,-212},{58,-192}})));
  OpenIPSL.Electrical.Renewables.PSSE.RenewableElectricalController.BaseClasses.CCL_REECA
    CCL_REECA(
    start_ii=Iq0,
    start_ir=Ip0,
    Imax=Imax)
    annotation (Placement(transformation(extent={{100,-96},{132,-64}})));
  Modelica.Blocks.Sources.RealExpression IQCMD(y=Iqcmd)
    annotation (Placement(transformation(extent={{176,-68},{156,-48}})));
  Modelica.Blocks.Sources.BooleanConstant PQFLAG(k=pqflag)
    annotation (Placement(transformation(extent={{176,-70},{156,-90}})));
  Modelica.Blocks.Sources.RealExpression IPCMD(y=Ipcmd)
    annotation (Placement(transformation(extent={{176,-92},{156,-112}})));
  Modelica.Blocks.Math.Add add(k1=-1)
    annotation (Placement(transformation(extent={{-240,204},{-220,224}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=Iqh1, uMin=Iql1)
    annotation (Placement(transformation(extent={{-120,204},{-100,224}})));
  Modelica.Blocks.Sources.RealExpression VREF0(y=Vref0)
    annotation (Placement(transformation(extent={{-280,180},{-260,200}})));
  Modelica.Blocks.Nonlinear.DeadZone dbd1_dbd2(uMax=dbd2, uMin=dbd1)
    annotation (Placement(transformation(extent={{-200,204},{-180,224}})));
  Modelica.Blocks.Math.Gain gain2(k=Kqv)
    annotation (Placement(transformation(extent={{-160,204},{-140,224}})));
  Modelica.Blocks.Logical.Switch StateTransitionSwitch
    annotation (Placement(transformation(extent={{-4,212},{16,232}})));
  Modelica.Blocks.Sources.Constant State0(k=0)
    annotation (Placement(transformation(extent={{-44,260},{-24,280}})));
  Modelica.Blocks.Sources.BooleanExpression StateTransitionLogic(y=if
        Voltage_dip == true then true else false)
    annotation (Placement(transformation(extent={{-60,220},{-40,240}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag simpleLag1(
    K=1,
    T=Tp,
    y_start=p00)
    annotation (Placement(transformation(extent={{-260,130},{-240,150}})));
  Modelica.Blocks.Math.Tan tan1
    annotation (Placement(transformation(extent={{-260,120},{-240,100}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{-230,124},{-210,144}})));
  Modelica.Blocks.Sources.RealExpression PFAREF(y=pfangle)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-280,110})));

  Modelica.Blocks.Math.Add add3
    annotation (Placement(transformation(extent={{-26,16},{-6,36}})));
  Modelica.Blocks.Sources.RealExpression VBIAS(y=Vmod)
    annotation (Placement(transformation(extent={{-60,22},{-40,42}})));
  BaseClasses.PI_WECC_VariableLimiter pI_No_Windup(
    K_P=Kvp,
    K_I=Kvi,
    y_start=-Iq0 - (-V0 + Vref0)*Kqv)
    annotation (Placement(transformation(extent={{100,94},{140,134}})));
  BaseClasses.PI_WECC_NoVariableLimiter pI_No_Windup_notVariable(
    K_P=Kqp,
    K_I=Kqi,
    V_RMAX=Vmax,
    V_RMIN=Vmin,
    y_start=V0)
    annotation (Placement(transformation(extent={{-88,112},{-68,132}})));
  Modelica.Blocks.Sources.BooleanExpression VLogic(y=Voltage_dip)
    annotation (Placement(transformation(extent={{64,142},{84,162}})));
  NonElectrical.Continuous.SimpleLag VFilter(
    K=1,
    T=Trv,
    y_start=V0)
    annotation (Placement(transformation(extent={{-282,210},{-262,230}})));
protected
  parameter Real pfaref=p00/sqrt(p00^2 +q00^2) "Power Factor of choice.";
  parameter OpenIPSL.Types.Angle pfangle = if q00 > 0 then acos(pfaref) else -acos(pfaref);
  parameter OpenIPSL.Types.PerUnit Ip0(fixed=false);
  parameter OpenIPSL.Types.PerUnit Iq0(fixed=false);
  parameter OpenIPSL.Types.PerUnit V0(fixed=false);
  parameter OpenIPSL.Types.PerUnit p00(fixed=false);
  parameter OpenIPSL.Types.PerUnit q00(fixed=false);
  parameter OpenIPSL.Types.PerUnit Vref0 = if vref0 == 0 then V0 else vref0;
  OpenIPSL.Types.PerUnit Vmod;
initial equation

  Ip0 = ip0;
  Iq0 = iq0;
  V0 = v0;
  p00 = p0;
  q00 = q0;

equation

  Voltage_dip = if Vt<Vdip or Vt>Vup then true else false;
  Vmod = if pfflag == false and vflag == false and qflag == true then V0 - PfFlag.y else Vbias;

  connect(VREF0.y,add. u2) annotation (Line(points={{-259,190},{-246,190},{-246,
          208},{-242,208}},color={0,0,127}));
  connect(dbd1_dbd2.y, gain2.u)
    annotation (Line(points={{-179,214},{-162,214}}, color={0,0,127}));
  connect(add.y, dbd1_dbd2.u)
    annotation (Line(points={{-219,214},{-202,214}}, color={0,0,127}));
  connect(gain2.y,limiter. u)
    annotation (Line(points={{-139,214},{-122,214}},
                                                 color={0,0,127}));
  connect(limiter.y, StateTransitionSwitch.u3)
    annotation (Line(points={{-99,214},{-6,214}},  color={0,0,127}));
  connect(State0.y, StateTransitionSwitch.u1) annotation (Line(points={{-23,270},
          {-16,270},{-16,230},{-6,230}},  color={0,0,127}));
  connect(StateTransitionLogic.y, StateTransitionSwitch.u2) annotation (Line(
        points={{-39,230},{-26,230},{-26,222},{-6,222}},  color={255,0,255}));
  connect(simpleLag1.y, product1.u1)
    annotation (Line(points={{-239,140},{-232,140}}, color={0,0,127}));
  connect(tan1.y, product1.u2) annotation (Line(points={{-239,110},{-232,110},{-232,
          128}},            color={0,0,127}));
  connect(Pe, simpleLag1.u)
    annotation (Line(points={{-320,120},{-280,120},{-280,140},{-262,140}},
                                                     color={0,0,127}));
  connect(PFAREF.y, tan1.u)
    annotation (Line(points={{-269,110},{-262,110}},
                                                   color={0,0,127}));
  connect(Qext, PfFlag.u3) annotation (Line(points={{-320,-40},{-196,-40},{-196,
          118},{-192,118}},
                       color={0,0,127}));
  connect(product1.y, PfFlag.u1)
    annotation (Line(points={{-209,134},{-192,134}}, color={0,0,127}));
  connect(PfFlag_logic.y, PfFlag.u2) annotation (Line(points={{-209,90},{-200,90},
          {-200,126},{-192,126}}, color={255,0,255}));
  connect(PfFlag.y, limiter1.u)
    annotation (Line(points={{-169,126},{-158,126}}, color={0,0,127}));
  connect(limiter1.y, add1.u1)
    annotation (Line(points={{-135,126},{-128,126}}, color={0,0,127}));
  connect(Qgen, add1.u2) annotation (Line(points={{-320,40},{-128,40},{-128,114}},
        color={0,0,127}));
  connect(Vflag_logic.y, VFlag.u2) annotation (Line(points={{-59,90},{-4,90},{-4,
          114},{2,114}}, color={255,0,255}));
  connect(limiter3.y,add4. u1) annotation (Line(points={{55,114},{60,114},{60,120},
          {64,120}}, color={0,0,127}));
  connect(Vt_filt2.y,add4. u2) annotation (Line(points={{65,94},{60,94},{60,108},
          {64,108}},           color={0,0,127}));
  connect(VFlag.y, limiter3.u)
    annotation (Line(points={{25,114},{32,114}}, color={0,0,127}));
  connect(QFLAG.y, QFlag.u2) annotation (Line(points={{187,56},{192,56},{192,74},
          {204,74}},                   color={255,0,255}));
  connect(variableLimiter.y, Iqcmd)
    annotation (Line(points={{295,80},{302,80},{302,150},{310,150}},
                                                 color={0,0,127}));
  connect(add6.y, variableLimiter.u)
    annotation (Line(points={{261,80},{272,80}}, color={0,0,127}));
  connect(IQMIN.y, variableLimiter.limit2) annotation (Line(points={{273,60},{266,
          60},{266,72},{272,72}}, color={0,0,127}));
  connect(IQMAX.y, variableLimiter.limit1) annotation (Line(points={{273,104},{266,
          104},{266,88},{272,88}}, color={0,0,127}));
  connect(QFlag.y, add6.u2) annotation (Line(points={{227,74},{232,74},{232,74},
          {238,74}}, color={0,0,127}));
  connect(add6.u1, StateTransitionSwitch.y) annotation (Line(points={{238,86},{236,
          86},{236,222},{17,222}},  color={0,0,127}));
  connect(Vt_filt1.y, limiter4.u)
    annotation (Line(points={{-39,-30},{-22,-30}}, color={0,0,127}));
  connect(limiter4.y, division.u2) annotation (Line(points={{1,-30},{8,-30},{8,-16},
          {18,-16}}, color={0,0,127}));
  connect(division.u1, limiter1.u) annotation (Line(points={{18,-4},{-164,-4},{-164,
          126},{-158,126}}, color={0,0,127}));
  connect(division.y, add7.u1)
    annotation (Line(points={{41,-10},{58,-10}}, color={0,0,127}));
  connect(integrator2.y, QFlag.u3) annotation (Line(points={{161,-10},{196,-10},
          {196,66},{204,66}}, color={0,0,127}));
  connect(add7.u2, QFlag.u3) annotation (Line(points={{58,-22},{48,-22},{48,-32},
          {196,-32},{196,66},{204,66}}, color={0,0,127}));
  connect(VDL2.u, limiter4.u) annotation (Line(points={{62,-90},{-28,-90},{-28,-30},
          {-22,-30}},                        color={0,0,127}));
  connect(VDL1.u, limiter4.u) annotation (Line(points={{62,-70},{-28,-70},{-28,-30},
          {-22,-30}},                   color={0,0,127}));
  connect(add8.y,limiter5. u)
    annotation (Line(points={{-181,-166},{-172,-166}},
                                                     color={0,0,127}));
  connect(integrator3.y,add8. u2) annotation (Line(points={{-119,-166},{-108,
          -166},{-108,-140},{-212,-140},{-212,-160},{-204,-160}},
                                                        color={0,0,127}));
  connect(integrator3.y,limiter6. u)
    annotation (Line(points={{-119,-166},{-62,-166}},
                                                   color={0,0,127}));
  connect(GeneratorSpeed.y, product5.u1) annotation (Line(points={{-251,-178},
          {-240,-178}},                   color={0,0,127}));
  connect(limiter6.y, division1.u1)
    annotation (Line(points={{-39,-166},{-22,-166}}, color={0,0,127}));
  connect(limiter7.y, division1.u2) annotation (Line(points={{-39,-210},{-30,-210},
          {-30,-178},{-22,-178}}, color={0,0,127}));
  connect(Vt_filt3.y, limiter7.u)
    annotation (Line(points={{-79,-210},{-62,-210}}, color={0,0,127}));
  connect(division1.y, variableLimiter1.u)
    annotation (Line(points={{1,-172},{58,-172}}, color={0,0,127}));
  connect(IPMIN.y, variableLimiter1.limit2) annotation (Line(points={{57,-202},{
          40,-202},{40,-180},{58,-180}}, color={0,0,127}));
  connect(IPMAX.y, variableLimiter1.limit1) annotation (Line(points={{59,-142},{
          40,-142},{40,-164},{58,-164}}, color={0,0,127}));
  connect(VDL2.y[1], CCL_REECA.VDL2_out)
    annotation (Line(points={{85,-90},{96.8,-89.6}}, color={0,0,127}));
  connect(VDL1.y[1], CCL_REECA.VDL1_out) annotation (Line(points={{85,-70},{85,-70.4},
          {96.8,-70.4}}, color={0,0,127}));
  connect(PQFLAG.y, CCL_REECA.pqflag)
    annotation (Line(points={{155,-80},{135.2,-80}}, color={255,0,255}));
  connect(IQCMD.y,CCL_REECA.Iqcmd)  annotation (Line(points={{155,-58},{140,-58},
          {140,-70.4},{135.2,-70.4}}, color={0,0,127}));
  connect(IPCMD.y,CCL_REECA.Ipcmd)  annotation (Line(points={{155,-102},{140,
          -102},{140,-89.6},{135.2,-89.6}},
                                      color={0,0,127}));
  connect(variableLimiter1.y, Ipcmd) annotation (Line(points={{81,-172},{260,-172},
          {260,-150},{310,-150}},
                                color={0,0,127}));
  connect(add3.y, VFlag.u3) annotation (Line(points={{-5,26},{0,26},{0,106},{2,106}},
        color={0,0,127}));
  connect(add3.u2, limiter1.u) annotation (Line(points={{-28,20},{-164,20},{-164,
          126},{-158,126}}, color={0,0,127}));
  connect(VBIAS.y, add3.u1)
    annotation (Line(points={{-39,32},{-28,32}}, color={0,0,127}));
  connect(add7.y, integrator2.u) annotation (Line(points={{81,-16},{124,-16},{124,
          -10},{138,-10}}, color={0,0,127}));
  connect(limiter5.y, integrator3.u)
    annotation (Line(points={{-149,-166},{-142,-166}}, color={0,0,127}));
  connect(product5.y, add8.u1)
    annotation (Line(points={{-217,-172},{-204,-172}}, color={0,0,127}));
  connect(product5.u2, Pref) annotation (Line(points={{-240,-166},{-292,-166},
          {-292,-120},{-320,-120}}, color={0,0,127}));
  connect(add4.y, pI_No_Windup.u)
    annotation (Line(points={{87,114},{92,114},{92,102},{96,102}},
                                                 color={0,0,127}));
  connect(IQMAX_.y, pI_No_Windup.limit1) annotation (Line(points={{167,134},{156,
          134},{156,150},{133.6,150},{133.6,138}}, color={0,0,127}));
  connect(IQMIN_.y, pI_No_Windup.limit2) annotation (Line(points={{167,84},{156,
          84},{156,72},{133.6,72},{133.6,90}}, color={0,0,127}));
  connect(pI_No_Windup.y, QFlag.u1)
    annotation (Line(points={{142,114},{204,114},{204,82}}, color={0,0,127}));
  connect(add1.y, pI_No_Windup_notVariable.u)
    annotation (Line(points={{-105,120},{-98,120},{-98,116},{-90,116}},
                                                    color={0,0,127}));
  connect(pI_No_Windup_notVariable.y, VFlag.u1) annotation (Line(points={{-67,122},
          {2,122}},                   color={0,0,127}));
  connect(VLogic.y, pI_No_Windup.voltage_dip)
    annotation (Line(points={{85,152},{96,152},{96,126}}, color={255,0,255}));
  connect(pI_No_Windup_notVariable.voltage_dip, pI_No_Windup.voltage_dip)
    annotation (Line(points={{-90,128},{-98,128},{-98,140},{96,140},{96,126}},
        color={255,0,255}));
  connect(VFilter.y, add.u1)
    annotation (Line(points={{-261,220},{-242,220}}, color={0,0,127}));
  connect(VFilter.u, Vt) annotation (Line(points={{-284,220},{-290,220},{-290,200},
          {-320,200}}, color={0,0,127}));
end REECA1;
