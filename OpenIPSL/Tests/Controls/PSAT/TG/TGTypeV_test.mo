within OpenIPSL.Tests.Controls.PSAT.TG;
model TGTypeV_test "Simple system to test functionality of TG type V model"
  extends BaseClasses.TGTestBase;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Controls.PSAT.TG.TGTypeV tGTypeV(
    Ki=0.5,
    Kp=3.0,
    Tg=0.2,
    Tp=0.05,
    sigma=0.04,
    vmin=-0.1,
    vmax=0.1,
    gmax=1,
    gmin=0,
    Tw=1,
    Pref=0.160552) annotation (Placement(transformation(extent={{-68,-24},{-40,4}})));
  Modelica.Blocks.Sources.Sine sine2(
    amplitude=0.001,
    f=0.2,
    offset=1,
    startTime=5) annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={-26,-60})));
  Modelica.Blocks.Sources.Sine sine1(
    amplitude=-0.001,
    f=0.2,
    startTime=10,
    offset=0) annotation (Placement(transformation(extent={{6,-6},{-6,6}}, origin={-26,-40})));
  Modelica.Blocks.Math.Add perturbation annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-60,-50})));
equation

  connect(sine2.y, perturbation.u1) annotation (Line(
      points={{-32.6,-60},{-40,-60},{-40,-44},{-48,-44}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(sine1.y, perturbation.u2) annotation (Line(
      points={{-32.6,-40},{-40,-40},{-40,-56},{-48,-56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(perturbation.y, tGTypeV.wref) annotation (Line(
      points={{-71,-50},{-80,-50},{-80,-18.4},{-70.8,-18.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tGTypeV.Pm, gen.pm) annotation (Line(points={{-38.6,-10},{-24,-10}}, color={0,0,127}));
  connect(tGTypeV.pref, gen.pm0) annotation (Line(points={{-70.8,-1.6},{-90,-1.6},{-90,-30},{-16,-30},{-16,-22}}, color={0,0,127}));
  connect(tGTypeV.w, gen.w) annotation (Line(points={{-70.8,-10},{-80,-10},{-80,40},{30,40},{30,18},{22,18}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Text(
          extent={{-14,-46},{60,-58}},
          lineColor={0,0,255},
          textString="Wref perturbation with sine signal 5-10s")}));
end TGTypeV_test;
