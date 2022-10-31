within OpenIPSL.Electrical.Renewables.PSSE;
package RenewableElectricalController
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
    connect(IQCMD.y,CCL_REECA.Iqcmd)  annotation (Line(points={{155,-58},{140,
            -58},{140,-70.4},{135.2,-70.4}},
                                        color={0,0,127}));
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

  model REECB1 "Electrical control model for large scale photovoltaic"
    extends
      OpenIPSL.Electrical.Renewables.PSSE.RenewableElectricalController.BaseClasses.BaseREECB(
       Iqcmd(start=Iq0), Ipcmd(start=Ip0));

    parameter OpenIPSL.Types.PerUnit Vdip = -99 "Low voltage threshold to activate reactive current injection logic (0.85 – 0.9 pu)";
    parameter OpenIPSL.Types.PerUnit Vup = 99 "Voltage above which reactive current injection logic is activated (>1.1 pu)";
    parameter OpenIPSL.Types.Time Trv = 0 "Filter time constant for voltage measurement (0.01 – 0.02 s)";
    parameter OpenIPSL.Types.PerUnit dbd1 = -0.05 "Voltage error dead band lower threshold (-0.1 – 0 pu)";
    parameter OpenIPSL.Types.PerUnit dbd2 = 0.05 "Voltage error dead band upper threshold (0 – 0.1 pu)";
    parameter Real Kqv = 0 "Reactive current injection gain during over and undervoltage conditions (0 – 10)";
    parameter OpenIPSL.Types.PerUnit Iqh1 = 1.05 "Upper limit on reactive current injection Iqinj (1 – 1.1 pu)";
    parameter OpenIPSL.Types.PerUnit Iql1 = -1.05 "Lower limit on reactive current injection Iqinj (-1.1 – 1 pu)";
    parameter OpenIPSL.Types.PerUnit vref0 = 1 "User defined voltage reference (0.95 – 1.05 pu)";
    parameter OpenIPSL.Types.Time Tp = 0.05 "Filter time constant for electrical power (0.01 - 0.1 s)";
    parameter OpenIPSL.Types.PerUnit Qmax = 0.4360 "Upper limits of the limit for reactive power regulator (0.4 – 1.0 pu)";
    parameter OpenIPSL.Types.PerUnit Qmin = -0.4360 "Lower limits of the  limit for reactive power regulator (-1.0 – -0.4 pu)";
    parameter OpenIPSL.Types.PerUnit Vmax = 1.1 "Maximum limit for voltage control (1.05 – 1.1 pu)";
    parameter OpenIPSL.Types.PerUnit Vmin = 0.9 "Lower limits of input signals (0.9 – 0.95 pu)";
    parameter Real Kqp = 0 "Reactive power regulator proportional gain (No predefined range)";
    parameter Real Kqi = 0.1 "Reactive power regulator integral gain (No predefined range)";
    parameter Real Kvp = 0 "Voltage regulator proportional gain (No predefined range)";
    parameter Real Kvi = 40 "Voltage regulator integral gain (No predefined range)";
    parameter OpenIPSL.Types.Time Tiq = 0.02 "Time constant on lag delay (0.01 - 0.02 s)";
    parameter Real dPmax = 99 "Power reference maximum ramp rate (No predefined range pu/s)";
    parameter Real dPmin = -99 "Lower limits of input signals (No predefined range pu/s)";
    parameter OpenIPSL.Types.PerUnit Pmax = 1 "Maximum power limit (1 pu)";
    parameter OpenIPSL.Types.PerUnit Pmin = 0 "Minimum power limit (0 pu)";
    parameter OpenIPSL.Types.PerUnit Imax = 1.82 "Maximum limit on total converter current (1.1 – 1.3 pu)";
    parameter OpenIPSL.Types.Time Tpord = 0.02 "Power filter time constant (0.01 - 0.02 s) ";

    Integer Voltage_dip;

    Modelica.Blocks.Sources.BooleanConstant PfFlag_logic(k=pfflag)
      annotation (Placement(transformation(extent={{-236,20},{-216,40}})));
    Modelica.Blocks.Logical.Switch PfFlag
      "Constant Q (False) or PF (True) local control."
      annotation (Placement(transformation(extent={{-196,56},{-176,76}})));
    Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=Qmax, uMin=Qmin)
      annotation (Placement(transformation(extent={{-162,56},{-142,76}})));
    Modelica.Blocks.Math.Add add1(k2=-1)
      annotation (Placement(transformation(extent={{-132,50},{-112,70}})));
    Modelica.Blocks.Continuous.Integrator integrator(
      k=Kqi,
      initType=Modelica.Blocks.Types.Init.InitialState,
      y_start=V0)
      annotation (Placement(transformation(extent={{-94,10},{-74,30}})));
    Modelica.Blocks.Math.Gain gain(k=Kqp)
      annotation (Placement(transformation(extent={{-92,50},{-72,70}})));
    Modelica.Blocks.Math.Add add2
      annotation (Placement(transformation(extent={{-66,44},{-46,64}})));
    Modelica.Blocks.Sources.RealExpression frzState(y=if Voltage_dip == 1 then 0
           else 1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-112,2})));
    Modelica.Blocks.Math.Product product2
      annotation (Placement(transformation(extent={{-122,10},{-102,30}})));
    Modelica.Blocks.Nonlinear.Limiter limiter2(uMax=Vmax, uMin=Vmin)
      annotation (Placement(transformation(extent={{-38,44},{-18,64}})));
    Modelica.Blocks.Sources.BooleanConstant Vflag_logic(k=vflag)
      annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
    Modelica.Blocks.Logical.Switch VFlag
      "Constant Q (False) or PF (True) local control."
      annotation (Placement(transformation(extent={{-2,44},{18,64}})));
    Modelica.Blocks.Nonlinear.Limiter limiter3(uMax=Vmax, uMin=Vmin)
      annotation (Placement(transformation(extent={{28,44},{48,64}})));
    Modelica.Blocks.Math.Add add4(k2=-1)
      annotation (Placement(transformation(extent={{60,44},{80,64}})));
    Modelica.Blocks.Sources.RealExpression Vt_filt2(y=simpleLag.y)
      annotation (Placement(transformation(extent={{80,44},{60,24}})));
    Modelica.Blocks.Math.Gain gain1(k=Kvp)
      annotation (Placement(transformation(extent={{100,44},{120,64}})));
    Modelica.Blocks.Continuous.Integrator integrator1(
      k=Kvi,
      initType=Modelica.Blocks.Types.Init.InitialState,
      y_start=-Iq0 - (-V0 + Vref0)*Kqv)
      annotation (Placement(transformation(extent={{100,10},{120,30}})));
    Modelica.Blocks.Math.Add add5
      annotation (Placement(transformation(extent={{128,38},{148,58}})));
    Modelica.Blocks.Math.Product product3
      annotation (Placement(transformation(extent={{54,-10},{74,10}})));
    Modelica.Blocks.Sources.RealExpression frzState1(y=if Voltage_dip == 1 then 0
           else 1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={30,-6})));
    Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter2
      annotation (Placement(transformation(extent={{162,38},{182,58}})));
    Modelica.Blocks.Sources.RealExpression IQMAX_(y=ccl.Iqmax) annotation (
        Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={172,74})));
    Modelica.Blocks.Sources.RealExpression IQMIN_(y=ccl.Iqmin) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={172,24})));
    Modelica.Blocks.Logical.Switch QFlag
      annotation (Placement(transformation(extent={{200,4},{220,24}})));
    Modelica.Blocks.Sources.BooleanConstant QFLAG(k=qflag)
      annotation (Placement(transformation(extent={{160,-14},{180,6}})));
    Modelica.Blocks.Math.Add add6(k2=+1)
      annotation (Placement(transformation(extent={{230,70},{250,90}})));
    Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter
      annotation (Placement(transformation(extent={{264,70},{284,90}})));
    Modelica.Blocks.Sources.RealExpression IQMIN(y=ccl.Iqmin)
      annotation (Placement(transformation(extent={{284,70},{264,50}})));
    Modelica.Blocks.Sources.RealExpression IQMAX(y=ccl.Iqmax)
      annotation (Placement(transformation(extent={{284,94},{264,114}})));
    Modelica.Blocks.Math.Add add7(k2=-1)
      annotation (Placement(transformation(extent={{54,-86},{74,-66}})));
    Modelica.Blocks.Continuous.Integrator integrator2(k=1/Tiq, y_start=-Iq0 - (-
          V0 + Vref0)*Kqv)
      annotation (Placement(transformation(extent={{134,-80},{154,-60}})));
    Modelica.Blocks.Math.Product product4
      annotation (Placement(transformation(extent={{98,-80},{118,-60}})));
    Modelica.Blocks.Sources.RealExpression Vt_filt1(y=simpleLag.y)
      annotation (Placement(transformation(extent={{-66,-100},{-46,-80}})));
    Modelica.Blocks.Nonlinear.Limiter limiter4(uMax=Modelica.Constants.inf, uMin=0.01)
      annotation (Placement(transformation(extent={{-26,-100},{-6,-80}})));
    Modelica.Blocks.Math.Division division
      annotation (Placement(transformation(extent={{14,-80},{34,-60}})));
    Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter1
      annotation (Placement(transformation(extent={{54,-180},{74,-160}})));
    Modelica.Blocks.Sources.RealExpression IPMAX(y=ccl.Ipmax) annotation (
        Placement(transformation(
          extent={{10,-10},{-10,10}},
          rotation=0,
          origin={64,-140})));
    Modelica.Blocks.Sources.RealExpression IPMIN(y=ccl.Ipmin)
      annotation (Placement(transformation(extent={{74,-210},{54,-190}})));
    NonElectrical.Continuous.SimpleLag          simpleLag(
      K=1,
      T=Trv,
      y_start=V0)
      annotation (Placement(transformation(extent={{-286,150},{-266,170}})));
    Modelica.Blocks.Math.Add add(k1=-1)
      annotation (Placement(transformation(extent={{-246,144},{-226,164}})));
    Modelica.Blocks.Nonlinear.Limiter limiter(uMax=Iqh1, uMin=Iql1)
      annotation (Placement(transformation(extent={{-126,144},{-106,164}})));
    Modelica.Blocks.Sources.RealExpression VREF0(y=Vref0)
      annotation (Placement(transformation(extent={{-286,120},{-266,140}})));
    Modelica.Blocks.Nonlinear.DeadZone dbd1_dbd2(uMax=dbd2, uMin=dbd1)
      annotation (Placement(transformation(extent={{-206,144},{-186,164}})));
    Modelica.Blocks.Math.Gain gain2(k=Kqv)
      annotation (Placement(transformation(extent={{-166,144},{-146,164}})));
    NonElectrical.Continuous.SimpleLag          simpleLag1(
      K=1,
      T=Tp,
      y_start=p00)
      annotation (Placement(transformation(extent={{-266,70},{-246,90}})));
    Modelica.Blocks.Math.Tan tan1
      annotation (Placement(transformation(extent={{-266,60},{-246,40}})));
    Modelica.Blocks.Math.Product product1
      annotation (Placement(transformation(extent={{-236,64},{-216,84}})));
    Modelica.Blocks.Sources.RealExpression PFAREF(y=pfangle)
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=180,
          origin={-286,50})));
    Modelica.Blocks.Math.Division division1
      annotation (Placement(transformation(extent={{-72,-180},{-52,-160}})));
    Modelica.Blocks.Nonlinear.Limiter limiter5(uMax=Modelica.Constants.inf, uMin=0.01)
      annotation (Placement(transformation(extent={{-132,-220},{-112,-200}})));
    Modelica.Blocks.Math.Add add8(k2=-1)
      annotation (Placement(transformation(extent={{-276,-176},{-256,-156}})));
    Modelica.Blocks.Nonlinear.Limiter limiter7(uMax=dPmax, uMin=dPmin)
      annotation (Placement(transformation(extent={{-240,-176},{-220,-156}})));
    Modelica.Blocks.Continuous.Integrator integrator3(k=1/Tpord, y_start=Ip0*V0)
      annotation (Placement(transformation(extent={{-152,-176},{-132,-156}})));
    Modelica.Blocks.Nonlinear.Limiter limiter8(uMax=Pmax, uMin=Pmin)
      annotation (Placement(transformation(extent={{-112,-176},{-92,-156}})));
    Modelica.Blocks.Sources.RealExpression Vt_filt3(y=simpleLag.y)
      annotation (Placement(transformation(extent={{-198,-220},{-178,-200}})));
    OpenIPSL.Electrical.Renewables.PSSE.RenewableElectricalController.BaseClasses.CLL_REECB
      ccl(
      start_ii=-Iq0,
      start_ir=Ip0,
      Imax=Imax)
      annotation (Placement(transformation(extent={{260,-40},{280,-20}})));
    Modelica.Blocks.Sources.BooleanConstant Pqflag_logic(k=pqflag)
      annotation (Placement(transformation(extent={{220,-40},{240,-20}})));

    Modelica.Blocks.Sources.RealExpression frzState2(y=if Voltage_dip == 1 then 0
           else 1) annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=0,
          origin={-230,-130})));
    Modelica.Blocks.Math.Product product6
      annotation (Placement(transformation(extent={{-190,-176},{-170,-156}})));
  protected
    parameter Real pfaref = p00/sqrt(p00^2 +q00^2) "Power Factor of choice.";
    parameter OpenIPSL.Types.Angle pfangle = if q00 > 0 then acos(pfaref) else -acos(pfaref);
    parameter OpenIPSL.Types.PerUnit Ip0(fixed=false);
    parameter OpenIPSL.Types.PerUnit Iq0(fixed=false);
    parameter OpenIPSL.Types.PerUnit V0(fixed=false);
    parameter OpenIPSL.Types.PerUnit p00(fixed=false);
    parameter OpenIPSL.Types.PerUnit q00(fixed=false);
    parameter OpenIPSL.Types.PerUnit Vref0 = if vref0 == 0 then V0 else vref0;

  initial equation

    Ip0 = ip0;
    Iq0 = iq0;
    V0 = v0;
    p00 = p0;
    q00 = q0;

  equation

    Voltage_dip = if Vt<Vdip or Vt>Vup then 1 else 0;
    connect(simpleLag.y,add. u1) annotation (Line(points={{-265,160},{-248,160}},
                              color={0,0,127}));
    connect(VREF0.y,add. u2) annotation (Line(points={{-265,130},{-252,130},{-252,
            148},{-248,148}},color={0,0,127}));
    connect(dbd1_dbd2.y,gain2. u)
      annotation (Line(points={{-185,154},{-168,154}}, color={0,0,127}));
    connect(add.y,dbd1_dbd2. u)
      annotation (Line(points={{-225,154},{-208,154}}, color={0,0,127}));
    connect(gain2.y,limiter. u)
      annotation (Line(points={{-145,154},{-128,154}},
                                                   color={0,0,127}));
    connect(simpleLag1.y,product1. u1)
      annotation (Line(points={{-245,80},{-238,80}},   color={0,0,127}));
    connect(tan1.y,product1. u2) annotation (Line(points={{-245,50},{-238,50},{-238,
            68}},             color={0,0,127}));
    connect(Pe,simpleLag1. u)
      annotation (Line(points={{-320,80},{-268,80}},   color={0,0,127}));
    connect(PFAREF.y,tan1. u)
      annotation (Line(points={{-275,50},{-268,50}}, color={0,0,127}));
    connect(Qext,PfFlag. u3) annotation (Line(points={{-320,-80},{-202,-80},{-202,
            58},{-198,58}},
                         color={0,0,127}));
    connect(product1.y,PfFlag. u1)
      annotation (Line(points={{-215,74},{-198,74}},   color={0,0,127}));
    connect(PfFlag_logic.y,PfFlag. u2) annotation (Line(points={{-215,30},{-206,30},
            {-206,66},{-198,66}},   color={255,0,255}));
    connect(PfFlag.y,limiter1. u)
      annotation (Line(points={{-175,66},{-164,66}},   color={0,0,127}));
    connect(limiter1.y,add1. u1)
      annotation (Line(points={{-141,66},{-134,66}},   color={0,0,127}));
    connect(Qgen,add1. u2) annotation (Line(points={{-320,0},{-134,0},{-134,54}},
          color={0,0,127}));
    connect(gain.y,add2. u1)
      annotation (Line(points={{-71,60},{-68,60}},          color={0,0,127}));
    connect(integrator.y,add2. u2)
      annotation (Line(points={{-73,20},{-70,20},{-70,48},{-68,48}},
                                                          color={0,0,127}));
    connect(product2.y,integrator. u)
      annotation (Line(points={{-101,20},{-96,20}},color={0,0,127}));
    connect(frzState.y,product2. u2) annotation (Line(points={{-123,2},{-128,2},{-128,
            14},{-124,14}},       color={0,0,127}));
    connect(add2.y,limiter2. u)
      annotation (Line(points={{-45,54},{-40,54}},   color={0,0,127}));
    connect(limiter2.y,VFlag. u1) annotation (Line(points={{-17,54},{-16,54},{-16,
            62},{-4,62}},  color={0,0,127}));
    connect(Vflag_logic.y,VFlag. u2) annotation (Line(points={{-37,0},{-14,0},{-14,
            54},{-4,54}},  color={255,0,255}));
    connect(limiter3.y,add4. u1) annotation (Line(points={{49,54},{54,54},{54,60},
            {58,60}},  color={0,0,127}));
    connect(Vt_filt2.y,add4. u2) annotation (Line(points={{59,34},{54,34},{54,48},
            {58,48}},            color={0,0,127}));
    connect(VFlag.y,limiter3. u)
      annotation (Line(points={{19,54},{26,54}},   color={0,0,127}));
    connect(gain1.y,add5. u1) annotation (Line(points={{121,54},{126,54}},
                  color={0,0,127}));
    connect(integrator1.y,add5. u2) annotation (Line(points={{121,20},{126,20},{126,
            42}},          color={0,0,127}));
    connect(frzState1.y,product3. u2) annotation (Line(points={{41,-6},{52,-6}},
                          color={0,0,127}));
    connect(product3.y,integrator1. u) annotation (Line(points={{75,0},{90,0},{90,
            20},{98,20}}, color={0,0,127}));
    connect(add5.y,variableLimiter2. u)
      annotation (Line(points={{149,48},{160,48}},   color={0,0,127}));
    connect(IQMAX_.y,variableLimiter2. limit1) annotation (Line(points={{161,74},{
            154,74},{154,56},{160,56}},     color={0,0,127}));
    connect(variableLimiter2.y,QFlag. u1)
      annotation (Line(points={{183,48},{198,48},{198,22}},   color={0,0,127}));
    connect(QFLAG.y,QFlag. u2) annotation (Line(points={{181,-4},{186,-4},{186,14},
            {198,14}},                   color={255,0,255}));
    connect(IQMIN_.y,variableLimiter2. limit2) annotation (Line(points={{161,24},{
            154,24},{154,40},{160,40}},   color={0,0,127}));
    connect(add6.y,variableLimiter. u)
      annotation (Line(points={{251,80},{262,80}}, color={0,0,127}));
    connect(IQMIN.y,variableLimiter. limit2) annotation (Line(points={{263,60},{256,
            60},{256,72},{262,72}}, color={0,0,127}));
    connect(IQMAX.y,variableLimiter. limit1) annotation (Line(points={{263,104},{256,
            104},{256,88},{262,88}}, color={0,0,127}));
    connect(QFlag.y,add6. u2) annotation (Line(points={{221,14},{228,14},{228,74}},
                       color={0,0,127}));
    connect(add7.y,product4. u2)
      annotation (Line(points={{75,-76},{96,-76}},  color={0,0,127}));
    connect(Vt_filt1.y,limiter4. u)
      annotation (Line(points={{-45,-90},{-28,-90}}, color={0,0,127}));
    connect(limiter4.y,division. u2) annotation (Line(points={{-5,-90},{2,-90},{2,
            -76},{12,-76}},
                       color={0,0,127}));
    connect(division.u1,limiter1. u) annotation (Line(points={{12,-64},{-170,-64},
            {-170,66},{-164,66}},
                              color={0,0,127}));
    connect(division.y,add7. u1)
      annotation (Line(points={{35,-70},{52,-70}}, color={0,0,127}));
    connect(integrator2.y,QFlag. u3) annotation (Line(points={{155,-70},{190,-70},
            {190,6},{198,6}},   color={0,0,127}));
    connect(add7.u2,QFlag. u3) annotation (Line(points={{52,-82},{42,-82},{42,-92},
            {190,-92},{190,6},{198,6}},   color={0,0,127}));
    connect(product4.y,integrator2. u)
      annotation (Line(points={{119,-70},{132,-70}}, color={0,0,127}));
    connect(product4.u1,product3. u2) annotation (Line(points={{96,-64},{84,-64},{
            84,-34},{46,-34},{46,-6},{52,-6}},
                                          color={0,0,127}));
    connect(IPMIN.y,variableLimiter1. limit2) annotation (Line(points={{53,-200},{
            34,-200},{34,-178},{52,-178}}, color={0,0,127}));
    connect(IPMAX.y,variableLimiter1. limit1) annotation (Line(points={{53,-140},{
            34,-140},{34,-162},{52,-162}}, color={0,0,127}));
    connect(variableLimiter1.y, Ipcmd) annotation (Line(points={{75,-170},{254,-170},
            {254,-150},{310,-150}},
                                  color={0,0,127}));
    connect(Vt, simpleLag.u)
      annotation (Line(points={{-320,160},{-288,160}}, color={0,0,127}));
    connect(limiter.y, add6.u1)
      annotation (Line(points={{-105,154},{228,154},{228,86}}, color={0,0,127}));
    connect(limiter5.y,division1. u2) annotation (Line(points={{-111,-210},{-86,-210},
            {-86,-176},{-74,-176}}, color={0,0,127}));
    connect(add8.y,limiter7. u)
      annotation (Line(points={{-255,-166},{-242,-166}},
                                                       color={0,0,127}));
    connect(integrator3.y,limiter8. u)
      annotation (Line(points={{-131,-166},{-114,-166}},
                                                       color={0,0,127}));
    connect(add8.u2,limiter8. u) annotation (Line(points={{-278,-172},{-278,-188},
            {-124,-188},{-124,-166},{-114,-166}},    color={0,0,127}));
    connect(limiter8.y,division1. u1) annotation (Line(points={{-91,-166},{-82,-166},
            {-82,-164},{-74,-164}}, color={0,0,127}));
    connect(Vt_filt3.y,limiter5. u)
      annotation (Line(points={{-177,-210},{-134,-210}},
                                                    color={0,0,127}));
    connect(add8.u1, Pref)
      annotation (Line(points={{-278,-160},{-320,-160}}, color={0,0,127}));
    connect(division1.y, variableLimiter1.u)
      annotation (Line(points={{-51,-170},{52,-170}}, color={0,0,127}));
    connect(variableLimiter.y, Iqcmd)
      annotation (Line(points={{285,80},{298,80},{298,150},{310,150}},
                                                   color={0,0,127}));
    connect(Pqflag_logic.y, ccl.Pqflag)
      annotation (Line(points={{241,-30},{258,-30}}, color={255,0,255}));
    connect(ccl.Iqcmd, Iqcmd) annotation (Line(points={{282,-25},{292,-25},{292,150},
            {310,150}},color={0,0,127}));
    connect(ccl.Ipcmd, Ipcmd) annotation (Line(points={{282,-35},{292,-35},{292,-150},
            {310,-150}},color={0,0,127}));
    connect(product2.u1, add1.y) annotation (Line(points={{-124,26},{-128,26},{-128,
            40},{-111,40},{-111,60}}, color={0,0,127}));
    connect(gain.u, integrator.u) annotation (Line(points={{-94,60},{-98,60},{-98,
            20},{-96,20}}, color={0,0,127}));
    connect(product3.u1, add4.y) annotation (Line(points={{52,6},{50,6},{50,8},{46,
            8},{46,20},{84,20},{84,54},{81,54}}, color={0,0,127}));
    connect(gain1.u, integrator1.u) annotation (Line(points={{98,54},{90,54},{90,20},
            {98,20}}, color={0,0,127}));
    connect(frzState2.y, product6.u1) annotation (Line(points={{-219,-130},{-204,-130},
            {-204,-160},{-192,-160}}, color={0,0,127}));
    connect(limiter7.y, product6.u2) annotation (Line(points={{-219,-166},{-212,-166},
            {-212,-172},{-192,-172}}, color={0,0,127}));
    connect(product6.y, integrator3.u)
      annotation (Line(points={{-169,-166},{-154,-166}}, color={0,0,127}));
    connect(VFlag.u3, limiter1.u) annotation (Line(points={{-4,46},{-8,46},{-8,
            -64},{-170,-64},{-170,66},{-164,66}}, color={0,0,127}));
  end REECB1;

  model REECCU1
    "Electrical control model for utility scale battery energy storage"
    extends
      OpenIPSL.Electrical.Renewables.PSSE.RenewableElectricalController.BaseClasses.BaseREECC(
        Iqcmd(start=Iq0), Ipcmd(start=Ip0));

    parameter OpenIPSL.Types.PerUnit Vdip = -99 "Low voltage threshold to activate reactive current injection logic (0.85 – 0.9 pu)";
    parameter OpenIPSL.Types.PerUnit Vup = 99 "Voltage above which reactive current injection logic is activated (>1.1 pu)";
    parameter OpenIPSL.Types.Time Trv = 0.01 "Filter time constant for voltage measurement (0.01 – 0.02 s)";
    parameter OpenIPSL.Types.PerUnit dbd1 = 0 "Voltage error dead band lower threshold (-0.1 – 0 pu)";
    parameter OpenIPSL.Types.PerUnit dbd2 = 0 "Voltage error dead band upper threshold (0 – 0.1 pu)";
    parameter Real Kqv = 0 "Reactive current injection gain during over and undervoltage conditions (0 – 10)";
    parameter OpenIPSL.Types.PerUnit Iqh1 = 1 "Upper limit on reactive current injection Iqinj (1 – 1.1 pu)";
    parameter OpenIPSL.Types.PerUnit Iql1 = -1 "Lower limit on reactive current injection Iqinj (-1.1 – 1 pu)";
    parameter OpenIPSL.Types.PerUnit vref0 = 1 "User defined voltage reference (0.95 – 1.05 pu)";
    parameter OpenIPSL.Types.Time Tp = 0.01 "Filter time constant for electrical power (0.01 - 0.1 s)";
    parameter OpenIPSL.Types.PerUnit Qmax = 1 "Upper limits of the limit for reactive power regulator (0.4 – 1.0 pu)";
    parameter OpenIPSL.Types.PerUnit Qmin = -1 "Lower limits of the  limit for reactive power regulator (-1.0 – -0.4 pu)";
    parameter OpenIPSL.Types.PerUnit Vmax = 1.1 "Maximum limit for voltage control (1.05 – 1.1 pu)";
    parameter OpenIPSL.Types.PerUnit Vmin = 0.9 "Lower limits of input signals (0.9 – 0.95 pu)";
    parameter Real Kqp = 0 "Reactive power regulator proportional gain (No predefined range)";
    parameter Real Kqi = 0.1 "Reactive power regulator integral gain (No predefined range)";
    parameter Real Kvp = 0 "Voltage regulator proportional gain (No predefined range)";
    parameter Real Kvi = 40 "Voltage regulator integral gain (No predefined range)";
    parameter OpenIPSL.Types.Time Tiq = 0.01 "Time constant on lag delay (0.01 - 0.02 s)";
    parameter Real dPmax = 99 "Power reference maximum ramp rate (No predefined range pu/s)";
    parameter Real dPmin = -99 "Lower limits of input signals (No predefined range pu/s)";
    parameter OpenIPSL.Types.PerUnit Pmax = 1 "Maximum power limit (1 pu)";
    parameter OpenIPSL.Types.PerUnit Pmin = 0 "Minimum power limit (0 pu)";
    parameter OpenIPSL.Types.PerUnit Imax = 1.1 "Maximum limit on total converter current (1.1 – 1.3 pu)";
    parameter OpenIPSL.Types.Time Tpord = 0.02 "Power filter time constant (0.01 - 0.02 s) ";
    parameter OpenIPSL.Types.PerUnit Vq1 = 0.2 "Reactive Power V-I pair, voltage (user defined)";
    parameter OpenIPSL.Types.PerUnit Iq1 = 0.75 "Reactive Power V-I pair, current (user defined)";
    parameter OpenIPSL.Types.PerUnit Vq2 = 0.5 "Reactive Power V-I pair, voltage (user defined)";
    parameter OpenIPSL.Types.PerUnit Iq2 = 0.75 "Reactive Power V-I pair, current (user defined)";
    parameter OpenIPSL.Types.PerUnit Vq3 = 0.75 "Reactive Power V-I pair, voltage (user defined)";
    parameter OpenIPSL.Types.PerUnit Iq3 = 0.75 "Reactive Power V-I pair, current (user defined)";
    parameter OpenIPSL.Types.PerUnit Vq4 = 1 "Reactive Power V-I pair, voltage (user defined)";
    parameter OpenIPSL.Types.PerUnit Iq4 = 0.75 "Reactive Power V-I pair, current (user defined)";
    parameter OpenIPSL.Types.PerUnit Vp1 = 0.2 "Real Power V-I pair, voltage (user defined)";
    parameter OpenIPSL.Types.PerUnit Ip1 = 1.11 "Real Power V-I pair, current (user defined)";
    parameter OpenIPSL.Types.PerUnit Vp2 = 0.5 "Real Power V-I pair, voltage (user defined)";
    parameter OpenIPSL.Types.PerUnit Ip2 = 1.11 "Real Power V-I pair, current (user defined)";
    parameter OpenIPSL.Types.PerUnit Vp3 = 0.75 "Real Power V-I pair, voltage (user defined)";
    parameter OpenIPSL.Types.PerUnit Ip3 = 1.11 "Real Power V-I pair, current (user defined)";
    parameter OpenIPSL.Types.PerUnit Vp4 = 1 "Real Power V-I pair, voltage (user defined)";
    parameter OpenIPSL.Types.PerUnit Ip4 = 1.11 "Real Power V-I pair, current (user defined)";
    parameter Modelica.Units.SI.Time T = 999 "Battery discharge time (s)";
    parameter OpenIPSL.Types.PerUnit SOCini = 0.5 "Initial state of charge";
    parameter OpenIPSL.Types.PerUnit SOCmax = 0.8 "Maximum allowable state of charge";
    parameter OpenIPSL.Types.PerUnit SOCmin = 0.2 "Minimum allowable state of charge";

    Integer Voltage_dip;

    Modelica.Blocks.Math.Division division1
      annotation (Placement(transformation(extent={{-54,-120},{-34,-140}})));
    Modelica.Blocks.Nonlinear.Limiter limiter5(uMax=Modelica.Constants.inf, uMin=0.01)
      annotation (Placement(transformation(extent={{-100,-90},{-80,-70}})));
    Modelica.Blocks.Math.Add add8(k2=-1)
      annotation (Placement(transformation(extent={{-242,-136},{-222,-116}})));
    Modelica.Blocks.Nonlinear.Limiter limiter7(uMax=dPmax, uMin=dPmin)
      annotation (Placement(transformation(extent={{-208,-136},{-188,-116}})));
    Modelica.Blocks.Continuous.Integrator integrator3(k=1/Tpord,
      initType=Modelica.Blocks.Types.Init.InitialState,          y_start=Ip0*V0)
      annotation (Placement(transformation(extent={{-142,-136},{-122,-116}})));
    Modelica.Blocks.Nonlinear.Limiter limiter8(uMax=Pmax, uMin=Pmin)
      annotation (Placement(transformation(extent={{-102,-136},{-82,-116}})));
    Modelica.Blocks.Sources.RealExpression Vt_filt3(y=simpleLag.y)
      annotation (Placement(transformation(extent={{-140,-90},{-120,-70}})));
    Modelica.Blocks.Math.Add add7(k1=+1, k2=+1)
      annotation (Placement(transformation(extent={{-18,-140},{2,-120}})));
    Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter2
      annotation (Placement(transformation(extent={{230,-140},{250,-120}})));
    Modelica.Blocks.Sources.RealExpression IPMAX(y=ccl_reecc.Ipmax) annotation (
        Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={242,-90})));
    Modelica.Blocks.Sources.RealExpression IPMIN(y=ccl_reecc.Ipmin) annotation (
        Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={242,-154})));
    Modelica.Blocks.Math.Product product2
      annotation (Placement(transformation(extent={{226,-106},{206,-86}})));
    Modelica.Blocks.Math.Product product3
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},
          rotation=180,
          origin={216,-160})));
    Modelica.Blocks.Sources.RealExpression SOC_ipmax(y=sOC_logic.ipmax_SOC)
      annotation (Placement(transformation(extent={{252,-92},{232,-112}})));
    Modelica.Blocks.Sources.RealExpression SOC_ipmin(y=sOC_logic.ipmin_SOC)
      annotation (Placement(transformation(extent={{252,-156},{232,-176}})));
    Modelica.Blocks.Sources.RealExpression PELEC(y=Pe)
      annotation (Placement(transformation(extent={{-164,-226},{-144,-206}})));
    Modelica.Blocks.Continuous.Integrator integrator1(k=1/T,
      initType=Modelica.Blocks.Types.Init.InitialState,      y_start=p00)
      annotation (Placement(transformation(extent={{-134,-226},{-114,-206}})));
    Modelica.Blocks.Math.Add add1(k1=-1, k2=+1)
      annotation (Placement(transformation(extent={{-104,-244},{-84,-224}})));
    Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=SOCmax, uMin=SOCmin)
      annotation (Placement(transformation(extent={{-74,-244},{-54,-224}})));
    OpenIPSL.Electrical.Renewables.PSSE.RenewableElectricalController.BaseClasses.SOC_logic
      sOC_logic(SOCmin=SOCmin, SOCmax=SOCmax)
      annotation (Placement(transformation(extent={{-30,-244},{-10,-224}})));
    Modelica.Blocks.Sources.BooleanConstant PfFlag_logic(k=pfflag)
      annotation (Placement(transformation(extent={{-254,86},{-234,106}})));
    Modelica.Blocks.Logical.Switch PfFlag
      "Constant Q (False) or PF (True) local control."
      annotation (Placement(transformation(extent={{-198,136},{-178,156}})));
    Modelica.Blocks.Nonlinear.Limiter limiter2(uMax=Qmax, uMin=Qmin)
      annotation (Placement(transformation(extent={{-164,136},{-144,156}})));
    Modelica.Blocks.Math.Add add2(k2=-1)
      annotation (Placement(transformation(extent={{-134,130},{-114,150}})));
    Modelica.Blocks.Continuous.Integrator integrator(
      k=Kqi,
      initType=Modelica.Blocks.Types.Init.InitialState,
      y_start=V0)
      annotation (Placement(transformation(extent={{-94,90},{-74,110}})));
    Modelica.Blocks.Math.Gain gain(k=Kqp)
      annotation (Placement(transformation(extent={{-94,130},{-74,150}})));
    Modelica.Blocks.Math.Add add3
      annotation (Placement(transformation(extent={{-68,124},{-48,144}})));
    Modelica.Blocks.Sources.RealExpression frzState(y=if Voltage_dip == 1 then 0
           else 1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={-114,82})));
    Modelica.Blocks.Math.Product product1
      annotation (Placement(transformation(extent={{-124,90},{-104,110}})));
    Modelica.Blocks.Nonlinear.Limiter limiter3(uMax=Vmax, uMin=Vmin)
      annotation (Placement(transformation(extent={{-40,124},{-20,144}})));
    Modelica.Blocks.Sources.BooleanConstant Vflag_logic(k=vflag)
      annotation (Placement(transformation(extent={{-60,70},{-40,90}})));
    Modelica.Blocks.Logical.Switch VFlag
      "Constant Q (False) or PF (True) local control."
      annotation (Placement(transformation(extent={{-4,124},{16,144}})));
    Modelica.Blocks.Sources.RealExpression VReF0(y=Vref0) annotation (Placement(
          transformation(
          extent={{-10,10},{10,-10}},
          rotation=0,
          origin={-38,50})));
    Modelica.Blocks.Nonlinear.Limiter limiter4(uMax=Vmax, uMin=Vmin)
      annotation (Placement(transformation(extent={{26,124},{46,144}})));
    Modelica.Blocks.Math.Add add5(k2=-1)
      annotation (Placement(transformation(extent={{58,124},{78,144}})));
    Modelica.Blocks.Sources.RealExpression Vt_filt2(y=simpleLag.y)
      annotation (Placement(transformation(extent={{78,124},{58,104}})));
    Modelica.Blocks.Math.Gain gain1(k=Kvp)
      annotation (Placement(transformation(extent={{100,124},{120,144}})));
    Modelica.Blocks.Continuous.Integrator integrator2(
      k=Kvi,
      initType=Modelica.Blocks.Types.Init.InitialState,
      y_start=-Iq0 - (-V0 + Vref0)*Kqv)
      annotation (Placement(transformation(extent={{100,114},{120,94}})));
    Modelica.Blocks.Math.Add add6
      annotation (Placement(transformation(extent={{126,118},{146,138}})));
    Modelica.Blocks.Math.Product product4
      annotation (Placement(transformation(extent={{52,70},{72,90}})));
    Modelica.Blocks.Sources.RealExpression frzState1(y=if Voltage_dip == 1 then 0
           else 1) annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={28,74})));
    Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter1
      annotation (Placement(transformation(extent={{158,120},{178,140}})));
    Modelica.Blocks.Sources.RealExpression IQMAX_(y=ccl_reecc.Iqmax) annotation (
        Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={170,154})));
    Modelica.Blocks.Sources.RealExpression IQMIN_(y=ccl_reecc.Iqmin) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={170,104})));
    Modelica.Blocks.Logical.Switch QFlag
      annotation (Placement(transformation(extent={{198,84},{218,104}})));
    Modelica.Blocks.Sources.BooleanConstant QFLAG(k=qflag)
      annotation (Placement(transformation(extent={{158,66},{178,86}})));
    Modelica.Blocks.Math.Add add9(k2=+1)
      annotation (Placement(transformation(extent={{234,70},{254,90}})));
    Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter
      annotation (Placement(transformation(extent={{268,70},{288,90}})));
    Modelica.Blocks.Sources.RealExpression IQMIN(y=ccl_reecc.Iqmin)
      annotation (Placement(transformation(extent={{288,70},{268,50}})));
    Modelica.Blocks.Sources.RealExpression IQMAX(y=ccl_reecc.Iqmax)
      annotation (Placement(transformation(extent={{288,94},{268,114}})));
    Modelica.Blocks.Math.Add add10(k2=-1)
      annotation (Placement(transformation(extent={{52,-6},{72,14}})));
    Modelica.Blocks.Continuous.Integrator integrator4(k=1/Tiq,
      initType=Modelica.Blocks.Types.Init.InitialState,        y_start=-Iq0 - (-
          V0 + Vref0)*Kqv)
      annotation (Placement(transformation(extent={{132,0},{152,20}})));
    Modelica.Blocks.Math.Product product5
      annotation (Placement(transformation(extent={{96,0},{116,20}})));
    Modelica.Blocks.Sources.RealExpression Vt_filt1(y=simpleLag.y)
      annotation (Placement(transformation(extent={{-68,-20},{-48,0}})));
    Modelica.Blocks.Nonlinear.Limiter limiter6(uMax=Modelica.Constants.inf, uMin=0.01)
      annotation (Placement(transformation(extent={{-28,-20},{-8,0}})));
    Modelica.Blocks.Math.Division division
      annotation (Placement(transformation(extent={{12,0},{32,20}})));
    Modelica.Blocks.Tables.CombiTable1Ds VDL1(table=[Vq1,Iq1; Vq2,Iq2; Vq3,Iq3;
          Vq4,Iq4],
      smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
      extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
      annotation (Placement(transformation(extent={{56,-60},{76,-40}})));
    Modelica.Blocks.Tables.CombiTable1Ds VDL2(table=[Vp1,Ip1; Vp2,Ip2; Vp3,Ip3;
          Vp4,Ip4],
      smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
      extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
      annotation (Placement(transformation(extent={{56,-60},{76,-80}})));
    OpenIPSL.Electrical.Renewables.PSSE.RenewableElectricalController.BaseClasses.CCL_REECC
      ccl_reecc(
      start_ii=-Iq0,
      start_ir=Ip0,
      Imax=Imax)
      annotation (Placement(transformation(extent={{92,-76},{124,-44}})));
    Modelica.Blocks.Sources.RealExpression IQCMD(y=Iqcmd)
      annotation (Placement(transformation(extent={{168,-48},{148,-28}})));
    Modelica.Blocks.Sources.BooleanConstant PQFLAG(k=pqflag)
      annotation (Placement(transformation(extent={{168,-50},{148,-70}})));
    Modelica.Blocks.Sources.RealExpression IPCMD(y=Ipcmd)
      annotation (Placement(transformation(extent={{168,-72},{148,-92}})));
    NonElectrical.Continuous.SimpleLag          simpleLag(
      K=1,
      T=Trv,
      y_start=V0)
      annotation (Placement(transformation(extent={{-288,230},{-268,250}})));
    Modelica.Blocks.Math.Add add(k1=-1)
      annotation (Placement(transformation(extent={{-248,224},{-228,244}})));
    Modelica.Blocks.Nonlinear.Limiter limiter(uMax=Iqh1, uMin=Iql1)
      annotation (Placement(transformation(extent={{-128,224},{-108,244}})));
    Modelica.Blocks.Sources.RealExpression VREF0(y=Vref0)
      annotation (Placement(transformation(extent={{-288,200},{-268,220}})));
    Modelica.Blocks.Nonlinear.DeadZone dbd1_dbd2(uMax=dbd2, uMin=dbd1)
      annotation (Placement(transformation(extent={{-208,224},{-188,244}})));
    Modelica.Blocks.Math.Gain gain2(k=Kqv)
      annotation (Placement(transformation(extent={{-168,224},{-148,244}})));
    NonElectrical.Continuous.SimpleLag          simpleLag1(
      K=1,
      T=Tp,
      y_start=p00)
      annotation (Placement(transformation(extent={{-268,150},{-248,170}})));
    Modelica.Blocks.Math.Tan tan1
      annotation (Placement(transformation(extent={{-268,140},{-248,120}})));
    Modelica.Blocks.Math.Product product6
      annotation (Placement(transformation(extent={{-238,144},{-218,164}})));
    Modelica.Blocks.Sources.RealExpression PFAREF(y=pfangle)
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},
          rotation=180,
          origin={-288,130})));

    Modelica.Blocks.Math.Product product7
      annotation (Placement(transformation(extent={{-174,-136},{-154,-116}})));
    Modelica.Blocks.Sources.RealExpression frzState2(y=if Voltage_dip == 1 then 0
           else 1) annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=0,
          origin={-196,-96})));
    Modelica.Blocks.Sources.Constant SOC(k=SOCini)
      annotation (Placement(transformation(extent={{-200,-260},{-180,-240}})));
  protected
    parameter Real pfaref=p00/sqrt(p00^2 +q00^2) "Power Factor of choice.";
    parameter OpenIPSL.Types.Angle pfangle = if q00 > 0 then acos(pfaref) else -acos(pfaref);
    parameter OpenIPSL.Types.PerUnit Ip0(fixed=false);
    parameter OpenIPSL.Types.PerUnit Iq0(fixed=false);
    parameter OpenIPSL.Types.PerUnit V0(fixed=false);
    parameter OpenIPSL.Types.PerUnit p00(fixed=false);
    parameter OpenIPSL.Types.PerUnit q00(fixed=false);
    parameter OpenIPSL.Types.PerUnit Vref0 = if vref0 == 0 then V0 else vref0;

  initial equation

    Ip0 = ip0;
    Iq0 = iq0;
    V0 = v0;
    p00 = p0;
    q00 = q0;
  equation

    Voltage_dip = if Vt<Vdip or Vt>Vup then 1 else 0;

    connect(limiter5.y,division1. u2) annotation (Line(points={{-79,-80},{-68,-80},
            {-68,-124},{-56,-124}}, color={0,0,127}));
    connect(add8.y,limiter7. u)
      annotation (Line(points={{-221,-126},{-210,-126}},
                                                       color={0,0,127}));
    connect(integrator3.y,limiter8. u)
      annotation (Line(points={{-121,-126},{-104,-126}},
                                                       color={0,0,127}));
    connect(add8.u2,limiter8. u) annotation (Line(points={{-244,-132},{-252,-132},
            {-252,-152},{-112,-152},{-112,-126},{-104,-126}},
                                                     color={0,0,127}));
    connect(Vt_filt3.y,limiter5. u)
      annotation (Line(points={{-119,-80},{-102,-80}},
                                                    color={0,0,127}));
    connect(add8.u1, Pref)
      annotation (Line(points={{-244,-120},{-292,-120},{-292,-80},{-320,-80}},
                                                         color={0,0,127}));
    connect(limiter8.y, division1.u1) annotation (Line(points={{-81,-126},{-72,-126},
            {-72,-136},{-56,-136}}, color={0,0,127}));
    connect(division1.y, add7.u1) annotation (Line(points={{-33,-130},{-28,-130},{
            -28,-124},{-20,-124}}, color={0,0,127}));
    connect(Paux, add7.u2) annotation (Line(points={{-320,-160},{-26,-160},{-26,-136},
            {-20,-136}}, color={0,0,127}));
    connect(variableLimiter2.y, Ipcmd)
      annotation (Line(points={{251,-130},{292,-130},{292,-80},{310,-80}},
                                                       color={0,0,127}));
    connect(add7.y,variableLimiter2. u) annotation (Line(points={{3,-130},{228,-130}},
                                                          color={0,0,127}));
    connect(product2.y,variableLimiter2. limit1) annotation (Line(points={{205,-96},
            {182,-96},{182,-122},{228,-122}},
                                    color={0,0,127}));
    connect(IPMAX.y,product2. u1)
      annotation (Line(points={{231,-90},{228,-90}},           color={0,0,127}));
    connect(product3.u2,IPMIN. y)
      annotation (Line(points={{228,-154},{231,-154}}, color={0,0,127}));
    connect(variableLimiter2.limit2,product3. y) annotation (Line(points={{228,-138},
            {182,-138},{182,-160},{205,-160}}, color={0,0,127}));
    connect(product2.u2,SOC_ipmax. y)
      annotation (Line(points={{228,-102},{231,-102}},
                                                     color={0,0,127}));
    connect(product3.u1,SOC_ipmin. y)
      annotation (Line(points={{228,-166},{231,-166}}, color={0,0,127}));
    connect(PELEC.y,integrator1. u)
      annotation (Line(points={{-143,-216},{-136,-216}},
                                                       color={0,0,127}));
    connect(integrator1.y,add1. u1) annotation (Line(points={{-113,-216},{-112,-216},
            {-112,-228},{-106,-228}}, color={0,0,127}));
    connect(add1.y,limiter1. u)
      annotation (Line(points={{-83,-234},{-76,-234}}, color={0,0,127}));
    connect(limiter1.y,sOC_logic. SOC)
      annotation (Line(points={{-53,-234},{-32,-234}},color={0,0,127}));
    connect(simpleLag.y,add. u1) annotation (Line(points={{-267,240},{-250,240}},
                              color={0,0,127}));
    connect(VREF0.y,add. u2) annotation (Line(points={{-267,210},{-254,210},{-254,
            228},{-250,228}},color={0,0,127}));
    connect(dbd1_dbd2.y,gain2. u)
      annotation (Line(points={{-187,234},{-170,234}}, color={0,0,127}));
    connect(add.y,dbd1_dbd2. u)
      annotation (Line(points={{-227,234},{-210,234}}, color={0,0,127}));
    connect(gain2.y,limiter. u)
      annotation (Line(points={{-147,234},{-130,234}},
                                                   color={0,0,127}));
    connect(simpleLag1.y,product6. u1)
      annotation (Line(points={{-247,160},{-240,160}}, color={0,0,127}));
    connect(tan1.y,product6. u2) annotation (Line(points={{-247,130},{-240,130},{-240,
            148}},            color={0,0,127}));
    connect(Pe,simpleLag1. u)
      annotation (Line(points={{-320,160},{-270,160}}, color={0,0,127}));
    connect(PFAREF.y,tan1. u)
      annotation (Line(points={{-277,130},{-270,130}},
                                                     color={0,0,127}));
    connect(Qext,PfFlag. u3) annotation (Line(points={{-320,0},{-204,0},{-204,138},
            {-200,138}}, color={0,0,127}));
    connect(product6.y,PfFlag. u1)
      annotation (Line(points={{-217,154},{-200,154}}, color={0,0,127}));
    connect(PfFlag_logic.y,PfFlag. u2) annotation (Line(points={{-233,96},{-208,
            96},{-208,146},{-200,146}},
                                    color={255,0,255}));
    connect(PfFlag.y,limiter2. u)
      annotation (Line(points={{-177,146},{-166,146}}, color={0,0,127}));
    connect(limiter2.y,add2. u1)
      annotation (Line(points={{-143,146},{-136,146}}, color={0,0,127}));
    connect(Qgen,add2. u2) annotation (Line(points={{-320,80},{-136,80},{-136,134}},
          color={0,0,127}));
    connect(gain.y,add3. u1)
      annotation (Line(points={{-73,140},{-70,140}},        color={0,0,127}));
    connect(integrator.y,add3. u2)
      annotation (Line(points={{-73,100},{-72,100},{-72,128},{-70,128}},
                                                          color={0,0,127}));
    connect(product1.y,integrator. u)
      annotation (Line(points={{-103,100},{-96,100}},
                                                   color={0,0,127}));
    connect(frzState.y,product1. u2) annotation (Line(points={{-125,82},{-130,82},
            {-130,94},{-126,94}}, color={0,0,127}));
    connect(add3.y,limiter3. u)
      annotation (Line(points={{-47,134},{-42,134}}, color={0,0,127}));
    connect(limiter3.y,VFlag. u1) annotation (Line(points={{-19,134},{-18,134},{-18,
            142},{-6,142}},color={0,0,127}));
    connect(Vflag_logic.y,VFlag. u2) annotation (Line(points={{-39,80},{-16,80},{-16,
            134},{-6,134}},color={255,0,255}));
    connect(limiter4.y,add5. u1) annotation (Line(points={{47,134},{52,134},{52,140},
            {56,140}}, color={0,0,127}));
    connect(Vt_filt2.y,add5. u2) annotation (Line(points={{57,114},{52,114},{52,128},
            {56,128}},           color={0,0,127}));
    connect(VFlag.y,limiter4. u)
      annotation (Line(points={{17,134},{24,134}}, color={0,0,127}));
    connect(gain1.y,add6. u1) annotation (Line(points={{121,134},{124,134}},
                  color={0,0,127}));
    connect(integrator2.y,add6. u2) annotation (Line(points={{121,104},{124,104},{
            124,122}},     color={0,0,127}));
    connect(frzState1.y,product4. u2) annotation (Line(points={{39,74},{50,74}},
                          color={0,0,127}));
    connect(product4.y,integrator2. u) annotation (Line(points={{73,80},{88,80},{88,
            104},{98,104}},
                          color={0,0,127}));
    connect(add6.y,variableLimiter1. u)
      annotation (Line(points={{147,128},{152,128},{152,130},{156,130}},
                                                     color={0,0,127}));
    connect(IQMAX_.y,variableLimiter1. limit1) annotation (Line(points={{159,154},
            {152,154},{152,138},{156,138}}, color={0,0,127}));
    connect(variableLimiter1.y,QFlag. u1)
      annotation (Line(points={{179,130},{196,130},{196,102}},color={0,0,127}));
    connect(QFLAG.y,QFlag. u2) annotation (Line(points={{179,76},{184,76},{184,94},
            {196,94}},                   color={255,0,255}));
    connect(IQMIN_.y,variableLimiter1. limit2) annotation (Line(points={{159,104},
            {152,104},{152,122},{156,122}},
                                          color={0,0,127}));
    connect(add9.y,variableLimiter. u)
      annotation (Line(points={{255,80},{266,80}}, color={0,0,127}));
    connect(IQMIN.y,variableLimiter. limit2) annotation (Line(points={{267,60},{260,
            60},{260,72},{266,72}}, color={0,0,127}));
    connect(IQMAX.y,variableLimiter. limit1) annotation (Line(points={{267,104},{260,
            104},{260,88},{266,88}}, color={0,0,127}));
    connect(QFlag.y,add9. u2) annotation (Line(points={{219,94},{220,94},{220,74},
            {232,74}}, color={0,0,127}));
    connect(add10.y, product5.u2)
      annotation (Line(points={{73,4},{94,4}}, color={0,0,127}));
    connect(Vt_filt1.y,limiter6. u)
      annotation (Line(points={{-47,-10},{-30,-10}}, color={0,0,127}));
    connect(limiter6.y,division. u2) annotation (Line(points={{-7,-10},{0,-10},{0,
            4},{10,4}},color={0,0,127}));
    connect(division.u1,limiter2. u) annotation (Line(points={{10,16},{-172,16},{-172,
            146},{-166,146}}, color={0,0,127}));
    connect(division.y, add10.u1)
      annotation (Line(points={{33,10},{50,10}}, color={0,0,127}));
    connect(integrator4.y,QFlag. u3) annotation (Line(points={{153,10},{188,10},{188,
            86},{196,86}},      color={0,0,127}));
    connect(add10.u2, QFlag.u3) annotation (Line(points={{50,-2},{40,-2},{40,-12},
            {188,-12},{188,86},{196,86}}, color={0,0,127}));
    connect(product5.y,integrator4. u)
      annotation (Line(points={{117,10},{130,10}},   color={0,0,127}));
    connect(product5.u1,product4. u2) annotation (Line(points={{94,16},{82,16},{82,
            46},{44,46},{44,74},{50,74}}, color={0,0,127}));
    connect(VDL2.u,limiter6. u) annotation (Line(points={{54,-70},{-36,-70},{-36,-10},
            {-30,-10}},                        color={0,0,127}));
    connect(VDL1.u,limiter6. u) annotation (Line(points={{54,-50},{-36,-50},{-36,-10},
            {-30,-10}},                   color={0,0,127}));
    connect(VDL2.y[1], ccl_reecc.VDL2_out)
      annotation (Line(points={{77,-70},{88.8,-69.6}}, color={0,0,127}));
    connect(VDL1.y[1], ccl_reecc.VDL1_out) annotation (Line(points={{77,-50},{77,-50.4},
            {88.8,-50.4}}, color={0,0,127}));
    connect(PQFLAG.y, ccl_reecc.pqflag)
      annotation (Line(points={{147,-60},{127.2,-60}}, color={255,0,255}));
    connect(IQCMD.y, ccl_reecc.Iqcmd) annotation (Line(points={{147,-38},{132,
            -38},{132,-50.4},{127.2,-50.4}},
                                        color={0,0,127}));
    connect(IPCMD.y, ccl_reecc.Ipcmd) annotation (Line(points={{147,-82},{132,
            -82},{132,-69.6},{127.2,-69.6}},
                                        color={0,0,127}));
    connect(limiter.y, add9.u1)
      annotation (Line(points={{-107,234},{232,234},{232,86}}, color={0,0,127}));
    connect(variableLimiter.y, Iqcmd)
      annotation (Line(points={{289,80},{310,80}}, color={0,0,127}));
    connect(Vt, simpleLag.u)
      annotation (Line(points={{-320,240},{-290,240}}, color={0,0,127}));
    connect(product1.u1, add2.y) annotation (Line(points={{-126,106},{-130,106},{-130,
            122},{-113,122},{-113,140}}, color={0,0,127}));
    connect(gain.u, product1.y) annotation (Line(points={{-96,140},{-100,140},{-100,
            100},{-103,100}}, color={0,0,127}));
    connect(gain1.u, integrator2.u) annotation (Line(points={{98,134},{88,134},{88,
            104},{98,104}}, color={0,0,127}));
    connect(product4.u1, add5.y) annotation (Line(points={{50,86},{44,86},{44,98},
            {82,98},{82,134},{79,134}}, color={0,0,127}));
    connect(product7.y, integrator3.u)
      annotation (Line(points={{-153,-126},{-144,-126}}, color={0,0,127}));
    connect(limiter7.y, product7.u2) annotation (Line(points={{-187,-126},{-180,-126},
            {-180,-132},{-176,-132}}, color={0,0,127}));
    connect(frzState2.y, product7.u1) annotation (Line(points={{-185,-96},{-182,-96},
            {-182,-120},{-176,-120}}, color={0,0,127}));
    connect(VReF0.y, VFlag.u3)
      annotation (Line(points={{-27,50},{-6,50},{-6,126}}, color={0,0,127}));
    connect(SOC.y, add1.u2) annotation (Line(points={{-179,-250},{-128,-250},{-128,
            -240},{-106,-240}}, color={0,0,127}));
  end REECCU1;

  package BaseClasses "Base classes for renewable energy electrica control models from PSSE"
    extends Modelica.Icons.BasesPackage;
    partial model BaseREECA "Base renewable energy electrical controller model A"

      parameter Boolean pfflag=true "Constant output value" annotation (Dialog(tab="Control"));
      parameter Boolean vflag=true "Constant output value" annotation (Dialog(tab="Control"));
      parameter Boolean qflag=true "Constant output value" annotation (Dialog(tab="Control"));
      parameter Boolean pqflag=true "Constant output value" annotation (Dialog(tab="Control"));
      parameter Boolean pflag=true "Constant output value" annotation (Dialog(tab="Control"));

      Modelica.Blocks.Interfaces.RealInput Vt
        annotation (Placement(transformation(extent={{-340,180},{-300,220}}),
            iconTransformation(extent={{-340,180},{-300,220}})));
      Modelica.Blocks.Interfaces.RealInput Pe
        annotation (Placement(transformation(extent={{-340,100},{-300,140}}),
            iconTransformation(extent={{-340,100},{-300,140}})));
      Modelica.Blocks.Interfaces.RealInput Qext
        "Connector of second Real input signal"
        annotation (Placement(transformation(extent={{-340,-60},{-300,-20}}),
            iconTransformation(extent={{-340,-60},{-300,-20}})));
      Modelica.Blocks.Interfaces.RealInput Qgen "Connector of Real input signal 2"
        annotation (Placement(transformation(extent={{-340,20},{-300,60}}),
            iconTransformation(extent={{-340,20},{-300,60}})));
      Modelica.Blocks.Interfaces.RealInput Pref annotation (Placement(
            transformation(extent={{-340,-140},{-300,-100}}),
            iconTransformation(extent={{-340,-140},{-300,-100}})));
      Modelica.Blocks.Interfaces.RealInput ip0 annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={120,-320}),  iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={120,-320})));
      Modelica.Blocks.Interfaces.RealInput iq0 annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={230,-320}),  iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={230,-320})));
      Modelica.Blocks.Interfaces.RealOutput Iqcmd
        annotation (Placement(transformation(extent={{300,140},{320,160}}),
            iconTransformation(extent={{300,140},{320,160}})));
      Modelica.Blocks.Interfaces.RealOutput Ipcmd
        annotation (Placement(transformation(extent={{300,-160},{320,-140}}),
            iconTransformation(extent={{300,-160},{320,-140}})));
      Modelica.Blocks.Interfaces.RealInput Wg annotation (Placement(
            transformation(extent={{-340,-220},{-300,-180}}), iconTransformation(
              extent={{-340,-220},{-300,-180}})));

      Modelica.Blocks.Interfaces.RealInput v0 annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-320}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-320})));
      Modelica.Blocks.Interfaces.RealInput p0 annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-230,-320}),iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-230,-320})));
      Modelica.Blocks.Interfaces.RealInput q0 annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-120,-320}),iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-120,-320})));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-300,-300},
                {300,300}}), graphics={Rectangle(extent={{-300,300},{300,-300}},
                lineColor={0,0,255}),
            Text(
              extent={{-280,220},{-220,180}},
              textColor={0,0,255},
              textString="VT"),
            Text(
              extent={{-280,140},{-168,100}},
              textColor={0,0,255},
              textString="PGEN"),
            Text(
              extent={{-280,60},{-168,20}},
              textColor={0,0,255},
              textString="QGEN"),
            Text(
              extent={{-280,-20},{-168,-60}},
              textColor={0,0,255},
              textString="QEXT"),
            Text(
              extent={{-280,-100},{-168,-140}},
              textColor={0,0,255},
              textString="PREF"),
            Text(
              extent={{-270,-180},{-210,-220}},
              textColor={0,0,255},
              textString="WG"),
            Text(
              extent={{-260,-254},{-200,-294}},
              textColor={0,0,255},
              textString="P0"),
            Text(
              extent={{-150,-254},{-90,-294}},
              textColor={0,0,255},
              textString="Q0"),
            Text(
              extent={{-30,-254},{30,-294}},
              textColor={0,0,255},
              textString="V0"),
            Text(
              extent={{90,-254},{150,-294}},
              textColor={0,0,255},
              textString="IP0"),
            Text(
              extent={{204,-254},{264,-294}},
              textColor={0,0,255},
              textString="IQ0"),
            Text(
              extent={{-140,98},{160,-100}},
              textColor={0,0,255},
              textString="REECA1"),
            Text(
              extent={{178,168},{290,128}},
              textColor={0,0,255},
              textString="IQCMD"),
            Text(
              extent={{178,-132},{290,-172}},
              textColor={0,0,255},
              textString="IPCMD")}),       Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-300,-300},{300,300}})));

    end BaseREECA;

    partial model BaseREECB "Base renewable energy electrical controller model B"

      parameter Boolean pfflag=true "Constant output value" annotation (Dialog(tab="Control"));
      parameter Boolean vflag=true "Constant output value" annotation (Dialog(tab="Control"));
      parameter Boolean qflag=true "Constant output value" annotation (Dialog(tab="Control"));
      parameter Boolean pqflag=true "Constant output value" annotation (Dialog(tab="Control"));

      Modelica.Blocks.Interfaces.RealInput Vt
        annotation (Placement(transformation(extent={{-340,140},{-300,180}}),
            iconTransformation(extent={{-340,140},{-300,180}})));
      Modelica.Blocks.Interfaces.RealInput Pe
        annotation (Placement(transformation(extent={{-340,60},{-300,100}}),
            iconTransformation(extent={{-340,60},{-300,100}})));
      Modelica.Blocks.Interfaces.RealInput Qext
        "Connector of second Real input signal"
        annotation (Placement(transformation(extent={{-340,-100},{-300,-60}}),
            iconTransformation(extent={{-340,-100},{-300,-60}})));
      Modelica.Blocks.Interfaces.RealInput Qgen "Connector of Real input signal 2"
        annotation (Placement(transformation(extent={{-340,-20},{-300,20}}),
            iconTransformation(extent={{-340,-20},{-300,20}})));
      Modelica.Blocks.Interfaces.RealInput Pref annotation (Placement(
            transformation(extent={{-340,-180},{-300,-140}}),
            iconTransformation(extent={{-340,-180},{-300,-140}})));
      Modelica.Blocks.Interfaces.RealInput ip0 annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={120,-320}),  iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={120,-320})));
      Modelica.Blocks.Interfaces.RealInput iq0 annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={230,-320}),  iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={230,-320})));
      Modelica.Blocks.Interfaces.RealOutput Iqcmd
        annotation (Placement(transformation(extent={{300,140},{320,160}}),
            iconTransformation(extent={{300,140},{320,160}})));
      Modelica.Blocks.Interfaces.RealOutput Ipcmd
        annotation (Placement(transformation(extent={{300,-160},{320,-140}}),
            iconTransformation(extent={{300,-160},{320,-140}})));

      Modelica.Blocks.Interfaces.RealInput v0 annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-320}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-320})));
      Modelica.Blocks.Interfaces.RealInput p0 annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-230,-320}),iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-230,-320})));
      Modelica.Blocks.Interfaces.RealInput q0 annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-120,-320}),iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-120,-320})));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-300,-300},
                {300,300}}), graphics={Rectangle(extent={{-300,300},{300,-300}},
                lineColor={0,0,255}),
            Text(
              extent={{-140,98},{160,-100}},
              textColor={0,0,255},
              textString="REECB1"),
            Text(
              extent={{-280,180},{-220,140}},
              textColor={0,0,255},
              textString="VT"),
            Text(
              extent={{-280,100},{-168,60}},
              textColor={0,0,255},
              textString="PGEN"),
            Text(
              extent={{-280,20},{-168,-20}},
              textColor={0,0,255},
              textString="QGEN"),
            Text(
              extent={{-280,-60},{-168,-100}},
              textColor={0,0,255},
              textString="QEXT"),
            Text(
              extent={{-280,-140},{-168,-180}},
              textColor={0,0,255},
              textString="PREF"),
            Text(
              extent={{-260,-256},{-200,-296}},
              textColor={0,0,255},
              textString="P0"),
            Text(
              extent={{-150,-256},{-90,-296}},
              textColor={0,0,255},
              textString="Q0"),
            Text(
              extent={{-30,-256},{30,-296}},
              textColor={0,0,255},
              textString="V0"),
            Text(
              extent={{90,-256},{150,-296}},
              textColor={0,0,255},
              textString="IP0"),
            Text(
              extent={{204,-256},{264,-296}},
              textColor={0,0,255},
              textString="IQ0"),
            Text(
              extent={{178,168},{290,128}},
              textColor={0,0,255},
              textString="IQCMD"),
            Text(
              extent={{178,-132},{290,-172}},
              textColor={0,0,255},
              textString="IPCMD")}),       Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-300,-300},{300,300}})));

    end BaseREECB;

    partial model BaseREECC "Base renewable energy electrical controller model C"

      parameter Boolean pfflag=true "Constant output value" annotation (Dialog(tab="Control"));
      parameter Boolean vflag=true "Constant output value" annotation (Dialog(tab="Control"));
      parameter Boolean qflag=true "Constant output value" annotation (Dialog(tab="Control"));
      parameter Boolean pqflag=true "Constant output value" annotation (Dialog(tab="Control"));

      Modelica.Blocks.Interfaces.RealInput ip0 annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={120,-320}),  iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={120,-320})));
      Modelica.Blocks.Interfaces.RealInput iq0 annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={230,-320}),  iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={230,-320})));
      Modelica.Blocks.Interfaces.RealOutput Iqcmd
        annotation (Placement(transformation(extent={{300,70},{320,90}}),
            iconTransformation(extent={{300,140},{320,160}})));
      Modelica.Blocks.Interfaces.RealOutput Ipcmd
        annotation (Placement(transformation(extent={{300,-90},{320,-70}}),
            iconTransformation(extent={{300,-160},{320,-140}})));

      Modelica.Blocks.Interfaces.RealInput v0 annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-320}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-320})));
      Modelica.Blocks.Interfaces.RealInput p0 annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-230,-320}),iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-230,-320})));
      Modelica.Blocks.Interfaces.RealInput q0 annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-120,-320}),iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-120,-320})));
      Modelica.Blocks.Interfaces.RealInput Vt
        annotation (Placement(transformation(extent={{-340,220},{-300,260}}),
            iconTransformation(extent={{-340,220},{-300,260}})));
      Modelica.Blocks.Interfaces.RealInput Pe
        annotation (Placement(transformation(extent={{-340,140},{-300,180}}),
            iconTransformation(extent={{-340,140},{-300,180}})));
      Modelica.Blocks.Interfaces.RealInput Qext
        "Connector of second Real input signal"
        annotation (Placement(transformation(extent={{-340,-20},{-300,20}}),
            iconTransformation(extent={{-340,-20},{-300,20}})));
      Modelica.Blocks.Interfaces.RealInput Qgen "Connector of Real input signal 2"
        annotation (Placement(transformation(extent={{-340,60},{-300,100}}),
            iconTransformation(extent={{-340,60},{-300,100}})));
      Modelica.Blocks.Interfaces.RealInput Pref annotation (Placement(
            transformation(extent={{-340,-100},{-300,-60}}),
            iconTransformation(extent={{-340,-100},{-300,-60}})));
      Modelica.Blocks.Interfaces.RealInput Paux annotation (Placement(
            transformation(extent={{-340,-180},{-300,-140}}), iconTransformation(
              extent={{-340,-180},{-300,-140}})));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-300,-300},
                {300,300}}), graphics={Rectangle(extent={{-300,300},{300,-300}},
                lineColor={0,0,255}),
            Text(
              extent={{-140,100},{160,-98}},
              textColor={0,0,255},
              textString="REECCU1"),
            Text(
              extent={{-280,258},{-220,218}},
              textColor={0,0,255},
              textString="VT"),
            Text(
              extent={{-280,178},{-168,138}},
              textColor={0,0,255},
              textString="PGEN"),
            Text(
              extent={{-280,98},{-168,58}},
              textColor={0,0,255},
              textString="QGEN"),
            Text(
              extent={{-280,18},{-168,-22}},
              textColor={0,0,255},
              textString="QEXT"),
            Text(
              extent={{-280,-62},{-168,-102}},
              textColor={0,0,255},
              textString="PREF"),
            Text(
              extent={{-260,-256},{-200,-296}},
              textColor={0,0,255},
              textString="P0"),
            Text(
              extent={{-150,-256},{-90,-296}},
              textColor={0,0,255},
              textString="Q0"),
            Text(
              extent={{-30,-256},{30,-296}},
              textColor={0,0,255},
              textString="V0"),
            Text(
              extent={{90,-256},{150,-296}},
              textColor={0,0,255},
              textString="IP0"),
            Text(
              extent={{204,-256},{264,-296}},
              textColor={0,0,255},
              textString="IQ0"),
            Text(
              extent={{178,168},{290,128}},
              textColor={0,0,255},
              textString="IQCMD"),
            Text(
              extent={{178,-132},{290,-172}},
              textColor={0,0,255},
              textString="IPCMD"),
            Text(
              extent={{-280,-142},{-168,-182}},
              textColor={0,0,255},
              textString="PAUX")}),        Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-300,-300},{300,300}})));

    end BaseREECC;

    model CLL_REECB "Current Limit Logic for REECB"

      parameter OpenIPSL.Types.PerUnit start_ii;
      parameter OpenIPSL.Types.PerUnit start_ir;
      parameter OpenIPSL.Types.PerUnit Imax;

      Modelica.Blocks.Interfaces.RealInput Iqcmd(start = -start_ii) annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={70,120}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={120,50})));
      Modelica.Blocks.Interfaces.RealInput Ipcmd(start = start_ir) annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={70,-120}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={120,-50})));
      Modelica.Blocks.Interfaces.RealOutput Iqmin annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-70,110}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-60,110})));
      Modelica.Blocks.Interfaces.RealOutput Iqmax annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-30,110}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={60,110})));
      Modelica.Blocks.Interfaces.RealOutput Ipmin annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-70,-110}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,-110})));
      Modelica.Blocks.Interfaces.RealOutput Ipmax annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-30,-110}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={60,-110})));
      Modelica.Blocks.Interfaces.BooleanInput Pqflag "Priority to reactive current (false) or active current (true)." annotation (Placement(transformation(extent={{-140,
                -20},{-100,20}})));

    equation

      Ipmax = if Pqflag == true then Imax else sqrt(Imax^2 - Iqcmd^2);
      Ipmin = 0;
      Iqmax = if Pqflag == true then sqrt(Imax^2 - Ipcmd^2) else Imax;
      Iqmin = -Iqmax;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={28,108,200}),        Text(
              extent={{-60,40},{60,-40}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="CLL REECB"),        Text(
              extent={{-80,106},{-40,66}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="IQMIN"),            Text(
              extent={{40,106},{80,66}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="IQMAX"),            Text(
              extent={{-78,-68},{-38,-108}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="IPMIN"),            Text(
              extent={{40,-68},{80,-108}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="IPMAX"),            Text(
              extent={{52,70},{92,30}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="IQCMD"),            Text(
              extent={{50,-30},{90,-70}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="IPCMD")}),                                 Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end CLL_REECB;

    model CCL_REECA "Current limit logic for REECA"

      parameter OpenIPSL.Types.PerUnit start_ii;
      parameter OpenIPSL.Types.PerUnit start_ir;
      parameter Real Imax;


      OpenIPSL.Types.PerUnit post_local_I;
      OpenIPSL.Types.PerUnit local_I;



      Modelica.Blocks.Interfaces.RealInput VDL1_out annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-120,60}), iconTransformation(extent={{-140,80},{-100,40}})));
      Modelica.Blocks.Interfaces.BooleanInput pqflag annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={120,0}), iconTransformation(
            extent={{0,0},{40,40}},
            rotation=180,
            origin={140,20})));
      Modelica.Blocks.Interfaces.RealInput VDL2_out annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-120,-60}), iconTransformation(extent={{-140,-40},{-100,-80}})));
      Modelica.Blocks.Interfaces.RealInput Iqcmd annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={120,60}), iconTransformation(
            extent={{-13.3335,-13.3336},{26.6673,26.6664}},
            rotation=180,
            origin={126.667,66.6664})));
      Modelica.Blocks.Interfaces.RealInput Ipcmd annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={120,-60}), iconTransformation(
            extent={{-3.63659,79.9998},{36.3659,39.9999}},
            rotation=180,
            origin={136.363,-0.0002})));
      Modelica.Blocks.Interfaces.RealOutput Iqmax annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-60,110})));
      Modelica.Blocks.Interfaces.RealOutput Iqmin annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={60,110})));
      Modelica.Blocks.Interfaces.RealOutput Ipmax annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,-110})));
      Modelica.Blocks.Interfaces.RealOutput Ipmin annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={60,-110})));
    equation

        local_I = if pqflag == false then sqrt(Imax) - sqrt(abs(Iqcmd)) else sqrt(Imax) - sqrt(abs(Ipcmd));
        post_local_I = if local_I < 0 then 0 else sqrt(local_I);





        Iqmax = if pqflag == false then min(VDL1_out, Imax) else min(post_local_I, VDL1_out);
        //Iqmax = if pqflag == false then VDL1_out else min(VDL1_out, sqrt((Imax^2) - (Ipcmd^2)));
        //Iqmax = if pqflag == false then min(VDL1_out, Imax) else min(VDL1_out, sqrt(Imax^2 - Ipcmd^2));
        //Iqmax = if pqflag == false then (if post_local_I < VDL1_out then post_local_I else VDL1_out) else (if post_local_I < VDL1_out then post_local_I else VDL1_out);

        Iqmin = -Iqmax;
        Ipmax = if pqflag == false then min(post_local_I, VDL2_out) else min(VDL2_out, Imax);
        //Ipmax = if pqflag == false then min(VDL2_out, sqrt(Imax^2 - Iqcmd^2)) else min(VDL2_out, Imax);
        Ipmin = 0;

      annotation (Icon(graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={28,108,200},
              fillColor={255,255,255},
              fillPattern=FillPattern.None),  Text(
              extent={{-60,40},{60,-40}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="CLL REECA(C)"),     Text(
              extent={{52,80},{92,40}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="IQCMD"),            Text(
              extent={{52,-40},{92,-80}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="IPCMD"),            Text(
              extent={{-90,80},{-50,40}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="VDL1"),             Text(
              extent={{-90,-40},{-50,-80}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="VDL2"),             Text(
              extent={{-68,98},{-28,58}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="IQMIN"),            Text(
              extent={{52,98},{92,58}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="IQMAX")}));
    end CCL_REECA;

    model SOC_logic "State of charge logic for REECC"
      Modelica.Blocks.Interfaces.RealInput SOC
        annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
      Modelica.Blocks.Interfaces.RealOutput ipmax_SOC
        annotation (Placement(transformation(extent={{100,-60},{120,-40}}),
            iconTransformation(extent={{100,-60},{120,-40}})));
      Modelica.Blocks.Interfaces.RealOutput ipmin_SOC
        annotation (Placement(transformation(extent={{100,40},{120,60}}),
            iconTransformation(extent={{100,40},{120,60}})));
            parameter Real SOCmin;
            parameter Real SOCmax;
    equation
      ipmax_SOC = if SOC <= SOCmin then 0 else 1;
      ipmin_SOC = if SOC >= SOCmax then 0 else 1;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={28,108,200},
              fillColor={255,255,255},
              fillPattern=FillPattern.None),
            Text(
              extent={{-50,156},{48,74}},
              textColor={28,108,200},
              textString="SOC Logic"),
            Text(
              extent={{-90,12},{-60,-14}},
              textColor={28,108,200},
              textString="SOC"),
            Text(
              extent={{14,90},{94,10}},
              textColor={28,108,200},
              textString="IPMIN SOC"),
            Text(
              extent={{14,-10},{94,-90}},
              textColor={28,108,200},
              textString="IPMAX SOC")}),                             Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end SOC_logic;

    model CCL_REECC "Current limit logic for REECC"

      parameter OpenIPSL.Types.PerUnit start_ii;
      parameter OpenIPSL.Types.PerUnit start_ir;
      parameter Real Imax;

      Modelica.Blocks.Interfaces.RealInput VDL1_out annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-120,60}), iconTransformation(extent={{-140,80},{-100,40}})));
      Modelica.Blocks.Interfaces.BooleanInput pqflag annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={120,0}), iconTransformation(
            extent={{0,0},{40,40}},
            rotation=180,
            origin={140,20})));
      Modelica.Blocks.Interfaces.RealInput VDL2_out annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-120,-60}), iconTransformation(extent={{-140,-40},{-100,-80}})));
      Modelica.Blocks.Interfaces.RealInput Iqcmd(start = -start_ii) annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={120,60}), iconTransformation(
            extent={{-13.3335,-13.3336},{26.6673,26.6664}},
            rotation=180,
            origin={126.667,66.6664})));
      Modelica.Blocks.Interfaces.RealInput Ipcmd(start =  start_ir) annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={120,-60}), iconTransformation(
            extent={{-3.63659,79.9998},{36.3659,39.9999}},
            rotation=180,
            origin={136.363,-0.0002})));
      Modelica.Blocks.Interfaces.RealOutput Iqmax annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-60,110})));
      Modelica.Blocks.Interfaces.RealOutput Iqmin annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={60,110})));
      Modelica.Blocks.Interfaces.RealOutput Ipmax annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,-110})));
      Modelica.Blocks.Interfaces.RealOutput Ipmin annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={60,-110})));
    equation

        Iqmax = if pqflag == false then min(VDL1_out, Imax) else min(VDL1_out, sqrt(Imax^2 - Ipcmd^2));
        Iqmin = -Iqmax;
        Ipmax = if pqflag == false then min(VDL2_out, sqrt(Imax^2-Iqcmd^2)) else min(VDL2_out, Imax);
        Ipmin = -Ipmax;

      annotation (Icon(graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={28,108,200},
              fillColor={255,255,255},
              fillPattern=FillPattern.None),  Text(
              extent={{-60,40},{60,-40}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="CLL REECA(C)"),     Text(
              extent={{52,80},{92,40}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="IQCMD"),            Text(
              extent={{52,-40},{92,-80}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="IPCMD"),            Text(
              extent={{-90,80},{-50,40}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="VDL1"),             Text(
              extent={{-90,-40},{-50,-80}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="VDL2"),             Text(
              extent={{-68,98},{-28,58}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="IQMIN"),            Text(
              extent={{52,98},{92,58}},
              lineColor={28,108,200},
              lineThickness=0.5,
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid,
              textString="IQMAX")}));
    end CCL_REECC;

    model PI_WECC_VariableLimiter
      import Modelica.Units.SI;
      parameter SI.PerUnit K_P "Voltage regulator proportional gain (pu)";
      parameter SI.TimeAging K_I "Voltage regulator integral gain (pu)";
      parameter Real y_start;
      Modelica.Blocks.Continuous.Integrator    integral(
        k=K_I,
        use_reset=false,
        initType=Modelica.Blocks.Types.Init.InitialOutput,
        y_start=y_start)
        annotation (Placement(transformation(extent={{4,30},{24,50}})));
      Modelica.Blocks.Math.Gain proportional(k=K_P)
        annotation (Placement(transformation(extent={{-26,-50},{-6,-30}})));
      Modelica.Blocks.Math.Add PI_add
        annotation (Placement(transformation(extent={{38,-10},{58,10}})));
      Modelica.Blocks.Logical.Switch reset_switch
        annotation (Placement(transformation(extent={{-56,30},{-36,50}})));
      Modelica.Blocks.Sources.RealExpression realExpression
        annotation (Placement(transformation(extent={{-88,70},{-68,90}})));
      Modelica.Blocks.Interfaces.RealInput u
        annotation (Placement(transformation(extent={{-140,-80},{-100,-40}}),
            iconTransformation(extent={{-140,-80},{-100,-40}})));
      Modelica.Blocks.Interfaces.RealOutput y
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter1
        annotation (Placement(transformation(extent={{70,-10},{90,10}})));
      Modelica.Blocks.Interfaces.RealInput limit1
        "Connector of Real input signal used as maximum of input u" annotation (
          Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={68,120})));
      Modelica.Blocks.Interfaces.RealInput limit2
        "Connector of Real input signal used as minimum of input u" annotation (
          Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={68,-120})));
      Modelica.Blocks.Logical.Or or1
        annotation (Placement(transformation(extent={{-92,30},{-72,50}})));
      Modelica.Blocks.Interfaces.BooleanInput voltage_dip
        "Connector of first Boolean input signal"
        annotation (Placement(transformation(extent={{-140,40},{-100,80}}),
            iconTransformation(extent={{-140,40},{-100,80}})));
    equation
      or1.u2 =
      if (abs(variableLimiter1.limit1 - y) <= Modelica.Constants.eps and der(integral.y)>0) then true
      else if (abs(variableLimiter1.limit2 - y) <= Modelica.Constants.eps and der(integral.y)<0) then true
      else false;
      connect(proportional.y, PI_add.u2) annotation (Line(points={{-5,-40},{30,-40},
              {30,-6},{36,-6}}, color={0,0,127}));
      connect(reset_switch.u1,realExpression. y)
        annotation (Line(points={{-58,48},{-58,80},{-67,80}},
                                                     color={0,0,127}));
      connect(reset_switch.u3,u)  annotation (Line(points={{-58,32},{-70,32},{
              -70,-60},{-120,-60}},
                         color={0,0,127}));
      connect(reset_switch.y,integral. u)
        annotation (Line(points={{-35,40},{2,40}},   color={0,0,127}));
      connect(proportional.u,u)
        annotation (Line(points={{-28,-40},{-70,-40},{-70,-60},{-120,-60}},
                                                    color={0,0,127}));
      connect(PI_add.y, variableLimiter1.u)
        annotation (Line(points={{59,0},{68,0}}, color={0,0,127}));
      connect(variableLimiter1.y, y)
        annotation (Line(points={{91,0},{110,0}}, color={0,0,127}));
      connect(variableLimiter1.limit1, limit1)
        annotation (Line(points={{68,8},{68,120}}, color={0,0,127}));
      connect(variableLimiter1.limit2, limit2)
        annotation (Line(points={{68,-8},{68,-120}}, color={0,0,127}));
      connect(integral.y, PI_add.u1)
        annotation (Line(points={{25,40},{30,40},{30,6},{36,6}}, color={0,0,127}));
      connect(or1.y, reset_switch.u2)
        annotation (Line(points={{-71,40},{-58,40}}, color={255,0,255}));
      connect(or1.u1, voltage_dip)
        annotation (Line(points={{-94,40},{-108,40},{-108,60},{-120,60}},
                                                      color={255,0,255}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}), Text(
              extent={{-80,40},{80,-40}},
              textColor={0,0,255},
              textString="PI WECC Renewables")}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}})));
    end PI_WECC_VariableLimiter;

    model PI_WECC_NoVariableLimiter
      import Modelica.Units.SI;
      parameter SI.PerUnit K_P "Voltage regulator proportional gain (pu)";
      parameter SI.TimeAging K_I "Voltage regulator integral gain (pu)";
      parameter SI.PerUnit V_RMAX "Maximum regulator output (pu)";
      parameter SI.PerUnit V_RMIN "Minimum regulator output (pu)";
      parameter Real y_start;
      Modelica.Blocks.Continuous.Integrator    integral(
        k=K_I,
        use_reset=false,
        initType=Modelica.Blocks.Types.Init.InitialOutput,
        y_start=y_start)
        annotation (Placement(transformation(extent={{-18,30},{2,50}})));
      Modelica.Blocks.Math.Gain proportional(k=K_P)
        annotation (Placement(transformation(extent={{-26,-50},{-6,-30}})));
      Modelica.Blocks.Math.Add PI_add
        annotation (Placement(transformation(extent={{38,-10},{58,10}})));
      Modelica.Blocks.Logical.Switch reset_switch
        annotation (Placement(transformation(extent={{-56,30},{-36,50}})));
      Modelica.Blocks.Sources.RealExpression realExpression
        annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
      Modelica.Blocks.Interfaces.RealInput u
        annotation (Placement(transformation(extent={{-140,-80},{-100,-40}}),
            iconTransformation(extent={{-140,-80},{-100,-40}})));
      Modelica.Blocks.Interfaces.RealOutput y
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN)
        annotation (Placement(transformation(extent={{70,-10},{90,10}})));
      Modelica.Blocks.Logical.Or or1
        annotation (Placement(transformation(extent={{-92,30},{-72,50}})));
      Modelica.Blocks.Interfaces.BooleanInput voltage_dip
        "Connector of first Boolean input signal"
        annotation (Placement(transformation(extent={{-140,40},{-100,80}}),
            iconTransformation(extent={{-140,40},{-100,80}})));
    equation
      or1.u2 =
      if (abs(V_RMAX - y) <= Modelica.Constants.eps and der(integral.y)>0) then true
      else if (abs(V_RMIN - y) <= Modelica.Constants.eps and der(integral.y)<0) then true
      else false;
      connect(proportional.y, PI_add.u2) annotation (Line(points={{-5,-40},{30,-40},
              {30,-6},{36,-6}}, color={0,0,127}));
      connect(reset_switch.u1,realExpression. y)
        annotation (Line(points={{-58,48},{-60,48},{-60,80},{-69,80}},
                                                     color={0,0,127}));
      connect(reset_switch.u3,u)  annotation (Line(points={{-58,32},{-70,32},{
              -70,-60},{-120,-60}},
                         color={0,0,127}));
      connect(reset_switch.y,integral. u)
        annotation (Line(points={{-35,40},{-20,40}}, color={0,0,127}));
      connect(proportional.u,u)
        annotation (Line(points={{-28,-40},{-70,-40},{-70,-60},{-120,-60}},
                                                    color={0,0,127}));
      connect(PI_add.y, limiter.u)
        annotation (Line(points={{59,0},{68,0}}, color={0,0,127}));
      connect(limiter.y, y)
        annotation (Line(points={{91,0},{110,0}}, color={0,0,127}));
      connect(integral.y, PI_add.u1)
        annotation (Line(points={{3,40},{30,40},{30,6},{36,6}}, color={0,0,127}));
      connect(or1.u1,voltage_dip)
        annotation (Line(points={{-94,40},{-108,40},{-108,60},{-120,60}},
                                                      color={255,0,255}));
      connect(or1.y, reset_switch.u2)
        annotation (Line(points={{-71,40},{-58,40}}, color={255,0,255}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}), Text(
              extent={{-80,40},{80,-40}},
              textColor={0,0,255},
              textString="PI WECC Renewables")}),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}})));
    end PI_WECC_NoVariableLimiter;
  end BaseClasses;
end RenewableElectricalController;
