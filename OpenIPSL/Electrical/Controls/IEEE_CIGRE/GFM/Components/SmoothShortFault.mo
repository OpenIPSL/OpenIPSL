within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components;
model SmoothShortFault "Three-phase-to-ground fault through a resistance with smooth switches, cleared at current zero"
  parameter Modelica.Units.SI.Resistance R=5 "Fault resistance from each phase to ground";
  parameter Modelica.Units.SI.Time faultTime=5 "Time the fault is applied";
  parameter Modelica.Units.SI.Time faultDuration=0.1 "Time the fault command stays on (clearing waits for the next current zero)";
  parameter Modelica.Units.SI.Resistance Ron=1e-5 "Closed switch resistance";
  parameter Modelica.Units.SI.Conductance Goff=0.0006 "Opened switch conductance";
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-168},{10,-148}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=R) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,-132})));
  Modelica.Electrical.Analog.Interfaces.Pin C "Phase C, side of pins A, B, C (fault location)"
    annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
  Modelica.Electrical.Analog.Interfaces.Pin B "Phase B, side of pins A, B, C (fault location)"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.Pin A "Phase A, side of pins A, B, C (fault location)"
    annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin C_n "Phase C, pass-through side"
    annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin B_n "Phase B, pass-through side"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin A_n "Phase A, pass-through side"
    annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R=R) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-132})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R=R) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,-132})));
  Modelica.Blocks.Sources.BooleanTable FaultTime(
    table={faultTime,faultDuration + faultTime},
    startValue=false,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{-150,-48},{-130,-28}})));
  ZeroCrossingDetector zeroCrossingC "Switch command of phase C, opened at the current zero"
    annotation (Placement(transformation(extent={{-80,4},{-40,40}})));
  ZeroCrossingDetector zeroCrossingB "Switch command of phase B, opened at the current zero"
    annotation (Placement(transformation(extent={{-80,-56},{-40,-20}})));
  ZeroCrossingDetector zeroCrossingA "Switch command of phase A, opened at the current zero"
    annotation (Placement(transformation(extent={{-80,-120},{-40,-80}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
    annotation (Placement(transformation(extent={{48,50},{28,70}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1
    annotation (Placement(transformation(extent={{50,-10},{30,10}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor2
    annotation (Placement(transformation(extent={{50,-70},{30,-50}})));
  SmoothSwitch smoothSwitch(
    Ron=Ron,
    Goff=Goff,
    f_cut=f_cut)
    annotation (Placement(transformation(extent={{-30,6},{-10,26}})));
  SmoothSwitch smoothSwitch1(
    Ron=Ron,
    Goff=Goff,
    f_cut=f_cut)
    annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
  SmoothSwitch smoothSwitch2(
    Ron=Ron,
    Goff=Goff,
    f_cut=f_cut)
    annotation (Placement(transformation(extent={{10,-110},{30,-90}})));
  parameter SI.Frequency f_cut=1e3 "Cut-off frequency of the switch resistance filters";
equation
  connect(resistor.n, ground.p)
    annotation (Line(points={{-20,-142},{-20,-148},{0,-148}},
                                                     color={0,0,255}));
  connect(resistor1.n, ground.p)
    annotation (Line(points={{0,-142},{0,-148}},            color={0,0,255}));
  connect(resistor2.n, ground.p)
    annotation (Line(points={{20,-142},{20,-148},{0,-148}}, color={0,0,255}));
  connect(FaultTime.y, zeroCrossingC.u) annotation (Line(points={{-129,-38},
          {-116,-38},{-116,22},{-80,22}}, color={255,0,255}));
  connect(zeroCrossingB.u, FaultTime.y)
    annotation (Line(points={{-80,-38},{-129,-38}}, color={255,0,255}));
  connect(zeroCrossingA.u, FaultTime.y) annotation (Line(points={{-80,-100},
          {-116,-100},{-116,-38},{-129,-38}}, color={255,0,255}));

  connect(currentSensor.p, C_n)
    annotation (Line(points={{48,60},{100,60}}, color={0,0,255}));
  connect(currentSensor.n, C)
    annotation (Line(points={{28,60},{-100,60}}, color={0,0,255}));
  connect(currentSensor.i, zeroCrossingC.u1) annotation (Line(points={{38,49},
          {38,48},{-60,48},{-60,40}},     color={0,0,127}));
  connect(currentSensor1.p, B_n)
    annotation (Line(points={{50,0},{100,0}}, color={0,0,255}));
  connect(currentSensor1.n, B)
    annotation (Line(points={{30,0},{-100,0}}, color={0,0,255}));
  connect(zeroCrossingB.u1, currentSensor1.i) annotation (Line(points={{
          -60,-20},{-60,-14},{40,-14},{40,-11}}, color={0,0,127}));
  connect(currentSensor2.p, A_n)
    annotation (Line(points={{50,-60},{100,-60}}, color={0,0,255}));
  connect(currentSensor2.n, A)
    annotation (Line(points={{30,-60},{-100,-60}}, color={0,0,255}));
  connect(zeroCrossingA.u1, currentSensor2.i) annotation (Line(points={{-60,-80},
          {-60,-72},{40,-72},{40,-71}},          color={0,0,127}));
  connect(zeroCrossingC.y, smoothSwitch.u) annotation (Line(
      points={{-38,22},{-38,16},{-30,16}},
      color={255,0,255},
      smooth=Smooth.Bezier));
  connect(smoothSwitch.pin, C) annotation (Line(points={{-20,26},{-20,60},
          {-100,60}}, color={0,0,255}));
  connect(smoothSwitch.pin1, resistor.p) annotation (Line(
      points={{-20,6},{-20,-122}},
      color={0,0,255},
      smooth=Smooth.Bezier));
  connect(smoothSwitch1.pin, B)
    annotation (Line(points={{0,-30},{0,0},{-100,0}}, color={0,0,255}));
  connect(smoothSwitch1.pin1, resistor1.p) annotation (Line(
      points={{0,-50},{0,-122}},
      color={0,0,255},
      smooth=Smooth.Bezier));
  connect(zeroCrossingA.y, smoothSwitch2.u) annotation (Line(
      points={{-38,-100},{-38,-100},{10,-100}},
      color={255,0,255},
      smooth=Smooth.Bezier));
  connect(smoothSwitch2.pin, A) annotation (Line(points={{20,-90},{20,-60},
          {-100,-60}}, color={0,0,255}));
  connect(smoothSwitch2.pin1, resistor2.p) annotation (Line(
      points={{20,-110},{20,-122}},
      color={0,0,255},
      smooth=Smooth.Bezier));
  connect(zeroCrossingB.y, smoothSwitch1.u) annotation (Line(
      points={{-38,-38},{-38,-40},{-10,-40}},
      color={255,0,255},
      smooth=Smooth.Bezier));
  annotation (Documentation(info="<html>
<p>
Same fault as
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.ShortFault\">ShortFault</a>, but each
phase switch is a
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.SmoothSwitch\">SmoothSwitch</a>
whose resistance moves between <code>Ron</code> and <code>1/Goff</code> through a low-pass filter with cut-off
frequency <code>f_cut</code>. The fault command runs from <code>faultTime</code> to
<code>faultTime + faultDuration</code>; each phase opens at the next current zero after the command falls.
This is the fault of the point-of-connection fault tests of the 2026 papers.
</p>
<p>
Ported from <code>GridComponents.SmoothShortFault</code> of <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a>: the unused parameters
<code>line_capacitance</code> and <code>threshold</code>, the self-connection <code>connect(C, C)</code> and the
redundant <code>connect(resistor2.n, resistor1.n)</code> (both pins are already connected to <code>ground.p</code>) removed,
<code>Ron</code> and <code>Goff</code> typed, and the switch commands <code>zeroXdetect1</code>,
<code>zeroXdetect2</code> and <code>zeroXdetect</code> renamed <code>zeroCrossingA</code>, <code>zeroCrossingB</code> and
<code>zeroCrossingC</code> after their class and phase.
</p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-140},{100,100}}), graphics={
        Rectangle(
          extent={{-100,100},{100,-140}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
                               Rectangle(
          extent={{-72,46},{-48,6}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),Line(
          points={{-60,6},{-60,6},{-60,-6}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-72,-6},{-48,-6}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-70,-10},{-50,-10}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-66,-14},{-52,-14}},
          color={0,0,255},
          smooth=Smooth.None),Rectangle(
          extent={{-64,50},{-56,46}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),Line(
          points={{-62,48},{-54,30},{-68,30},{-56,8}},
          color={255,0,0},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-62,10},{-56,8},{-56,14}},
          color={255,0,0},
          smooth=Smooth.None), Rectangle(
          extent={{-12,-12},{12,-52}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),Line(
          points={{0,-52},{0,-52},{0,-64}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-12,-64},{12,-64}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-10,-68},{10,-68}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-6,-72},{8,-72}},
          color={0,0,255},
          smooth=Smooth.None),Rectangle(
          extent={{-4,-8},{4,-12}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),Line(
          points={{-2,-10},{6,-28},{-8,-28},{4,-50}},
          color={255,0,0},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-2,-48},{4,-50},{4,-44}},
          color={255,0,0},
          smooth=Smooth.None), Rectangle(
          extent={{48,-72},{72,-112}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),Line(
          points={{60,-112},{60,-112},{60,-124}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{48,-124},{72,-124}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{50,-128},{70,-128}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{54,-132},{68,-132}},
          color={0,0,255},
          smooth=Smooth.None),Rectangle(
          extent={{56,-68},{64,-72}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),Line(
          points={{58,-70},{66,-88},{52,-88},{64,-110}},
          color={255,0,0},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{58,-108},{64,-110},{64,-104}},
          color={255,0,0},
          smooth=Smooth.None),
        Line(
          points={{-100,60},{100,60}},
          color={0,140,72},
          thickness=0.5),
        Line(
          points={{8,60}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-102,-60},{102,-60}},
          color={238,46,47},
          thickness=0.5),
        Line(
          points={{-100,0},{-76,0}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-76,0},{0,0}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{0,0},{76,0}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{76,0},{102,0}},
          color={28,108,200},
          thickness=0.5),
        Text(
          extent={{-102,98},{-74,68}},
          textColor={28,108,200},
          textString="C"),
        Text(
          extent={{-102,38},{-74,8}},
          textColor={28,108,200},
          textString="B"),
        Text(
          extent={{-102,-22},{-74,-52}},
          textColor={28,108,200},
          textString="A"),
        Text(
          extent={{70,98},{98,68}},
          textColor={28,108,200},
          textString="C"),
        Text(
          extent={{70,38},{98,8}},
          textColor={28,108,200},
          textString="B"),
        Text(
          extent={{70,-22},{98,-52}},
          textColor={28,108,200},
          textString="A"),
        Line(
          points={{-60,50},{-60,60}},
          color={0,140,72},
          thickness=0.5),
        Line(
          points={{0,-8},{0,0}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{60,-68},{60,-60}},
          color={238,46,47},
          thickness=0.5)}),                                      Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-140},{
            100,100}})));
end SmoothShortFault;
