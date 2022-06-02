within OpenIPSL.Examples.TwoAreas;
model Two_Areas_PSSE_AVR "11-bus 4-machine 2-area test system implemented with machine and excitation system models from PSSE"
  extends Modelica.Icons.Example;
  parameter Real r=0.0001;
  parameter Real x=0.001;
  parameter Real b=0.00175*0.5;
  replaceable Data.PF2 PF_results constrainedby Support.PF_TwoAreas
    annotation (Placement(transformation(extent={{-220,-40},{-200,-20}})));
  OpenIPSL.Electrical.Buses.Bus bus1
    annotation (Placement(transformation(extent={{-190,20},{-170,40}})));
  OpenIPSL.Electrical.Buses.Bus bus2
    annotation (Placement(transformation(extent={{-190,-10},{-170,10}})));
  OpenIPSL.Electrical.Buses.Bus bus3
    annotation (Placement(transformation(extent={{170,20},{190,40}})));
  OpenIPSL.Electrical.Buses.Bus bus4
    annotation (Placement(transformation(extent={{170,-20},{190,0}})));
  OpenIPSL.Electrical.Buses.Bus bus5
    annotation (Placement(transformation(extent={{-150,20},{-130,40}})));
  OpenIPSL.Electrical.Buses.Bus bus6
    annotation (Placement(transformation(extent={{-110,20},{-90,40}})));
  OpenIPSL.Electrical.Buses.Bus bus7
    annotation (Placement(transformation(extent={{-70,20},{-50,40}})));
  OpenIPSL.Electrical.Buses.Bus bus8
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  OpenIPSL.Electrical.Buses.Bus bus9
    annotation (Placement(transformation(extent={{50,20},{70,40}})));
  OpenIPSL.Electrical.Buses.Bus bus10
    annotation (Placement(transformation(extent={{90,20},{110,40}})));
  OpenIPSL.Electrical.Buses.Bus bus11
    annotation (Placement(transformation(extent={{130,20},{150,40}})));
  Groups.PSSE.AVR.G1 g1(
    v_0=PF_results.voltages.V1,
    angle_0=PF_results.voltages.A1,
    P_0=PF_results.machines.P1_1,
    Q_0=PF_results.machines.Q1_1)
    annotation (Placement(transformation(extent={{-214,24},{-202,36}})));
  Groups.PSSE.AVR.G2 g2(
    v_0=PF_results.voltages.V2,
    angle_0=PF_results.voltages.A2,
    P_0=PF_results.machines.P2_1,
    Q_0=PF_results.machines.Q2_1)
    annotation (Placement(transformation(extent={{-214,-6},{-202,6}})));
  Groups.PSSE.AVR.G3 g3(
    v_0=PF_results.voltages.V3,
    angle_0=PF_results.voltages.A3,
    P_0=PF_results.machines.P3_1,
    Q_0=PF_results.machines.Q3_1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={208,30})));
  Groups.PSSE.AVR.G4 g4(
    v_0=PF_results.voltages.V4,
    angle_0=PF_results.voltages.A4,
    P_0=PF_results.machines.P4_1,
    Q_0=PF_results.machines.Q4_1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={208,-10})));
  OpenIPSL.Electrical.Branches.PwLine Line6_7(
    R=r*10,
    X=x*10,
    G=0,
    B=b*10) annotation (Placement(transformation(extent={{-90,20},{-70,40}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_6(
    R=r*25,
    X=x*25,
    G=0,
    B=b*25) annotation (Placement(transformation(extent={{-130,20},{-110,40}})));
  OpenIPSL.Electrical.Branches.PwLine Line7_8_1(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  OpenIPSL.Electrical.Branches.PwLine Line7_8_2(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  OpenIPSL.Electrical.Branches.PwLine Line8_9_2(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{20,10},{40,30}})));
  OpenIPSL.Electrical.Branches.PwLine Line8_9_1(
    R=r*110,
    X=x*110,
    G=0,
    B=b*110) annotation (Placement(transformation(extent={{20,30},{40,50}})));
  OpenIPSL.Electrical.Branches.PwLine Line9_10(
    R=r*10,
    X=x*10,
    G=0,
    B=b*10) annotation (Placement(transformation(extent={{70,20},{90,40}})));
  OpenIPSL.Electrical.Branches.PwLine Line10_11(
    R=r*25,
    X=x*25,
    G=0,
    B=b*25) annotation (Placement(transformation(extent={{110,20},{130,40}})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    X=1e-5,
    R=0,
    t1=3,
    t2=3.2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={2,-16})));
  OpenIPSL.Electrical.Loads.PSSE.Load Load7(
    PQBRAK=0.7,
    v_0=PF_results.voltages.V7,
    angle_0=PF_results.voltages.A7,
    P_0=PF_results.loads.PL7_1,
    Q_0=PF_results.loads.QL7_1)
    annotation (Placement(transformation(extent={{-78,-26},{-50,0}})));
  OpenIPSL.Electrical.Loads.PSSE.Load Load9(
    PQBRAK=0.7,
    v_0=PF_results.voltages.V9,
    angle_0=PF_results.voltages.A9,
    P_0=PF_results.loads.PL9_1,
    Q_0=PF_results.loads.QL9_1)
    annotation (Placement(transformation(extent={{80,-26},{50,0}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_1(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{-170,20},{-150,40}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_2(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_3(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{150,20},{170,40}})));
  OpenIPSL.Electrical.Branches.PwLine Line5_4(
    G=0,
    R=0,
    X=0.01667,
    B=0) annotation (Placement(transformation(extent={{150,-20},{170,0}})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=60)
    annotation (Placement(transformation(extent={{-220,44},{-180,60}})));
equation
  connect(g1.pwPin, bus1.p) annotation (Line(points={{-201.4,30},{-201.4,30},{-180,
          30}}, color={0,0,255}));
  connect(g2.pwPin, bus2.p) annotation (Line(points={{-201.4,0},{-201.4,0},{-180,
          0}}, color={0,0,255}));
  connect(Line6_7.n, bus7.p) annotation (Line(points={{-71,30},{-71,30},{-60,30}},
                         color={0,0,255}));
  connect(Line6_7.p, bus6.p) annotation (Line(points={{-89,30},{-89,30},{-100,
          30}}, color={0,0,255}));
  connect(Line5_6.n, bus6.p) annotation (Line(points={{-111,30},{-111,30},{-100,
          30}}, color={0,0,255}));
  connect(Line5_6.p, bus5.p) annotation (Line(points={{-129,30},{-129,30},{-140,
          30}}, color={0,0,255}));
  connect(Line8_9_2.n, bus9.p) annotation (Line(points={{39,20},{54,20},{54,30},
          {60,30}}, color={0,0,255}));
  connect(Line8_9_1.n, bus9.p) annotation (Line(points={{39,40},{54,40},{54,30},
          {60,30}}, color={0,0,255}));
  connect(Line8_9_2.p, bus8.p) annotation (Line(points={{21,20},{6,20},{6,30},{
          0,30}}, color={0,0,255}));
  connect(Line8_9_1.p, bus8.p) annotation (Line(points={{21,40},{6,40},{6,30},{
          0,30}}, color={0,0,255}));
  connect(Line7_8_2.n, bus8.p) annotation (Line(points={{-21,20},{-6,20},{-6,22},
          {-6,30},{0,30}}, color={0,0,255}));
  connect(Line7_8_1.n, bus8.p) annotation (Line(points={{-21,40},{-6,40},{-6,30},
          {0,30}}, color={0,0,255}));
  connect(Line7_8_1.p, bus7.p) annotation (Line(points={{-39,40},{-54,40},{-54,
          30},{-60,30}}, color={0,0,255}));
  connect(Line7_8_2.p, bus7.p) annotation (Line(points={{-39,20},{-54,20},{-54,
          30},{-60,30}}, color={0,0,255}));
  connect(bus9.p, Line9_10.p)
    annotation (Line(points={{60,30},{71,30}}, color={0,0,255}));
  connect(Line9_10.n, bus10.p) annotation (Line(points={{89,30},{89,30},{100,30}},
                         color={0,0,255}));
  connect(bus10.p, Line10_11.p)
    annotation (Line(points={{100,30},{111,30}}, color={0,0,255}));
  connect(Line10_11.n, bus11.p) annotation (Line(points={{129,30},{129,30},{140,
          30}}, color={0,0,255}));
  connect(g4.pwPin, bus4.p) annotation (Line(points={{201.4,-10},{201.4,-10},{
          180,-10}}, color={0,0,255}));
  connect(g3.pwPin, bus3.p)
    annotation (Line(points={{201.4,30},{180,30}}, color={0,0,255}));
  connect(Load7.p, bus7.p) annotation (Line(points={{-64,0},{-64,0},{-64,30},{
          -60,30}}, color={0,0,255}));
  connect(Load9.p, Line9_10.p) annotation (Line(points={{65,0},{66,0},{66,30},{
          71,30}}, color={0,0,255}));
  connect(pwFault.p, bus8.p)
    annotation (Line(points={{2,-4.33333},{2,30},{0,30}}, color={0,0,255}));
  connect(bus1.p, Line5_1.p)
    annotation (Line(points={{-180,30},{-169,30}}, color={0,0,255}));
  connect(bus5.p, Line5_1.n)
    annotation (Line(points={{-140,30},{-151,30}}, color={0,0,255}));
  connect(bus2.p, Line5_2.p)
    annotation (Line(points={{-180,0},{-169,0}}, color={0,0,255}));
  connect(Line5_2.n, bus6.p) annotation (Line(points={{-151,0},{-104,0},{-104,
          30},{-100,30}}, color={0,0,255}));
  connect(bus11.p, Line5_3.p)
    annotation (Line(points={{140,30},{151,30}}, color={0,0,255}));
  connect(Line5_3.n, bus3.p) annotation (Line(points={{169,30},{169,30},{180,30}},
                     color={0,0,255}));
  connect(bus4.p, Line5_4.n)
    annotation (Line(points={{180,-10},{169,-10}}, color={0,0,255}));
  connect(Line5_4.p, Line10_11.p) annotation (Line(points={{151,-10},{104,-10},
          {104,30},{111,30}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-220,-40},{220,
            60}}), graphics={Text(
          extent={{-70,-30},{52,-38}},
          lineColor={28,108,200},
          textString="Two-Area System
Prabha Kundur, \"Power System Stability and Control\", Example 12.6, page 813")}),
    Documentation(info="<html>
<p>This example is composed by the 11-bus 4-machine 2-area system, where these two areas are connected via weak tie lines. This test system is ideal for studying dynamic stability, power interchange, oscillation damping, etc.</p>
<p>The four generation units are composed of machines and exciters, differently from the system <strong>Two_Areas_PSSE</strong>.</p>
<p>The system undergoes a three-phase-to-ground fault on Bus 8 at 3s, lasting for 200ms. Simulate the system for 10 seconds. Variables of interest are the ones related to inter-area modes. For example:</p>
<ul>
<li><code>g1.g1.SPEED</code></li>
<li><code>g2.g2.SPEED</code></li>
<li><code>g3.g3.SPEED</code></li>
<li><code>g4.gENSAL.SPEED</code></li>
</ul>
<p>which are variables that represent the generator's deviation from nominal speed, in per unit. Note that generators 1 and 2 swing together, while swinging against generators 3 and 4. This is due to coherency between the area's group of generators.</p>
<p>Compare these results with the ones from <strong>Two_Areas_PSSE</strong>.</p>
</html>"),
    experiment(StopTime=10, Tolerance=0.001));
end Two_Areas_PSSE_AVR;
