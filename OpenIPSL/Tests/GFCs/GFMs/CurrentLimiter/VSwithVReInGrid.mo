within OpenIPSL.Tests.GFCs.GFMs.CurrentLimiter;
model VSwithVReInGrid
  "Test the VS component with input for virtual resistance withing a grid OpenIPSL"
  import Modelica;
  extends Modelica.Icons.Example;
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=1e-12,
      X=1e-6,
      t2=2.05));
  Electrical.GFCs.GFMs.VoltageSources.VSIOwVReInput VS(
    P_0=40e6,
    Q_0=5.416582e6,
    v_0=1.0,
    angle_0=0.070620799598684,
    Imax=virtualRe.Imax) "The source at bus GEN1, on its power flow"
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  Electrical.GFCs.GFMs.REGFMA1.Components.CurrentLimiters.Submodels.VRe virtualRe(
    R_a=VS.R_a,
    X_d=VS.X_d,
    Imax=1.8)
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Sources.Ramp DEm(
    height=-0.3,
    duration=1,
    offset=VS.E0,
    startTime=4) "The commanded internal voltage magnitude: E0 of the power flow, then 0.3 pu lower"
    annotation (Placement(transformation(extent={{-170,40},{-150,60}})));
  Modelica.Blocks.Sources.Ramp DEang(
    height=-Modelica.Constants.pi/8,
    duration=3,
    offset=VS.delta0,
    startTime=6) "The commanded internal voltage angle: delta0 of the power flow, then pi/8 lower"
    annotation (Placement(transformation(extent={{-170,0},{-150,20}})));
  Modelica.Blocks.Sources.RealExpression EmagVal(y=VS.Emag) annotation (
      Placement(transformation(extent={{-180,-40},{-160,-20}})));
  Modelica.Blocks.Sources.RealExpression EangVal(y=VS.Edelta) annotation
    (Placement(transformation(extent={{-180,-40},{-160,-60}})));
  Modelica.Blocks.Sources.RealExpression Vval(y=VS.V) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={-170,-70})));
  Modelica.Blocks.Sources.RealExpression angleVval(y=VS.anglev)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-170,-90})));
  OpenIPSL.Electrical.Sensors.PwCurrent pwCurrent
    annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
equation
  connect(DEm.y, VS.uEmag) annotation (Line(points={{-149,50},{-134,50},{-134,
          12},{-124,12}},          color={0,0,127}));
  connect(DEang.y, VS.uEang) annotation (Line(points={{-149,10},{-134,10},{-134,
          -12},{-124,-12}},      color={0,0,127}));
  connect(virtualRe.R_e, VS.R_e)
    annotation (Line(points={{-98,-60},{-80,-60},{-80,-34},{-100,-34},{-100,-24}},
                                                     color={0,0,127}));
  connect(EmagVal.y, virtualRe.Emag)
    annotation (Line(points={{-159,-30},{-150,-30},{-150,-44},{-142,-44}},
                                                     color={0,0,127}));
  connect(EangVal.y, virtualRe.Eang) annotation (Line(points={{-159,-50},{-150,
          -50},{-150,-52},{-142,-52}},
                 color={0,0,127}));
  connect(Vval.y, virtualRe.V)
    annotation (Line(points={{-159,-70},{-150,-70},{-150,-68},{-142,-68}},
                                                   color={0,0,127}));
  connect(angleVval.y, virtualRe.anglev) annotation (Line(points={{-159,-90},{
          -150,-90},{-150,-76},{-142,-76}},
                     color={0,0,127}));
  connect(GEN1.p, pwCurrent.n)
    annotation (Line(points={{-30,0},{-36,0}}, color={0,0,255}));
  connect(VS.p, pwCurrent.p)
    annotation (Line(points={{-78,0},{-56,0}}, color={0,0,255}));
  annotation (preferredView="diagram",experiment(
      StopTime=10,
      __Dymola_fixedstepsize=0.01,
      __Dymola_Algorithm="Dassl"), Diagram(coordinateSystem(extent={{-180,-100},
            {100,100}}, grid={2,2})),
    Documentation(info="<html>
<p>
Tests the voltage source with a virtual-resistance input, <code>VoltageSources.VSIOwVReInput</code>, with the virtual resistance computed by
<code>REGFMA1.Components.CurrentLimiters.Submodels.VRe</code> (<code>Imax = 1.8</code> pu), on <code>OpenIPSL.Tests.BaseClasses.SMIB</code>.
The commanded internal voltage starts at the source's power flow (<code>VS.E0</code>, <code>VS.delta0</code>), so the test starts in steady state.
</p>
<p>
A bolted fault at bus FAULT from 2 to 2.05 s drives the current above <code>Imax</code>: <code>virtualRe.R_e</code> rises and holds the current,
<code>pwCurrent</code>, at 1.8 pu, and falls back to zero when the fault is cleared. From 4 s the commanded magnitude falls by 0.3 pu, and from 6 s
its angle by pi/8.
</p>
<p>
Simulate and plot <code>virtualRe.R_e</code>, <code>VS.P</code>, <code>VS.Q</code>, <code>VS.V</code> and the current through <code>pwCurrent</code>.
</p>
</html>"));
end VSwithVReInGrid;
