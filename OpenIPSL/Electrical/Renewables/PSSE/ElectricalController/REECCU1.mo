within OpenIPSL.Electrical.Renewables.PSSE.ElectricalController;
model REECCU1
  "Electrical control model for utility scale battery energy storage"
  extends
    OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses.BaseREECC(
     Iqcmd, Ipcmd);

  parameter OpenIPSL.Types.PerUnit Vdip = -99 "Low voltage threshold to activate reactive current injection logic (0.85 - 0.9)";
  parameter OpenIPSL.Types.PerUnit Vup = 99 "Voltage above which reactive current injection logic is activated (>1.1)";
  parameter OpenIPSL.Types.Time Trv = 0.01 "Filter time constant for voltage measurement (0.01 - 0.02)";
  parameter OpenIPSL.Types.PerUnit dbd1 = 0 "Voltage error dead band lower threshold (-0.1 - 0)";
  parameter OpenIPSL.Types.PerUnit dbd2 = 0 "Voltage error dead band upper threshold (0 - 0.1)";
  parameter Real Kqv = 0 "Reactive current injection gain during over and undervoltage conditions (0 - 10)";
  parameter OpenIPSL.Types.PerUnit Iqh1 = 1 "Upper limit on reactive current injection Iqinj (1 - 1.1)";
  parameter OpenIPSL.Types.PerUnit Iql1 = -1 "Lower limit on reactive current injection Iqinj (-1.1 - 1)";
  parameter OpenIPSL.Types.PerUnit vref0 = 1 "User defined voltage reference (0.95 - 1.05)";
  parameter OpenIPSL.Types.Time Tp = 0.01 "Filter time constant for electrical power (0.01 - 0.1)";
  parameter OpenIPSL.Types.PerUnit Qmax = 1 "Upper limits of the limit for reactive power regulator (0.4 - 1.0)";
  parameter OpenIPSL.Types.PerUnit Qmin = -1 "Lower limits of the limit for reactive power regulator (-1.0 - -0.4)";
  parameter OpenIPSL.Types.PerUnit Vmax = 1.1 "Maximum limit for voltage control (1.05 - 1.1)";
  parameter OpenIPSL.Types.PerUnit Vmin = 0.9 "Lower limits of input signals (0.9 - 0.95)";
  parameter Real Kqp = 0 "Reactive power regulator proportional gain (No predefined range)";
  parameter Real Kqi = 0.1 "Reactive power regulator integral gain (No predefined range)";
  parameter Real Kvp = 0 "Voltage regulator proportional gain (No predefined range)";
  parameter Real Kvi = 40 "Voltage regulator integral gain (No predefined range)";
  parameter OpenIPSL.Types.Time Tiq = 0.01 "Time constant on lag delay (0.01 - 0.02)";
  parameter Real dPmax = 99 "Power reference maximum ramp rate (No predefined range)";
  parameter Real dPmin = -99 "Lower limits of input signals (No predefined range)";
  parameter OpenIPSL.Types.PerUnit Pmax = 1 "Maximum power limit";
  parameter OpenIPSL.Types.PerUnit Pmin = 0 "Minimum power limit";
  parameter OpenIPSL.Types.PerUnit Imax = 1.1 "Maximum limit on total converter current (1.1 - 1.3)";
  parameter OpenIPSL.Types.Time Tpord = 0.02 "Power filter time constant (0.01 - 0.02) ";
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
  parameter Modelica.Units.SI.Time T = 999 "Battery discharge time";
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
    initType=Modelica.Blocks.Types.Init.InitialState, y_start=Ip0*V0)
    annotation (Placement(transformation(extent={{-142,-136},{-122,-116}})));
  Modelica.Blocks.Nonlinear.Limiter limiter8(uMax=Pmax, uMin=Pmin)
    annotation (Placement(transformation(extent={{-102,-136},{-82,-116}})));
  Modelica.Blocks.Sources.RealExpression Vt_filt3(y=simpleLag.y)
    annotation (Placement(transformation(extent={{-140,-90},{-120,-70}})));
  Modelica.Blocks.Math.Add add7(k1=+1, k2=+1)
    annotation (Placement(transformation(extent={{-18,-140},{2,-120}})));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter2
    annotation (Placement(transformation(extent={{228,-170},{248,-150}})));
  Modelica.Blocks.Sources.RealExpression IPMAX(y=ccl_reecc.Ipmax) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={240,-120})));
  Modelica.Blocks.Sources.RealExpression IPMIN(y=ccl_reecc.Ipmin) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={240,-184})));
  Modelica.Blocks.Math.Product product2
    annotation (Placement(transformation(extent={{224,-136},{204,-116}})));
  Modelica.Blocks.Math.Product product3
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={214,-190})));
  Modelica.Blocks.Sources.RealExpression SOC_ipmax(y=sOC_logic.ipmax_SOC)
    annotation (Placement(transformation(extent={{250,-122},{230,-142}})));
  Modelica.Blocks.Sources.RealExpression SOC_ipmin(y=sOC_logic.ipmin_SOC)
    annotation (Placement(transformation(extent={{250,-186},{230,-206}})));
  Modelica.Blocks.Sources.RealExpression PELEC(y=Pe)
    annotation (Placement(transformation(extent={{-164,-226},{-144,-206}})));
  Modelica.Blocks.Continuous.Integrator integrator1(k=1/T,
    initType=Modelica.Blocks.Types.Init.InitialState, y_start=p00)
    annotation (Placement(transformation(extent={{-134,-226},{-114,-206}})));
  Modelica.Blocks.Math.Add add1(k1=-1, k2=+1)
    annotation (Placement(transformation(extent={{-104,-244},{-84,-224}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=SOCmax, uMin=SOCmin)
    annotation (Placement(transformation(extent={{-74,-244},{-54,-224}})));
  OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses.StateOfChargeLogic
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
    annotation (Placement(transformation(extent={{232,150},{252,170}})));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter
    annotation (Placement(transformation(extent={{266,150},{286,170}})));
  Modelica.Blocks.Sources.RealExpression IQMIN(y=ccl_reecc.Iqmin)
    annotation (Placement(transformation(extent={{286,150},{266,130}})));
  Modelica.Blocks.Sources.RealExpression IQMAX(y=ccl_reecc.Iqmax)
    annotation (Placement(transformation(extent={{286,174},{266,194}})));
  Modelica.Blocks.Math.Add add10(k2=-1)
    annotation (Placement(transformation(extent={{52,-6},{72,14}})));
  Modelica.Blocks.Continuous.Integrator integrator4(k=1/Tiq,
    initType=Modelica.Blocks.Types.Init.InitialState, y_start=-Iq0 - (-
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
  OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses.CurrentLimitLogicREECC
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
  NonElectrical.Continuous.SimpleLag simpleLag(
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
  NonElectrical.Continuous.SimpleLag simpleLag1(
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
    annotation (Line(points={{249,-160},{288,-160},{288,-170},{310,-170}},
                                                     color={0,0,127}));
  connect(add7.y,variableLimiter2. u) annotation (Line(points={{3,-130},{114,-130},
          {114,-160},{226,-160}}, color={0,0,127}));
  connect(product2.y,variableLimiter2. limit1) annotation (Line(points={{203,-126},
          {180,-126},{180,-152},{226,-152}},
                                  color={0,0,127}));
  connect(IPMAX.y,product2. u1)
    annotation (Line(points={{229,-120},{226,-120}}, color={0,0,127}));
  connect(product3.u2,IPMIN. y)
    annotation (Line(points={{226,-184},{229,-184}}, color={0,0,127}));
  connect(variableLimiter2.limit2,product3. y) annotation (Line(points={{226,-168},
          {180,-168},{180,-190},{203,-190}}, color={0,0,127}));
  connect(product2.u2,SOC_ipmax. y)
    annotation (Line(points={{226,-132},{229,-132}},
                                                   color={0,0,127}));
  connect(product3.u1,SOC_ipmin. y)
    annotation (Line(points={{226,-196},{229,-196}}, color={0,0,127}));
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
          148}}, color={0,0,127}));
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
    annotation (Line(points={{-73,140},{-70,140}}, color={0,0,127}));
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
          {56,128}}, color={0,0,127}));
  connect(VFlag.y,limiter4. u)
    annotation (Line(points={{17,134},{24,134}}, color={0,0,127}));
  connect(gain1.y,add6. u1) annotation (Line(points={{121,134},{124,134}},
                color={0,0,127}));
  connect(integrator2.y,add6. u2) annotation (Line(points={{121,104},{124,104},{
          124,122}}, color={0,0,127}));
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
          {196,94}}, color={255,0,255}));
  connect(IQMIN_.y,variableLimiter1. limit2) annotation (Line(points={{159,104},
          {152,104},{152,122},{156,122}},
                                        color={0,0,127}));
  connect(add9.y,variableLimiter. u)
    annotation (Line(points={{253,160},{264,160}},
                                                 color={0,0,127}));
  connect(IQMIN.y,variableLimiter. limit2) annotation (Line(points={{265,140},{258,
          140},{258,152},{264,152}},
                                  color={0,0,127}));
  connect(IQMAX.y,variableLimiter. limit1) annotation (Line(points={{265,184},{258,
          184},{258,168},{264,168}},
                                   color={0,0,127}));
  connect(QFlag.y,add9. u2) annotation (Line(points={{219,94},{230,94},{230,154}},
                     color={0,0,127}));
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
          86},{196,86}}, color={0,0,127}));
  connect(add10.u2, QFlag.u3) annotation (Line(points={{50,-2},{40,-2},{40,-12},
          {188,-12},{188,86},{196,86}}, color={0,0,127}));
  connect(product5.y,integrator4. u)
    annotation (Line(points={{117,10},{130,10}}, color={0,0,127}));
  connect(product5.u1,product4. u2) annotation (Line(points={{94,16},{82,16},{82,
          46},{44,46},{44,74},{50,74}}, color={0,0,127}));
  connect(VDL2.u,limiter6. u) annotation (Line(points={{54,-70},{-36,-70},{-36,-10},
          {-30,-10}}, color={0,0,127}));
  connect(VDL1.u,limiter6. u) annotation (Line(points={{54,-50},{-36,-50},{-36,-10},
          {-30,-10}}, color={0,0,127}));
  connect(VDL2.y[1], ccl_reecc.VDL2_out)
    annotation (Line(points={{77,-70},{88.8,-69.6}}, color={0,0,127}));
  connect(VDL1.y[1], ccl_reecc.VDL1_out) annotation (Line(points={{77,-50},{77,-50.4},
          {88.8,-50.4}}, color={0,0,127}));
  connect(PQFLAG.y, ccl_reecc.pqflag)
    annotation (Line(points={{147,-60},{88.8,-60}},  color={255,0,255}));
  connect(IQCMD.y, ccl_reecc.Iqcmd) annotation (Line(points={{147,-38},{132,-38},{132,-50.4},{127.2,-50.4}},
                                      color={0,0,127}));
  connect(IPCMD.y, ccl_reecc.Ipcmd) annotation (Line(points={{147,-82},{132,-82},{132,-69.6},{127.2,-69.6}},
                                      color={0,0,127}));
  connect(limiter.y, add9.u1)
    annotation (Line(points={{-107,234},{230,234},{230,166}},color={0,0,127}));
  connect(variableLimiter.y, Iqcmd)
    annotation (Line(points={{287,160},{294,160},{294,170},{310,170}},
                                                 color={0,0,127}));
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
  annotation (Documentation(info="<html>
<p>
The REECCU1 component is an augmented version of the existing renewable energy electrical control (REECA1) model, and can be utilized to represent
both type 3 and type 4 wind turbine electrical controllers as well as photovoltaic electrical controllers. The REECCU1 component can be connected to the
plant controller (REPCA1). This electrical controller provides real (Ipcmd) and reactive (Iqcmd) current commands to the REGCA1 component, which are the outputs
of this component.
</p>
<p>
For initialization purposes, there are 5 inputs that are derived from the inverter component: initial real and reactive injection currents (IP0 and IQ0), initial terminal voltage (v_0), and initial active and reactive power
injections (p_0 and q_0).
</p>
<p>
In terms of connectivity with other components to form the renewable source, the REECCU1 component has six inputs, three of which are connected to the inverter component
(for instance REGCA1), two more that can either be constant values from the power flow initialization or come from the connection to the plant controller, and
an auxiliary input variable that is rarely used (usually constant and zero). The three REECCU1 inputs that take in values from the output of the inverter model
are Vt, Pgen, and Qgen while the two inputs that could potentially be constant valued or come from the plant controller are Pref, and Qext.
</p>
<p>The modelling of such devices is based, mainly, on the following references:</p>
<ul>
<li>Siemens: \"PSS&reg;E Model Library\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a>,</li>
<li>WECC: \"Battery Storage Dynamic Modeling Guideline\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[WECCBattery]</a>.</li>
</ul>

</html>"));
end REECCU1;
