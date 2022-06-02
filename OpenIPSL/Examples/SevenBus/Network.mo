within OpenIPSL.Examples.SevenBus;
model Network "Seven-bus test system model, ready for simulation"
  extends Modelica.Icons.Example;
  SevenBus.Generators.G1 GEN1(
    M_b=1078000000,
    P_0=PF_results.machines.P21_1,
    Q_0=PF_results.machines.Q21_1,
    V_b=24000,
    angle_0=PF_results.voltages.A21,
    v_0=PF_results.voltages.V21)
    annotation (Placement(transformation(extent={{-280,-142},{-260,-122}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-164,-142},{-144,-122}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0)
    annotation (Placement(transformation(extent={{-164,-162},{-144,-142}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{110,-142},{130,-122}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{110,-162},{130,-142}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine4(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-30,-142},{-10,-122}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine5(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-30,-162},{-10,-142}})));
  OpenIPSL.Electrical.Loads.PSSE.Load load(
    V_b=380000,
    v_0=PF_results.voltages.V5,
    angle_0=PF_results.voltages.A5,
    P_0=PF_results.loads.PL5_1,
    Q_0=PF_results.loads.QL5_1)
    annotation (Placement(transformation(extent={{-98,-178},{-88,-168}})));
  OpenIPSL.Electrical.Loads.PSSE.Load load1(
    V_b=380000,
    v_0=PF_results.voltages.V3,
    angle_0=PF_results.voltages.A3,
    P_0=PF_results.loads.PL3_1,
    Q_0=PF_results.loads.QL3_1)
    annotation (Placement(transformation(extent={{60,-178},{70,-168}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine6(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-162,-70},{-142,-50}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine7(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-162,-90},{-142,-70}})));
  OpenIPSL.Electrical.Buses.BusExt FSSV(
    np=4,
    V_b=380000,
    nn=1,
    v_0=PF_results.voltages.V2,
    angle_0=PF_results.voltages.A2)
    annotation (Placement(transformation(extent={{-200,-168},{-198,-94}})));
  OpenIPSL.Electrical.Buses.BusExt FTILL(
    nn=2,
    np=4,
    V_b=380000,
    v_0=PF_results.voltages.V5,
    angle_0=PF_results.voltages.A5)
    annotation (Placement(transformation(extent={{-100,-162},{-98,-122}})));
  OpenIPSL.Electrical.Buses.BusExt FSBIS(
    nn=2,
    np=3,
    V_b=380000,
    v_0=PF_results.voltages.V3,
    angle_0=PF_results.voltages.A3)
    annotation (Placement(transformation(extent={{58,-162},{60,-122}})));
  OpenIPSL.Electrical.Buses.BusExt FVERGE(
    np=4,
    V_b=380000,
    nn=1,
    v_0=PF_results.voltages.V7,
    angle_0=PF_results.voltages.A7) annotation (Placement(transformation(origin = {1, 91}, extent = {{-1, -39}, {1, 39}}, rotation = -90)));
  OpenIPSL.Electrical.Buses.BusExt FPAND(
    np=4,
    nn=2,
    V_b=380000,
    v_0=PF_results.voltages.V1,
    angle_0=PF_results.voltages.A1) annotation (Placement(transformation(
        extent={{-1,-39},{1,39}},
        origin={-99,-13})));
  OpenIPSL.Electrical.Buses.BusExt FTDPRA(
    np=2,
    nn=4,
    V_b=380000,
    v_0=PF_results.voltages.V4,
    angle_0=PF_results.voltages.A4) annotation (Placement(transformation(
        extent={{-1,-39},{1,39}},
        origin={99,-13})));
  OpenIPSL.Electrical.Branches.PwLine pwLine8(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-60,48},{-40,68}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine9(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{-60,28},{-40,48}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine10(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{40,48},{60,68}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine11(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{40,28},{60,48}})));
  OpenIPSL.Electrical.Loads.PSSE.Load load2(
    P_0=PF_results.loads.PL1_1,
    Q_0=PF_results.loads.QL1_1,V_b=380000,
    angle_0=PF_results.voltages.A1,
    v_0=PF_results.voltages.V1)
    annotation (Placement(transformation(extent={{-96,-78},{-86,-68}})));

  OpenIPSL.Electrical.Loads.PSSE.Load load3(
    P_0=PF_results.loads.PL4_1,
    Q_0=PF_results.loads.QL4_1,V_b=380000,
    angle_0=PF_results.voltages.A4,
    v_0=PF_results.voltages.V4)
    annotation (Placement(transformation(extent={{84,-78},{94,-68}})));

  OpenIPSL.Electrical.Buses.BusExt FVALDI(
    nn=4,
    V_b=380000,
    np=1,
    v_0=PF_results.voltages.V6,
    angle_0=PF_results.voltages.A6)
    annotation (Placement(transformation(extent={{198,-168},{200,-94}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine12(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{140,-72},{160,-52}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine13(
    R=6e-006,
    X=0.000692,
    G=0,
    B=0) annotation (Placement(transformation(extent={{140,-92},{160,-72}})));
  inner OpenIPSL.Electrical.SystemBase SysData annotation (Placement(transformation(extent={{-220,120},{-140,160}})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer(
    ANG1 = 0.00174532925199433,B=0,G=0,
    R=0.00001, VB1 = 380000, VB2 = 380000, VNOM1 = 380000, VNOM2 = 380000,
    X=0.00069,
    t1=PF_results.trafos.t1_1_4,
    t2=PF_results.trafos.t2_1_4)
    annotation (Placement(transformation(extent={{-12,-40},{8,-24}})));

  SevenBus.Generators.G2 GEN2(
    M_b= 1710000000,
    P_0=PF_results.machines.P61_1,
    Q_0=PF_results.machines.Q61_1,
    V_b=20000,
    angle_0=PF_results.voltages.A61,
    v_0=PF_results.voltages.V61)
    annotation (Placement(transformation(extent={{280,-142},{260,-122}})));

  SevenBus.Generators.G3 GEN3(
    M_b= 1211000000,
    P_0=PF_results.machines.P71_1,
    Q_0=PF_results.machines.Q71_1,
    V_b=24000,
    angle_0=PF_results.voltages.A71,
    v_0=PF_results.voltages.V71) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,158})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0.1,
    X=0.1,
    t1=1,
    t2=1.2)
    annotation (Placement(transformation(extent={{-76,-180},{-64,-168}})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer
    twoWindingTransformer1(
    ANG1 = 0.00174532925199433,B=0,
    CW= 1, CZ = 2,G=0,
    R=0.0025,
    S_n= 1080000000, VB1 = 24000, VB2 = 380000, VNOM1 = 24000, VNOM2 = 415000,
    X=0.137,
    t1=PF_results.trafos.t1_2_21,
    t2=PF_results.trafos.t2_2_21) annotation (Placement(transformation(origin = {-230, -132}, extent = {{6, -4}, {-6, 4}}, rotation = 180)));

  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer
    twoWindingTransformer2(
    ANG1 = 0.00174532925199433,B=0, CZ = 2,G=0,
    R=0.0029,
    S_n= 1710000000, VB1 = 20000, VB2 = 380000, VNOM1 = 20000, VNOM2 = 405000,
    X=0.1583,
    t1=PF_results.trafos.t1_6_61,
    t2=PF_results.trafos.t2_6_61) annotation (Placement(transformation(
        extent={{-6,-4},{6,4}},
        rotation=180,
        origin={222,-132})));

  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer
    twoWindingTransformer3(
    ANG1 = 0.00174532925199433,B=0, CZ = 2,G=0,
    R=0.0025, S_n = 1080000000, VB1 = 24000, VB2 = 380000, VNOM1 = 24000, VNOM2 = 415000,
    X=0.1362,
    t1=PF_results.trafos.t1_7_71,
    t2=PF_results.trafos.t2_7_71) annotation (Placement(transformation(
        extent={{6,-4},{-6,4}},
        rotation=90,
        origin={0,110})));

  SevenBus.Data.PF_results PF_results
    annotation (Placement(transformation(extent={{-260,140},{-240,160}})));
  Electrical.Buses.Bus internal_bus_gen1(S_b = 1078000000,V_b = 24000,angle_0=PF_results.voltages.A21, v_0=
        PF_results.voltages.V21) annotation (Placement(transformation(
        origin={-248,-132},
        extent={{-10,-10},{10,10}})));
  Electrical.Buses.Bus internal_bus_gen3 annotation (Placement(transformation(
        origin={0,128},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Electrical.Buses.Bus internal_bus_gen2(S_b = 1710000000,V_b = 20000,angle_0=PF_results.voltages.A61, v_0=
        PF_results.voltages.V61) annotation (Placement(transformation(
        origin={242,-132},
        extent={{-10,-10},{10,10}})));
equation
  connect(pwLine.n, FTILL.n[1]) annotation (Line(points={{-145,-132},{-100,-132},
          {-100,-148}}, color={0,0,255}));
  connect(pwLine1.n, FTILL.n[2]) annotation (Line(points={{-145,-152},{-100,-152},
          {-100,-136}}, color={0,0,255}));
  connect(pwLine4.p, FTILL.p[1]) annotation (Line(points={{-29,-132},{-98,-132},
          {-98,-151}}, color={0,0,255}));
  connect(pwLine5.p, FTILL.p[2]) annotation (Line(points={{-29,-152},{-98,-152},
          {-98,-145}}, color={0,0,255}));
  connect(load.p, FTILL.p[3]) annotation (Line(points={{-93,-168},{-93,-154},{-98,
          -154},{-98,-139}}, color={0,0,255}));
  connect(pwLine2.p, FSBIS.p[1]) annotation (Line(points={{111,-132},{60,-132},{
          60,-150}}, color={0,0,255}));
  connect(pwLine3.p, FSBIS.p[2]) annotation (Line(points={{111,-152},{60,-152},{
          60,-142}}, color={0,0,255}));
  connect(load1.p, FSBIS.p[3]) annotation (Line(points={{65,-168},{65,-154},{60,
          -154},{60,-134}}, color={0,0,255}));
  connect(pwLine4.n, FSBIS.n[1]) annotation (Line(points={{-11,-132},{58,-132},{
          58,-148}}, color={0,0,255}));
  connect(pwLine5.n, FSBIS.n[2]) annotation (Line(points={{-11,-152},{58,-152},{
          58,-136}}, color={0,0,255}));
  connect(pwLine.p, FSSV.p[1]) annotation (Line(points={{-163,-132},{-198,-132},
          {-198,-147.65}}, color={0,0,255}));
  connect(pwLine1.p, FSSV.p[2]) annotation (Line(points={{-163,-152},{-198,-152},
          {-198,-136.55}}, color={0,0,255}));
  connect(pwLine7.p, FSSV.p[3]) annotation (Line(points={{-161,-80},{-172,-80},{
          -172,-130},{-198,-130},{-198,-125.45}},
                                                color={0,0,255}));
  connect(pwLine6.p, FSSV.p[4]) annotation (Line(points={{-161,-60},{-190,-60},{
          -190,-114.35},{-198,-114.35}},
                                       color={0,0,255}));
  connect(pwLine6.n, FPAND.n[1]) annotation (Line(points={{-143,-60},{-140,-60},
          {-140,-2},{-100,-2},{-100,-24.7}},
                                           color={0,0,255}));
  connect(pwLine7.n, FPAND.n[2]) annotation (Line(points={{-143,-80},{-120,-80},
          {-120,-22},{-100,-22},{-100,-1.3}}, color={0,0,255}));
  connect(pwLine9.p, FPAND.p[1]) annotation (Line(points={{-59,38},{-70,38},{-70,
          -30.55},{-98,-30.55}},
                             color={0,0,255}));
  connect(pwLine8.p, FPAND.p[2]) annotation (Line(points={{-59,58},{-90,58},{-90,
          8},{-98,8},{-98,-18.85}}, color={0,0,255}));
  connect(pwLine8.n, FVERGE.p[1]) annotation (
    Line(points={{-41,58},{-20,58},{-20,90},{-16.55,90}}, color = {0, 0, 255}));
  connect(pwLine9.n, FVERGE.p[2]) annotation (
    Line(points={{-41,38},{-2,38},{-2,90},{-4.85,90}}, color = {0, 0, 255}));
  connect(pwLine11.n, FTDPRA.n[1]) annotation (Line(points={{59,38},{64,38},{64,
          -30.55},{98,-30.55}},
                            color={0,0,255}));
  connect(pwLine10.n, FTDPRA.n[2]) annotation (Line(points={{59,58},{80,58},{80,
          -4},{98,-4},{98,-18.85}},color={0,0,255}));
  connect(pwLine11.p, FVERGE.p[3]) annotation (
    Line(points={{41,38},{2,38},{2,90},{6.85,90}}, color = {0, 0, 255}));
  connect(pwLine10.p, FVERGE.p[4]) annotation (
    Line(points={{41,58},{20,58},{20,90},{18.55,90}}, color = {0, 0, 255}));
  connect(load2.p, FPAND.p[3]) annotation (Line(points={{-91,-68},{-91,-36},{-98,
          -36},{-98,-7.15}},color={0,0,255}));
  connect(load3.p, FTDPRA.n[3]) annotation (Line(points={{89,-68},{89,-36},{98,-36},
          {98,-7.15}}, color={0,0,255}));
  connect(pwLine3.n, FVALDI.n[1]) annotation (Line(points={{129,-152},{198,-152},
          {198,-147.65}}, color={0,0,255}));
  connect(pwLine2.n, FVALDI.n[2]) annotation (Line(points={{129,-132},{198,-132},
          {198,-136.55}}, color={0,0,255}));
  connect(pwLine13.n, FVALDI.n[3]) annotation (Line(points={{159,-82},{164,-82},
          {164,-130},{198,-130},{198,-125.45}},
                                             color={0,0,255}));
  connect(pwLine12.n, FVALDI.n[4]) annotation (Line(points={{159,-62},{180,-62},
          {180,-114.35},{198,-114.35}},
                                      color={0,0,255}));
  connect(pwLine13.p, FTDPRA.p[1]) annotation (Line(points={{141,-82},{104,-82},
          {104,-24.7},{100,-24.7}},
                                color={0,0,255}));
  connect(pwLine12.p, FTDPRA.p[2]) annotation (Line(points={{141,-62},{120,-62},
          {120,-1.3},{100,-1.3}}, color={0,0,255}));
  connect(twoWindingTransformer.n, FTDPRA.n[4]) annotation (Line(points={{9,-32},
          {98,-32},{98,4.55}}, color={0,0,255}));
  connect(twoWindingTransformer.p, FPAND.p[4]) annotation (Line(points={{-13,-32},
          {-98,-32},{-98,4.55}}, color={0,0,255}));
  connect(pwFault.p, FTILL.p[4]) annotation (Line(points={{-77,-174},{-82,-174},
          {-82,-133},{-98,-133}}, color={0,0,255}));
  connect(twoWindingTransformer2.n, FVALDI.p[1]) annotation (Line(points={{215.4,
          -132},{200,-132},{200,-131}},color={0,0,255}));
  connect(twoWindingTransformer3.n, FVERGE.n[1])
    annotation (Line(points={{0,103.4},{0,92},{1,92}},
                                               color={0,0,255}));
  connect(twoWindingTransformer1.n, FSSV.n[1]) annotation (
    Line(points={{-223.4,-132},{-200,-132},{-200,-131}}, color = {0, 0, 255}));
  connect(GEN1.pwPin, internal_bus_gen1.p)
    annotation (Line(points={{-259,-132},{-248,-132}}, color={0,0,255}));
  connect(internal_bus_gen1.p, twoWindingTransformer1.p)
    annotation (Line(points={{-248,-132},{-236.6,-132}}, color={0,0,255}));
  connect(twoWindingTransformer3.p, internal_bus_gen3.p)
    annotation (Line(points={{0,116.6},{0,128}}, color={0,0,255}));
  connect(GEN3.pwPin, internal_bus_gen3.p)
    annotation (Line(points={{0,147},{0,128}}, color={0,0,255}));
  connect(GEN2.pwPin, internal_bus_gen2.p)
    annotation (Line(points={{259,-132},{242,-132}}, color={0,0,255}));
  connect(internal_bus_gen2.p, twoWindingTransformer2.p)
    annotation (Line(points={{242,-132},{228.6,-132}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-280,-200},{280,180}},
          preserveAspectRatio=false), graphics={Text(
          extent={{-222,-82},{-198,-92}},
          lineColor={28,108,200},
          textString="FSSV"),Text(
          extent={{204,-82},{236,-92}},
          lineColor={28,108,200},
          textString="FVALDI"),Text(
          extent={{100,38},{138,28}},
          lineColor={28,108,200},
          textString="FTDPRA"),Text(
          extent={{-132,38},{-102,28}},
          lineColor={28,108,200},
          textString="FPAND"),Text(
          extent={{46,94},{84,84}},
          lineColor={28,108,200},
          textString="FVERGE"),Text(
          extent={{44,-108},{74,-118}},
          lineColor={28,108,200},
          textString="FSBIS"),Text(
          extent={{-114,-110},{-84,-120}},
          lineColor={28,108,200},
          textString="FTILL5")}),
    Documentation(info="<html>
<p>This example model is a small synthetic power system that can be used for assessing classic transient stability of a power grid, when undergoing a three-phase-to-ground fault. The fault is applied on bus FTILL5, at 1 second and lasts for 200ms.</p>
<p>The system should be simulated during 10 seconds and the variables of interest are:</p>
<ul>
<li><code>GEN1.iEESGO.SPEED</code></li>
<li><code>GEN2.iEESGO.SPEED</code></li>
<li><code>GEN3.iEESGO.SPEED</code></li>
</ul>
<p>where interesting oscillatory behavior is observed, since the generators appear to be non-coherent, swinging against each others.</p>
<p>In addition to that, it is also interesting to check the following voltage variables:</p>
<ul>
<li><code>FPAND.v</code></li>
<li><code>FVALDI.v</code></li>
<li><code>FVERGE.v</code></li>
</ul>
</html>"),
    experiment(StopTime=10));
end Network;
