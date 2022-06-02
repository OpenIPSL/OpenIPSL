within OpenIPSL.Examples.KundurSMIB;
model SMIB_AVR "Single-Machine-Infinite-Bus system with generation unit composed of Machine and AVR"
  extends Modelica.Icons.Example;
  extends SMIB_Partial;
  Generation_Groups.Generator_AVR G1(
    v_0=1,
    P_0=0.899999999997135*S_b,
    Q_0=0.436002238696658*S_b,
    angle_0=0.494677176989155,
    machine(delta(fixed=true)))
    annotation (Placement(transformation(extent={{-82,-10},{-62,10}})));
protected
  parameter Real S_b=SysData.S_b;
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-61,0},{-52,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
          preserveAspectRatio=false), graphics={Text(
          extent={{-110,70},{110,50}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="(AVR)")}),
    experiment(
      StopTime=10,
      Interval=0.0001,
      Tolerance=1e-006),
Documentation(info="<html>
<p>This example system represents an SMIB system with generation unit composed of a machine and an AVR. The system should be simulated during 10 seconds.</p>
<p>Variables of interest are:</p>
<ul>
<li><code>B1.v</code></li>
<li><code>G1.machine.delta</code></li>
</ul>
<p>Note that the system is unstable. Compare these variables with the ones obtained when simulating <code>SMIB</code> and <code>SMIB_AVR_PSS</code> for 10 seconds.</p>
</html>"));
end SMIB_AVR;
