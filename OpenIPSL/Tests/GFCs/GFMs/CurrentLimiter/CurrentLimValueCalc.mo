within OpenIPSL.Tests.GFCs.GFMs.CurrentLimiter;
model CurrentLimValueCalc
  "Tests the calculation of the current limit value imposing Imax magnitude"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters.VRe virtualRe(
      R_a=1e-6, Imax=1.5)
    annotation (Placement(transformation(extent={{-20,-80},{20,-40}})));
  Modelica.Blocks.Sources.Ramp Vtdrop(
    height=-0.9,
    duration=5,
    offset=1,
    startTime=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,-40})));
  Modelica.Blocks.Sources.Constant Emag(k=1.05)
    annotation (Placement(transformation(extent={{-62,-50},{-42,-30}})));
  Modelica.Blocks.Sources.Constant Eang(k=15*Modelica.Constants.pi/180)
    annotation (Placement(transformation(extent={{-60,-82},{-40,-62}})));
  Modelica.Blocks.Sources.Constant anglev(k=0.0*Modelica.Constants.pi/180)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,-72})));
  OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters.CurrentLimitValue
    currentLimitValue(
    R_a=virtualRe.R_a,
    X_d=virtualRe.X_d,
    Imax=virtualRe.Imax)
    annotation (Placement(transformation(extent={{-20,0},{20,40}})));
  Modelica.Blocks.Sources.RealExpression EmagVal(y=Emag.y)
    annotation (Placement(transformation(extent={{-60,22},{-40,42}})));
  Modelica.Blocks.Sources.RealExpression EangVal(y=Eang.y)
    annotation (Placement(transformation(extent={{-60,-2},{-40,18}})));
  Modelica.Blocks.Sources.RealExpression VtVal(y=Vtdrop.y) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,32})));
  Modelica.Blocks.Sources.RealExpression angleVval(y=anglev.y)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,8})));
  Modelica.Blocks.Interfaces.RealOutput ImaxRe
    "Maximum current real part" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,110})));
  Modelica.Blocks.Interfaces.RealOutput ImaxIm
    "Maximum current imaginary part" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-8,110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-20,110})));
  Modelica.Blocks.Interfaces.RealOutput ImaxMag
    "Maximum current magnitude" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,110})));
  Modelica.Blocks.Interfaces.RealOutput ImaxAng "Maximum current angle"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,110})));
equation
  connect(Vtdrop.y, virtualRe.V)
    annotation (Line(points={{39,-40},{34,-40},{34,-48},{24,-48}},
                                               color={0,0,127}));
  connect(Emag.y, virtualRe.Emag)
    annotation (Line(points={{-41,-40},{-34,-40},{-34,-48},{-24,-48}},
                                                 color={0,0,127}));
  connect(Eang.y, virtualRe.Eang) annotation (Line(points={{-39,-72},{-24,
          -72}},                     color={0,0,127}));
  connect(anglev.y, virtualRe.anglev) annotation (Line(points={{39,-72},{
          24,-72}},                   color={0,0,127}));
  connect(virtualRe.R_e, currentLimitValue.R_e)
    annotation (Line(points={{0,-38},{0,-4}}, color={0,0,127}));
  connect(EmagVal.y, currentLimitValue.Emag)
    annotation (Line(points={{-39,32},{-24,32}}, color={0,0,127}));
  connect(EangVal.y, currentLimitValue.Eang)
    annotation (Line(points={{-39,8},{-24,8}}, color={0,0,127}));
  connect(VtVal.y, currentLimitValue.V)
    annotation (Line(points={{39,32},{24,32}}, color={0,0,127}));
  connect(angleVval.y, currentLimitValue.anglev)
    annotation (Line(points={{39,8},{24,8}}, color={0,0,127}));
  connect(currentLimitValue.ImaxRe, ImaxRe)
    annotation (Line(points={{-16,42},{-16,76},{-40,76},{-40,110}},
                                                 color={0,0,127}));
  connect(currentLimitValue.ImaxIm, ImaxIm)
    annotation (Line(points={{-8,42},{-8,110}},color={0,0,127}));
  connect(currentLimitValue.ImaxMag, ImaxMag)
    annotation (Line(points={{8,42},{8,96},{20,96},{20,110}},
                                             color={0,0,127}));
  connect(currentLimitValue.ImaxAng, ImaxAng)
    annotation (Line(points={{16,42},{16,56},{40,56},{40,110}},
                                               color={0,0,127}));
  annotation (experiment(StopTime=10, __Dymola_Algorithm="Dassl"), Icon(
        coordinateSystem(preserveAspectRatio=false)));
end CurrentLimValueCalc;
