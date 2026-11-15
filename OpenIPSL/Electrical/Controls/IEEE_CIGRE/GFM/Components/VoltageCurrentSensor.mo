within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components;
model VoltageCurrentSensor "Series current sensor and phase-to-ground voltage sensor for one phase"
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor "Voltage of pin n to ground"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,-18})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor "Current from pin p to pin n"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-20,0})));
  Modelica.Electrical.Analog.Interfaces.PositivePin p "Input side of the series current sensor"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin n "Output side, where the voltage is measured"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Electrical.Analog.Basic.Ground ground "Reference of the voltage measurement"
    annotation (Placement(transformation(extent={{10,-80},{30,-60}})));
  Modelica.Blocks.Interfaces.RealOutput current(unit="A") "Current from pin p to pin n" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,110})));
  Modelica.Blocks.Interfaces.RealOutput voltage(unit="V") "Voltage of pin n to ground" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,110})));
equation
  connect(currentSensor.p, p)
    annotation (Line(points={{-30,0},{-100,0}}, color={0,0,255}));
  connect(currentSensor.n, voltageSensor.p)
    annotation (Line(points={{-10,0},{20,0},{20,-8}}, color={0,0,255}));
  connect(n, voltageSensor.p)
    annotation (Line(points={{100,0},{20,0},{20,-8}}, color={0,0,255}));
  connect(ground.p, voltageSensor.n)
    annotation (Line(points={{20,-60},{20,-28}}, color={0,0,255}));
  connect(currentSensor.i, current) annotation (Line(points={{-20,-11},{-20,
          -14},{-40,-14},{-40,110}}, color={0,0,127}));
  connect(voltageSensor.v, voltage) annotation (Line(points={{9,-18},{0,-18},
          {0,40},{40,40},{40,110}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>
Series current sensor and voltage-to-ground sensor for one phase of the three-phase EMT circuits of this package. The
output <code>current</code> is the current from pin <code>p</code> to pin <code>n</code> (A); the output
<code>voltage</code> is the instantaneous potential of pin <code>n</code> with respect to ground (V).
</p>
<p>
Ported from <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a>, where the same model existed twice (<code>tools.votlage_current_sensor</code> and
<code>tools.votlage_current_sensor_no_init</code>). The two differed only by <code>start = 0</code> on the two outputs,
which is the default start value of a Real variable, so this one class replaces both.
</p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
        Text(
          extent={{-68,98},{-12,66}},
          textColor={28,108,200},
          textString="Current"),
        Text(
          extent={{12,98},{68,66}},
          textColor={28,108,200},
          textString="Voltage")}), Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end VoltageCurrentSensor;
