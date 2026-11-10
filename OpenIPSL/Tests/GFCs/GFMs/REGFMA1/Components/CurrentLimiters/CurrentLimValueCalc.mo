within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.Components.CurrentLimiters;
model CurrentLimValueCalc
  "Tests the calculation of the current limit value imposing Imax magnitude"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.Components.CurrentLimiters.Submodels.VRe virtualRe(
      R_a=1e-6, Imax=1.5)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-34})));
  Modelica.Blocks.Sources.Ramp Vtdrop(
    height=-0.9,
    duration=5,
    offset=1,
    startTime=1) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={8,-84})));
  Modelica.Blocks.Sources.Constant Emag(k=1.05)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-24,-84})));
  Modelica.Blocks.Sources.Constant Eang(k=15*Modelica.Constants.pi/180)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-8,-84})));
  Modelica.Blocks.Sources.Constant anglev(k=0.0*Modelica.Constants.pi/180)
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={24,-84})));
  Modelica.Blocks.Sources.RealExpression EangVal(y=Eang.y)
    annotation (Placement(transformation(extent={{-80,28},{-60,44}})));
  OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.Components.CurrentLimiters.Submodels.CurrentLimitValue
    currentLimitValue(
    R_a=virtualRe.R_a,
    X_d=virtualRe.X_d,
    Imax=virtualRe.Imax)
    annotation (Placement(transformation(extent={{-30,0},{30,60}})));
  Modelica.Blocks.Sources.RealExpression EmagVal(y=Emag.y)
    annotation (Placement(transformation(extent={{-80,44},{-60,64}})));
  Modelica.Blocks.Sources.RealExpression VtVal(y=Vtdrop.y) annotation (
      Placement(transformation(
        extent={{-10,-8},{10,8}},
        rotation=0,
        origin={-70,24})));
  Modelica.Blocks.Sources.RealExpression angleVval(y=anglev.y)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,6})));
  Modelica.Blocks.Interfaces.RealOutput ImaxRe
    "Maximum current real part" annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={72,18}),   iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,110})));
  Modelica.Blocks.Interfaces.RealOutput ImaxIm
    "Maximum current imaginary part" annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={72,6}),   iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-20,110})));
  Modelica.Blocks.Interfaces.RealOutput ImaxMag
    "Maximum current magnitude" annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={72,54}), iconTransformation(extent={{-6,-6},{6,6}}, origin={72,54})));
  Modelica.Blocks.Interfaces.RealOutput ImaxAng "Maximum current angle"
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=0,
        origin={72,42}),  iconTransformation(
        extent={{-6,-14},{6,14}},
        rotation=90,
        origin={92,42})));
equation
  connect(Vtdrop.y, virtualRe.V)
    annotation (Line(points={{8,-79.6},{8,-56}},
                                               color={0,0,127}));
  connect(Emag.y, virtualRe.Emag)
    annotation (Line(points={{-24,-79.6},{-24,-64},{-16,-64},{-16,-56}},
                                                 color={0,0,127}));
  connect(Eang.y, virtualRe.Eang) annotation (Line(points={{-8,-79.6},{-8,-56}},
                 color={0,0,127}));
  connect(anglev.y, virtualRe.anglev) annotation (Line(points={{24,-79.6},{24,-64},
          {16,-64},{16,-56}},
                    color={0,0,127}));
  connect(virtualRe.R_e, currentLimitValue.R_e)
    annotation (Line(points={{0,-12},{0,-3}}, color={0,0,127}));
  connect(EmagVal.y, currentLimitValue.Emag)
    annotation (Line(points={{-59,54},{-33,54}}, color={0,0,127}));
  connect(EangVal.y, currentLimitValue.Eang)
    annotation (Line(points={{-59,36},{-33,36}},
                                               color={0,0,127}));
  connect(VtVal.y, currentLimitValue.V)
    annotation (Line(points={{-59,24},{-33,24}},
                                               color={0,0,127}));
  connect(angleVval.y, currentLimitValue.anglev)
    annotation (Line(points={{-59,6},{-33,6}},
                                             color={0,0,127}));
  connect(currentLimitValue.ImaxRe, ImaxRe)
    annotation (Line(points={{33,18},{72,18}},   color={0,0,127}));
  connect(currentLimitValue.ImaxIm, ImaxIm)
    annotation (Line(points={{33,6},{72,6}},   color={0,0,127}));
  connect(currentLimitValue.ImaxMag, ImaxMag)
    annotation (Line(points={{33,54},{72,54}},
                                             color={0,0,127}));
  connect(currentLimitValue.ImaxAng, ImaxAng)
    annotation (Line(points={{33,42},{72,42}}, color={0,0,127}));
  annotation (preferredView="diagram",experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end CurrentLimValueCalc;
