within OpenIPSL.Electrical.Wind.PSSE.WT4G;
model WT4E1 "Electrical Control for Type 4 Wind Generator"
  parameter Boolean PFAFLG "PF fast control"
    annotation (choices(choice=true "Enable", choice=false "Disable"));
  parameter Boolean VARFLG annotation (choices(choice=false
        " Qord is not provided by WindVar", choice=true
        " Qord is provided by WindVar"));
  parameter Boolean PQFLAG "P/Q priority flag"
    annotation (choices(choice=false "Q priority", choice=true "P priority"));
  parameter Types.Time Tfv "Filter time constant in voltage regulator";
  parameter Types.PerUnit Kpv "Proportional gain in voltage regulator";
  parameter Types.TimeAging KIV "Integrator gain in voltage regulator";
  parameter Types.PerUnit Kpp "Proportional gain in torque regulator";
  parameter Types.PerUnit KIP "Integrator gain in torque regulator";
  //should be 0.1 in PSSE
  parameter Types.PerUnit Kf "Rate feedback gain";
  parameter Types.Time Tf "Rate feedback time constant";
  parameter Types.PerUnit QMX "Max limit in voltage regulator";
  parameter Types.PerUnit QMN "Min limit in voltage regulator";
  parameter Types.PerUnit IPMAX "Max active current limit";
  parameter Types.Time TRV "Voltage sensor time constant";
  parameter Types.PerUnit dPMX "Max limit in power PI controller";
  parameter Types.PerUnit dPMN "Min limit in power PI controller";
  parameter Types.Time T_Power "Power filter time constant";
  parameter Types.PerUnit KQI "MVAR/Voltage gain";
  //should be 0.1 in PSSE
  parameter Types.PerUnit VMINCL=0.9 "Min voltage limit";
  parameter Types.PerUnit VMAXCL=1.1 "Max voltage limit";
  parameter Types.PerUnit KVI=120 "Voltage/Mvar gain";
  parameter Types.Time Tv=0.50000E-01 "Lag time constant in WindVar controller";
  parameter Types.Time Tp=0.50000E-01 "Pelec filter in fast PF controller";
  parameter Types.PerUnit ImaxTD=1.7 "Converter current limit";
  parameter Types.PerUnit Iphl=1.11 "Hard active current limit";
  parameter Types.PerUnit Iqhl=1.11 "Hard reactive current limit";
  parameter Boolean PSSEMATCH annotation (choices(choice=false "Use Integrator in Wind Control", choice=true "Ignore Integrator in Wind Control"));
  //parameter Real Qord "Mvar order from Mvar emulator";
  Modelica.Blocks.Interfaces.RealInput P(start=p0) annotation (Placement(
        transformation(extent={{-210,-10},{-190,10}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={180,40})));
  Modelica.Blocks.Interfaces.RealInput Q(start=q0) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        origin={-200,188}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={180,100})));
  Modelica.Blocks.Interfaces.RealInput V(start=v0) annotation (Placement(
        transformation(extent={{-210,-170},{-190,-150}}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={180,160})));
  Modelica.Blocks.Interfaces.RealOutput WIPCMD annotation (Placement(
        transformation(extent={{200,-90},{220,-70}}), iconTransformation(extent=
           {{200,-80},{240,-40}})));
  Modelica.Blocks.Nonlinear.Limiter Qord(uMin=QMN, uMax=QMX)
    annotation (Placement(transformation(extent={{20,50},{40,70}})));
  Modelica.Blocks.Math.Feedback feedback1
    annotation (Placement(transformation(extent={{50,70},{70,50}})));
  Modelica.Blocks.Continuous.LimIntegrator K6(
    outMin=VMINCL,
    outMax=VMAXCL,
    k=KQI,
    y_start=k60)
    annotation (Placement(transformation(extent={{80,50},{100,70}})));
  Modelica.Blocks.Math.Feedback Vcl
    annotation (Placement(transformation(extent={{108,50},{128,70}})));
  Modelica.Blocks.Interfaces.RealOutput WIQCMD annotation (Placement(
        transformation(extent={{200,50},{220,70}}), iconTransformation(extent={
            {200,-160},{240,-120}})));
  OpenIPSL.Electrical.Wind.PSSE.Submodels.CCL cCL(
    Qmax=QMX,
    ImaxTD=ImaxTD,
    Iphl=Iphl,
    Iqhl=Iqhl,
    pqflag=PQFLAG)
    annotation (Placement(transformation(extent={{150,-30},{190,10}})));
  Modelica.Blocks.Sources.Constant Qcmd0(k=Qref) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        origin={-100,0})));
  ActivePowerController activePowerController(
    Kpp=Kpp,
    KIP=KIP,
    Kf=Kf,
    Tf=Tf,
    dPMX=dPMX,
    dPMN=dPMN,
    T_Power=T_Power,
    Pref=Pref,
    k20=k20,
    k30=k30,
    k50=k50,
    p0=p0) annotation (Placement(transformation(extent={{40,-100},{
            80,-60}})));
  pf_Controller PF_Controller(
    Tp=Tp,
    PFA_ref=PFA_ref,
    p0=p0,
    q0=q0) annotation (Placement(transformation(extent={{-120,28},{
            -80,68}})));
  windControlEmulator windControlEmulator1(
    Tfv=Tfv,
    Kpv=Kpv,
    KIV=KIV,
    QMX=QMX,
    QMN=QMN,
    TRV=TRV,
    Tv=Tv,
    Vref=Vref,
    k0=k0,
    k10=k10,
    k40=k40,
    k80=k80,
    PSSEMATCH=PSSEMATCH)
             annotation (Placement(transformation(extent={{-120,140},
            {-80,180}})));
  Modelica.Blocks.Logical.Switch switch_QREF
    annotation (Placement(transformation(extent={{-50,30},{-30,50}})));
  Modelica.Blocks.Sources.BooleanConstant ControlPF(k=PFAFLG)
    annotation (Placement(transformation(extent={{-110,80},{-90,100}})));
  Modelica.Blocks.Logical.Switch switch_WindVar
    annotation (Placement(transformation(extent={{-12,50},{8,70}})));
  Modelica.Blocks.Sources.BooleanConstant UseWindVar(k=VARFLG)
    annotation (Placement(transformation(extent={{-50,80},{-30,100}})));
  OpenIPSL.NonElectrical.Continuous.IntegratorLimVar integratorLimVar(K=KVI,
      y_start=k70)
    annotation (Placement(transformation(extent={{148,50},{168,70}})));
