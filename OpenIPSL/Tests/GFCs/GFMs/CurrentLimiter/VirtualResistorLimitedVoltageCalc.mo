within OpenIPSL.Tests.GFCs.GFMs.CurrentLimiter;
model VirtualResistorLimitedVoltageCalc "Tests the internal voltage with the virtual resistor, fed by VRe, with a falling terminal voltage"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.Components.CurrentLimiters.Submodels.VRe virtualRe(
    R_a=1e-3,
    X_d=0.2,
    Imax=1.5) "The virtual resistance that limits the current to Imax"
    annotation (Placement(transformation(extent={{-50,-10},{-10,30}})));
  OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.Components.CurrentLimiters.Submodels.VirtualResistorLimitedVoltage limitedVoltage(
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
  connect(Emag.y, virtualRe.Emag)
    annotation (Line(points={{-59,70},{-54,70},{-54,26},{-52,26}}, color={0,0,127}));
  connect(Eang.y, virtualRe.Eang)
    annotation (Line(points={{-59,30},{-56,30},{-56,18},{-52,18}}, color={0,0,127}));
  connect(Vtdrop.y, virtualRe.V)
    annotation (Line(points={{-59,-30},{-56,-30},{-56,2},{-52,2}}, color={0,0,127}));
  connect(anglev.y, virtualRe.anglev)
    annotation (Line(points={{-59,-70},{-54,-70},{-54,-6},{-52,-6}}, color={0,0,127}));
  connect(virtualRe.R_e, limitedVoltage.R_e)
    annotation (Line(points={{-8,10},{18,10}}, color={0,0,127}));
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
Tests <code>REGFMA1.Components.CurrentLimiters.Submodels.VirtualResistorLimitedVoltage</code> fed by <code>VRe</code>, with the inputs of <code>VirtualResistorCalc</code>.
Its outputs are those of <code>VirtualResistorCalc</code>.
</p>
<p>
Simulate and plot <code>virtualRe.R_e</code>, <code>ElimMag</code> and <code>ElimAng</code>, and compare with <code>VirtualResistorCalc</code>.
</p>
</html>"));
end VirtualResistorLimitedVoltageCalc;
