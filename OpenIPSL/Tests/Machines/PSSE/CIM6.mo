within OpenIPSL.Tests.Machines.PSSE;
model CIM6 "Infinite bus feeding a PSSE CIM6 induction motor through a line, motor start-up followed by a line opening"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Machines.PSSE.CIM6 motor(
    M_b=15e6,
    Sup=true,
    Ctrl=false,
    T_nom=0.8,
    A=1,
    B=0,
    C0=0,
    D=0,
    H=0.4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={70,0})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    G=0,
    B=0,
    R=0.01,
    X=0.1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,-20})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    G=0,
    B=0,
    R=0.01,
    X=0.1,
    t1=6,
    t2=7,
    opening=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={0,20})));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(angle_0=0, v_0=1.0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={-70,0})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60)
    annotation (Placement(transformation(extent={{-100,80},{-40,100}})));
equation
  connect(pwLine1.n, infiniteBus.p) annotation (Line(points={{-9,-20},{-40,-20},{-40,0},{-60,0}}, color={0,0,255}));
  connect(pwLine2.n, infiniteBus.p) annotation (Line(points={{-9,20},{-40,20},{-40,0},{-60,0}}, color={0,0,255}));
  connect(pwLine2.p, motor.p) annotation (Line(points={{9,20},{40,20},{40,0},{60,0}}, color={0,0,255}));
  connect(pwLine1.p, motor.p) annotation (Line(points={{9,-20},{40,-20},{40,0},{60,0}}, color={0,0,255}));
  annotation (
    experiment(
      StopTime=10,
      Interval=0.001,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>The motor starts from standstill (<code>Sup = true</code>) against an infinite bus, with the default
single-cage data of the CIM6 model (<code>R2 = X2 = 0</code>), no speed control (<code>Ctrl = false</code>)
and a quadratic load torque (<code>A = 1</code>, <code>B = C0 = D = 0</code>) of 0.8 pu at synchronous speed.
One of the two parallel lines opens at 6 s and recloses at 7 s.</p>
<p>The default single-cage data exercise the branch of the <code>Lpp</code>, <code>Tp0</code> and
<code>Tpp0</code> equations that selects the single-cage circuit from <code>R2</code> and <code>X2</code>.</p>
</html>"));
end CIM6;
