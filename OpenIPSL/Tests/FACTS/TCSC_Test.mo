within OpenIPSL.Tests.FACTS;
model TCSC_Test "Simple model to test the functionality of TCSC"
  extends Modelica.Icons.Example;
  Electrical.Loads.PSAT.PQvar lOADPQ(
    P_0=50000000,
    Q_0=10000000,
    v_0=0.991992,
    angle_0 = -0.010060269794713,
    t_start_1=2,
    t_end_1=10,
    dP1=2000000) annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Electrical.FACTS.PSAT.TCSC tCSC(
    displayPF=true,
    ctrl=OpenIPSL.Types.Ctrl.xTCSC,
    alpha_min=0.87266462599716,
    alpha_max=1.5707963267949,
    Tr=0.01,
    Kp=2,
    Ki=20,
    XL=0.08,
    alpha0=1.0471975511966,
    pref=-0.0500733,
    G=0,
    B=0,
    xTCSC0=0.0133767) annotation (Placement(transformation(extent={{40,10},{60,30}})));
  inner Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-100,80},{-60,100}})));
  Electrical.Branches.PwLine pwLineInf(
    displayPF=true,
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Electrical.Buses.Bus Gen(angle_0= 0.070618464996643,
                           displayPF=true)
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Electrical.Buses.Bus Load(
    v_0=0.991992,
    angle_0 = -0.010060269794713,
                            displayPF=true)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Electrical.Buses.Bus Inf(displayPF=true)
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  Electrical.Machines.PSAT.Order2 Gen1(
    D=0,
    angle_0 = 0.070618464996643,
    ra=0.01,
    x1d=0.302,
    M=10,
    P_0=40000000,
    Q_0=5417240,
    Sn=100000000,
    v_0=1,
    V_b=400000,
    Vn=400000,
    w(fixed=true))
               annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  Modelica.Blocks.Sources.Constant NoPSS(k=0)
    annotation (Placement(transformation(extent={{72,34},{60,46}})));
  Electrical.Branches.PwLine pwLineInf1(
    opening=2,
    displayPF=true,
    R=0.001,
    X=0.2,
    G=0,
    B=0) annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  Electrical.Branches.PwLine pwLineInf3(
    B=0,
    displayPF=true,
    R=0.001,
    X=0.1,
    G=0) annotation (Placement(transformation(extent={{-8,10},{12,30}})));
  Electrical.Buses.Bus Inter(displayPF=true)
    annotation (Placement(transformation(extent={{20,10},{40,30}})));
  Electrical.Buses.InfiniteBus infiniteBus(P_0=10017100, Q_0=8005930)
    annotation (Placement(transformation(extent={{110,-10},{90,10}})));
equation
  connect(pwLineInf.n, Load.p)
    annotation (Line(points={{-51,0},{-30,0}}, color={0,0,255}));
  connect(tCSC.n, Inf.p)
    annotation (Line(points={{61,20},{70,20},{70,0},{80,0}}, color={0,0,255}));
  connect(Gen.p, pwLineInf.p)
    annotation (Line(points={{-90,0},{-69,0}}, color={0,0,255}));
  connect(Gen1.p, Gen.p)
    annotation (Line(points={{-100,0},{-90,0}},color={0,0,255}));
  connect(Gen1.pm0, Gen1.pm) annotation (Line(points={{-118,-11},{-118,-16},{-128,-16},{-128,-5},{-122,-5}},
                              color={0,0,127}));
  connect(Gen1.vf0, Gen1.vf) annotation (Line(points={{-118,11},{-118,16},{-128,16},{-128,5},{-122,5}},
                            color={0,0,127}));
  connect(NoPSS.y, tCSC.Vs_pod)
    annotation (Line(points={{59.4,40},{50,40},{50,32}},
                                                       color={0,0,127}));
  connect(Load.p, pwLineInf1.p) annotation (Line(points={{-30,0},{-20,0},{-20,-20},{21,-20}},
                     color={0,0,255}));
  connect(pwLineInf3.p, pwLineInf1.p) annotation (Line(points={{-7,20},{-20,20},{-20,-20},{21,-20}},
                               color={0,0,255}));
  connect(pwLineInf3.n, Inter.p)
    annotation (Line(points={{11,20},{30,20}}, color={0,0,255}));
  connect(tCSC.p, Inter.p)
    annotation (Line(points={{39.1,20},{30,20}}, color={0,0,255}));
  connect(pwLineInf1.n, Inf.p) annotation (Line(points={{39,-20},{70,-20},{70,0},{80,0}},
                   color={0,0,255}));
  connect(Load.p, lOADPQ.p)
    annotation (Line(points={{-30,0},{-30,-40}}, color={0,0,255}));
  connect(Inf.p, infiniteBus.p)
    annotation (Line(points={{80,0},{90,0}}, color={0,0,255}));
  annotation (experiment(StopTime=10), Documentation(info="<html>
<p>
The parameters are set for varying impedance TCSC. Simulate for 10 seconds.
</p>
<p>Variables of interest:</p>
<ul>
<li><code>TCSC.pkm</code></li>
<li><code>TCSC.b</code></li>
</ul>
</html>"),
    Diagram(coordinateSystem(extent={{-140,-100},{120,100}})));
end TCSC_Test;
