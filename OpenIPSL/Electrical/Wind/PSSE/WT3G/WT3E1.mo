within OpenIPSL.Electrical.Wind.PSSE.WT3G;
model WT3E1 "Electrical Control for Type 3 Wind Generator"
  parameter Integer VARFLG
    "0 constant Q; 1 Reactive control; -1 Constant PF control" annotation (
      choices(
      choice=0 "Constant Q",
      choice=1 "Reactive power control",
      choice=-1 "Constant PF control"));
  parameter Integer VLRFLG
    "0 Bypass V control; 1 WT3G1 Eqcmd limits;2 WT3G2 Eqcmd limits" annotation (
     choices(
      choice=0 "Disable terminal voltage control",
      choice=1 "Enable terminal voltage control ",
      choice=2 "Fixed limits for Eqcmd"));
  parameter Types.Time Tfv=0.15000 "Filter time constant in voltage regulator";
  parameter Types.PerUnit Kpv=18.000 "Proportional gain in voltage regulator";
  parameter Types.TimeAging KIV=5.0000 "Integrator gain in voltage regulator";
  parameter Types.PerUnit Xc=0.0000 "Line drop compensation reactance";
  parameter Types.Time TFP=0.50000E-01 "Filter time constant in torque regulator";
  parameter Types.PerUnit Kpp=3.0000 "Proportional gain in torque regulator";
  parameter Types.TimeAging KIP=0.60000 "Integrator gain in torque regulator";
  parameter Types.PerUnit PMX=1.1200 "Max limit in torque regulator";
  parameter Types.PerUnit PMN=0.10000 "Min limit in torque regulator";
  parameter Types.PerUnit QMX=0.29600 "Max limit in voltage regulator";
  parameter Types.PerUnit QMN=-0.43600 "Min limit in voltage regulator";
  parameter Types.PerUnit IPMAX=1.1000 "Max active current limit";
  parameter Types.Time TRV=0.50000E-01 "Voltage sensor time constant";
  parameter Types.PerUnit RPMX=0.45000 "Max power order derivative";
  parameter Types.PerUnit RPMN=-0.45000 "Min power order derivative";
  parameter Types.Time T_Power=5.0000 "Power filter time constant";
  parameter Types.PerUnit Kqi=0.50000E-01 "Mvar/Voltage gain";
  parameter Types.PerUnit VMINCL=0.90000 "Min voltage limit";
  parameter Types.PerUnit VMAXCL=1.2000 "Max voltage limit";
  parameter Types.PerUnit Kqv=40.000 "Voltage/Mvar gain";
  parameter Types.PerUnit XIQmin=-0.50000;
  parameter Types.PerUnit XIQmax=0.40000;
  parameter Types.Time Tv=0.50000E-01 "Lag time constant in WindVar controller";
  parameter Types.Time Tp=0.50000E-01 "Pelec filter in fast PF controller";
  parameter Real Fn=1.0000 "A portion of online wind turbines";
  parameter Types.PerUnit wPmin=0.69000 "Shaft speed at Pmin";
  parameter Types.PerUnit wP20=0.78000 "Shaft speed at 20% rated power";
  parameter Types.PerUnit wP40=0.98000 "Shaft speed at 40% rated power";
  parameter Types.PerUnit wP60=1.1200 "Shaft speed at 60% rated power";
  parameter Types.PerUnit Pmin=0.74000 "Minimum power for operating at P100 speed";
  parameter Types.PerUnit wP100=1.2000 "Shaft speed at 100% rated power";
  parameter Types.PerUnit Vref "Remote bus ref voltage";
  parameter Types.PerUnit v0;
  parameter Types.PerUnit p0;
  parameter Types.PerUnit q0;
  Modelica.Blocks.Interfaces.RealInput PELEC annotation (Placement(
        transformation(extent={{-210,30},{-190,50}}), iconTransformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-190,-120})));
  Modelica.Blocks.Interfaces.RealInput VTERM(start=v0) annotation (Placement(
        transformation(extent={{-210,-110},{-190,-90}}), iconTransformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-190,-40})));
  Modelica.Blocks.Interfaces.RealOutput WIPCMD annotation (Placement(
        transformation(extent={{180,-70},{200,-50}}), iconTransformation(extent=
           {{-200,40},{-220,60}})));
  Modelica.Blocks.Nonlinear.Limiter Qord(uMin=QMN, uMax=QMX)
    annotation (Placement(transformation(extent={{12,30},{32,50}})));
  Modelica.Blocks.Interfaces.RealInput Qelec annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,140}), iconTransformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-190,-80})));
  Modelica.Blocks.Math.Feedback feedback1
    annotation (Placement(transformation(extent={{40,50},{60,30}})));
  Modelica.Blocks.Continuous.LimIntegrator K6(
    outMin=VMINCL,
    outMax=VMAXCL,
    k=Kqi,
    y_start=k60,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{70,30},{90,50}})));
  Modelica.Blocks.Math.Feedback Vcl
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput WEQCMD annotation (Placement(
        transformation(extent={{180,32},{198,50}}), iconTransformation(extent={
            {-200,80},{-220,100}})));
  Modelica.Blocks.Interfaces.RealOutput WPCMND annotation (Placement(
        transformation(extent={{180,-102},{200,-82}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-150,-150})));
  Modelica.Blocks.Continuous.LimIntegrator K7(
    k=Kqv,
    y_start=k70,
    outMax=1 + XIQmax,
    outMin=XIQmin - 1)
    annotation (Placement(transformation(extent={{138,30},{158,50}})));
  Modelica.Blocks.Interfaces.RealInput ITERM "magnitude of terminal current"
    annotation (Placement(transformation(extent={{-210,88},{-190,108}}),
        iconTransformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-190,0})));
  Modelica.Blocks.Sources.Constant Qcmd0(k=Qref) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,-2})));
  Modelica.Blocks.Interfaces.RealInput WEQCMD0 annotation (Placement(
        transformation(extent={{-140,120},{-120,140}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-110,130})));
  Modelica.Blocks.Interfaces.RealInput WIPCMD0 annotation (Placement(
        transformation(extent={{-180,120},{-160,140}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-150,130})));
  pf_Controller pf_Controller1(
    Tp=Tp,
    p0=p0,
    PFA_ref=PFA_ref,
    q0=q0) annotation (Placement(transformation(extent={{-114,20},{
            -74,60}})));
  ActivePowerControl activePowerControl(
    TFP=TFP,
    Kpp=Kpp,
    KIP=KIP,
    PMX=PMX,
    PMN=PMN,
    IPMAX=IPMAX,
    RPMX=RPMX,
    RPMN=RPMN,
    T_Power=T_Power,
    k20=k20,
    k30=k30,
    k50=k50,
    wPmin=wPmin,
    wP20=wP20,
    wP40=wP40,
    wP60=wP60,
    Pmin=Pmin,
    wP100=wP100) annotation (Placement(transformation(extent={{-40,
            -80},{40,-40}})));
  ReactivePowerControl reactivePowerControl(
    Tfv=Tfv,
    Kpv=Kpv,
    KIV=KIV,
    Xc=Xc,
    QMX=QMX,
    QMN=QMN,
    TRV=TRV,
    Tv=Tv,
    Fn=Fn,
    Vref=Vref,
    k0=k0,
    k10=k10,
    k40=k40,
    k80=k80) annotation (Placement(transformation(extent={{-104,80},
            {-46,104}})));
