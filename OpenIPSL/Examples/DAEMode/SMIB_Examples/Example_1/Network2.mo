within OpenIPSL.Examples.DAEMode.SMIB_Examples.Example_1;
model Network2 "Single machine infinite bus (SMIB) system simulated with breakers in the lines between buses B2 and B3"
    extends Modelica.Icons.Example;
    SMIB_Examples.Example_1.Generator.Generator G1(P_0 = 1997999000, Q_0 = 967920000, v_0 = 1, V_b = 400000, angle_0 = 0.49460013007, displayPF = true) annotation (
        Placement(transformation(origin = {-98, 0}, extent = {{-10, -10}, {10, 10}})));
    OpenIPSL.Electrical.Buses.Bus B1(displayPF = true) annotation (
        Placement(transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}})));
    OpenIPSL.Electrical.Buses.Bus B2(displayPF = true) annotation (
        Placement(transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}})));
    OpenIPSL.Electrical.Buses.Bus B3(displayPF = true) annotation (
        Placement(transformation(origin = {58, 0}, extent = {{-10, -10}, {10, 10}})));
    inner OpenIPSL.Electrical.SystemBase SysData(S_b = 100000000, fn = 60) annotation (
        Placement(transformation(origin = {-70, 85}, extent = {{-30, -15}, {30, 15}})));
    OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(Sn = 2220000000, V_b = 400000, Vn = 400000, rT = 0.0, xT = 0.15) annotation (
        Placement(transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}})));
    OpenIPSL.Electrical.Branches.PwLine pwLine1(B = 0.0, G = 0.0, R = 0.0, X = 0.5 * 100 / 2220) annotation (
        Placement(transformation(origin = {30, 20}, extent = {{-10, -10}, {10, 10}})));
    OpenIPSL.Electrical.Branches.PwLine pwLine2(B = 0.0, G = 0.0, R = 0.0, X = 0.93 * 100 / 2220, t1 = 1) annotation (
        Placement(transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}})));
    OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(P_0 = -1998000000, Q_0 = 87066000, v_0 = 0.90081, V_b = 400000, angle_0 = 0.0) annotation (
        Placement(transformation(origin = {102, 0}, extent = {{10, -10}, {-10, 10}})));
    OpenIPSL.Electrical.Events.Breaker breaker1(rc_enabled=false) annotation (
        Placement(transformation(origin = {-4, 20}, extent = {{-10, -10}, {10, 10}})));
    OpenIPSL.Electrical.Events.Breaker breaker2(rc_enabled=false) annotation (
        Placement(transformation(origin = {-4, -20}, extent = {{-10, -10}, {10, 10}})));
equation
      connect(B3.p, infiniteBus.p) annotation (
        Line(points = {{58, 0}, {92, 0}, {92, 0}, {92, 0}}, color = {0, 0, 255}));
      connect(pwLine2.n, B3.p) annotation (
        Line(points={{39,-20},{44,-20},{44,0},{58,0}}, color = {0, 0, 255}));
      connect(pwLine1.n, B3.p) annotation (
        Line(points={{39,20},{44,20},{44,0},{58,0}}, color = {0, 0, 255}));
      connect(breaker1.r, pwLine1.p) annotation (
        Line(points={{6,20},{22,20},{22,20},{21,20}}, color = {0, 0, 255}));
      connect(breaker2.r, pwLine2.p) annotation (
        Line(points={{6,-20},{21,-20}}, color = {0, 0, 255}));
      connect(breaker1.s, B2.p) annotation (
        Line(points={{-14,20},{-26,20},{-26,0},{-40,0},{-40,0}}, color = {0, 0, 255}));
      connect(breaker2.s, B2.p) annotation (
        Line(points={{-14,-20},{-26,-20},{-26,0},{-40,0},{-40,0}}, color = {0, 0, 255}));
      connect(twoWindingTransformer.n, B2.p) annotation (
        Line(points={{-49,0},{-41,0},{-41,0},{-40,0}}, color = {0, 0, 255}));
      connect(G1.pwPin, B1.p) annotation (
        Line(points={{-87,0},{-80,0}}, color = {0, 0, 255}));
      connect(twoWindingTransformer.p, B1.p) annotation (
        Line(points={{-71,0},{-80,0}}, color = {0, 0, 255}));
      annotation (
        experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 1e-4),
        Diagram(coordinateSystem(extent={{-120,-100},{120,100}})),
    Documentation(info="<html>
<p>This system undergoes a disturbance after one of the lines opens at 1 second. </p>
<p>Simulate the system for 10 seconds. Variables of interest are:</p>
<ul>
<li><code>G1.P</code></li>
<li><code>G1.Q</code></li>
<li><code>G1.order6.v</code></li>
<li><code>G1.order6.w</code></li>
</ul>
<p>Compare these results with the ones obtained in the <strong>Network1</strong> and <strong>Network3</strong>.
Compare also with the results obtained from the simulating the systems in <strong>Example_1Mode</strong> and <strong>Example_2</strong>.</p>
</html>"));
end Network2;
