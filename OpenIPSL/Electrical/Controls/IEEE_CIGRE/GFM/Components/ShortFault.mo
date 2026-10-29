within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components;
model ShortFault "Three-phase-to-ground fault through a resistance, cleared at current zero"
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
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch           switch(
    Ron=Ron,
    Goff=Goff) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-20,16})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch           switch1(
    Ron=Ron,
    Goff=Goff) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-42})));
  Modelica.Electrical.Analog.Ideal.IdealClosingSwitch           switch2(
    Ron=Ron,
    Goff=Goff) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,-100})));
  Modelica.Blocks.Sources.BooleanTable booleanTable(
    table={faultTime,faultDuration + faultTime},
    startValue=false,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{-146,-52},{-126,-32}})));
  ZeroCrossingDetector zeroCrossingC "Switch command of phase C, opened at the current zero"
    annotation (Placement(transformation(extent={{-60,6},{-40,26}})));
  ZeroCrossingDetector zeroCrossingB "Switch command of phase B, opened at the current zero"
    annotation (Placement(transformation(extent={{-62,-52},{-42,-32}})));
  ZeroCrossingDetector zeroCrossingA "Switch command of phase A, opened at the current zero"
    annotation (Placement(transformation(extent={{-60,-110},{-40,-90}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
    annotation (Placement(transformation(extent={{48,50},{28,70}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1
    annotation (Placement(transformation(extent={{50,-10},{30,10}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor2
    annotation (Placement(transformation(extent={{50,-70},{30,-50}})));
equation
  connect(resistor.n, ground.p)
    annotation (Line(points={{-20,-142},{-20,-148},{0,-148}},
                                                     color={0,0,255}));
  connect(resistor1.n, ground.p)
    annotation (Line(points={{0,-142},{0,-148}},            color={0,0,255}));
  connect(resistor.p, switch.p)
    annotation (Line(points={{-20,-122},{-20,6}},   color={0,0,255}));
  connect(resistor1.p, switch1.p)
    annotation (Line(points={{0,-122},{0,-52}}, color={0,0,255}));
  connect(switch2.p, resistor2.p)
    annotation (Line(points={{20,-110},{20,-122}},color={0,0,255}));
  connect(resistor2.n, ground.p)
    annotation (Line(points={{20,-142},{20,-148},{0,-148}}, color={0,0,255}));
  connect(zeroCrossingC.y, switch.control)
    annotation (Line(points={{-39,16},{-32,16}}, color={255,0,255}));
  connect(zeroCrossingB.y, switch1.control)
    annotation (Line(points={{-41,-42},{-12,-42}}, color={255,0,255}));
  connect(zeroCrossingA.y, switch2.control)
    annotation (Line(points={{-39,-100},{8,-100}}, color={255,0,255}));
  connect(booleanTable.y, zeroCrossingC.u) annotation (Line(points={{-125,-42},{-114,
          -42},{-114,16},{-60,16}}, color={255,0,255}));
  connect(zeroCrossingB.u, booleanTable.y)
    annotation (Line(points={{-62,-42},{-125,-42}}, color={255,0,255}));
  connect(zeroCrossingA.u, booleanTable.y) annotation (Line(points={{-60,-100},{-114,
          -100},{-114,-42},{-125,-42}}, color={255,0,255}));

  connect(currentSensor.p, C_n)
    annotation (Line(points={{48,60},{100,60}}, color={0,0,255}));
  connect(currentSensor.n, C)
    annotation (Line(points={{28,60},{-100,60}}, color={0,0,255}));
  connect(currentSensor.i, zeroCrossingC.u1) annotation (Line(points={{38,49},{38,
          36},{-50,36},{-50,26}}, color={0,0,127}));
  connect(switch.n, C)
    annotation (Line(points={{-20,26},{-20,60},{-100,60}}, color={0,0,255}));
  connect(currentSensor1.p, B_n)
    annotation (Line(points={{50,0},{100,0}}, color={0,0,255}));
  connect(currentSensor1.n, B)
    annotation (Line(points={{30,0},{-100,0}}, color={0,0,255}));
  connect(zeroCrossingB.u1, currentSensor1.i) annotation (Line(points={{-52,-32},
          {-52,-24},{40,-24},{40,-11}}, color={0,0,127}));
  connect(currentSensor2.p, A_n)
    annotation (Line(points={{50,-60},{100,-60}}, color={0,0,255}));
  connect(currentSensor2.n, A)
    annotation (Line(points={{30,-60},{-100,-60}}, color={0,0,255}));
  connect(zeroCrossingA.u1, currentSensor2.i) annotation (Line(points={{-50,-90},
          {-50,-80},{40,-80},{40,-71}}, color={0,0,127}));
  connect(switch1.n, B)
    annotation (Line(points={{0,-32},{0,0},{-100,0}}, color={0,0,255}));
  connect(switch2.n, A)
    annotation (Line(points={{20,-90},{20,-60},{-100,-60}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>
Three-phase-to-ground fault for the EMT tests. Pins <code>A</code>, <code>B</code>, <code>C</code> and
<code>A_n</code>, <code>B_n</code>, <code>C_n</code> are connected through current sensors; at the
<code>A</code>, <code>B</code>, <code>C</code> side each phase is tied to ground through an ideal closing switch
(<code>Ron</code>, <code>Goff</code>) in series with the fault resistance <code>R</code>. A Boolean table applies the
fault command from <code>faultTime</code> to <code>faultTime + faultDuration</code>; a
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.ZeroCrossingDetector\">ZeroCrossingDetector</a>
per phase closes the switch at once and opens it at the next zero crossing of the current measured between the two pin
sets, so the phases clear one after the other.
</p>
<p>
Ported from <code>GridComponents.ShortFault</code> of <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a>: the unused parameter
<code>line_capacitance</code>, the self-connection <code>connect(C, C)</code> and the redundant
<code>connect(resistor2.n, resistor1.n)</code> (both pins are already connected to <code>ground.p</code>) removed, <code>Ron</code> and
<code>Goff</code> typed (the description of <code>Goff</code> said &quot;Switch on resistance&quot;), and the switch
commands <code>zeroXdetectA</code>, <code>zeroXdetectB</code> and <code>zeroXdetectC</code> renamed
<code>zeroCrossingA</code>, <code>zeroCrossingB</code> and <code>zeroCrossingC</code> after their class.
</p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -180},{100,100}}),      graphics={
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
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-180},{
            100,100}})));
end ShortFault;