protected
  parameter Real PFA_ref(fixed=false) "PF angle reference if PFAFLG=1";
  //parameter Real Qord "Mvar order from Mvar emulator";
  parameter Real Qref=q0 "Q reference if PFAFLG=0 & VARFLG";
  parameter Real sp0=Speed(
      p0,
      PMN,
      wPmin,
      wP20,
      wP40,
      wP60,
      wP100,
      Pmin);
  parameter Real k0(fixed=false);
  parameter Real k10(fixed=false);
  parameter Real k20(fixed=false);
  parameter Real k30(fixed=false);
  parameter Real k40(fixed=false);
  parameter Real k50(fixed=false);
  parameter Real k60(fixed=false);
  parameter Real k70(fixed=false);
  parameter Real k80(fixed=false);
  parameter Real k90(fixed=false);

  function Speed
    extends Modelica.Icons.Function;
    input Real x;
    input Types.PerUnit PMN "Min limit in torque regulator";
    input Real wmin;
    input Real w20;
    input Real w40;
    input Real w60;
    input Real w100;
    input Types.PerUnit Pmin "Minimum power for operating at wP100 speed";
    output Real y;
  protected
    parameter Real K1=(w20 - wmin)/(0.2 - PMN);
    parameter Real K2=(w40 - w20)/(0.4 - 0.2);
    parameter Real K3=(w60 - w40)/(0.6 - 0.4);
    parameter Real K4=(w100 - w60)/(Pmin - 0.6);
    Real K, x0, y0;
  algorithm
    if x <= PMN then
      K := 0;
      y0 := wmin;
      x0 := PMN;
    elseif x > Pmin and x <= 0.2 then
      K := K1;
      y0 := wmin;
      x0 := PMN;
    elseif x > 0.2 and x <= 0.4 then
      K := K2;
      y0 := w20;
      x0 := 0.2;
    elseif x > 0.4 and x <= 0.6 then
      K := K3;
      y0 := w40;
      x0 := 0.4;
    elseif x > 0.6 and x <= Pmin then
      K := K4;
      y0 := w60;
      x0 := 0.6;
    else
      K := 0;
      y0 := w100;
      x0 := Pmin;
    end if;
    y := K*(x - x0) + y0 - 1;
  end Speed;
