within OpenIPSL.Examples.MPC;
model Comparison

  Real x1;
  Real x2;
  parameter Real a=1;
  parameter Real b=1;
  parameter Real T=1;

  Modelica.Blocks.Sources.Step step(
    offset=0, startTime=T)
    annotation (Placement(transformation(extent={{-78,68},{-58,88}})));
  Modelica.Blocks.Sources.Step step1(
    height=0.1,
    offset=0,
    startTime=2*T)
    annotation (Placement(transformation(extent={{-78,28},{-58,48}})));
  Modelica.Blocks.Sources.Step step2(
    height=-0.5,
    offset=0,
    startTime=3*T)
    annotation (Placement(transformation(extent={{-78,-12},{-58,8}})));
  Modelica.Blocks.Sources.Step step3(
    height=-0.25,
    offset=0,
    startTime=4*T)
    annotation (Placement(transformation(extent={{-78,-52},{-58,-32}})));
  Modelica.Blocks.Sources.Step step4(
    height=2,
    offset=0,
    startTime=5*T)
    annotation (Placement(transformation(extent={{-78,-88},{-58,-68}})));
  Modelica.Blocks.Math.Add3 add3_1
    annotation (Placement(transformation(extent={{-6,32},{14,52}})));
  Modelica.Blocks.Math.Add3 this
    annotation (Placement(transformation(extent={{36,-32},{56,-12}})));
initial equation
  x1 = 1;
  x2 = 1;

equation

  der(x1) = -x1*x1 + this.y;
  der(x2) = 1 - 2*x2 + this.y;

  connect(step.y, add3_1.u1) annotation (Line(points={{-57,78},{-16,78},{-16,50},
          {-8,50}}, color={0,0,127}));
  connect(step1.y, add3_1.u2) annotation (Line(points={{-57,38},{-18,38},{-18,42},
          {-8,42}}, color={0,0,127}));
  connect(step2.y, add3_1.u3) annotation (Line(points={{-57,-2},{-16,-2},{-16,34},
          {-8,34}}, color={0,0,127}));
  connect(add3_1.y, this.u1) annotation (Line(points={{15,42},{26,42},{26,-14},{
          34,-14}}, color={0,0,127}));
  connect(step3.y, this.u2) annotation (Line(points={{-57,-42},{24,-42},{24,-22},
          {34,-22}}, color={0,0,127}));
  connect(step4.y, this.u3) annotation (Line(points={{-57,-78},{26,-78},{26,-30},
          {34,-30}}, color={0,0,127}));
  annotation ();
end Comparison;
