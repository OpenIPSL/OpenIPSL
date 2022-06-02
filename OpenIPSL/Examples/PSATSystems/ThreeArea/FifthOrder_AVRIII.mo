within OpenIPSL.Examples.PSATSystems.ThreeArea;
model FifthOrder_AVRIII "ABC system with 5th-order machine (Syn2) and AVR Type III"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.ThreeArea.BaseClasses.BaseOrder5;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc1(
    T2=10,
    T1=1,
    Te=0.01,
    K0=25) annotation (Placement(transformation(extent={{-160,80},{-148,92}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc2(
    T2=10,
    T1=1,
    Te=0.01,
    K0=25) annotation (Placement(transformation(extent={{170,0},{160,10}})));
  Modelica.Blocks.Sources.Constant vs_1(k=0) annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        origin={-172,84})));
  Modelica.Blocks.Sources.Constant vs_2(k=0) annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        origin={164,-16})));
equation
  connect(Exc1.vf, Syn2.vf) annotation (Line(points={{-147.5,86},{-144,86},{-144,
          86},{-142.4,86}},
                          color={0,0,127}));
  connect(Exc1.vf0, Syn2.vf0) annotation (Line(points={{-154,91.5},{-154,96},{-137.6,
          96},{-137.6,93.2}}, color={0,0,127}));
  connect(Exc1.v, Syn2.v) annotation (Line(points={{-159.5,89},{-164,89},{-164,98},
          {-112,98},{-112,83.6},{-114.8,83.6}}, color={0,0,127}));
  connect(Exc2.vf, order3_2.vf) annotation (Line(points={{159.583,5},{156.75,5},
          {156.75,5},{154,5}},color={0,0,127}));
  connect(order3_2.vf0, Exc2.vf0) annotation (Line(points={{150,11},{150,14},{165,
          14},{165,9.58333}},color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{169.583,7.5},{174,7.5},
          {174,16},{128,16},{128,3},{131,3}},
                                         color={0,0,127}));
  connect(vs_1.y, Exc1.vs) annotation (Line(points={{-167.6,84},{-159.5,84},{-159.5,
          83}}, color={0,0,127}));
  connect(Exc2.vs, vs_2.y) annotation (Line(points={{169.583,2.5},{172,2.5},{
          172,-16},{168.4,-16}},
                       color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-120},{180,120}},
          preserveAspectRatio=false)),
    experiment(
      StopTime=20),
    Documentation(info="<html>
<p>This system is tests the fifth order machine with a type 3 AVR, from PSAT. Simulate the system for 20 seconds.</p>
<p>Variables of interest are:</p>
<ul>
<li><code>order2.w</code></li>
<li><code>order3_2.w</code></li>
<li><code>Syn2.w</code></li>
</ul>
<p>Note that the oscillations illustrate a clear example of non-coherent machines.</p>
<p>Compare these results with the ones from the other example systems within the <strong>ThreeArea</strong> subpackage.</p>
</html>"));
end FifthOrder_AVRIII;