protected
  parameter Types.PerUnit Vref(fixed=false);
  parameter Types.PerUnit Pref=p0;
  parameter Types.PerUnit Qref=q0 "Q reference if PFAFLG=0 & VARFLG";
  parameter Real PFA_ref=atan2(q0, p0) "PF angle reference if PFAFLG=1";
  parameter Types.PerUnit p0(fixed=false);
  parameter Types.PerUnit q0(fixed=false);
  parameter Types.PerUnit v0(fixed=false);
  parameter Types.PerUnit Ip0(fixed=false);
  parameter Types.PerUnit Iq0(fixed=false);
  parameter Types.PerUnit Pord0(fixed=false);
  parameter Types.PerUnit k0(fixed=false) "Filter in voltage regulator";
  parameter Types.PerUnit k10(fixed=false) "Integrator in voltage regulator";
  parameter Types.PerUnit k20(fixed=false) "Integrator in active power regulator";
  parameter Types.PerUnit k30(fixed=false) "Active power regulator feedback";
  parameter Types.PerUnit k40(fixed=false) "Voltage sensor";
  parameter Types.PerUnit k50(fixed=false) "Power filter";
  parameter Types.PerUnit k60(fixed=false) "Mvar/Vref integrator";
  parameter Types.PerUnit k70(fixed=false) "Verror/Internal machine voltage integrator";
  parameter Types.PerUnit k80(fixed=false) "Lag of the WindVar controller";
  parameter Types.PerUnit k90(fixed=false) "Input filter of Pelec for PF fast controller";
initial equation
  Vref = v0;
  p0 = P;
  q0 = Q;
  v0 = V;
  Ip0 = WIPCMD;
  Iq0 = WIQCMD;
  Pord0 = v0*Ip0;
  k0 = q0;
  k10 = q0;
  k80 = 0;
  k40 = v0;
  //may be incorrect !
  k50 = p0;
  k20 = 0;
  k30 = 0;
  k60 = v0;
  k70 = q0/v0;
  k90 = p0;