protected
  Modelica.Blocks.Interfaces.RealInput SPEED=sp0 annotation (Placement(
        transformation(extent={{-210,-60},{-190,-40}}), iconTransformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={80,-92})));
initial equation
  PFA_ref = atan2(q0, p0);
  k40 = v0;
  k0 = q0;
  k10 = q0;
  k60 = v0;
  k70 = WEQCMD0;
  k20 = WIPCMD0*v0;
  k30 = k20/(sp0 + 1);
  k80 = 0;
  k90 = p0;
  k50 = sp0;
equation
  if VLRFLG <> 0 then
    WEQCMD = K7.y;
  else
    WEQCMD = Vcl.y;
  end if;
  if VARFLG == 1 then
    Qord.u = reactivePowerControl.Q_ord;
  elseif VARFLG == (-1) then
    Qord.u = pf_Controller1.Q_REF_PF;
  else
    Qord.u = Qref;
  end if;
  connect(Qelec, feedback1.u2) annotation (Line(
      points={{50,140},{50,48}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Vcl.u2, VTERM) annotation (Line(points={{110,32},{110,32},{110,-100},
          {-46,-100},{-46,-100},{-200,-100}}, color={0,0,127}));
  connect(feedback1.y, K6.u)
    annotation (Line(points={{59,40},{68,40}}, color={0,0,127}));
  connect(K6.y, Vcl.u1)
    annotation (Line(points={{91,40},{91,40},{102,40}}, color={0,0,127}));
  connect(Qord.y, feedback1.u1)
    annotation (Line(points={{33,40},{33,40},{42,40}}, color={0,0,127}));
protected
  model pf_Controller
    Modelica.Blocks.Math.Tan tan1
      annotation (Placement(transformation(extent={{-120,40},{-100,60}})));
    Modelica.Blocks.Math.Product Qcmdn1
      annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
    Modelica.Blocks.Sources.Constant VAR2(k=PFA_ref)
      annotation (Placement(transformation(extent={{-160,40},{-140,60}})));
    NonElectrical.Continuous.SimpleLag K0(
      K=1,
      y_start=p0,
      T=Tp)
      annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
    parameter Types.Time Tp=0.50000E-01 " Pelec filter in fast PF controller";
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
  connect(PELEC, pf_Controller1.u) annotation (Line(points={{-200,40},{-140,40},
          {-114.8,40}}, color={0,0,127}));
protected
  model ActivePowerControl
    NonElectrical.Continuous.SimpleLag K5(
      K=1,
      T=T_Power,
      y_start=k50)
      annotation (Placement(transformation(extent={{-180,-70},{-160,-50}})));
    Modelica.Blocks.Math.Add add(k2=-1)
      annotation (Placement(transformation(extent={{-140,-70},{-120,-50}})));
    Modelica.Blocks.Continuous.Integrator K3(
      y_start=k30,
      k=KIP,
      initType=Modelica.Blocks.Types.Init.InitialOutput)
      annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
    Modelica.Blocks.Math.Gain imGain(k=Kpp)
      annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
    Modelica.Blocks.Math.Add add1
      annotation (Placement(transformation(extent={{-60,-70},{-40,-50}})));
    Modelica.Blocks.Math.Feedback feedback
      annotation (Placement(transformation(extent={{20,-70},{40,-50}})));
    Modelica.Blocks.Nonlinear.Limiter imLimited(uMin=RPMN, uMax=RPMX)
      annotation (Placement(transformation(extent={{50,-70},{70,-50}})));
    Modelica.Blocks.Continuous.LimIntegrator K2(
      outMin=PMN,
      outMax=PMX,
      k=1/TFP,
      y_start=k20,
      initType=Modelica.Blocks.Types.Init.InitialOutput)
      annotation (Placement(transformation(extent={{80,-70},{100,-50}})));
    Modelica.Blocks.Nonlinear.Limiter imLimited_max(uMin=-Modelica.Constants.inf,
        uMax=IPMAX)
      annotation (Placement(transformation(extent={{160,-70},{180,-50}})));
    Modelica.Blocks.Math.Add add2
      annotation (Placement(transformation(extent={{-100,44},{-80,64}})));
    Modelica.Blocks.Sources.Constant const(k=1)
      annotation (Placement(transformation(extent={{-140,10},{-120,30}})));
    Modelica.Blocks.Math.Division division
      annotation (Placement(transformation(extent={{120,-70},{140,-50}})));
    Modelica.Blocks.Nonlinear.Limiter imLimited_min(uMin=0.01, uMax=Modelica.Constants.inf)
      annotation (Placement(transformation(extent={{80,-10},{100,10}})));
    Modelica.Blocks.Math.Product Qcmdn2
      annotation (Placement(transformation(extent={{-20,-70},{0,-50}})));
    Modelica.Blocks.Interfaces.RealOutput WPCMND annotation (Placement(
          transformation(extent={{200,-100},{220,-80}}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={1.77636e-015,-110})));
  protected
    Modelica.Blocks.Interfaces.RealInput WNDSP_1
      annotation (Placement(transformation(extent={{-210,-70},{-190,-50}})));
  public
    parameter Types.Time TFP=0.50000E-01 "Filter time constant in torque regulator";
    parameter Types.PerUnit Kpp=3.0000 "Proportional gain in torque regulator";
    parameter Types.TimeAging KIP=0.60000 "Integrator gain in torque regulator";
    parameter Types.PerUnit PMX=1.1200 "Max limit in torque regulator";
    parameter Types.PerUnit PMN=0.10000 "Min limit in torque regulator";
    parameter Types.PerUnit IPMAX=1.1000 "Max active current limit";
    parameter Types.PerUnit RPMX=0.45000 "Max power order derivative";
    parameter Types.PerUnit RPMN=-0.45000 "Min power order derivative";
    parameter Types.Time T_Power=5.0000 "Power filter time constant";
    parameter Types.PerUnit wPmin=0.69000 "Shaft speed at Pmin";
    parameter Types.PerUnit wP20=0.78000 "Shaft speed at 20% rated power";
    parameter Types.PerUnit wP40=0.98000 "Shaft speed at 40% rated power";
    parameter Types.PerUnit wP60=1.1200 "Shaft speed at 60% rated power";
    parameter Types.PerUnit Pmin=0.74000 "Minimum power for operating at P100 speed";
    parameter Types.PerUnit wP100=1.2000 "Shaft speed at 100% rated power";
    parameter Real k20;
    parameter Real k30;
    parameter Real k50;
    Modelica.Blocks.Interfaces.RealInput SPEED annotation (Placement(
          transformation(extent={{-210,50},{-190,70}}),
          iconTransformation(extent={{-200,40},{-180,60}})));
    Modelica.Blocks.Interfaces.RealOutput WIPCMD annotation (Placement(
          transformation(extent={{200,-70},{220,-50}}),
          iconTransformation(extent={{200,-10},{220,10}})));
    Modelica.Blocks.Interfaces.RealInput VTERM annotation (Placement(
          transformation(extent={{-210,-10},{-190,10}}),
          iconTransformation(extent={{-200,-60},{-180,-40}})));
    Modelica.Blocks.Interfaces.RealInput PELEC annotation (Placement(
          transformation(extent={{-210,80},{-190,100}}), iconTransformation(
            extent={{-200,-10},{-180,10}})));
  equation
    WNDSP_1 = Speed(
        PELEC,
        PMN,
        wPmin,
        wP20,
        wP40,
        wP60,
        wP100,
        Pmin);
    connect(imLimited_min.y, division.u2) annotation (Line(
        points={{101,0},{112,0},{112,-66},{118,-66}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(WNDSP_1, K5.u) annotation (Line(points={{-200,-60},{-200,-60},{-182,
            -60}}, color={0,0,127}));
    connect(K2.y, division.u1) annotation (Line(points={{101,-60},{114,-60},{
            114,-54},{118,-54}}, color={0,0,127}));
    connect(division.y, imLimited_max.u) annotation (Line(points={{141,-60},{
            141,-60},{158,-60}}, color={0,0,127}));
    connect(K5.y, add.u2) annotation (Line(points={{-159,-60},{-152,-60},{-152,
            -66},{-142,-66}}, color={0,0,127}));
    connect(add.y, K3.u) annotation (Line(points={{-119,-60},{-110,-60},{-110,-30},
            {-102,-30}}, color={0,0,127}));
    connect(imGain.u, K3.u) annotation (Line(points={{-102,-90},{-110,-90},{-110,
            -30},{-102,-30}}, color={0,0,127}));
    connect(K3.y, add1.u1) annotation (Line(points={{-79,-30},{-72,-30},{-72,-54},
            {-62,-54}}, color={0,0,127}));
    connect(imGain.y, add1.u2) annotation (Line(points={{-79,-90},{-72,-90},{-72,
            -66},{-62,-66}}, color={0,0,127}));
    connect(add1.y, Qcmdn2.u2) annotation (Line(points={{-39,-60},{-32,-60},{-32,
            -66},{-22,-66}}, color={0,0,127}));
    connect(const.y, add2.u2) annotation (Line(points={{-119,20},{-110,20},{-110,
            48},{-102,48}}, color={0,0,127}));
    connect(SPEED, add2.u1)
      annotation (Line(points={{-200,60},{-102,60}}, color={0,0,127}));
    connect(add.u1, add2.u1) annotation (Line(points={{-142,-54},{-152,-54},{-152,
            60},{-102,60}}, color={0,0,127}));
    connect(add2.y, Qcmdn2.u1) annotation (Line(points={{-79,54},{-32,54},{-32,
            -54},{-22,-54}}, color={0,0,127}));
    connect(Qcmdn2.y, feedback.u1)
      annotation (Line(points={{1,-60},{22,-60}}, color={0,0,127}));
    connect(feedback.y, imLimited.u)
      annotation (Line(points={{39,-60},{48,-60}}, color={0,0,127}));
    connect(imLimited.y, K2.u) annotation (Line(points={{71,-60},{74.5,-60},{78,
            -60}}, color={0,0,127}));
    connect(feedback.u2, division.u1) annotation (Line(points={{30,-68},{30,-90},
            {108,-90},{108,-60},{114,-60},{114,-54},{118,-54}}, color={0,0,127}));
    connect(VTERM, imLimited_min.u)
      annotation (Line(points={{-200,0},{-200,0},{78,0}}, color={0,0,127}));
    connect(WPCMND, division.u1) annotation (Line(points={{210,-90},{210,-90},{
            108,-90},{108,-60},{114,-60},{114,-54},{118,-54}}, color={0,0,127}));
    connect(imLimited_max.y, WIPCMD)
      annotation (Line(points={{181,-60},{210,-60}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(extent={{-200,-100},{200,100}},
            preserveAspectRatio=true), graphics={Text(
              extent={{-60,100},{60,80}},
              lineColor={255,0,0},
              pattern=LinePattern.Dash,
              lineThickness=0.5,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="Active Power Control")}), Icon(coordinateSystem(
            extent={{-200,-100},{200,100}}, preserveAspectRatio=true), graphics=
           {Rectangle(
              extent={{-200,100},{200,-100}},
              lineColor={28,108,200},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),Text(
              extent={{-64,72},{76,32}},
              lineColor={0,140,72},
              textString="Active Power
PI")}));
  end ActivePowerControl;
equation
  connect(SPEED, activePowerControl.SPEED) annotation (Line(points={{-200,-50},
          {-116,-50},{-38,-50}}, color={0,0,127}));
  connect(activePowerControl.VTERM, VTERM) annotation (Line(points={{-38,-70},{
          -60,-70},{-60,-100},{-200,-100}}, color={0,0,127}));
  connect(activePowerControl.WIPCMD, WIPCMD)
    annotation (Line(points={{42,-60},{42,-60},{190,-60}}, color={0,0,127}));
  connect(PELEC, activePowerControl.PELEC) annotation (Line(points={{-200,40},{
          -140,40},{-140,-60},{-38,-60}}, color={0,0,127}));
protected
  model ReactivePowerControl
    NonElectrical.Continuous.SimpleLag K4(
      K=1,
      T=TRV,
      y_start=k40)
      annotation (Placement(transformation(extent={{-98,-10},{-78,10}})));
    NonElectrical.Continuous.SimpleLag K8(
      K=Kpv,
      T=Tv,
      y_start=k80)
      annotation (Placement(transformation(extent={{34,-40},{54,-20}})));
    NonElectrical.Continuous.SimpleLag K(
      K=1,
      T=Tfv,
      y_start=k0)
      annotation (Placement(transformation(extent={{160,-10},{180,10}})));
    Modelica.Blocks.Math.Gain XC(k=Xc) "Line drop compensation reactance"
      annotation (Placement(transformation(extent={{-180,-30},{-160,-10}})));
    Modelica.Blocks.Math.Add add3(k2=-1)
      annotation (Placement(transformation(extent={{-48,-10},{-28,10}})));
    Modelica.Blocks.Sources.Constant VARL(k=Vref)
      annotation (Placement(transformation(extent={{-98,40},{-78,60}})));
    Modelica.Blocks.Math.Gain portion(k=1/Fn)
      annotation (Placement(transformation(extent={{-18,-10},{2,10}})));
    NonElectrical.Continuous.SimpleLag K1(
      y_start=k10,
      K=KIV,
      T=Tv) annotation (Placement(transformation(extent={{54,20},{74,40}})));
    Modelica.Blocks.Math.Add add4
      annotation (Placement(transformation(extent={{94,-10},{114,10}})));
    Modelica.Blocks.Math.Add add5(k2=-1)
      annotation (Placement(transformation(extent={{-138,-10},{-118,10}})));
    Modelica.Blocks.Nonlinear.Limiter Qord1(uMin=QMN, uMax=QMX)
      annotation (Placement(transformation(extent={{128,-10},{148,10}})));
    NonElectrical.Continuous.SimpleLag K10(
      T=Tv,
      y_start=k80,
      K=1) annotation (Placement(transformation(extent={{22,20},{42,40}})));
    parameter Types.Time Tfv=0.15000 "Filter time constant in voltage regulator";
    parameter Types.PerUnit Kpv=18.000 "Proportional gain in voltage regulator";
    parameter Types.TimeAging KIV=5.0000 "Integrator gain in voltage regulator";
    parameter Types.PerUnit Xc=0.0000 "Line drop compensation reactance";
    parameter Types.PerUnit QMX=0.29600 "Max limit in voltage regulator";
    parameter Types.PerUnit QMN=-0.43600 "Min limit in voltage regulator";
    parameter Types.Time TRV=0.50000E-01 "Voltage sensor time constant";
    parameter Types.Time Tv=0.50000E-01 "Lag time constant in WindVar controller";
    parameter Real Fn=1.0000 "A portion of online wind turbines";
    parameter Types.PerUnit Vref "Remote bus ref voltage";
    parameter Types.PerUnit k0;
    parameter Types.PerUnit k10;
    parameter Types.PerUnit k40;
    parameter Types.PerUnit k80;
    Modelica.Blocks.Interfaces.RealInput ITERM annotation (Placement(
          transformation(extent={{-210.5,-30},{-189.5,-10}}),
          iconTransformation(extent={{-200,30},{-180,50}})));
    Modelica.Blocks.Interfaces.RealInput VTERM annotation (Placement(
          transformation(extent={{-210.5,-4},{-190,16}}),
          iconTransformation(extent={{-200,-50},{-180,-30}})));
    Modelica.Blocks.Interfaces.RealOutput Q_ord annotation (Placement(
          transformation(extent={{200,-10},{220,10}}), iconTransformation(
            extent={{200,-10},{220,10}})));
  equation
    connect(VARL.y, add3.u1) annotation (Line(
        points={{-77,50},{-54,50},{-54,6},{-50,6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(XC.y, add5.u2) annotation (Line(
        points={{-159,-20},{-144,-20},{-144,-6},{-140,-6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(add3.y, portion.u) annotation (Line(
        points={{-27,0},{-20,0}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(add5.y, K4.u)
      annotation (Line(points={{-117,0},{-100,0}}, color={0,0,127}));
    connect(K4.y, add3.u2) annotation (Line(points={{-77,0},{-54,0},{-54,-6},{-50,
            -6}}, color={0,0,127}));
    connect(Qord1.y, K.u)
      annotation (Line(points={{149,0},{158,0}}, color={0,0,127}));
    connect(VTERM, add5.u1) annotation (Line(points={{-200.25,6},{-200.25,6},{-140,
            6}}, color={0,0,127}));
    connect(add4.y, Qord1.u)
      annotation (Line(points={{115,0},{120,0},{126,0}}, color={0,0,127}));
    connect(K1.y, add4.u1) annotation (Line(points={{75,30},{82,30},{82,6},{92,
            6}}, color={0,0,127}));
    connect(K10.y, K1.u)
      annotation (Line(points={{43,30},{47.5,30},{52,30}}, color={0,0,127}));
    connect(K8.y, add4.u2) annotation (Line(points={{55,-30},{82,-30},{82,-6},{
            92,-6}}, color={0,0,127}));
    connect(portion.y, K10.u) annotation (Line(points={{3,0},{12,0},{12,30},{20,
            30}}, color={0,0,127}));
    connect(K8.u, K10.u) annotation (Line(points={{32,-30},{12,-30},{12,30},{20,
            30}}, color={0,0,127}));
    connect(ITERM, XC.u)
      annotation (Line(points={{-200,-20},{-182,-20}}, color={0,0,127}));
    connect(K.y, Q_ord)
      annotation (Line(points={{181,0},{210,0}}, color={0,0,127}));
    annotation (Diagram(coordinateSystem(extent={{-200,-80},{200,80}},
            preserveAspectRatio=true), graphics={Text(
              extent={{136,8},{156,4}},
              lineColor={255,0,0},
              textString="K
      "),Text(extent={{-60,80},{60,60}},
              lineColor={255,0,0},
              pattern=LinePattern.Dash,
              lineThickness=0.5,
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              textString="Reactive Power Control"),Text(
              extent={{18,26},{38,22}},
              lineColor={255,0,0},
              textString="K+1
      ")}), Icon(coordinateSystem(extent={{-200,-80},{200,80}},
            preserveAspectRatio=true), graphics={Rectangle(
              extent={{-200,80},{200,-80}},
              lineColor={28,108,200},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),Text(
              extent={{-120,80},{122,50}},
              lineColor={180,56,148},
              textString="Reactive Power Control"),Text(
              extent={{-176,50},{-116,30}},
              lineColor={28,108,200},
              textString="ITERM"),Text(
              extent={{130,10},{194,-10}},
              lineColor={28,108,200},
              textString="Q_ORD"),Text(
              extent={{-176,-32},{-116,-52}},
              lineColor={28,108,200},
              textString="VTERM")}));
  end ReactivePowerControl;
equation
  connect(ITERM, reactivePowerControl.ITERM)
    annotation (Line(points={{-200,98},{-102.55,98}}, color={0,0,127}));
  connect(reactivePowerControl.VTERM, VTERM) annotation (Line(points={{-102.55,
          86},{-116,86},{-130,86},{-130,-100},{-200,-100}}, color={0,0,127}));
  connect(activePowerControl.WPCMND, WPCMND) annotation (Line(points={{
          4.44089e-016,-82},{0,-82},{0,-92},{96,-92},{190,-92}}, color={0,0,127}));
  connect(Vcl.y, K7.u)
    annotation (Line(points={{119,40},{119,40},{136,40}}, color={0,0,127}));
  annotation (
    choices(
      choice=0 "0 Bypass V control",
      choice=1 "1 WT3G1 Eqcmd limits",
      choice=-1 "-1 WT3G2 Eqcmd limits"),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-200,-140},{200,140}},
        initialScale=0.05), graphics={Line(
          points={{162,34},{172,40}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{130,12},{130,40}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{130,12},{162,12}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{162,12},{162,32}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{160,66},{184,56}},
          lineColor={255,0,0},
          textString="VLTFLG"),Line(
          points={{172,40},{186,40}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{160,32},{170,28}},
          lineColor={255,0,0},
          textString="0"),Text(
          extent={{70,32},{80,26}},
          lineColor={0,0,255},
          textString="Vterm"),Line(
          points={{-20,92},{-20,52}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-32,54},{-20,46}},
          color={255,0,0},
          smooth=Smooth.None,
          pattern=LinePattern.Dot,
          thickness=0.5),Text(
          extent={{-30,36},{-20,32}},
          lineColor={255,0,0},
          textString="-1"),Text(
          extent={{-20,62},{-10,58}},
          lineColor={255,0,0},
          textString="1"),Text(
          extent={{2,34},{12,30}},
          lineColor={255,0,0},
          textString="0"),Line(
          points={{-10,36},{-10,12}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-4,40},{4,40}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-14,46},{-4,40}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Text(
          extent={{-54,64},{-32,56}},
          lineColor={255,0,0},
          textString="VARFLG"),Line(
          points={{-44,92},{-20,92}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-64,40},{-20,40}},
          color={0,0,255},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{162,44},{168,56}},
          color={255,0,0},
          smooth=Smooth.None,
          pattern=LinePattern.Dot,
          thickness=0.5)}),
    Icon(coordinateSystem(
        extent={{-200,-140},{200,140}},
        preserveAspectRatio=true,
        initialScale=0.05), graphics={Rectangle(
          extent={{-200,140},{200,-140}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-80,60},{80,-60}},
          lineColor={28,108,200},
          textString="WT3E1")}));
end WT3E1;
