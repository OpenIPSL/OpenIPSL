within OpenIPSL.Tests.Controls.PSAT.TG;
model TGTypeVI_test "Simple system to test functionality of TG type VI model"
  extends BaseClasses.TGTestBase;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Controls.PSAT.TG.TGTypeVI tGTypeVI(
    Ka=3.33333,
    Ta=0.07,
    vmin=-0.1,
    vmax=0.1,
    gmax=0.97518,
    gmin=0.01,
    Rp=0.05,
    Kp=1.163,
    Ki=0.105,
    Kd=0,
    Td=0.01,
    beta=0.1,
    Tw=2.67,
    dref=0,
    po=0.16074) annotation (Placement(transformation(extent={{-68,-24},{-40,4}})));
  Modelica.Blocks.Sources.Sine sine2(
    f=0.2,
    startTime=10,
    amplitude=-0.001,
    offset=0) annotation (Placement(transformation(origin={-26,-60}, extent={{6,-6},{-6,6}})));
  Modelica.Blocks.Math.Add Perturbation(k2=+1) annotation (Placement(transformation(
        origin={-60,-50},
        extent={{9.99996,-9.99996},{-10,10}})));
  Modelica.Blocks.Sources.Sine sine1(
    f=0.2,
    startTime=5,
    amplitude=0.001,
    offset=1) annotation (Placement(transformation(origin={-26,-40}, extent={{6.00002,-6.00001},{-6,6.00001}})));
equation

  connect(sine1.y, Perturbation.u1) annotation (Line(
      points={{-32.6,-40},{-39.6999,-40},{-39.6999,-44},{-48,-44}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(tGTypeVI.Pm, gen.pm) annotation (Line(points={{-38.6,-10},{-24,-10}}, color={0,0,127}));
  connect(Perturbation.u2,sine2. y) annotation (Line(points={{-48,-56},{-40,-56},{-40,-60},{-32.6,-60}}, color={0,0,127}));
  connect(Perturbation.y, tGTypeVI.wref) annotation (Line(points={{-71,-50},{-88,-50},{-88,1.2},{-70.8,1.2}}, color={0,0,127}));
  connect(gen.pm0, tGTypeVI.pref) annotation (Line(points={{-16,-22},{-16,-28},{-80,-28},{-80,-21.2},{-70.8,-21.2}}, color={0,0,127}));
  connect(gen.P, tGTypeVI.pe) annotation (Line(points={{22,-6},{32,-6},{32,-30},{-84,-30},{-84,-14.2},{-70.8,-14.2}}, color={0,0,127}));
  connect(gen.w, tGTypeVI.we) annotation (Line(points={{22,18},{30,18},{30,40},{-80,40},{-80,-5.8},{-70.8,-5.8}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics={ Text(
          extent={{-14,-46},{60,-58}},
          lineColor={0,0,255},
          textString="Wref perturbation with sine signal 5-10s")}),
experiment(StopTime=10));
end TGTypeVI_test;
