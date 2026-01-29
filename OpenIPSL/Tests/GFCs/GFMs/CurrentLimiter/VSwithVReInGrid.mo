within OpenIPSL.Tests.GFCs.GFMs.CurrentLimiter;
model VSwithVReInGrid
  "Test the VS component with input for virtual resistance withing a grid OpenIPSL"
  import Modelica;
  extends Modelica.Icons.Example;
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=1e-12,
      X=1e-6,
      t2=2.05));
  Electrical.GFCs.GFMs.VoltageSources.VSIOwVReInput VS
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  Electrical.GFCs.GFMs.REGFMA1.CurrentLimiters.VRe virtualRe(Imax=1.8)
    annotation (Placement(transformation(extent={{-110,-60},{-90,-40}})));
  Modelica.Blocks.Sources.Ramp DEm(
    height=-0.3,
    duration=1,
    offset=1.01439,
    startTime=4)
    annotation (Placement(transformation(extent={{-170,2},{-150,22}})));
  Modelica.Blocks.Sources.Ramp DEang(
    height=-Modelica.Constants.pi/8,
    duration=3,
    offset=0.149386,
    startTime=6)
    annotation (Placement(transformation(extent={{-170,-28},{-150,-8}})));
  Modelica.Blocks.Sources.RealExpression EmagVal(y=VS.Emag) annotation (
      Placement(transformation(extent={{-144,-54},{-124,-34}})));
  Modelica.Blocks.Sources.RealExpression EangVal(y=VS.Edelta) annotation
    (Placement(transformation(extent={{-144,-46},{-124,-66}})));
  Modelica.Blocks.Sources.RealExpression Vval(y=VS.V) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-70,-44})));
  Modelica.Blocks.Sources.RealExpression angleVval(y=VS.anglev)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,-56})));
  OpenIPSL.Electrical.Sensors.PwCurrent pwCurrent
    annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
equation
  connect(DEm.y, VS.uEmag) annotation (Line(points={{-149,12},{-124,12}},
                                   color={0,0,127}));
  connect(DEang.y, VS.uEang) annotation (Line(points={{-149,-18},{-140,-18},{
          -140,-12},{-124,-12}},       color={0,0,127}));
  connect(virtualRe.R_e, VS.R_e)
    annotation (Line(points={{-100,-39},{-100,-24}}, color={0,0,127}));
  connect(EmagVal.y, virtualRe.Emag)
    annotation (Line(points={{-123,-44},{-112,-44}}, color={0,0,127}));
  connect(EangVal.y, virtualRe.Eang) annotation (Line(points={{-123,-56},{-112,
          -56}},                  color={0,0,127}));
  connect(Vval.y, virtualRe.V)
    annotation (Line(points={{-81,-44},{-88,-44}}, color={0,0,127}));
  connect(angleVval.y, virtualRe.anglev) annotation (Line(points={{-81,-56},{
          -88,-56}},                           color={0,0,127}));
  connect(GEN1.p, pwCurrent.n)
    annotation (Line(points={{-30,0},{-36,0}}, color={0,0,255}));
  connect(VS.p, pwCurrent.p)
    annotation (Line(points={{-78,0},{-56,0}}, color={0,0,255}));
  annotation (experiment(
      StopTime=10,
      __Dymola_fixedstepsize=0.01,
      __Dymola_Algorithm="Dassl"), Diagram(coordinateSystem(extent={{-180,-100},
            {100,100}}, grid={2,2})));
end VSwithVReInGrid;
