within OpenIPSL.Tests.GFCs.GFMs.REGFMA1withPQLimEncapsulate;
model FlagsQV1V1
  "REGFMA1wPQLimiters on the SMIB with QVFlag = true, VFlag = true: steady start, Pref and Vref steps, a short fault"
  extends Modelica.Icons.Example;
  extends OpenIPSL.Tests.BaseClasses.SMIB(SysData(fn=60), pwFault(
      R=1e-4,
      X=1e-3,
      t1=8.0,
      t2=8.05));
  parameter Boolean QVFlag=true "QVFlag of the converter";
  parameter Boolean VFlag=true "VFlag of the converter";
  Electrical.GFCs.GFMs.REGFMA1.Variants.REGFMA1wPQLimiters GFC(QVFlag_val_k=QVFlag,
      VFlag_val_k=VFlag)
    annotation (Placement(transformation(extent={{-100,-30},{-40,30}})));
  Modelica.Blocks.Sources.Step Pstep(height=0.05, startTime=2)
    "Change of the active power reference"
    annotation (Placement(transformation(extent={{-200,-40},{-180,-20}})));
  Modelica.Blocks.Sources.Step Vstep(height=0.01, startTime=5)
    "Change of the voltage reference"
    annotation (Placement(transformation(extent={{-200,20},{-180,40}})));
  Modelica.Blocks.Math.Add Pref "Pref = Pref0 of the initial operating point plus the step"
    annotation (Placement(transformation(extent={{-150,-30},{-130,-10}})));
  Modelica.Blocks.Math.Add Vref "Vref = Vref0 of the initial operating point plus the step"
    annotation (Placement(transformation(extent={{-150,10},{-130,30}})));
equation
  connect(GFC.p, GEN1.p)
    annotation (Line(points={{-37,0},{-30,0}}, color={0,0,255}));
  connect(Pstep.y, Pref.u1) annotation (Line(points={{-179,-30},{-160,-30},{-160,
          -14},{-152,-14}}, color={0,0,127}));
  connect(GFC.Pref0, Pref.u2) annotation (Line(points={{-58,-31.5},{-58,-50},{-156,
          -50},{-156,-26},{-152,-26}}, color={0,0,127}));
  connect(Pref.y, GFC.Pref)
    annotation (Line(points={{-129,-20},{-116,-20},{-116,-18},{-103,-18}}, color={0,0,127}));
  connect(Vstep.y, Vref.u1) annotation (Line(points={{-179,30},{-160,30},{-160,26},
          {-152,26}}, color={0,0,127}));
  connect(GFC.Vref0, Vref.u2) annotation (Line(points={{-82,-31.5},{-82,-60},{-166,
          -60},{-166,14},{-152,14}}, color={0,0,127}));
  connect(Vref.y, GFC.Vref)
    annotation (Line(points={{-129,20},{-116,20},{-116,18},{-103,18}}, color={0,0,127}));
  annotation (experiment(
      StopTime=12,
      __Dymola_NumberOfIntervals=6000,
      __Dymola_Algorithm="Dassl"), Diagram(coordinateSystem(extent={{-220,-100},
            {100,100}})),
    Documentation(info="<html>
<p>
Tests <code>REGFMA1wPQLimiters</code> on the single-machine infinite-bus system
<code>OpenIPSL.Tests.BaseClasses.SMIB</code>, the network of the library's PSS/E tests, with one setting of the flags:
<code>QVFlag = true</code>, <code>VFlag = true</code> here, the other three pairs in
<code>FlagsQV1V0</code>, <code>FlagsQV0V1</code> and <code>FlagsQV0V0</code>, all on the same power flow.
</p>
<p>
The references are the outputs <code>GFC.Pref0</code> and <code>GFC.Vref0</code> of the initial operating point plus a step:
the model starts in steady state, the active power reference rises by 0.05 pu at 2 s, the voltage reference by 0.01 pu at 5 s,
and a fault is applied at bus FAULT from 8 to 8.05 s.
</p>
<p>
<code>QVFlag</code> selects which reference a plant controller changes: <code>Vref</code> (<code>QVFlag = true</code>, <code>Qref = 0</code>)
or <code>Qref</code> (<code>QVFlag = false</code>, <code>Qref</code> initialized to the initial reactive power and held).
Without a plant controller the two settings differ only by a constant that <code>Vref0</code> absorbs,
so the tests with the same <code>VFlag</code> give the same trajectories.
</p>
<p>
Simulate and plot <code>GFC.P_meas</code>, <code>GFC.Q_meas</code>, <code>GFC.V</code> and <code>GFC.omega_dev</code>.
</p>
</html>"));
end FlagsQV1V1;
