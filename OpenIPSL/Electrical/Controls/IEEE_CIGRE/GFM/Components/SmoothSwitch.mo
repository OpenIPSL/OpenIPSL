within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components;
model SmoothSwitch "Switch modelled as a resistor that moves smoothly between its on and off values"
  parameter SI.Resistance Ron = 1e-5
    "Closed switch resistance";
  parameter SI.Conductance Goff = 1e-5
    "Opened switch conductance";
  Modelica.Electrical.Analog.Interfaces.Pin pin "First terminal of the switch"
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  Modelica.Electrical.Analog.Interfaces.Pin pin1 "Second terminal of the switch"
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  Modelica.Blocks.Interfaces.BooleanInput u "Switch command, true = closed"
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue=Ron, realFalse=1/
        Goff) "Resistance requested by the switch command"
    annotation (Placement(transformation(extent={{-72,-10},{-52,10}})));
  Modelica.Blocks.Continuous.Filter filter(
    analogFilter=Modelica.Blocks.Types.AnalogFilter.CriticalDamping,
    filterType=Modelica.Blocks.Types.FilterType.LowPass,
    order=2,
    f_cut=f_cut,
    gain=1,
    normalized=true) "Low-pass filter that smooths the resistance change"
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Electrical.Analog.Basic.VariableResistor resistor "Switch resistance" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90)));
  parameter SI.Frequency f_cut=1e3 "Cut-off frequency of the resistance filter";
equation
  connect(u, booleanToReal.u)
    annotation (Line(points={{-100,0},{-74,0}}, color={255,0,255}));
  connect(resistor.n, pin) annotation (Line(points={{0,10},{0,100}},
        color={0,0,255}));
  connect(resistor.p, pin1) annotation (Line(points={{0,-10},{0,-100}},
                    color={0,0,255}));
  connect(filter.y, resistor.R)
    annotation (Line(points={{-19,0},{-12,0}},color={0,0,127}));
  connect(booleanToReal.y, filter.u)
    annotation (Line(points={{-51,0},{-42,0}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>
Switch between <code>pin</code> and <code>pin1</code> modelled as a variable resistor. The command <code>u</code>
selects the resistance <code>Ron</code> (closed) or <code>1/Goff</code> (open); the selected value reaches the resistor
through a second-order critically damped low-pass filter with cut-off frequency <code>f_cut</code>, so the resistance
changes smoothly instead of stepping, which keeps the EMT network free of switching discontinuities.
</p>
<p>
Ported from <code>tools.SmoothSwitch</code> of <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a> without its <code>experiment</code> annotation (a
component carries none).
</p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Ellipse(extent={{-4,4},{4,-4}},    lineColor={0,0,255},
          origin={0,-40},
          rotation=90),
        Line(points={{-22,-1},{30,-1}},color={0,0,255},
          origin={-1,72},
          rotation=90),
        Line(points={{-27,-38.5},{43,21.5}},
                                       color={0,0,255},
          origin={21.5,7},
          rotation=90),
        Line(points={{-34,25},{22,25}},
                                     color={0,0,255},
          origin={25,-66},
          rotation=90),
        Line(
          points={{24,-14},{24,-36},{40,-48}},
          color={28,108,200},
          smooth=Smooth.Bezier),
        Line(
          points={{18,-24},{18,-38},{26,-46}},
          color={28,108,200},
          smooth=Smooth.Bezier),
        Line(
          points={{12,-32},{12,-42},{18,-48}},
          color={28,108,200},
          smooth=Smooth.Bezier)}),                               Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SmoothSwitch;