equation
  connect(Q, feedback1.u2) annotation (Line(
      points={{-200,188},{60,188},{60,68}},
      color={0,0,150},
      smooth=Smooth.None));
  connect(V, Vcl.u2) annotation (Line(
      points={{-200,-160},{118,-160},{118,52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cCL.Vt, V) annotation (Line(
      points={{150,-10},{92,-10},{92,-160},{-200,-160}},
      color={255,0,0},
      smooth=Smooth.None));
  connect(Qord.y, feedback1.u1) annotation (Line(
      points={{41,60},{52,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K6.u, feedback1.y) annotation (Line(
      points={{78,60},{69,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(cCL.IqCMD, WIQCMD)
    annotation (Line(points={{180,10},{180,36},{194,36},{194,60},{210,60}},
                                                          color={0,0,127}));
protected
  model ActivePowerController
    Modelica.Blocks.Nonlinear.VariableLimiter imLimited_max
      annotation (Placement(transformation(extent={{130,0},{150,20}})));
    Modelica.Blocks.Math.Division division
      annotation (Placement(transformation(extent={{96,0},{116,20}})));
    Modelica.Blocks.Nonlinear.Limiter imLimited_min(uMin=0.01, uMax=
          Modelica.Constants.inf)
      annotation (Placement(transformation(extent={{36,-70},{56,-50}})));
    Modelica.Blocks.Math.Add3 add3_1(k1=-1, k3=-1)
      annotation (Placement(transformation(extent={{-52,4},{-40,16}})));
    Modelica.Blocks.Sources.Constant VAR3(k=Pref) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          origin={-94,40})));
    Modelica.Blocks.Math.Gain gain(k=Kpp)
      annotation (Placement(transformation(extent={{-12,0},{8,20}})));
    Modelica.Blocks.Continuous.LimIntegrator K2(
      y_start=k20,
      outMin=dPMN,
      outMax=dPMX,
      k=KIP) annotation (Placement(transformation(extent={{-14,30},{6,50}})));
    Modelica.Blocks.Math.Add Pord(k2=-1)
      annotation (Placement(transformation(extent={{56,0},{76,20}})));
    Modelica.Blocks.Math.Add Pord1
      annotation (Placement(transformation(extent={{26,0},{46,20}})));
    Modelica.Blocks.Continuous.Derivative K3(
      k=Kf,
      T=Tf,
      initType=Modelica.Blocks.Types.Init.InitialState,
      x_start=k30) annotation (Placement(transformation(
          extent={{10,-10},{-10,10}},
          origin={-4,-20})));
    OpenIPSL.NonElectrical.Continuous.SimpleLag K5(
      K=1,
      T=T_Power,
      y_start=k50)
      annotation (Placement(transformation(extent={{-104,-10},{-84,10}})));
    Modelica.Blocks.Sources.Constant NoLimiMin(k=-Modelica.Constants.inf)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          origin={106,-20})));
    parameter Types.PerUnit Kpp "Proportional gain in torque regulator";
    parameter Types.TimeAging KIP "Integrator gain in torque regulator";
    parameter Types.PerUnit Kf "Rate feedback gain";
    parameter Types.Time Tf "Rate feedback time constant";
    parameter Types.PerUnit dPMX "Max limit in power PI controller";
    parameter Types.PerUnit dPMN "Min limit in power PI controller";
    parameter Types.Time T_Power "Power filter time constant";
    parameter Types.PerUnit Pref=p0;
    parameter Types.PerUnit k20 "Integrator in active power regulator";
    parameter Types.PerUnit k30 "Active power regulator feedback";
    parameter Types.PerUnit k50 "Power filter";
    parameter Types.PerUnit p0;
    Modelica.Blocks.Interfaces.RealInput PELEC annotation (Placement(
          transformation(extent={{-220,-20},{-180,20}})));
    Modelica.Blocks.Interfaces.RealInput I_PMAX annotation (Placement(
          transformation(
          rotation=270,
          extent={{-20,20},{20,-20}},
          origin={170,204}), iconTransformation(
          extent={{-20,20},{20,-20}},
          rotation=270,
          origin={0,200})));
    Modelica.Blocks.Interfaces.RealOutput ipcmd annotation (Placement(
          transformation(extent={{200,-20},{240,20}}),
          iconTransformation(extent={{200,-20},{240,20}})));
    Modelica.Blocks.Interfaces.RealInput VTERM annotation (Placement(
          transformation(
          rotation=90,
          extent={{-20,-20},{20,20}},
          origin={0,-200})));
  equation
    connect(VAR3.y, add3_1.u1) annotation (Line(
        points={{-83,40},{-60,40},{-60,14.8},{-53.2,14.8}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(gain.y, Pord1.u2) annotation (Line(
        points={{9,10},{16,10},{16,4},{24,4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(K3.y, add3_1.u3) annotation (Line(
        points={{-15,-20},{-60,-20},{-60,5.2},{-53.2,5.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(add3_1.y, K2.u) annotation (Line(
        points={{-39.4,10},{-34,10},{-34,40},{-16,40}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(gain.u, add3_1.y) annotation (Line(
        points={{-14,10},{-39.4,10}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(K5.y, add3_1.u2) annotation (Line(points={{-83,0},{-64,0},{-64,10},
            {-53.2,10}}, color={0,0,127}));
    connect(K2.y, Pord1.u1) annotation (Line(points={{7,40},{16,40},{16,16},{24,
            16}}, color={0,0,127}));
    connect(division.y, imLimited_max.u)
      annotation (Line(points={{117,10},{128,10}}, color={0,0,127}));
    connect(imLimited_min.y, division.u2) annotation (Line(points={{57,-60},{66,
            -60},{66,4},{94,4}}, color={0,0,127}));
    connect(NoLimiMin.y, imLimited_max.limit2) annotation (Line(points={{117,-20},
            {122,-20},{122,2},{128,2}}, color={0,0,127}));
    connect(Pord.y, division.u1) annotation (Line(points={{77,10},{84,10},{84,
            16},{94,16}}, color={0,0,127}));
    connect(Pord1.y, Pord.u2) annotation (Line(points={{47,10},{50,10},{50,4},{
            54,4}}, color={0,0,127}));
    connect(Pord.u1, add3_1.u1) annotation (Line(points={{54,16},{50,16},{50,58},
            {-60,58},{-60,14.8},{-53.2,14.8}}, color={0,0,127}));
    connect(K3.u, Pord.u2) annotation (Line(points={{8,-20},{50,-20},{50,4},{54,
            4}}, color={0,0,127}));
    connect(PELEC, K5.u)
      annotation (Line(points={{-200,0},{-156,0},{-106,0}}, color={0,0,127}));
    connect(ipcmd, imLimited_max.y)
      annotation (Line(points={{220,0},{192,0},{192,10},{151,10}},
                                                          color={0,0,127}));
    connect(VTERM, imLimited_min.u)
      annotation (Line(points={{0,-200},{0,-60},{34,-60}}, color={0,0,127}));
    connect(I_PMAX, imLimited_max.limit1) annotation (Line(points={{170,204},{
            168,204},{168,86},{122,86},{122,18},{128,18}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(extent={{-200,-200},{200,200}},
            preserveAspectRatio=false), graphics={Text(
              extent={{-88,16},{-84,14}},
              lineColor={0,0,255},
              lineThickness=0.5,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="Speed"),Text(
              extent={{-80,200},{80,180}},
              lineColor={255,0,0},
              pattern=LinePattern.Dash,
              lineThickness=0.5,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="Active Power Control")}), Icon(coordinateSystem(
            extent={{-200,-200},{200,200}}, preserveAspectRatio=true), graphics={
            Rectangle(
              extent={{-200,200},{200,-200}},
              lineColor={28,108,200},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),Text(
              extent={{-100,160},{100,0}},
              lineColor={0,140,72},
              textString="Active Power
PI"),Text( extent={{-40,180},{40,140}},
              lineColor={28,108,200},
              textString="I_PMAX"),Text(
              extent={{112,20},{192,-20}},
              lineColor={28,108,200},
              textString="I_PCMD"),Text(
              extent={{-40,-140},{40,-180}},
              lineColor={28,108,200},
              textString="VTERM"),Text(
              extent={{-174,20},{-94,-20}},
              lineColor={28,108,200},
              textString="PELEC")}));
  end ActivePowerController;
equation
  connect(activePowerController.ipcmd, WIPCMD)
    annotation (Line(points={{82,-80},{82,-80},{210,-80}}, color={0,0,127}));
  connect(activePowerController.VTERM, Vcl.u2) annotation (Line(points={{60,-100},
          {60,-160},{118,-160},{118,52}}, color={255,0,0}));
protected
  model pf_Controller
    Modelica.Blocks.Math.Tan tan1
      annotation (Placement(transformation(extent={{-120,40},{-100,60}})));
    Modelica.Blocks.Math.Product Qcmdn1
      annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
    Modelica.Blocks.Sources.Constant VAR2(k=PFA_ref)
      annotation (Placement(transformation(extent={{-160,40},{-140,60}})));
    OpenIPSL.NonElectrical.Continuous.SimpleLag K0(
      K=1,
      y_start=p0,
      T=Tp)
      annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
    parameter Types.Time Tp=0.50000E-01 "Pelec filter in fast PF controller";
    parameter Real PFA_ref=atan2(q0, p0) "PF angle reference if PFAFLG=1";
    parameter Types.PerUnit p0;
    parameter Types.PerUnit q0;
    Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(
            extent={{-214,-10},{-194,10}})));
    Modelica.Blocks.Interfaces.RealOutput Q_REF_PF
      annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  equation
    connect(tan1.y, Qcmdn1.u1) annotation (Line(points={{-99,50},{-78,50},{-78,
            6},{-62,6}}, color={0,0,127}));
    connect(K0.y, Qcmdn1.u2) annotation (Line(points={{-99,0},{-78,0},{-78,-6},
            {-62,-6}}, color={0,0,127}));
    connect(VAR2.y, tan1.u) annotation (Line(points={{-139,50},{-139,50},{-122,
            50}}, color={0,0,127}));
    connect(u, K0.u)
      annotation (Line(points={{-204,0},{-158,0},{-122,0}}, color={0,0,127}));
    connect(Qcmdn1.y, Q_REF_PF)
      annotation (Line(points={{-39,0},{10,0},{10,0}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(extent={{-200,-100},{0,100}},
            preserveAspectRatio=true), graphics={Text(
              extent={{-160,100},{-40,80}},
              lineColor={255,0,0},
              pattern=LinePattern.Dash,
              lineThickness=0.5,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="Power Factor Regulator")}), Icon(coordinateSystem(
            extent={{-200,-100},{0,100}}, preserveAspectRatio=true), graphics={
            Rectangle(
              extent={{-200,100},{0,-100}},
              lineColor={28,108,200},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),Text(
              extent={{-188,6},{-148,-6}},
              lineColor={28,108,200},
              textString="P_FAREF"),Text(
              extent={{-60,6},{-2,-6}},
              lineColor={28,108,200},
              textString="Q_REF_PF"),Text(
              extent={{-160,80},{-40,40}},
              lineColor={238,46,47},
              textString="PF Controller")}));
  end pf_Controller;
equation
  connect(P, PF_Controller.u) annotation (Line(points={{-200,0},{-170,0},{-140,
          0},{-140,48},{-120.8,48}}, color={0,150,0}));
  connect(activePowerController.PELEC, PF_Controller.u) annotation (Line(points=
         {{40,-80},{-140,-80},{-140,48},{-120.8,48}}, color={0,150,0}));
protected
  model windControlEmulator
    OpenIPSL.NonElectrical.Continuous.SimpleLag K(
      K=1,
      T=Tfv,
      y_start=k0)
      annotation (Placement(transformation(extent={{98,-10},{118,10}})));
    Modelica.Blocks.Math.Add add3(k2=-1)
      annotation (Placement(transformation(extent={{-64,-10},{-44,10}})));
    Modelica.Blocks.Sources.Constant VARL(k=Vref)
      annotation (Placement(transformation(extent={{-96,20},{-76,40}})));
    Modelica.Blocks.Math.Add add4
      annotation (Placement(transformation(extent={{40,-10},{60,10}})));
    Modelica.Blocks.Nonlinear.Limiter Qord1(uMin=QMN, uMax=QMX)
      annotation (Placement(transformation(extent={{68,-10},{88,10}})));
    OpenIPSL.NonElectrical.Continuous.SimpleLag K8(
      K=Kpv,
      y_start=k80,
      T=Tv) annotation (Placement(transformation(extent={{2,-28},{22,-8}})));
    OpenIPSL.NonElectrical.Continuous.SimpleLag K8_extra(
      y_start=k40,
      K=1,
      T=TRV) annotation (Placement(transformation(extent={{-96,-16},{-76,4}})));
    parameter Types.Time Tfv "Filter time constant in voltage regulator";
    parameter Types.PerUnit Kpv "Proportional gain in voltage regulator";
    parameter Types.TimeAging KIV "Integrator gain in voltage regulator";
    parameter Types.PerUnit QMX "Max limit in voltage regulator";
    parameter Types.PerUnit QMN "Min limit in voltage regulator";
    parameter Types.Time TRV "Voltage sensor time constant";
    parameter Types.Time Tv=0.50000E-01 "Lag time constant in WindVar controller";
    parameter Types.PerUnit Vref;
    parameter Types.PerUnit k0 "Filter in voltage regulator";
    parameter Types.PerUnit k10 "Integrator in voltage regulator";
    parameter Types.PerUnit k40 "Voltage sensor";
    parameter Types.PerUnit k80 "Lag of the WindVar controller";
    parameter Boolean PSSEMATCH "Ignore integral signal";
    Modelica.Blocks.Interfaces.RealInput V_REG annotation (Placement(
          transformation(extent={{-214,-10},{-194,10}})));
    Modelica.Blocks.Interfaces.RealOutput Q_ord
      annotation (Placement(transformation(extent={{200,-10},{220,10}})));
    Modelica.Blocks.Continuous.Integrator integrator(
      k=KIV,
      initType=Modelica.Blocks.Types.Init.InitialOutput,
      y_start=k10)
      annotation (Placement(transformation(extent={{2,8},{22,28}})));
    Modelica.Blocks.Sources.Constant VARL1(k=0)
      annotation (Placement(transformation(extent={{-64,22},{-44,42}})));
    Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=PSSEMATCH)
      annotation (Placement(transformation(extent={{-98,64},{-78,84}})));
    Modelica.Blocks.Logical.Switch switch1
      annotation (Placement(transformation(extent={{-28,8},{-8,28}})));
  equation
    connect(add4.y, Qord1.u) annotation (Line(
        points={{61,0},{66,0}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Qord1.y, K.u) annotation (Line(
        points={{89,0},{96,0}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(VARL.y, add3.u1) annotation (Line(points={{-75,30},{-70,30},{-70,6},{-66,
            6}}, color={0,0,127}));
    connect(K.y, Q_ord)
      annotation (Line(points={{119,0},{210,0}}, color={0,0,127}));
    connect(add3.u2, K8_extra.y)
      annotation (Line(points={{-66,-6},{-75,-6}}, color={0,0,127}));
    connect(K8_extra.u, V_REG) annotation (Line(points={{-98,-6},{-156,-6},{-156,0},
            {-204,0}}, color={0,0,127}));
    connect(K8.y, add4.u2) annotation (Line(points={{23,-18},{34,-18},{34,-6},{38,
            -6}}, color={0,0,127}));
    connect(add3.y, K8.u) annotation (Line(points={{-43,0},{-40,0},{-40,-18},{0,-18}},
          color={0,0,127}));
    connect(integrator.y, add4.u1)
      annotation (Line(points={{23,18},{34,18},{34,6},{38,6}}, color={0,0,127}));
    connect(integrator.u, switch1.y)
      annotation (Line(points={{0,18},{-7,18}}, color={0,0,127}));
    connect(VARL1.y, switch1.u1) annotation (Line(points={{-43,32},{-38,32},{-38,26},
            {-30,26}}, color={0,0,127}));
    connect(switch1.u3, K8.u) annotation (Line(points={{-30,10},{-40,10},{-40,-18},
            {0,-18}}, color={0,0,127}));
    connect(booleanConstant.y, switch1.u2) annotation (Line(points={{-77,74},{-40,
            74},{-40,18},{-30,18}}, color={255,0,255}));
    annotation (Diagram(coordinateSystem(extent={{-200,-200},{200,200}},
            preserveAspectRatio=true), graphics={Rectangle(
              extent={{-102,52},{124,-42}},
              lineColor={255,0,0},
              lineThickness=0.5,
              pattern=LinePattern.Dash),Text(
              extent={{-16,46},{46,40}},
              lineColor={255,0,0},
              pattern=LinePattern.Dash,
              lineThickness=0.5,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="WindControl Emulator")}), Icon(coordinateSystem(
            extent={{-200,-200},{200,200}}, preserveAspectRatio=true), graphics={
            Rectangle(
              extent={{-200,200},{200,-200}},
              lineColor={28,108,200},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),Text(
              extent={{-196,14},{-76,-16}},
              lineColor={28,108,200},
              textString="V_REG"),Text(
              extent={{80,14},{200,-16}},
              lineColor={28,108,200},
              textString="Q_ORD"),Text(
              extent={{-172,162},{180,72}},
              lineColor={180,56,148},
              textString="WindCONTROL Emulator")}));
  end windControlEmulator;
equation
  connect(windControlEmulator1.V_REG, Vcl.u2) annotation (Line(points={{-120.4,
          160},{-160,160},{-160,-160},{118,-160},{118,52}}, color={255,0,0}));
  connect(ControlPF.y, switch_QREF.u2) annotation (Line(points={{-89,90},{-66,
          90},{-66,40},{-52,40}}, color={255,0,255}));
  connect(PF_Controller.Q_REF_PF, switch_QREF.u1)
    annotation (Line(points={{-78,48},{-72,48},{-52,48}}, color={0,0,127}));
  connect(Qcmd0.y, switch_QREF.u3) annotation (Line(points={{-89,0},{-66,0},{-66,
          0},{-66,32},{-52,32}}, color={0,0,127}));
  connect(switch_QREF.y, switch_WindVar.u3) annotation (Line(points={{-29,40},{
          -20,40},{-20,52},{-14,52}}, color={0,0,127}));
  connect(windControlEmulator1.Q_ord, switch_WindVar.u1) annotation (Line(
        points={{-79,160},{-20,160},{-20,68},{-14,68}}, color={0,0,127}));
  connect(UseWindVar.y, switch_WindVar.u2) annotation (Line(points={{-29,90},{-26,
          90},{-26,60},{-14,60}}, color={255,0,255}));
  connect(switch_WindVar.y, Qord.u)
    annotation (Line(points={{9,60},{12,60},{18,60}}, color={0,0,127}));
  connect(K6.y, Vcl.u1)
    annotation (Line(points={{101,60},{106,60},{110,60}}, color={0,0,127}));
  connect(cCL.IpCMD, WIPCMD)
    annotation (Line(points={{180,-30},{180,-80},{210,-80}}, color={0,0,127}));
  connect(activePowerController.I_PMAX, cCL.IPmax) annotation (Line(points={{60,
          -60},{60,-40},{160,-40},{160,-32}}, color={0,0,127}));
  connect(Vcl.y, integratorLimVar.u)
    annotation (Line(points={{127,60},{146,60}}, color={0,0,127}));
  connect(integratorLimVar.y, WIQCMD)
    annotation (Line(points={{169,60},{210,60}}, color={0,0,127}));
  connect(cCL.IQmin, integratorLimVar.outMin) annotation (Line(points={{160,12},
          {162,12},{162,42},{150,42},{150,46}}, color={0,0,127}));
  connect(cCL.IQmax, integratorLimVar.outMax) annotation (Line(points={{170,12},
          {170,42},{180,42},{180,78},{166,78},{166,74}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-200,-200},{200,200}},
        initialScale=0.05), graphics={Rectangle(
          extent={{46,118},{192,24}},
          lineColor={255,0,0},
          lineThickness=0.5,
          pattern=LinePattern.Dash),Text(
          extent={{64,116},{170,108}},
          lineColor={255,0,0},
          pattern=LinePattern.Dash,
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Reactive Power Control"),Rectangle(
          extent={{-134,130},{14,-20}},
          lineColor={0,140,72},
          lineThickness=0.5,
          pattern=LinePattern.Dash),Text(
          extent={{-130,128},{-24,120}},
          lineColor={0,140,72},
          pattern=LinePattern.Dash,
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Reactive Power Reference Switching"),Rectangle(
          extent={{104,104},{190,26}},
          lineColor={102,44,145},
          lineThickness=0.5,
          pattern=LinePattern.Dash),Text(
          extent={{94,104},{200,96}},
          lineColor={180,56,148},
          pattern=LinePattern.Dash,
          lineThickness=0.5,
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="Terminal Voltage Control")}),
    Icon(coordinateSystem(
        extent={{-200,-200},{200,200}},
        preserveAspectRatio=false,
        initialScale=0.05), graphics={Rectangle(
          extent={{-200,200},{200,-200}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-70,42},{82,-36}},
          lineColor={28,108,200},
          textString="WT4E1"),Text(
          extent={{110,172},{170,142}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="V"),Text(
          extent={{110,114},{170,84}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Q"),Text(
          extent={{110,56},{170,26}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="P"),Text(
          extent={{82,-42},{194,-74}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="WIPCMD"),Text(
          extent={{82,-124},{194,-156}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="WIQCMD")}));
end WT4E1;
