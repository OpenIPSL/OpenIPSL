within OpenIPSL.Examples.MPC;
package PSAT
  extends Modelica.Icons.ExamplesPackage;

  model NetworkHard
    "Base network for testing MPC control over the islanded generator"
    extends Modelica.Icons.Example;
    OpenIPSL.Electrical.Buses.Bus BG1(v_0=0.998855, angle_0=0.15699114448641)
      annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
    OpenIPSL.Electrical.Buses.Bus B1(v_0=0.992504, angle_0=0.076251672237088)
      annotation (Placement(transformation(extent={{-50,60},{-30,80}})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T1(
      R=0.001,
      X=0.2,
      G=0,
      B=0,
      VNOM1=220000,
      VB1=220000,
      VNOM2=24000,
      VB2=24000) annotation (Placement(transformation(
          extent={{-6,-4},{6,4}},
          rotation=180,
          origin={-60,70})));
    GenerationUnits.PSAT_Units.G1            G1(
      v_0=0.998855,
      angle_0=0.15699114448641,
      P_0=40000000,
      Q_0=4547321,
      V_b=24000)
      annotation (Placement(transformation(extent={{-112,60},{-92,80}})));
    OpenIPSL.Electrical.Branches.PwLine L1(
      R=0.001,
      X=0.2,
      G=0,
      B=0) annotation (Placement(transformation(extent={{-26,66},{-14,74}})));
    OpenIPSL.Electrical.Buses.Bus B2(v_0=0.992681, angle_0=-0.0049879590159821)
      annotation (Placement(transformation(extent={{-10,60},{10,80}})));
    OpenIPSL.Electrical.Buses.Bus B3(v_0=0.998705, angle_0=9.4873305611609e-06)
      annotation (Placement(transformation(extent={{50,60},{70,80}})));
    OpenIPSL.Electrical.Branches.PwLine L2_1(
      R=0.0005,
      X=0.1,
      G=0,
      B=0) annotation (Placement(transformation(extent={{24,86},{36,94}})));
    OpenIPSL.Electrical.Branches.PwLine L2_2(
      R=0.0005,
      X=0.1,
      G=0,
      B=0) annotation (Placement(transformation(extent={{24,46},{36,54}})));
    OpenIPSL.Electrical.Buses.Bus B4(angle_0=-0.00014475935348966,
                                                            v_0=0.997342)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={80,10})));
    OpenIPSL.Electrical.Branches.PwLine L3(
      R=0.001,
      X=0.2,
      G=0,
      B=0) annotation (Placement(transformation(
          extent={{-6,-4},{6,4}},
          rotation=-90,
          origin={80,40})));
    OpenIPSL.Electrical.Buses.Bus B5(v_0=1.0074, angle_0=0.0093371449790267)
                                     annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={60,-20})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T2(
      G=0,
      B=0,
      VNOM1=220000,
      VB1=220000,
      VNOM2=24000,
      VB2=24000,
      R=0.005,
      X=0.1) annotation (Placement(transformation(
          extent={{-6,-4},{6,4}},
          rotation=270,
          origin={60,-6})));
    GenerationUnits.PSAT_Units.G2                         G2(
      v_0=1.0074,
      angle_0=0.0093371449790267,
      V_b=24000,
      P_0=10010220,
      Q_0=10204330)    annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={60,-40})));
    inner OpenIPSL.Electrical.SystemBase SysData(S_b=100000000,
                                                          fn=50)
      annotation (Placement(transformation(extent={{-140,100},{-80,120}})));
    OpenIPSL.Electrical.Loads.PSSE.Load LD1(
      V_b=220000,
      v_0=0.992681,
      angle_0=-0.0049879590159821,
      P_0=50000000,
      Q_0=10000000) annotation (Placement(transformation(extent={{-12,18},{0,30}})));
    Electrical.Events.Breaker breaker(enableTrigger=false)
                                             annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=90,
          origin={80,22})));

    Modelica.Blocks.Interfaces.RealInput INPUT2(start=0)
      "Connector of Real input signal 2" annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-160,-40})));
    Modelica.Blocks.Interfaces.RealInput INPUT1(start=0)
      "Connector of Real input signal 2" annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-160,-100})));
    Electrical.Loads.PSSE.Load_variation load_variation(
      V_b=220000,
      P_0=10000000,
      Q_0=10000000,
      v_0=0.997342,
      angle_0=-0.00014475935348966,
      d_P=0.1,
      t1=1000,
      d_t=2000)
      annotation (Placement(transformation(extent={{90,-40},{110,-20}})));
    Electrical.Sensors.SoftPMU softPMU(v_0=0.997342, angle_0=-0.00014475935348966)
      annotation (Placement(transformation(extent={{26,0},{46,20}})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT
      annotation (Placement(transformation(extent={{140,-10},{160,10}})));
    Modelica.Blocks.Math.Add AddU1
      annotation (Placement(transformation(extent={{-44,-56},{-24,-36}})));
    Modelica.Blocks.Sources.Constant in_u2(k=0)
      annotation (Placement(transformation(extent={{-100,-70},{-80,-50}})));
    Modelica.Blocks.Sources.Constant in_u1(k=0)
      annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
    Modelica.Blocks.Math.Add AddU2
      annotation (Placement(transformation(extent={{-44,-112},{-24,-92}})));
    Electrical.Machines.PSSE.GENCLS          IB(
      V_b=220000,
      v_0=0.998705,
      angle_0=0,
      P_0=10067010,
      Q_0=12058260,
      M_b=100000000,
      H=1,
      D=1,
      X_d=0.2) annotation (Placement(transformation(extent={{110,60},{100,80}})));
  equation

    OUTPUT = softPMU.freq;
    connect(T1.p, B1.p)
      annotation (Line(points={{-53.4,70},{-40,70}},        color={0,0,255}));
    connect(BG1.p, T1.n)
      annotation (Line(points={{-80,70},{-66.6,70}},
                                                   color={0,0,255}));
    connect(G1.conn, BG1.p)
      annotation (Line(points={{-91,70},{-80,70}},          color={0,0,255}));
    connect(L1.n, B2.p)
      annotation (Line(points={{-14.6,70},{0,70}},            color={0,0,255}));
    connect(L1.p, B1.p) annotation (Line(points={{-25.4,70},{-40,70}},
          color={0,0,255}));
    connect(L2_2.n, B3.p) annotation (Line(points={{35.4,50},{56,50},{56,70},{60,
            70}}, color={0,0,255}));
    connect(L2_1.n, B3.p) annotation (Line(points={{35.4,90},{56,90},{56,70},{60,
            70}}, color={0,0,255}));
    connect(L2_1.p, B2.p) annotation (Line(points={{24.6,90},{4,90},{4,70},{0,70}},
                         color={0,0,255}));
    connect(L2_2.p, B2.p) annotation (Line(points={{24.6,50},{4,50},{4,70},{0,70}},
          color={0,0,255}));
    connect(G2.conn, B5.p)
      annotation (Line(points={{60,-29},{60,-20}}, color={0,0,255}));
    connect(LD1.p, B2.p)
      annotation (Line(points={{-6,30},{-6,70},{0,70}},color={0,0,255}));
    connect(L3.p, B3.p) annotation (Line(points={{80,45.4},{80,70},{60,70}},
                               color={0,0,255}));
    connect(breaker.s, B4.p)
      annotation (Line(points={{80,18},{80,10}},   color={0,0,255}));
    connect(breaker.r, L3.n)
      annotation (Line(points={{80,26},{80,34.6}},color={0,0,255}));
    connect(T2.n, B5.p)
      annotation (Line(points={{60,-12.6},{60,-20}}, color={0,0,255}));
    connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,-8},
            {80,-8},{80,10}},     color={0,0,255}));
    connect(softPMU.n, B4.p)
      annotation (Line(points={{43,10},{80,10}}, color={0,0,255}));
    connect(T2.p, softPMU.p) annotation (Line(points={{60,0.6},{40,0.6},{40,0},
            {20,0},{20,10},{29,10}}, color={0,0,255}));
    connect(INPUT2,AddU1. u1) annotation (Line(points={{-160,-40},{-46,-40}},
                        color={0,0,127}));
    connect(in_u2.y,AddU1. u2)
      annotation (Line(points={{-79,-60},{-54,-60},{-54,-52},{-46,-52}},
                                                     color={0,0,127}));
    connect(AddU1.y, G2.EFD) annotation (Line(points={{-23,-46},{6,-46},{6,-60},
            {54,-60},{54,-52}}, color={0,0,127}));
    connect(INPUT1, AddU2.u2) annotation (Line(points={{-160,-100},{-122,-100},
            {-122,-108},{-46,-108}}, color={0,0,127}));
    connect(in_u1.y, AddU2.u1) annotation (Line(points={{-79,-90},{-56,-90},{-56,
            -96},{-46,-96}}, color={0,0,127}));
    connect(AddU2.y, G2.P) annotation (Line(points={{-23,-102},{66,-102},{66,
            -52}}, color={0,0,127}));
    connect(IB.p, B3.p)
      annotation (Line(points={{100,70},{60,70}}, color={0,0,255}));
    annotation ( Diagram(coordinateSystem(preserveAspectRatio=false,
            extent={{-140,-120},{140,120}})),
      Documentation(info="<html>
<p>This example system shows how the preparation for resynchronization of Generator 2 to the grid. Note that at 2 seconds, a signal is triggered so voltages between buses 3 and 4 should be equal.</p>
<p>Simulate the system for 10 seconds. Variables of interest are:</p>
<ul>
<li><code>B3.v</code></li>
<li><code>B4.v</code></li>
<li><code>G1.gen.SPEED</code></li>
<li><code>G2.gen.SPEED</code></li>
</ul>
<p>Note the behavior of those variables before and after the connection of generator G2 to the main grid.</p>
</html>"),
      experiment(StopTime=50, __Dymola_Algorithm="Dassl"));
  end NetworkHard;

  model Linearization_Test_G2
    GenerationUnits.PSAT_Units.G2 g2_1
      annotation (Placement(transformation(extent={{-10,-12},{10,8}})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT1 "Rotor speed [pu]"
      annotation (Placement(transformation(extent={{100,20},{120,40}})));
    Modelica.Blocks.Interfaces.RealInput INPUT1
      "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
    Modelica.Blocks.Interfaces.RealInput INPUT2
      "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
    inner Electrical.SystemBase          SysData(S_b=100000000, fn=50)
      annotation (Placement(transformation(extent={{20,60},{80,80}})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT2 "Rotor angle"
      annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
  equation
    connect(g2_1.w1, OUTPUT1) annotation (Line(points={{11,2},{96,2},{96,30},{
            110,30}}, color={0,0,127}));
    connect(g2_1.EFD, INPUT1) annotation (Line(points={{-12,4},{-92,4},{-92,60},
            {-120,60}}, color={0,0,127}));
    connect(g2_1.P, INPUT2) annotation (Line(points={{-12,-8},{-94,-8},{-94,-60},
            {-120,-60}}, color={0,0,127}));
    connect(g2_1.delta1, OUTPUT2) annotation (Line(points={{11,-5},{94,-5},{94,
            -30},{110,-30}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Linearization_Test_G2;

  model TGTypeIIMPC "TG Type II"
    Modelica.Blocks.Interfaces.RealInput pm0 "Initial mechanical power [pu]"
      annotation (Placement(
        transformation(
          origin={0,120},
          extent={{-20,-20},{20,20}},
          rotation=-90),
        iconTransformation(
          origin={0.0,120.0},
          extent={{-20.0,-20.0},{20.0,20.0}},
          rotation=-90)));
    Modelica.Blocks.Interfaces.RealOutput pm "Mechanical power [pu]" annotation (
        Placement(
        transformation(
          origin={109.815,0},
          extent={{-10.0,-10.0},{10.0,10.0}}),
        iconTransformation(
          origin={110.0,-0.0},
          extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Blocks.Interfaces.RealInput w "Rotor speed [pu]" annotation (
        Placement(
        transformation(
          origin={-120,-40},
          extent={{-20,-20},{20,20}}),
        iconTransformation(
          origin={-120.0,-0.0},
          extent={{-20.0,-20.0},{20.0,20.0}})));
    Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(
          origin={-50,6.66134e-16},
          extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Blocks.Continuous.TransferFunction transferFunction1(a={Ts,1}, b={T3,
          1}) annotation (Placement(transformation(
          origin={12,0},
          extent={{-10.0,-10.0},{10.0,10.0}})));
    parameter Types.PerUnit wref=1 "Reference speed";
    parameter Types.PerUnit R=0.2 "Droop";
    parameter Types.PerUnit pmax0=1 "Maximum turbine output";
    parameter Types.PerUnit pmin0=0 "Minimum turbine output";
    parameter Types.Time Ts=0.1 "Governor Time constant";
    parameter Types.Time T3=-0.1 "Transient gain time constant";
    parameter Types.ApparentPower S_b=100e6 "System base power"
      annotation (Dialog(group="Power flow data"));
    parameter Types.ApparentPower Sn=20e6 "Nominal power";
    Modelica.Blocks.Math.Gain gain1(k=1/Ro) annotation (Placement(transformation(
          origin={-20,6.66134e-16},
          extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Blocks.Sources.Constant const(k=wref) annotation (Placement(transformation(
          origin={-84,70},
          extent={{-10,-10},{10,10}})));
    Modelica.Blocks.Math.Add add2 annotation (Placement(transformation(
          origin={50,0},
          extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=pmax, uMin=pmin) annotation (
        Placement(transformation(
          origin={80,0},
          extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Blocks.Math.Add add3(k2=+1) annotation (Placement(transformation(
          origin={-42,54},
          extent={{-10.0,-10.0},{10.0,10.0}})));
    Modelica.Blocks.Interfaces.RealInput u1
                 "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  protected
    parameter Real Ro=R*S_b/Sn;
    parameter Real pmax=pmax0*Sn/S_b;
    parameter Real pmin=pmin0*Sn/S_b;
  equation

    connect(add2.u1, pm0) annotation (Line(points={{38,6},{32,6},{32,50},{0,50},{0,120}}, color={0,0,127}));
    connect(w, add1.u2) annotation (Line(points={{-120,-40},{-70,-40},{-70,-6},
            {-62,-6}},                                                                color={0,0,127}));
    connect(add2.u2, transferFunction1.y) annotation (Line(points={{38,-6},{30,
            -6},{30,0},{23,0}},                                                                    color={0,0,127}));
    connect(add1.y, gain1.u) annotation (Line(points={{-39,0},{-32,0}}, color={0,0,127}));
    connect(add2.y, limiter1.u) annotation (Line(points={{61,0},{68,0}}, color={0,0,127}));
    connect(limiter1.y, pm) annotation (Line(points={{91,0},{109.815,0}}, color={0,0,127}));
    connect(const.y, add3.u1) annotation (Line(points={{-73,70},{-62,70},{-62,
            60},{-54,60}}, color={0,0,127}));
    connect(add3.y, add1.u1) annotation (Line(points={{-31,54},{-24,54},{-24,30},
            {-70,30},{-70,6},{-62,6}}, color={0,0,127}));
    connect(add3.u2, u1) annotation (Line(points={{-54,48},{-94,48},{-94,40},{
            -120,40}}, color={0,0,127}));
    connect(gain1.y, transferFunction1.u)
      annotation (Line(points={{-9,0},{0,0}}, color={0,0,127}));
    annotation (
      Icon( graphics={Rectangle(lineColor={0,0,0}, extent={{-100,-100},{100,100}}),
                                                    Text(
            origin={0,-40},
            extent={{-60,40},{60,-40}},
            fontName="Arial",
            lineColor={0,0,255},
            textString="TGTypeII"),
                              Text(
            origin={0,80},
            fillPattern=FillPattern.Solid,
            extent={{-20,10},{20,-10}},
            textString="pm0"),Text(
            origin={-80,0},
            extent={{-20,10},{20,-10}},
            lineColor={0,0,0},
            textString="w"), Text(
            origin={80,0},
            extent={{-20,10},{20,-10}},
            lineColor={0,0,0},
            textString="pm"),
          Text(
            extent={{-80,80},{80,20}},
            lineColor={0,0,0},
            textString="%name")}),
      Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-09</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
  end TGTypeIIMPC;

  model NetworkHardNoInfiniteBus
    "Base network for testing MPC control over the islanded generator"
    extends Modelica.Icons.Example;
    OpenIPSL.Electrical.Buses.Bus BG1(v_0=0.998855, angle_0=0.15699114448641)
      annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
    OpenIPSL.Electrical.Buses.Bus B1(v_0=0.992504, angle_0=0.076251672237088)
      annotation (Placement(transformation(extent={{-50,60},{-30,80}})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T1(
      R=0.001,
      X=0.2,
      G=0,
      B=0,
      VNOM1=220000,
      VB1=220000,
      VNOM2=24000,
      VB2=24000) annotation (Placement(transformation(
          extent={{-6,-4},{6,4}},
          rotation=180,
          origin={-60,70})));
    GenerationUnits.PSAT_Units.G1            G1(
      v_0=0.998855,
      angle_0=0.15699114448641,
      P_0=40000000,
      Q_0=4547321,
      V_b=24000)
      annotation (Placement(transformation(extent={{-112,62},{-92,82}})));
    OpenIPSL.Electrical.Branches.PwLine L1(
      R=0.001,
      X=0.2,
      G=0,
      B=0) annotation (Placement(transformation(extent={{-26,66},{-14,74}})));
    OpenIPSL.Electrical.Buses.Bus B2(v_0=0.992681, angle_0=-0.0049879590159821)
      annotation (Placement(transformation(extent={{-10,60},{10,80}})));
    OpenIPSL.Electrical.Buses.Bus B3(v_0=0.998705, angle_0=9.4873305611609e-06)
      annotation (Placement(transformation(extent={{50,60},{70,80}})));
    OpenIPSL.Electrical.Branches.PwLine L2_1(
      R=0.0005,
      X=0.1,
      G=0,
      B=0) annotation (Placement(transformation(extent={{24,86},{36,94}})));
    OpenIPSL.Electrical.Branches.PwLine L2_2(
      R=0.0005,
      X=0.1,
      G=0,
      B=0) annotation (Placement(transformation(extent={{24,46},{36,54}})));
    OpenIPSL.Electrical.Buses.Bus B4(angle_0=-0.00014475935348966,
                                                            v_0=0.997342)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={80,10})));
    OpenIPSL.Electrical.Branches.PwLine L3(
      R=0.001,
      X=0.2,
      G=0,
      B=0) annotation (Placement(transformation(
          extent={{-6,-4},{6,4}},
          rotation=-90,
          origin={80,40})));
    OpenIPSL.Electrical.Buses.Bus B5(v_0=1.0074, angle_0=0.0093371449790267)
                                     annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={60,-20})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T2(
      G=0,
      B=0,
      VNOM1=220000,
      VB1=220000,
      VNOM2=24000,
      VB2=24000,
      R=0.005,
      X=0.1) annotation (Placement(transformation(
          extent={{-6,-4},{6,4}},
          rotation=270,
          origin={60,-6})));
    GenerationUnits.PSAT_Units.G2                         G2(
      v_0=1.0074,
      angle_0=0.0093371449790267,
      V_b=24000,
      P_0=10010220,
      Q_0=10204330)    annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={60,-40})));
    inner OpenIPSL.Electrical.SystemBase SysData(S_b=100000000,
                                                          fn=50)
      annotation (Placement(transformation(extent={{-140,100},{-80,120}})));
    OpenIPSL.Electrical.Loads.PSSE.Load LD1(
      V_b=220000,
      v_0=0.992681,
      angle_0=-0.0049879590159821,
      P_0=50000000,
      Q_0=10000000) annotation (Placement(transformation(extent={{-12,18},{0,30}})));
    Electrical.Events.Breaker breaker(enableTrigger=false)
                                             annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=90,
          origin={80,22})));

    Modelica.Blocks.Interfaces.RealInput IN1(start=0)
      "Connector of Real input signal 2" annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-160,-100})));

            Modelica.Blocks.Interfaces.RealInput IN2(start=0)
      "Connector of Real input signal 2" annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-160,-40})));
    Electrical.Loads.PSSE.Load_variation load_variation(
      V_b=220000,
      P_0=10000000,
      Q_0=10000000,
      v_0=0.997342,
      angle_0=-0.00014475935348966,
      d_P=0.1,
      t1=1000,
      d_t=2000)
      annotation (Placement(transformation(extent={{90,-40},{110,-20}})));
    Electrical.Sensors.SoftPMU softPMU(v_0=0.997342, angle_0=-0.00014475935348966)
      annotation (Placement(transformation(extent={{26,0},{46,20}})));
    Modelica.Blocks.Interfaces.RealOutput OUT1
      annotation (Placement(transformation(extent={{140,30},{160,50}})));
    Modelica.Blocks.Math.Add AddU1
      annotation (Placement(transformation(extent={{-44,-56},{-24,-36}})));
      Modelica.Blocks.Sources.Constant IN11(k=0)
      annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
    Modelica.Blocks.Sources.Constant IN22(k=0)
      annotation (Placement(transformation(extent={{-100,-66},{-80,-46}})));

    Modelica.Blocks.Math.Add AddU2
      annotation (Placement(transformation(extent={{-44,-112},{-24,-92}})));
    Modelica.Blocks.Interfaces.RealOutput OUT2
      annotation (Placement(transformation(extent={{140,-50},{160,-30}})));
    Modelica.Blocks.Continuous.FirstOrder firstOrder(
      k=1,
      T=0.2,
      y_start=0)
      annotation (Placement(transformation(extent={{-6,-56},{14,-36}})));
    Modelica.Blocks.Continuous.FirstOrder firstOrder1(
      k=1,
      T=0.2,
      y_start=0)
      annotation (Placement(transformation(extent={{28,-112},{48,-92}})));
    Electrical.Sources.VoltageSourceReImInput voltageSourceReImInput
      annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={92,100})));
    Modelica.Blocks.Sources.Constant VR(k=0.998726)
      annotation (Placement(transformation(extent={{136,94},{116,114}})));
    Modelica.Blocks.Sources.Constant VI(k=3.7730e-5)
      annotation (Placement(transformation(extent={{138,60},{118,80}})));
  equation

    OUT1 = softPMU.freq;
    OUT2 = B5.v;
    connect(T1.p, B1.p)
      annotation (Line(points={{-53.4,70},{-40,70}},        color={0,0,255}));
    connect(BG1.p, T1.n)
      annotation (Line(points={{-80,70},{-66.6,70}},
                                                   color={0,0,255}));
    connect(G1.conn, BG1.p)
      annotation (Line(points={{-91,72},{-86,72},{-86,70},{-80,70}},
                                                            color={0,0,255}));
    connect(L1.n, B2.p)
      annotation (Line(points={{-14.6,70},{0,70}},            color={0,0,255}));
    connect(L1.p, B1.p) annotation (Line(points={{-25.4,70},{-40,70}},
          color={0,0,255}));
    connect(L2_2.n, B3.p) annotation (Line(points={{35.4,50},{56,50},{56,70},{60,
            70}}, color={0,0,255}));
    connect(L2_1.n, B3.p) annotation (Line(points={{35.4,90},{56,90},{56,70},{60,
            70}}, color={0,0,255}));
    connect(L2_1.p, B2.p) annotation (Line(points={{24.6,90},{4,90},{4,70},{0,70}},
                         color={0,0,255}));
    connect(L2_2.p, B2.p) annotation (Line(points={{24.6,50},{4,50},{4,70},{0,70}},
          color={0,0,255}));
    connect(G2.conn, B5.p)
      annotation (Line(points={{60,-29},{60,-20}}, color={0,0,255}));
    connect(LD1.p, B2.p)
      annotation (Line(points={{-6,30},{-6,70},{0,70}},color={0,0,255}));
    connect(L3.p, B3.p) annotation (Line(points={{80,45.4},{80,70},{60,70}},
                               color={0,0,255}));
    connect(breaker.s, B4.p)
      annotation (Line(points={{80,18},{80,10}},   color={0,0,255}));
    connect(breaker.r, L3.n)
      annotation (Line(points={{80,26},{80,34.6}},color={0,0,255}));
    connect(T2.n, B5.p)
      annotation (Line(points={{60,-12.6},{60,-20}}, color={0,0,255}));
    connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,-8},
            {80,-8},{80,10}},     color={0,0,255}));
    connect(softPMU.n, B4.p)
      annotation (Line(points={{43,10},{80,10}}, color={0,0,255}));
    connect(T2.p, softPMU.p) annotation (Line(points={{60,0.6},{40,0.6},{40,0},
            {20,0},{20,10},{29,10}}, color={0,0,255}));
    connect(IN2, AddU1.u1)
      annotation (Line(points={{-160,-40},{-46,-40}}, color={0,0,127}));
    connect(IN22.y, AddU1.u2) annotation (Line(points={{-79,-56},{-54,-56},{-54,
            -52},{-46,-52}}, color={0,0,127}));
    connect(IN1, AddU2.u2) annotation (Line(points={{-160,-100},{-122,-100},{-122,
            -108},{-46,-108}}, color={0,0,127}));
    connect(IN11.y, AddU2.u1) annotation (Line(points={{-79,-90},{-56,-90},{-56,
            -96},{-46,-96}}, color={0,0,127}));
    connect(AddU2.y, firstOrder1.u)
      annotation (Line(points={{-23,-102},{26,-102}}, color={0,0,127}));
    connect(firstOrder1.y, G2.P)
      annotation (Line(points={{49,-102},{66,-102},{66,-52}}, color={0,0,127}));
    connect(AddU1.y, firstOrder.u)
      annotation (Line(points={{-23,-46},{-8,-46}}, color={0,0,127}));
    connect(firstOrder.y, G2.EFD) annotation (Line(points={{15,-46},{32,-46},{32,-66},
            {54,-66},{54,-52}}, color={0,0,127}));
    connect(VR.y, voltageSourceReImInput.vRe)
      annotation (Line(points={{115,104},{104,104}}, color={0,0,127}));
    connect(VI.y, voltageSourceReImInput.vIm) annotation (Line(points={{117,70},
            {112,70},{112,96},{104,96}}, color={0,0,127}));
    connect(voltageSourceReImInput.p, B3.p) annotation (Line(points={{81,100},{
            80,100},{80,70},{60,70}}, color={0,0,255}));
    annotation ( Diagram(coordinateSystem(preserveAspectRatio=false,
            extent={{-140,-120},{140,120}})),
      Documentation(info="<html>
<p>This example system shows how the preparation for resynchronization of Generator 2 to the grid. Note that at 2 seconds, a signal is triggered so voltages between buses 3 and 4 should be equal.</p>
<p>Simulate the system for 10 seconds. Variables of interest are:</p>
<ul>
<li><code>B3.v</code></li>
<li><code>B4.v</code></li>
<li><code>G1.gen.SPEED</code></li>
<li><code>G2.gen.SPEED</code></li>
</ul>
<p>Note the behavior of those variables before and after the connection of generator G2 to the main grid.</p>
</html>"),
      experiment(
        StopTime=999,
        __Dymola_NumberOfIntervals=5000,
        __Dymola_Algorithm="Dassl"));
  end NetworkHardNoInfiniteBus;

  model NetworkHardNoInfiniteBus_freqControl
    "Base network for testing MPC control over the islanded generator"
    extends Modelica.Icons.Example;
    OpenIPSL.Electrical.Buses.Bus BG1(v_0=0.998855, angle_0=0.15699114448641)
      annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
    OpenIPSL.Electrical.Buses.Bus B1(v_0=0.992504, angle_0=0.076251672237088)
      annotation (Placement(transformation(extent={{-50,60},{-30,80}})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T1(
      R=0.001,
      X=0.2,
      G=0,
      B=0,
      VNOM1=220000,
      VB1=220000,
      VNOM2=24000,
      VB2=24000) annotation (Placement(transformation(
          extent={{-6,-4},{6,4}},
          rotation=180,
          origin={-60,70})));
    GenerationUnits.PSAT_Units.G1            G1(
      v_0=0.998855,
      angle_0=0.15699114448641,
      P_0=40000000,
      Q_0=4547321,
      V_b=24000)
      annotation (Placement(transformation(extent={{-112,60},{-92,80}})));
    OpenIPSL.Electrical.Branches.PwLine L1(
      R=0.001,
      X=0.2,
      G=0,
      B=0) annotation (Placement(transformation(extent={{-26,66},{-14,74}})));
    OpenIPSL.Electrical.Buses.Bus B2(v_0=0.992681, angle_0=-0.0049879590159821)
      annotation (Placement(transformation(extent={{-10,60},{10,80}})));
    OpenIPSL.Electrical.Buses.Bus B3(v_0=0.998705, angle_0=9.4873305611609e-06)
      annotation (Placement(transformation(extent={{50,60},{70,80}})));
    OpenIPSL.Electrical.Branches.PwLine L2_1(
      R=0.0005,
      X=0.1,
      G=0,
      B=0) annotation (Placement(transformation(extent={{24,86},{36,94}})));
    OpenIPSL.Electrical.Branches.PwLine L2_2(
      R=0.0005,
      X=0.1,
      G=0,
      B=0) annotation (Placement(transformation(extent={{24,46},{36,54}})));
    OpenIPSL.Electrical.Buses.Bus B4(angle_0=-0.00014475935348966,
                                                            v_0=0.997342)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={80,10})));
    OpenIPSL.Electrical.Branches.PwLine L3(
      R=0.001,
      X=0.2,
      G=0,
      B=0) annotation (Placement(transformation(
          extent={{-6,-4},{6,4}},
          rotation=-90,
          origin={80,40})));
    OpenIPSL.Electrical.Buses.Bus B5(v_0=1.0074, angle_0=0.0093371449790267)
                                     annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={60,-20})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T2(
      G=0,
      B=0,
      VNOM1=220000,
      VB1=220000,
      VNOM2=24000,
      VB2=24000,
      R=0.005,
      X=0.1) annotation (Placement(transformation(
          extent={{-6,-4},{6,4}},
          rotation=270,
          origin={60,-6})));
    GenerationUnits.PSAT_Units.G2withPID                         G2(
      v_0=1.0074,
      angle_0=0.0093371449790267,
      V_b=24000,
      P_0=10010220,
      Q_0=10204330)    annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={60,-40})));
    inner OpenIPSL.Electrical.SystemBase SysData(S_b=100000000,
                                                          fn=50)
      annotation (Placement(transformation(extent={{-140,100},{-80,120}})));
    OpenIPSL.Electrical.Loads.PSSE.Load LD1(
      V_b=220000,
      v_0=0.992681,
      angle_0=-0.0049879590159821,
      P_0=50000000,
      Q_0=10000000) annotation (Placement(transformation(extent={{-12,18},{0,30}})));
    Electrical.Events.Breaker breaker(enableTrigger=false)
                                             annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=90,
          origin={80,22})));

    Modelica.Blocks.Interfaces.RealInput IN1(start=0)
      "Connector of Real input signal 2" annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-160,-100})));
    Electrical.Loads.PSSE.Load_variation load_variation(
      V_b=220000,
      P_0=10000000,
      Q_0=10000000,
      v_0=0.997342,
      angle_0=-0.00014475935348966,
      d_P=0.1,
      t1=1000,
      d_t=2000)
      annotation (Placement(transformation(extent={{90,-40},{110,-20}})));
    Electrical.Sensors.SoftPMU softPMU(v_0=0.997342, angle_0=-0.00014475935348966)
      annotation (Placement(transformation(extent={{26,0},{46,20}})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT1
      annotation (Placement(transformation(extent={{140,40},{160,60}})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT2
      annotation (Placement(transformation(extent={{140,-60},{160,-40}})));
    Electrical.Sources.VoltageSourceReImInput voltageSourceReImInput annotation (
        Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={86,90})));
    Modelica.Blocks.Sources.Constant VR(k=0.998726)
      annotation (Placement(transformation(extent={{130,84},{110,104}})));
    Modelica.Blocks.Sources.Constant VI(k=3.7730e-5)
      annotation (Placement(transformation(extent={{132,50},{112,70}})));
    Modelica.Blocks.Interfaces.RealInput IN2(start=0)
      "Connector of Real input signal 2" annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-160,-20})));

          Modelica.Blocks.Sources.Constant IN11(k=0)
      annotation (Placement(transformation(extent={{-120,-92},{-100,-72}})));
    Modelica.Blocks.Sources.Constant IN22(k=0)
      annotation (Placement(transformation(extent={{-120,-60},{-100,-40}})));
    Modelica.Blocks.Math.Add AddU1
      annotation (Placement(transformation(extent={{-64,-50},{-44,-30}})));
    Modelica.Blocks.Math.Add AddU2
      annotation (Placement(transformation(extent={{-64,-104},{-44,-84}})));
  equation

    OUTPUT1 = softPMU.freq;
    OUTPUT2 = B4.v;
    connect(T1.p, B1.p)
      annotation (Line(points={{-53.4,70},{-40,70}},        color={0,0,255}));
    connect(BG1.p, T1.n)
      annotation (Line(points={{-80,70},{-66.6,70}},
                                                   color={0,0,255}));
    connect(G1.conn, BG1.p)
      annotation (Line(points={{-91,70},{-80,70}},          color={0,0,255}));
    connect(L1.n, B2.p)
      annotation (Line(points={{-14.6,70},{0,70}},            color={0,0,255}));
    connect(L1.p, B1.p) annotation (Line(points={{-25.4,70},{-40,70}},
          color={0,0,255}));
    connect(L2_2.n, B3.p) annotation (Line(points={{35.4,50},{56,50},{56,70},{60,
            70}}, color={0,0,255}));
    connect(L2_1.n, B3.p) annotation (Line(points={{35.4,90},{56,90},{56,70},{60,
            70}}, color={0,0,255}));
    connect(L2_1.p, B2.p) annotation (Line(points={{24.6,90},{4,90},{4,70},{0,70}},
                         color={0,0,255}));
    connect(L2_2.p, B2.p) annotation (Line(points={{24.6,50},{4,50},{4,70},{0,70}},
          color={0,0,255}));
    connect(G2.conn, B5.p)
      annotation (Line(points={{60,-29},{60,-20}}, color={0,0,255}));
    connect(LD1.p, B2.p)
      annotation (Line(points={{-6,30},{-6,70},{0,70}},color={0,0,255}));
    connect(L3.p, B3.p) annotation (Line(points={{80,45.4},{80,70},{60,70}},
                               color={0,0,255}));
    connect(breaker.s, B4.p)
      annotation (Line(points={{80,18},{80,10}},   color={0,0,255}));
    connect(breaker.r, L3.n)
      annotation (Line(points={{80,26},{80,34.6}},color={0,0,255}));
    connect(T2.n, B5.p)
      annotation (Line(points={{60,-12.6},{60,-20}}, color={0,0,255}));
    connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,-8},
            {80,-8},{80,10}},     color={0,0,255}));
    connect(softPMU.n, B4.p)
      annotation (Line(points={{43,10},{80,10}}, color={0,0,255}));
    connect(T2.p, softPMU.p) annotation (Line(points={{60,0.6},{40,0.6},{40,0},
            {20,0},{20,10},{29,10}}, color={0,0,255}));
    connect(VR.y, voltageSourceReImInput.vRe)
      annotation (Line(points={{109,94},{98,94}}, color={0,0,127}));
    connect(VI.y, voltageSourceReImInput.vIm) annotation (Line(points={{111,60},{106,
            60},{106,86},{98,86}}, color={0,0,127}));
    connect(voltageSourceReImInput.p, B3.p) annotation (Line(points={{75,90},{60,90},
            {60,70}},                                         color={0,0,255}));
    connect(AddU1.u1, IN2) annotation (Line(points={{-66,-34},{-90,-34},{-90,-20},
            {-160,-20}}, color={0,0,127}));
    connect(IN22.y, AddU1.u2) annotation (Line(points={{-99,-50},{-74,-50},{-74,-46},
            {-66,-46}}, color={0,0,127}));
    connect(AddU1.y, G2.EFD) annotation (Line(points={{-43,-40},{20,-40},{20,-60},
            {54,-60},{54,-52}}, color={0,0,127}));
    connect(IN1, AddU2.u2)
      annotation (Line(points={{-160,-100},{-66,-100}}, color={0,0,127}));
    connect(IN11.y, AddU2.u1) annotation (Line(points={{-99,-82},{-74,-82},{-74,-88},
            {-66,-88}}, color={0,0,127}));
    connect(AddU2.y, G2.P)
      annotation (Line(points={{-43,-94},{66,-94},{66,-52}}, color={0,0,127}));
    annotation ( Diagram(coordinateSystem(preserveAspectRatio=false,
            extent={{-140,-120},{140,120}})),
      Documentation(info="<html>
<p>This example system shows how the preparation for resynchronization of Generator 2 to the grid. Note that at 2 seconds, a signal is triggered so voltages between buses 3 and 4 should be equal.</p>
<p>Simulate the system for 10 seconds. Variables of interest are:</p>
<ul>
<li><code>B3.v</code></li>
<li><code>B4.v</code></li>
<li><code>G1.gen.SPEED</code></li>
<li><code>G2.gen.SPEED</code></li>
</ul>
<p>Note the behavior of those variables before and after the connection of generator G2 to the main grid.</p>
</html>"),
      experiment(StopTime=50, __Dymola_Algorithm="Dassl"));
  end NetworkHardNoInfiniteBus_freqControl;

  model NetworkHardNoInfiniteBus_freqControl2
    "Base network for testing MPC control over the islanded generator"
    extends Modelica.Icons.Example;
    OpenIPSL.Electrical.Buses.Bus BG1(v_0=0.998855, angle_0=0.15699114448641)
      annotation (Placement(transformation(extent={{-90,60},{-70,80}})));
    OpenIPSL.Electrical.Buses.Bus B1(v_0=0.992504, angle_0=0.076251672237088)
      annotation (Placement(transformation(extent={{-50,60},{-30,80}})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T1(
      R=0.001,
      X=0.2,
      G=0,
      B=0,
      VNOM1=220000,
      VB1=220000,
      VNOM2=24000,
      VB2=24000) annotation (Placement(transformation(
          extent={{-6,-4},{6,4}},
          rotation=180,
          origin={-60,70})));
    GenerationUnits.PSAT_Units.G1            G1(
      v_0=0.998855,
      angle_0=0.15699114448641,
      P_0=40000000,
      Q_0=4547321,
      V_b=24000)
      annotation (Placement(transformation(extent={{-112,60},{-92,80}})));
    OpenIPSL.Electrical.Branches.PwLine L1(
      R=0.001,
      X=0.2,
      G=0,
      B=0) annotation (Placement(transformation(extent={{-26,66},{-14,74}})));
    OpenIPSL.Electrical.Buses.Bus B2(v_0=0.992681, angle_0=-0.0049879590159821)
      annotation (Placement(transformation(extent={{-10,60},{10,80}})));
    OpenIPSL.Electrical.Buses.Bus B3(v_0=0.998705, angle_0=9.4873305611609e-06)
      annotation (Placement(transformation(extent={{50,60},{70,80}})));
    OpenIPSL.Electrical.Branches.PwLine L2_1(
      R=0.0005,
      X=0.1,
      G=0,
      B=0) annotation (Placement(transformation(extent={{24,86},{36,94}})));
    OpenIPSL.Electrical.Branches.PwLine L2_2(
      R=0.0005,
      X=0.1,
      G=0,
      B=0) annotation (Placement(transformation(extent={{24,46},{36,54}})));
    OpenIPSL.Electrical.Buses.Bus B4(angle_0=-0.00014475935348966,
                                                            v_0=0.997342)
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={80,10})));
    OpenIPSL.Electrical.Branches.PwLine L3(
      R=0.001,
      X=0.2,
      G=0,
      B=0) annotation (Placement(transformation(
          extent={{-6,-4},{6,4}},
          rotation=-90,
          origin={80,40})));
    OpenIPSL.Electrical.Buses.Bus B5(v_0=1.0074, angle_0=0.0093371449790267)
                                     annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={60,-20})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer T2(
      G=0,
      B=0,
      VNOM1=220000,
      VB1=220000,
      VNOM2=24000,
      VB2=24000,
      R=0.005,
      X=0.1) annotation (Placement(transformation(
          extent={{-6,-4},{6,4}},
          rotation=270,
          origin={60,-6})));
    GenerationUnits.PSAT_Units.G2                         G2(
      v_0=1.0074,
      angle_0=0.0093371449790267,
      V_b=24000,
      P_0=10010220,
      Q_0=10204330)    annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={60,-40})));
    inner OpenIPSL.Electrical.SystemBase SysData(S_b=100000000,
                                                          fn=50)
      annotation (Placement(transformation(extent={{-140,100},{-80,120}})));
    OpenIPSL.Electrical.Loads.PSSE.Load LD1(
      V_b=220000,
      v_0=0.992681,
      angle_0=-0.0049879590159821,
      P_0=50000000,
      Q_0=10000000) annotation (Placement(transformation(extent={{-12,18},{0,30}})));
    Electrical.Events.Breaker breaker(enableTrigger=false)
                                             annotation (Placement(transformation(
          extent={{-4,-4},{4,4}},
          rotation=90,
          origin={80,22})));

    Modelica.Blocks.Interfaces.RealInput INPUT1(start=0)
      "Connector of Real input signal 2" annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-160,-100})));
    Electrical.Loads.PSSE.Load_variation load_variation(
      V_b=220000,
      P_0=10000000,
      Q_0=10000000,
      v_0=0.997342,
      angle_0=-0.00014475935348966,
      d_P=0.01,
      t1=2,
      d_t=50)
      annotation (Placement(transformation(extent={{90,-40},{110,-20}})));
    Electrical.Sensors.SoftPMU softPMU(v_0=0.997342, angle_0=-0.00014475935348966)
      annotation (Placement(transformation(extent={{26,0},{46,20}})));
    Modelica.Blocks.Interfaces.RealOutput OUTPUT1
      annotation (Placement(transformation(extent={{140,40},{160,60}})));
    Modelica.Blocks.Sources.Constant in_u1(k=0)
      annotation (Placement(transformation(extent={{-106,-112},{-86,-92}})));
    Modelica.Blocks.Math.Add  add3_1
      annotation (Placement(transformation(extent={{-44,-100},{-24,-80}})));
    Modelica.Blocks.Interfaces.RealInput INPUT2( start=0)
      "Connector of Real input signal 1"
      annotation (Placement(transformation(extent={{-180,-24},{-140,16}})));
    Modelica.Blocks.Continuous.FirstOrder firstOrder(
      k=1,
      T=0.2,
      y_start=0)
      annotation (Placement(transformation(extent={{-44,-20},{-24,0}})));
    Modelica.Blocks.Sources.Constant in_u2(k=0)
      annotation (Placement(transformation(extent={{-120,-50},{-100,-30}})));
    Modelica.Blocks.Math.Add  add3_2
      annotation (Placement(transformation(extent={{-84,-20},{-64,0}})));
    Modelica.Blocks.Continuous.FirstOrder firstOrder1(
      k=1,
      T=0.2,
      y_start=0)
      annotation (Placement(transformation(extent={{6,-100},{26,-80}})));
    Electrical.Sources.VoltageSourceReImInput voltageSourceReImInput
      annotation (Placement(transformation(
          extent={{-10,10},{10,-10}},
          rotation=180,
          origin={90,104})));
    Modelica.Blocks.Sources.Constant VR(k=0.998726)
      annotation (Placement(transformation(extent={{134,98},{114,118}})));
    Modelica.Blocks.Sources.Constant VI(k=3.7730e-5)
      annotation (Placement(transformation(extent={{136,64},{116,84}})));
  equation

    OUTPUT1 = softPMU.freq;
    connect(T1.p, B1.p)
      annotation (Line(points={{-53.4,70},{-40,70}},        color={0,0,255}));
    connect(BG1.p, T1.n)
      annotation (Line(points={{-80,70},{-66.6,70}},
                                                   color={0,0,255}));
    connect(G1.conn, BG1.p)
      annotation (Line(points={{-91,70},{-80,70}},          color={0,0,255}));
    connect(L1.n, B2.p)
      annotation (Line(points={{-14.6,70},{0,70}},            color={0,0,255}));
    connect(L1.p, B1.p) annotation (Line(points={{-25.4,70},{-40,70}},
          color={0,0,255}));
    connect(L2_2.n, B3.p) annotation (Line(points={{35.4,50},{56,50},{56,70},{60,
            70}}, color={0,0,255}));
    connect(L2_1.n, B3.p) annotation (Line(points={{35.4,90},{56,90},{56,70},{60,
            70}}, color={0,0,255}));
    connect(L2_1.p, B2.p) annotation (Line(points={{24.6,90},{4,90},{4,70},{0,70}},
                         color={0,0,255}));
    connect(L2_2.p, B2.p) annotation (Line(points={{24.6,50},{4,50},{4,70},{0,70}},
          color={0,0,255}));
    connect(G2.conn, B5.p)
      annotation (Line(points={{60,-29},{60,-20}}, color={0,0,255}));
    connect(LD1.p, B2.p)
      annotation (Line(points={{-6,30},{-6,70},{0,70}},color={0,0,255}));
    connect(L3.p, B3.p) annotation (Line(points={{80,45.4},{80,70},{60,70}},
                               color={0,0,255}));
    connect(breaker.s, B4.p)
      annotation (Line(points={{80,18},{80,10}},   color={0,0,255}));
    connect(breaker.r, L3.n)
      annotation (Line(points={{80,26},{80,34.6}},color={0,0,255}));
    connect(T2.n, B5.p)
      annotation (Line(points={{60,-12.6},{60,-20}}, color={0,0,255}));
    connect(load_variation.p, B4.p) annotation (Line(points={{100,-20},{100,-8},
            {80,-8},{80,10}},     color={0,0,255}));
    connect(softPMU.n, B4.p)
      annotation (Line(points={{43,10},{80,10}}, color={0,0,255}));
    connect(T2.p, softPMU.p) annotation (Line(points={{60,0.6},{40,0.6},{40,0},
            {20,0},{20,10},{29,10}}, color={0,0,255}));
    connect(in_u1.y, add3_1.u2) annotation (Line(points={{-85,-102},{-54,-102},{-54,
            -96},{-46,-96}},     color={0,0,127}));
    connect(add3_1.u1, INPUT1) annotation (Line(points={{-46,-84},{-128,-84},{-128,
            -100},{-160,-100}}, color={0,0,127}));
    connect(in_u2.y, add3_2.u2) annotation (Line(points={{-99,-40},{-94,-40},{-94,
            -16},{-86,-16}}, color={0,0,127}));
    connect(INPUT2, add3_2.u1)
      annotation (Line(points={{-160,-4},{-86,-4}}, color={0,0,127}));
    connect(add3_2.y, firstOrder.u)
      annotation (Line(points={{-63,-10},{-46,-10}}, color={0,0,127}));
    connect(firstOrder.y, G2.EFD) annotation (Line(points={{-23,-10},{44,-10},{44,
            -52},{54,-52}}, color={0,0,127}));
    connect(add3_1.y, firstOrder1.u)
      annotation (Line(points={{-23,-90},{4,-90}}, color={0,0,127}));
    connect(firstOrder1.y, G2.P)
      annotation (Line(points={{27,-90},{66,-90},{66,-52}}, color={0,0,127}));
    connect(VR.y, voltageSourceReImInput.vRe)
      annotation (Line(points={{113,108},{102,108}}, color={0,0,127}));
    connect(VI.y, voltageSourceReImInput.vIm) annotation (Line(points={{115,74},
            {110,74},{110,100},{102,100}}, color={0,0,127}));
    connect(voltageSourceReImInput.p, B3.p)
      annotation (Line(points={{79,104},{60,104},{60,70}}, color={0,0,255}));
    annotation ( Diagram(coordinateSystem(preserveAspectRatio=false,
            extent={{-140,-120},{140,120}})),
      Documentation(info="<html>
<p>This example system shows how the preparation for resynchronization of Generator 2 to the grid. Note that at 2 seconds, a signal is triggered so voltages between buses 3 and 4 should be equal.</p>
<p>Simulate the system for 10 seconds. Variables of interest are:</p>
<ul>
<li><code>B3.v</code></li>
<li><code>B4.v</code></li>
<li><code>G1.gen.SPEED</code></li>
<li><code>G2.gen.SPEED</code></li>
</ul>
<p>Note the behavior of those variables before and after the connection of generator G2 to the main grid.</p>
</html>"),
      experiment(StopTime=50, __Dymola_Algorithm="Dassl"));
  end NetworkHardNoInfiniteBus_freqControl2;
end PSAT;
