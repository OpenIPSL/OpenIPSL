within OpenIPSL.Tests.FACTS;
model STATCOM_Test "Simple model to test the functionality of STATCOM"
  extends Modelica.Icons.Example;
  Electrical.FACTS.PSAT.STATCOM sTATCOM(
    Q_0=524550,
    v_0=0.999989,
    Sn=20000000,
    Kr=25,
    Tr=0.2,
    i_Max=0.7,
    i_Min=-0.7) annotation (Placement(transformation(extent={{90,30},{70,50}})));
  Electrical.Machines.PSSE.GENCLS Syn1 annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  Electrical.Branches.PwLine pwLineSC(
    displayPF=true,
    R=0.0001,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(extent={{20,30},{40,50}})));
  Electrical.Loads.PSAT.PQvar lOADPQ(
    P_0=20000000,
    Q_0=0,
    t_start_1=2,
    t_end_1=4,
    dP1=0,
    dQ1=10000000,
    t_start_2=6,
    t_end_2=8,
    dP2=0,
    dQ2=-10000000) annotation (Placement(transformation(extent={{70,-40},{90,-20}})));
  Electrical.Branches.PwLine pwLineLoad(
    displayPF=true,
    R=0.001,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  inner Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-100,80},{-60,100}})));
  Electrical.Branches.PwLine pwLineInf(
    displayPF=true,
    R=0.001,
    X=0.01,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Electrical.Buses.Bus busInf(displayPF=true) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Electrical.Buses.Bus busSplit(displayPF=true) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Electrical.Buses.Bus busSC(v_0=sTATCOM.v_0,
                             displayPF=true) annotation (Placement(transformation(extent={{50,30},{70,50}})));
  Electrical.Buses.Bus busLoad(displayPF=true) annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Blocks.Sources.Constant NoPSS(k=0) annotation (Placement(transformation(extent={{60,60},{72,72}})));
equation
  connect(pwLineLoad.n, lOADPQ.p) annotation (Line(points={{39,0},{80,0},{80,-20}}, color={0,0,255}));
  connect(pwLineSC.n, sTATCOM.p) annotation (Line(points={{39,40},{69,40}}, color={0,0,255}));
  connect(Syn1.p, pwLineInf.p) annotation (Line(points={{-70,0},{-39,0}}, color={0,0,255}));
  connect(pwLineInf.n, pwLineLoad.p) annotation (Line(points={{-21,0},{21,0}}, color={0,0,255}));
  connect(pwLineSC.p, pwLineLoad.p) annotation (Line(points={{21,40},{0,40},{0,0},{21,0}}, color={0,0,255}));
  connect(Syn1.p, busInf.p) annotation (Line(points={{-70,0},{-60,0}}, color={0,0,255}));
  connect(pwLineInf.n, busSplit.p) annotation (Line(points={{-21,0},{0,0}}, color={0,0,255}));
  connect(pwLineSC.n, busSC.p) annotation (Line(points={{39,40},{60,40}}, color={0,0,255}));
  connect(pwLineLoad.n, busLoad.p) annotation (Line(points={{39,0},{60,0}}, color={0,0,255}));
  connect(NoPSS.y, sTATCOM.v_POD)
    annotation (Line(points={{72.6,66},{80,66},{80,52}},
                                               color={0,0,127}));
  annotation (experiment(StopTime=10),Documentation(info="<html>
<p>
Simulate for 10 seconds.
</p>
<p>Variables of interest:</p>
<ul>
<li><code>sTATCOM.Q</code></li>
<li><code>sTATCOM.v</code></li>
</ul>
</html>"));
end STATCOM_Test;
