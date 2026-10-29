within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components;
model EMTPGrid "Three-phase Thevenin equivalent of the grid: sine sources behind R and L"
  parameter Modelica.Units.SI.Voltage Vbase=6500 "Base voltage, line-to-line RMS";
  parameter Modelica.Units.SI.Frequency f=60 "Grid frequency";
  parameter Modelica.Units.SI.Resistance Rpos=0.1953 "Source positive-sequence resistance";
  parameter Modelica.Units.SI.Reactance Xpos=3.3200 "Source positive-sequence reactance at frequency f";

  Modelica.Blocks.Sources.Sine sine(
    amplitude=sqrt(2)*Vbase/sqrt(3),
    f=f,
    phase=2.0943951023932) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={84,-80})));
  Modelica.Blocks.Sources.Sine sine1(amplitude=sqrt(2)*Vbase/sqrt(3), f=f)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={84,-20})));
  Modelica.Blocks.Sources.Sine sine2(
    amplitude=sqrt(2)*Vbase/sqrt(3),
    f=f,
    phase=-2.0943951023932) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={80,40})));
  Modelica.Electrical.Analog.Basic.Ground ground4
    annotation (Placement(transformation(extent={{54,-112},{66,-100}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin C "Phase C" annotation (Placement(
        transformation(rotation=0, extent={{-110,50},{-90,70}}),
        iconTransformation(extent={{-110,50},{-90,70}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin B "Phase B" annotation (
      Placement(transformation(rotation=0, extent={{-110,-10},{-90,10}}),
        iconTransformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin A "Phase A" annotation (
      Placement(transformation(rotation=0, extent={{-110,-70},{-90,-50}}),
        iconTransformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor(i(start=0),
                                                     L=Xpos/(2*Modelica.Constants.pi
        *f))
    annotation (Placement(transformation(extent={{-80,50},{-60,70}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor3(R=Rpos)
    annotation (Placement(transformation(extent={{-56,50},{-36,70}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start=0),
                                                      L=Xpos/(2*Modelica.Constants.pi
        *f))
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor4(R=Rpos)
    annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start=0),
                                                      L=Xpos/(2*Modelica.Constants.pi
        *f))
    annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor5(R=Rpos)
    annotation (Placement(transformation(extent={{-56,-70},{-36,-50}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,40})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage2
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,-20})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage3
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-20,-80})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    k=1,
    T=0.0001,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={16,40})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(
    k=1,
    T=0.0001,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={18,-20})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder2(
    k=1,
    T=0.0001,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={18,-80})));
equation
  connect(C, inductor.p)
    annotation (Line(points={{-100,60},{-80,60}}, color={0,0,255}));
  connect(inductor.n, resistor3.p)
    annotation (Line(points={{-60,60},{-56,60}}, color={0,0,255}));
  connect(inductor1.n, resistor4.p)
    annotation (Line(points={{-60,0},{-56,0}}, color={0,0,255}));
  connect(A, inductor2.p)
    annotation (Line(points={{-100,-60},{-80,-60}}, color={0,0,255}));
  connect(inductor2.n, resistor5.p)
    annotation (Line(points={{-60,-60},{-56,-60}}, color={0,0,255}));
  connect(signalVoltage3.n, ground4.p) annotation (Line(points={{-20,-90},
          {-20,-100},{60,-100}}, color={0,0,255}));
  connect(ground4.p, signalVoltage2.n) annotation (Line(points={{60,-100},
          {60,-40},{-20,-40},{-20,-30}}, color={0,0,255}));
  connect(signalVoltage1.n, signalVoltage2.n) annotation (Line(points={{
          -20,30},{60,30},{60,-40},{-20,-40},{-20,-30}}, color={0,0,255}));
  connect(B, inductor1.p)
    annotation (Line(points={{-100,0},{-80,0}}, color={0,0,255}));
  connect(signalVoltage1.v, firstOrder.y)
    annotation (Line(points={{-8,40},{5,40}}, color={0,0,127}));
  connect(firstOrder.u, sine2.y)
    annotation (Line(points={{28,40},{69,40}}, color={0,0,127}));
  connect(firstOrder1.y, signalVoltage2.v)
    annotation (Line(points={{7,-20},{-8,-20}}, color={0,0,127}));
  connect(firstOrder1.u, sine1.y)
    annotation (Line(points={{30,-20},{73,-20}}, color={0,0,127}));
  connect(signalVoltage3.v, firstOrder2.y)
    annotation (Line(points={{-8,-80},{7,-80}}, color={0,0,127}));
  connect(firstOrder2.u, sine.y)
    annotation (Line(points={{30,-80},{73,-80}}, color={0,0,127}));
  connect(resistor5.n, signalVoltage3.p) annotation (Line(points={{-36,
          -60},{-20,-60},{-20,-70}}, color={0,0,255}));
  connect(resistor4.n, signalVoltage2.p) annotation (Line(points={{-36,0},
          {-20,0},{-20,-10}}, color={0,0,255}));
  connect(resistor3.n, signalVoltage1.p) annotation (Line(points={{-36,60},
          {-20,60},{-20,50}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>
Thevenin equivalent of the grid for the EMT tests: per phase, an ideal voltage source driven by a sine of peak value
<code>sqrt(2)*Vbase/sqrt(3)</code> and frequency <code>f</code> (phase angles +120 degrees for A, 0 for B, -120 degrees for
C) through a 0.1 ms first-order lag (initial output 1 V), behind the series resistance <code>Rpos</code> and the
inductance <code>Xpos/(2*pi*f)</code>; the source neutral is grounded. The defaults are the 6.5 kV source of the PR's
tests; the 230 kV tests set <code>Vbase = 230000</code>.
</p>
<p>
Ported from <code>GridComponents.EMTPGrid</code> of <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a>: <code>Xpos</code> is a reactance in ohm and is now
typed as one (it was declared as an inductance and then divided by <code>2*pi*f</code>), and the self-connection
<code>connect(B, B)</code> was removed.
</p>
</html>"),
    Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
            lineColor={28,108,200},
          lineThickness=0.5),
        Text(
          extent={{-92,74},{-64,44}},
          textColor={28,108,200},
          textString="C"),
        Text(
          extent={{-92,14},{-64,-16}},
          textColor={28,108,200},
          textString="B"),
        Text(
          extent={{-92,-46},{-64,-76}},
          textColor={28,108,200},
          textString="A"),
        Line(
          points={{-70,0},{-52,0}},
          color={28,108,200},
          thickness=0.5),
        Rectangle(
          extent={{-52,8},{0,-8}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{0,0},{10,0}},
          color={28,108,200},
          thickness=0.5),
        Ellipse(
          extent={{20,30},{80,-30}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{30,0},{42,10},{58,-10},{70,0}},
          color={28,108,200},
          thickness=1,
          smooth=Smooth.Bezier),
        Line(
          points={{-70,-60},{-52,-60}},
          color={238,46,47},
          thickness=0.5),
        Rectangle(
          extent={{-52,-52},{0,-68}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{0,-60},{10,-60}},
          color={238,46,47},
          thickness=0.5),
        Line(
          points={{-70,60},{-52,60}},
          color={0,140,72},
          thickness=0.5),
        Rectangle(
          extent={{-52,68},{0,52}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{10,60},{10,-60}},
          color={0,0,0},
          thickness=1),
        Line(
          points={{0,60},{10,60}},
          color={0,140,72},
          thickness=0.5),
        Line(
          points={{10,0},{20,0}},
          color={0,0,0},
          thickness=1)}));
end EMTPGrid;
