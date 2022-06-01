within OpenIPSL.Examples.Tutorial.Example_1;
model Example_1 "Fully assembled single-machine-infinite-bus (SMIB) example system"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Buses.Bus B1(angle_0=0.494677176989154, displayPF=
        false)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  OpenIPSL.Electrical.Buses.Bus B2(
    v_0=0.944299492912195,
    angle_0=0.351222533717268,
    displayPF=false)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  OpenIPSL.Electrical.Buses.Bus B3(v_0=0.900810000000000, displayPF=false)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Generator.Generator G1(
    v_0=1,
    displayPF=false,
    P_0=1997999999.99364,
    Q_0=967924969.906578,
    angle_0=0.494677176989154)
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(
    Sn=2220000000,
    V_b=400000,
    Vn=400000,
    rT=0,
    xT=0.15) annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  OpenIPSL.Electrical.Branches.PwLine line_1(
    R=0,
    G=0,
    B=0,
    S_b=100000000,
    X=0.5*100/2220,
    displayPF=false)
    annotation (Placement(transformation(extent={{20,10},{40,30}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infinite_bus(
    v_0=0.90081,
    angle_0=0,
    P_0=-1998000000,
    Q_0=87066000,
    displayPF=false) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={100,0})));
  OpenIPSL.Electrical.Events.PwFault fault(
    R=0,
    t1=0.5,
    t2=0.57,
    X=0.01*100/2220)
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  OpenIPSL.Electrical.Branches.PwLine line_2(
    R=0,
    G=0,
    B=0,
    S_b=100000000,
    X=0.93*100/2220)
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60)
    annotation (Placement(transformation(extent={{60,-100},{120,-60}})));
equation
  connect(G1.pwPin, B1.p)
    annotation (Line(points={{-89,0},{-89,0},{-70,0}}, color={0,0,255}));
  connect(B1.p, transformer.p)
    annotation (Line(points={{-70,0},{-70,0},{-51,0}}, color={0,0,255}));
  connect(transformer.n, B2.p)
    annotation (Line(points={{-29,0},{-10,0}}, color={0,0,255}));
  connect(line_1.n, B3.p)
    annotation (Line(points={{39,20},{60,20},{60,0},{70,0}}, color={0,0,255}));
  connect(B3.p, infinite_bus.p) annotation (Line(points={{70,0},{82,0},{82,
          1.33227e-15},{90,1.33227e-15}}, color={0,0,255}));
  connect(line_2.n, B3.p) annotation (Line(points={{39,-20},{60,-20},{60,0},{70,
          0}}, color={0,0,255}));
  connect(fault.p, B2.p) annotation (Line(points={{18.3333,-50},{10,-50},{10,0},
          {-10,0}}, color={0,0,255}));
  connect(line_2.p, B2.p) annotation (Line(points={{21,-20},{10,-20},{10,0},{-10,
          0}}, color={0,0,255}));
  connect(line_1.p, B2.p) annotation (Line(points={{21,20},{10,20},{10,0},{-10,
          0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-120,-100},{120,100}},
        preserveAspectRatio=false), graphics={Text(
          origin={40,0},
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{-160,-80},{0,-100}},
          textString=
            "*P. Kundur, \"Power System Stability and Control\", Example 13.2",
          fontSize=12),Text(
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{-100,100},{100,80}},
          textString="Example 1: Single-machine infinite bus model*",
          fontSize=15,
          textStyle={TextStyle.Bold})}),
    experiment(
      StartTime=0,
      StopTime=10,
      Tolerance=1e-6,
      Interval=1e-4),
    Documentation(info="<html>
<p>This example system represents the resulting model after one has followed the steps to assemble the generation unit and the network. The system must be simulated during 10 seconds.</p>
<p>Variables of interest are:</p>
<ul>
<li><code>B1.v</code></li>
<li><code>B2.v</code></li>
<li><code>G1.machine.delta</code></li>
</ul>
<p>Note that these curves have oscillations that grow with time, indicating a clear case of instability. This issue is addressed on Example 2.</p>
<p>Also note that validation against PSAT can be performed by loading the file <code>Tutorial/Additional_Material/PSAT_dyn.csv</code>. The correspondent curves are:</p>
<ul>
<li><code>PSAT_dyn.v</code> corresponds to <code>G1.machine.v</code></li>
<li><code>PSAT_dyn.vf</code> corresponds to <code>G1.avr.vf</code></li>
<li><code>PSAT_dyn.w</code> corresponds to <code>G1.machine.w</code></li>
</ul>
</html>"));
end Example_1;
