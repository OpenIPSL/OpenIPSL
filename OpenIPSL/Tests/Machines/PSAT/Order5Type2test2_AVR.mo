within OpenIPSL.Tests.Machines.PSAT;
model Order5Type2test2_AVR "Order 5 machine type 2 with an AVR type III from PSAT, to test that the machine starts in steady state with its field voltage coming from the regulator (initial conditions of the PSAT machines, issue #144, pull request #423)"
  extends OpenIPSL.Tests.BaseClasses.MachineTestBase;
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII AVRtypeIII1(
    vfmax=5,
    vfmin=-5,
    K0=20,
    T2=3,
    T1=1,
    Te=0.4,
    Tr=0.04) annotation (Placement(transformation(
        origin={-67,5},
        extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Machines.PSAT.Order5_Type2 order5Type2_Inputs_Outputs(
    D=2,
    M=13,
    P_0=16035269.8692006,
    Q_0=11859436.505981,
    Sn=370000000,
    T1d0=8,
    T2d0=0.03,
    T2q0=0.05,
    Taa=0.002,
    V_b=400000,
    Vn=200000,
    angle_0=0, delta(fixed = true),
    ra=0.001,
    v_0=1, w(fixed = true),
    x1d=0.3,
    x2d=0.25,
    x2q=0.25,
    xd=1.8,
    xq=1.7) annotation (Placement(transformation(extent={{-37,-10},{-17,10}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-97,-4},{-87,6}})));
equation
  connect(AVRtypeIII1.vf, order5Type2_Inputs_Outputs.vf) annotation (Line(
      points={{-56.1667,5},{-47,5},{-47,5},{-39,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, AVRtypeIII1.vs) annotation (Line(points={{-86.5,1},{-81,1},{
          -81,0},{-76.1667,0}}, color={0,0,127}));
  connect(AVRtypeIII1.v, order5Type2_Inputs_Outputs.v) annotation (Line(points={{
          -76.1667,10},{-87,10},{-87,20},{-10,20},{-10,3},{-16,3}},
                                                           color={0,0,127}));
  connect(order5Type2_Inputs_Outputs.pm0, order5Type2_Inputs_Outputs.pm) annotation (Line(
        points={{-35,-11},{-35,-13},{-41,-13},{-41,-5},{-39,-5}}, color={0,0,
          127}));
  connect(order5Type2_Inputs_Outputs.p, bus1.p) annotation (Line(points={{-17,0},{-8,0},{-8,0},{0,0}}, color={0,0,255}));
  connect(AVRtypeIII1.vf0, order5Type2_Inputs_Outputs.vf0) annotation (Line(points={{-67,
          14.1667},{-67,23},{-35,23},{-35,11}}, color={0,0,127}));
  annotation (
    experiment(StopTime=20),
    Documentation(info="<html>
<p>Simple system with a line opening (the network of the other machine tests) to test the order 5 machine type 2 of PSAT,
<code>Electrical.Machines.PSAT.Order5_Type2</code>, connected to an AVR type III from PSAT, <code>Electrical.Controls.PSAT.AVR.AVRtypeIII</code>.</p>
<h4>Why this test exists</h4>
<p>The library had no test of <code>Order5_Type2</code>, and the model was the only PSAT machine whose <code>e1q</code> had no initial condition:
its <code>der(e1q) = 0</code> had been commented out in 2017 (issue #144, the fixes to the examples that use PSAT machines), so each tool chose
the start of <code>e1q</code> itself. PSAT starts every state of the machine in steady state: <code>e2q</code> and <code>e2d</code> from the stator equations,
<code>e1q</code> from the steady-state formula, and the field voltage from the <code>e1q</code> equation (<code>@SYclass/setx0.m</code>; the PSAT manual,
section 5.1.5, initialises every device by solving 0 = f(x, y, u)). The pull request that gave the PSAT machines their initial conditions (OpenIPSL/OpenIPSL#423:
<code>delta</code> and <code>w</code> fixed at their start values as the PSS/E machines have them, and <code>der(e1q) = 0</code> here) adds this test to show it.</p>
<p>The regulator is in the loop on purpose: the field voltage of the machine comes from the AVR, which is initialised at <code>vf0</code>, so that
<code>der(e1q) = 0</code> is satisfied only when the machine and the regulator agree on the operating point. The voltage input of the regulator is not fixed
(unlike in <code>Order4test2_AVR</code>): the regulator initialises itself from it (<code>vref = v</code>, <code>vm = v</code>), and with every state of this
machine started in steady state, a fixed <code>v</code> is one initial condition too many (Dymola: the initialization problem is overspecified).</p>
<h4>What to plot</h4>
<ul>
<li><code>order5Type2_Inputs_Outputs.e1q</code> and its derivative: constant from t = 0 until the line opening at 2 s.</li>
<li><code>order5Type2_Inputs_Outputs.w</code>, <code>order5Type2_Inputs_Outputs.delta</code> and <code>AVRtypeIII1.vf</code>: no movement before the line opening.</li>
</ul>
<h4>Reference</h4>
<p>The machine and regulator data are those of the unit test <code>ut_avr_type3_order5_type2</code> of ALSETLab/PSAT-2-Modelica, which is verified against PSAT 2.1.11
(initial values and time response, in Dymola, OpenModelica and System Modeler) on its own network. This test uses the network of the other machine tests,
so its trajectories are not compared with PSAT.</p>
</html>"));
end Order5Type2test2_AVR;
