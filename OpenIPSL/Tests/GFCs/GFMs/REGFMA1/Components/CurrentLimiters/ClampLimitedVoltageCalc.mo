within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.Components.CurrentLimiters;
model ClampLimitedVoltageCalc "Tests the internal voltage of the clamp, fed by CurrentLimitValue, with a falling terminal voltage"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.Components.CurrentLimiters.Submodels.CurrentLimitValue clampedCurrent(
    R_a=1e-3,
    X_d=0.2,
    Imax=1.5) "The current of magnitude Imax at the angle of the unlimited current"
    annotation (Placement(transformation(extent={{-50,-10},{-10,30}})));
  Modelica.Blocks.Sources.Constant noVirtualResistance(k=0) "The clamp has no virtual resistance"
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},
        rotation=90,
        origin={-30,-30})));
  OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.Components.CurrentLimiters.Submodels.ClampLimitedVoltage limitedVoltage(
    R_a=1e-3,
    X_d=0.2,
    Imax=1.5)
    annotation (Placement(transformation(extent={{20,-10},{60,30}})));
  Modelica.Blocks.Sources.RealExpression sigEmag(y=Emag.y) "Droop command, magnitude"
    annotation (Placement(transformation(extent={{-10,-3},{10,3}},
        rotation=90,
        origin={28,-33})));
  Modelica.Blocks.Sources.RealExpression sigEang(y=Eang.y) "Droop command, angle"
    annotation (Placement(transformation(extent={{-10,-3},{10,3}},
        rotation=90,
        origin={36,-33})));
  Modelica.Blocks.Sources.RealExpression sigV(y=Vtdrop.y) "Terminal voltage, magnitude"
    annotation (Placement(transformation(extent={{-10,-3},{10,3}},
        rotation=90,
        origin={44,-33})));
  Modelica.Blocks.Sources.RealExpression sigAnglev(y=anglev.y) "Terminal voltage, angle"
    annotation (Placement(transformation(extent={{-10,-3},{10,3}},
        rotation=90,
        origin={52,-33})));
  Modelica.Blocks.Sources.Ramp Vtdrop(
    height=-0.9,
    duration=5,
    offset=1,
    startTime=1) "Terminal voltage magnitude, from 1 to 0.1 pu"
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-70,-30})));
  Modelica.Blocks.Sources.Constant Emag(k=1.05) "Droop command, magnitude"
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Sources.Constant Eang(k=15*Modelica.Constants.pi/180) "Droop command, angle"
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Sources.Constant anglev(k=0) "Terminal voltage angle"
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-70,-70})));
  Modelica.Blocks.Interfaces.RealOutput ElimMag "Magnitude of the internal voltage applied"
    annotation (Placement(transformation(extent={{70,30},{90,50}})));
  Modelica.Blocks.Interfaces.RealOutput ElimAng "Angle of the internal voltage applied"
    annotation (Placement(transformation(extent={{70,-50},{90,-30}})));
equation
  connect(Emag.y, clampedCurrent.Emag)
    annotation (Line(points={{-59,70},{-54,70},{-54,26},{-52,26}}, color={0,0,127}));
  connect(Eang.y, clampedCurrent.Eang)
    annotation (Line(points={{-59,30},{-56,30},{-56,14},{-52,14}}, color={0,0,127}));
  connect(Vtdrop.y, clampedCurrent.V)
    annotation (Line(points={{-59,-30},{-56,-30},{-56,6},{-52,6}}, color={0,0,127}));
  connect(anglev.y, clampedCurrent.anglev)
    annotation (Line(points={{-59,-70},{-54,-70},{-54,-6},{-52,-6}}, color={0,0,127}));
  connect(noVirtualResistance.y, clampedCurrent.R_e)
    annotation (Line(points={{-30,-21.2},{-30,-12}}, color={0,0,127}));
  connect(clampedCurrent.ImaxRe, limitedVoltage.ImaxRe)
    annotation (Line(points={{-8,2},{0,2},{0,18},{18,18}}, color={0,0,127}));
  connect(clampedCurrent.ImaxIm, limitedVoltage.ImaxIm)
    annotation (Line(points={{-8,-6},{8,-6},{8,2},{18,2}}, color={0,0,127}));
  connect(sigEmag.y, limitedVoltage.Emag)
    annotation (Line(points={{28,-22},{28,-12}}, color={0,0,127}));
  connect(sigEang.y, limitedVoltage.Eang)
    annotation (Line(points={{36,-22},{36,-12}}, color={0,0,127}));
  connect(sigV.y, limitedVoltage.V)
    annotation (Line(points={{44,-22},{44,-12}}, color={0,0,127}));
  connect(sigAnglev.y, limitedVoltage.anglev)
    annotation (Line(points={{52,-22},{52,-12}}, color={0,0,127}));
  connect(limitedVoltage.ElimMag, ElimMag)
    annotation (Line(points={{62,18},{66,18},{66,40},{80,40}}, color={0,0,127}));
  connect(limitedVoltage.ElimAng, ElimAng)
    annotation (Line(points={{62,2},{66,2},{66,-40},{80,-40}}, color={0,0,127}));
  annotation (preferredView="diagram",experiment(StopTime=10, __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>
Tests <code>REGFMA1.Components.CurrentLimiters.Submodels.ClampLimitedVoltage</code> fed by <code>CurrentLimitValue</code>, with the inputs of <code>ClampCalc</code>.
Its outputs are those of <code>ClampCalc</code>.
</p>
<p>
Simulate and plot <code>ElimMag</code> and <code>ElimAng</code>, and compare with <code>ClampCalc</code>.
</p>
</html>"));
end ClampLimitedVoltageCalc;
