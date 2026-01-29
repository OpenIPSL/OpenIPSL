within OpenIPSL.Tests.GFCs.GFMs.CurrentLimiter;
model VReVdrop "Tests the Virtual Resistor implementation"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters.VRe virtualRe(R_a=1e-6,
      Imax=1.5)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.Ramp Vtdrop(
    height=-0.9,
    duration=5,
    offset=1,
    startTime=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,12})));
  Modelica.Blocks.Sources.Constant Emag(k=1.05)
    annotation (Placement(transformation(extent={{-60,2},{-40,22}})));
  Modelica.Blocks.Sources.Constant Eang(k=15*Modelica.Constants.pi/180)
    annotation (Placement(transformation(extent={{-60,-30},{-40,-10}})));
  Modelica.Blocks.Sources.Constant anglev(k=0.0*Modelica.Constants.pi/180)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,-20})));
  Modelica.Blocks.Interfaces.RealOutput R_e
    "Output Value of the Virtual Resistance"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(Vtdrop.y, virtualRe.V)
    annotation (Line(points={{39,12},{24,12}}, color={0,0,127}));
  connect(Emag.y, virtualRe.Emag)
    annotation (Line(points={{-39,12},{-24,12}}, color={0,0,127}));
  connect(Eang.y, virtualRe.Eang) annotation (Line(points={{-39,-20},{-34,
          -20},{-34,-12},{-24,-12}}, color={0,0,127}));
  connect(anglev.y, virtualRe.anglev) annotation (Line(points={{39,-20},{
          34,-20},{34,-12},{24,-12}}, color={0,0,127}));
  connect(virtualRe.R_e, R_e) annotation (Line(points={{0,22},{0,30},{96,
          30},{96,0},{110,0}}, color={0,0,127}));
  annotation (experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end VReVdrop;
