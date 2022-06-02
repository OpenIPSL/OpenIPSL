within OpenIPSL.Examples.PSATSystems.ThreeArea;
model SixthOrder_AVRIII "ABC system with 6th-order machine (Syn2) and AVR Type III"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Examples.PSATSystems.ThreeArea.BaseClasses.BaseOrder6;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc1(
    T2=10,
    T1=1,
    Te=0.01,
    K0=25) annotation (Placement(transformation(extent={{-154,80},{-142,92}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII Exc2(
    T2=10,
    T1=1,
    Te=0.01,
    K0=25) annotation (Placement(transformation(extent={{166,0},{156,10}})));
  Modelica.Blocks.Sources.Constant vs_1(k=0) annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        origin={-166,84})));
  Modelica.Blocks.Sources.Constant vs_2(k=0) annotation (Placement(
        transformation(
        extent={{4,-4},{-4,4}},
        origin={176,24})));
equation
  connect(Exc1.vf, Syn2.vf) annotation (Line(points={{-141.5,86},{-138.4,86},{-138.4,
          86}}, color={0,0,127}));
  connect(Exc1.vf0, Syn2.vf0) annotation (Line(points={{-148,91.5},{-148,96},{-133.6,
          96},{-133.6,93.2}}, color={0,0,127}));
  connect(Exc1.v, Syn2.v) annotation (Line(points={{-153.5,89},{-160,89},{-160,98},
          {-108,98},{-108,83.6},{-110.8,83.6}}, color={0,0,127}));
  connect(vs_1.y, Exc1.vs) annotation (Line(points={{-161.6,84},{-153.5,84},{-153.5,
          83}}, color={0,0,127}));
  connect(Exc2.vf, order3_2.vf)
    annotation (Line(points={{155.583,5},{155.583,5},{154,5}},
                                                           color={0,0,127}));
  connect(order3_2.vf0, Exc2.vf0) annotation (Line(points={{150,11},{150,14},{161,
          14},{161,9.58333}},color={0,0,127}));
  connect(vs_2.y, Exc2.vs) annotation (Line(points={{171.6,24},{170,24},{170,
          2.5},{165.583,2.5}},
                    color={0,0,127}));
  connect(Exc2.v, order3_2.v) annotation (Line(points={{165.583,7.5},{172,7.5},
          {172,16},{128,16},{128,3},{131,3}},
                                         color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-120},{180,120}},
          preserveAspectRatio=false)),
    experiment(
      StopTime=20),
    Documentation(info="<html>
<p>This system is tests the sixth order machine with a type 3 AVR, from PSAT. Simulate the system for 20 seconds.</p>
<p>Variables of interest are:</p>
<ul>
<li><code>order2.w</code></li>
<li><code>order3_2.w</code></li>
<li><code>Syn2.w</code></li>
</ul>
<p>Note that the oscillations illustrate a clear example of non-coherent machines.</p>
<p>Compare these results with the ones from the other example systems within the <strong>ThreeArea</strong> subpackage.</p>
</html>"));
end SixthOrder_AVRIII;
