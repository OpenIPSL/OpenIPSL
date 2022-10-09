within OpenIPSL.Examples.OpenCPS.Controls;
model ANGLE_CTRL "Voltage angle control used in resynchronization"
  Modelica.Blocks.Math.Add add1(k1=-1, k2=+1) annotation (Placement(
        transformation(
        extent={{6,-6},{-6,6}},
        rotation=180,
        origin={-60,0})));
  Modelica.Blocks.Interfaces.RealInput fi_IB annotation (Placement(
        transformation(extent={{-110,40},{-90,60}}),
        iconTransformation(extent={{-100,40},{-80,60}})));
  Modelica.Blocks.Interfaces.RealInput fi_DN annotation (Placement(
        transformation(extent={{-110,-62},{-90,-42}}),
        iconTransformation(extent={{-100,-60},{-80,-40}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{0,-18},{20,2}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-40,-80},{-20,-60}})));
  Modelica.Blocks.Sources.BooleanStep booleanStep2(startValue=false, startTime=
        45) annotation (Placement(transformation(extent={{-74,-70},{-54,-50}})));
  Modelica.Blocks.Logical.Xor xor
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Blocks.Interfaces.BooleanInput TRIGGER annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,100})));
  Modelica.Blocks.Logical.RSFlipFlop rSFlipFlop(Qini=false) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-6,58})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=false)
    annotation (Placement(transformation(extent={{-60,70},{-40,90}})));
  Modelica.Blocks.Continuous.Integrator integrator(k=0.01)
    annotation (Placement(transformation(extent={{46,-14},{66,6}})));
equation
  connect(fi_IB, add1.u2) annotation (Line(points={{-100,50},{-80,50},{-80,3.6},
          {-67.2,3.6}}, color={0,0,127}));
  connect(fi_DN, add1.u1) annotation (Line(points={{-100,-52},{-80,-52},{-80,-3.6},
          {-67.2,-3.6}}, color={0,0,127}));
  connect(const.y, switch1.u3) annotation (Line(points={{-19,-70},{-10,-70},{-10,
          -16},{-2,-16}}, color={0,0,127}));
  connect(switch1.u1, add1.y)
    annotation (Line(points={{-2,0},{-53.4,0},{-53.4,0}}, color={0,0,127}));
  connect(booleanStep2.y, xor.u2) annotation (Line(points={{-53,-60},{-48,-60},
          {-48,-38},{-42,-38}}, color={255,0,255}));
  connect(xor.y, switch1.u2) annotation (Line(points={{-19,-30},{-14,-30},{-14,
          -8},{-2,-8}}, color={255,0,255}));
  connect(rSFlipFlop.S, TRIGGER)
    annotation (Line(points={{0,70},{0,100}}, color={255,0,255}));
  connect(rSFlipFlop.Q, xor.u1) annotation (Line(points={{0,47},{0,12},{-48,12},
          {-48,-30},{-42,-30}}, color={255,0,255}));
  connect(booleanConstant.y, rSFlipFlop.R)
    annotation (Line(points={{-39,80},{-12,80},{-12,70}}, color={255,0,255}));
  connect(switch1.y, integrator.u) annotation (Line(points={{21,-8},{32,-8},{32,
          -4},{44,-4}}, color={0,0,127}));
  connect(integrator.y, y) annotation (Line(points={{67,-4},{86,-4},{86,0},{110,
          0}}, color={0,0,127}));
  annotation (Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-96,60},{-14,40}},
          textColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="fi_IB"),Text(
          extent={{-94,-40},{-12,-60}},
          textColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="fi_DG"),Text(
          extent={{34,12},{98,-8}},
          textColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="P_REF"),Text(
          extent={{-54,96},{56,76}},
          textColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="ANGLE CTRL")}),
    Documentation(info="<html>
<p>This angle controller, which is based on simple Integrator, is used to reduce the error (ideally to zero) of the voltage angle difference between two different nodes in the system.</p>
<p>After the difference is reduced to zero, and the errors on voltage magnitude and frequency are also zero, the two nodes can be connected without major issues.</p>
</html>"));
end ANGLE_CTRL;
