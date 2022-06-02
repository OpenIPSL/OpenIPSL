within OpenIPSL.Examples.PSATSystems.ThreeArea;
model FourthOrder_AVRIII "ABC system with 4th-order machine (Syn2) and AVR Type III"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.ThreeArea.BaseClasses.BaseOrder4;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc1(
    T2=10,
    T1=1,
    Te=0.01,
    K0=25) annotation (Placement(transformation(extent={{-160,80},{-148,92}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc2(
    T2=10,
    T1=1,
    Te=0.01,
    K0=25) annotation (Placement(transformation(extent={{166,0},{156,10}})));
  Modelica.Blocks.Sources.Constant vs_1(k=0) annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        origin={-172,84})));
  Modelica.Blocks.Sources.Constant vs_2(k=0) annotation (Placement(
        transformation(
        extent={{4,-4},{-4,4}},
        origin={176,-12})));
equation
  connect(order3_2.vf, Exc2.vf)
    annotation (Line(points={{154,5},{154,5},{155.583,5}},
                                                         color={0,0,127}));
  connect(Exc2.vf0, order3_2.vf0) annotation (Line(points={{161,9.58333},{161,14},
          {150,14},{150,11}},color={0,0,127}));
  connect(Exc1.vf, order4_1.vf) annotation (Line(points={{-147.5,86},{-144,86},{
          -144,86},{-142.4,86}},color={0,0,127}));
  connect(Exc1.vf0, order4_1.vf0) annotation (Line(points={{-154,91.5},{-154,96},
          {-137.6,96},{-137.6,93.2}}, color={0,0,127}));
  connect(Exc1.v, order4_1.v) annotation (Line(points={{-159.5,89},{-164,89},{-164,
          98},{-110,98},{-110,83.6},{-114.8,83.6}}, color={0,0,127}));
  connect(vs_1.y, Exc1.vs) annotation (Line(points={{-167.6,84},{-159.5,84},{-159.5,
          83}}, color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{165.583,7.5},{170,7.5},
          {170,16},{128,16},{128,3},{131,3}},
                                         color={0,0,127}));
  connect(vs_2.y, Exc2.vs) annotation (Line(points={{171.6,-12},{170,-12},{170,
          2.5},{165.583,2.5}},
                       color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-120},{180,120}},
          preserveAspectRatio=false)),
    experiment(
      StopTime=20),
    Documentation(info="<html>
<p>This system is tests the fourth order machine with a type 3 AVR, from PSAT. Simulate the system for 20 seconds.</p>
<p>Variables of interest are:</p>
<ul>
<li><code>order2.w</code></li>
<li><code>order3_2.w</code></li>
<li><code>order4_1.w</code></li>
</ul>
<p>Note that the oscillations illustrate a clear example of non-coherent machines.</p>
<p>Compare these results with the ones from the other example systems within the <strong>ThreeArea</strong> subpackage.</p>
</html>"));
end FourthOrder_AVRIII;
