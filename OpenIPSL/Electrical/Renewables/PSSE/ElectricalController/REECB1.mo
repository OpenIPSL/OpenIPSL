within OpenIPSL.Electrical.Renewables.PSSE.ElectricalController;
model REECB1 "Electrical Control Model for Large Scale PV"
  extends
    OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses.BaseREECB(    Iqcmd(start = Iq0), Ipcmd(start = Ip0));

  parameter OpenIPSL.Types.PerUnit Vdip = 0.9 "Low voltage threshold to activate reactive current injection logic (0.85 – 0.9 pu)";
  parameter OpenIPSL.Types.PerUnit Vup = 1.1 "Voltage above which reactive current injection logic is activated (>1.1 pu)";
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
  parameter Real Kqp "Reactive power regulator proportional gain (No predefined range)";
  parameter Real Kqi "Reactive power regulator integral gain (No predefined range)";
  parameter Real Kvp "Voltage regulator proportional gain (No predefined range)";
  parameter Real Kvi "Voltage regulator integral gain (No predefined range)";
  parameter OpenIPSL.Types.Time Tiq = 0.01 "Time constant on lag delay (0.01 - 0.02 s)";
  parameter Real dPmax "Power reference maximum ramp rate (No predefined range pu/s)";
  parameter Real dPmin "Lower limits of input signals (No predefined range pu/s)";
  parameter OpenIPSL.Types.PerUnit Pmax = 1 "Maximum power limit (1 pu)";
  parameter OpenIPSL.Types.PerUnit Pmin = 0 "Minimum power limit (0 pu)";
  parameter OpenIPSL.Types.PerUnit Imax = 1.1 "Maximum limit on total converter current (1.1 – 1.3 pu)";
  parameter OpenIPSL.Types.Time Tpord = 0.02 "Power filter time constant (0.01 - 0.02 s) ";

  parameter Boolean pfflag=true "Constant output value" annotation (Dialog(tab="Control"));
  parameter Boolean vflag=true "Constant output value" annotation (Dialog(tab="Control"));
  parameter Boolean qflag=true "Constant output value" annotation (Dialog(tab="Control"));
  parameter Boolean pqflag=true "Constant output value" annotation (Dialog(tab="Control"));

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
  Modelica.Blocks.Sources.RealExpression VReF0(y=Vref0) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-36,-30})));
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
  OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses.CLL_REECB
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
  connect(VReF0.y, VFlag.u3)
    annotation (Line(points={{-25,-30},{-4,-30},{-4,46}}, color={0,0,127}));
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
  annotation (Icon(graphics={
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
          textString="IPCMD")}));
end REECB1;
