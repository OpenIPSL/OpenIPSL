within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components;
model GridWithFault "Three-phase grounded voltage source whose amplitude dips for a given time"
  parameter Modelica.Units.SI.Voltage Vbase=6500 "Base voltage, line-to-line RMS";
  parameter OpenIPSL.Types.PerUnit Vgrid=1 "Source voltage before and after the dip";
  parameter OpenIPSL.Types.PerUnit FaultVoltage=0.7 "Source voltage during the dip";
  parameter Modelica.Units.SI.Time FaultTime=5 "Start time of the dip";
  parameter Modelica.Units.SI.Time FaultDuration=0.1 "Duration of the dip";
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-64,-78})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,-48})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage2 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-14,-18})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=sqrt(2)*Vbase/sqrt(3),
    f=60,
    phase=2.0943951023932) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={84,-24})));
  Modelica.Blocks.Sources.Sine sine1(amplitude=sqrt(2)*Vbase/sqrt(3),f=60)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={84,-54})));
  Modelica.Blocks.Sources.Sine sine2(
    amplitude=sqrt(2)*Vbase/sqrt(3),
    f=60,
    phase=-2.0943951023932) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={84,-84})));
  Modelica.Electrical.Analog.Basic.Ground ground4
    annotation (Placement(transformation(extent={{-70,-106},{-58,-94}})));
  Modelica.Blocks.Sources.Step step1(
    height=FaultVoltage - Vgrid,
    offset=Vgrid,
    startTime=FaultTime)
                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={28,82})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={18,-18})));
  Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={18,-48})));
  Modelica.Blocks.Math.Product product3 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={18,-78})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    k=1,
    T=0.0001,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={44,18})));
  Modelica.Blocks.Sources.Step step2(
    height=Vgrid - FaultVoltage,
    offset=0,
    startTime=FaultTime + FaultDuration)
                   annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,82})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={44,46})));
  Modelica.Electrical.Analog.Interfaces.PositivePin C "Phase C" annotation (Placement(
        transformation(rotation=0, extent={{-110,50},{-90,70}}),
        iconTransformation(extent={{-110,50},{-90,70}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin B "Phase B" annotation (
      Placement(transformation(rotation=0, extent={{-110,-10},{-90,10}}),
        iconTransformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin A "Phase A" annotation (
      Placement(transformation(rotation=0, extent={{-110,-70},{-90,-50}}),
        iconTransformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=1e6) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-76,-78})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R=1e6) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-46,-48})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R=1e6) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-24,-18})));
equation
  connect(product1.u1,sine. y)
    annotation (Line(points={{30,-24},{73,-24}},     color={0,0,127}));
  connect(product2.u1,sine1. y)
    annotation (Line(points={{30,-54},{73,-54}},     color={0,0,127}));
  connect(product3.u1,sine2. y)
    annotation (Line(points={{30,-84},{73,-84}},     color={0,0,127}));
  connect(product1.y,signalVoltage2. v) annotation (Line(points={{7,-18},{-2,-18}},
                                      color={0,0,127}));
  connect(product2.y,signalVoltage1. v) annotation (Line(points={{7,-48},{-18,-48}},
                            color={0,0,127}));
  connect(product3.y,signalVoltage. v) annotation (Line(points={{7,-78},{-52,-78}},
                            color={0,0,127}));
  connect(firstOrder.y,product1. u2)
    annotation (Line(points={{44,7},{44,-12},{30,-12}},      color={0,0,127}));
  connect(product2.u2,firstOrder. y) annotation (Line(points={{30,-42},{44,-42},
          {44,7}},    color={0,0,127}));
  connect(product3.u2,firstOrder. y) annotation (Line(points={{30,-72},{44,-72},
          {44,7}},    color={0,0,127}));
  connect(firstOrder.u,add. y)
    annotation (Line(points={{44,30},{44,35}},     color={0,0,127}));
  connect(step1.y,add. u2) annotation (Line(points={{28,71},{28,68},{38,68},{38,
          58}},                           color={0,0,127}));
  connect(step2.y,add. u1) annotation (Line(points={{60,71},{60,68},{50,68},{50,
          58}},                           color={0,0,127}));
  connect(C, signalVoltage.p)
    annotation (Line(points={{-100,60},{-64,60},{-64,-68}}, color={0,0,255}));
  connect(B, signalVoltage1.p) annotation (Line(points={{-100,0},{-30,0},
          {-30,-38}}, color={0,0,255}));
  connect(A, signalVoltage2.p) annotation (Line(points={{-100,-60},{-78,-60},
          {-78,-4},{-14,-4},{-14,-8}}, color={0,0,255}));
  connect(signalVoltage2.n, ground4.p)
    annotation (Line(points={{-14,-28},{-14,-94},{-64,-94}}, color={0,0,255}));
  connect(signalVoltage1.n, ground4.p)
    annotation (Line(points={{-30,-58},{-30,-94},{-64,-94}}, color={0,0,255}));
  connect(signalVoltage.n, ground4.p)
    annotation (Line(points={{-64,-88},{-64,-94}}, color={0,0,255}));
  connect(resistor.n, signalVoltage.n)
    annotation (Line(points={{-76,-88},{-64,-88}}, color={0,0,255}));
  connect(resistor.p, signalVoltage.p)
    annotation (Line(points={{-76,-68},{-64,-68}}, color={0,0,255}));
  connect(resistor1.p, signalVoltage1.p)
    annotation (Line(points={{-46,-38},{-30,-38}}, color={0,0,255}));
  connect(resistor1.n, signalVoltage1.n)
    annotation (Line(points={{-46,-58},{-30,-58}}, color={0,0,255}));
  connect(resistor2.n, signalVoltage2.n)
    annotation (Line(points={{-24,-28},{-14,-28}}, color={0,0,255}));
  connect(resistor2.p, signalVoltage2.p)
    annotation (Line(points={{-24,-8},{-14,-8}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>
Ideal three-phase source, grounded wye, for the EMT tests: three controlled voltage sources driven by 60 Hz sines of
peak value <code>sqrt(2)*Vbase/sqrt(3)</code> (phase angles +120 degrees for A, 0 for B and -120 degrees for C), each with a
1 MOhm shunt resistor. The sine amplitudes are multiplied by a per-unit factor that equals <code>Vgrid</code>, changes
to <code>FaultVoltage</code> at <code>FaultTime</code> and returns to <code>Vgrid</code> at
<code>FaultTime + FaultDuration</code>; a 0.1 ms first-order lag (initial output 1) smooths the steps. With
<code>FaultDuration</code> longer than the simulation the dip becomes a permanent voltage step.
</p>
<p>
Ported from <code>GridComponents.GridWithFault</code> of <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a>; parameter types and descriptions corrected.
</p>
</html>"),
    Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
            lineColor={0,0,255}), Text(
          extent={{-64,58},{100,-52}},
          textColor={0,0,255},
          textString="Grid"),
        Text(
          extent={{-94,74},{-66,44}},
          textColor={28,108,200},
          textString="C"),
        Text(
          extent={{-94,14},{-66,-16}},
          textColor={28,108,200},
          textString="B"),
        Text(
          extent={{-94,-46},{-66,-76}},
          textColor={28,108,200},
          textString="A")}));
end GridWithFault;
