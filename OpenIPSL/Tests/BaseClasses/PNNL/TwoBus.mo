within OpenIPSL.Tests.BaseClasses.PNNL;
partial model TwoBus
  "PNNL's REGFM_A1 validation network: bus 401, a line, and bus 601 whose voltage and frequency are played back"
  extends Modelica.Icons.Example;
  parameter OpenIPSL.Types.PerUnit Vafter=1.0 "Voltage of bus 601 after the step";
  parameter OpenIPSL.Types.Frequency fafter=60 "Frequency of bus 601 after the step";
  parameter OpenIPSL.Types.Time tstep=2.999 "Start of the 1 ms ramp of the playback files";
  parameter OpenIPSL.Types.PerUnit Rf=0.001/2.304 "Fault resistance at bus 401, pu on 0.1 MVA (0.001 ohm at 0.48 kV)";
  parameter OpenIPSL.Types.Time tf1=1e6 "Fault applied (by default, never)";
  parameter OpenIPSL.Types.Time tf2=1e6 + 1 "Fault cleared";
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=0.1e6, fn=60)
    annotation (Placement(transformation(extent={{-140,60},{-100,80}})));
  OpenIPSL.Electrical.Buses.Bus B401(v_0=1.0, angle_0=0.015014355707126548) "The converter's bus: connect the model under test here"
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  OpenIPSL.Electrical.Branches.PwLine line(R=0.001248, X=0.02497, G=0, B=0)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  OpenIPSL.Electrical.Buses.Bus B601(v_0=1.0, angle_0=0)
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  OpenIPSL.Electrical.Events.PwFault fault(R=Rf, X=0, t1=tf1, t2=tf2) "Fault at bus 401"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-13,-30})));
  OpenIPSL.Electrical.Sources.VoltageSourceReImInput grid(P_0=-0.06e6, Q_0=0.0034480e6, v_0=1.0, angle_0=0)
    "Bus 601: the voltage phasor played back"
    annotation (Placement(transformation(extent={{80,-10},{60,10}})));
  Modelica.Blocks.Math.Product vRe "Real part of the voltage phasor"
    annotation (Placement(transformation(extent={{120,2},{100,22}})));
  Modelica.Blocks.Math.Product vIm "Imaginary part of the voltage phasor"
    annotation (Placement(transformation(extent={{120,-22},{100,-2}})));
  Modelica.Blocks.Sources.Ramp Vplb(offset=1.0, height=Vafter - 1.0, duration=0.001, startTime=tstep) "Voltage of bus 601"
    annotation (Placement(transformation(extent={{160,-10},{140,10}})));
  Modelica.Blocks.Math.Cos cosTheta
    annotation (Placement(transformation(extent={{160,20},{140,40}})));
  Modelica.Blocks.Math.Sin sinTheta
    annotation (Placement(transformation(extent={{160,-40},{140,-20}})));
  Modelica.Blocks.Continuous.Integrator theta(
    k=2*Modelica.Constants.pi,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=0) "Angle of bus 601, from its frequency deviation"
    annotation (Placement(transformation(extent={{200,-10},{180,10}})));
  Modelica.Blocks.Sources.Ramp dfPlb(offset=0, height=fafter - 60, duration=0.001, startTime=tstep) "Frequency deviation of bus 601 (Hz)"
    annotation (Placement(transformation(extent={{240,-10},{220,10}})));
equation
  connect(B401.p, line.p) annotation (Line(points={{-20,0},{1,0}}, color={0,0,255}));
  connect(line.n, B601.p) annotation (Line(points={{19,0},{40,0}}, color={0,0,255}));
  connect(grid.p, B601.p) annotation (Line(points={{59,0},{40,0}}, color={0,0,255}));
  connect(fault.p, B401.p) annotation (Line(points={{-13,-18.3333},{-13,0},{-20,0}}, color={0,0,255}));
  connect(vRe.y, grid.vRe) annotation (Line(points={{99,12},{90,12},{90,4},{82,4}}, color={0,0,127}));
  connect(vIm.y, grid.vIm) annotation (Line(points={{99,-12},{90,-12},{90,-4},{82,-4}}, color={0,0,127}));
  connect(Vplb.y, vRe.u2) annotation (Line(points={{139,0},{130,0},{130,6},{122,6}}, color={0,0,127}));
  connect(Vplb.y, vIm.u1) annotation (Line(points={{139,0},{130,0},{130,-6},{122,-6}}, color={0,0,127}));
  connect(cosTheta.y, vRe.u1) annotation (Line(points={{139,30},{132,30},{132,18},{122,18}}, color={0,0,127}));
  connect(sinTheta.y, vIm.u2) annotation (Line(points={{139,-30},{132,-30},{132,-18},{122,-18}}, color={0,0,127}));
  connect(theta.y, cosTheta.u) annotation (Line(points={{179,0},{170,0},{170,30},{162,30}}, color={0,0,127}));
  connect(theta.y, sinTheta.u) annotation (Line(points={{179,0},{170,0},{170,-30},{162,-30}}, color={0,0,127}));
  connect(dfPlb.y, theta.u) annotation (Line(points={{219,0},{202,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-140,-80},{240,80}})), Documentation(info="<html>
<p>
The network of Pacific Northwest National Laboratory's REGFM_A1 validation cases (release V1 of
<a href=\"https://github.com/pnnl/PSCAD-and-PSSE-Version-of-WECC-Grid-Forming-Inverter-Models\">PSCAD and PSS/E versions of the WECC grid-forming inverter models</a>):
two buses at 0.48 kV on a 0.1 MVA base, 60 Hz. The model under test connects to bus <code>B401</code>.
</p>
<p>
Bus <code>B601</code> plays the part of PSS/E's playback model PLBVF1: <code>Vafter</code> and <code>fafter</code> are its voltage and frequency after the 1 ms
ramp that starts at <code>tstep</code>. A fault of resistance <code>Rf</code> can be applied at bus <code>B401</code> from <code>tf1</code> to <code>tf2</code>.
</p>
</html>"));
end TwoBus;
