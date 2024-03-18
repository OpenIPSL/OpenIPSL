within OpenIPSL.Examples;
package TCL
  extends Modelica.Icons.ExamplesPackage;
  model TCL_simple_example_1
    extends Modelica.Icons.Example;

    OpenIPSL.Electrical.Loads.PSAT.TCL_randominit tCL_randominit(
      Sn=1e6,
      v0=1,
      p0=0.5,
      R=100,
      C=80,
      start0=1)
      annotation (Placement(transformation(extent={{62,-10},{82,10}})));
    OpenIPSL.Electrical.Buses.Bus bus
      annotation (Placement(transformation(extent={{30,-10},{50,10}})));
    Modelica.Blocks.Sources.Constant const(k=0)
      annotation (Placement(transformation(extent={{96,30},{76,50}})));
    OpenIPSL.Electrical.Branches.PwLine pwLine(
      R=0.0001,
      X=0.01,
      G=0,
      B=0) annotation (Placement(transformation(extent={{0,-10},{20,10}})));
    OpenIPSL.Electrical.Buses.Bus bus1
      annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
    OpenIPSL.Electrical.Machines.PSSE.GENCLS gENCLS
      annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  equation
    connect(bus.p, tCL_randominit.p)
      annotation (Line(points={{40,0},{60.5,0}},
                                               color={0,0,255}));
    connect(const.y, tCL_randominit.u) annotation (Line(points={{75,40},{52,40},
            {52,4.5188},{60,4.5188}},
                                  color={0,0,127}));
    connect(pwLine.n, bus.p)
      annotation (Line(points={{19,0},{40,0}}, color={0,0,255}));
    connect(bus1.p, pwLine.p)
      annotation (Line(points={{-20,0},{1,0}}, color={0,0,255}));
    connect(gENCLS.p, bus1.p)
      annotation (Line(points={{-40,0},{-20,0}}, color={0,0,255}));
    annotation (experiment(
        StopTime=1000,
        __Dymola_NumberOfIntervals=1000,
        __Dymola_Algorithm="Dassl"));
  end TCL_simple_example_1;

  model TCL_simple_example_2
    extends Modelica.Icons.Example;

    OpenIPSL.Electrical.Buses.Bus bus
      annotation (Placement(transformation(extent={{30,-10},{50,10}})));
    Modelica.Blocks.Sources.Constant const(k=0)
      annotation (Placement(transformation(extent={{96,30},{76,50}})));
    OpenIPSL.Electrical.Buses.Bus bus1
      annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
    OpenIPSL.Electrical.Machines.PSSE.GENCLS gENCLS
      annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
    PwTrasformerLTC_V pwTrasformerLTC_V_limiter_MPC
      annotation (Placement(transformation(extent={{0,-10},{20,10}})));
    Modelica.Blocks.Sources.Ramp ramp(
      height=-0.2,
      duration=50,
      offset=1,
      startTime=1)
      annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
    Electrical.Loads.PSAT.TCL_randominit          tCL_randominit_MPC(
      Sn=1e6,
      v0=1,
      p0=0.5,
      R=100,
      C=80,
      start0=1)
      annotation (Placement(transformation(extent={{54,-10},{74,10}})));
  equation
    connect(gENCLS.p, bus1.p)
      annotation (Line(points={{-40,0},{-20,0}}, color={0,0,255}));
    connect(pwTrasformerLTC_V_limiter_MPC.p, bus1.p)
      annotation (Line(points={{-1.5,0},{-20,0}}, color={0,0,255}));
    connect(pwTrasformerLTC_V_limiter_MPC.n, bus.p) annotation (Line(points={{
            21.6,0.1},{26,0.1},{26,0},{40,0}}, color={0,0,255}));
    connect(ramp.y, pwTrasformerLTC_V_limiter_MPC.u)
      annotation (Line(points={{-19,-40},{10,-40},{10,-12}}, color={0,0,127}));
    connect(bus.p, tCL_randominit_MPC.p)
      annotation (Line(points={{40,0},{52.5,0}}, color={0,0,255}));
    connect(tCL_randominit_MPC.u, const.y) annotation (Line(points={{52,4.5188},
            {48,4.5188},{48,40},{75,40}}, color={0,0,127}));
  end TCL_simple_example_2;

  model TCL_simple_example_3
    extends Modelica.Icons.Example;

    OpenIPSL.Electrical.Loads.PSAT.TCL_randominit tCL_randominit
      annotation (Placement(transformation(extent={{60,-10},{80,10}})));
    OpenIPSL.Electrical.Buses.Bus bus
      annotation (Placement(transformation(extent={{30,-10},{50,10}})));
    Modelica.Blocks.Sources.Constant const(k=0)
      annotation (Placement(transformation(extent={{96,30},{76,50}})));
    OpenIPSL.Electrical.Buses.Bus bus1
      annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
    OpenIPSL.Electrical.Machines.PSSE.GENCLS gENCLS
      annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
    PwTrasformerLTC_V_limiter pwTrasformerLTC_V_limiter
      annotation (Placement(transformation(extent={{0,-10},{20,10}})));
    Modelica.Blocks.Sources.Ramp ramp(
      height=-0.2,
      duration=5,
      offset=1,
      startTime=10)
      annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
  equation
    connect(bus.p, tCL_randominit.p)
      annotation (Line(points={{40,0},{58.5,0}},
                                               color={0,0,255}));
    connect(const.y, tCL_randominit.u) annotation (Line(points={{75,40},{52,40},{52,
            4.5188},{58,4.5188}}, color={0,0,127}));
    connect(gENCLS.p, bus1.p)
      annotation (Line(points={{-40,0},{-20,0}}, color={0,0,255}));
    connect(pwTrasformerLTC_V_limiter.p, bus1.p)
      annotation (Line(points={{-1.5,0},{-20,0}}, color={0,0,255}));
    connect(pwTrasformerLTC_V_limiter.n, bus.p) annotation (Line(points={{21.6,
            0.1},{26,0.1},{26,0},{40,0}}, color={0,0,255}));
    connect(ramp.y, pwTrasformerLTC_V_limiter.u)
      annotation (Line(points={{-19,-40},{10,-40},{10,-12}}, color={0,0,127}));
    annotation (experiment(
        StopTime=1000,
        __Dymola_NumberOfIntervals=1000,
        __Dymola_Algorithm="Dassl"));
  end TCL_simple_example_3;

  model TCL_simple_example_4
    extends Modelica.Icons.Example;

    OpenIPSL.Electrical.Buses.Bus bus
      annotation (Placement(transformation(extent={{12,-10},{32,10}})));
    Modelica.Blocks.Sources.Constant const(k=0)
      annotation (Placement(transformation(extent={{90,40},{80,50}})));
    OpenIPSL.Electrical.Branches.PwLine pwLine(
      R=0.0001,
      X=0.01,
      G=0,
      B=0) annotation (Placement(transformation(extent={{-18,-10},{2,10}})));
    OpenIPSL.Electrical.Buses.Bus bus1
      annotation (Placement(transformation(extent={{-48,-10},{-28,10}})));
    OpenIPSL.Electrical.Machines.PSSE.GENCLS gENCLS
      annotation (Placement(transformation(extent={{-78,-10},{-58,10}})));
    TCL_Building_no_noise_RECORD_DATA2 tCL_Building_no_noise_RECORD_DATA2_1(
      start0_TCL2=0,
      start0_TCL4=0,
      start0_TCL5=0,
      start0_TCL7=1,
      start0_TCL8=0,
      start0_TCL9=1,
      start0_TCL13=0,
      start0_TCL16=0,
      start0_TCL17=1,
      start0_TCL19=1,
      start0_TCL22=1,
      start0_TCL25=1,
      start0_TCL26=0,
      start0_TCL27=0,
      start0_TCL29=0,
      start0_TCL31=0,
      TCL_b=110000)
      annotation (Placement(transformation(extent={{34,-50},{54,-30}})));
    Modelica.Blocks.Sources.Constant const1(k=0)
      annotation (Placement(transformation(extent={{90,22},{80,32}})));
    Modelica.Blocks.Sources.Constant const2(k=0)
      annotation (Placement(transformation(extent={{90,4},{80,14}})));
    Modelica.Blocks.Sources.Constant const3(k=0)
      annotation (Placement(transformation(extent={{90,-16},{80,-6}})));
    TCL_Building_no_noise_RECORD_DATA1 tCL_Building_no_noise_RECORD_DATA1_1(
      start0_TCL2=0,
      start0_TCL4=0,
      start0_TCL6=0,
      start0_TCL8=0,
      start0_TCL11=0,
      start0_TCL13=0,
      start0_TCL15=0,
      start0_TCL17=0,
      start0_TCL18=0,
      start0_TCL22=0,
      start0_TCL24=0,
      start0_TCL26=0,
      start0_TCL29=0,
      TCL_b=110000)
      annotation (Placement(transformation(extent={{36,-10},{56,10}})));
  equation
    connect(pwLine.n, bus.p)
      annotation (Line(points={{1,0},{22,0}},  color={0,0,255}));
    connect(bus1.p, pwLine.p)
      annotation (Line(points={{-38,0},{-17,0}},
                                               color={0,0,255}));
    connect(gENCLS.p, bus1.p)
      annotation (Line(points={{-58,0},{-38,0}}, color={0,0,255}));
    connect(tCL_Building_no_noise_RECORD_DATA2_1.pwPin, bus.p) annotation (Line(
          points={{34,-40},{28,-40},{28,0},{22,0}}, color={0,0,255}));
    connect(tCL_Building_no_noise_RECORD_DATA2_1.u2, const3.y) annotation (Line(
          points={{55,-35},{68,-35},{68,-11},{79.5,-11}}, color={0,0,127}));
    connect(tCL_Building_no_noise_RECORD_DATA2_1.u1, const2.y) annotation (Line(
          points={{55,-31},{70,-31},{70,9},{79.5,9}}, color={0,0,127}));
    connect(tCL_Building_no_noise_RECORD_DATA2_1.u3, const.y) annotation (Line(
          points={{55,-45},{74,46},{74,45},{79.5,45}}, color={0,0,127}));
    connect(tCL_Building_no_noise_RECORD_DATA2_1.u4, const1.y) annotation (Line(
          points={{55,-49},{74,-2},{94,18},{76,18},{76,27},{79.5,27}}, color={0,
            0,127}));
    connect(tCL_Building_no_noise_RECORD_DATA1_1.pwPin, bus.p)
      annotation (Line(points={{36,0},{22,0}}, color={0,0,255}));
    connect(tCL_Building_no_noise_RECORD_DATA1_1.u1, const2.y)
      annotation (Line(points={{57,9},{79.5,9}}, color={0,0,127}));
    connect(tCL_Building_no_noise_RECORD_DATA1_1.u2, const2.y) annotation (Line(
          points={{57,5},{62,5},{62,8},{72,8},{72,9},{79.5,9}}, color={0,0,127}));
    connect(tCL_Building_no_noise_RECORD_DATA1_1.u3, const2.y) annotation (Line(
          points={{57,-5},{72,-5},{72,9},{79.5,9}}, color={0,0,127}));
    connect(tCL_Building_no_noise_RECORD_DATA1_1.u4, const2.y) annotation (Line(
          points={{57,-9},{72,-9},{72,9},{79.5,9}}, color={0,0,127}));
    annotation (experiment(
        StopTime=2000,
        __Dymola_NumberOfIntervals=1000,
        __Dymola_Algorithm="Dassl"));
  end TCL_simple_example_4;

  model TCL_simple_example_5
    extends Modelica.Icons.Example;

    OpenIPSL.Electrical.Buses.Bus bus
      annotation (Placement(transformation(extent={{12,-10},{32,10}})));
    Modelica.Blocks.Sources.Constant const(k=0)
      annotation (Placement(transformation(extent={{98,-40},{78,-20}})));
    OpenIPSL.Electrical.Buses.Bus bus1
      annotation (Placement(transformation(extent={{-48,-10},{-28,10}})));
    OpenIPSL.Electrical.Machines.PSSE.GENCLS gENCLS
      annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
    TCL_Building_no_noise tCL_Building_no_noise(
      start0_TCL2=0,
      start0_TCL3=0,
      start0_TCL6=0,
      start0_TCL9=0,
      start0_TCL11=0,
      start0_TCL19=0,
      start0_TCL22=0,
      start0_TCL24=0,
      start0_TCL28=0,
      start0_TCL31=0,
      TCL_b=2000)
      annotation (Placement(transformation(extent={{34,-10},{54,10}})));
    Modelica.Blocks.Sources.Ramp ramp(
      height=-0.3,
      duration=5000,
      offset=1,
      startTime=100000)
      annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
    PwTrasformerLTC_V_limiter pwTrasformerLTC_V_limiter
      annotation (Placement(transformation(extent={{-32,-10},{-12,10}})));
    Electrical.Buses.Bus          bus2
      annotation (Placement(transformation(extent={{-14,-10},{6,10}})));
    Electrical.Branches.PwLine          pwLine(
      R=0.0001,
      X=0.01,
      G=0,
      B=0) annotation (Placement(transformation(extent={{4,-4},{12,4}})));
  equation
    connect(gENCLS.p, bus1.p)
      annotation (Line(points={{-60,0},{-38,0}}, color={0,0,255}));
    connect(bus.p, tCL_Building_no_noise.pwPin)
      annotation (Line(points={{22,0},{34,0}}, color={0,0,255}));
    connect(const.y, tCL_Building_no_noise.u1) annotation (Line(points={{77,-30},
            {72,-30},{72,9},{55,9}}, color={0,0,127}));
    connect(tCL_Building_no_noise.u2, const.y) annotation (Line(points={{55,5},
            {72,5},{72,-30},{77,-30}}, color={0,0,127}));
    connect(tCL_Building_no_noise.u3, const.y) annotation (Line(points={{55,-5},
            {72,-5},{72,-30},{77,-30}}, color={0,0,127}));
    connect(tCL_Building_no_noise.u4, const.y) annotation (Line(points={{55,-9},
            {72,-9},{72,-30},{77,-30}}, color={0,0,127}));
    connect(bus1.p, pwTrasformerLTC_V_limiter.p)
      annotation (Line(points={{-38,0},{-33.5,0}}, color={0,0,255}));
    connect(ramp.y, pwTrasformerLTC_V_limiter.u) annotation (Line(points={{-39,
            -50},{-22,-50},{-22,-12}}, color={0,0,127}));
    connect(pwTrasformerLTC_V_limiter.n, bus2.p)
      annotation (Line(points={{-10.4,0.1},{-6,0},{-4,0}}, color={0,0,255}));
    connect(pwLine.p, bus2.p)
      annotation (Line(points={{4.4,0},{-4,0}}, color={0,0,255}));
    connect(pwLine.n, bus.p)
      annotation (Line(points={{11.6,0},{22,0}}, color={0,0,255}));
    annotation (experiment(
        StopTime=5000,
        __Dymola_NumberOfIntervals=1000,
        __Dymola_Algorithm="Dassl"));
  end TCL_simple_example_5;

  model PwTrasformerLTC_V
    OpenIPSL.Interfaces.PwPin p annotation (
      Placement(transformation(extent={{-120,-6},{-100,14}}),   iconTransformation(extent={{-130,
              -14},{-100,14}})));
    OpenIPSL.Interfaces.PwPin n annotation (
      Placement(transformation(extent = {{58, 2}, {78, 22}}), iconTransformation(extent={{100,-14},
              {132,16}})));
    Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={0,-120}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={0,-120})));
    Pw3PhaseVoltage pw3PhaseVoltage1(
      RT=0,
      XT=0,
      r=1) annotation (Placement(transformation(extent={{-4,-22},{54,36}})));
    PwTransformer_LTC pwTransformer_LTC(
      R=1e-010,
      X=0.0725,
      G=0,
      B=0) annotation (Placement(transformation(extent={{-54,-26},{8,42}})));
    Modelica.Blocks.Interfaces.RealOutput v1 annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,90}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,110})));
  equation
    connect(pwTransformer_LTC.p, p) annotation (Line(points={{-58.65,8},{-58,8},
            {-58,4},{-110,4}},       color={0,0,255}));
    connect(pwTransformer_LTC.r, u) annotation (Line(points={{-45.01,19.56},{
            -58,19.56},{-58,30},{-86,30},{-86,-94},{0,-94},{0,-120}}, color={0,
            0,127}));
    connect(pwTransformer_LTC.n, pw3PhaseVoltage1.p)
      annotation (Line(points={{-58.65,8},{-2,7},{-8.35,7}}, color={0,0,255}));
    connect(pw3PhaseVoltage1.n, n) annotation (Line(points={{-8.35,7},{-8.35,12},
            {68,12}},     color={0,0,255}));
    connect(pw3PhaseVoltage1.v, v1) annotation (Line(points={{56.9,-1.7},{82,
            -1.7},{82,76},{0,76},{0,90}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-100,-100},
              {100,100}})),
      Icon(coordinateSystem(preserveAspectRatio = false, extent={{-100,-100},{
              100,100}}),                                                                    graphics={  Rectangle(extent={{-100,
                100},{100,-100}},                                                                                                                   lineColor = {0, 0, 255}), Ellipse(extent={{-22,16},
                {10,-16}},                                                                                                                                                                                            lineColor = {0, 0, 255},
              lineThickness =                                                                                                                                                                                                        0.5), Ellipse(extent={{-4,16},
                {28,-16}},                                                                                                                                                                                                        lineColor = {0, 0, 255},
              lineThickness =                                                                                                                                                                                                        0.5), Line(points={{-38,0},
                {-22,0}},                                                                                                                                                                                                        color = {0, 0, 255}, thickness = 0.5, smooth = Smooth.None), Line(points={{28,0},{
                44,0}},                                                                                                                                                                                                        color = {0, 0, 255}, thickness = 0.5, smooth = Smooth.None), Line(points={{-32,-26},
                {32,28},{22,26}},                                                                                                                                                                                                        color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5), Line(points={{32,28},
                {30,18}},                                                                                                                                                                                                        color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5)}));
  end PwTrasformerLTC_V;

  class PwTransformer_LTC "Two winding fixed transformer composed of an ideal transformer, a series 
                                                                        impedance and a shunt admittance"
    parameter Real R "Resistance p.u.";
    parameter Real X "Reactance p.u.";
    parameter Real G "Shunt conductance p.u.";
    parameter Real B "Shunt susceptance p.u.";
    Modelica.Blocks.Interfaces.RealInput r annotation (Placement(
          transformation(extent={{-96,20},{-76,40}}), iconTransformation(
          extent={{9,-10},{-9,10}},
          rotation=180,
          origin={-71,34})));

    Interfaces.PwPin          p annotation (
      Placement(transformation(extent={{-80,-10},{-60,10}}),    iconTransformation(extent={{-130,
              -14},{-100,14}})));
    Interfaces.PwPin n annotation (Placement(transformation(extent={{60,-10},{
              80,10}}), iconTransformation(extent={{-130,-14},{-100,14}})));
  equation


    r * (G * n.vr - B * n.vi - n.ir) = p.ir;
    r * (G * n.vi + B * n.vr - n.ii) = p.ii;
    R * p.ir - X * p.ii = r * r * p.vr - r * n.vr;
    R * p.ii + X * p.ir = r * r * p.vi - r * n.vi;
    annotation (
      Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-60, 40}, {60, -40}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-26, 16}, {6, -16}}, lineColor = {0, 0, 255}, lineThickness = 1), Ellipse(extent = {{-8, 16}, {24, -16}}, lineColor = {0, 0, 255}, lineThickness = 1), Line(points = {{-42, 0}, {-26, 0}}, color = {0, 0, 255}, thickness = 1, smooth = Smooth.None), Line(points = {{24, 0}, {40, 0}}, color = {0, 0, 255}, thickness = 1, smooth = Smooth.None)}),
      Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
  end PwTransformer_LTC;

  class Pw3PhaseVoltage
    "Voltage sensor for generator machine with internal transformer"
    parameter Real RT "Step-up trafo Resistance in Machine (p.u.)";
    parameter Real XT "Step-up trafo Resistance in Machine (p.u.)";
    parameter Real r "Step-up trafo ratio in Machine";
    Modelica.Blocks.Interfaces.RealOutput v
      annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
    Interfaces.PwPin          p annotation (
      Placement(transformation(extent={{-76,-10},{-56,10}}),    iconTransformation(extent={{-130,
              -14},{-100,14}})));
    Interfaces.PwPin n annotation (Placement(transformation(extent={{58,-4},{78,
              16}}), iconTransformation(extent={{-130,-14},{-100,14}})));
  equation
    n.vr = p.vr;
    n.vi = p.vi;
    n.ir = -p.ir;
    n.ii = -p.ii;
    v = sqrt((p.vr + RT * p.ir - XT * p.ii) * (p.vr + RT * p.ir - XT * p.ii) + (p.vi + RT * p.ii + XT * p.ir) * (p.vi + RT * p.ii + XT * p.ir)) * 1.0 / r;
    annotation (
      Icon(graphics={  Rectangle(extent = {{-40, 40}, {40, -40}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-30, 32}, {30, -32}}, lineColor = {0, 0, 255}), Rectangle(extent = {{-20, 20}, {20, 0}}, lineColor = {0, 0, 255}), Text(extent = {{-28, -18}, {28, -30}}, lineColor = {0, 0, 255}, textStyle = {TextStyle.Bold}, textString = "3-Phase V"), Line(points = {{0, 0}, {10, 10}}, color = {0, 0, 255}, smooth = Smooth.None)}),
      Diagram(graphics));
  end Pw3PhaseVoltage;

  class PwTransformer_LTC_limiter "Two winding fixed transformer composed of an ideal transformer, a series 
                                                                        impedance and a shunt admittance"
    parameter Real R "Resistance p.u.";
    parameter Real X "Reactance p.u.";
    parameter Real G "Shunt conductance p.u.";
    parameter Real B "Shunt susceptance p.u.";
    Modelica.Blocks.Interfaces.RealInput r annotation (Placement(
          transformation(extent={{-100,40},{-80,60}}),iconTransformation(
          extent={{9,-10},{-9,10}},
          rotation=180,
          origin={-71,34})));

    Modelica.Blocks.Tables.CombiTable1Ds rr(table=[0,0.95; 0.925,0.95; 0.949,0.95;
          0.95,0.975; 0.974,0.975; 0.975,1; 1,1], smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
      extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
      annotation (Placement(transformation(extent={{-68,40},{-48,60}})));
    Interfaces.PwPin          p annotation (
      Placement(transformation(extent={{-80,-10},{-60,10}}),    iconTransformation(extent={{-130,
              -14},{-100,14}})));
    Interfaces.PwPin n annotation (Placement(transformation(extent={{60,-10},{
              80,10}}), iconTransformation(extent={{100,-14},{130,14}})));
  equation

    rr.y[1] * (G * n.vr - B * n.vi - n.ir) = p.ir;
    rr.y[1] * (G * n.vi + B * n.vr - n.ii) = p.ii;
    R * p.ir - X * p.ii = rr.y[1] * rr.y[1] * p.vr - rr.y[1] * n.vr;
    R * p.ii + X * p.ir = rr.y[1] * rr.y[1] * p.vi - rr.y[1] * n.vi;
    connect(r, rr.u)
      annotation (Line(points={{-90,50},{-70,50}}, color={0,0,127}));
    annotation (
      Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(extent = {{-60, 40}, {60, -40}}, lineColor = {0, 0, 255}), Ellipse(extent = {{-26, 16}, {6, -16}}, lineColor = {0, 0, 255}, lineThickness = 1), Ellipse(extent = {{-8, 16}, {24, -16}}, lineColor = {0, 0, 255}, lineThickness = 1), Line(points = {{-42, 0}, {-26, 0}}, color = {0, 0, 255}, thickness = 1, smooth = Smooth.None), Line(points = {{24, 0}, {40, 0}}, color = {0, 0, 255}, thickness = 1, smooth = Smooth.None)}),
      Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
  end PwTransformer_LTC_limiter;

  model PwTrasformerLTC_V_limiter
    OpenIPSL.Interfaces.PwPin p annotation (
      Placement(transformation(extent={{-120,-6},{-100,14}}),   iconTransformation(extent={{-130,
              -14},{-100,14}})));
    OpenIPSL.Interfaces.PwPin n annotation (
      Placement(transformation(extent = {{58, 2}, {78, 22}}), iconTransformation(extent={{100,-14},
              {132,16}})));
    Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={0,-120}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={0,-120})));
    Pw3PhaseVoltage pw3PhaseVoltage1(
      RT=0,
      XT=0,
      r=1) annotation (Placement(transformation(extent={{-4,-22},{54,36}})));
    Modelica.Blocks.Interfaces.RealOutput v1 annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,90}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,110})));
    PwTransformer_LTC_limiter pwTransformer_LTC_limiter(
      R=1e-010,
      X=0.075,
      G=0,
      B=0) annotation (Placement(transformation(extent={{-36,-2},{-16,18}})));
  equation
    connect(pw3PhaseVoltage1.n, n) annotation (Line(points={{-8.35,7},{-8.35,12},
            {68,12}},     color={0,0,255}));
    connect(pw3PhaseVoltage1.v, v1) annotation (Line(points={{56.9,-1.7},{82,
            -1.7},{82,76},{0,76},{0,90}}, color={0,0,127}));
    connect(pwTransformer_LTC_limiter.p, p) annotation (Line(points={{-37.5,8},
            {-94,8},{-94,4},{-110,4}},   color={0,0,255}));
    connect(pwTransformer_LTC_limiter.n, pw3PhaseVoltage1.p) annotation (Line(
          points={{-14.5,8},{-8,8},{-8,7},{-8.35,7}},  color={0,0,255}));
    connect(pwTransformer_LTC_limiter.r, u) annotation (Line(points={{-33.1,
            11.4},{-60,11.4},{-60,-62},{0,-62},{0,-120}}, color={0,0,127}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-100,-100},
              {100,100}})),
      Icon(coordinateSystem(preserveAspectRatio = false, extent={{-100,-100},{
              100,100}}),                                                                    graphics={  Rectangle(extent={{-100,
                100},{100,-100}},                                                                                                                   lineColor = {0, 0, 255}), Ellipse(extent={{-22,16},
                {10,-16}},                                                                                                                                                                                            lineColor = {0, 0, 255},
              lineThickness =                                                                                                                                                                                                        0.5), Ellipse(extent={{-4,16},
                {28,-16}},                                                                                                                                                                                                        lineColor = {0, 0, 255},
              lineThickness =                                                                                                                                                                                                        0.5), Line(points={{-38,0},
                {-22,0}},                                                                                                                                                                                                        color = {0, 0, 255}, thickness = 0.5, smooth = Smooth.None), Line(points={{28,0},{
                44,0}},                                                                                                                                                                                                        color = {0, 0, 255}, thickness = 0.5, smooth = Smooth.None), Line(points={{-32,-26},
                {32,28},{22,26}},                                                                                                                                                                                                        color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5), Line(points={{32,28},
                {30,18}},                                                                                                                                                                                                        color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5)}));
  end PwTrasformerLTC_V_limiter;

  model TCL_Building_no_noise
    Interfaces.PwPin pwPin
      annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    Electrical.Loads.PSAT.TCL_randominit TCL1(Sn=TCL_b,
      p0=P0,
      theta_ref=21,
      theta_a=30,
      theta_min=20.75,
      theta_max=21.75,                        start0=start0_TCL1) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-70,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL7(Sn=TCL_b, p0=P0,         start0=start0_TCL7) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={50,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL9(Sn=TCL_b, p0=P0,         start0=start0_TCL9) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-70,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL10(Sn=TCL_b, p0=P0,         start0=start0_TCL10) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-50,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL11(Sn=TCL_b, p0=P0,         start0=start0_TCL11) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-30,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL13(Sn=TCL_b, p0=P0,         start0=start0_TCL13) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={10,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL2(Sn=TCL_b,  p0=P0,
      theta_ref=20.2,
      theta_a=29,
      theta_min=20.1,
      theta_max=20.4,                                                  start0=start0_TCL2)
                                              annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-50,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL3(Sn=TCL_b,  p0=P0,
      theta_ref=18,
      theta_min=17,
      theta_max=19,                                                    start0=start0_TCL3) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-30,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL4(Sn=TCL_b,  p0=P0,        start0=start0_TCL4) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-10,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL5(Sn=TCL_b,  p0=P0,        start0=start0_TCL5) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={10,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL6(Sn=TCL_b,  p0=P0,        start0=start0_TCL6) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={30,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL12(Sn=TCL_b, p0=P0,        start0=start0_TCL12) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-10,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL14(Sn=TCL_b, p0=P0,         start0=start0_TCL14) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={30,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL8(Sn=TCL_b,  p0=P0,        start0=start0_TCL8) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={70,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL15(Sn=TCL_b, p0=P0,         start0=start0_TCL15) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={50,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL16(Sn=TCL_b, p0=P0,         start0=start0_TCL16) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={70,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL17(Sn=TCL_b, p0=P0,         start0=start0_TCL17) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-70,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL18(Sn=TCL_b, p0=P0,         start0=start0_TCL18) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-50,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL19(Sn=TCL_b, p0=P0,         start0=start0_TCL19) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-30,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL21(Sn=TCL_b, p0=P0,         start0=start0_TCL21) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={10,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL20(Sn=TCL_b, p0=P0,         start0=start0_TCL20) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-10,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL22(Sn=TCL_b, p0=P0,         start0=start0_TCL22) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={30,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL23(Sn=TCL_b, p0=P0,         start0=start0_TCL23) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={50,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL24(Sn=TCL_b, p0=P0,         start0=start0_TCL24) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={70,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL25(Sn=TCL_b, p0=P0,         start0=start0_TCL25) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-70,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL26(Sn=TCL_b, p0=P0,         start0=start0_TCL26) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-50,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL27(Sn=TCL_b, p0=P0,         start0=start0_TCL27) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-30,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL29(Sn=TCL_b, p0=P0,         start0=start0_TCL29) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={10,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL28(Sn=TCL_b, p0=P0,         start0=start0_TCL28) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-10,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL30(Sn=TCL_b, p0=P0,         start0=start0_TCL30) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={30,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL31(Sn=TCL_b, p0=P0,         start0=start0_TCL31) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={50,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL32(Sn=TCL_b, p0=P0,         start0=start0_TCL32) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={70,-70})));
    parameter Integer start0_TCL1=1;
    parameter Integer start0_TCL2=1;
    parameter Integer start0_TCL3=1;
    parameter Integer start0_TCL4=1;
    parameter Integer start0_TCL5=1;
    parameter Integer start0_TCL6=1;
    parameter Integer start0_TCL7=1;
    parameter Integer start0_TCL8=1;
    parameter Integer start0_TCL9=1;
    parameter Integer start0_TCL10=1;
    parameter Integer start0_TCL11=1;
    parameter Integer start0_TCL12=1;
    parameter Integer start0_TCL13=1;
    parameter Integer start0_TCL14=1;
    parameter Integer start0_TCL15=1;
    parameter Integer start0_TCL16=1;
    parameter Integer start0_TCL17=1;
    parameter Integer start0_TCL18=1;
    parameter Integer start0_TCL19=1;
    parameter Integer start0_TCL20=1;
    parameter Integer start0_TCL21=1;
    parameter Integer start0_TCL22=1;
    parameter Integer start0_TCL23=1;
    parameter Integer start0_TCL24=1;
    parameter Integer start0_TCL25=1;
    parameter Integer start0_TCL26=1;
    parameter Integer start0_TCL27=1;
    parameter Integer start0_TCL28=1;
    parameter Integer start0_TCL29=1;
    parameter Integer start0_TCL30=1;
    parameter Integer start0_TCL31=1;
    parameter Integer start0_TCL32=1;
    parameter Modelica.Units.SI.ApparentPower TCL_b = 1400 "TCL Base Power";
    parameter Real P0=1;

    Modelica.Blocks.Interfaces.RealInput u1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,90}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,90})));
    Modelica.Blocks.Interfaces.RealInput u2 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,50}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,50})));
    Modelica.Blocks.Interfaces.RealInput u3 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,-50}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,-50})));
    Modelica.Blocks.Interfaces.RealInput u4 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,-90}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,-90})));
  equation
    connect(pwPin, TCL9.p)
      annotation (Line(points={{-100,0},{-70,0},{-70,18.5}},
                                                           color={0,0,255}));
    connect(TCL2.p, TCL9.p) annotation (Line(points={{-50,58.5},{-50,50},{-84,
            50},{-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL3.p, TCL9.p) annotation (Line(points={{-30,58.5},{-30,50},{-84,
            50},{-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL4.p, TCL9.p) annotation (Line(points={{-10,58.5},{-10,50},{-84,
            50},{-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL5.p, TCL9.p) annotation (Line(points={{10,58.5},{10,50},{-84,50},
            {-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL6.p, TCL9.p) annotation (Line(points={{30,58.5},{30,50},{-84,50},
            {-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL7.p, TCL9.p) annotation (Line(points={{50,58.5},{50,50},{-84,50},
            {-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL8.p, TCL9.p) annotation (Line(points={{70,58.5},{70,50},{-84,50},
            {-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL10.p, pwPin)
      annotation (Line(points={{-50,18.5},{-50,0},{-100,0}},
                                                           color={0,0,255}));
    connect(TCL11.p, pwPin)
      annotation (Line(points={{-30,18.5},{-30,0},{-100,0}},
                                                           color={0,0,255}));
    connect(TCL17.p, pwPin)
      annotation (Line(points={{-70,-18.5},{-70,0},{-100,0}},
                                                            color={0,0,255}));
    connect(TCL18.p, pwPin)
      annotation (Line(points={{-50,-18.5},{-50,0},{-100,0}},
                                                            color={0,0,255}));
    connect(TCL19.p, pwPin)
      annotation (Line(points={{-30,-18.5},{-30,0},{-100,0}},
                                                            color={0,0,255}));
    connect(TCL20.p, pwPin)
      annotation (Line(points={{-10,-18.5},{-10,0},{-100,0}},
                                                            color={0,0,255}));
    connect(TCL21.p, pwPin)
      annotation (Line(points={{10,-18.5},{10,0},{-100,0}},
                                                          color={0,0,255}));
    connect(TCL22.p, pwPin)
      annotation (Line(points={{30,-18.5},{30,0},{-100,0}},
                                                          color={0,0,255}));
    connect(TCL23.p, pwPin)
      annotation (Line(points={{50,-18.5},{50,0},{-100,0}},
                                                          color={0,0,255}));
    connect(TCL24.p, pwPin)
      annotation (Line(points={{70,-18.5},{70,0},{-100,0}},
                                                          color={0,0,255}));
    connect(TCL12.p, pwPin)
      annotation (Line(points={{-10,18.5},{-10,0},{-100,0}},
                                                           color={0,0,255}));
    connect(TCL13.p, pwPin)
      annotation (Line(points={{10,18.5},{10,0},{-100,0}},
                                                         color={0,0,255}));
    connect(TCL14.p, pwPin)
      annotation (Line(points={{30,18.5},{30,0},{-100,0}},
                                                         color={0,0,255}));
    connect(TCL15.p, pwPin)
      annotation (Line(points={{50,18.5},{50,0},{-100,0}},
                                                         color={0,0,255}));
    connect(TCL16.p, pwPin)
      annotation (Line(points={{70,18.5},{70,0},{-100,0}},
                                                         color={0,0,255}));
    connect(TCL1.p, pwPin) annotation (Line(points={{-70,58.5},{-70,50},{-84,50},
            {-84,0},{-100,0}},
                          color={0,0,255}));
    connect(TCL25.p, pwPin) annotation (Line(points={{-70,-58.5},{-70,-50},{-84,
            -50},{-84,0},{-100,0}},
                               color={0,0,255}));
    connect(TCL26.p, pwPin) annotation (Line(points={{-50,-58.5},{-50,-50},{-84,
            -50},{-84,0},{-100,0}},
                               color={0,0,255}));
    connect(TCL27.p, pwPin) annotation (Line(points={{-30,-58.5},{-30,-50},{-84,
            -50},{-84,0},{-100,0}},
                               color={0,0,255}));
    connect(TCL28.p, pwPin) annotation (Line(points={{-10,-58.5},{-10,-50},{-84,
            -50},{-84,0},{-100,0}},
                               color={0,0,255}));
    connect(TCL29.p, pwPin) annotation (Line(points={{10,-58.5},{10,-50},{-84,
            -50},{-84,0},{-100,0}},
                              color={0,0,255}));
    connect(TCL30.p, pwPin) annotation (Line(points={{30,-58.5},{30,-50},{-84,
            -50},{-84,0},{-100,0}},
                              color={0,0,255}));
    connect(TCL31.p, pwPin) annotation (Line(points={{50,-58.5},{50,-50},{-84,
            -50},{-84,0},{-100,0}},
                              color={0,0,255}));
    connect(TCL32.p, pwPin) annotation (Line(points={{70,-58.5},{70,-50},{-84,
            -50},{-84,0},{-100,0}},
                              color={0,0,255}));
    connect(TCL1.u, u1) annotation (Line(points={{-74.5188,58},{-74,58},{-74,54},{
            -84,54},{-84,90},{110,90}}, color={0,0,127}));
    connect(TCL2.u, u1) annotation (Line(points={{-54.5188,58},{-54,58},{-54,54},{
            -60,54},{-60,90},{110,90}}, color={0,0,127}));
    connect(TCL3.u, u1) annotation (Line(points={{-34.5188,58},{-34,58},{-34,54},{
            -40,54},{-40,90},{110,90}}, color={0,0,127}));
    connect(TCL4.u, u1) annotation (Line(points={{-14.5188,58},{-14,58},{-14,54},{
            -20,54},{-20,90},{110,90}}, color={0,0,127}));
    connect(TCL5.u, u1) annotation (Line(points={{5.4812,58},{6,58},{6,54},{0,54},
            {0,90},{110,90}}, color={0,0,127}));
    connect(TCL6.u, u1) annotation (Line(points={{25.4812,58},{26,58},{26,54},{20,
            54},{20,90},{110,90}}, color={0,0,127}));
    connect(TCL7.u, u1) annotation (Line(points={{45.4812,58},{46,58},{46,54},{40,
            54},{40,90},{110,90}}, color={0,0,127}));
    connect(TCL8.u, u1) annotation (Line(points={{65.4812,58},{66,58},{66,54},{60,
            54},{60,90},{110,90}}, color={0,0,127}));
    connect(TCL9.u, u2) annotation (Line(points={{-74.5188,18},{-74.5188,16},{-74,
            16},{-74,12},{-82,12},{-82,50},{110,50}}, color={0,0,127}));
    connect(TCL10.u, u2) annotation (Line(points={{-54.5188,18},{-54.5188,12},{-82,
            12},{-82,50},{110,50}}, color={0,0,127}));
    connect(TCL11.u, u2) annotation (Line(points={{-34.5188,18},{-34.5188,12},{-82,
            12},{-82,50},{110,50}}, color={0,0,127}));
    connect(TCL12.u, u2) annotation (Line(points={{-14.5188,18},{-14,18},{-14,12},
            {-82,12},{-82,50},{110,50}}, color={0,0,127}));
    connect(TCL13.u, u2) annotation (Line(points={{5.4812,18},{4,18},{4,12},{-82,12},
            {-82,50},{110,50}}, color={0,0,127}));
    connect(TCL14.u, u2) annotation (Line(points={{25.4812,18},{25.4812,12},{-82,12},
            {-82,50},{110,50}}, color={0,0,127}));
    connect(TCL15.u, u2) annotation (Line(points={{45.4812,18},{45.4812,12},{-82,12},
            {-82,50},{110,50}}, color={0,0,127}));
    connect(TCL16.u, u2) annotation (Line(points={{65.4812,18},{66,18},{66,12},{-82,
            12},{-82,50},{110,50}}, color={0,0,127}));
    connect(TCL24.u, u3) annotation (Line(points={{74.5188,-18},{74.5188,-10},{96,
            -10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL23.u, u3) annotation (Line(points={{54.5188,-18},{54.5188,-10},{96,
            -10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL22.u, u3) annotation (Line(points={{34.5188,-18},{36,-18},{36,-10},
            {96,-10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL21.u, u3) annotation (Line(points={{14.5188,-18},{14.5188,-10},{96,
            -10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL20.u, u3) annotation (Line(points={{-5.4812,-18},{-4,-18},{-4,-10},
            {96,-10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL19.u, u3) annotation (Line(points={{-25.4812,-18},{-25.4812,-10},{96,
            -10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL18.u, u3) annotation (Line(points={{-45.4812,-18},{-46,-18},{-46,-10},
            {96,-10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL17.u, u3) annotation (Line(points={{-65.4812,-18},{-65.4812,-10},{96,
            -10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL32.u, u4) annotation (Line(points={{74.5188,-58},{74.5188,-52},{74,
            -52},{74,-46},{88,-46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL31.u, u4) annotation (Line(points={{54.5188,-58},{54.5188,-46},{88,
            -46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL30.u, u4) annotation (Line(points={{34.5188,-58},{34.5188,-46},{88,
            -46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL29.u, u4) annotation (Line(points={{14.5188,-58},{14.5188,-46},{88,
            -46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL28.u, u4) annotation (Line(points={{-5.4812,-58},{-5.4812,-46},{88,
            -46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL27.u, u4) annotation (Line(points={{-25.4812,-58},{-25.4812,-46},{88,
            -46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL26.u, u4) annotation (Line(points={{-45.4812,-58},{-44,-58},{-44,-46},
            {88,-46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL25.u, u4) annotation (Line(points={{-65.4812,-58},{-65.4812,-46},{88,
            -46},{88,-90},{110,-90}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={28,108,200},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Bitmap(
            extent={{-100,-100},{100,100}},
            imageSource="iVBORw0KGgoAAAANSUhEUgAABj0AAAY9CAYAAACVB56QAAAgAElEQVR4XuzdX8zlxXnY8Vn+mLIuAt519m0g3ngRqEq7iJvAhRWblbK0N3UtV71JcxEnm1SGKG9VGTY4qKpkxL7FFy0O21qRixsVRZWCSlxkSoiJ7bo4F6GxqdfGGDtbaV2E3HgtUsKa48ZQNu023dfnvHtm35kzv3nmY8lXPmfmN595zl74q/OeXcl/CBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIBBHYFOIMjECBAgAABAgQIECBAgAABAgQIECBAgAABAgTSrvSPn3qDAwECBAgQIECAAAECBAgQIECAAAECBAgQIECga4Fd6TdFj65v0MMTIECAAAECBAgQIECAAAECBAgQIECAAAECfyEgehgEAgQIECBAgAABAgQIECBAgAABAgQIECBAIISA6BHiGh2CAAECBAgQIECAAAECBAgQIECAAAECBAgQED3MAAECBAgQIECAAAECBAgQIECAAAECBAgQIBBCQPQIcY0OQYAAAQIECBAgQIAAAQIECBAgQIAAAQIECIgeZoAAAQIECBAgQIAAAQIECBAgQIAAAQIECBAIISB6hLhGhyBAgAABAgQIECBAgAABAgQIECBAgAABAgREDzNAgAABAgQIECBAgAABAgQIECBAgAABAgQIhBAQPUJco0MQIECAAAECBAgQIECAAAECBAgQIECAAAECoocZIECAAAECBAgQIECAAAECBAgQIECAAAECBEIIiB4hrtEhCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAdHDDBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIhBESPENfoEAQIECBAgAABAgQIECBAgAABAgQIECBAgIDoYQYIECBAgAABAgQIECBAgAABAgQIECBAgACBEAKiR4hrdAgCBAgQIECAAAECBAgQIECAAAECBAgQIEBA9DADBAgQIECAAAECBAgQIECAAAECBAgQIECAQAgB0SPENToEAQIECBAgQIAAAQIECBAgQIAAAQIECBAgIHqYAQIECBAgQIAAAQIECBAgQIAAAQIECBAgQCCEgOgR4hodggABAgQIECBAgAABAgQIECBAgAABAgQIEBA9zAABAgQIECBAgAABAgQIECBAgAABAgQIECAQQkD0CHGNDkGAAAECBAgQIECAAAECBAgQIECAAAECBAiIHmaAAAECBAgQIECAAAECBAgQIECAAAECBAgQCCEgeoS4RocgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIERA8zQIAAAQIECBAgQIAAAQIECBAgQIAAAQIECIQQED1CXKNDECBAgAABAgQIECBAgAABAgQIECBAgAABAqKHGSBAgAABAgQIECBAgAABAgQIECBAgAABAgRCCIgeIa7RIQgQIECAAAECBAgQIECAAAECBAgQIECAAAHRwwwQIECAAAECBAgQIECAAAECBAgQIECAAAECIQREjxDX6BAECBAgQIAAAQIECBAgQIAAAQIECBAgQICA6GEGCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgRACokeIa3QIAgQIECBAgAABAgQIECBAgAABAgQIECBAQPQwAwQIECBAgAABAgQIECBAgAABAgQIECBAgEAIAdEjxDU6BAECBAgQIECAAAECBAgQIECAAAECBAgQICB6mAECBAgQIECAAAECBAgQIECAAAECBAgQIEAghIDoEeIaHYIAAQIECBAgQIAAAQIECBAgQIAAAQIECBAQPcwAAQIECBAgQIAAAQIECBAgQIAAAQIECBAgEEJA9AhxjQ5BgAABAgQIECBAgAABAgQIECBAgAABAgQIiB5mgAABAgQIECBAgAABAgQIECBAgAABAgQIEAghIHqEuEaHIECAAAECBAgQIECAAAECBAgQIECAAAECBEQPM0CAAAECBAgQIECAAAECBAgQIECAAAECBAiEEBA9QlyjQxAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKihxkgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIEQgiIHiGu0SEIECBAgAABAgQIECBAgAABAgQIECBAgAAB0cMMECBAgAABAgQIECBAgAABAgQIECBAgAABAiEERI8Q1+gQBAgQIECAAAECBAgQIECAAAECBAgQIECAgOhhBggQIECAAAECBAgQIECAAAECBAgQIECAAIEQAqJHiGt0CAIECBAgQIAAAQIECBAgQIAAAQIECBAgQED0MAMECBAgQIAAAQIECBAgQIAAAQIECBAgQIBACAHRI8Q1OgQBAgQIECBAgAABAgQIECBAgAABAgQIECAgepgBAgQIECBAgAABAgQIECBAgAABAgQIECBAIISA6BHiGh2CAAECBAgQIECAAAECBAgQIECAAAECBAgQED3MAAECBAgQIECAAAECBAgQIECAAAECBAgQIBBCQPQIcY0OQYAAAQIECBAgQIAAAQIECBAgQIAAAQIECIgeZoAAAQIECBAgQIAAAQIECBAgQIAAAQIECBAIISB6hLhGhyBAgAABAgQIECBAgAABAgQIECBAgAABAgREDzNAgAABAgQIECBAgAABAgQIECBAgAABAgQIhBAQPUJco0MQIECAAAECBAgQIECAAAECBAgQIECAAAECoocZIECAAAECBAgQIECAAAECBAgQIECAAAECBEIIiB4hrtEhCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAdHDDBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIhBESPENfoEAQIECBAgAABAgQIECBAgAABAgQIECBAgIDoYQYIECBAgAABAgQIECBAgAABAgQIECBAgACBEAKiR4hrdAgCBAgQIECAAAECBAgQIECAAAECBAgQIEBA9DADBAgQIECAAAECBAgQIECAAAECBAgQIECAQAgB0SPENToEAQIECBAgQIAAAQIECBAgQIAAAQIECBAgIHqYAQIECBAgQIAAAQIECBAgQIAAAQIECBAgQCCEgOgR4hodggABAgQIECBAgAABAgQIECBAgAABAgQIEBA9zAABAgQIECBAgAABAgQIECBAgAABAgQIECAQQkD0CHGNDkGAAAECBAgQIECAAAECBAgQIECAAAECBAiIHmaAAAECBAgQIECAAAECBAgQIECAAAECBAgQCCEgeoS4RocgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIERA8zQIAAAQIECBAgQIAAAQIECBAgQIAAAQIECIQQED1CXKNDECBAgAABAgQIECBAgAABAgQIECBAgAABAqKHGSBAgAABAgQIECBAgAABAgQIECBAgAABAgRCCIgeIa7RIQgQIECAAAECBAgQIECAAAECBAgQIECAAAHRwwwQIECAAAECBAgQIECAAAECBAgQIECAAAECIQREjxDX6BAECBAgQIAAAQIECBAgQIAAAQIECBAgQICA6GEGCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgRACokeIa3QIAgQIECBAgAABAgQIECBAgAABAgQIECBAQPQwAwQIECBAgAABAgQIECBAgAABAgQIECBAgEAIAdEjxDU6BAECBAgQIECAAAECBAgQIECAAAECBAgQICB6mAECBAgQIECAAAECBAgQIECAAAECBAgQIEAghIDoEeIaHYIAAQIECBAgQIAAAQIECBAgQIAAAQIECBAQPcwAAQIECBAgQIAAAQIECBAgQIAAAQIECBAgEEJA9AhxjQ5BgAABAgQIECBAgAABAgQIECBAgAABAgQIiB5mgAABAgQIECBAgAABAgQIECBAgAABAgQIEAghIHqEuEaHIECAAAECBAgQIECAAAECBAgQIECAAAECBEQPM0CAAAECBAgQIECAAAECBAgQIECAAAECBAiEEBA9QlyjQxAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKihxkgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIEQgiIHiGu0SEIECBAgAABAgQIECBAgAABAgQIECBAgAAB0cMMECBAgAABAgQIECBAgAABAgQIECBAgAABAiEERI8Q1+gQBAgQIECAAAECBAgQIECAAAECBAgQIECAgOhhBggQIECAAAECBAgQIECAAAECBAgQIECAAIEQAqJHiGt0CAIECBAgQIAAAQIECBAgQIAAAQIECBAgQED0MAMECBAgQIAAAQIECBAgQIAAAQIECBAgQIBACAHRI8Q1OgQBAgQIECBAgAABAgQIECBAgAABAgQIECAgepgBAgQIECBAgAABAgQIECBAgAABAgQIECBAIISA6BHiGh2CAAECBAgQIECAAAECBAgQIECAAAECBAgQED3MAAECBAgQIECAAAECBAgQIECAAAECBAgQIBBCQPQIcY0OQYAAAQIECBAgQIAAAQIECBAgQIAAAQIECIgeZoAAAQIECBAgQIAAAQIECBAgQIAAAQIECBAIISB6hLhGhyBAgAABAgQIECBAgAABAgQIECBAgAABAgREDzNAgAABAgQIECBAgAABAgQIECBAgAABAgQIhBAQPUJco0MQIECAAAECBAgQIECAAAECBAgQIECAAAECoocZIECAAAECBAgQIECAAAECBAgQIECAAAECBEIIiB4hrtEhCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAdHDDBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIhBESPENfoEAQIECBAgAABAgQIECBAgAABAgQIECBAgIDoYQYIECBAgAABAgQIECBAgAABAgQIECBAgACBEAKiR4hrdAgCBAgQIECAAAECBAgQIECAAAECBAgQIEBA9DADBAgQIECAAAECBAgQIECAAAECBAgQIECAQAgB0SPENToEAQIECBAgQIAAAQIECBAgQIAAAQIECBAgIHqYAQIECBAgQIAAAQIECBAgQIAAAQIECBAgQCCEgOgR4hodggABAgQIECBAgAABAgQIECBAgAABAgQIEBA9zAABAgQIECBAgAABAgQIECBAgAABAgQIECAQQkD0CHGNDkGAAAECBAgQIECAAAECBAgQIECAAAECBAiIHmaAAAECBAgQIECAAAECBAgQIECAAAECBAgQCCEgeoS4RocgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIERA8zQIAAAQIECBAgQIAAAQIECBAgQIAAAQIECIQQED1CXKNDECBAgAABAgQIECBAgAABAgQIECBAgAABAqKHGSBAgAABAgQIECBAgAABAgQIECBAgAABAgRCCIgeIa7RIQgQIECAAAECBAgQIECAAAECBAgQIECAAAHRwwwQIECAAAECBAgQIECAAAECBAgQIECAAAECIQREjxDX6BAECBAgQIAAAQIECBAgQIAAAQIECBAgQICA6GEGCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgRACokeIa3QIAgQIECBAgAABAgQIECBAgAABAgQIECBAQPQwAwQIECBAgAABAgQIECBAgAABAgQIECBAgEAIAdEjxDU6BAECBAgQIECAAAECBAgQIECAAAECBAgQICB6mAECBAgQIECAAAECBAgQIECAAAECBAgQIEAghIDoEeIaHYIAAQIECBAgQIAAAQIECBAgQIAAAQIECBAQPcwAAQIECBAgQIAAAQIECBAgQIAAAQIECBAgEEJA9AhxjQ5BgAABAgQIECBAgAABAgQIECBAgAABAgQIiB5mgAABAgQIECBAgAABAgQIECBAgAABAgQIEAghIHqEuEaHIECAAAECBAgQIECAAAECBAgQIECAAAECBEQPM0CAAAECBAgQIECAAAECBAgQIECAAAECBAiEEBA9QlyjQxAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKihxkgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIEQgiIHiGu0SEIECBAgAABAgQIECBAgAABAgQIECBAgAAB0cMMECBAgAABAgQIECBAgAABAgQIECBAgAABAiEERI8Q1+gQBAgQIECAAAECBAgQIECAAAECBAgQIECAgOhhBggQIECAAAECBAgQIECAAAECBAgQIECAAIEQAqJHiGt0CAIECBAgQIAAAQIECBAgQIAAAQIECBAgQED0MAMECBAgQIAAAQIECBAgQIAAAQIECBAgQIBACAHRI8Q1OgQBAgQIECBAgAABAgQIECBAgAABAgQIECAgepgBAgQIECBAgAABAgQIECBAgAABAgQIECBAIISA6BHiGh2CAAECBAgQIECAAAECBAgQIECAAAECBAgQED3MAAECBAgQIECAAAECBAgQIECAAAECBAgQIBBCQPQIcY0OQYAAAQIECBAgQIAAAQIECBAgQIAAAQIECIgeZoAAAQIECBAgQIAAAQIECBAgQIAAAQIECBAIISB6hLhGhyBAgAABAgQIECBAgAABAgQIECBAgAABAgREDzNAgAABAgQIECBAgAABAgQIECBAgAABAgQIhBAQPUJco0MQIECAAAECBAgQIECAAAECBAgQIECAAAECoocZIECAAAECBAgQIECAAAECBAgQIECAAAECBEIIiB4hrtEhCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAdHDDBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIhBESPENfoEAQIECBAgAABAgQIECBAgAABAgQIECBAgIDoYQYIECBAgAABAgQIECBAgAABAgQIECBAgACBEAKiR4hrdAgCBAgQIECAAAECBAgQIECAAAECBAgQIEBA9DADBAgQIECAAAECBAgQIECAAAECBAgQIECAQAgB0SPENToEAQIECBAgQIAAAQIECBAgQIAAAQIECBAgIHqYAQIECBAgQIAAAQIECBAgQIAAAQIECBAgQCCEgOgR4hodggABAgQIECBAgAABAgQIECBAgAABAgQIEBA9zAABAgQIECBAgAABAgQIECBAgAABAgQIECAQQkD0CHGNDkGAAAECBAgQIECAAAECBAgQIECAAAECBAiIHmaAAAECBAgQIECAAAECBAgQIECAAAECBAgQCCEgeoS4RocgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIERA8zQIAAAQIECBAgQIAAAQIECBAgQIAAAQIECIQQED1CXKNDECBAgAABAgQIECBAgAABAgQIECBAgAABAqKHGSBAgAABAgQIECBAgAABAgQIECBAgAABAgRCCIgeIa7RIQgQIECAAAECBAgQIECAAAECBAgQIECAAAHRwwwQIECAAAECBAgQIECAAAECBAgQIECAAAECIQREjxDX6BAECBAgQIAAAQIECBAgQIAAAQIECBAgQICA6GEGCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgRACokeIa3QIAgQIECBAgAABAgQIECBAgAABAgQIECBAQPQwAwQIECBAgAABAgQIECBAgAABAgQIECBAgEAIAdEjxDU6BAECBAgQIECAAAECBAgQIECAAAECBAgQICB6mAECBAgQIECAAAECBAgQIECAAAECBAgQIEAghIDoEeIaHYIAAQIECBAgQIAAAQIECBAgQIAAAQIECBAQPcwAAQIECBAgQIAAAQIECBAgQIAAAQIECBAgEEJA9AhxjQ5BgAABAgQIECBAgAABAgQIECBAgAABAgQIiB5mgAABAgQIECBAgAABAgQIECBAgAABAgQIEAghIHqEuEaHIECAAAECBAgQIECAAAECBAgQIECAAAECBEQPM0CAAAECBAgQIECAAAECBAgQIECAAAECBAiEEBA9QlyjQxAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKihxkgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIEQgiIHiGu0SEIECBAgAABAgQIECBAgAABAgQIECBAgAAB0cMMECBAgAABAgQIECBAgAABAgQIECBAgAABAiEERI8Q1+gQBAgQIECAAAECBAgQIECAAAECBAgQIECAgOhhBggQIECAAAECBAgQIECAAAECBAgQIECAAIEQAqJHiGt0CAIECBAgQIAAgQUCF5/+Lps3BX6we40DAQIECBAgQIAAAQIE4guIHvHv2AkJECBAgAABAiMLXPqn/z39yO/+2sgE6bUfvSl9990fHNrA4QkQIECAAAECBAgQGERA9Bjkoh2TAAECBAgQIDCogOiRRI9BZ9+xCRAgQIAAAQIECAwpIHoMee0OTYAAAQIECBAYRkD0ED2GGXYHJUCAAAECBAgQIEAgJdHDFBAgQIAAAQIECEQWED1Ej8jz7WwECBAgQIAAAQIECGwRED2MBAECBAgQIECAQGQB0UP0iDzfzkaAAAECBAgQIECAgOhhBggQIECAAAECBAYSED1Ej4HG3VEJECBAgAABAgQIEPBNDzNAgAABAgQIECAQWUD0ED0iz7ezESBAgAABAgQIECCwRUD0MBIECBAgQIAAAQKRBc4XPT7wgQ+kq6++unuCJ554Ij377LNzz/Haj96UvvvuD3Z/RgcgQIAAAQIECBAgQIDAeQVEj/MSeQEBAgQIECBAgEDHAueLHvfee2/au3dvxyf8P4/+8MMPp6efflr06P4mHYAAAQIECBAgQIAAgR0JiB474vNmAgQIECBAgACBiQuIHv681cRH1OMRIECAAAECBAgQIFBSQPQoqWktAgQIECBAgACBqQmIHqLH1GbS8xAgQIAAAQIECBAgUFFA9KiIa2kCBAgQIECAAIHmAqKH6NF8CD0AAQIECBAgQIAAAQKrExA9VmdtJwIECBAgQIAAgdULiB6ix+qnzo4ECBAgQIAAAQIECDQTED2a0duYAAECBAgQIEBgBQKih+ixgjGzBQECBAgQIECAAAECUxEQPaZyE56DAAECBAgQIECghoDoIXrUmCtrEiBAgAABAgQIECAwUQHRY6IX47EIECBAgAABAgSKCIgeokeRQbIIAQIECBAgQIAAAQJ9CIgefdyTpyRAgAABAgQIELgwAdFD9LiwyfEuAgQIECBAgAABAgS6FBA9urw2D02AAAECBAgQILCkgOgheiw5Kl5GgAABAgQIECBAgEAEAdEjwi06AwECBAgQIECAwCIB0UP08OkgQIAAAQIECBAgQGAgAdFjoMt2VAIECBAgQIDAgAKih+gx4Ng7MgECBAgQIECAAIFxBUSPce/eyQkQIECAAAECIwiIHqLHCHPujAQIECBAgAABAgQI/F8B0cMoECBAgAABAgQIRBYQPUSPyPPtbAQIECBAgAABAgQIbBEQPYwEAQIECBAgQIBAZAHRQ/SIPN/ORoAAAQIECBAgQICA6GEGCBAgQIAAAQIEBhIQPUSPgcbdUQkQIECAAAECBAgQ8E0PM0CAAAECBAgQIBBZQPQQPSLPt7MRIECAAAECBAgQILBFQPQwEgQIECBAgAABApEFRA/RI/J8OxsBAgQIECBAgAABAqKHGSBAgAABAgQIEBhIQPQQPQYad0clQIAAAQIECBAgQMA3PcwAAQIECBAgQIBAZAHRQ/SIPN/ORoAAAQIECBAgQIDAFgHRw0gQIECAAAECBAhEFhA9RI/I8+1sBAgQIECAAAECBAiIHmaAAAECBAgQIEBgIAHRQ/QYaNwdlQABAgQIECBAgAAB3/QwAwQIECBAgAABApEFRA/RI/J8OxsBAgQIECBAgAABAlsERA8jQYAAAQIECBAgEFlA9BA9Is+3sxEgQIAAAQIECBAgIHqYAQIECBAgQIAAgYEERA/RY6Bxd1QCBAgQIECAAAECBHzTwwwQIECAAAECBAhEFhA9RI/I8+1sBAgQIECAAAECBAhsERA9jAQBAgQIECBAgEBkAdFD9Ig8385GgAABAgQIECBAgIDoYQYIECBAgAABAgQGEhA9RI+Bxt1RCRAgQIAAAQIECBDwTQ8zQIAAAQIECBAgEFlA9BA9Is+3sxEgQIAAAQIECBAgsEVA9DASBAgQIECAAAECkQVED9Ej8nw7GwECBAgQIECAAAECoocZIECAAAECBAgQGEhA9BA9Bhp3RyVAgAABAgQIECBAwDc9zAABAgQIECBAgEBkAdFD9Ig8385GgAABAgQIECBAgMAWAdHDSBAgQIAAAQIECEQWED1Ej8jz7WwECBAgQIAAAQIECIgeZoAAAQIECBAgQGAgAdFD9Bho3B2VAAECBAgQIECAAAHf9DADBAgQIECAAAECkQVED9Ej8nw7GwECBAgQIECAAAECWwREDyNBgAABAgQIECAQWUD0ED0iz7ezESBAgAABAgQIECAgepgBAgQIECBAgACBgQRED9FjoHF3VAIECBAgQIAAAQIEfNPDDBAgQIAAAQIECEQWED1Ej8jz7WwECBAgQIAAAQIECGwRED2MBAECBAgQIECAQGQB0UP0iDzfzkaAAAECBAgQIECAgOhhBggQIECAAAECBAYSED1Ej4HG3VEJECBAgAABAgQIEPBNDzNAgAABAgQIECAQWUD0ED0iz7ezESBAgAABAgQIECCwRUD0MBIECBAgQIAAAQKRBUQP0SPyfDsbAQIECBAgQIAAAQKihxkgQIAAAQIECBAYSED0ED0GGndHJUCAAAECBAgQIEDANz3MAAECBAgQIECAQGQB0UP0iDzfzkaAAAECBAgQIECAwBYB0cNIECBAgAABAgQIRBYQPUSPyPPtbAQIECBAgAABAgQIiB5mgAABAgQIECBAYCAB0UP0GGjcHZUAAQIECBAgQIAAAd/0MAMECBAgQIAAAQKRBUQP0SPyfDsbAQIECBAgQIAAAQJbBEQPI0GAAAECBAgQIBBZQPQQPSLPt7MRIECAAAECBAgQICB6mAECBAgQIECAAIGBBEQP0WOgcXdUAgQIECBAgAABAgR808MMECBAgAABAgQIRBYQPUSPyPPtbAQIECBAgAABAgQIbBEQPYwEARFxszYAACAASURBVAIECBAgQIBAZAHRQ/SIPN/ORoAAAQIECBAgQICA6GEGCBAgQIAAAQIEBhIQPUSPgcbdUQkQIECAAAECBAgQ8E0PM0CAAAECBAgQIBBZQPQQPSLPt7MRIECAAAECBAgQILBFQPQwEgQIECBAgAABApEFRA/RI/J8OxsBAgQIECBAgAABAqKHGSBAgAABAgQIEBhIQPQQPQYad0clQIAAAQIECBAgQMA3PcwAAQIECBAgQIBAZAHRQ/SIPN/ORoAAAQIECBAgQIDAFgHRw0gQIECAAAECBAhEFhA9RI/I8+1sBAgQIECAAAECBAiIHmaAAAECBAgQIEBgIAHRQ/QYaNwdlQABAgQIECBAgAAB3/QwAwQIECBAgAABApEFRA/RI/J8OxsBAgQIECBAgAABAlsERA8jQYAAAQIECBAgEFlA9BA9Is+3sxEgQIAAAQIECBAgIHqYAQIECBAgQIAAgYEERA/RY6Bxd1QCBAgQIECAAAECBHzTwwwQIECAAAECBAhEFhA9RI/I8+1sBAgQIECAAAECBAhsERA9jAQBAgQIECBAgEBkAdFD9Ig8385GgAABAgQIECBAgIDoYQYIECBAgAABAgQGEhA9RI+Bxt1RCRAgQIAAAQIECBDwTQ8zQIAAAQIECBAgEFlA9BA9Is+3sxEgQIAAAQIECBAgsEVA9DASBAgQIECAAAECkQVED9Ej8nw7GwECBAgQIECAAAECoocZIECAAAECBAgQGEhA9BA9Bhp3RyVAgAABAgQIECBAwDc9zAABAgQIECBAgEBkAdFD9Ig8385GgAABAgQIECBAgMAWAdHDSBAgQIAAAQIECEQWED1Ej8jz7WwECBAgQIAAAQIECIgeZoAAAQIECBAgQGAgAdFD9Bho3B2VAAECBAgQIECAAAHf9DADBAgQIECAAAECkQVED9Ej8nw7GwECBAgQIECAAAECWwREDyNBgAABAgQIECAQWUD0ED0iz7ezESBAgAABAgQIECAgepgBAgQIECBAgACBgQRED9FjoHF3VAIECBAgQIAAAQIEfNPDDBAgQIAAAQIECEQWED1Ej8jz7WwECBAgQIAAAQIECGwRED2MBAECBAgQIECAQGQB0UP0iDzfzkaAAAECBAgQIECAgOhhBggQIECAAAECBAYSED1Ej4HG3VEJECBAgAABAgQIEPBNDzNAgAABAgQIECAQWUD0ED0iz7ezESBAgAABAgQIECCwRUD0MBIECBAgQIAAAQKRBUQP0SPyfDsbAQIECBAgQIAAAQKihxkgQIAAAQIECBAYSED0ED0GGndHJUCAAAECBAgQIEDANz3MAAECBAgQIECAQGQB0UP0iDzfzkaAAAECBAgQIECAwBYB0cNIECBAgAABAgQIRBYQPUSPyPPtbAQIECBAgAABAgQIiB5mgAABAgQIECBAYCAB0UP0GGjcHZUAAQIECBAgQIAAAd/0MAMECBAgQIAAAQKRBUQP0SPyfDsbAQIECBAgQIAAAQJbBEQPI0GAAAECBAgQIBBZQPQQPSLPt7MRIECAAAECBAgQICB6mAECBAgQIECAAIGBBEQP0WOgcXdUAgQIECBAgAABAgR808MMECBAgAABAgQIRBYQPUSPyPPtbAQIECBAgAABAgQIbBEQPYwEAQIECBAgQIBAZAHRQ/SIPN/ORoAAAQIECBAgQICA6GEGCBAgQIAAAQIECgpc+Ue/WXC18ktd9P0/S5ef/MOFC+/duzddcskl5Tde8Yovv/xyOn369Nxdf7B7T3rtmptW/ES2I1Be4LUf+8k0Wz9QfmErEiBAgAABAgQIxBHwTY84d+kkBAgQIECAAIEWAlf/wYPp8m8902JrexIgMJjAqYNHRI/B7txxCRAgQIAAAQLZAqJHNpk3ECBAgAABAgQI/H8CoodxIEBgVQKix6qk7UOAAAECBAgQ6FhA9Oj48jw6AQIECBAgQGACAqLHBC7BIxAYRED0GOSiHZMAAQIECBAgsBMB0WMnet5LgAABAgQIECAgepgBAgRWJSB6rEraPgQIECBAgACBjgVEj44vz6MTIECAAAECBCYgIHpM4BI8AoFBBESPQS7aMQkQIECAAAECOxEQPXai570ECBAgQIAAAQKihxkgQGBVAqLHqqTtQ4AAAQIECBDoWED06PjyPDoBAgQIECBAYAIC20WPK6+8Ml177bVNn3I2m6Vvf/vbxZ7hjTfeKLbWKhbatWvXX2yzb9++VWxnDwI7Enj99dfT888/v3AN0WNHvN5MgAABAgQIEBhDQPQY456dkgABAgQIECBQS2C76HHLLbekw4cP19raugQIBBM4Eyk3NjZEj2D36jgECBAgQIAAgZUKiB4r5bYZAQIECBAgQCCcgOgR7kodiEAzAdGjGb2NCRAgQIAAAQJxBESPOHfpJAQIECBAgACBFgKiRwt1exKIKSB6xLxXpyJAgAABAgQIrFRA9Fgpt80IECBAgAABAuEERI9wV+pABJoJiB7N6G1MgAABAgQIEIgjIHrEuUsnIUCAAAECBAi0EBA9Wqjbk0BMAdEj5r06FQECBAgQIEBgpQKix0q5bUaAAAECBAgQCCcgeoS7Ugci0ExA9GhGb2MCBAgQIECAQBwB0SPOXToJAQIECBAgQKCFgOjRQt2eBGIKiB4x79WpCBAgQIAAAQIrFRA9VsptMwIECBAgQIBAOAHRI9yVOhCBZgKiRzN6GxMgQIAAAQIE4giIHnHu0kkIECBAgAABAi0ERI8W6vYkEFNA9Ih5r05FgAABAgQIEFipgOixUm6bESBAgAABAgTCCYge4a7UgQg0ExA9mtHbmAABAgQIECAQR0D0iHOXTkKAAAECBAgQaCEgerRQtyeBmAKiR8x7dSoCBAgQIECAwEoFRI+VctuMAAECBAgQIBBOQPQId6UORKCZgOjRjN7GBAgQIECAAIE4AqJHnLt0EgIECBAgQIBACwHRo4W6PQnEFBA9Yt6rUxEgQIAAAQIEViogeqyU22YECBAgQIAAgXACoke4K3UgAs0ERI9m9DYmQIAAAQIECMQRED3i3KWTECBAgAABAgRaCIgeLdTtSSCmgOgR816digABAgQIECCwUgHRY6XcNiNAgAABAgQIhBMQPcJdqQMRaCYgejSjtzEBAgQIECBAII6A6BHnLp2EAAECBAgQINBCQPRooW5PAjEFRI+Y9+pUBAgQIECAAIGVCogeK+W2GQECBAgQIEAgnIDoEe5KHYhAMwHRoxm9jQkQIECAAAECcQREjzh36SQECBAgQIAAgRYCokcLdXsSiCkgesS8V6ciQIAAAQIECKxUQPRYKbfNCBAgQIAAAQLhBESPcFfqQASaCYgezehtTIAAAQIECBCIIyB6xLlLJyFAgAABAgQItBAQPVqo25NATAHRI+a9OhUBAgQIECBAYKUCosdKuW1GgAABAgQIEAgnIHqEu1IHItBMQPRoRm9jAgQIECBAgEAcAdEjzl06CQECBAgQIECghYDo0ULdngRiCogeMe/VqQgQIECAAAECKxUQPVbKbTMCBAgQIECAQDgB0SPclToQgWYCokczehsTIECAAAECBOIIiB5x7tJJCBAgQIAAAQItBKYePV588cX0wAMPtKBZuOdVV12V7rnnnkk90zIPc/LkyfTggw8u89KVvWbPnj3p7rvvXtl+pTY6ceJE+tjHPlZquSLr7N27N911111F1rrQRUSPC5XzPgIECBAgQIAAgf8nIHoYBgIECBAgQIAAgZ0I9BA9PvzhD+/kiMXfu2/fvm6jx3333VfcYycL7t+/v9vocf/99+/k6MXfe/3114sexVUtSIAAAQIECBAgsHIB0WPl5DYkQIAAAQIECIQSED3yr1P0yDdb9A7Ro5yl6FHO0koECBAgQIAAAQINBUSPhvi2JkCAAAECBAgEEBA98i9R9Mg3Ez3KmS1aSfSob2wHAgQIECBAgACBFQiIHitAtgUBAgQIECBAILCA6JF/uaJHvpnoUc5M9KhvaQcCBAgQIECAAIGGAqJHQ3xbEyBAgAABAgQCCIge+ZcoeuSbiR7lzESP+pZ2IECAAAECBAgQaCggejTEtzUBAgQIECBAIICA6JF/iaJHvpnoUc5M9KhvaQcCBAgQIECAAIGGAqJHQ3xbEyBAgAABAgQCCPQePd7znvekK664ovhNfPnLX05f+cpX5q4bNXq8973vTW9961uLWz777LPpueeem7tu1B8yf9/73pcuv/zy4pZf/OIX0/PPPz93Xb/pUZzbggQIECBAgAABAi0ERI8W6vYkQIAAAQIECMQR6D163HvvvWnv3r3FL+Sxxx5Ljz/++FDRY3NzM62trRW3fPTRR9OTTz45VPT4yEc+kq688srilo888kh66qmnRI/ishYkQIAAAQIECBCYjIDoMZmr8CAECBAgQIAAgS4FRI/51yZ6lBtn0aOcpehRztJKBAgQIECAAAECExUQPSZ6MR6LAAECBAgQINCJgOghepwV8E2P5T+0J06cSPfff//CN/imx3yaUwePpNn6geWhvZIAAQIECBAgQGA8AdFjvDt3YgIECBAgQIBASQHRQ/QQPfI/UaLHfLPZbJY2NjYWgooe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"
                 + "BAi0EhA9Wsk321f0KEMvemzvKHqUmTOrECBAgAABAgQIVBQQPSriWpoAAQIECBAg0EpA9Ggl32xf0aMMveghepwR8OetynyerEKAAAECBAgQaCIgejRhtykBAgQIECBAoK6A6FHXd4Krz4seZx7z6Xvfnt6+55IJPvE0H+lf/+eU7v135/55q3v+3lr6h4eunOYDr/ipnvmfN6W/f/cnF+569OjRtGfPnhU/1YVtd+zYsXT8+PG5bxY9LszUuwgQIECAAAECkxAQPSZxDR6CAAECBAgQIFBWQPQo69nBaouih//DPu/y7vitlB7/wrnR490/cXl6+Ff+Wt5CQV/9yT/5W+kf/dPfED2C3q9jESBAgAABAgRCCIgeIa7RIQgQIECAAAEC5woMEj2uueaadPjwYbf/psCnPvWp9KUvfWmuxb//1evST/74G5zOI/BHr9yUfuXXn0kvvvjiD73yQ+9bSx+4bexve5zxeeKbP5I+/vGPix4+TQQIECBAgAABAtMVED2mezeejAABAgQIECBwwQKDRI8L9hnwjT/7rivSgbdflt52xcUDnn77I3/jpe+nz371e+mZP35t2xe+681vfPzUX788Xbd+6VCGy/qcQfHnrYYaDYclQIAAAQIECExTQPSY5r14KgIECBAgQIDAjgREjx3xeTMBAhcmIHpcmJt3ESBAgAABAgQIFBQQPQpiWooAAQIECBAgMBUB0WMqN+E5CAwlIHoMdd0OS4AAAQIECBCYpoDoMc178VQE/jd7dxp/V1ke/P5OIECYIYwyhWgd4yw9/TjhQLUOda7a1mKfQ1WqxgEcCJMIJg6IdQhgndDGoRNaz6OeYxVrNS3IoEKwdezpCYKgCGEwRbDwuM2J52D2f++Qfd37WmvfX17v/3Wv9b3WfuPPtUOAAAECBAhMJCB6TMTnjwkQ2DoB0WPr3PwVAQIECBAgQIBAoIDoEYhpFAECBAgQIECgKwKiR1c24ToINCUgejS1bjdLgAABAgQIEOimgOjRzb24KgIECBAgQIDARAKix0R8/pgAga0TED22zs1fESBAgAABAgQIBAqIHoGYRhEgQIAAAQIEuiIgenRlE66DQFMCokdT63azBAgQIECAAIFuCoge3dyLqyJAgAABAgQITCTQSPQ48MADy9FHH/0rqnnljrLbNusnYuvTH99yxw7lltsX/vqS/+Ef/qFcfPHFQ2/hnve8ZznyyCP7dHtp13rWWWeVq666auj5j3nMY8oRRxyRdm1dOHhgMzCa6z/Rowtbcg0ECBAgQIAAgcYFRI/GHwC3T4AAAQIECMymQCPRY/HixeXE5ceW+9x+Xjngjst+FT5a+u/mslf59vzHl2vnHVpWr15d1qxZM/T2ly5dWpYtW9YSzVbf64oVK8q6deuG/v1TnvKU8rSnPW2rZ8/CHw5sBkaixyxs0z0QIECAAAECBGZUQPSY0cW6LQIECBAgQKBtgYaix7mvv3vZ647/aHrfF8w/srzno+eJHgFPgegxGlH0CHjIjCBAgAABAgQIEKgrIHrU9TWdAAECBAgQIJAi0Ej0eOETF5dTnz4vhbhLh147b0l55cd+LnoELOVNb3pTueKKK4ZO8qZH+dVbMN70CHjQjCBAgAABAgQIEKgnIHrUszWZAAECBAgQIJAm0Ej0WHHkoeUFv5Om3JmDby07lv/x8T1Ej4CNjIoeT33qU8vv//7vB5zS3xGiR39358oJECBAgAABAs0IiB7NrNqNEiBAgAABAi0JNBI93vmiQ8szH9zSYoff6x1lfnnBx/cXPQIeBdFjNKLoEfCQGUGAAAECBAgQIFBXQPSo62s6AQIECBAgQCBFQPRIYc86VPSIkz/ttNPKD3/4w6EDvenh563injSTCBAgQIAAAQIEqgmIHtVoDSZAgAABAgQI5AmIHnn2CSeLHnHoosdoS296xD1rJhEgQIAAAQIECFQSED0qwRpLgAABAgQIEMgUED0y9ad+tugRRz4qegz+PY/B2x4t/yd6tLx9906AAAECBAgQ6ImA6NGTRblMAgQIECBAgMBdERA97opW7z8resStUPQYbSl6xD1rJhEgQIAAAQIECFQSED0qwRpLgAABAgQIEMgUED0y9ad+tugRR37qqaeWK6+8cuhAb3r4Nz3injSTCBAgQIAAAQIEqgmIHtVoDSZAgAABAgQI5AmIHnn2CSeLHnHoo6LH0572tPKUpzwl7rAeTvKmRw+X5pIJECBAgAABAq0JiB6tbdz9EiBAgAABAk0IiB5NrHnTTYoecesWPUZbih5xz5pJBAgQIECAAAEClQREj0qwxhIgQIAAAQIEMgVEj0z9qZ8tesSRv/GNbyxXXXXV0IHe9PDzVnFPmkkECBAgQIAAAQLVBESParQGEyBAgAABAgTyBESPPPuEk0WPOPRR0ePpT396efKTnxx3WA8nedOjh0tzyQQIECBAgACB1gREj9Y27n4JECBAgACBJgREjybWvOkmRY+4dYseoy1Fj7hnzSQCBAgQIECAAIFKAqJHJVhjCRAgQIAAAQKZAqJHpv7UzxY94shPOeWU8qMf/WjoQG96+HmruCfNJAIECBAgQIAAgWoCokc1WoMJECBAgAABAnkCokeefcLJokcc+qjo8YxnPKM86UlPijush5O86dHDpblkAgQIECBAgEBrAqJHaxt3vwQIECBAgEATAqJHE2vedJOiR9y6RY/RlqJH3LNmEgECBAgQIECAQCUB0aMSrLEECBAgQIAAgUwB0SNTf+pnix5x5G94wxvK1VdfPXSgNz38vFXck2YSAQIECBAgQIBANQHRoxqtwQQIECBAgACBPAHRI88+4WTRIw59VPTTpeymAAAgAElEQVR45jOfWX7v934v7rAeTvKmRw+X5pIJECBAgAABAq0JiB6tbdz9EiBAgAABAk0IiB5NrHnTTYoecesWPUZbih5xz5pJBAgQIECAAAEClQREj0qwxhIgQIAAAQIEMgVEj0z9qZ8tesSRix6ix0Bgw5LDy/rDjop7sEwiQIAAAQIECBCYnoDoMT1rJxEgQIAAAQIEpiYgekyNugsHiR5xWzj55JPLNddcM3Sgn7fyb3rEPWkmESBAgAABAgQIVBMQParRGkyAAAECBAgQyBMQPfLsE04WPeLQR0WPZz3rWeWJT3xi3GE9nOTnrXq4NJdMgAABAgQIEGhNQPRobePulwABAgQIEGhCQPRoYs2bblL0iFu36DHaUvSIe9ZMIkCAAAECBAgQqCQgelSCNZYAAQIECBAgkCkgemTqT/1s0SOO/KSTTio//vGPhw70poeft4p70kwiQIAAAQIECBCoJiB6VKM1mAABAgQIECCQJyB65NknnCx6xKGPih7PfvazyxOe8IS4w3o4yZsePVyaSyZAgAABAgQItCYgerS2cfdLgAABAgQINCEgejSx5k03KXrErVv0GG0pesQ9ayYRIECAAAECBAhUEhA9KsEaS4AAAQIECBDIFBA9MvWnfrboEUd+4oknlp/85CdDB3rTw89bxT1pJhEgQIAAAQIECFQTED2q0RpMgAABAgQIEMgTED3y7BNOFj3i0EdFj+c85znld3/3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CPh5q5jvkykECBAgQIAAgRQB0SOF3aEECBAgQIAAgboCokdd3w5OFz1iljIqepx66qll3333jTmop1O86dHTxblsAgQIECBAgEBLAqJHS9t2rwQIECBAgEAzAqJHM6vedKOiR8zKRY/RjqJHzHNmCgECBAgQIECAQEUB0aMirtEECBAgQIAAgSwB0SNLPu1c0SOGXvQQPQYCft4q5vtkCgECBAgQIEAgRUD0SGF3KAECBAgQIECgroDoUde3g9NFj5iliB6ih+gR810yhQABAgQIECCQJiB6pNE7mAABAgQIECBQT0D0qGfb0cmiR8xiRkWP0047reyzzz4xB/V0ip+36uniXDYBAgQIECBAoCUB0aOlbbtXAgQIECBAoBkB0aOZVW+6UdEjZuWix2hH0SPmOTOFAAECBAgQIECgooDoURHXaAIECBAgQIBAloDokSWfdq7oEUMveogeAwH/pkfM98kUAgQIECBAgECKgOiRwu5QAgQIECBAgEBdAdGjrm8Hp4seMUsZFT3e9KY3lb333jvmoJ5O8aZHTxfnsgkQIECAAAECLQmIHi1t270SIECAAAECzQiIHs2setONih4xKxc9RjuKHjHPmSkECBAgQIAAAQIVBUSPirhGEyBAgAABAgSyBESPLPm0c0WPGHrRQ/QYCPh5q5jvkykECBAgQIAAgRQB0SOF3aEECBAgQIAAgboCokdd3w5OFz1iljIqeqxYsaLstddeMQf1dIo3PXq6OJdNgAABAgQIEGhJQPRoadvulQABAgQIEGhGQPRoZtWbblT0iFm56DHaUfSIec5MIUCAAAECBAgQqCggelTENZoAAQIECBAgkCUgemTJp50resTQix6ix0DAz1vFfJ9MIUCAAAECBAikCIgeKewOJUCAAAECBAjUFRA96vp2cLroEbOUUdFj5cqVZdGiRTEH9XSKNz16ujiXTYAAAQIECBBoSUD0aGnb7pUAAQIECBBoRkD0aGbVm25U9IhZuegx2lH0iHnOTCFAgAABAgQIEKgoIHpUxDWaAAECBAgQIJAlIHpkyaedK3rE0IseosdAwM9bxXyfTCFAgAABAgQIpAiIHinsDiVAgAABAgQI1BUQPer6dnC66BGzFNFD9BA9Yr5LphAgQIAAAQIE0gREjzR6BxMgQIAAAQIE6gmIHvVsOzpZ9IhZzKjo8eY3v7ns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IECg9wKiR+9X6AYIECBAgAABApsLiB7NPRXDosc2v/znO36w6tDiR622/HH4xJqbynEfv3azP9h5553LGWecseWDZvSToseMLtZtESBAgAABAgRmSUD0mKVtuhcCBAgQIECAwP8rIHo09ygMix6Df7z8O+9a3JzFJDd87tduLsd85CeixxyIosckT5e/JUCAAAECBAgQmIqA6DEVZocQIECAAAECBKYrIHpM17sDp4keMUsQPUY7ih4xz5kpBAgQIECAAAECFQVEj4q4RhMgQIAAAQIEsgREjyz5tHNFjxj6uaLHLrvsUt7+9rfHHNLjKaJHj5fn0gkQIECAAAECrQiIHq1s2n0SIECAAAECTQmIHk2te3CzokfMykWP0Y6iR8xzZgoBAgQIECBAgEBFAdGjIq7RBAgQIECAAIEsAdEjSz7tXNEjhl70ED0GAhuWHF7WH3ZUzENlCgECBAgQIECAwHQFRI/pejuNAAECBAgQIDAVAdFjKsxdOkT0iNmG6CF6iB4x3yVTCBAgQIAAAQJpAqJHGr2DCRAgQIAAAQL1BESPerYdnSx6xCxmruix6667ltNPPz3mkB5P8fNWPV6eSydAgAABAgQItCIgerSyafdJgAABAgQINCUgejS17sHNih4xKxc9RjuKHjHPmSkECBAgQIAAAQIVBUSPirhGEyBAgAABAgSyBESPLPm0c0WPGHrRQ/QYCPg3PWK+T6YQIECAAAECBFIERI8UdocSIECAAAECBOoKiB51fTs4XfSIWcpc0WO33XYrb3vb22IO6fEUb3r0eHkunQABAgQIECDQioDo0cqm3ScBAgQIECDQlIDo0dS6BzcresSsXPQY7Sh6xDxnphAgQIAAAQIECFQUED0q4hpNgAABAgQIEMgSED2y5NPOFT1i6EUP0WMg4OetYr5PphAgQIAAAQIEUgREjxR2hxIgQIAAAQIE6gqIHnV9Ozhd9IhZylzRY/fddy9vfetbYw7p8RRvevR4eS6dAAECBAgQINCKgOjRyqbdJwECBAgQINCUgOjR1LoHNyt6xKxc9BjtKHrEPGemECBAgAABAgQIVBQQPSriGk2AAAECBAgQyBIQPbLk084VPWLoRQ/RYyDg561ivk+mECBAgAABAgRSBESPFHaHEiBAgAABAgTqCogedX07OF30iFnKXNFjjz32KG95y1tiDunxFG969Hh5Lp0AAQIECBAg0IqA6NHKpt0nAQIECBAg0JSA6NHUugc3K3rErFz0GO0oesQ8Z6YQIECAAAECBAhUFBA9KuIaTYAAAQIECBDIEhA9suTTzhU9YuhFD9FjIODnrWK+T6YQIECAAAECBFIERI8UdocSIECAAAECBOoKiB51fTs4XfSIWYroIXqIHjHfJVMIECBAgAABAmkCokcavYMJECBAgAABAvUERI96th2dLHrELGau6LHnnnuWN7/5zTGH9HiKn7fq8fJcOgECBAgQIECgFQHRo5VNu08CBAgQIECgKQHRo6l1D25W9IhZuegx2lH0iHnOTCFAgAABAgQIEKgoIHpUxDWaAAECBAgQIJAlIHpkyaedK3rE0IseosdAwL/pEfN9MoUAAQIECBAgkCIgeqSwO5QAAQIECBAgUFdA9Kjr28HpokfMUuaKHosWLSorV66MOaTHU7zp0ePluXQCBAgQIECAQCsCokcrm3afBAgQIECAQFMCokdT6x7crOgRs3LRY7Sj6BHznJlCgAABAgQIECBQUUD0qIhrNAECBAgQIEAgS0D0yJJPO1f0iKEXPUSPgYCft4r5PplCgAABAgQIEEgRED1S2B1KgAABAgQIEKgrIHrU9e3gdNEjZilzRY+99tqrrFixIuaQHk/xpkePl+fSCRAgQIAAAQKtCIgerWzafRIgQIAAAQJNCYgeTa17cLOiR8zKRY/RjqJHpYHpPAAAIABJREFUzHNmCgECBAgQIECAQEUB0aMirtEECBAgQIAAgSwB0SNLPu1c0SOGXvQQPQYCft4q5vtkCgECBAgQIEAgRUD0SGF3KAECBAgQIECgroDoUde3g9NFj5ilzBU99t577/KmN70p5pAeT/GmR4+X59IJECBAgAABAq0IiB6tbNp9EiBAgAABAk0JiB5NrXtws6JHzMpFj9GOokfMc2YKAQIECBAgQIBARQHRoyKu0QQIECBAgACBLAHRI0s+7VzRI4Ze9BA9BgJ+3irm+2QKAQIECBAgQCBFQPRIYXcoAQIECBAgQKCugOhR17eD00WPmKXMFT322Wefctppp8Uc0uMp3vTo8fJcOgECBAgQIECgFQHRo5VNu08CBAgQIECgKQHRo6l1D25W9IhZuegx2lH0iHnOTCFAgAABAgQIEKgoIHpUxDWaAAECBAgQIJAlIHpkyaedK3rE0IseosdAwM9bxXyfTCFAgAABAgQIpAiIHinsDiVAgAABAgQI1BUQPer6dnC66BGzFNFD9BA9Yr5LphAgQIAAAQIE0gREjzR6BxMgQIAAAQIE6gmIHvVsOzpZ9IhZzFzRY9999y2nnnpqzCE9nuLnrXq8PJdOgAABAgQIEGhFQPRoZdPukwABAgQIEGhKQPRoat2DmxU9YlYueox2FD1injNTCBAgQIAAAQIEKgqIHhVxjSZAgAABAgQIZAmIHlnyaeeKHjH0oofoMRDwb3rEfJ9MIUCAAAECBAikCIgeKewOJUCAAAECBAjUFRA96vp2cLroEbOUuaLHfvvtV974xjfGHNLjKd706PHyXDoBAgQIECBAoBUB0aOVTbtPAgQIECBAoCkB0aOpdQ9uVvSIWbnoMdpR9Ih5zkwhQIAAAQIECBCoKCB6VMQ1mgABAgQIECCQJSB6ZMmnnSt6xNCLHqLHQMDPW8V8n0whQIAAAQIECKQIiB4p7A4lQIAAAQIECNQVED3q+nZwuugRs5S5osf+++9fTjnllJhDejzFmx49Xp5LJ0CAAAECBAi0IiB6tLJp90mAAAECBAg0JSB6NLXuwc2KHjErFz1GO4oeMc+ZKQQIECBAgAABAhUFRI+KuEYTIECAAAECBLIERI8s+bRzRY8YetFD9BgI+HmrmO+TKQQIECBAgACBFAHRI4XdoQQIECBAgACBugKiR13fDk4XPWKWMlf0uNvd7lbe8IY3xBzS4yne9Ojx8lw6AQIECBAgQKAVAdGjlU27TwIECBAgQKApAdGjqXUPblb0iFm56DHaUfSIec5MIUCAAAECBAgQqCggelTENZoAAQIECBAgkCUgemTJp50resTQix6ix0DAz1vFfJ9MIUCAAAECBAikCIgeKewOJUCAAAECBAjUFRA96vp2cLroEbOUuaLHAQccUE4++eSYQ3o8xZsePV6eSydAgAABAgQItCIgerSyafdJgAABAgQINCUgejS17sHNih4xKxc9RjuKHjHPmSkECBAgQIAAAQIVBUSPirhGEyBAgAABAgSyBESPLPm0c0WPGHrRQ/QYCPh5q5jvkykECBAgQIAAgRQB0SOF3aEECBAgQIAAgboCokdd3w5OFz1iliJ6iB6iR8x3yRQCBAgQIECAQJqA6JFG72ACBAgQIECAQD0B0aOebUcnix4xi5krehx44IHlpJNOijmkx1P8vFWPl+fSCRAgQIAAAQKtCIgerWzafRIgQIAAAQJNCYgeTa17cLOiR8zKRY/RjqJHzHNmCgECBAgQIECAQEUB0aMirtEECBAgQIAAgSwB0SNLPu1c0SOGXvQQPQYC/k2PmO+TKQQIECBAgACBFAHRI4XdoQQIECBAgACBugKiR13fDk4XPWKWMlf0OOigg8qJJ54Yc0iPp3jTo8fLc+kECBAgQIAAgVYERI9WNu0+CRAgQIAAgaYERI+m1j24WdEjZuWix2hH0SPmOTOFAAECBAgQIECgooDoURHXaAIECBAgQIBAloDokSWfdq7oEUMveogeAwE/bxXzfTKFAAECBAgQIJAiIHqksDuUAAECBAgQIFBXQPSo69vB6aJHzFLmih4HH3xwOeGEE2IO6fEUb3r0eHkunQABAgQIECDQioDo0cqm3ScBAgQIECDQlIDo0dS6BzcresSsXPQY7Sh6xDxnphAgQIAAAQIECFQUED0q4hpNgAABAgQIEMgSED2y5NPOHRY9Bhez9oxDyq4L56ddV98Oft8XbygrPnndZpftTY+NJKJH355o10uAAAECBAgQaFBA9Ghw6W6ZAAECBAgQmH0B0WP2d/wbdzhX9PjYK/Yrj7z3wuY8tvaGX/Ghn5RPX3zzZn9+yCGHlOOPP35rx87M34keM7NKN0KAAAECBAgQmF0B0WN2d+vOCBAgQIAAgYYFRI/mlj9X9Lj3AduVz59wQHMeW3PD3/jRLuUZp1029E9Fj40sosfWPFn+hgABAgQIECBAYKoCosdUuR1GgAABAgQIEJiOQCPRY9GiReVJT3rSdEw7fsoFF1xQvv/97w+9ykc96IByynP3KQfsfHNZuO0vOn4n07+8a/9rYVl77V7ljM9cX9auXTv0AjxrG1muu+668rnPfW7OJa1cubIMrPrw36pVq+bc94Ylh5f1hx3Vh9twjQQIECBAgAABAr8pIHp4JggQIECAAAECMyjQSPSYwc1Vv6UF286rfkbfDrjtF3f07ZI7e72iR2dX48IIECBAgAABAu0IiB7t7NqdEiBAgAABAg0JiB4NLdutEuiOgOjRnV24EgIECBAgQIBAswKiR7Ord+MECBAgQIDALAuIHrO8XfdGoLMCokdnV+PCCBAgQIAAAQLtCIge7ezanRIgQIAAAQINCYgeDS3brRLojoDo0Z1duBICBAgQIECAQLMCokezq3fjBAgQIECAwCwLiB6zvF33RqCzAqJHZ1fjwggQIECAAAEC7QiIHu3s2p0SIECAAAECDQmIHg0t260S6I6A6NGdXbgSAgQIECBAgECzAqJHs6t34wQIECBAgMAsCzQSPbbZZpuy4447zvImt/jebrnllnLbbbcN/fy2225bFi5cuMWzWv3gz3/+83LrrbcOvX3P2kaW//7v/y4bNmyY8xERPVr99rhvAgQIECBAgECHBESPDi3DpRAgQIAAAQIEogQaiR6LFy8uy5cvLwvLDWWPO35YdrrjuijBTs+5fd42v7zj/cq185b8+jpXr15d1qxZM/S6ly5dWpYtW9bpe+rCxX3yk58sn//854deypIlS8rrX//6Llxm6jWsW7eurFixQvRI3YLDCRAgQIAAAQIERgqIHh4QAgQIECBAgMAMCjQUPc487snl3refV7Ytw/8f+jO43V/f0rXzDi2Xz39yuaXsUkSPyTcteow3FD3GG/kEAQIECBAgQIBAsoDokbwAxxMgQIAAAQIEagg0Ej0e+7DF5cP/+7wagr2ZefW8e5dvzn+G6BGwsXPPPbf84z/+49BJ3vTYyCJ6BDxoRhAgQIAAAQIECNQVED3q+ppOgAABAgQIEEgRaCR6nPaCQ8uRD08R7tSh/7zNS8v7Vn/az1tNuJVR0ePud797ed3rXjfhCf3/c9Gj/zt0BwQIECBAgACBmRcQPWZ+xW6QAAECBAgQaFGgkejxiWMOLQ+/R4sLvvM9f33+c8oZHz1f9JjwURA9xgOKHuONfIIAAQIECBAgQCBZQPRIXoDjCRAgQIAAAQI1BESPGqqdnSl6xKzm7//+78sXvvCFocO86bGRRfSIedZMIUCAAAECBAgQqCggelTENZoAAQIECBAgkCUgemTJp5wresSwix7jHUWP8UY+QYAAAQIECBAgkCwgeiQvwPEECBAgQIAAgRoCokcN1c7OFD1iVjMqetzjHvcor33ta2MO6vEU0aPHy3PpBAgQIECAAIFWBESPVjbtPgkQIECAAIGmBESPptYtesSs++/+7u/KF7/4xaHDRI+NLKJHzLNmCgECBAgQIECAQEUB0aMirtEECBAgQIAAgSwB0SNLPuVc0SOGXfQY7yh6jDfyCQIECBAgQIAAgWQB0SN5AY4nQIAAAQIECNQQED1qqHZ2pugRs5pR0eO3fuu3ymte85qYg3o8RfTo8fJcOgECBAgQIECgFQHRo5VNu08CBAgQIECgKQHRo6l1ix4x6xY9xjuKHuONfIIAAQIECBAgQCBZQPRIXoDjCRAgQIAAAQI1BESPGqqdnSl6xKzmb//2b8t55503dJg3PTayiB4xz5opBAgQIECAAAECFQVEj4q4RhMgQIAAAQIEsgREjyz5lHNFjxj2UdHjnve8Zzn22GNjDurxFNGjx8tz6QQIECBAgACBVgREj1Y27T4JECBAgACBpgREj6bWLXrErFv0GO8oeow38gkCBAgQIECAAIFkAdEjeQGOJ0CAAAECBAjUEBA9aqh2dqboEbOav/mbvylf+tKXhg7zpsdGFtEj5lkzhQABAgQIECBAoKKA6FER12gCBAgQIECAQJaA6JEln3Ku6BHDPip63Ote9yrHHHNMzEE9niJ69Hh5Lp0AAQIECBAg0IqA6NHKpt0nAQIECBAg0JSA6NHUukWPmHWLHuMdRY/xRj5BgAABAgQIECCQLCB6JC/A8QQIECBAgACBGgKiRw3Vzs4UPWJW89d//dfln/7pn4YO86bHRhbRI+ZZM4UAAQIECBAgQKCigOhREddoAgQIECBAgECWgOiRJZ9yrugRwz4qetz73vcur371q2MO6vEU0aPHy3PpBAgQIECAAIFWBESPVjbtPgkQIECAAIGmBESPptYtesSsW/QY7yh6jDfyCQIECBAgQIAAgWQB0SN5AY4nQIAAAQIECNQQED1qqHZ2pugRs5pPfOIT5ctf/vLQYd702MgiesQ8a6YQIECAAAECBAhUFBA9KuIaTYAAAQIECBDIEhA9suRTzhU9YthFj/GOosd4I58gQIAAAQIECBBIFhA9khfgeAIECBAgQIBADQHRo4ZqZ2eKHjGrGRU97nOf+5RXvepVMQf1eIro0ePluXQCBAgQIECAQCsCokcrm3afBAgQIECAQFMCokdT6xY9YtYteox3FD3GG/kEAQIECBAgQIBAsoDokbwAxxMgQIAAAQIEagiIHjVUOztT9IhZzcc//vHyz//8z0OHedNjI4voEfOsmUKAAAECBAgQIFBRQPSoiGs0AQIECBAgQCBLQPTIkk85V/SIYR8VPe573/uWV77ylTEH9XiK6NHj5bl0AgQIECBAgEArAqJHK5t2"
                 + "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cbErPbJFrvRI56f0SOdkFAECBAgQIECAQEQBpUdEfEsTIECAAAECBPISUHrkJVvaeZUe2aJJSo/zP/rNsH379mEnctJjkEXpke05czUBAgQIECBAgEABAkqPApAtQYAAAQIECBAoWkDpUbR49PWUHtkiaFd6/O7v/m54y1vekm2RGlyt9KhBiG6BAAECBAgQIFB3AaVH3RN2fwQIECBAgEAjBZQejYtd6ZEtcqVHOj+lRzonowgQIECAAAECBCIKKD0i4luaAAECBAgQIJCXgNIjL9nSzqv0yBZNUnq848/+KezYsWPYiZz0GGRRemR7zlxNgAABAgQIECBQgIDSowBkSxAgQIAAAQIEihZQehQtHn09pUe2CNqVHr/3e78Xfu3Xfi3bIjW4WulRgxDdAgECBAgQIECg7gJKj7on7P4IECBAgACBRgooPRoXu9IjW+RKj3R+So90TkYRIECAAAECBAhEFFB6RMS3NAECBAgQIEAgLwGlR16ypZ1X6ZEtmqT0ePuf/mPYuXPnsBM56THIovTI9py5mgABAgQIECBAoAABpUcByJYgQIAAAQIECBQtoPQoWjz6ekqPbBEoPdL5KT3SORlFgAABAgQIECAQUUDpERHf0gQIECBAgACBvASUHnnJlnZepUe2aNqVHpdcckl485vfnG2RGlyt9KhBiG6BAAECBAgQIFB3AaVH3RN2fwQIECBAgEAjBZQejYtd6ZEtcqVHOj+lRzonowgQIECAAAECBCIKKD0i4luaAAECBAgQIJCXgNIjL9nSzqv0yBZNUnosu3ZN2LVr17ATOekxyKL0yPacuZoAAQIECBAgQKAAAaVHAciWIECAAAECBAgULaD0KFo8+npKj2wRtCs9fv/3fz+cc8452RapwdVKjxqE6BYIECBAgAABAnUXUHrUPWH3R4AAAQIECDRSQOnRuNiVHtkiV3qk81N6pHMyigABAgQIECBAIKKA0iMivqUJECBAgAABAnkJKD3yki3tvEqPbNEkpcfSP/lG2L1797ATOekxyKL0yPacuZoAAQIECBAgQKAAAaVHAciWIECAAAECBAgULaD0KFo8+npKj2wRtCs9/uAP/iAsXrw42yI1uFrpUYMQ3QIBAgQIECBAoO4CSo+6J+z+CBAgQIAAgUYKKD0aF7vSI1vkSo90fkqPdE5GESBAgAABAgQIRBRQ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"
                 + "HmNAG+WSoa9EWnzGvnD9tdu6OvnOXePCxZf1teZcN++isH72eV2dP8ZkL3+TtSwndpwMGNvTUNY8ncBKl6f86nGCLl3aRjVGQOnRmKjdKAECBAgQINAkAaVHk9J2rwQIjEFA6TEGtFEuGfpKpAuX7w5XXLKzu5MPzJaUHkn58djcC8Ljc5d3ff6iJ3z5m6xlObHjZMDYnoSy5ukEVro85VePE3Tp0jaqMQJKj8ZE7UYJECBAgACBJgkoPZqUtnslQGAMAkqPMaCNcEnP/t1h6ZqPtv7rNVduD8uW7O3e5P8204pPTA1rHxofNs5YGB5YVP0f3S3rm6xOBozt0S1rnk5gpctTfvU4QZcubaMaI6D0aEzUbpQAAQIECBBokoDSo0lpu1cCBMYgoPQYA9oIl+T5lUhDS952++Rw1929A79T0jvw4+zV//75sr7J6mTA2P5clDVPJ7DS5Sm/epygS5e2UY0RUHo0Jmo3SoAAAQIECDRJQOnRpLTdKwECYxBQeowBbYRLkh8wT94sT16fv/mFMHP6ge5N/m8z3fHVSeFLd05SenRd9vAJnQwYG3AZ3zR3Ait9lvKrxwm69Ikb2QgBpUcjYnaTBAgQIECAQNMElB5NS9z9EiDQoYDSo0OwUYYPfSXS5EkHw1c+t6l7E79kpnvvnxBuXD2l9W++veSGsLt3Wi7rFDVpGd9kTe7dyYCxPQFlzNMJrPRZyq8eJ+jSJ25kIwSUHo2I2U0SIECAAAECTRNQejQtcfdLgECHAkqPDsFGGT50OmDOrP5wy8ot3Zv4JTMlP2Ke/Jh58rrvrOr/6G4Z32R1MmDsj24Z83QCK32e8lN6pH9ajKyMgNKjMlHZKAECBAgQIEAgvYDSI72VkQQINFJA6dG92IdOByxbsmfgh8x3dG/il8306+9/ZevfrJtX/R/dLeObrE4GjP3RLWOeTmClz1N+9ThBlz5xIxshoPRoRMxukgABAgQIEGiagNKjaYm7XwIEOhRQenQINsrwpd/4aOjp3x0uXL47XHHJzu5N/LKZLr36+LDhuaPDxhnV//75Mr7J6mTA2B/dMubpBFb6POVXjxN06RM3shECSo9GxOwmCRAgQIAAgaYJKD2alrj7JUCgQwGlR4dgIwzv3b259TsQyev6a7eFxWfs687Ew8yy4hNTw9qHxofN005ufcVVlV9lfJPVyYCxP1FlzNMJrPR5yq8eJ+jSJ25kIwSUHo2I2U0SIECAAAECTRNQejQtcfdLgECHAkqPDsFGGD5t86PhzO/f3Pqvn7/5hTBz+oHuTDzMLLfdPjncdXdv6O+p/vfPl/FNVicDxv7oljFPJ7DS5ym/epygS5+4kY0QUHo0ImY3SYAAAQIECDRNQOnRtMTdLwECHQooPToEG2H40OmA5D9/5XObwuRJB7sz8TCz3Hv/hHDj6imt/7Jm6arQP743t7XynriMb7I6GTD21MuWpxNYnWUpv3qcoOssdaNrL6D0qH3EbpAAAQIECBBoooDSo4mpu2cCBDoQUHp0gDXK0AVrvxiS34KYM6s/3LJyS3cmHWGW5Kutkq+4Sl73nHNd2D7lxFzXy3Pysr3JmtyrkwFjT7xseTqB1VmW8qvHCbrOUje69gJKj9pH7AYJECBAgACBJgooPZqYunsmQKADAaVHB1ijDB36SqTT5u8PKz++tTuTjjDLzl3jwsWX9bX+67p5F4X1s8/Ldb08Jy/bm6xOBmRLu2x5OoHVWZ7yq8cJus5SN7r2AkqP2kfsBgkQIECAAIEmCig9mpi6eyZAoAMBpUcHWKMMHfpKpAuX7w5XXLKzO5OOMktSeiTlx2NzLwiPz12e+3p5LVC2N1mdDMiWdNnydAKrszzlV48TdJ2lbnTtBZQetY/YDRIgQIAAAQJNFFB6NDF190yAQAcCzSg9JoY1y/6yA5XOhvbs3x2Wrvlo66Jrrtweli3Z29kEYxh91YrjwhPre8LGGQvDA4suH8MM5bikbG+yOhmQ7bkoW55OYHWWp/zqcYKus9SNrr2A0qP2EbtBAgQIECBAoIkCSo8mpu6eCRDoQEDp0QHWCEOP3fZ0OOeem1r/9fprt4XFZ+zLPmmbGW67fXK46+7qf/982d5kdTIg26NbtjydwOosT/nV4wRdZ6kbXXsBpUftI3aDBAgQIECAQBMFlB5NTN09EyDQgYDSowOsEYYmP2CevFmevD5/8wth5vQD2SdtM8MdX50UvnTnpNDf0ztwimVV7uvltUBnb7Lme2InuUcnA7IlXaY8ncDqPEv51eMEXefJu6LWAkqPWsfr5ggQIECAAIGmCrQpPc4+++zwqle9qqk67rtAgXHjxhW4mqUIpBe49957w4YNG4a9YNecJWHLmZeln6zAkS9/c27blBPDz084+9AOZv90TZi4Z0vrn/t78n2zfOgrkSZPOhi+8rlNhSjce/+EcOPqwR/d/faSG8Lu3mmFrNvtRcr0Jmtyb04GZEu4THk6gdV5lvKrxwm6zpN3Ra0FktKj9w//74O1vkk3R4AAAQIECBBonMDBMPNrf9a4u3bDBAgQ6IbA7tecHbYtfF83pur6HBP27Qhv+ufVqeY9cPQx4XtvXpFq7FgGvf7H/0/o27QuzJnVH25ZOVi05P1KfsQ8+THz5PXDN/x+2Dp1dt5L5jL/y3N8bvrrw8OnvvfQWot+cFt4xY5nW/+cd449/XsOfU1Z0b/NsqlvXvjx638zF+MiJy1TnjM3/M9wyk/uat1+8SewJoZ7zrmuSPqurCW/oRN01cyvKw+BSSovcPConrBn4nG/vI+k9Dj/1FOVHpWP1g0QIECAAAECBAgQIECAAIHiBZYt2TPwQ+Y7Cln4paVHIQs2bJGif5ulYbyF3m6sE1iF3mSNF5NfjcN1a7kJJKXHE3PeEZ466S0hKD1yczYxAQIECBAgQIAAAQIECBCovcCFy3eHKy7ZWdh9Xnr18WHDc0cXtl6TFir6ZECTbIu+11gnsIq+z7quJ7+6Juu+ihB45JR3hZ/OWeqkRxHY1iBAgAABAgQIECBAgAABAnUUKOp0wJDdik9MDWsfGl9Hyqj35JPlUfm7vrgTWF0nLXRC+RXKbbEaCvzj22/6oq+3qmGwbokAAQIECBAgQIAAAQIECBQhUNTpgKF7ue32wR/d9equgE+Wd9cz9mxOYMVOINv68svm52oCPzz90ruVHp4DAgQIECBAgAABAgQIECBAYEwCRZce994/Idy4esqY9uqikQV8srxeT4cTWNXOU37Vzs/u4wv8+PW/uUbpET8HOyBAgAABAgQIECBAgAABApUTmDn9QEhKjyJfSo98tH2yPB/XWLMWXUY6gdXdpOXXXU+zNU9A6dG8zN0xAQIECBAgQIAAAQIECBDoisBp8/eHlR/f2pW50k6yc9e4cPFlfWmHG5dSwCfLU0JVZFjRb5orI7v7YMivu55ma55Aq/S44A1vODjuqKOad/fumAABAgQIECBAgAABAgQIEOhYoH/v3hAOHgxFnw4Y2mhSeiTlx1E9Pa3/8xqbwMEXXwwH9u1rXVz0m6wvPRnQM3Hi2G7AVYcJHNi/Pxw8cCDEPoF19IQJwfuMnT+c8uvczBXNFUj+tyv537CRXq3S4/fe+96DvdOmNVfJnRMgQIAAAQIECBAgQIAAAQKpBF7s7w9P3Xtva+w1V24Py5YMFCAFv65acVx4Yn1PmNTXF6bPn1/w6vVZbtszz4QXnniidUNFlx4vPRnwmsWLlVddeKyee+ihsGvTphD7BNbxc+aEKSec0IU7atYU8mtW3u42m8DGH/847N68ecRJlB7ZfF1NgAABAgQIECBAgAABAgQaJbBv587w7A9+0Lrnor8SaQh66JRAckLghDPPbJR/N2920yOPhB0bNkQ/GfDqRYvChMmTu3lrjZzrmfvuC/179kQ/gTV11qxw3EknNTKDLDctvyx6rm2agNKjaYm7XwIECBAgQIAAAQIECBAgkKNA8iZ58mZ58ir6dMDQbd3x1UnhS3dOap0OSE4JeI1NwCfLx+ZWxqucwCpjKun3JL/0VkYSSASUHp4DAgQIECBAgAABAgQIECBAoGsCQ1+JNHnSwfCVz23q2rydTPTSr0ZKTnr4TYhO9H451ifLx+ZWxqucwCpjKun3JL/0VkYSUHp4BggQIECAAAECBAgQIECAAIGuCgydDpgzqz/csnJLV+dOO9mG544Ol159fGv4zIULw8SpU9Neaty/Cfhkeb0eBSewqp2n/Kqdn90XL+CkR/HmViRAgAABAgQIECBAgAABArUV2PDgg2HP1q0DP2C+Z+CHzHdEuc+du8aFiy/ra63tR5PHFoFPlo/NraxXOYFV1mTS7Ut+6ZyMIjAkoPTwLBAgQIAAAQIECBAgQIAAAQJdE4j9lUhDN5Kc9EhOfEw54YRW8eHVmYBPlnfmVfbRTmCVPaHR9ye/audn98ULKD2KN7ciAQIECBAgQIAAAQIECBCopUD/nj0hKT2S1/XXbguLz9gX7T5XfGJqWPvQ+DCpry9Mnz8/2j6qurBPllc1ueH37QRWtfOUX7Xzs/viBZQexZtbkQABAgQIECBAgAABAgQI1FIg+Vqr5M255JX8nkfyux6xXrfdPjncdXdvOKqnJ7xm8eJY26jsuj5ZXtnoht24E1jVzlN+1c7P7osXUHoUb25FAgQIECBAgAABAgQIECBQS4Gh0wHJzX3+5hfCzOkHot3nN751TPjMfzm2tX5SeiTlh1d6AZ8sT29V9pFOYJU9odH3J79q52f3cQSUHnHcrUqAAAECBAgQIECAAAECBGon8MITT4Sk+EjKjqT0iPm69/4J4cbVU1pbePWiRWHC5Mkxt1O5tX2yvHKRjbhhJ7CqnaX8qp2f3ccRUHrEcbcqAQIECBAgQIAAAQIECBConcDQVyKdNn9/WPnxrVHvb+euceHiy/pae0h+yDz5QXOvdAI+WZ7OqSqjnMCqSlLD71N+1c7P7uMIKD3iuFuVAAECBAgQIECAAAECBAjUTqAspwOGYJPSIyk/ps6aFY476aTaeed1Qz5ZnpdsnHmdwIrj3q1V5dctSfM0SUDp0aS03SsBAgQIECBAgAABAgQIEMhRYP13vtOa/Zort4dlS/bmuFK6qa9acVx4Yn1PmNTXF6bPn5/uIqNaX1GWvNGavPw2S/UfCCewqp2h/Kqdn93HEVB6xHG3KgECBAgQIECAAAECBAgQqJXAvp07w7M/+EHrnq6/dltYfMa+6Pd32+2Tw11397Z+zyP5XQ+vdAI+WZ7OqSqjnMCqSlLD71N+1c7P7uMIKD3iuFuVAAECBAgQIECAAAECBAjUSmDXpk0h+URy8op9OmAI9o6vTgpfunNSOKqnJ7xm8eJaeed5Mz5Znqdu8XM7gVW8eTdXlF83Nc3VFAGlR1OSdp8ECBAgQIAAAQIECBAgQCBHgZd+JdLXvvx8jiuln/re+yeEG1dPaV1wwplnhp6JE9Nf3OCRPllen/CdwKp2lvKrdn52H09A6RHP3soECBAgQIAAAQIECBAgQKA2ApseeSTs2LAhzJnVH25ZuaUU97XhuaPDpVcf39rLzIULw8SpU0uxr7JvwifLy55Q+v05gZXeqowj5VfGVOypCgJKjyqkZI8ECBAgQIAAAQIECBAgQKDkAhsefDDs2bp14AfM9wz8kPmOUux2565x4eLL+lp7OX7OnDDlhBNKsa8yb8Iny8ucTud7cwKrc7MyXSG/MqVhL1USUHpUKS17JUCAAAECBAgQIECAAAECJRUo21ciDTElJz2SEx9TZ80Kx510Ukn1yrMtnywvTxbd2IkTWN1QjDeH/OLZW7naAkqPaudn9wQIECBAgAABAgQIECBAILpA/549ISk9ktc1V24fOO2xN/qehjaw4hNTw9qHxodJfX1h+vz5pdlXWTfik+VlTWZs+3ICa2xuZblKfmVJwj6qJqD0qFpi9kuAAAECBAgQIECAAAECBEomkHytVfLmXPJa+fGt4bT5+0uzw9tunxzuurs3HNXTE16zeHFp9lXWjfhkeVmTGdu+nMAam1tZrpJfWZKwj6oJKD2qlpj9EiBAgAABAgQIECBAgACBkgkkP2CevFmevD5/8wth5vQDpdlhUngkxUfySkqPpPzwGlnAJ8vr83Q4gVXtLOVX7fzsPq6A0iOuv9UJECBAgAABAgQIECBAgEDlBV544omQfC1SUnYkpUeZXvfePyHcuHpKa0uvXrQoTJg8WIB4DS/gk+X1eTKcwKp2lvKrdn52H1dA6RHX3+oECBAgQIAAAQIECBAgQKDyAs899FBIfgA7+Vqr5OutyvTauWtcuPiyvtaW+l73uvCKmTPLtL1S7cUny0sVR+bNOIGVmTDqBPKLym/xigsoPSoeoO0TIECAAAECBAgQIECAAIHYAmU9HTDkkpQeSflx/Jw5YcoJJ8TmKu36Plle2mjGtDEnsMbEVpqL5FeaKGykggJKjwqGZssECBAgQIAAAQIECBAgQKBMAuu/853Wdq64ZGe4cPnuMm2ttZerVhwXnljfEyb19YXp8+eXbn9l2ZBPlpclie7swwms7jjGmkV+seStWwcBpUcdUnQPBAgQIECAAAECBAgQIEAgksC+nTvDsz/4QWv166/dFhafsS/STkZeNvkh8+QHzZPf80h+18NreAGfLK/Xk+EEVrXzlF+187P7uAJKj7j+VidAgAABAgQIECBAgAABApUWSH7LI/lEcvJKfsQ8+THzsr3u+Oqk8KU7J4WjenrCaxYvLtv2SrMfnywvTRRd2YgTWF1hjDaJ/KLRW7gGAkqPGoToFggQIECAAAECBAgQIECAQCyBbc88E5ITAsnra19+PtY2Rl333vsnhBtXT2mNSUqPpPzwOlLAJ8vr81Q4gVXtLOVX7fzsPr6A0iN+BnZAgAABAgQIECBAgAABAgQqK7DpkUdC8lsQyWvypIOlvY/kh8yT18yFC8PEqVNLu8+YG/PJ8pj63V3bCazuehY9m/yKFrde3QSUHnVL1P0QIECAAAECBAgQIECAAIECBYa+EqnAJTMtdfycOWHKCSdkmqOOF/tkeb1SdQKr2nnKr9r52X18AaVH/AzsgAABAgQIECBAgAABAgQIVFZgw4MPhj1bt1Zm/32ve114xcyZldlvURv1yfKipItZxwmsYpzzWkV+ecmatykCSo+mJO0+CRAgQIAAAQIECBAgQIBADgLJ73kkn0quymv6/PlhUl9fVbZb2D59srww6kIWcgKrEObcFpFfbrQmboiA0qMhQbtNAgQIECBAgAABAgQIECCQh0D/nj2Hfsg8j/m7OWfPxIlh6kkn+SHzYVB9srybT1r8uZzAip9Blh3IL4ueawmEoPTwFBAgQIAAAQIECBAgQIAAAQIEGi7gk+X1egCcwKp2nvKrdn52H19A6RE/AzsgQIAAAQIECBAgQIAAAQIECEQV8MnyqPxdX9wJrK6TFjqh/ArltlgNBZQeNQzVLREgQIAAAQIECBAgQIAAAQIEOhHwyfJOtIwlQIAAgTILKD3KnI69ESBAgAABAgQIECBAgAABAgQKEPDJ8gKQLUGAAAEChQgoPQphtggBAgQIECBAgAABAgQIECBAgAABAgQIECCQt4DSI29h8xMgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKFCCg9CmG2CAECBAgQIECAAAECBAgQIECAAAECBAgQIJC3gNIjb2HzEyBAgAABAgQIECBAgAABAgQIECBAgAABAoUIKD0KYbYIAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkLeA0iNvYfMTIECAAAECBAgQIECAAAECBAgQIECAAAEChQgoPQphtggBAgQIECBAgAABAgQIECBAgAABAgQIECCQt4DSI29h8xMgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKFCCg9CmG2CAECBAgQIECAAAECBAgQIECAAAECBAgQIJC3gNIjb2HzEyBAgAABAgQIECBAgAABAgQIECBAgAABAoUIKD0KYbYIAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkLeA0iNvYfMTIECAAAECBAgQIECAAAECBAgQIECAAAEChQgoPQphtggBAgQIECBAgAABAgQIECBAgAABAgQIECCQt4DSI29h8xMgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKFCCg9CmG2CAECBAgQIECAAAECBAgQIECAAAECBAgQIJC3gNIjb2HzEyBAgAABAgQIECBAgAABAgQIECBAgAABAoUIKD0KYbYIAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkLeA0iNvYfMTIECAAAECBAgQIECAAAECBAgQIECAAAEChQgoPQphtggBAgQIECBAgAABAgQIECBAgAABAgQIECCQt4DSI29h8xMgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKFCCg9CmG2CAECBAgQIECAAAECBAgQIECAAAECBAgQIJAiUWEaAAAgAElEQVS3gNIjb2HzEyBAgAABAgQIECBAgAABAgQIECBAgAABAoUIKD0KYbYIAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkLeA0iNvYfMTIECAAAECBAgQIECAAAECBAgQIECAAAEChQgoPQphtggBAgQIECBAgAABAgQIECBAgAABAgQIECCQt4DSI29h8xMgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKFCCg9CmG2CAECBAgQIECAAAECBAgQIECAAAECBAgQIJC3gNIjb2HzEyBAgAABAgQIECBAgAABAgQIECBAgAABAoUIKD0KYbYIAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkLeA0iNvYfMTIECAAAECBAgQIECAAAECBAgQIECAAAEChQgoPQphtggBAgQIECBAgAABAgQIECBAgAABAgQIECCQt4DSI29h8xMgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKFCCg9CmG2CAECBAgQIECAAAECBAgQIECAAAECeQts3bo1bNu2LezYsSO8+OKL4aijjgrjxo1r/d/Q/z/cv+vkv6cdm/e9mp8AgeEFlB6eDAIECBAgQIAAAQIECBAgQIAAAQIEKimwZcuW8Pzzz4dNmza1/i8pOsryemk5MtL/366ASVuwpFmr23OVxdk+CLxcQOnhmSBAgAABAgQIECBAgAABAgQIECBAoDICmzdvDr/4xS9a/7dr167K7LtuG83r5Myxxx4bhv5vwoQJdWNzPwUIKD0KQLYEAQIECBAgQIAAAQIECBAgQIAAAQJjF9izZ0948sknwzPPPBN27tw59olcWSmBadOmhblz54YZM2ZUat82G1dA6RHX3+oECBAgQIAAAQIECBAgQIAAAQIECIwgkJzqSMqOp59+mlGDBWbOnNkqP44//vgGK7j1tAJKj7RSxhEgQIAAAQIECBAgQIAAAQIECBAgUIhA8tVVTzzxREhKDy8CiUDydVpnn3126OvrA0JgVAGlhweEAAECBAgQIECAAAECBAgQIECAAIFSCCQlx2OPPRY2btxYiv3YRLkEenp6wllnnRWSr73yIjCSgNLDs0GAAAECBAgQIECAAAECBAgQIECAQFSB7du3t8qO5Dc7vAiMJjB+/Phw7rnnht7eXlAEhhVQengwCBAgQIAAAQIECBAgQIAAAQIECBCIJvDw/9/enQdJWZyPA28QBAE5RA2KioAnCogooqAgiopiNCalMWpFE0m8jSmNt/FMmZRHEmPiWcY7njFqeUcigrcoHoiCAgIqHiy33Pyq51e7312YXXbmndl9Z/bTVVMbmffpfvrTk3/mme7+6KPw6aefNtr4Bi49gR49eoRevXqVXuIybhABRY8GYTYIAQIECBAgQIAAAQIECBAgQIAAAQLVBb777rswceLEMG/ePDAEchJo1qxZ2H///UOrVq1yivNw0xBQ9Gga62yWBAgQIECAAAECBAgQIECAAAECBFIj8PHHH4fJkyenJh+JlJ7ANttsE3bYYYfSS1zGRRdQ9Cg6sQEIECBAgAABAgQIECBAgAABAgQIEIgCc+fODR9++GGoqKgAQiCRQNu2bcO+++6bqA/B5Smg6FGe62pWBAgQIECAAAECBAgQIECAAAECBFIlMGPGjDBhwoRU5SSZ0hYYNmxYaNOmTWlPQvYFF1D0KDipDgkQIECAAAECBAgQIECAAAECBAgQqC4Qj7KKR1ppBAop0Ldv37DlllsWskt9lYGAokcZLKIpECBAgAABAgQIECBAgAABAgQIEEirwPvvvx+mT5+e1vTkVcICW2yxRdhll11KeAZSL4aAokcxVPVJgAABAgQIECBAgAABAgQIECBAoIkLrFy5MowfPz7Mnj27iUuYfrEE2rVrF4YOHVqs7vVbogKKHiW6cNImQIAAAQIECBAgQIAAAQIECBAgkFaBRYsWZQoe8+bNS2uK8ioTgYMOOii0aNGiTGZjGoUQUPQohKI+CBAgQIAAAQIECBAgQIAAAQIECBDICMyfPz+8+eab4fvvvydCoOgCe+65Z+jcuXPRxzFA6QgoepTOWsmUAAECBAgQIECAAAECBAgQIECAQKoF4s6OWPBYsmRJqvOUXPkI9OrVK/To0aN8JmQmiQUUPRIT6oAAAQIECBAgQIAAAQIECBAgQIAAgblz52YKHkuXLoVBoMEEunXrFnr37t1g4xko/QKKHulfIxkSIECAAAECBAgQIECAAAECBAgQSLVARUVFpuCxbNmyVOcpufIT2HjjjcPAgQPLb2JmlLeAokfedAIJECBAgAABAgQIECBAgAABAgQIEJgzZ06m4LF8+XIYBBpcoE2bNmHYsGENPq4B0yug6JHetZEZAQIECBAgQIAAAQIECBAgQIAAgVQLfPfdd5mCx4oVK4qWZ/fu3cM222wTevbsGbbccsuw2WabZV4dOnQIzzzzTLj88svzHnvTTTcNY8aMCatXrw6rVq2q+hv/97r+u7aY2mKz9Vf5bF0xaz4T/3vlypWZ/Gp7rfl+5X9X//c1/y3+d/V/q/zv2v7GNY/vxb+Vr1j4qnzFXT/xMvuGKIYdcsghoVmzZnl/DgSWl4CiR3mtp9kQIECAAAECBAgQIECAAAECBAgQaBCBWPB44403Ml98F7L1798/7LfffqFfv35hl112Ce3bt6+1+5tuuilcccUVeQ8fix7vvPNO3vEC1y0QPyeTJk0KDz74YHj44YfXHZDHE/vuu29o27ZtHpFCylFA0aMcV9WcCBAgQIAAAQIECBAgQIAAAQIECBRR4Ntvv83s8ChkwaNLly7hsssuCyNHjqx35tdee2247rrr6v38mg9usskm4d133807XmBuAoceemgYP358bkH1eHqPPfYIcS01AlFA0cPngAABAgQIECBAgAABAgQIECBAgACBegsUq+Bx1113hZ122qneecQH49FWN998c04x1R+Ol2BPmDAh73iBuQkk3ZlT22i9e/cO3bp1yy0ZT5etgKJH2S6tiREgQIAAAQIECBAgQIAAAQIECBAorEAseMQjreJdEoVq8Rf699xzT9h5551z7vK8884Ld999d85xlQGdO3cO7733Xt7xAnMTGDt2bDjqqKNyC6rH0z169Ai9evWqx5MeaQoCih5NYZXNkQABAgQIECBAgAABAgQIECBAgEBCgWIUPDp16hTuvffe0Ldv37yyO/3008Ojjz6aV2wMiuN/8MEHeccLzE1g9uzZYdddd80tqB5Px6PRdtttt3o86ZGmIKDo0RRW2RwJECBAgAABAgQIECBAgAABAgQIJBAoxqXl7dq1y+zw2H333fPO7IQTTgjPPfdc3vEdO3YMH374Yd7xAnMX2H777cPChQtzD6wjIq7j4MGDC9qnzkpXQNGjdNdO5gQIECBAgAABAgQIECBAgAABAgSKLlCMgkfLli0zOzwGDRqUKP94VFI8Minf1qFDhzBx4sR8w8XlIXDAAQcUvNDUpk2bMGzYsDyyEVKOAooe5biq5kSAAAECBAgQIECAAAECBAgQIECgAALFKHjEtOI9HIX4knrkyJHhnXfeyXum7du3Dx999FHe8QJzFxg1alR46qmncg+sI2K99dYLI0aMKGifOitdAUWP0l07mRMgQIAAAQIECBAgQIAAAQIECBAomsCcOXMyl5avWLGioGPcdtttBfuCet999w2ffPJJ3vnFI7Y+/vjjvOMF5i5wxRVXhJtuuin3wHVExKJHLH5oBBQ9fAYIECBAgAABAgQIECBAgAABAgQIEKghUFFRkSl4LF++vKAyN954Yzj88MML1me8D+SLL77Iu7+2bdsmKprkPXATDrzzzjvDBRdcUHCBuHMoHnOlEVD08BkgQIAAAQIECBAgQIAAAQIECBAgQKBKYO7cuZmCx7Jlywqqct1114V4B0ch24477hjmz5+fd5fxS/LJkyfnHS8wd4HRo0eHY489NvfAdUTEi8zjheYaAUUPnwECBAgQIECAAAECBAgQIECAAAECBDIC8+bNyxQ8li5dWlCRq666Khx//PEF7TN2ttVWW4WVK1fm3e8GG2wQpkyZkne8wNwFoveQIUNyD1xHxIABA8Kmm25a8H51WHoCih6lt2YyJkCAAAECBAgQIECAAAECBAgQIFBwgQULFoTXX389LFmypKB9X3zxxeGkk04qaJ+xs8WLF4dtt902Ub+tWrUKn332WaI+BOcmEHcQde/ePbegejy9yy67hC222KIeT3qk3AUUPcp9hc2PAAECBAgQIECAAAECBAgQIECAwDoEFi1alCl4xEJCIdvZZ58dzjrrrEJ2WdXX119/Hfr165eo7/XXXz9MnTo1UR+CcxfYbbfdwpdffpl7YB0R8aiznj17FrRPnZWmgKJHaa6brAkQIECAAAECBAgQIECAAAECBAgURCAWOmLBIxY+CtlOPfXUolxYXZlj3KGx9957J0q5ZcuWYdq0aYn6EJy7wI9+9KPMMWqFbLHgEQsfGgFFD58BAgQIECBAgAABAgQIECBAgAABAk1UIB5lFb98TnIZeDa6X/7yl+Hyyy8vquqECRPCwQcfnGiMFi1ahOnTpyfqo6kGr1ixIixfvjyv16233lrwoke3bt1C7969m+pymHc1AUUPHwcCBAgQIECAAAECBAgQIECAAAECTVAgfmEdd3jMnTu3oLM/+uijwzXXXFPQPrN1Nnbs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M2jXrl1mt9CoUaPWev/OO+8MF1xwQZEzr7v79ddfPxxwwAGNmoPB0yGg6JGOdZAFAQIECBAgQIAAAQIECBAgQIBAExJYvnx5ePbZZ7POuHnz5iEeR1WfNm/evLBy5cqsj6633nohFlZ69epV4/2ZM2dmvtx++umnax1ip512yjyT7WLrPfbYI8Q+amsdOnQIcWytcQQWLlxY67FpsXDx5ptvhvbt29dI7oYbbghXX311vRKOha/42ejZs2eN588888zw8MMPF/VzEXeTVFRUZB0jFviGDBlSrzl4qLwFFD3Ke33NjgABAgQIECBAgAABAgQIECBAIIUC8QLzeJF5tjZw4MDwyCOPrDPrp556Kuuv7isDr7/++nDkkUfW6CcecxW/sK7vHQynn356OO+882r0Ee/2qOsX9b/61a/C73//+3Xm74HCC8Qi2JpFruqjXHfddZmjqKq3888/P9x11105JRMLDC+++GLYfPPNa8TFi9G/+uqrrH397ne/C7EwkqTNmjUrDBgwIGsXcQfLoEGDknQvtkwEFD3KZCFNgwABAgQIECBAgAABAgQIECBAoHQEvv7661qPETriiCNC/OX9ulr8Evnee+/N+lj88vnxxx+v8V58Nsbk2o477ri1dgHEwsmtt96atat4d0j8QlxreIG4e+gXv/hF1oHj3S5vv/12jffibp8TTzwxr0Tj/Rm33HJLjdhYVLn22muz9rfPPvuE+++/P6+xKoPi0Wpxp0m2tskmm4S4C0kjoOjhM0CAAAECBAgQIECAAAECBAgQIECggQWmT5+euUsjW9t9990zOyX69etXZ1Z1HTN18803h5EjR1bFf/7552G//fYLixcvzmumscBx8MEHV8XW9Yv7+FC83HrrrbfOayxB+QvUVYw67bTTQtzVUdnibp9YQKjrqLJ1ZfLHP/4xHHvssVWPxc/0QQcdlDUs3rkR75GJF47Xt02aNKnqzpl4sXq8d2TZsmVZw+O9NbHYpxFQ9PAZIECAAAECBAgQIECAAAECBAgQINDAAvEX65MnT65z1G7duoXhw4dnXoMHD67xbLyI+sADD8waH48eil8WV2/x1/+13SFSn6l37do1s3sj3glR2eKX3fGS9GztD3/4Q/j5z39en649U0CBww47LLz11ltZe4w7fYYOHVr1XjzSqnoRJJ80dthhh/Df//63Rui+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6ro/5tBDD80806VLlxrxcczhw4eH+NnI1jp16hQGDRpU4JnqjkB2AUUPnwwCBAgQIECAAAECBAgQIECAAAECJSgQj7aKv85fvnx51uz79OkTnn766bXei0dfxS+ua9slUhlw7rnnhjPOOGOt+Pjv99xzT61i8cijjh07lqBo+aQc79pYsmRJrROKO36yXW7/xRdfhLfeeivES87jMVXxKLVYwIqfpfh3t912W6vPZcuWheOOO67OI7L69esXunbtWj7AZpJqAUWPVC+P5AgQIECAAAECBAgQIECAAAECBAjULjBp0qQwZcqUWh+IRxBdf/31a70/Z86czKXW8cvt+Io7Rrp37171BXc80qpv375rxa3r4ut4b0OM1RpXIH4m4mejrhZ3dhxwwAGJEl20aFE48cQTw5gxY2rtp127dmHo0KGJxhFMIBcBRY9ctDxLgAABAgQIECBAgAABAgQIECBAIEUC8SLxeEn5qlWras0q/go/HlFVV1u5cmVYb7316nzm5JNPDo8//nidzwwYMCBsuummKRJquqm8+uqrmZ0adbWzzjornH322Xkhvfzyy+Giiy6qs+gWO/aZyItXUAIBRY8EeEIJECBAgAABAgQIECBAgAABAgQINLbA9OnTM7s16mrZ7uaob97xjod4pNWaF2CvGe8uj/qKNsxz8+fPr3MHRmUW8eipuFvj8MMPr1diH3/8cbj99tvDvffeu87n410wO+ywwzqf8wCBQgooehRSU18ECBAgQIAAAQIECBAgQIAAAQIEGkEg3sPw1Vdf1Tny+uuvH0aNGpX5gru+uzFuu+22cMstt4RZs2bV2Xfr1q0zRxi1aNGiEWZvyNoEpk6dGj788MN6AcUCxT777JN59ejRI2yyySZhgw02yNz9El+vvPJKiLs7XnrppXr156izejF5qAgCih5FQNUlAQIECBAgQIAAAQIECBAgQIAAgYYUiMdcvfbaayH+XVdr3rx5GD58eBgyZEiIv/KPX27HV0VFRebL7fhL/vjFdjw2a12XnVeOtccee2T60NIn8Omnn4aPPvqoQRPr1KlT5lirli1bNui4BiMQBRQ9fA4IECBAgAABAgQIECBAgAABAgQIlIHAggULwuuvvx6WLFnSoLPp379/2GyzzRp0TIPlJjB58uRMMashmoJHQygboy4BRQ+fDwIECBAgQIAAAQIECBAgQIAAAQJlIjBv3rxM4WPZsmUNMqO+ffuGLbfcskHGMkgygZkzZ2bufomX1herbbHFFmHnnXd2zFmxgPVbLwFFj3oxeYgAAQIECBAgQIAAAQIECBAgQIBAaQjEI67il9v1PZoqn1m1bds29OnTJ3Tu3DmfcDGNJLBw4cLwwQcfhG+//bagGcQj02KxY6uttipovzojkI+Aokc+amIIECBAgAABAgQIECBAgAABAgQIpFzgk08+CfFV6Na1a9fQu3dvv+YvNGwD9hd3fcRLzuPOoCStWbNmoXv37plXvPRcI5AGAUWPNKyCHAgQIECAAAECBAgQIECAAAECBAgUQWD+/PmZL7dnzJiRuPd4UXmPHj1cWJ5YMj0dfPHFFyEWQOLOj1WrVtU7sfbt24cf/OAHYeuttw6tWrWqd5wHCTSEgKJHQygbgwABAgQIECBAgAABAgQIECBAgEAjCsRjjaZNm5Y58mrRokX1ziR+oR2LHXF3R/yrlafA6tWrM4WP+PlYunRp1Sve/xE/A5WvDh06ZD4HdnWU5+egXGal6FEuK2keBAgQIECAAAECBAgQIECAAAECBOohsGDBgswX3PFv/II7Xnoe/7Zs2bLqy+3WrVuHTTfdNHTq1KkePXqEAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAL1KXr8Pzjiof1aYASoAAAAAElFTkSuQmCC",
            fileName="modelica://OpenIPSL/../../../../../Downloads/autodraw 1_23_2024.png")}),
                                                                   Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end TCL_Building_no_noise;

  model PwTrasformerLTC_V_limiter_MPC
    OpenIPSL.Interfaces.PwPin p annotation (
      Placement(transformation(extent={{-120,-6},{-100,14}}),   iconTransformation(extent={{-130,
              -14},{-100,14}})));
    OpenIPSL.Interfaces.PwPin n annotation (
      Placement(transformation(extent={{60,0},{80,20}}),      iconTransformation(extent={{100,-14},
              {132,16}})));
    Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={0,-120}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={0,-120})));
    PwTransformer_LTC_limiter pwTransformer_LTC_limiter(
      R=1e-010,
      X=0.075,
      G=0,
      B=0) annotation (Placement(transformation(extent={{-30,4},{-10,24}})));
  equation
    connect(pwTransformer_LTC_limiter.p, p) annotation (Line(points={{-31.5,14},
            {-94,14},{-94,4},{-110,4}},  color={0,0,255}));
    connect(pwTransformer_LTC_limiter.r, u) annotation (Line(points={{-27.1,
            17.4},{-60,17.4},{-60,-62},{0,-62},{0,-120}}, color={0,0,127}));
    connect(pwTransformer_LTC_limiter.n, n) annotation (Line(points={{-8.5,14},
            {52,14},{52,10},{70,10}},  color={0,0,255}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-100,-100},
              {100,100}})),
      Icon(coordinateSystem(preserveAspectRatio = false, extent={{-100,-100},{
              100,100}}),                                                                    graphics={  Rectangle(extent={{-100,
                100},{100,-100}},                                                                                                                   lineColor = {0, 0, 255}), Ellipse(extent={{-22,16},
                {10,-16}},                                                                                                                                                                                            lineColor = {0, 0, 255},
              lineThickness =                                                                                                                                                                                                        0.5), Ellipse(extent={{-4,16},
                {28,-16}},                                                                                                                                                                                                        lineColor = {0, 0, 255},
              lineThickness =                                                                                                                                                                                                        0.5), Line(points={{-38,0},
                {-22,0}},                                                                                                                                                                                                        color = {0, 0, 255}, thickness = 0.5, smooth = Smooth.None), Line(points={{28,0},{
                44,0}},                                                                                                                                                                                                        color = {0, 0, 255}, thickness = 0.5, smooth = Smooth.None), Line(points={{-32,-26},
                {32,28},{22,26}},                                                                                                                                                                                                        color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5), Line(points={{32,28},
                {30,18}},                                                                                                                                                                                                        color = {0, 0, 255}, smooth = Smooth.None, thickness = 0.5)}));
  end PwTrasformerLTC_V_limiter_MPC;

  model TCL_simple_example_6
    extends Modelica.Icons.Example;

    OpenIPSL.Electrical.Loads.PSAT.TCL_randominit tCL_randominit(
      Sn=1e6,
      v0=1,
      p0=0.5,
      R=100,
      C=80,
      start0=1)
      annotation (Placement(transformation(extent={{62,-10},{82,10}})));
    OpenIPSL.Electrical.Buses.Bus bus
      annotation (Placement(transformation(extent={{30,-10},{50,10}})));
    Modelica.Blocks.Sources.Constant const(k=0)
      annotation (Placement(transformation(extent={{96,30},{76,50}})));
    OpenIPSL.Electrical.Branches.PwLine pwLine(
      R=0.0001,
      X=0.01,
      G=0,
      B=0) annotation (Placement(transformation(extent={{0,-10},{20,10}})));
    OpenIPSL.Electrical.Buses.Bus bus1
      annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
    OpenIPSL.Electrical.Machines.PSSE.GENCLS gENCLS
      annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  equation
    connect(bus.p, tCL_randominit.p)
      annotation (Line(points={{40,0},{60.5,0}},
                                               color={0,0,255}));
    connect(const.y, tCL_randominit.u) annotation (Line(points={{75,40},{52,40},
            {52,4.5188},{60,4.5188}},
                                  color={0,0,127}));
    connect(pwLine.n, bus.p)
      annotation (Line(points={{19,0},{40,0}}, color={0,0,255}));
    connect(bus1.p, pwLine.p)
      annotation (Line(points={{-20,0},{1,0}}, color={0,0,255}));
    connect(gENCLS.p, bus1.p)
      annotation (Line(points={{-40,0},{-20,0}}, color={0,0,255}));
    annotation (experiment(
        StopTime=1000,
        __Dymola_NumberOfIntervals=1000,
        __Dymola_Algorithm="Dassl"));
  end TCL_simple_example_6;

  model ULTC_VoltageControl
    "Under Load Tap Changer, continuous model, secondary voltage control"
    OpenIPSL.Interfaces.PwPin p
      annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
    OpenIPSL.Interfaces.PwPin n
      annotation (Placement(transformation(extent={{100,-10},{120,10}})));
    parameter Types.ApparentPower S_b=100e6 "System base power"
      annotation (Dialog(group="Power flow data"));
    parameter Types.Voltage Vbus1=400e3 "Sending end Bus nominal voltage"
      annotation (Dialog(group="Power flow data"));
    parameter Types.Voltage Vbus2=100e3 "Receiving end Bus nominal voltage"
      annotation (Dialog(group="Power flow data"));
    parameter Types.ApparentPower Sn=100e6 "Power rating"
      annotation (Dialog(group="Transformer data"));
    parameter Types.Voltage Vn=400e3 "Voltage rating"
      annotation (Dialog(group="Transformer data"));
    parameter Types.PerUnit rT=0.01 "Transformer resistance(transformer base)"
      annotation (Dialog(group="Transformer data"));
    parameter Types.PerUnit xT=0.2 "Transformer reactance(transformer base)"
      annotation (Dialog(group="Transformer data"));
    parameter Types.PerUnit v_0=1.008959700699460
      "Initial voltage magnitude of the controlled bus"
      annotation (Dialog(group="Voltage control"));
    parameter Real kT=4 "Nominal tap ratio (V1/V2)"
      annotation (Dialog(group="Voltage control"));
    parameter Real m0=0.98 "Initial tap ratio [pu/pu]"
      annotation (Dialog(group="Voltage control"));
    parameter Real m_max=0.98 "Maximum tap ratio [pu/pu]"
      annotation (Dialog(group="Voltage control"));
    parameter Real m_min=0.9785 "Minimum tap ratio [pu/pu]"
      annotation (Dialog(group="Voltage control"));
    parameter Types.PerUnit H=0.001 "Integral deviation"
      annotation (Dialog(group="Voltage control"));
    parameter Types.TimeAging K=0.10 "Inverse time constant"
      annotation (Dialog(group="Voltage control"));
  //  parameter Real deltam=0 "Tap ratio step (p.u./p.u.)"
  //    annotation (Dialog(group="Voltage control"));
  //  parameter Real d=0.05 "Dead zone percentage"
  //    annotation (Dialog(group="Voltage control"));
    Types.PerUnit m "Tap ratio";
    Types.PerUnit vref "Voltage Reference adjusted to V ratio";
    Types.PerUnit vk "Voltage at primary";
    Types.PerUnit vm(start=v_0) "Voltage at secondary";
    Types.Angle anglevk "Angle at primary";
    Types.Angle anglevm "Angle at secondary ";
    Modelica.Blocks.Interfaces.RealInput v_ref annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={0,-120})));
  protected
    parameter Types.Voltage V2=Vn/kT "Secondary voltage";
    parameter Types.Impedance Zn = Vn^2/Sn "Transformer base impedance";
    parameter Types.Impedance Zb = Vbus1^2/S_b "System base impedance";
    parameter Types.PerUnit r = rT * Zn/Zb "Resistance(system base)";
    parameter Types.PerUnit x = xT * Zn/Zb "Reactance(system base)";
    //parameter Types.PerUnit vref=v_ref*(V2/Vbus2);
  initial equation
    m = m0;
  equation
    vk = sqrt(p.vr^2 + p.vi^2);
    vm = sqrt(n.vr^2 + n.vi^2);
    anglevk = atan2(p.vi, p.vr);
    anglevm = atan2(n.vi, n.vr);

    vref=v_ref*(V2/Vbus2);
    r*p.ir - x*p.ii = 1/m^2*p.vr - 1/m*n.vr;
    r*p.ii + x*p.ir = 1/m^2*p.vi - 1/m*n.vi;
    r*n.ir - x*n.ii = n.vr - 1/m*p.vr;
    x*n.ir + r*n.ii = n.vi - 1/m*p.vi;
    der(m) = (-H*m) + K*(vm - vref);

    annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
              100}}), graphics={Ellipse(extent={{-46,30},{8,-30}}, lineColor={0,0,
            255}),Ellipse(extent={{-10,30},{44,-30}}, lineColor={0,0,255}),Line(
            points={{100,0},{44,0},{44,0}},
            color={0,0,255},
            smooth=Smooth.None),Line(
            points={{-100,0},{-46,0}},
            color={0,0,255},
            smooth=Smooth.None),Line(
            points={{70,0},{70,-40},{-36,-40},{-20,18},{-20,18}},
            color={0,0,255},
            smooth=Smooth.None),Line(
            points={{-30,6},{-20,18}},
            color={0,0,255},
            smooth=Smooth.None),Line(
            points={{-20,2},{-20,16}},
            color={0,0,255},
            smooth=Smooth.None),Text(
            extent={{-100,-40},{100,-100}},
            lineColor={0,128,0},
            textString="ULTC"),
          Text(
            extent={{-100,100},{100,40}},
            lineColor={0,0,255},
            textString="%name")}),
      Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2015-07-15</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
  end ULTC_VoltageControl;

  model TCL_simple_example_7
    extends Modelica.Icons.Example;

    OpenIPSL.Electrical.Loads.PSAT.TCL_randominit tCL_randominit
      annotation (Placement(transformation(extent={{60,-10},{80,10}})));
    OpenIPSL.Electrical.Buses.Bus bus(V_b=600)
      annotation (Placement(transformation(extent={{30,-10},{50,10}})));
    Modelica.Blocks.Sources.Constant const(k=0)
      annotation (Placement(transformation(extent={{96,30},{76,50}})));
    OpenIPSL.Electrical.Buses.Bus bus1(V_b=240)
      annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
    OpenIPSL.Electrical.Machines.PSSE.GENCLS gENCLS(V_b = 600)
      annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
    Modelica.Blocks.Sources.Ramp ramp(
      height=-0.2,
      duration=0.01,
      offset=1,
      startTime=2)
      annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
    ULTC_VoltageControl uLTC_VoltageControl(
      Vbus1(displayUnit="V") = 600,
      Vbus2(displayUnit="V") = 240,
      Vn(displayUnit="V") = 600,
      v_0=1,
      kT=600/240,
      m0=1,
      m_max=1.1,
      m_min=0.9,
      H=0.00001,
      K=100)
      annotation (Placement(transformation(extent={{-2,-10},{18,10}})));
  equation
    connect(bus.p, tCL_randominit.p)
      annotation (Line(points={{40,0},{58.5,0}},
                                               color={0,0,255}));
    connect(const.y, tCL_randominit.u) annotation (Line(points={{75,40},{52,40},{52,
            4.5188},{58,4.5188}}, color={0,0,127}));
    connect(gENCLS.p, bus1.p)
      annotation (Line(points={{-40,0},{-20,0}}, color={0,0,255}));
    connect(uLTC_VoltageControl.n, bus.p)
      annotation (Line(points={{19,0},{40,0}}, color={0,0,255}));
    connect(bus1.p, uLTC_VoltageControl.p)
      annotation (Line(points={{-20,0},{-3,0}}, color={0,0,255}));
    connect(ramp.y, uLTC_VoltageControl.v_ref)
      annotation (Line(points={{-19,-40},{8,-40},{8,-12}}, color={0,0,127}));
    annotation (experiment(
        StopTime=30,
        __Dymola_NumberOfIntervals=2000,
        __Dymola_Algorithm="Dassl"));
  end TCL_simple_example_7;

  model TCL_Building_no_noise_RECORD_DATA2
    Interfaces.PwPin pwPin
      annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    Electrical.Loads.PSAT.TCL_randominit TCL1(Sn=TCL_b,
      p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_1,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_1,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_1,
      R=tclparameters.tclparameters.r.R_1,
      C=tclparameters.tclparameters.c.C_1,
      var=0.5,                                start0=start0_TCL1) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-70,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL7(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_7,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_7,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_7,
      R=tclparameters.tclparameters.r.R_7,
      C=tclparameters.tclparameters.c.C_7,        start0=start0_TCL7) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={50,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL9(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_9,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_9,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_9,
      R=tclparameters.tclparameters.r.R_9,
      C=tclparameters.tclparameters.c.C_9,start0=start0_TCL9) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-70,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL10(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_10,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_10,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_10,
      R=tclparameters.tclparameters.r.R_10,
      C=tclparameters.tclparameters.c.C_10,        start0=start0_TCL10) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-50,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL11(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_11,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_11,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_11,
      R=tclparameters.tclparameters.r.R_11,
      C=tclparameters.tclparameters.c.C_11,  start0=start0_TCL11) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-30,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL13(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_13,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_13,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_13,
              R=tclparameters.tclparameters.r.R_13,
      C=tclparameters.tclparameters.c.C_13,start0=start0_TCL13) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={10,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL2(Sn=TCL_b,  p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_2,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_2,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_2,
              R=tclparameters.tclparameters.r.R_2,
      C=tclparameters.tclparameters.c.C_2,start0=start0_TCL2)
                                              annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-50,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL3(Sn=TCL_b,  p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_3,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_3,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_3,
              R=tclparameters.tclparameters.r.R_3,
      C=tclparameters.tclparameters.c.C_3,start0=start0_TCL3) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-30,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL4(Sn=TCL_b,  p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_4,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_4,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_4,
              R=tclparameters.tclparameters.r.R_4,
      C=tclparameters.tclparameters.c.C_4,start0=start0_TCL4) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-10,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL5(Sn=TCL_b,  p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_5,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_5,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_5,
              R=tclparameters.tclparameters.r.R_5,
      C=tclparameters.tclparameters.c.C_5,start0=start0_TCL5) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={10,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL6(Sn=TCL_b,  p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_6,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_6,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_6,
              R=tclparameters.tclparameters.r.R_6,
      C=tclparameters.tclparameters.c.C_6,start0=start0_TCL6) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={30,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL12(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_12,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_12,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_12,
             R=tclparameters.tclparameters.r.R_12,
      C=tclparameters.tclparameters.c.C_12,start0=start0_TCL12) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-10,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL14(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_14,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_14,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_14,
              R=tclparameters.tclparameters.r.R_14,
      C=tclparameters.tclparameters.c.C_14,start0=start0_TCL14) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={30,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL8(Sn=TCL_b,  p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_8,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_8,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_8,
              R=tclparameters.tclparameters.r.R_8,
      C=tclparameters.tclparameters.c.C_8,start0=start0_TCL8) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={70,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL15(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_15,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_15,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_15,
              R=tclparameters.tclparameters.r.R_15,
      C=tclparameters.tclparameters.c.C_15,start0=start0_TCL15) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={50,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL16(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_16,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_16,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_16,
              R=tclparameters.tclparameters.r.R_16,
      C=tclparameters.tclparameters.c.C_16,start0=start0_TCL16) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={70,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL17(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_17,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_17,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_17,
              R=tclparameters.tclparameters.r.R_17,
      C=tclparameters.tclparameters.c.C_17,start0=start0_TCL17) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-70,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL18(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_18,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_18,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_18,
              R=tclparameters.tclparameters.r.R_18,
      C=tclparameters.tclparameters.c.C_18,start0=start0_TCL18) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-50,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL19(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_19,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_19,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_19,
              R=tclparameters.tclparameters.r.R_19,
      C=tclparameters.tclparameters.c.C_19,start0=start0_TCL19) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-30,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL21(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_21,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_21,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_21,
              R=tclparameters.tclparameters.r.R_21,
      C=tclparameters.tclparameters.c.C_21,start0=start0_TCL21) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={10,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL20(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_20,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_20,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_20,
              R=tclparameters.tclparameters.r.R_20,
      C=tclparameters.tclparameters.c.C_20,start0=start0_TCL20) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-10,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL22(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_22,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_22,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_22,
              R=tclparameters.tclparameters.r.R_22,
      C=tclparameters.tclparameters.c.C_22,start0=start0_TCL22) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={30,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL23(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_23,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_23,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_23,
              R=tclparameters.tclparameters.r.R_23,
      C=tclparameters.tclparameters.c.C_23,start0=start0_TCL23) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={50,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL24(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_24,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_24,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_24,
              R=tclparameters.tclparameters.r.R_24,
      C=tclparameters.tclparameters.c.C_24,start0=start0_TCL24) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={70,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL25(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_25,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_25,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_25,
              R=tclparameters.tclparameters.r.R_25,
      C=tclparameters.tclparameters.c.C_25,start0=start0_TCL25) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-70,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL26(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_26,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_26,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_26,
              R=tclparameters.tclparameters.r.R_26,
      C=tclparameters.tclparameters.c.C_26,start0=start0_TCL26) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-50,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL27(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_27,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_27,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_27,
      R=tclparameters.tclparameters.r.R_27,
      C=tclparameters.tclparameters.c.C_27,start0=start0_TCL27) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-30,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL29(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_29,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_29,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_29,
              R=tclparameters.tclparameters.r.R_29,
      C=tclparameters.tclparameters.c.C_29,start0=start0_TCL29) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={10,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL28(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_28,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_28,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_28,
              R=tclparameters.tclparameters.r.R_28,
      C=tclparameters.tclparameters.c.C_28,start0=start0_TCL28) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-10,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL30(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_30,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_30,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_30,
              R=tclparameters.tclparameters.r.R_30,
      C=tclparameters.tclparameters.c.C_30,start0=start0_TCL30) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={30,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL31(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_31,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_31,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_31,
              R=tclparameters.tclparameters.r.R_31,
      C=tclparameters.tclparameters.c.C_31,start0=start0_TCL31) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={50,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL32(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_32,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_32,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_32,
              R=tclparameters.tclparameters.r.R_32,
      C=tclparameters.tclparameters.c.C_32,start0=start0_TCL32) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={70,-70})));
    parameter Integer start0_TCL1=1;
    parameter Integer start0_TCL2=1;
    parameter Integer start0_TCL3=1;
    parameter Integer start0_TCL4=1;
    parameter Integer start0_TCL5=1;
    parameter Integer start0_TCL6=1;
    parameter Integer start0_TCL7=1;
    parameter Integer start0_TCL8=1;
    parameter Integer start0_TCL9=1;
    parameter Integer start0_TCL10=1;
    parameter Integer start0_TCL11=1;
    parameter Integer start0_TCL12=1;
    parameter Integer start0_TCL13=1;
    parameter Integer start0_TCL14=1;
    parameter Integer start0_TCL15=1;
    parameter Integer start0_TCL16=1;
    parameter Integer start0_TCL17=1;
    parameter Integer start0_TCL18=1;
    parameter Integer start0_TCL19=1;
    parameter Integer start0_TCL20=1;
    parameter Integer start0_TCL21=1;
    parameter Integer start0_TCL22=1;
    parameter Integer start0_TCL23=1;
    parameter Integer start0_TCL24=1;
    parameter Integer start0_TCL25=1;
    parameter Integer start0_TCL26=1;
    parameter Integer start0_TCL27=1;
    parameter Integer start0_TCL28=1;
    parameter Integer start0_TCL29=1;
    parameter Integer start0_TCL30=1;
    parameter Integer start0_TCL31=1;
    parameter Integer start0_TCL32=1;
    parameter Modelica.Units.SI.ApparentPower TCL_b = 1400 "TCL Base Power";
    parameter Real P0=1;

    Modelica.Blocks.Interfaces.RealInput u1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,90}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,90})));
    Modelica.Blocks.Interfaces.RealInput u2 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,50}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,50})));
    Modelica.Blocks.Interfaces.RealInput u3 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,-50}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,-50})));
    Modelica.Blocks.Interfaces.RealInput u4 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,-90}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,-90})));
    ModelPredictiveControl.TCLParameterData.TCLParameters tclparameters(
        redeclare record TCLParameters =
          OpenIPSL.Examples.ModelPredictiveControl.TCLParameterData.TCL02)
      annotation (Placement(transformation(extent={{-126,58},{-106,78}})));
  equation
    connect(pwPin, TCL9.p)
      annotation (Line(points={{-100,0},{-70,0},{-70,18.5}},
                                                           color={0,0,255}));
    connect(TCL2.p, TCL9.p) annotation (Line(points={{-50,58.5},{-50,50},{-84,
            50},{-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL3.p, TCL9.p) annotation (Line(points={{-30,58.5},{-30,50},{-84,
            50},{-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL4.p, TCL9.p) annotation (Line(points={{-10,58.5},{-10,50},{-84,
            50},{-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL5.p, TCL9.p) annotation (Line(points={{10,58.5},{10,50},{-84,50},
            {-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL6.p, TCL9.p) annotation (Line(points={{30,58.5},{30,50},{-84,50},
            {-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL7.p, TCL9.p) annotation (Line(points={{50,58.5},{50,50},{-84,50},
            {-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL8.p, TCL9.p) annotation (Line(points={{70,58.5},{70,50},{-84,50},
            {-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL10.p, pwPin)
      annotation (Line(points={{-50,18.5},{-50,0},{-100,0}},
                                                           color={0,0,255}));
    connect(TCL11.p, pwPin)
      annotation (Line(points={{-30,18.5},{-30,0},{-100,0}},
                                                           color={0,0,255}));
    connect(TCL17.p, pwPin)
      annotation (Line(points={{-70,-18.5},{-70,0},{-100,0}},
                                                            color={0,0,255}));
    connect(TCL18.p, pwPin)
      annotation (Line(points={{-50,-18.5},{-50,0},{-100,0}},
                                                            color={0,0,255}));
    connect(TCL19.p, pwPin)
      annotation (Line(points={{-30,-18.5},{-30,0},{-100,0}},
                                                            color={0,0,255}));
    connect(TCL20.p, pwPin)
      annotation (Line(points={{-10,-18.5},{-10,0},{-100,0}},
                                                            color={0,0,255}));
    connect(TCL21.p, pwPin)
      annotation (Line(points={{10,-18.5},{10,0},{-100,0}},
                                                          color={0,0,255}));
    connect(TCL22.p, pwPin)
      annotation (Line(points={{30,-18.5},{30,0},{-100,0}},
                                                          color={0,0,255}));
    connect(TCL23.p, pwPin)
      annotation (Line(points={{50,-18.5},{50,0},{-100,0}},
                                                          color={0,0,255}));
    connect(TCL24.p, pwPin)
      annotation (Line(points={{70,-18.5},{70,0},{-100,0}},
                                                          color={0,0,255}));
    connect(TCL12.p, pwPin)
      annotation (Line(points={{-10,18.5},{-10,0},{-100,0}},
                                                           color={0,0,255}));
    connect(TCL13.p, pwPin)
      annotation (Line(points={{10,18.5},{10,0},{-100,0}},
                                                         color={0,0,255}));
    connect(TCL14.p, pwPin)
      annotation (Line(points={{30,18.5},{30,0},{-100,0}},
                                                         color={0,0,255}));
    connect(TCL15.p, pwPin)
      annotation (Line(points={{50,18.5},{50,0},{-100,0}},
                                                         color={0,0,255}));
    connect(TCL16.p, pwPin)
      annotation (Line(points={{70,18.5},{70,0},{-100,0}},
                                                         color={0,0,255}));
    connect(TCL1.p, pwPin) annotation (Line(points={{-70,58.5},{-70,50},{-84,50},
            {-84,0},{-100,0}},
                          color={0,0,255}));
    connect(TCL25.p, pwPin) annotation (Line(points={{-70,-58.5},{-70,-50},{-84,
            -50},{-84,0},{-100,0}},
                               color={0,0,255}));
    connect(TCL26.p, pwPin) annotation (Line(points={{-50,-58.5},{-50,-50},{-84,
            -50},{-84,0},{-100,0}},
                               color={0,0,255}));
    connect(TCL27.p, pwPin) annotation (Line(points={{-30,-58.5},{-30,-50},{-84,
            -50},{-84,0},{-100,0}},
                               color={0,0,255}));
    connect(TCL28.p, pwPin) annotation (Line(points={{-10,-58.5},{-10,-50},{-84,
            -50},{-84,0},{-100,0}},
                               color={0,0,255}));
    connect(TCL29.p, pwPin) annotation (Line(points={{10,-58.5},{10,-50},{-84,
            -50},{-84,0},{-100,0}},
                              color={0,0,255}));
    connect(TCL30.p, pwPin) annotation (Line(points={{30,-58.5},{30,-50},{-84,
            -50},{-84,0},{-100,0}},
                              color={0,0,255}));
    connect(TCL31.p, pwPin) annotation (Line(points={{50,-58.5},{50,-50},{-84,
            -50},{-84,0},{-100,0}},
                              color={0,0,255}));
    connect(TCL32.p, pwPin) annotation (Line(points={{70,-58.5},{70,-50},{-84,
            -50},{-84,0},{-100,0}},
                              color={0,0,255}));
    connect(TCL1.u, u1) annotation (Line(points={{-74.5188,58},{-74,58},{-74,54},{
            -84,54},{-84,90},{110,90}}, color={0,0,127}));
    connect(TCL2.u, u1) annotation (Line(points={{-54.5188,58},{-54,58},{-54,54},{
            -60,54},{-60,90},{110,90}}, color={0,0,127}));
    connect(TCL3.u, u1) annotation (Line(points={{-34.5188,58},{-34,58},{-34,54},{
            -40,54},{-40,90},{110,90}}, color={0,0,127}));
    connect(TCL4.u, u1) annotation (Line(points={{-14.5188,58},{-14,58},{-14,54},{
            -20,54},{-20,90},{110,90}}, color={0,0,127}));
    connect(TCL5.u, u1) annotation (Line(points={{5.4812,58},{6,58},{6,54},{0,54},
            {0,90},{110,90}}, color={0,0,127}));
    connect(TCL6.u, u1) annotation (Line(points={{25.4812,58},{26,58},{26,54},{20,
            54},{20,90},{110,90}}, color={0,0,127}));
    connect(TCL7.u, u1) annotation (Line(points={{45.4812,58},{46,58},{46,54},{40,
            54},{40,90},{110,90}}, color={0,0,127}));
    connect(TCL8.u, u1) annotation (Line(points={{65.4812,58},{66,58},{66,54},{60,
            54},{60,90},{110,90}}, color={0,0,127}));
    connect(TCL9.u, u2) annotation (Line(points={{-74.5188,18},{-74.5188,16},{-74,
            16},{-74,12},{-82,12},{-82,50},{110,50}}, color={0,0,127}));
    connect(TCL10.u, u2) annotation (Line(points={{-54.5188,18},{-54.5188,12},{-82,
            12},{-82,50},{110,50}}, color={0,0,127}));
    connect(TCL11.u, u2) annotation (Line(points={{-34.5188,18},{-34.5188,12},{-82,
            12},{-82,50},{110,50}}, color={0,0,127}));
    connect(TCL12.u, u2) annotation (Line(points={{-14.5188,18},{-14,18},{-14,12},
            {-82,12},{-82,50},{110,50}}, color={0,0,127}));
    connect(TCL13.u, u2) annotation (Line(points={{5.4812,18},{4,18},{4,12},{-82,12},
            {-82,50},{110,50}}, color={0,0,127}));
    connect(TCL14.u, u2) annotation (Line(points={{25.4812,18},{25.4812,12},{-82,12},
            {-82,50},{110,50}}, color={0,0,127}));
    connect(TCL15.u, u2) annotation (Line(points={{45.4812,18},{45.4812,12},{-82,12},
            {-82,50},{110,50}}, color={0,0,127}));
    connect(TCL16.u, u2) annotation (Line(points={{65.4812,18},{66,18},{66,12},{-82,
            12},{-82,50},{110,50}}, color={0,0,127}));
    connect(TCL24.u, u3) annotation (Line(points={{74.5188,-18},{74.5188,-10},{96,
            -10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL23.u, u3) annotation (Line(points={{54.5188,-18},{54.5188,-10},{96,
            -10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL22.u, u3) annotation (Line(points={{34.5188,-18},{36,-18},{36,-10},
            {96,-10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL21.u, u3) annotation (Line(points={{14.5188,-18},{14.5188,-10},{96,
            -10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL20.u, u3) annotation (Line(points={{-5.4812,-18},{-4,-18},{-4,-10},
            {96,-10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL19.u, u3) annotation (Line(points={{-25.4812,-18},{-25.4812,-10},{96,
            -10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL18.u, u3) annotation (Line(points={{-45.4812,-18},{-46,-18},{-46,-10},
            {96,-10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL17.u, u3) annotation (Line(points={{-65.4812,-18},{-65.4812,-10},{96,
            -10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL32.u, u4) annotation (Line(points={{74.5188,-58},{74.5188,-52},{74,
            -52},{74,-46},{88,-46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL31.u, u4) annotation (Line(points={{54.5188,-58},{54.5188,-46},{88,
            -46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL30.u, u4) annotation (Line(points={{34.5188,-58},{34.5188,-46},{88,
            -46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL29.u, u4) annotation (Line(points={{14.5188,-58},{14.5188,-46},{88,
            -46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL28.u, u4) annotation (Line(points={{-5.4812,-58},{-5.4812,-46},{88,
            -46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL27.u, u4) annotation (Line(points={{-25.4812,-58},{-25.4812,-46},{88,
            -46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL26.u, u4) annotation (Line(points={{-45.4812,-58},{-44,-58},{-44,-46},
            {88,-46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL25.u, u4) annotation (Line(points={{-65.4812,-58},{-65.4812,-46},{88,
            -46},{88,-90},{110,-90}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={28,108,200},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Bitmap(
            extent={{-100,-100},{100,100}},
            imageSource="iVBORw0KGgoAAAANSUhEUgAABj0AAAY9CAYAAACVB56QAAAgAElEQVR4XuzdX8zlxXnY8Vn+mLIuAt519m0g3ngRqEq7iJvAhRWblbK0N3UtV71JcxEnm1SGKG9VGTY4qKpkxL7FFy0O21qRixsVRZWCSlxkSoiJ7bo4F6GxqdfGGDtbaV2E3HgtUsKa48ZQNu023dfnvHtm35kzv3nmY8lXPmfmN595zl74q/OeXcl/CBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIBBHYFOIMjECBAgAABAgQIECBAgAABAgQIECBAgAABAgTSrvSPn3qDAwECBAgQIECAAAECBAgQIECAAAECBAgQIECga4Fd6TdFj65v0MMTIECAAAECBAgQIECAAAECBAgQIECAAAECfyEgehgEAgQIECBAgAABAgQIECBAgAABAgQIECBAIISA6BHiGh2CAAECBAgQIECAAAECBAgQIECAAAECBAgQED3MAAECBAgQIECAAAECBAgQIECAAAECBAgQIBBCQPQIcY0OQYAAAQIECBAgQIAAAQIECBAgQIAAAQIECIgeZoAAAQIECBAgQIAAAQIECBAgQIAAAQIECBAIISB6hLhGhyBAgAABAgQIECBAgAABAgQIECBAgAABAgREDzNAgAABAgQIECBAgAABAgQIECBAgAABAgQIhBAQPUJco0MQIECAAAECBAgQIECAAAECBAgQIECAAAECoocZIECAAAECBAgQIECAAAECBAgQIECAAAECBEIIiB4hrtEhCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAdHDDBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIhBESPENfoEAQIECBAgAABAgQIECBAgAABAgQIECBAgIDoYQYIECBAgAABAgQIECBAgAABAgQIECBAgACBEAKiR4hrdAgCBAgQIECAAAECBAgQIECAAAECBAgQIEBA9DADBAgQIECAAAECBAgQIECAAAECBAgQIECAQAgB0SPENToEAQIECBAgQIAAAQIECBAgQIAAAQIECBAgIHqYAQIECBAgQIAAAQIECBAgQIAAAQIECBAgQCCEgOgR4hodggABAgQIECBAgAABAgQIECBAgAABAgQIEBA9zAABAgQIECBAgAABAgQIECBAgAABAgQIECAQQkD0CHGNDkGAAAECBAgQIECAAAECBAgQIECAAAECBAiIHmaAAAECBAgQIECAAAECBAgQIECAAAECBAgQCCEgeoS4RocgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIERA8zQIAAAQIECBAgQIAAAQIECBAgQIAAAQIECIQQED1CXKNDECBAgAABAgQIECBAgAABAgQIECBAgAABAqKHGSBAgAABAgQIECBAgAABAgQIECBAgAABAgRCCIgeIa7RIQgQIECAAAECBAgQIECAAAECBAgQIECAAAHRwwwQIECAAAECBAgQIECAAAECBAgQIECAAAECIQREjxDX6BAECBAgQIAAAQIECBAgQIAAAQIECBAgQICA6GEGCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgRACokeIa3QIAgQIECBAgAABAgQIECBAgAABAgQIECBAQPQwAwQIECBAgAABAgQIECBAgAABAgQIECBAgEAIAdEjxDU6BAECBAgQIECAAAECBAgQIECAAAECBAgQICB6mAECBAgQIECAAAECBAgQIECAAAECBAgQIEAghIDoEeIaHYIAAQIECBAgQIAAAQIECBAgQIAAAQIECBAQPcwAAQIECBAgQIAAAQIECBAgQIAAAQIECBAgEEJA9AhxjQ5BgAABAgQIECBAgAABAgQIECBAgAABAgQIiB5mgAABAgQIECBAgAABAgQIECBAgAABAgQIEAghIHqEuEaHIECAAAECBAgQIECAAAECBAgQIECAAAECBEQPM0CAAAECBAgQIECAAAECBAgQIECAAAECBAiEEBA9QlyjQxAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKihxkgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIEQgiIHiGu0SEIECBAgAABAgQIECBAgAABAgQIECBAgAAB0cMMECBAgAABAgQIECBAgAABAgQIECBAgAABAiEERI8Q1+gQBAgQIECAAAECBAgQIECAAAECBAgQIECAgOhhBggQIECAAAECBAgQIECAAAECBAgQIECAAIEQAqJHiGt0CAIECBAgQIAAAQIECBAgQIAAAQIECBAgQED0MAMECBAgQIAAAQIECBAgQIAAAQIECBAgQIBACAHRI8Q1OgQBAgQIECBAgAABAgQIECBAgAABAgQIECAgepgBAgQIECBAgAABAgQIECBAgAABAgQIECBAIISA6BHiGh2CAAECBAgQIECAAAECBAgQIECAAAECBAgQED3MAAECBAgQIECAAAECBAgQIECAAAECBAgQIBBCQPQIcY0OQYAAAQIECBAgQIAAAQIECBAgQIAAAQIECIgeZoAAAQIECBAgQIAAAQIECBAgQIAAAQIECBAIISB6hLhGhyBAgAABAgQIECBAgAABAgQIECBAgAABAgREDzNAgAABAgQIECBAgAABAgQIECBAgAABAgQIhBAQPUJco0MQIECAAAECBAgQIECAAAECBAgQIECAAAECoocZIECAAAECBAgQIECAAAECBAgQIECAAAECBEIIiB4hrtEhCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAdHDDBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIhBESPENfoEAQIECBAgAABAgQIECBAgAABAgQIECBAgIDoYQYIECBAgAABAgQIECBAgAABAgQIECBAgACBEAKiR4hrdAgCBAgQIECAAAECBAgQIECAAAECBAgQIEBA9DADBAgQIECAAAECBAgQIECAAAECBAgQIECAQAgB0SPENToEAQIECBAgQIAAAQIECBAgQIAAAQIECBAgIHqYAQIECBAgQIAAAQIECBAgQIAAAQIECBAgQCCEgOgR4hodggABAgQIECBAgAABAgQIECBAgAABAgQIEBA9zAABAgQIECBAgAABAgQIECBAgAABAgQIECAQQkD0CHGNDkGAAAECBAgQIECAAAECBAgQIECAAAECBAiIHmaAAAECBAgQIECAAAECBAgQIECAAAECBAgQCCEgeoS4RocgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIERA8zQIAAAQIECBAgQIAAAQIECBAgQIAAAQIECIQQED1CXKNDECBAgAABAgQIECBAgAABAgQIECBAgAABAqKHGSBAgAABAgQIECBAgAABAgQIECBAgAABAgRCCIgeIa7RIQgQIECAAAECBAgQIECAAAECBAgQIECAAAHRwwwQIECAAAECBAgQIECAAAECBAgQIECAAAECIQREjxDX6BAECBAgQIAAAQIECBAgQIAAAQIECBAgQICA6GEGCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgRACokeIa3QIAgQIECBAgAABAgQIECBAgAABAgQIECBAQPQwAwQIECBAgAABAgQIECBAgAABAgQIECBAgEAIAdEjxDU6BAECBAgQIECAAAECBAgQIECAAAECBAgQICB6mAECBAgQIECAAAECBAgQIECAAAECBAgQIEAghIDoEeIaHYIAAQIECBAgQIAAAQIECBAgQIAAAQIECBAQPcwAAQIECBAgQIAAAQIECBAgQIAAAQIECBAgEEJA9AhxjQ5BgAABAgQIECBAgAABAgQIECBAgAABAgQIiB5mgAABAgQIECBAgAABAgQIECBAgAABAgQIEAghIHqEuEaHIECAAAECBAgQIECAAAECBAgQIECAAAECBEQPM0CAAAECBAgQIECAAAECBAgQIECAAAECBAiEEBA9QlyjQxAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKihxkgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIEQgiIHiGu0SEIECBAgAABAgQIECBAgAABAgQIECBAgAAB0cMMECBAgAABAgQIECBAgAABAgQIECBAgAABAiEERI8Q1+gQBAgQIECAAAECBAgQIECAAAECBAgQIECAgOhhBggQIECAAAECBAgQIECAAAECBAgQIECAAIEQAqJHiGt0CAIECBAgQIAAAQIECBAgQIAAAQIECBAgQED0MAMECBAgQIAAAQIECBAgQIAAAQIECBAgQIBACAHRI8Q1OgQBAgQIECBAgAABAgQIECBAgAABAgQIECAgepgBAgQIECBAgAABAgQIECBAgAABAgQIECBAIISA6BHiGh2CAAECBAgQIECAAAECBAgQIECAAAECBAgQED3MAAECBAgQIECAAAECBAgQIECAAAECBAgQIBBCQPQIcY0OQYAAAQIECBAgQIAAAQIECBAgQIAAAQIECIgeZoAAAQIECBAgQIAAAQIECBAgQIAAAQIECBAIISB6hLhGhyBAgAABAgQIECBAgAABAgQIECBAgAABAgREDzNAgAABAgQIECBAgAABAgQIECBAgAABAgQIhBAQPUJco0MQIECAAAECBAgQIECAAAECBAgQIECAAAECoocZIECAAAECBAgQIECAAAECBAgQIECAAAECBEIIiB4hrtEhCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAdHDDBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIhBESPENfoEAQIECBAgAABAgQIECBAgAABAgQIECBAgIDoYQYIECBAgAABAgQIECBAgAABAgQIECBAgACBEAKiR4hrdAgCBAgQIECAAAECBAgQIECAAAECBAgQIEBA9DADBAgQIECAAAECBAgQIECAAAECBAgQIECAQAgB0SPENToEAQIECBAgQIAAAQIECBAgQIAAAQIECBAgIHqYAQIECBAgQIAAAQIECBAgQIAAAQIECBAgQCCEgOgR4hodggABAgQIECBAgAABAgQIECBAgAABAgQIEBA9zAABAgQIECBAgAABAgQIECBAgAABAgQIECAQQkD0CHGNDkGAAAECBAgQIECAAAECBAgQIECAAAECBAiIHmaAAAECBAgQIECAAAECBAgQIECAAAECBAgQCCEgeoS4RocgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIERA8zQIAAAQIECBAgQIAAAQIECBAgQIAAAQIECIQQED1CXKNDECBAgAABAgQIECBAgAABAgQIECBAgAABAqKHGSBAgAABAgQIECBAgAABAgQIECBAgAABAgRCCIgeIa7RIQgQIECAAAECBAgQIECAAAECBAgQIECAAAHRwwwQIECAAAECBAgQIECAAAECBAgQIECAAAECIQREjxDX6BAECBAgQIAAAQIECBAgQIAAAQIECBAgQICA6GEGCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgRACokeIa3QIAgQIECBAgAABAgQIECBAgAABAgQIECBAQPQwAwQIECBAgAABAgQIECBAgAABAgQIECBAgEAIAdEjxDU6BAECBAgQIECAAAECBAgQIECAAAECBAgQICB6mAECBAgQIECAAAECBAgQIECAAAECBAgQIEAghIDoEeIaHYIAAQIECBAgQIAAAQIECBAgQIAAAQIECBAQPcwAAQIECBAgQIAAAQIECBAgQIAAAQIECBAgEEJA9AhxjQ5BgAABAgQIECBAgAABAgQIECBAgAABAgQIiB5mgAABAgQIECBAgAABAgQIECBAgAABAgQIEAghIHqEuEaHIECAAAECBAgQIECAAAECBAgQIECAAAECBEQPM0CAAAECBAgQIECAAAECBAgQIECAAAECBAiEEBA9QlyjQxAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKihxkgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIEQgiIHiGu0SEIECBAgAABAgQIECBAgAABAgQIECBAgAAB0cMMECBAgAABAgQIECBAgAABAgQIECBAgAABAiEERI8Q1+gQBAgQIECAAAECBAgQIECAAAECBAgQIECAgOhhBggQIECAAAECBAgQIECAAAECBAgQIECAAIEQAqJHiGt0CAIECBAgQIAAAQIECBAgQIAAAQIECBAgQED0MAMECBAgQIAAAQIECBAgQIAAAQIECBAgQIBACAHRI8Q1OgQBAgQIECBAgAABAgQIECBAgAABAgQIECAgepgBAgQIECBAgAABAgQIECBAgAABAgQIECBAIISA6BHiGh2CAAECBAgQIECAAAECBAgQIECAAAECBAgQED3MAAECBAgQIECAAAECBAgQIECAAAECBAgQIBBCQPQIcY0OQYAAAQIECBAgQIAAAQIECBAgQIAAAQIECIgeZoAAAQIECBAgQIAAAQIECBAgQIAAAQIECBAIISB6hLhGhyBAgAABAgQIECBAgAABAgQIECBAgAABAgREDzNAgAABAgQIECBAgAABAgQIECBAgAABAgQIhBAQPUJco0MQIECAAAECBAgQIECAAAECBAgQIECAAAECoocZIECAAAECBAgQIECAAAECBAgQIECAAAECBEIIiB4hrtEhCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAdHDDBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIhBESPENfoEAQIECBAgAABAgQIECBAgAABAgQIECBAgIDoYQYIECBAgAABAgQIECBAgAABAgQIECBAgACBEAKiR4hrdAgCBAgQIECAAAECBAgQIECAAAECBAgQIEBA9DADBAgQIECAAAECBAgQIECAAAECBAgQIECAQAgB0SPENToEAQIECBAgQIAAAQIECBAgQIAAAQIECBAgIHqYAQIECBAgQIAAAQIECBAgQIAAAQIECBAgQCCEgOgR4hodggABAgQIECBAgAABAgQIECBAgAABAgQIEBA9zAABAgQIECBAgAABAgQIECBAgAABAgQIECAQQkD0CHGNDkGAAAECBAgQIECAAAECBAgQIECAAAECBAiIHmaAAAECBAgQIECAAAECBAgQIECAAAECBAgQCCEgeoS4RocgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIERA8zQIAAAQIECBAgQIAAAQIECBAgQIAAAQIECIQQED1CXKNDECBAgAABAgQIECBAgAABAgQIECBAgAABAqKHGSBAgAABAgQIECBAgAABAgQIECBAgAABAgRCCIgeIa7RIQgQIECAAAECBAgQIECAAAECBAgQIECAAAHRwwwQIECAAAECBAgQIECAAAECBAgQIECAAAECIQREjxDX6BAECBAgQIAAAQIECBAgQIAAAQIECBAgQICA6GEGCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgRACokeIa3QIAgQIECBAgAABAgQIECBAgAABAgQIECBAQPQwAwQIECBAgAABAgQIECBAgAABAgQIECBAgEAIAdEjxDU6BAECBAgQIECAAAECBAgQIECAAAECBAgQICB6mAECBAgQIECAAAECBAgQIECAAAECBAgQIEAghIDoEeIaHYIAAQIECBAgQIAAAQIECBAgQIAAAQIECBAQPcwAAQIECBAgQIAAAQIECBAgQIAAAQIECBAgEEJA9AhxjQ5BgAABAgQIECBAgAABAgQIECBAgAABAgQIiB5mgAABAgQIECBAgAABAgQIECBAgAABAgQIEAghIHqEuEaHIECAAAECBAgQIECAAAECBAgQIECAAAECBEQPM0CAAAECBAgQIECAAAECBAgQIECAAAECBAiEEBA9QlyjQxAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKihxkgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIEQgiIHiGu0SEIECBAgAABAgQIECBAgAABAgQIECBAgAAB0cMMECBAgAABAgQIECBAgAABAgQIECBAgAABAiEERI8Q1+gQBAgQIECAAAECBAgQIECAAAECBAgQIECAgOhhBggQIECAAAECBAgQIECAAAECBAgQIECAAIEQAqJHiGt0CAIECBAgQIAAgQUCF5/+Lps3BX6we40DAQIECBAgQIAAAQIE4guIHvHv2AkJECBAgAABAiMLXPqn/z39yO/+2sgE6bUfvSl9990fHNrA4QkQIECAAAECBAgQGERA9Bjkoh2TAAECBAgQIDCogOiRRI9BZ9+xCRAgQIAAAQIECAwpIHoMee0OTYAAAQIECBAYRkD0ED2GGXYHJUCAAAECBAgQIEAgJdHDFBAgQIAAAQIECEQWED1Ej8jz7WwECBAgQIAAAQIECGwRED2MBAECBAgQIECAQGQB0UP0iDzfzkaAAAECBAgQIECA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I+a9OhUBAgQIECBAYKUCosdKuW1GgAABAgQIEAgnIHqEu1IHItBMQPRoRm9jAgQIECBAgEAcAdEjzl06CQECBAgQIECghYDo0ULdngRiCogeMe/VqQgQIECAAAECKxUQPVbKbTMCBAgQIECAQDgB0SPclToQgWYCokczehsTIECAAAECBOIIiB5x7tJJCBAgQIAAAQItBKYePV588cX0wAMPtKBZuOdVV12V7rnnnkk90zIPc/LkyfTggw8u89KVvWbPnj3p7rvvXtl+pTY6ceJE+tjHPlZquSLr7N27N911111F1rrQRUSPC5XzPgIECBAgQIAAgf8nIHoYBgIECBAgQIAAgZ0I9BA9PvzhD+/kiMXfu2/fvm6jx3333VfcYycL7t+/v9vocf/99+/k6MXfe/3114sexVUtSIAAAQIECBAgsHIB0WPl5DYkQIAAAQIECIQSED3yr1P0yDdb9A7Ro5yl6FHO0koECBAgQIAAAQINBUSPhvi2JkCAAAECBAgEEBA98i9R9Mg3Ez3KmS1aSfSob2wHAgQIECBAgACBFQiIHitAtgUBAgQIECBAILCA6JF/uaJHvpnoUc5M9KhvaQcCBAgQIECAAIGGAqJHQ3xbEyBAgAABAgQCCIge+ZcoeuSbiR7lzESP+pZ2IECAAAECBAgQaCggejTEtzUBAgQIECBAIICA6JF/iaJHvpnoUc5M9KhvaQcCBAgQIECAAIGGAqJHQ3xbEyBAgAABAgQCCPQePd7znvekK664ovhNfPnLX05f+cpX5q4bNXq8973vTW9961uLWz777LPpueeem7tu1B8yf9/73pcuv/zy4pZf/OIX0/PPPz93Xb/pUZzbggQIECBAgAABAi0ERI8W6vYkQIAAAQIECMQR6D163HvvvWnv3r3FL+Sxxx5Ljz/++FDRY3NzM62trRW3fPTRR9OTTz45VPT4yEc+kq688srilo888kh66qmnRI/ishYkQIAAAQIECBCYjIDoMZmr8CAECBAgQIAAgS4FRI/51yZ6lBtn0aOcpehRztJKBAgQIECAAAECExUQPSZ6MR6LAAECBAgQINCJgOghepwV8E2P5T+0J06cSPfff//CN/imx3yaUwePpNn6geWhvZIAAQIECBAgQGA8AdFjvDt3YgIECBAgQIBASQHRQ/QQPfI/UaLHfLPZbJY2NjYWgooe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"
                 + "BAi0EhA9Wsk321f0KEMvemzvKHqUmTOrECBAgAABAgQIVBQQPSriWpoAAQIECBAg0EpA9Ggl32xf0aMMveghepwR8OetynyerEKAAAECBAgQaCIgejRhtykBAgQIECBAoK6A6FHXd4Krz4seZx7z6Xvfnt6+55IJPvE0H+lf/+eU7v135/55q3v+3lr6h4eunOYDr/ipnvmfN6W/f/cnF+569OjRtGfPnhU/1YVtd+zYsXT8+PG5bxY9LszUuwgQIECAAAECkxAQPSZxDR6CAAECBAgQIFBWQPQo69nBaouih//DPu/y7vitlB7/wrnR490/cXl6+Ff+Wt5CQV/9yT/5W+kf/dPfED2C3q9jESBAgAABAgRCCIgeIa7RIQgQIECAAAEC5woMEj2uueaadPjwYbf/psCnPvWp9KUvfWmuxb//1evST/74G5zOI/BHr9yUfuXXn0kvvvjiD73yQ+9bSx+4bexve5zxeeKbP5I+/vGPix4+TQQIECBAgAABAtMVED2mezeejAABAgQIECBwwQKDRI8L9hnwjT/7rivSgbdflt52xcUDnn77I3/jpe+nz371e+mZP35t2xe+681vfPzUX788Xbd+6VCGy/qcQfHnrYYaDYclQIAAAQIECExTQPSY5r14KgIECBAgQIDAjgREjx3xeTMBAhcmIHpcmJt3ESBAgAABAgQIFBQQPQpiWooAAQIECBAgMBUB0WMqN+E5CAwlIHoMdd0OS4AAAQIECBCYpoDoMc178VQE/jd7dxp/V1ke/P5OIECYIYwyhWgd4yw9/TjhQLUOda7a1mKfQ1WqxgEcCJMIJg6IdQhgndDGoRNaz6OeYxVrNS3IoEKwdezpCYKgCGEwRbDwuM2J52D2f++Qfd37WmvfX17v/3Wv9b3WfuPPtUOAAAECBAhMJCB6TMTnjwkQ2DoB0WPr3PwVAQIECBAgQIBAoIDoEYhpFAECBAgQIECgKwKiR1c24ToINCUgejS1bjdLgAABAgQIEOimgOjRzb24KgIECBAgQIDARAKix0R8/pgAga0TED22zs1fESBAgAABAgQIBAqIHoGYRhEgQIAAAQIEuiIgenRlE66DQFMCokdT63azBAgQIECAAIFuCoge3dyLqyJAgAABAgQITCTQSPQ48MADy9FHH/0rqnnljrLbNusnYuvTH99yxw7lltsX/vqS/+Ef/qFcfPHFQ2/hnve8ZznyyCP7dHtp13rWWWeVq666auj5j3nMY8oRRxyRdm1dOHhgMzCa6z/Rowtbcg0ECBAgQIAAgcYFRI/GHwC3T4AAAQIECMymQCPRY/HixeXE5ceW+9x+Xjngjst+FT5a+u/mslf59vzHl2vnHVpWr15d1qxZM/T2ly5dWpYtW9YSzVbf64oVK8q6deuG/v1TnvKU8rSnPW2rZ8/CHw5sBkaixyxs0z0QIECAAAECBGZUQPSY0cW6LQIECBAgQKBtgYaix7mvv3vZ647/aHrfF8w/srzno+eJHgFPgegxGlH0CHjIjCBAgAABAgQIEKgrIHrU9TWdAAECBAgQIJAi0Ej0eOETF5dTnz4vhbhLh147b0l55cd+LnoELOVNb3pTueKKK4ZO8qZH+dVbMN70CHjQjCBAgAABAgQIEKgnIHrUszWZAAECBAgQIJAm0Ej0WHHkoeUFv5Om3JmDby07lv/x8T1Ej4CNjIoeT33qU8vv//7vB5zS3xGiR39358oJECBAgAABAs0IiB7NrNqNEiBAgAABAi0JNBI93vmiQ8szH9zSYoff6x1lfnnBx/cXPQIeBdFjNKLoEfCQGUGAAAECBAgQIFBXQPSo62s6AQIECBAgQCBFQPRIYc86VPSIkz/ttNPKD3/4w6EDvenh563injSTCBAgQIAAAQIEqgmIHtVoDSZAgAABAgQI5AmIHnn2CSeLHnHoosdoS296xD1rJhEgQIAAAQIECFQSED0qwRpLgAABAgQIEMgUED0y9ad+tugRRz4qegz+PY/B2x4t/yd6tLx9906AAAECBAgQ6ImA6NGTRblMAgQIECBAgMBdERA97opW7z8resStUPQYbSl6xD1rJhEgQIAAAQIECFQSED0qwRpLgAABAgQIEMgUED0y9ad+tugRR37qqaeWK6+8cuhAb3r4Nz3injSTCBAgQIAAAQIEqgmIHtVoDSZAgAABAgQI5AmIHnn2CSeLHnHoo6LH0572tPKUpzwl7rAeTvKmRw+X5pIJECBAgAABAq0JiB6tbdz9EiBAgAABAk0IiB5NrHnTTYoecesWPUZbih5xz5pJBAgQIECAAAEClQREj0qwxhIgQIAAAQIEMgVEj0z9qZ8tesSRv/GNbyxXXXXV0IHe9PDzVnFPmkkECBAgQIAAAQLVBESParQGEyBAgAABAgTyBESPPPuEk0WPOPRR0ePpT396efKTnxx3WA8nedOjh0tzyQQIECBAgACB1gREj9Y27n4JECBAgACBJgREjybWvOkmRY+4dYseoy1Fj7hnzSQCBAgQIECAAIFKAqJHJVhjCRAgQIAAAQKZAqJHpv7UzxY94shPOeWU8qMf/WjoQG96+HmruCfNJAIECBAgQIAAgWoCokc1WoMJECBAgAABAnkCokeefcLJokcc+qjo8YxnPKM86UlPijush5O86dHDpblkAgQIECBAgEBrAqJHaxt3vwQIECBAgEATAqJHE2vedJOiR9y6RY/RlqJH3LNmEgECBAgQIECAQCUB0aMSrLEECBAgQIAAgUwB0SNTf+pnix5x5G94wxvK1VdfPXSgNz38vFXck2YSAQIECBAgQIBANQHRoxqtwQQIECBAgACBPAHRI88+4WTRIw59VPTTpeymAAAgAElEQVR45jOfWX7v934v7rAeTvKmRw+X5pIJECBAgAABAq0JiB6tbdz9EiBAgAABAk0IiB5NrHnTTYoecesWPUZbih5xz5pJBAgQIECAAAEClQREj0qwxhIgQIAAAQIEMgVEj0z9qZ8tesSRix6ix0Bgw5LDy/rDjop7sEwiQIAAAQIECBCYnoDoMT1rJxEgQIAAAQIEpiYgekyNugsHiR5xWzj55JPLNddcM3Sgn7fyb3rEPWkmESBAgAABAgQIVBMQParRGkyAAAECBAgQyBMQPfLsE04WPeLQR0WPZz3rWeWJT3xi3GE9nOTnrXq4NJdMgAABAgQIEGhNQPRobePulwABAgQIEGhCQPRoYs2bblL0iFu36DHaUvSIe9ZMIkCAAAECBAgQqCQgelSCNZYAAQIECBAgkCkgemTqT/1s0SOO/KSTTio//vGPhw70poeft4p70kwiQIAAAQIECBCoJiB6VKM1mAABAgQIECCQJyB65NknnCx6xKGPih7PfvazyxOe8IS4w3o4yZsePVyaSyZAgAABAgQItCYgerS2cfdLgAABAgQINCEgejSx5k03KXrErVv0GG0pesQ9ayYRIECAAAECBAhUEhA9KsEaS4AAAQIECBDIFBA9MvWnfrboEUd+4oknlp/85CdDB3rTw89bxT1pJhEgQIAAAQIECFQTED2q0RpMgAABAgQIEMgTED3y7BNOFj3i0EdFj+c85znld3/3d+MO6+Ekb3r0cGkumQABAgQIECDQmoDo0drG3S8BAgQIECDQhIDo0cSaN92k6BG3btFjtKXoEfesmUSAAAECBAgQIFBJQPSoBGssAQIECBAgQCBTQPTI1J/62aJHHPkJJ5xQrr322qEDvenh563injSTCBAgQIAAAQIEqgmIHtVoDSZAgAABAgQI5AmIHnn2CSeLHnHoo6LHH/zBH5Qjjjgi7rAeTvKmRw+X5pIJECBAgAABAq0JiB6tbdz9EiBAgAABAk0IiB5NrHnTTYoecesWPUZbih5xz5pJBAgQIECAAAEClQREj0qwxhIgQIAAAQIEMgVEj0z9qZ8tesSRix6ix0Bgw5LDy/rDjop7sEwiQIAAAQIECBCYnoDoMT1rJxEgQIAAAQIEpiYgekyNugsHiR5xWzj++OPLT3/606ED/byVf9Mj7kkziQABAgQIECBAoJqA6FGN1mACBAgQIECAQJ6A6JFnn3Cy6BGHPip6PPe5zy2Pf/zj4w7r4SQ/b9XDpblkAgQIECBAgEBrAqJHaxt3vwQIECBAgEATAqJHE2vedJOiR9y6RY/RlqJH3LNmEgECBAgQIECAQCUB0aMSrLEECBAgQIAAgUwB0SNTf+pnix5x5MuXLy/XXXfd0IHe9PDzVnFPmkkECBAgQIAAAQLVBESParQGEyBAgAABAgTyBESPPPuEk0WPOPRR0eN5z3teedzjHhd3WA8nedOjh0tzyQQIECBAgACB1gREj9Y27n4JECBAgACBJgREjybWvOkmRY+4dYseoy1Fj7hnzSQCBAgQIECAAIFKAqJHJVhjCRAgQIAAAQKZAqJHpv7UzxY94siPO+64cv311w8d6E0PP28V96SZRIAAAQIECBAgUE1A9KhGazABAgQIECBAIE9A9MizTzhZ9IhDHxU9nv/855fHPvaxcYf1cJI3PXq4NJdMgAABAgQIEGhNQPRobePulwABAgQIEGhCQPRoYs2bblL0iFu36DHaUvSIe9ZMIkCAAAECBAgQqCQgelSCNZYAAQIECBAgkCkgemTqT/1s0SOO/PWvf31Zv3790IHe9PDzVnFPmkkECBAgQIAAAQLVBESParQGEyBAgAABAgTyBESPPPuEk0WPOPRR0eMP//APy2Me85i4w3o4yZsePVyaSyZAgAABAgQItCYgerS2cfdLgAABAgQINCEgejSx5k03KXrErVv0GG0pesQ9ayYRIECAAAECBAhUEhA9KsEaS4AAAQIECBDIFBA9MvWnfrboEUf+ute9rtxwww1DB3rTw89bxT1pJhEgQIAAAQIECFQTED2q0RpMgAABAgQIEMgTED3y7BNOFj3i0EWP0Zbe9Ih71kwiQIAAAQIECBCoJCB6VII1lgABAgQIECCQKSB6ZOpP/WzRI458VPT4oz/6o3L44YfHHdbDSaJHD5fmkgkQIECAAAECrQmIHq1t3P0SIECAAAECTQiIHk2sedNNih5x637ta19bbrzxxqEDRQ8/bxX3pJlEgAABAgQIECBQTUD0qEZrMAECBAgQIEAgT0D0yLNPOFn0iEMXPUZbetMj7lkziQABAgQIECBAoJKA6FEJ1lgCBAgQIECAQKaA6JGpP/WzRY848lHR44//+I/Lox/96LjDejhJ9Ojh0lwyAQIECBAgQKA1AdGjtY27XwIECBAgQKAJAdGjiTVvuknRI27dosdoS9Ej7lkziQABAgQIECBAoJKA6FEJ1lgCBAgQIECAQKaA6JGpP/WzRY848te85jXlpptuGjrQmx7+TY+4J80kAgQIECBAgACBagKiRzVagwkQIECAAAECeQKiR559wsmiRxz6qOjxghe8oDzqUY+KO6yHk7zp0cOluWQCBAgQIECAQGsCokdrG3e/BAgQIECAQBMCokcTa950k6JH3LpFj9GWokfcs2YSAQIECBAgQIBAJQHRoxKssQQIECBAgACBTAHRI1N/6meLHnHkxx57bLn55puHDvSmh5+3invSTCJAgAABAgQIEKgmIHpUozWYAAECBAgQIJAnIHrk2SecLHrEoY+KHn/yJ39SHvnIR8Yd1sNJ3vTo4dJcMgECBAgQIECgNQHRo7WNu18CBAgQIECgCQHRo4k1b7pJ0SNu3aLHaEvRI+5ZM4kAAQIECBAgQKCSgOhRCdZYAgQIECBAgECmgOiRqT/1s0WPOPJjjjmm/OxnPxs60Jseft4q7kkziQABAgQIECBAoJqA6FGN1mACBAgQIECAQJ5AI9HjNc9eXJY9fl6ec0dOvmne3uXoj21X1qxZM/SKli5dWpYtW9aRq+32ZYyKHkceeWR5xCMe0e0bqHx13vSoDGw8AQIECBAgQIDA5AKix+SGJhAgQIAAAQIEOifQSPQ44rcXlw/+qejxg3kPLyd/7P8RPQK+iKLHaETRI+AhM4IAAQIECBAgQKCugOhR19d0AgQIECBAgECKQCPRY/HixeV9xz2u3Ov2f0ph7sKh185bUi6e/9yyevVq0SNgIa9+9avLhg0bhk7ypoeftwp4xIwgQIAAAQIECBCoLSB61BY2nwABAgQIECCQINBI9Nhuu+3KvvvuW+53wLzy6HvOK0v2buetj5/efEf57tWlfPLrt//qAbvuuuvm/Lcodthhh7L33nsnPIj9O/LKK68st9++0fQ3/9tzzz3LTjvt1L+bCrziW2+9tVxzzTVzTly5cmVZtGhR4In1Rq1ataqsXbt26AEblhxe1h92VL3DTSZAgAABAgQIEKgnIHrUszWZAAECBAgQIJAm0Ej0SPN1MAECQwVEDw8GAQIECBAgQIBAuoDokb4CF0CAAAECBAgQiBcQPeJNTSRAYKyA6DGWyAcIECBAgAABAgRqC4getYXNJ0CAAAECBAgkCIgeCeiOJEBA9PAMECBAgAABAgQIpAuIHukrcAEECBAgQIAAgXgB0SPe1EQCBMYKiB5jiXyAAAECBAgQIECgtoDoUVvYfAIECBAgQIBAgoDokYDe7SOf+ds7l/sfvF1ZtMs23b7QhKv73o9uK1/+1oZy+RW3Jpw+W0eKHrO1T3dDgAABAgQIEOilgOjRy7W5aAIECBAgQIDAaAHRwxPy/xN4/0v2LU944I5Mxgi8+VPXlfd+4QZOEwiIHhPg+VMCBAgQIECAAIEYAdEjxtEUAgQIECBAgECnBBqJHrvvvnt55CMf2Sn6rIu57LLLyrp16zY7/nVP36O87Im7Z11W78592tuuKZf+54ah1/2gBz2oHHzQgWW/nW/p3X1t7QXfdOu25aafb/vrP7/hhhvKV7/61TnHiR5bK+3vCBAgQIAAAQIEwgREjzBKgwgQIECAAAEC3RFoJHosXry4LF++vDvuiVeyevXqsmbNms2u4CunHlgO2WtB4pX16+gzPntTefdnr93sonfafn756PG/Ux6899VlXrmjXzc14dXeXPYq357/+HLtvEN/FdZWrFghekxo6s8JECBAgAABAgQqCogeFXGNJkCAAAECBAhkCYgeWfJp5w6LHjssmFe+867FadfUx4P/4aIN5ZXnXLPZpX/kZfuVx9xvYR9vKeyaL5h/ZLnsil+IHmGiBhEgQIAAAQIECFQRED2qsBpKgAABAgQIEMgVED1y/RNOFz1i0IdFjyc/eKdy9ov2iTmgx1OunbekfPKHvyN69HiHLp0AAQIECBAg0ISA6NHEmt0kAQIECBAg0JqA6NHaxovoEbPyYdHDv4uy0fbWsmP58JXPED1iHjVTCBAgQIAAAQIEagmIHrVkzSVAgAABAgQIJAqIHon4OUeLHjHuw6LHac9bVI48fNeYA3o85Y4yv7z/yueLHj3eoUsnQIAAAQIECDQhIHo0sWY3SYAAAQIECLQmIHq0tnFvegRtXPSYG1L0CHrIjCFAgAABAgQIEKgrIHrU9TWdAAECBAgQIJAiIHqksGce6k2PGH3RQ/QYCGxYcnhZf9hRMQ+VKQQIECBAgAABAtMVED2m6+00AgQIECBAgMBUBESPqTB36RDRI2YboofoIXrEfJdMIUCAAAECBAikCYgeafQOJkCAAAECBAjUExA96tl2dLLoEbOYT120obzqnGvuNMy/6bGRw89bxTxjphAgQIAAAQIECFQWED0qAxtPgAABAgQIEMgQED0y1FPPFD1i+EWPuR1Fj5hnzBQCBAgQIECAAIHKAqJHZWDjCRAgQIAAAQIZAqJHhnrqmaJHDL/oIXoMBPybHjHfJ1MIECBAgAABAikCokcKu0MJECBAgAABAnUFRI+6vh2cLnrELOVTF/6svOrDP77TMD9vtZHDmx4xz5gpBAgQIECAAAEClQVEj8rAxhMgQIAAAQIEMgREjwz11DNFjxh+0WNuR9Ej5hkzhQABAgQIECBAoLKA6FEZ2HgCBAgQIECAQIaA6JGhnnqm6BHDL3qIHgMBP28V830yhQABAgQIECCQIiB6pLA7lAABAgQIECBQV0D0qOvbwemiR8xSPvnLn7d6tZ+3GorpTY+YZ8wUAgQIECBAgACBygKiR2Vg4wkQIECAAAECGQKiR4Z66pmiRwy/6DG3o+gR84yZQoAAAQIECBAgUFlA9KgMbDwBAgQIECBAIENA9MhQTz1T9IjhFz1Ej4GAn7eK+T6ZQoAAAQIECBBIERA9UtgdSoAAAQIECBCoKyB61PXt4HTRI2YpoofoIXrEfJdMIUCAAAECBAikCYgeafQOJkCAAAECBAjUExA96tl2dLLoEbMY0UP0ED1ivkumECBAgAABAgTSBESPNHoHEyBAgAABAgTqCYge9Ww7Oln0iFmM6CF6iB4x3yVTCBAgQIAAAQJpAqJHGr2DCRAgQIAAAQL1BESPerYdnSx6xCzmk1+7ubz6Iz+507DTnreoHHn4rjEH9HiKf8i8x8tz6QQIECBAgACBlgREj5a27V4JECBAgACBZgREj2ZWvelGRY+YlYseczuKHjHPmCkECBAgQIAAAQKVBUSPysDGEyBAgAABAgQyBESPDPXUM0WPGH7RQ/QYCGxYcnhZf9hRMQ+VKQQIECBAgAABAtMVED2m6+00AgQIECBAgMBUBESPqTB36RDRI2YboofoIXrEfJdMIUCAAAECBAikCYgeafQOJkCAAAECBAjUExA96tl2dLLoEbOYc3/5b3oc49/0GIrp561injFTCBAgQIAAAQIEKguIHpWBjSdAgAABAgQIZAiIHhnqqWeKHjH8osfcjqJHzDNmCgECBAgQIECAQGUB0aMysPEECBAgQIAAgQwB0SNDPfVM0SOGX/QQPQYC/k2PmO+TKQQIECBAgACBFAHRI4XdoQQIECBAgACBugKiR13fDk4XPWKWInqIHqJHzHfJFAIECBAgQIBAmoDokUbvYAIECBAgQIBAPQHRo55tRyeLHjGLET1ED9Ej5rtkCgECBAgQIEAgTUD0SKN3MAECBAgQIECgnoDoUc+2o5NFj5jFiB6ih+gR810yhQABAgQIECCQJiB6pNE7mAABAgQIECBQT0D0qGfb0cmiR8xiRA/RQ/SI+S6ZQoAAAQIECBBIExA90ugdTIAAAQIECBCoJyB61LPt6GTRI2YxoofoIXrEfJdMIUCAAAECBAikCYgeafQOJkCAAAECBAjUExA96tl2dLLoEbMY0UP0ED1ivkumECBAgAABAgTSBESPNHoHEyBAgAABAgTqCYge9Ww7Oln0iFmM6CF6iB4x3yVTCBAgQIAAAQJpAqJHGr2DCRAgQIAAAQL1BESPerYdnSx6xCxG9BA9RI+Y75IpBAgQIECAAIE0AdEjjd7BBAgQIECAAIF6AqJHPduOThY9YhYjeogeokfMd8kUAgQIECBAgECagOiRRu9gAgQIECBAgEA9AdGjnm1HJ4seMYsRPUQP0SPmu2QKAQIECBAgQCBNQPRIo3cwAQIECBAgQKCegOhRz7ajk0WPmMWIHqKH6BHzXTKFAAECBAgQIJAmIHqk0TuYAAECBAgQIFBPQPSoZ9vRyaJHzGJED9FD9Ij5LplCgAABAgQIEEgTED3S6B1MgAABAgQIEKgnIHrUs+3oZNEjZjGih+ghesR8l0whQIAAAQIECKQJiB5p9A4mQIAAAQIECNQTED3q2XZ0sugRsxjRQ/QQPWK+S6YQIECAAAECBNIERI80egcTIECAAAECBOoJiB71bDs6WfSIWYzoIXqIHjHfJVMIECBAgAABAmkCokcavYMJECBAgAABAvUERI96th2dLHrELEb0ED1Ej5jvkikECBAgQIAAgTQB0SON3sEECBAgQIAAgXoCokc9245OFj1iFiN6iB6iR8x3yRQCBAgQIECAQJqA6JFG72ACBAgQIECAQD0B0aOebUcnix4xixE9RA/RI+a7ZAoBAgQIECBAIE1A9EijdzABAgQIECBAoJ6A6FHPtqOTRY+YxYgeoofoEfNdMoUAAQIECBAgkCYgeqTRO5gAAQIECBAgUE9A9Khn29HJokfMYkQP0UP0iPkumUKAAAECBAgQSBMQPdLoHUyAAAECBAgQqCcgetSz7ehk0SNmMaKH6CF6xHyXTCFAgAABAgQIpAmIHmn0DiZAgAABAgQI1BMQPerZdnSy6BGzGNFD9BA9Yr5LphAgQIAAAQIE0gREjzR6BxMgQIAAAQIE6gmIHvVsOzpZ9IhZjOgheogeMd8lUwgQIECAAAECaQKiRxq9gwkQIECAAAEC9QREj3q2HZ0sesQsRvQQPUSPmO+SKQQIECBAgACBNAHRI43ewQQIECBAgACBegKiRz3bjk4WPWIWI3qIHqJHzHfJFAIECBAgQIBAmoDokUbvYAIECBAgQIBAPQHRo55tRyeLHjGLET1ED9Ej5rtkCgECBAgQIEAgTUD0SKN3MAECBAgQIECgnoDoUc+2o5NFj5jFiB6ih+gR810yhQABAgQIECCQJiB6pNE7mAABAgQIECBQT0D0qGfb0cmiR8xiRA/RQ/SI+S6ZQoAAAQIECBBIExA90ugdTIAAAQIECBCoJyB61LPt6GTRI2YxoofoIXrEfJdMIUCAAAECBAikCYgeafQOJkCAAAECBAjUExA96tl2dLLoEbMY0UP0ED1ivkumECBAgAABAgTSBESPNHoHEyBAgAABAgTqCYge9Ww7Oln0iFmM6CF6iB4x3yVTCBAgQIAAAQJpAqJHGr2DCRAgQIAAAQL1BESPerYdnSx6xCxG9BA9RI+Y75IpBAgQIECAAIE0AdEjjd7BBAgQIECAAIF6AqJHPduOThY9YhYjeogeokfMd8kUAgQIECBAgECagOiRRu9gAgQIECBAgEA9AdGjnm1HJ4seMYsRPUQP0SPmu2QKAQIECBAgQCBNQPRIo3cwAQIECBAgQKCegOhRz7ajk4dFj8GlrjntoHLQom07etXdu6zT/4/ry6r/a/2dLux/PHbXcsofLOrexU75im6at3f5xA9/t6xYsWLOk1euXFkWLeqH1apVq8ratWuH3suGJYeX9YcdNWVhxxEgQIAAAQIECIQIiB4hjIYQIECAAAECBLolIHp0ax9TuJq5oscJz9qzvPiI3aZwBbNxxDNOv6p84//++Z1u5r4Hblf+z+MPmI0bnOAufjDv4eW8Hy4WPSYw9KcECBAgQIAAAQJTEBA9poDsCAIECBAgQIDAtAVEj2mLp583V/QYXNinlt+jPOSg/06/xq5fwLdu+9/Kk1/510Mv8yW/DEfH/zIgtfrftfOWlIvnP7esW7dO9Gj1IXDfBAgQIECAAIG+CIgefdmU6yRAgAABAgQI3AWBRqLHHnvsUR73uMfdBZjZ/egll1xS/vM//3PoDe63337ltc+9Vzlglw1ll+1+0RuEO8odU7nWa362Q/m3a3cr3/nxgvKZz3xmzjOPetbvlEfco5S77fxfU7muLhxy460LyhU37lj+5Yd7/epy1q9fX770pS/NeWl+3qoLW3MNBAgQIECAAIHGBUSPxh8At0+AAAECBAjMpkAj0WM2l+euCPRXQPTo7+5cOQECBAgQIEBgZgREj5lZpRshQIAAAQIECPx/AqKHp4EAgQQB0SMB3ZEECBAgQIAAAQJ3FhA9PBEECBAgQIAAgRkUED1mcKluiUD3BUSP7u/IFRIgQIAAAQIEZl5A9Jj5FbtBAgQIECBAoEUB0aPFrbtnAukCokf6ClwAAQIECBAgQICA6OEZIECAAAECBAjMoIDoMYNLneyWnvnbO5f7H7xdWbTLNpMNmsG//t6Pbitf/taGcvkVt87g3U33lkSP6Xo7jQABAgQIECBAYIiA6OGxIECAAAECBAjMoIDoMYNL3fpbev9L9i1PeOCOWz+gkb9886euK+/9wg2N3G2d2xQ96riaSoAAAQIECBAgcBcERI+7gOWjBAgQIECAAIG+CDQSPbbddtuy55579mUrVa/zxhtvLLfccstmZ7zu6XuUlz1x96pnz9Lwp7z5yjnf+Nhjjz3KggULZul27/K93HbbbeX666+f8+9Ej7tM6g8IECBAgAABAgSiBUSPaFHzCBAgQIAAAQIdEGgkeixevLgsX768A+D5l7B69eqyZs2azS7kK6ceWA7Zq+3/of6ubOetn76+nPX59UP/5PWvf31ZsmTJXRk3c59dt25dWbFihegxc5t1QwQIECBAgACBGRIQPWZomW6FAAECBAgQILBJQPRo7lkYFj12WDCvfOddi5uzmOSGz/3azeWYj/xk6IjjjjuuHHrooZOM7/3fih69X6EbIECAAAECBAjMvoDoMfs7docECBAgQIBAgwKiR3NLFz1iVi56jHYUPWKeM1MIECBAgAABAgQqCogeFXGNJkCAAAECBAhkCYgeWfJp54oeMfSih+gxENiw5PCy/rCjYh4qUwgQIECAAAECBKYrIHpM19tpBAgQIECAAIGpCIgeU2Hu0iGiR8w2RkWPwb8fM/h3ZFr+z5seLW/fvRMgQIAAAQIEeiIgevRkUS6TAAECBAgQIHBXBESPu6I1E58VPWLWKHqMdhQ9Yp4zUwgQIECAAAECBCoKiB4VcY0mQIAAAQIECGQJiB5Z8mnnih4x9KKH6DEQ8PNWMd8nUwgQIECAAAECKQKiRwq7QwkQIECAAAECdQVEj7q+HZwuesQsRfQQPUSPmO+SKQQIECBAgACBNAHRI43ewQQIECBAgACBegKiRz3bjk4WPWIWMyp6HH/88eWQQw6JOainU/y8VU8X57IJECBAgAABAi0JiB4tbdu9EiBAgAABAs0IiB7NrHrTjYoeMSsXPUY7ih4xz5kpBAgQIECAAAECFQVEj4q4RhMgQIAAAQIEsgREjyz5tHNFjxh60UP0GAj4Nz1ivk+mECBAgAABAgRSBESPFHaHEiBAgAABAgTqCogedX07OF30iFnKqOhxwgknlIMPPjjmoJ5O8aZHTxfnsgkQIECAAAECLQmIHi1t270SIECAAAECzQiIHs2setONih4xKxc9RjuKHjHPmSkECBAgQIAAAQIVBUSPirhGEyBAgAABAgSyBESPLPm0c0WPGHrRQ/QYCPh5q5jvkykECBAgQIAAgRQB0SOF3aEECBAgQIAAgboCokdd3w5OFz1iljIqepx44onloIMOijmop1O86dHTxblsAgQIECBAgEBLAqJHS9t2rwQIECBAgEAzAqJHM6vedKOiR8zKRY/RjqJHzHNmCgECBAgQIECAQEUB0aMirtEECBAgQIAAgSwB0SNLPu1c0SOGXvQQPQYCft4q5vtkCgECBAgQIEAgRUD0SGF3KAECBAgQIECgroDoUde3g9NFj5iljIoeJ510UjnwwANjDurpFG969HRxLpsAAQIECBAg0JKA6NHStt0rAQIECBAg0IyA6NHMqjfdqOgRs3LRY7Sj6BHznJlCgAABAgQIECBQUUD0qIhrNAECBAgQIEAgS0D0yJJPO1f0iKEXPUSPgYCft4r5PplCgAABAgQIEEgRED1S2B1KgAABAgQIEKgrIHrU9e3gdNEjZimih+ghesR8l0whQIAAAQIECKQJiB5p9A4mQIAAAQIECNQTED3q2XZ0sugRs5hR0ePkk08uBxxwQMxBPZ3i5616ujiXTYAAAQIECBBoSUD0aGnb7pUAAQIECBBoRkD0aGbVm25U9IhZuegx2lH0iHnOTCFAgAABAgQIEKgoIHpUxDWaAAECBAgQIJAlIHpkyaedK3rE0IseosdAwL/pEfN9MoUAAQIECKY4clEAACAASURBVBAgkCIgeqSwO5QAAQIECBAgUFdA9Kjr28HpokfMUkZFjze84Q3lbne7W8xBPZ3iTY+eLs5lEyBAgAABAgRaEhA9Wtq2eyVAgAABAgSaERA9mln1phsVPWJWLnqMdhQ9Yp4zUwgQIECAAAECBCoKiB4VcY0mQIAAAQIECGQJiB5Z8mnnih4x9KKH6DEQ8PNWMd8nUwgQIECAAAECKQKiRwq7QwkQIECAAAECdQVEj7q+HZwuesQsZVT0OOWUU8r+++8fc1BPp3jTo6eLc9kECBAgQIAAgZYERI+Wtu1eCRAgQIAAgWYERI9mVr3pRkWPmJWLHqMdRY+Y58wUAgQIECBAgACBigKiR0VcowkQIECAAAECWQKiR5Z82rmiRwy96CF6DAT8vFXM98kUAgQIECBAgECKgOiRwu5QAgQIECBAgEBdAdGjrm8Hp4seMUsZFT3e+MY3lv322y/moJ5O8aZHTxfnsgkQIECAAAECLQmIHi1t270SIECAAAECzQiIHs2setONih4xKxc9RjuKHjHPmSkECBAgQIAAAQIVBUSPirhGEyBAgAABAgSyBESPLPm0c0WPGHrRQ/QYCPh5q5jvkykECBAgQIAAgRQB0SOF3aEECBAgQIAAgboCokdd3w5OFz1iljIqepx66qll3333jTmop1O86dHTxblsAgQIECBAgEBLAqJHS9t2rwQIECBAgEAzAqJHM6vedKOiR8zKRY/RjqJHzHNmCgECBAgQIECAQEUB0aMirtEECBAgQIAAgSwB0SNLPu1c0SOGXvQQPQYCft4q5vtkCgECBAgQIEAgRUD0SGF3KAECBAgQIECgroDoUde3g9NFj5iliB6ih+gR810yhQABAgQIECCQJiB6pNE7mAABAgQIECBQT0D0qGfb0cmiR8xiRkWP0047reyzzz4xB/V0ip+36uniXDYBAgQIECBAoCUB0aOlbbtXAgQIECBAoBkB0aOZVW+6UdEjZuWix2hH0SPmOTOFAAECBAgQIECgooDoURHXaAIECBAgQIBAloDokSWfdq7oEUMveogeAwH/pkfM98kUAgQIECBAgECKgOiRwu5QAgQIECBAgEBdAdGjrm8Hp4seMUsZFT3e9KY3lb333jvmoJ5O8aZHTxfnsgkQIECAAAECLQmIHi1t270SIECAAAECzQiIHs2setONih4xKxc9RjuKHjHPmSkECBAgQIAAAQIVBUSPirhGEyBAgAABAgSyBESPLPm0c0WPGHrRQ/QYCPh5q5jvkykECBAgQIAAgRQB0SOF3aEECBAgQIAAgboCokdd3w5OFz1iljIqeqxYsaLstddeMQf1dIo3PXq6OJdNgAABAgQIEGhJQPRoadvulQABAgQIEGhGQPRoZtWbblT0iFm56DHaUfSIec5MIUCAAAECBAgQqCggelTENZoAAQIECBAgkCUgemTJp50resTQix6ix0DAz1vFfJ9MIUCAAAECBAikCIgeKewOJUCAAAECBAjUFRA96vp2cLroEbOUUdFj5cqVZdGiRTEH9XSKNz16ujiXTYAAAQIECBBoSUD0aGnb7pUAAQIECBBoRkD0aGbVm25U9IhZuegx2lH0iHnOTCFAgAABAgQIEKgoIHpUxDWaAAECBAgQIJAlIHpkyaedK3rE0IseosdAwM9bxXyfTCFAgAABAgQIpAiIHinsDiVAgAABAgQI1BUQPer6dnC66BGzFNFD9BA9Yr5LphAgQIAAAQIE0gREjzR6BxMgQIAAAQIE6gmIHvVsOzpZ9IhZzKjo8eY3v7ns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IECg9wKiR+9X6AYIECBAgAABApsLiB7NPRXDosc2v/znO36w6tDiR622/HH4xJqbynEfv3azP9h5553LGWecseWDZvSToseMLtZtESBAgAABAgRmSUD0mKVtuhcCBAgQIECAwP8rIHo09ygMix6Df7z8O+9a3JzFJDd87tduLsd85CeixxyIosckT5e/JUCAAAECBAgQmIqA6DEVZocQIECAAAECBKYrIHpM17sDp4keMUsQPUY7ih4xz5kpBAgQIECAAAECFQVEj4q4RhMgQIAAAQIEsgREjyz5tHNFjxj6uaLHLrvsUt7+9rfHHNLjKaJHj5fn0gkQIECAAAECrQiIHq1s2n0SIECAAAECTQmIHk2te3CzokfMykWP0Y6iR8xzZgoBAgQIECBAgEBFAdGjIq7RBAgQIECAAIEsAdEjSz7tXNEjhl70ED0GAhuWHF7WH3ZUzENlCgECBAgQIECAwHQFRI/pejuNAAECBAgQIDAVAdFjKsxdOkT0iNmG6CF6iB4x3yVTCBAgQIAAAQJpAqJHGr2DCRAgQIAAAQL1BESPerYdnSx6xCxmruix6667ltNPPz3mkB5P8fNWPV6eSydAgAABAgQItCIgerSyafdJgAABAgQINCUgejS17sHNih4xKxc9RjuKHjHPmSkECBAgQIAAAQIVBUSPirhGEyBAgAABAgSyBESPLPm0c0WPGHrRQ/QYCPg3PWK+T6YQIECAAAECBFIERI8UdocSIECAAAECBOoKiB51fTs4XfSIWcpc0WO33XYrb3vb22IO6fEUb3r0eHkunQABAgQIECDQioDo0cqm3ScBAgQIECDQlIDo0dS6BzcresSsXPQY7Sh6xDxnphAgQIAAAQIECFQUED0q4hpNgAABAgQIEMgSED2y5NPOFT1i6EUP0WMg4OetYr5PphAgQIAAAQIEUgREjxR2hxIgQIAAAQIE6gqIHnV9Ozhd9IhZylzRY/fddy9vfetbYw7p8RRvevR4eS6dAAECBAgQINCKgOjRyqbdJwECBAgQINCUgOjR1LoHNyt6xKxc9BjtKHrEPGemECBAgAABAgQIVBQQPSriGk2AAAECBAgQyBIQPbLk084VPWLoRQ/RYyDg561ivk+mECBAgAABAgRSBESPFHaHEiBAgAABAgTqCogedX07OF30iFnKXNFjjz32KG95y1tiDunx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"
                 + "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cbErPbJFrvRI56f0SOdkFAECBAgQIECAQEQBpUdEfEsTIECAAAECBPISUHrkJVvaeZUe2aJJSo/zP/rNsH379mEnctJjkEXpke05czUBAgQIECBAgEABAkqPApAtQYAAAQIECBAoWkDpUbR49PWUHtkiaFd6/O7v/m54y1vekm2RGlyt9KhBiG6BAAECBAgQIFB3AaVH3RN2fwQIECBAgEAjBZQejYtd6ZEtcqVHOj+lRzonowgQIECAAAECBCIKKD0i4luaAAECBAgQIJCXgNIjL9nSzqv0yBZNUnq848/+KezYsWPYiZz0GGRRemR7zlxNgAABAgQIECBQgIDSowBkSxAgQIAAAQIEihZQehQtHn09pUe2CNqVHr/3e78Xfu3Xfi3bIjW4WulRgxDdAgECBAgQIECg7gJKj7on7P4IECBAgACBRgooPRoXu9IjW+RKj3R+So90TkYRIECAAAECBAhEFFB6RMS3NAECBAgQIEAgLwGlR16ypZ1X6ZEtmqT0ePuf/mPYuXPnsBM56THIovTI9py5mgABAgQIECBAoAABpUcByJYgQIAAAQIECBQtoPQoWjz6ekqPbBEoPdL5KT3SORlFgAABAgQIECAQUUDpERHf0gQIECBAgACBvASUHnnJlnZepUe2aNqVHpdcckl485vfnG2RGlyt9KhBiG6BAAECBAgQIFB3AaVH3RN2fwQIECBAgEAjBZQejYtd6ZEtcqVHOj+lRzonowgQIECAAAECBCIKKD0i4luaAAECBAgQIJCXgNIjL9nSzqv0yBZNUnosu3ZN2LVr17ATOekxyKL0yPacuZoAAQIECBAgQKAAAaVHAciWIECAAAECBAgULaD0KFo8+npKj2wRtCs9fv/3fz+cc8452RapwdVKjxqE6BYIECBAgAABAnUXUHrUPWH3R4AAAQIECDRSQOnRuNiVHtkiV3qk81N6pHMyigABAgQIECBAIKKA0iMivqUJECBAgAABAnkJKD3yki3tvEqPbNEkpcfSP/lG2L1797ATOekxyKL0yPacuZoAAQIECBAgQKAAAaVHAciWIECAAAECBAgULaD0KFo8+npKj2wRtCs9/uAP/iAsXrw42yI1uFrpUYMQ3QIBAgQIECBAoO4CSo+6J+z+CBAgQIAAgUYKKD0aF7vSI1vkSo90fkqPdE5GESBAgAABAgQIRBRQ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"
                 + "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CBAgQIBADgLJ73kkn0quymv6/PlhUl9fVbZb2D59srww6kIWcgKrEObcFpFfbrQmboiA0qMhQbtNAgQIECBAgAABAgQIECCQh0D/nj2Hfsg8j/m7OWfPxIlh6kkn+SHzYVB9srybT1r8uZzAip9Blh3IL4ueawmEoPTwFBAgQIAAAQIECBAgQIAAAQIEGi7gk+X1egCcwKp2nvKrdn52H19A6RE/AzsgQIAAAQIECBAgQIAAAQIECEQV8MnyqPxdX9wJrK6TFjqh/ArltlgNBZQeNQzVLREgQIAAAQIECBAgQIAAAQIEOhHwyfJOtIwlQIAAgTILKD3KnI69ESBAgAABAgQIECBAgAABAgQKEPDJ8gKQLUGAAAEChQgoPQphtggBAgQIECBAgAABAgQIECBAgAABAgQIECCQt4DSI29h8xMgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKFCCg9CmG2CAECBAgQIECAAAECBAgQIECAAAECBAgQIJC3gNIjb2HzEyBAgAABAgQIECBAgAABAgQIECBAgAABAoUIKD0KYbYIAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkLeA0iNvYfMTIECAAAECBAgQIECAAAECBAgQIECAAAEChQgoPQphtggBAgQIECBAgAABAgQIECBAgAABAgQIECCQt4DSI29h8xMgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKFCCg9CmG2CAECBAgQIECAAAECBAgQIECAAAECBAgQIJC3gNIjb2HzEyBAgAABAgQIECBAgAABAgQIECBAgAABAoUIKD0KYbYIAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkLeA0iNvYfMTIECAAAECBAgQIECAAAECBAgQIECAAAEChQgoPQphtggBAgQIECBAgAABAgQIECBAgAABAgQIECCQt4DSI29h8xMgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKFCCg9CmG2CAECBAgQIECAAAECBAgQIECAAAECBAgQIJC3gNIjb2HzEyBAgAABAgQIECBAgAABAgQIECBAgAABAoUIKD0KYbYIAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkLeA0iNvYfMTIECAAAECBAgQIECAAAECBAgQIECAAAEChQgoPQphtggBAgQIECBAgAABAgQIECBAgAABAgQIECCQt4DSI29h8xMgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKFCCg9CmG2CAECBAgQIECAAAECBAgQIECAAAECBAgQIJAiUWEaAAAgAElEQVS3gNIjb2HzEyBAgAABAgQIECBAgAABAgQIECBAgAABAoUIKD0KYbYIAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkLeA0iNvYfMTIECAAAECBAgQIECAAAECBAgQIECAAAEChQgoPQphtggBAgQIECBAgAABAgQIECBAgAABAgQIECCQt4DSI29h8xMgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKFCCg9CmG2CAECBAgQIECAAAECBAgQIECAAAECBAgQIJC3gNIjb2HzEyBAgAABAgQIECBAgAABAgQIECBAgAABAoUIKD0KYbYIAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkLeA0iNvYfMTIECAAAECBAgQIECAAAECBAgQIECAAAEChQgoPQphtggBAgQIECBAgAABAgQIECBAgAABAgQIECCQt4DSI29h8xMgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKFCCg9CmG2CAECBAgQIECAAAECBAgQIECAAAECeQts3bo1bNu2LezYsSO8+OKL4aijjgrjxo1r/d/Q/z/cv+vkv6cdm/e9mp8AgeEFlB6eDAIECBAgQIAAAQIECBAgQIAAAQIEKimwZcuW8Pzzz4dNmza1/i8pOsryemk5MtL/366ASVuwpFmr23OVxdk+CLxcQOnhmSBAgAABAgQIECBAgAABAgQIECBAoDICmzdvDr/4xS9a/7dr167K7LtuG83r5Myxxx4bhv5vwoQJdWNzPwUIKD0KQLYEAQIECBAgQIAAAQIECBAgQIAAAQJjF9izZ0948sknwzPPPBN27tw59olcWSmBadOmhblz54YZM2ZUat82G1dA6RHX3+oECBAgQIAAAQIECBAgQIAAAQIECIwgkJzqSMqOp59+mlGDBWbOnNkqP44//vgGK7j1tAJKj7RSxhEgQIAAAQIECBAgQIAAAQIECBAgUIhA8tVVTzzxREhKDy8CiUDydVpnn3126OvrA0JgVAGlhweEAAECBAgQIECAAAECBAgQIECAAIFSCCQlx2OPPRY2btxYiv3YRLkEenp6wllnnRWSr73yIjCSgNLDs0GAAAECBAgQIECAAAECBAgQIECAQFSB7du3t8qO5Dc7vAiMJjB+/Phw7rnnht7eXlAEhhVQengwCBAgQIAAAQIECBAgQIAAAQIECBCIJvDw/9/enQdJWZyPA28QBAE5RA2KioAnCogooqAgiopiNCalMWpFE0m8jSmNt/FMmZRHEmPiWcY7njFqeUcigrcoHoiCAgIqHiy33Pyq51e7312YXXbmndl9Z/bTVVMbmffpfvrTk3/mme7+6KPw6aefNtr4Bi49gR49eoRevXqVXuIybhABRY8GYTYIAQIECBAgQIAAAQIECBAgQIAAAQLVBb777rswceLEMG/ePDAEchJo1qxZ2H///UOrVq1yivNw0xBQ9Gga62yWBAgQIECAAAECBAgQIECAAAECBFIj8PHHH4fJkyenJh+JlJ7ANttsE3bYYYfSS1zGRRdQ9Cg6sQEIECBAgAABAgQIECBAgAABAgQIEIgCc+fODR9++GGoqKgAQiCRQNu2bcO+++6bqA/B5Smg6FGe62pWBAgQIECAAAECBAgQIECAAAECBFIlMGPGjDBhwoRU5SSZ0hYYNmxYaNOmTWlPQvYFF1D0KDipDgkQIECAAAECBAgQIECAAAECBAgQqC4Qj7KKR1ppBAop0Ldv37DlllsWskt9lYGAokcZLKIpECBAgAABAgQIECBAgAABAgQIEEirwPvvvx+mT5+e1vTkVcICW2yxRdhll11KeAZSL4aAokcxVPVJgAABAgQIECBAgAABAgQIECBAoIkLrFy5MowfPz7Mnj27iUuYfrEE2rVrF4YOHVqs7vVbogKKHiW6cNImQIAAAQIECBAgQIAAAQIECBAgkFaBRYsWZQoe8+bNS2uK8ioTgYMOOii0aNGiTGZjGoUQUPQohKI+CBAgQIAAAQIECBAgQIAAAQIECBDICMyfPz+8+eab4fvvvydCoOgCe+65Z+jcuXPRxzFA6QgoepTOWsmUAAECBAgQIECAAAECBAgQIECAQKoF4s6OWPBYsmRJqvOUXPkI9OrVK/To0aN8JmQmiQUUPRIT6oAAAQIECBAgQIAAAQIECBAgQIAAgblz52YKHkuXLoVBoMEEunXrFnr37t1g4xko/QKKHulfIxkSIECAAAECBAgQIECAAAECBAgQSLVARUVFpuCxbNmyVOcpufIT2HjjjcPAgQPLb2JmlLeAokfedAIJECBAgAABAgQIECBAgAABAgQIEJgzZ06m4LF8+XIYBBpcoE2bNmHYsGENPq4B0yug6JHetZEZAQIECBAgQIAAAQIECBAgQIAAgVQLfPfdd5mCx4oVK4qWZ/fu3cM222wTevbsGbbccsuw2WabZV4dOnQIzzzzTLj88svzHnvTTTcNY8aMCatXrw6rVq2q+hv/97r+u7aY2mKz9Vf5bF0xaz4T/3vlypWZ/Gp7rfl+5X9X//c1/y3+d/V/q/zv2v7GNY/vxb+Vr1j4qnzFXT/xMvuGKIYdcsghoVmzZnl/DgSWl4CiR3mtp9kQIECAAAECBAgQIECAAAECBAgQaBCBWPB44403Ml98F7L1798/7LfffqFfv35hl112Ce3bt6+1+5tuuilcccUVeQ8fix7vvPNO3vEC1y0QPyeTJk0KDz74YHj44YfXHZDHE/vuu29o27ZtHpFCylFA0aMcV9WcCBAgQIAAAQIECBAgQIAAAQIECBRR4Ntvv83s8ChkwaNLly7hsssuCyNHjqx35tdee2247rrr6v38mg9usskm4d133807XmBuAoceemgYP358bkH1eHqPPfYIcS01AlFA0cPngAABAgQIECBAgAABAgQIECBAgACBegsUq+Bx1113hZ122qneecQH49FWN998c04x1R+Ol2BPmDAh73iBuQkk3ZlT22i9e/cO3bp1yy0ZT5etgKJH2S6tiREgQIAAAQIECBAgQIAAAQIECBAorEAseMQjreJdEoVq8Rf699xzT9h5551z7vK8884Ld999d85xlQGdO3cO7733Xt7xAnMTGDt2bDjqqKNyC6rH0z169Ai9evWqx5MeaQoCih5NYZXNkQABAgQIECBAgAABAgQIECBAgEBCgWIUPDp16hTuvffe0Ldv37yyO/3008Ojjz6aV2wMiuN/8MEHeccLzE1g9uzZYdddd80tqB5Px6PRdtttt3o86ZGmIKDo0RRW2RwJECBAgAABAgQIECBAgAABAgQIJBAoxqXl7dq1y+zw2H333fPO7IQTTgjPPfdc3vEdO3YMH374Yd7xAnMX2H777cPChQtzD6wjIq7j4MGDC9qnzkpXQNGjdNdO5gQIECBAgAABAgQIECBAgAABAgSKLlCMgkfLli0zOzwGDRqUKP94VFI8Minf1qFDhzBx4sR8w8XlIXDAAQcUvNDUpk2bMGzYsDyyEVKOAooe5biq5kSAAAECBAgQIECAAAECBAgQIECgAALFKHjEtOI9HIX4knrkyJHhnXfeyXum7du3Dx999FHe8QJzFxg1alR46qmncg+sI2K99dYLI0aMKGifOitdAUWP0l07mRMgQIAAAQIECBAgQIAAAQIECBAomsCcOXMyl5avWLGioGPcdtttBfuCet999w2ffPJJ3vnFI7Y+/vjjvOMF5i5wxRVXhJtuuin3wHVExKJHLH5oBBQ9fAYIECBAgAABAgQIECBAgAABAgQIEKghUFFRkSl4LF++vKAyN954Yzj88MML1me8D+SLL77Iu7+2bdsmKprkPXATDrzzzjvDBRdcUHCBuHMoHnOlEVD08BkgQIAAAQIECBAgQIAAAQIECBAgQKBKYO7cuZmCx7Jlywqqct1114V4B0ch24477hjmz5+fd5fxS/LJkyfnHS8wd4HRo0eHY489NvfAdUTEi8zjheYaAUUPnwECBAgQIECAAAECBAgQIECAAAECBDIC8+bNyxQ8li5dWlCRq666Khx//PEF7TN2ttVWW4WVK1fm3e8GG2wQpkyZkne8wNwFoveQIUNyD1xHxIABA8Kmm25a8H51WHoCih6lt2YyJkCAAAECBAgQIECAAAECBAgQIFBwgQULFoTXX389LFmypKB9X3zxxeGkk04qaJ+xs8WLF4dtt902Ub+tWrUKn332WaI+BOcmEHcQde/ePbegejy9yy67hC222KIeT3qk3AUUPcp9hc2PAAECBAgQIECAAAECBAgQIECAwDoEFi1alCl4xEJCIdvZZ58dzjrrrEJ2WdXX119/Hfr165eo7/XXXz9MnTo1UR+CcxfYbbfdwpdffpl7YB0R8aiznj17FrRPnZWmgKJHaa6brAkQIECAAAECBAgQIECAAAECBAgURCAWOmLBIxY+CtlOPfXUolxYXZlj3KGx9957J0q5ZcuWYdq0aYn6EJy7wI9+9KPMMWqFbLHgEQsfGgFFD58BAgQIECBAgAABAgQIECBAgAABAk1UIB5lFb98TnIZeDa6X/7yl+Hyyy8vquqECRPCwQcfnGiMFi1ahOnTpyfqo6kGr1ixIixfvjyv16233lrwoke3bt1C7969m+pymHc1AUUPHwcCBAgQIECAAAECBAgQIECAAAECTVAgfmEdd3jMnTu3oLM/+uijwzXXXFPQPrN1Nnbs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M2jXrl1mt9CoUaPWev/OO+8MF1xwQZEzr7v79ddfPxxwwAGNmoPB0yGg6JGOdZAFAQIECBAgQIAAAQIECBAgQIBAExJYvnx5ePbZZ7POuHnz5iEeR1WfNm/evLBy5cqsj6633nohFlZ69epV4/2ZM2dmvtx++umnax1ip512yjyT7WLrPfbYI8Q+amsdOnQIcWytcQQWLlxY67FpsXDx5ptvhvbt29dI7oYbbghXX311vRKOha/42ejZs2eN588888zw8MMPF/VzEXeTVFRUZB0jFviGDBlSrzl4qLwFFD3Ke33NjgABAgQIECBAgAABAgQIECBAIIUC8QLzeJF5tjZw4MDwyCOPrDPrp556Kuuv7isDr7/++nDkkUfW6CcecxW/sK7vHQynn356OO+882r0Ee/2qOsX9b/61a/C73//+3Xm74HCC8Qi2JpFruqjXHfddZmjqKq3888/P9x11105JRMLDC+++GLYfPPNa8TFi9G/+uqrrH397ne/C7EwkqTNmjUrDBgwIGsXcQfLoEGDknQvtkwEFD3KZCFNgwABAgQIECBAgAABAgQIECBAoHQEvv7661qPETriiCNC/OX9ulr8Evnee+/N+lj88vnxxx+v8V58Nsbk2o477ri1dgHEwsmtt96atat4d0j8QlxreIG4e+gXv/hF1oHj3S5vv/12jffibp8TTzwxr0Tj/Rm33HJLjdhYVLn22muz9rfPPvuE+++/P6+xKoPi0Wpxp0m2tskmm4S4C0kjoOjhM0CAAAECBAgQIECAAAECBAgQIECggQWmT5+euUsjW9t9990zOyX69etXZ1Z1HTN18803h5EjR1bFf/7552G//fYLixcvzmumscBx8MEHV8XW9Yv7+FC83HrrrbfOayxB+QvUVYw67bTTQtzVUdnibp9YQKjrqLJ1ZfLHP/4xHHvssVWPxc/0QQcdlDUs3rkR75GJF47Xt02aNKnqzpl4sXq8d2TZsmVZw+O9NbHYpxFQ9PAZIECAAAECBAgQIECAAAECBAgQINDAAvEX65MnT65z1G7duoXhw4dnXoMHD67xbLyI+sADD8waH48eil8WV2/x1/+13SFSn6l37do1s3sj3glR2eKX3fGS9GztD3/4Q/j5z39en649U0CBww47LLz11ltZe4w7fYYOHVr1XjzSqnoRJJ80dthhh/Df//63Rui+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6ro/5tBDD80806VLlxrxcczhw4eH+NnI1jp16hQGDRpU4JnqjkB2AUUPnwwCBAgQIECAAAECBAgQIECAAAECJSgQj7aKv85fvnx51uz79OkTnn766bXei0dfxS+ua9slUhlw7rnnhjPOOGOt+Pjv99xzT61i8cijjh07lqBo+aQc79pYsmRJrROKO36yXW7/xRdfhLfeeivES87jMVXxKLVYwIqfpfh3t912W6vPZcuWheOOO67OI7L69esXunbtWj7AZpJqAUWPVC+P5AgQIECAAAECBAgQIECAAAECBAjULjBp0qQwZcqUWh+IRxBdf/31a70/Z86czKXW8cvt+Io7Rrp37171BXc80qpv375rxa3r4ut4b0OM1RpXIH4m4mejrhZ3dhxwwAGJEl20aFE48cQTw5gxY2rtp127dmHo0KGJxhFMIBcBRY9ctDxLgAABAgQIECBAgAABAgQIECBAIEUC8SLxeEn5qlWras0q/go/HlFVV1u5cmVYb7316nzm5JNPDo8//nidzwwYMCBsuummKRJquqm8+uqrmZ0adbWzzjornH322Xkhvfzyy+Giiy6qs+gWO/aZyItXUAIBRY8EeEIJECBAgAABAgQIECBAgAABAgQINLbA9OnTM7s16mrZ7uaob97xjod4pNWaF2CvGe8uj/qKNsxz8+fPr3MHRmUW8eipuFvj8MMPr1diH3/8cbj99tvDvffeu87n410wO+ywwzqf8wCBQgooehRSU18ECBAgQIAAAQIECBAgQIAAAQIEGkEg3sPw1Vdf1Tny+uuvH0aNGpX5gru+uzFuu+22cMstt4RZs2bV2Xfr1q0zRxi1aNGiEWZvyNoEpk6dGj788MN6AcUCxT777JN59ejRI2yyySZhgw02yNz9El+vvPJKiLs7XnrppXr156izejF5qAgCih5FQNUlAQIECBAgQIAAAQIECBAgQIAAgYYUiMdcvfbaayH+XVdr3rx5GD58eBgyZEiIv/KPX27HV0VFRebL7fhL/vjFdjw2a12XnVeOtccee2T60NIn8Omnn4aPPvqoQRPr1KlT5lirli1bNui4BiMQBRQ9fA4IECBAgAABAgQIECBAgAABAgQIlIHAggULwuuvvx6WLFnSoLPp379/2GyzzRp0TIPlJjB58uRMMashmoJHQygboy4BRQ+fDwIECBAgQIAAAQIECBAgQIAAAQJlIjBv3rxM4WPZsmUNMqO+ffuGLbfcskHGMkgygZkzZ2bufomX1herbbHFFmHnnXd2zFmxgPVbLwFFj3oxeYgAAQIECBAgQIAAAQIECBAgQIBAaQjEI67il9v1PZoqn1m1bds29OnTJ3Tu3DmfcDGNJLBw4cLwwQcfhG+//bagGcQj02KxY6uttipovzojkI+Aokc+amIIECBAgAABAgQIECBAgAABAgQIpFzgk08+CfFV6Na1a9fQu3dvv+YvNGwD9hd3fcRLzuPOoCStWbNmoXv37plXvPRcI5AGAUWPNKyCHAgQIECAAAECBAgQIECAAAECBAgUQWD+/PmZL7dnzJiRuPd4UXmPHj1cWJ5YMj0dfPHFFyEWQOLOj1WrVtU7sfbt24cf/OAHYeuttw6tWrWqd5wHCTSEgKJHQygbgwABAgQIECBAgAABAgQIECBAgEAjCsRjjaZNm5Y58mrRokX1ziR+oR2LHXF3R/yrlafA6tWrM4WP+PlYunRp1Sve/xE/A5WvDh06ZD4HdnWU5+egXGal6FEuK2keBAgQIECAAAECBAgQIECAAAECBOohsGDBgswX3PFv/II7Xnoe/7Zs2bLqy+3WrVuHTTfdNHTq1KkePXqEAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAL1KXr8Pzjiof1aYASoAAAAAElFTkSuQmCC",
            fileName="modelica://OpenIPSL/../../../../../Downloads/autodraw 1_23_2024.png")}),
                                                                   Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end TCL_Building_no_noise_RECORD_DATA2;

  model TCL_Building_no_noise_RECORD_DATA1
    Interfaces.PwPin pwPin
      annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    Electrical.Loads.PSAT.TCL_randominit TCL1(Sn=TCL_b,
      p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_1,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_1,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_1,
      R=tclparameters.tclparameters.r.R_1,
      C=tclparameters.tclparameters.c.C_1,    start0=start0_TCL1) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-70,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL7(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_7,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_7,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_7,
      R=tclparameters.tclparameters.r.R_7,
      C=tclparameters.tclparameters.c.C_7,
      var=0.13,                                   start0=start0_TCL7) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={50,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL9(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_9,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_9,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_9,
      R=tclparameters.tclparameters.r.R_9,
      C=tclparameters.tclparameters.c.C_9,
      var=0.2,                            start0=start0_TCL9) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-70,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL10(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_10,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_10,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_10,
      R=tclparameters.tclparameters.r.R_10,
      C=tclparameters.tclparameters.c.C_10,
      var=0.15,                                    start0=start0_TCL10) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-50,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL11(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_11,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_11,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_11,
      R=tclparameters.tclparameters.r.R_11,
      C=tclparameters.tclparameters.c.C_11,
      var=-0.23,                             start0=start0_TCL11) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-30,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL13(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_13,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_13,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_13,
              R=tclparameters.tclparameters.r.R_13,
      C=tclparameters.tclparameters.c.C_13,start0=start0_TCL13) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={10,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL2(Sn=TCL_b,  p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_2,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_2,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_2,
              R=tclparameters.tclparameters.r.R_2,
      C=tclparameters.tclparameters.c.C_2,
      var=-0.1,                           start0=start0_TCL2)
                                              annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-50,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL3(Sn=TCL_b,  p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_3,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_3,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_3,
              R=tclparameters.tclparameters.r.R_3,
      C=tclparameters.tclparameters.c.C_3,
      var=0.02,                           start0=start0_TCL3) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-30,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL4(Sn=TCL_b,  p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_4,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_4,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_4,
              R=tclparameters.tclparameters.r.R_4,
      C=tclparameters.tclparameters.c.C_4,
      var=0.16,                           start0=start0_TCL4) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-10,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL5(Sn=TCL_b,  p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_5,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_5,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_5,
              R=tclparameters.tclparameters.r.R_5,
      C=tclparameters.tclparameters.c.C_5,
      var=-0.1,                           start0=start0_TCL5) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={10,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL6(Sn=TCL_b,  p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_6,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_6,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_6,
              R=tclparameters.tclparameters.r.R_6,
      C=tclparameters.tclparameters.c.C_6,
      var=0.08,                           start0=start0_TCL6) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={30,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL12(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_12,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_12,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_12,
             R=tclparameters.tclparameters.r.R_12,
      C=tclparameters.tclparameters.c.C_12,
      var=-0.07,                           start0=start0_TCL12) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-10,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL14(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_14,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_14,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_14,
              R=tclparameters.tclparameters.r.R_14,
      C=tclparameters.tclparameters.c.C_14,
      var=0,                               start0=start0_TCL14) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={30,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL8(Sn=TCL_b,  p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_8,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_8,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_8,
              R=tclparameters.tclparameters.r.R_8,
      C=tclparameters.tclparameters.c.C_8,
      var=-0.14,                          start0=start0_TCL8) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={70,70})));
    Electrical.Loads.PSAT.TCL_randominit TCL15(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_15,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_15,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_15,
              R=tclparameters.tclparameters.r.R_15,
      C=tclparameters.tclparameters.c.C_15,
      var=0.01,                            start0=start0_TCL15) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={50,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL16(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_16,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_16,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_16,
              R=tclparameters.tclparameters.r.R_16,
      C=tclparameters.tclparameters.c.C_16,
      var=-0.04,                           start0=start0_TCL16) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={70,30})));
    Electrical.Loads.PSAT.TCL_randominit TCL17(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_17,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_17,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_17,
              R=tclparameters.tclparameters.r.R_17,
      C=tclparameters.tclparameters.c.C_17,
      var=0.09,                            start0=start0_TCL17) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-70,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL18(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_18,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_18,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_18,
              R=tclparameters.tclparameters.r.R_18,
      C=tclparameters.tclparameters.c.C_18,
      var=0.17,                            start0=start0_TCL18) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-50,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL19(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_19,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_19,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_19,
              R=tclparameters.tclparameters.r.R_19,
      C=tclparameters.tclparameters.c.C_19,
      var=0.19,                            start0=start0_TCL19) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-30,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL21(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_21,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_21,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_21,
              R=tclparameters.tclparameters.r.R_21,
      C=tclparameters.tclparameters.c.C_21,
      var=0,                               start0=start0_TCL21) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={10,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL20(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_20,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_20,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_20,
              R=tclparameters.tclparameters.r.R_20,
      C=tclparameters.tclparameters.c.C_20,
      var=0.2,                             start0=start0_TCL20) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-10,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL22(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_22,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_22,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_22,
              R=tclparameters.tclparameters.r.R_22,
      C=tclparameters.tclparameters.c.C_22,
      var=-0.2,                            start0=start0_TCL22) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={30,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL23(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_23,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_23,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_23,
              R=tclparameters.tclparameters.r.R_23,
      C=tclparameters.tclparameters.c.C_23,
      var=-0.06,                           start0=start0_TCL23) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={50,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL24(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_24,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_24,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_24,
              R=tclparameters.tclparameters.r.R_24,
      C=tclparameters.tclparameters.c.C_24,
      var=-0.03,                           start0=start0_TCL24) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={70,-30})));
    Electrical.Loads.PSAT.TCL_randominit TCL25(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_25,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_25,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_25,
              R=tclparameters.tclparameters.r.R_25,
      C=tclparameters.tclparameters.c.C_25,
      var=0.05,                            start0=start0_TCL25) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-70,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL26(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_26,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_26,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_26,
              R=tclparameters.tclparameters.r.R_26,
      C=tclparameters.tclparameters.c.C_26,
      var=-0.05,                           start0=start0_TCL26) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-50,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL27(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_27,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_27,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_27,
      R=tclparameters.tclparameters.r.R_27,
      C=tclparameters.tclparameters.c.C_27,
      var=0.22,                            start0=start0_TCL27) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-30,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL29(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_29,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_29,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_29,
              R=tclparameters.tclparameters.r.R_29,
      C=tclparameters.tclparameters.c.C_29,
      var=-0.04,                           start0=start0_TCL29) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={10,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL28(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_28,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_28,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_28,
              R=tclparameters.tclparameters.r.R_28,
      C=tclparameters.tclparameters.c.C_28,
      var=0.16,                            start0=start0_TCL28) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-10,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL30(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_30,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_30,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_30,
              R=tclparameters.tclparameters.r.R_30,
      C=tclparameters.tclparameters.c.C_30,
      var=0.01,                            start0=start0_TCL30) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={30,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL31(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_31,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_31,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_31,
              R=tclparameters.tclparameters.r.R_31,
      C=tclparameters.tclparameters.c.C_31,
      var=0.07,                            start0=start0_TCL31) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={50,-70})));
    Electrical.Loads.PSAT.TCL_randominit TCL32(Sn=TCL_b, p0=P0,
      theta_ref=tclparameters.tclparameters.tclref.theta_ref_32,
      theta_min=tclparameters.tclparameters.tclmin.theta_min_32,
      theta_max=tclparameters.tclparameters.tclmax.theta_max_32,
              R=tclparameters.tclparameters.r.R_32,
      C=tclparameters.tclparameters.c.C_32,
      var=-0.13,                           start0=start0_TCL32) annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={70,-70})));
    parameter Integer start0_TCL1=1;
    parameter Integer start0_TCL2=1;
    parameter Integer start0_TCL3=1;
    parameter Integer start0_TCL4=1;
    parameter Integer start0_TCL5=1;
    parameter Integer start0_TCL6=1;
    parameter Integer start0_TCL7=1;
    parameter Integer start0_TCL8=1;
    parameter Integer start0_TCL9=1;
    parameter Integer start0_TCL10=1;
    parameter Integer start0_TCL11=1;
    parameter Integer start0_TCL12=1;
    parameter Integer start0_TCL13=1;
    parameter Integer start0_TCL14=1;
    parameter Integer start0_TCL15=1;
    parameter Integer start0_TCL16=1;
    parameter Integer start0_TCL17=1;
    parameter Integer start0_TCL18=1;
    parameter Integer start0_TCL19=1;
    parameter Integer start0_TCL20=1;
    parameter Integer start0_TCL21=1;
    parameter Integer start0_TCL22=1;
    parameter Integer start0_TCL23=1;
    parameter Integer start0_TCL24=1;
    parameter Integer start0_TCL25=1;
    parameter Integer start0_TCL26=1;
    parameter Integer start0_TCL27=1;
    parameter Integer start0_TCL28=1;
    parameter Integer start0_TCL29=1;
    parameter Integer start0_TCL30=1;
    parameter Integer start0_TCL31=1;
    parameter Integer start0_TCL32=1;
    parameter Modelica.Units.SI.ApparentPower TCL_b = 1400 "TCL Base Power";
    parameter Real P0=1;

    Modelica.Blocks.Interfaces.RealInput u1 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,90}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,90})));
    Modelica.Blocks.Interfaces.RealInput u2 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,50}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,50})));
    Modelica.Blocks.Interfaces.RealInput u3 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,-50}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,-50})));
    Modelica.Blocks.Interfaces.RealInput u4 annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,-90}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={110,-90})));
    ModelPredictiveControl.TCLParameterData.TCLParameters tclparameters(
        redeclare record TCLParameters =
          OpenIPSL.Examples.ModelPredictiveControl.TCLParameterData.TCL01)
      annotation (Placement(transformation(extent={{-126,58},{-106,78}})));
  equation
    connect(pwPin, TCL9.p)
      annotation (Line(points={{-100,0},{-70,0},{-70,18.5}},
                                                           color={0,0,255}));
    connect(TCL2.p, TCL9.p) annotation (Line(points={{-50,58.5},{-50,50},{-84,
            50},{-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL3.p, TCL9.p) annotation (Line(points={{-30,58.5},{-30,50},{-84,
            50},{-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL4.p, TCL9.p) annotation (Line(points={{-10,58.5},{-10,50},{-84,
            50},{-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL5.p, TCL9.p) annotation (Line(points={{10,58.5},{10,50},{-84,50},
            {-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL6.p, TCL9.p) annotation (Line(points={{30,58.5},{30,50},{-84,50},
            {-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL7.p, TCL9.p) annotation (Line(points={{50,58.5},{50,50},{-84,50},
            {-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL8.p, TCL9.p) annotation (Line(points={{70,58.5},{70,50},{-84,50},
            {-84,0},{-70,0},{-70,18.5}},
                                  color={0,0,255}));
    connect(TCL10.p, pwPin)
      annotation (Line(points={{-50,18.5},{-50,0},{-100,0}},
                                                           color={0,0,255}));
    connect(TCL11.p, pwPin)
      annotation (Line(points={{-30,18.5},{-30,0},{-100,0}},
                                                           color={0,0,255}));
    connect(TCL17.p, pwPin)
      annotation (Line(points={{-70,-18.5},{-70,0},{-100,0}},
                                                            color={0,0,255}));
    connect(TCL18.p, pwPin)
      annotation (Line(points={{-50,-18.5},{-50,0},{-100,0}},
                                                            color={0,0,255}));
    connect(TCL19.p, pwPin)
      annotation (Line(points={{-30,-18.5},{-30,0},{-100,0}},
                                                            color={0,0,255}));
    connect(TCL20.p, pwPin)
      annotation (Line(points={{-10,-18.5},{-10,0},{-100,0}},
                                                            color={0,0,255}));
    connect(TCL21.p, pwPin)
      annotation (Line(points={{10,-18.5},{10,0},{-100,0}},
                                                          color={0,0,255}));
    connect(TCL22.p, pwPin)
      annotation (Line(points={{30,-18.5},{30,0},{-100,0}},
                                                          color={0,0,255}));
    connect(TCL23.p, pwPin)
      annotation (Line(points={{50,-18.5},{50,0},{-100,0}},
                                                          color={0,0,255}));
    connect(TCL24.p, pwPin)
      annotation (Line(points={{70,-18.5},{70,0},{-100,0}},
                                                          color={0,0,255}));
    connect(TCL12.p, pwPin)
      annotation (Line(points={{-10,18.5},{-10,0},{-100,0}},
                                                           color={0,0,255}));
    connect(TCL13.p, pwPin)
      annotation (Line(points={{10,18.5},{10,0},{-100,0}},
                                                         color={0,0,255}));
    connect(TCL14.p, pwPin)
      annotation (Line(points={{30,18.5},{30,0},{-100,0}},
                                                         color={0,0,255}));
    connect(TCL15.p, pwPin)
      annotation (Line(points={{50,18.5},{50,0},{-100,0}},
                                                         color={0,0,255}));
    connect(TCL16.p, pwPin)
      annotation (Line(points={{70,18.5},{70,0},{-100,0}},
                                                         color={0,0,255}));
    connect(TCL1.p, pwPin) annotation (Line(points={{-70,58.5},{-70,50},{-84,50},
            {-84,0},{-100,0}},
                          color={0,0,255}));
    connect(TCL25.p, pwPin) annotation (Line(points={{-70,-58.5},{-70,-50},{-84,
            -50},{-84,0},{-100,0}},
                               color={0,0,255}));
    connect(TCL26.p, pwPin) annotation (Line(points={{-50,-58.5},{-50,-50},{-84,
            -50},{-84,0},{-100,0}},
                               color={0,0,255}));
    connect(TCL27.p, pwPin) annotation (Line(points={{-30,-58.5},{-30,-50},{-84,
            -50},{-84,0},{-100,0}},
                               color={0,0,255}));
    connect(TCL28.p, pwPin) annotation (Line(points={{-10,-58.5},{-10,-50},{-84,
            -50},{-84,0},{-100,0}},
                               color={0,0,255}));
    connect(TCL29.p, pwPin) annotation (Line(points={{10,-58.5},{10,-50},{-84,
            -50},{-84,0},{-100,0}},
                              color={0,0,255}));
    connect(TCL30.p, pwPin) annotation (Line(points={{30,-58.5},{30,-50},{-84,
            -50},{-84,0},{-100,0}},
                              color={0,0,255}));
    connect(TCL31.p, pwPin) annotation (Line(points={{50,-58.5},{50,-50},{-84,
            -50},{-84,0},{-100,0}},
                              color={0,0,255}));
    connect(TCL32.p, pwPin) annotation (Line(points={{70,-58.5},{70,-50},{-84,
            -50},{-84,0},{-100,0}},
                              color={0,0,255}));
    connect(TCL1.u, u1) annotation (Line(points={{-74.5188,58},{-74,58},{-74,54},{
            -84,54},{-84,90},{110,90}}, color={0,0,127}));
    connect(TCL2.u, u1) annotation (Line(points={{-54.5188,58},{-54,58},{-54,54},{
            -60,54},{-60,90},{110,90}}, color={0,0,127}));
    connect(TCL3.u, u1) annotation (Line(points={{-34.5188,58},{-34,58},{-34,54},{
            -40,54},{-40,90},{110,90}}, color={0,0,127}));
    connect(TCL4.u, u1) annotation (Line(points={{-14.5188,58},{-14,58},{-14,54},{
            -20,54},{-20,90},{110,90}}, color={0,0,127}));
    connect(TCL5.u, u1) annotation (Line(points={{5.4812,58},{6,58},{6,54},{0,54},
            {0,90},{110,90}}, color={0,0,127}));
    connect(TCL6.u, u1) annotation (Line(points={{25.4812,58},{26,58},{26,54},{20,
            54},{20,90},{110,90}}, color={0,0,127}));
    connect(TCL7.u, u1) annotation (Line(points={{45.4812,58},{46,58},{46,54},{40,
            54},{40,90},{110,90}}, color={0,0,127}));
    connect(TCL8.u, u1) annotation (Line(points={{65.4812,58},{66,58},{66,54},{60,
            54},{60,90},{110,90}}, color={0,0,127}));
    connect(TCL9.u, u2) annotation (Line(points={{-74.5188,18},{-74.5188,16},{-74,
            16},{-74,12},{-82,12},{-82,50},{110,50}}, color={0,0,127}));
    connect(TCL10.u, u2) annotation (Line(points={{-54.5188,18},{-54.5188,12},{-82,
            12},{-82,50},{110,50}}, color={0,0,127}));
    connect(TCL11.u, u2) annotation (Line(points={{-34.5188,18},{-34.5188,12},{-82,
            12},{-82,50},{110,50}}, color={0,0,127}));
    connect(TCL12.u, u2) annotation (Line(points={{-14.5188,18},{-14,18},{-14,12},
            {-82,12},{-82,50},{110,50}}, color={0,0,127}));
    connect(TCL13.u, u2) annotation (Line(points={{5.4812,18},{4,18},{4,12},{-82,12},
            {-82,50},{110,50}}, color={0,0,127}));
    connect(TCL14.u, u2) annotation (Line(points={{25.4812,18},{25.4812,12},{
            -82,12},{-82,50},{110,50}},
                                color={0,0,127}));
    connect(TCL15.u, u2) annotation (Line(points={{45.4812,18},{45.4812,12},{-82,12},
            {-82,50},{110,50}}, color={0,0,127}));
    connect(TCL16.u, u2) annotation (Line(points={{65.4812,18},{66,18},{66,12},{-82,
            12},{-82,50},{110,50}}, color={0,0,127}));
    connect(TCL24.u, u3) annotation (Line(points={{74.5188,-18},{74.5188,-10},{96,
            -10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL23.u, u3) annotation (Line(points={{54.5188,-18},{54.5188,-10},{96,
            -10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL22.u, u3) annotation (Line(points={{34.5188,-18},{36,-18},{36,-10},
            {96,-10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL21.u, u3) annotation (Line(points={{14.5188,-18},{14.5188,-10},{96,
            -10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL20.u, u3) annotation (Line(points={{-5.4812,-18},{-4,-18},{-4,-10},
            {96,-10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL19.u, u3) annotation (Line(points={{-25.4812,-18},{-25.4812,-10},{96,
            -10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL18.u, u3) annotation (Line(points={{-45.4812,-18},{-46,-18},{-46,-10},
            {96,-10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL17.u, u3) annotation (Line(points={{-65.4812,-18},{-65.4812,-10},{96,
            -10},{96,-50},{110,-50}}, color={0,0,127}));
    connect(TCL32.u, u4) annotation (Line(points={{74.5188,-58},{74.5188,-52},{74,
            -52},{74,-46},{88,-46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL31.u, u4) annotation (Line(points={{54.5188,-58},{54.5188,-46},{88,
            -46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL30.u, u4) annotation (Line(points={{34.5188,-58},{34.5188,-46},{88,
            -46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL29.u, u4) annotation (Line(points={{14.5188,-58},{14.5188,-46},{88,
            -46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL28.u, u4) annotation (Line(points={{-5.4812,-58},{-5.4812,-46},{88,
            -46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL27.u, u4) annotation (Line(points={{-25.4812,-58},{-25.4812,-46},{88,
            -46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL26.u, u4) annotation (Line(points={{-45.4812,-58},{-44,-58},{-44,-46},
            {88,-46},{88,-90},{110,-90}}, color={0,0,127}));
    connect(TCL25.u, u4) annotation (Line(points={{-65.4812,-58},{-65.4812,-46},{88,
            -46},{88,-90},{110,-90}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={28,108,200},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Bitmap(
            extent={{-100,-100},{100,100}},
            imageSource="iVBORw0KGgoAAAANSUhEUgAABj0AAAY9CAYAAACVB56QAAAgAElEQVR4XuzdX8zlxXnY8Vn+mLIuAt519m0g3ngRqEq7iJvAhRWblbK0N3UtV71JcxEnm1SGKG9VGTY4qKpkxL7FFy0O21qRixsVRZWCSlxkSoiJ7bo4F6GxqdfGGDtbaV2E3HgtUsKa48ZQNu023dfnvHtm35kzv3nmY8lXPmfmN595zl74q/OeXcl/CBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIBBHYFOIMjECBAgAABAgQIECBAgAABAgQIECBAgAABAgTSrvSPn3qDAwECBAgQIECAAAECBAgQIECAAAECBAgQIECga4Fd6TdFj65v0MMTIECAAAECBAgQIECAAAECBAgQIECAAAECfyEgehgEAgQIECBAgAABAgQIECBAgAABAgQIECBAIISA6BHiGh2CAAECBAgQIECAAAECBAgQIECAAAECBAgQED3MAAECBAgQIECAAAECBAgQIECAAAECBAgQIBBCQPQIcY0OQYAAAQIECBAgQIAAAQIECBAgQIAAAQIECIgeZoAAAQIECBAgQIAAAQIECBAgQIAAAQIECBAIISB6hLhGhyBAgAABAgQIECBAgAABAgQIECBAgAABAgREDzNAgAABAgQIECBAgAABAgQIECBAgAABAgQIhBAQPUJco0MQIECAAAECBAgQIECAAAECBAgQIECAAAECoocZIECAAAECBAgQIECAAAECBAgQIECAAAECBEIIiB4hrtEhCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAdHDDBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIhBESPENfoEAQIECBAgAABAgQIECBAgAABAgQIECBAgIDoYQYIECBAgAABAgQIECBAgAABAgQIECBAgACBEAKiR4hrdAgCBAgQIECAAAECBAgQIECAAAECBAgQIEBA9DADBAgQIECAAAECBAgQIECAAAECBAgQIECAQAgB0SPENToEAQIECBAgQIAAAQIECBAgQIAAAQIECBAgIHqYAQIECBAgQIAAAQIECBAgQIAAAQIECBAgQCCEgOgR4hodggABAgQIECBAgAABAgQIECBAgAABAgQIEBA9zAABAgQIECBAgAABAgQIECBAgAABAgQIECAQQkD0CHGNDkGAAAECBAgQIECAAAECBAgQIECAAAECBAiIHmaAAAECBAgQIECAAAECBAgQIECAAAECBAgQCCEgeoS4RocgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIERA8zQIAAAQIECBAgQIAAAQIECBAgQIAAAQIECIQQED1CXKNDECBAgAABAgQIECBAgAABAgQIECBAgAABAqKHGSBAgAABAgQIECBAgAABAgQIECBAgAABAgRCCIgeIa7RIQgQIECAAAECBAgQIECAAAECBAgQIECAAAHRwwwQIECAAAECBAgQIECAAAECBAgQIECAAAECIQREjxDX6BAECBAgQIAAAQIECBAgQIAAAQIECBAgQICA6GEGCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgRACokeIa3QIAgQIECBAgAABAgQIECBAgAABAgQIECBAQPQwAwQIECBAgAABAgQIECBAgAABAgQIECBAgEAIAdEjxDU6BAECBAgQIECAAAECBAgQIECAAAECBAgQICB6mAECBAgQIECAAAECBAgQIECAAAECBAgQIEAghIDoEeIaHYIAAQIECBAgQIAAAQIECBAgQIAAAQIECBAQPcwAAQIECBAgQIAAAQIECBAgQIAAAQIECBAgEEJA9AhxjQ5BgAABAgQIECBAgAABAgQIECBAgAABAgQIiB5mgAABAgQIECBAgAABAgQIECBAgAABAgQIEAghIHqEuEaHIECAAAECBAgQIECAAAECBAgQIECAAAECBEQPM0CAAAECBAgQIECAAAECBAgQIECAAAECBAiEEBA9QlyjQxAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKihxkgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIEQgiIHiGu0SEIECBAgAABAgQIECBAgAABAgQIECBAgAAB0cMMECBAgAABAgQIECBAgAABAgQIECBAgAABAiEERI8Q1+gQBAgQIECAAAECBAgQIECAAAECBAgQIECAgOhhBggQIECAAAECBAgQIECAAAECBAgQIECAAIEQAqJHiGt0CAIECBAgQIAAAQIECBAgQIAAAQIECBAgQED0MAMECBAgQIAAAQIECBAgQIAAAQIECBAgQIBACAHRI8Q1OgQBAgQIECBAgAABAgQIECBAgAABAgQIECAgepgBAgQIECBAgAABAgQIECBAgAABAgQIECBAIISA6BHiGh2CAAECBAgQIECAAAECBAgQIECAAAECBAgQED3MAAECBAgQIECAAAECBAgQIECAAAECBAgQIBBCQPQIcY0OQYAAAQIECBAgQIAAAQIECBAgQIAAAQIECIgeZoAAAQIECBAgQIAAAQIECBAgQIAAAQIECBAIISB6hLhGhyBAgAABAgQIECBAgAABAgQIECBAgAABAgREDzNAgAABAgQIECBAgAABAgQIECBAgAABAgQIhBAQPUJco0MQIECAAAECBAgQIECAAAECBAgQIECAAAECoocZIECAAAECBAgQIECAAAECBAgQIECAAAECBEIIiB4hrtEhCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAdHDDBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIhBESPENfoEAQIECBAgAABAgQIECBAgAABAgQIECBAgIDoYQYIECBAgAABAgQIECBAgAABAgQIECBAgACBEAKiR4hrdAgCBAgQIECAAAECBAgQIECAAAECBAgQIEBA9DADBAgQIECAAAECBAgQIECAAAECBAgQIECAQAgB0SPENToEAQIECBAgQIAAAQIECBAgQIAAAQIECBAgIHqYAQIECBAgQIAAAQIECBAgQIAAAQIECBAgQCCEgOgR4hodggABAgQIECBAgAABAgQIECBAgAABAgQIEBA9zAABAgQIECBAgAABAgQIECBAgAABAgQIECAQQkD0CHGNDkGAAAECBAgQIECAAAECBAgQIECAAAECBAiIHmaAAAECBAgQIECAAAECBAgQIECAAAECBAgQCCEgeoS4RocgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIERA8zQIAAAQIECBAgQIAAAQIECBAgQIAAAQIECIQQED1CXKNDECBAgAABAgQIECBAgAABAgQIECBAgAABAqKHGSBAgAABAgQIECBAgAABAgQIECBAgAABAgRCCIgeIa7RIQgQIECAAAECBAgQIECAAAECBAgQIECAAAHRwwwQIECAAAECBAgQIECAAAECBAgQIECAAAECIQREjxDX6BAECBAgQIAAAQIECBAgQIAAAQIECBAgQICA6GEGCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgRACokeIa3QIAgQIECBAgAABAgQIECBAgAABAgQIECBAQPQwAwQIECBAgAABAgQIECBAgAABAgQIECBAgEAIAdEjxDU6BAECBAgQIECAAAECBAgQIECAAAECBAgQICB6mAECBAgQIECAAAECBAgQIECAAAECBAgQIEAghIDoEeIaHYIAAQIECBAgQIAAAQIECBAgQIAAAQIECBAQPcwAAQIECBAgQIAAAQIECBAgQIAAAQIECBAgEEJA9AhxjQ5BgAABAgQIECBAgAABAgQIECBAgAABAgQIiB5mgAABAgQIECBAgAABAgQIECBAgAABAgQIEAghIHqEuEaHIECAAAECBAgQIECAAAECBAgQIECAAAECBEQPM0CAAAECBAgQIECAAAECBAgQIECAAAECBAiEEBA9QlyjQxAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKihxkgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIEQgiIHiGu0SEIECBAgAABAgQIECBAgAABAgQIECBAgAAB0cMMECBAgAABAgQIECBAgAABAgQIECBAgAABAiEERI8Q1+gQBAgQIECAAAECBAgQIECAAAECBAgQIECAgOhhBggQIECAAAECBAgQIECAAAECBAgQIECAAIEQAqJHiGt0CAIECBAgQIAAAQIECBAgQIAAAQIECBAgQED0MAMECBAgQIAAAQIECBAgQIAAAQIECBAgQIBACAHRI8Q1OgQBAgQIECBAgAABAgQIECBAgAABAgQIECAgepgBAgQIECBAgAABAgQIECBAgAABAgQIECBAIISA6BHiGh2CAAECBAgQIECAAAECBAgQIECAAAECBAgQED3MAAECBAgQIECAAAECBAgQIECAAAECBAgQIBBCQPQIcY0OQYAAAQIECBAgQIAAAQIECBAgQIAAAQIECIgeZoAAAQIECBAgQIAAAQIECBAgQIAAAQIECBAIISB6hLhGhyBAgAABAgQIECBAgAABAgQIECBAgAABAgREDzNAgAABAgQIECBAgAABAgQIECBAgAABAgQIhBAQPUJco0MQIECAAAECBAgQIECAAAECBAgQIECAAAECoocZIECAAAECBAgQIECAAAECBAgQIECAAAECBEIIiB4hrtEhCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAdHDDBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIhBESPENfoEAQIECBAgAABAgQIECBAgAABAgQIECBAgIDoYQYIECBAgAABAgQIECBAgAABAgQIECBAgACBEAKiR4hrdAgCBAgQIECAAAECBAgQIECAAAECBAgQIEBA9DADBAgQIECAAAECBAgQIECAAAECBAgQIECAQAgB0SPENToEAQIECBAgQIAAAQIECBAgQIAAAQIECBAgIHqYAQIECBAgQIAAAQIECBAgQIAAAQIECBAgQCCEgOgR4hodggABAgQIECBAgAABAgQIECBAgAABAgQIEBA9zAABAgQIECBAgAABAgQIECBAgAABAgQIECAQQkD0CHGNDkGAAAECBAgQIECAAAECBAgQIECAAAECBAiIHmaAAAECBAgQIECAAAECBAgQIECAAAECBAgQCCEgeoS4RocgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIERA8zQIAAAQIECBAgQIAAAQIECBAgQIAAAQIECIQQED1CXKNDECBAgAABAgQIECBAgAABAgQIECBAgAABAqKHGSBAgAABAgQIECBAgAABAgQIECBAgAABAgRCCIgeIa7RIQgQIECAAAECBAgQIECAAAECBAgQIECAAAHRwwwQIECAAAECBAgQIECAAAECBAgQIECAAAECIQREjxDX6BAECBAgQIAAAQIECBAgQIAAAQIECBAgQICA6GEGCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgRACokeIa3QIAgQIECBAgAABAgQIECBAgAABAgQIECBAQPQwAwQIECBAgAABAgQIECBAgAABAgQIECBAgEAIAdEjxDU6BAECBAgQIECAAAECBAgQIECAAAECBAgQICB6mAECBAgQIECAAAECBAgQIECAAAECBAgQIEAghIDoEeIaHYIAAQIECBAgQIAAAQIECBAgQIAAAQIECBAQPcwAAQIECBAgQIAAAQIECBAgQIAAAQIECBAgEEJA9AhxjQ5BgAABAgQIECBAgAABAgQIECBAgAABAgQIiB5mgAABAgQIECBAgAABAgQIECBAgAABAgQIEAghIHqEuEaHIECAAAECBAgQIECAAAECBAgQIECAAAECBEQPM0CAAAECBAgQIECAAAECBAgQIECAAAECBAiEEBA9QlyjQxAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKihxkgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIEQgiIHiGu0SEIECBAgAABAgQIECBAgAABAgQIECBAgAAB0cMMECBAgAABAgQIECBAgAABAgQIECBAgAABAiEERI8Q1+gQBAgQIECAAAECBAgQIECAAAECBAgQIECAgOhhBggQIECAAAECBAgQIECAAAECBAgQIECAAIEQAqJHiGt0CAIECBAgQIAAAQIECBAgQIAAAQIECBAgQED0MAMECBAgQIAAAQIECBAgQIAAAQIECBAgQIBACAHRI8Q1OgQBAgQIECBAgAABAgQIECBAgAABAgQIECAgepgBAgQIECBAgAABAgQIECBAgAABAgQIECBAIISA6BHiGh2CAAECBAgQIECAAAECBAgQIECAAAECBAgQED3MAAECBAgQIECAAAECBAgQIECAAAECBAgQIBBCQPQIcY0OQYAAAQIECBAgQIAAAQIECBAgQIAAAQIECIgeZoAAAQIECBAgQIAAAQIECBAgQIAAAQIECBAIISB6hLhGhyBAgAABAgQIECBAgAABAgQIECBAgAABAgREDzNAgAABAgQIECBAgAABAgQIECBAgAABAgQIhBAQPUJco0MQIECAAAECBAgQIECAAAECBAgQIECAAAECoocZIECAAAECBAgQIECAAAECBAgQIECAAAECBEIIiB4hrtEhCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAdHDDBAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIhBESPENfoEAQIECBAgAABAgQIECBAgAABAgQIECBAgIDoYQYIECBAgAABAgQIECBAgAABAgQIECBAgACBEAKiR4hrdAgCBAgQIECAAAECBAgQIECAAAECBAgQIEBA9DADBAgQIECAAAECBAgQIECAAAECBAgQIECAQAgB0SPENToEAQIECBAgQIAAAQIECBAgQIAAAQIECBAgIHqYAQIECBAgQIAAAQIECBAgQIAAAQIECBAgQCCEgOgR4hodggABAgQIECBAgAABAgQIECBAgAABAgQIEBA9zAABAgQIECBAgAABAgQIECBAgAABAgQIECAQQkD0CHGNDkGAAAECBAgQIECAAAECBAgQIECAAAECBAiIHmaAAAECBAgQIECAAAECBAgQIECAAAECBAgQCCEgeoS4RocgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIERA8zQIAAAQIECBAgQIAAAQIECBAgQIAAAQIECIQQED1CXKNDECBAgAABAgQIECBAgAABAgQIECBAgAABAqKHGSBAgAABAgQIECBAgAABAgQIECBAgAABAgRCCIgeIa7RIQgQIECAAAECBAgQIECAAAECBAgQIECAAAHRwwwQIECAAAECBAgQIECAAAECBAgQIECAAAECIQREjxDX6BAECBAgQIAAAQIECBAgQIAAAQIECBAgQICA6GEGCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgRACokeIa3QIAgQIECBAgAABAgQIECBAgAABAgQIECBAQPQwAwQIECBAgAABAgQIECBAgAABAgQIECBAgEAIAdEjxDU6BAECBAgQIECAAAECBAgQIECAAAECBAgQICB6mAECBAgQIECAAAECBAgQIECAAAECBAgQIEAghIDoEeIaHYIAAQIECBAgQIAAAQIECBAgQIAAAQIECBAQPcwAAQIECBAgQIAAAQIECBAgQIAAAQIECBAgEEJA9AhxjQ5BgAABAgQIECBAgAABAgQIECBAgAABAgQIiB5mgAABAgQIECBAgAABAgQIECBAgAABAgQIEAghIHqEuEaHIECAAAECBAgQIECAAAECBAgQIECAAAECBEQPM0CAAAECBAgQIECAAAECBAgQIECAAAECBAiEEBA9QlyjQxAgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKihxkgQIAAAQIECBAgQIAAAQIECBAgQIAAAQIEQgiIHiGu0SEIECBAgAABAgQIECBAgAABAgQIECBAgAAB0cMMECBAgAABAgQIECBAgAABAgQIECBAgAABAiEERI8Q1+gQBAgQIECAAAECBAgQIECAAAECBAgQIECAgOhhBggQIECAAAECBAgQIECAAAECBAgQIECAAIEQAqJHiGt0CAIECBAgQIAAgQUCF5/+Lps3BX6we40DAQIECBAgQIAAAQIE4guIHvHv2AkJECBAgAABAiMLXPqn/z39yO/+2sgE6bUfvSl9990fHNrA4QkQIECAAAECBAgQGERA9Bjkoh2TAAECBAgQIDCogOiRRI9BZ9+xCRAgQIAAAQIECAwpIHoMee0OTYAAAQIECBAYRkD0ED2GGXYHJUCAAAECBAgQIEAgJdHDFBAgQIAAAQIECEQWED1Ej8jz7WwECBAgQIAAAQIECGwRED2MBAECBAgQIECAQGQB0UP0iDzfzkaAAAECBAgQIECA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I+a9OhUBAgQIECBAYKUCosdKuW1GgAABAgQIEAgnIHqEu1IHItBMQPRoRm9jAgQIECBAgEAcAdEjzl06CQECBAgQIECghYDo0ULdngRiCogeMe/VqQgQIECAAAECKxUQPVbKbTMCBAgQIECAQDgB0SPclToQgWYCokczehsTIECAAAECBOIIiB5x7tJJCBAgQIAAAQItBKYePV588cX0wAMPtKBZuOdVV12V7rnnnkk90zIPc/LkyfTggw8u89KVvWbPnj3p7rvvXtl+pTY6ceJE+tjHPlZquSLr7N27N911111F1rrQRUSPC5XzPgIECBAgQIAAgf8nIHoYBgIECBAgQIAAgZ0I9BA9PvzhD+/kiMXfu2/fvm6jx3333VfcYycL7t+/v9vocf/99+/k6MXfe/3114sexVUtSIAAAQIECBAgsHIB0WPl5DYkQIAAAQIECIQSED3yr1P0yDdb9A7Ro5yl6FHO0koECBAgQIAAAQINBUSPhvi2JkCAAAECBAgEEBA98i9R9Mg3Ez3KmS1aSfSob2wHAgQIECBAgACBFQiIHitAtgUBAgQIECBAILCA6JF/uaJHvpnoUc5M9KhvaQcCBAgQIECAAIGGAqJHQ3xbEyBAgAABAgQCCIge+ZcoeuSbiR7lzESP+pZ2IECAAAECBAgQaCggejTEtzUBAgQIECBAIICA6JF/iaJHvpnoUc5M9KhvaQcCBAgQIECAAIGGAqJHQ3xbEyBAgAABAgQCCPQePd7znvekK664ovhNfPnLX05f+cpX5q4bNXq8973vTW9961uLWz777LPpueeem7tu1B8yf9/73pcuv/zy4pZf/OIX0/PPPz93Xb/pUZzbggQIECBAgAABAi0ERI8W6vYkQIAAAQIECMQR6D163HvvvWnv3r3FL+Sxxx5Ljz/++FDRY3NzM62trRW3fPTRR9OTTz45VPT4yEc+kq688srilo888kh66qmnRI/ishYkQIAAAQIECBCYjIDoMZmr8CAECBAgQIAAgS4FRI/51yZ6lBtn0aOcpehRztJKBAgQIECAAAECExUQPSZ6MR6LAAECBAgQINCJgOghepwV8E2P5T+0J06cSPfff//CN/imx3yaUwePpNn6geWhvZIAAQIECBAgQGA8AdFjvDt3YgIECBAgQIBASQHRQ/QQPfI/UaLHfLPZbJY2NjYWgooe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"
                 + "BAi0EhA9Wsk321f0KEMvemzvKHqUmTOrECBAgAABAgQIVBQQPSriWpoAAQIECBAg0EpA9Ggl32xf0aMMveghepwR8OetynyerEKAAAECBAgQaCIgejRhtykBAgQIECBAoK6A6FHXd4Krz4seZx7z6Xvfnt6+55IJPvE0H+lf/+eU7v135/55q3v+3lr6h4eunOYDr/ipnvmfN6W/f/cnF+569OjRtGfPnhU/1YVtd+zYsXT8+PG5bxY9LszUuwgQIECAAAECkxAQPSZxDR6CAAECBAgQIFBWQPQo69nBaouih//DPu/y7vitlB7/wrnR490/cXl6+Ff+Wt5CQV/9yT/5W+kf/dPfED2C3q9jESBAgAABAgRCCIgeIa7RIQgQIECAAAEC5woMEj2uueaadPjwYbf/psCnPvWp9KUvfWmuxb//1evST/74G5zOI/BHr9yUfuXXn0kvvvjiD73yQ+9bSx+4bexve5zxeeKbP5I+/vGPix4+TQQIECBAgAABAtMVED2mezeejAABAgQIECBwwQKDRI8L9hnwjT/7rivSgbdflt52xcUDnn77I3/jpe+nz371e+mZP35t2xe+681vfPzUX788Xbd+6VCGy/qcQfHnrYYaDYclQIAAAQIECExTQPSY5r14KgIECBAgQIDAjgREjx3xeTMBAhcmIHpcmJt3ESBAgAABAgQIFBQQPQpiWooAAQIECBAgMBUB0WMqN+E5CAwlIHoMdd0OS4AAAQIECBCYpoDoMc178VQE/jd7dxp/V1ke/P5OIECYIYwyhWgd4yw9/TjhQLUOda7a1mKfQ1WqxgEcCJMIJg6IdQhgndDGoRNaz6OeYxVrNS3IoEKwdezpCYKgCGEwRbDwuM2J52D2f++Qfd37WmvfX17v/3Wv9b3WfuPPtUOAAAECBAhMJCB6TMTnjwkQ2DoB0WPr3PwVAQIECBAgQIBAoIDoEYhpFAECBAgQIECgKwKiR1c24ToINCUgejS1bjdLgAABAgQIEOimgOjRzb24KgIECBAgQIDARAKix0R8/pgAga0TED22zs1fESBAgAABAgQIBAqIHoGYRhEgQIAAAQIEuiIgenRlE66DQFMCokdT63azBAgQIECAAIFuCoge3dyLqyJAgAABAgQITCTQSPQ48MADy9FHH/0rqnnljrLbNusnYuvTH99yxw7lltsX/vqS/+Ef/qFcfPHFQ2/hnve8ZznyyCP7dHtp13rWWWeVq666auj5j3nMY8oRRxyRdm1dOHhgMzCa6z/Rowtbcg0ECBAgQIAAgcYFRI/GHwC3T4AAAQIECMymQCPRY/HixeXE5ceW+9x+Xjngjst+FT5a+u/mslf59vzHl2vnHVpWr15d1qxZM/T2ly5dWpYtW9YSzVbf64oVK8q6deuG/v1TnvKU8rSnPW2rZ8/CHw5sBkaixyxs0z0QIECAAAECBGZUQPSY0cW6LQIECBAgQKBtgYaix7mvv3vZ647/aHrfF8w/srzno+eJHgFPgegxGlH0CHjIjCBAgAABAgQIEKgrIHrU9TWdAAECBAgQIJAi0Ej0eOETF5dTnz4vhbhLh147b0l55cd+LnoELOVNb3pTueKKK4ZO8qZH+dVbMN70CHjQjCBAgAABAgQIEKgnIHrUszWZAAECBAgQIJAm0Ej0WHHkoeUFv5Om3JmDby07lv/x8T1Ej4CNjIoeT33qU8vv//7vB5zS3xGiR39358oJECBAgAABAs0IiB7NrNqNEiBAgAABAi0JNBI93vmiQ8szH9zSYoff6x1lfnnBx/cXPQIeBdFjNKLoEfCQGUGAAAECBAgQIFBXQPSo62s6AQIECBAgQCBFQPRIYc86VPSIkz/ttNPKD3/4w6EDvenh563injSTCBAgQIAAAQIEqgmIHtVoDSZAgAABAgQI5AmIHnn2CSeLHnHoosdoS296xD1rJhEgQIAAAQIECFQSED0qwRpLgAABAgQIEMgUED0y9ad+tugRRz4qegz+PY/B2x4t/yd6tLx9906AAAECBAgQ6ImA6NGTRblMAgQIECBAgMBdERA97opW7z8resStUPQYbSl6xD1rJhEgQIAAAQIECFQSED0qwRpLgAABAgQIEMgUED0y9ad+tugRR37qqaeWK6+8cuhAb3r4Nz3injSTCBAgQIAAAQIEqgmIHtVoDSZAgAABAgQI5AmIHnn2CSeLHnHoo6LH0572tPKUpzwl7rAeTvKmRw+X5pIJECBAgAABAq0JiB6tbdz9EiBAgAABAk0IiB5NrHnTTYoecesWPUZbih5xz5pJBAgQIECAAAEClQREj0qwxhIgQIAAAQIEMgVEj0z9qZ8tesSRv/GNbyxXXXXV0IHe9PDzVnFPmkkECBAgQIAAAQLVBESParQGEyBAgAABAgTyBESPPPuEk0WPOPRR0ePpT396efKTnxx3WA8nedOjh0tzyQQIECBAgACB1gREj9Y27n4JECBAgACBJgREjybWvOkmRY+4dYseoy1Fj7hnzSQCBAgQIECAAIFKAqJHJVhjCRAgQIAAAQKZAqJHpv7UzxY94shPOeWU8qMf/WjoQG96+HmruCfNJAIECBAgQIAAgWoCokc1WoMJECBAgAABAnkCokeefcLJokcc+qjo8YxnPKM86UlPijush5O86dHDpblkAgQIECBAgEBrAqJHaxt3vwQIECBAgEATAqJHE2vedJOiR9y6RY/RlqJH3LNmEgECBAgQIECAQCUB0aMSrLEECBAgQIAAgUwB0SNTf+pnix5x5G94wxvK1VdfPXSgNz38vFXck2YSAQIECBAgQIBANQHRoxqtwQQIECBAgACBPAHRI88+4WTRIw59VPTTpeymAAAgAElEQVR45jOfWX7v934v7rAeTvKmRw+X5pIJECBAgAABAq0JiB6tbdz9EiBAgAABAk0IiB5NrHnTTYoecesWPUZbih5xz5pJBAgQIECAAAEClQREj0qwxhIgQIAAAQIEMgVEj0z9qZ8tesSRix6ix0Bgw5LDy/rDjop7sEwiQIAAAQIECBCYnoDoMT1rJxEgQIAAAQIEpiYgekyNugsHiR5xWzj55JPLNddcM3Sgn7fyb3rEPWkmESBAgAABAgQIVBMQParRGkyAAAECBAgQyBMQPfLsE04WPeLQR0WPZz3rWeWJT3xi3GE9nOTnrXq4NJdMgAABAgQIEGhNQPRobePulwABAgQIEGhCQPRoYs2bblL0iFu36DHaUvSIe9ZMIkCAAAECBAgQqCQgelSCNZYAAQIECBAgkCkgemTqT/1s0SOO/KSTTio//vGPhw70poeft4p70kwiQIAAAQIECBCoJiB6VKM1mAABAgQIECCQJyB65NknnCx6xKGPih7PfvazyxOe8IS4w3o4yZsePVyaSyZAgAABAgQItCYgerS2cfdLgAABAgQINCEgejSx5k03KXrErVv0GG0pesQ9ayYRIECAAAECBAhUEhA9KsEaS4AAAQIECBDIFBA9MvWnfrboEUd+4oknlp/85CdDB3rTw89bxT1pJhEgQIAAAQIECFQTED2q0RpMgAABAgQIEMgTED3y7BNOFj3i0EdFj+c85znld3/3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CPh5q5jvkykECBAgQIAAgRQB0SOF3aEECBAgQIAAgboCokdd3w5OFz1iljIqepx66qll3333jTmop1O86dHTxblsAgQIECBAgEBLAqJHS9t2rwQIECBAgEAzAqJHM6vedKOiR8zKRY/RjqJHzHNmCgECBAgQIECAQEUB0aMirtEECBAgQIAAgSwB0SNLPu1c0SOGXvQQPQYCft4q5vtkCgECBAgQIEAgRUD0SGF3KAECBAgQIECgroDoUde3g9NFj5iliB6ih+gR810yhQABAgQIECCQJiB6pNE7mAABAgQIECBQT0D0qGfb0cmiR8xiRkWP0047reyzzz4xB/V0ip+36uniXDYBAgQIECBAoCUB0aOlbbtXAgQIECBAoBkB0aOZVW+6UdEjZuWix2hH0SPmOTOFAAECBAgQIECgooDoURHXaAIECBAgQIBAloDokSWfdq7oEUMveogeAwH/pkfM98kUAgQIECBAgECKgOiRwu5QAgQIECBAgEBdAdGjrm8Hp4seMUsZFT3e9KY3lb333jvmoJ5O8aZHTxfnsgkQIECAAAECLQmIHi1t270SIECAAAECzQiIHs2setONih4xKxc9RjuKHjHPmSkECBAgQIAAAQIVBUSPirhGEyBAgAABAgSyBESPLPm0c0WPGHrRQ/QYCPh5q5jvkykECBAgQIAAgRQB0SOF3aEECBAgQIAAgboCokdd3w5OFz1iljIqeqxYsaLstddeMQf1dIo3PXq6OJdNgAABAgQIEGhJQPRoadvulQABAgQIEGhGQPRoZtWbblT0iFm56DHaUfSIec5MIUCAAAECBAgQqCggelTENZoAAQIECBAgkCUgemTJp50resTQix6ix0DAz1vFfJ9MIUCAAAECBAikCIgeKewOJUCAAAECBAjUFRA96vp2cLroEbOUUdFj5cqVZdGiRTEH9XSKNz16ujiXTYAAAQIECBBoSUD0aGnb7pUAAQIECBBoRkD0aGbVm25U9IhZuegx2lH0iHnOTCFAgAABAgQIEKgoIHpUxDWaAAECBAgQIJAlIHpkyaedK3rE0IseosdAwM9bxXyfTCFAgAABAgQIpAiIHinsDiVAgAABAgQI1BUQPer6dnC66BGzFNFD9BA9Yr5LphAgQIAAAQIE0gREjzR6BxMgQIAAAQIE6gmIHvVsOzpZ9IhZzKjo8eY3v7ns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IECg9wKiR+9X6AYIECBAgAABApsLiB7NPRXDosc2v/znO36w6tDiR622/HH4xJqbynEfv3azP9h5553LGWecseWDZvSToseMLtZtESBAgAABAgRmSUD0mKVtuhcCBAgQIECAwP8rIHo09ygMix6Df7z8O+9a3JzFJDd87tduLsd85CeixxyIosckT5e/JUCAAAECBAgQmIqA6DEVZocQIECAAAECBKYrIHpM17sDp4keMUsQPUY7ih4xz5kpBAgQIECAAAECFQVEj4q4RhMgQIAAAQIEsgREjyz5tHNFjxj6uaLHLrvsUt7+9rfHHNLjKaJHj5fn0gkQIECAAAECrQiIHq1s2n0SIECAAAECTQmIHk2te3CzokfMykWP0Y6iR8xzZgoBAgQIECBAgEBFAdGjIq7RBAgQIECAAIEsAdEjSz7tXNEjhl70ED0GAhuWHF7WH3ZUzENlCgECBAgQIECAwHQFRI/pejuNAAECBAgQIDAVAdFjKsxdOkT0iNmG6CF6iB4x3yVTCBAgQIAAAQJpAqJHGr2DCRAgQIAAAQL1BESPerYdnSx6xCxmruix6667ltNPPz3mkB5P8fNWPV6eSydAgAABAgQItCIgerSyafdJgAABAgQINCUgejS17sHNih4xKxc9RjuKHjHPmSkECBAgQIAAAQIVBUSPirhGEyBAgAABAgSyBESPLPm0c0WPGHrRQ/QYCPg3PWK+T6YQIECAAAECBFIERI8UdocSIECAAAECBOoKiB51fTs4XfSIWcpc0WO33XYrb3vb22IO6fEUb3r0eHkunQABAgQIECDQioDo0cqm3ScBAgQIECDQlIDo0dS6BzcresSsXPQY7Sh6xDxnphAgQIAAAQIECFQUED0q4hpNgAABAgQIEMgSED2y5NPOFT1i6EUP0WMg4OetYr5PphAgQIAAAQIEUgREjxR2hxIgQIAAAQIE6gqIHnV9Ozhd9IhZylzRY/fddy9vfetbYw7p8RRvevR4eS6dAAECBAgQINCKgOjRyqbdJwECBAgQINCUgOjR1LoHNyt6xKxc9BjtKHrEPGemECBAgAABAgQIVBQQPSriGk2AAAECBAgQyBIQPbLk084VPWLoRQ/RYyDg561ivk+mECBAgAABAgRSBESPFHaHEiBAgAABAgTqCogedX07OF30iFnKXNFjjz32KG95y1tiDunx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"
                 + "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cbErPbJFrvRI56f0SOdkFAECBAgQIECAQEQBpUdEfEsTIECAAAECBPISUHrkJVvaeZUe2aJJSo/zP/rNsH379mEnctJjkEXpke05czUBAgQIECBAgEABAkqPApAtQYAAAQIECBAoWkDpUbR49PWUHtkiaFd6/O7v/m54y1vekm2RGlyt9KhBiG6BAAECBAgQIFB3AaVH3RN2fwQIECBAgEAjBZQejYtd6ZEtcqVHOj+lRzonowgQIECAAAECBCIKKD0i4luaAAECBAgQIJCXgNIjL9nSzqv0yBZNUnq848/+KezYsWPYiZz0GGRRemR7zlxNgAABAgQIECBQgIDSowBkSxAgQIAAAQIEihZQehQtHn09pUe2CNqVHr/3e78Xfu3Xfi3bIjW4WulRgxDdAgECBAgQIECg7gJKj7on7P4IECBAgACBRgooPRoXu9IjW+RKj3R+So90TkYRIECAAAECBAhEFFB6RMS3NAECBAgQIEAgLwGlR16ypZ1X6ZEtmqT0ePuf/mPYuXPnsBM56THIovTI9py5mgABAgQIECBAoAABpUcByJYgQIAAAQIECBQtoPQoWjz6ekqPbBEoPdL5KT3SORlFgAABAgQIECAQUUDpERHf0gQIECBAgACBvASUHnnJlnZepUe2aNqVHpdcckl485vfnG2RGlyt9KhBiG6BAAECBAgQIFB3AaVH3RN2fwQIECBAgEAjBZQejYtd6ZEtcqVHOj+lRzonowgQIECAAAECBCIKKD0i4luaAAECBAgQIJCXgNIjL9nSzqv0yBZNUnosu3ZN2LVr17ATOekxyKL0yPacuZoAAQIECBAgQKAAAaVHAciWIECAAAECBAgULaD0KFo8+npKj2wRtCs9fv/3fz+cc8452RapwdVKjxqE6BYIECBAgAABAnUXUHrUPWH3R4AAAQIECDRSQOnRuNiVHtkiV3qk81N6pHMyigABAgQIECBAIKKA0iMivqUJECBAgAABAnkJKD3yki3tvEqPbNEkpcfSP/lG2L1797ATOekxyKL0yPacuZoAAQIECBAgQKAAAaVHAciWIECAAAECBAgULaD0KFo8+npKj2wRtCs9/uAP/iAsXrw42yI1uFrpUYMQ3QIBAgQIECBAoO4CSo+6J+z+CBAgQIAAgUYKKD0aF7vSI1vkSo90fkqPdE5GESBAgAABAgQIRBRQ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"
                 + "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CBAgQIBADgLJ73kkn0quymv6/PlhUl9fVbZb2D59srww6kIWcgKrEObcFpFfbrQmboiA0qMhQbtNAgQIECBAgAABAgQIECCQh0D/nj2Hfsg8j/m7OWfPxIlh6kkn+SHzYVB9srybT1r8uZzAip9Blh3IL4ueawmEoPTwFBAgQIAAAQIECBAgQIAAAQIEGi7gk+X1egCcwKp2nvKrdn52H19A6RE/AzsgQIAAAQIECBAgQIAAAQIECEQV8MnyqPxdX9wJrK6TFjqh/ArltlgNBZQeNQzVLREgQIAAAQIECBAgQIAAAQIEOhHwyfJOtIwlQIAAgTILKD3KnI69ESBAgAABAgQIECBAgAABAgQKEPDJ8gKQLUGAAAEChQgoPQphtggBAgQIECBAgAABAgQIECBAgAABAgQIECCQt4DSI29h8xMgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKFCCg9CmG2CAECBAgQIECAAAECBAgQIECAAAECBAgQIJC3gNIjb2HzEyBAgAABAgQIECBAgAABAgQIECBAgAABAoUIKD0KYbYIAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkLeA0iNvYfMTIECAAAECBAgQIECAAAECBAgQIECAAAEChQgoPQphtggBAgQIECBAgAABAgQIECBAgAABAgQIECCQt4DSI29h8xMgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKFCCg9CmG2CAECBAgQIECAAAECBAgQIECAAAECBAgQIJC3gNIjb2HzEyBAgAABAgQIECBAgAABAgQIECBAgAABAoUIKD0KYbYIAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkLeA0iNvYfMTIECAAAECBAgQIECAAAECBAgQIECAAAEChQgoPQphtggBAgQIECBAgAABAgQIECBAgAABAgQIECCQt4DSI29h8xMgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKFCCg9CmG2CAECBAgQIECAAAECBAgQIECAAAECBAgQIJC3gNIjb2HzEyBAgAABAgQIECBAgAABAgQIECBAgAABAoUIKD0KYbYIAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkLeA0iNvYfMTIECAAAECBAgQIECAAAECBAgQIECAAAEChQgoPQphtggBAgQIECBAgAABAgQIECBAgAABAgQIECCQt4DSI29h8xMgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKFCCg9CmG2CAECBAgQIECAAAECBAgQIECAAAECBAgQIJAiUWEaAAAgAElEQVS3gNIjb2HzEyBAgAABAgQIECBAgAABAgQIECBAgAABAoUIKD0KYbYIAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkLeA0iNvYfMTIECAAAECBAgQIECAAAECBAgQIECAAAEChQgoPQphtggBAgQIECBAgAABAgQIECBAgAABAgQIECCQt4DSI29h8xMgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKFCCg9CmG2CAECBAgQIECAAAECBAgQIECAAAECBAgQIJC3gNIjb2HzEyBAgAABAgQIECBAgAABAgQIECBAgAABAoUIKD0KYbYIAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkLeA0iNvYfMTIECAAAECBAgQIECAAAECBAgQIECAAAEChQgoPQphtggBAgQIECBAgAABAgQIECBAgAABAgQIECCQt4DSI29h8xMgQIAAAQIECBAgQIAAAQIECBAgQIAAAQKFCCg9CmG2CAECBAgQIECAAAECBAgQIECAAAECeQts3bo1bNu2LezYsSO8+OKL4aijjgrjxo1r/d/Q/z/cv+vkv6cdm/e9mp8AgeEFlB6eDAIECBAgQIAAAQIECBAgQIAAAQIEKimwZcuW8Pzzz4dNmza1/i8pOsryemk5MtL/366ASVuwpFmr23OVxdk+CLxcQOnhmSBAgAABAgQIECBAgAABAgQIECBAoDICmzdvDr/4xS9a/7dr167K7LtuG83r5Myxxx4bhv5vwoQJdWNzPwUIKD0KQLYEAQIECBAgQIAAAQIECBAgQIAAAQJjF9izZ0948sknwzPPPBN27tw59olcWSmBadOmhblz54YZM2ZUat82G1dA6RHX3+oECBAgQIAAAQIECBAgQIAAAQIECIwgkJzqSMqOp59+mlGDBWbOnNkqP44//vgGK7j1tAJKj7RSxhEgQIAAAQIECBAgQIAAAQIECBAgUIhA8tVVTzzxREhKDy8CiUDydVpnn3126OvrA0JgVAGlhweEAAECBAgQIECAAAECBAgQIECAAIFSCCQlx2OPPRY2btxYiv3YRLkEenp6wllnnRWSr73yIjCSgNLDs0GAAAECBAgQIECAAAECBAgQIECAQFSB7du3t8qO5Dc7vAiMJjB+/Phw7rnnht7eXlAEhhVQengwCBAgQIAAAQIECBAgQIAAAQIECBCIJvDw/9/enQdJWZyPA28QBAE5RA2KioAnCogooqAgiopiNCalMWpFE0m8jSmNt/FMmZRHEmPiWcY7njFqeUcigrcoHoiCAgIqHiy33Pyq51e7312YXXbmndl9Z/bTVVMbmffpfvrTk3/mme7+6KPw6aefNtr4Bi49gR49eoRevXqVXuIybhABRY8GYTYIAQIECBAgQIAAAQIECBAgQIAAAQLVBb777rswceLEMG/ePDAEchJo1qxZ2H///UOrVq1yivNw0xBQ9Gga62yWBAgQIECAAAECBAgQIECAAAECBFIj8PHHH4fJkyenJh+JlJ7ANttsE3bYYYfSS1zGRRdQ9Cg6sQEIECBAgAABAgQIECBAgAABAgQIEIgCc+fODR9++GGoqKgAQiCRQNu2bcO+++6bqA/B5Smg6FGe62pWBAgQIECAAAECBAgQIECAAAECBFIlMGPGjDBhwoRU5SSZ0hYYNmxYaNOmTWlPQvYFF1D0KDipDgkQIECAAAECBAgQIECAAAECBAgQqC4Qj7KKR1ppBAop0Ldv37DlllsWskt9lYGAokcZLKIpECBAgAABAgQIECBAgAABAgQIEEirwPvvvx+mT5+e1vTkVcICW2yxRdhll11KeAZSL4aAokcxVPVJgAABAgQIECBAgAABAgQIECBAoIkLrFy5MowfPz7Mnj27iUuYfrEE2rVrF4YOHVqs7vVbogKKHiW6cNImQIAAAQIECBAgQIAAAQIECBAgkFaBRYsWZQoe8+bNS2uK8ioTgYMOOii0aNGiTGZjGoUQUPQohKI+CBAgQIAAAQIECBAgQIAAAQIECBDICMyfPz+8+eab4fvvvydCoOgCe+65Z+jcuXPRxzFA6QgoepTOWsmUAAECBAgQIECAAAECBAgQIECAQKoF4s6OWPBYsmRJqvOUXPkI9OrVK/To0aN8JmQmiQUUPRIT6oAAAQIECBAgQIAAAQIECBAgQIAAgblz52YKHkuXLoVBoMEEunXrFnr37t1g4xko/QKKHulfIxkSIECAAAECBAgQIECAAAECBAgQSLVARUVFpuCxbNmyVOcpufIT2HjjjcPAgQPLb2JmlLeAokfedAIJECBAgAABAgQIECBAgAABAgQIEJgzZ06m4LF8+XIYBBpcoE2bNmHYsGENPq4B0yug6JHetZEZAQIECBAgQIAAAQIECBAgQIAAgVQLfPfdd5mCx4oVK4qWZ/fu3cM222wTevbsGbbccsuw2WabZV4dOnQIzzzzTLj88svzHnvTTTcNY8aMCatXrw6rVq2q+hv/97r+u7aY2mKz9Vf5bF0xaz4T/3vlypWZ/Gp7rfl+5X9X//c1/y3+d/V/q/zv2v7GNY/vxb+Vr1j4qnzFXT/xMvuGKIYdcsghoVmzZnl/DgSWl4CiR3mtp9kQIECAAAECBAgQIECAAAECBAgQaBCBWPB44403Ml98F7L1798/7LfffqFfv35hl112Ce3bt6+1+5tuuilcccUVeQ8fix7vvPNO3vEC1y0QPyeTJk0KDz74YHj44YfXHZDHE/vuu29o27ZtHpFCylFA0aMcV9WcCBAgQIAAAQIECBAgQIAAAQIECBRR4Ntvv83s8ChkwaNLly7hsssuCyNHjqx35tdee2247rrr6v38mg9usskm4d133807XmBuAoceemgYP358bkH1eHqPPfYIcS01AlFA0cPngAABAgQIECBAgAABAgQIECBAgACBegsUq+Bx1113hZ122qneecQH49FWN998c04x1R+Ol2BPmDAh73iBuQkk3ZlT22i9e/cO3bp1yy0ZT5etgKJH2S6tiREgQIAAAQIECBAgQIAAAQIECBAorEAseMQjreJdEoVq8Rf699xzT9h5551z7vK8884Ld999d85xlQGdO3cO7733Xt7xAnMTGDt2bDjqqKNyC6rH0z169Ai9evWqx5MeaQoCih5NYZXNkQABAgQIECBAgAABAgQIECBAgEBCgWIUPDp16hTuvffe0Ldv37yyO/3008Ojjz6aV2wMiuN/8MEHeccLzE1g9uzZYdddd80tqB5Px6PRdtttt3o86ZGmIKDo0RRW2RwJECBAgAABAgQIECBAgAABAgQIJBAoxqXl7dq1y+zw2H333fPO7IQTTgjPPfdc3vEdO3YMH374Yd7xAnMX2H777cPChQtzD6wjIq7j4MGDC9qnzkpXQNGjdNdO5gQIECBAgAABAgQIECBAgAABAgSKLlCMgkfLli0zOzwGDRqUKP94VFI8Minf1qFDhzBx4sR8w8XlIXDAAQcUvNDUpk2bMGzYsDyyEVKOAooe5biq5kSAAAECBAgQIECAAAECBAgQIECgAALFKHjEtOI9HIX4knrkyJHhnXfeyXum7du3Dx999FHe8QJzFxg1alR46qmncg+sI2K99dYLI0aMKGifOitdAUWP0l07mRMgQIAAAQIECBAgQIAAAQIECBAomsCcOXMyl5avWLGioGPcdtttBfuCet999w2ffPJJ3vnFI7Y+/vjjvOMF5i5wxRVXhJtuuin3wHVExKJHLH5oBBQ9fAYIECBAgAABAgQIECBAgAABAgQIEKghUFFRkSl4LF++vKAyN954Yzj88MML1me8D+SLL77Iu7+2bdsmKprkPXATDrzzzjvDBRdcUHCBuHMoHnOlEVD08BkgQIAAAQIECBAgQIAAAQIECBAgQKBKYO7cuZmCx7Jlywqqct1114V4B0ch24477hjmz5+fd5fxS/LJkyfnHS8wd4HRo0eHY489NvfAdUTEi8zjheYaAUUPnwECBAgQIECAAAECBAgQIECAAAECBDIC8+bNyxQ8li5dWlCRq666Khx//PEF7TN2ttVWW4WVK1fm3e8GG2wQpkyZkne8wNwFoveQIUNyD1xHxIABA8Kmm25a8H51WHoCih6lt2YyJkCAAAECBAgQIECAAAECBAgQIFBwgQULFoTXX389LFmypKB9X3zxxeGkk04qaJ+xs8WLF4dtt902Ub+tWrUKn332WaI+BOcmEHcQde/ePbegejy9yy67hC222KIeT3qk3AUUPcp9hc2PAAECBAgQIECAAAECBAgQIECAwDoEFi1alCl4xEJCIdvZZ58dzjrrrEJ2WdXX119/Hfr165eo7/XXXz9MnTo1UR+CcxfYbbfdwpdffpl7YB0R8aiznj17FrRPnZWmgKJHaa6brAkQIECAAAECBAgQIECAAAECBAgURCAWOmLBIxY+CtlOPfXUolxYXZlj3KGx9957J0q5ZcuWYdq0aYn6EJy7wI9+9KPMMWqFbLHgEQsfGgFFD58BAgQIECBAgAABAgQIECBAgAABAk1UIB5lFb98TnIZeDa6X/7yl+Hyyy8vquqECRPCwQcfnGiMFi1ahOnTpyfqo6kGr1ixIixfvjyv16233lrwoke3bt1C7969m+pymHc1AUUPHwcCBAgQIECAAAECBAgQIECAAAECTVAgfmEdd3jMnTu3oLM/+uijwzXXXFPQPrN1Nnbs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M2jXrl1mt9CoUaPWev/OO+8MF1xwQZEzr7v79ddfPxxwwAGNmoPB0yGg6JGOdZAFAQIECBAgQIAAAQIECBAgQIBAExJYvnx5ePbZZ7POuHnz5iEeR1WfNm/evLBy5cqsj6633nohFlZ69epV4/2ZM2dmvtx++umnax1ip512yjyT7WLrPfbYI8Q+amsdOnQIcWytcQQWLlxY67FpsXDx5ptvhvbt29dI7oYbbghXX311vRKOha/42ejZs2eN588888zw8MMPF/VzEXeTVFRUZB0jFviGDBlSrzl4qLwFFD3Ke33NjgABAgQIECBAgAABAgQIECBAIIUC8QLzeJF5tjZw4MDwyCOPrDPrp556Kuuv7isDr7/++nDkkUfW6CcecxW/sK7vHQynn356OO+882r0Ee/2qOsX9b/61a/C73//+3Xm74HCC8Qi2JpFruqjXHfddZmjqKq3888/P9x11105JRMLDC+++GLYfPPNa8TFi9G/+uqrrH397ne/C7EwkqTNmjUrDBgwIGsXcQfLoEGDknQvtkwEFD3KZCFNgwABAgQIECBAgAABAgQIECBAoHQEvv7661qPETriiCNC/OX9ulr8Evnee+/N+lj88vnxxx+v8V58Nsbk2o477ri1dgHEwsmtt96atat4d0j8QlxreIG4e+gXv/hF1oHj3S5vv/12jffibp8TTzwxr0Tj/Rm33HJLjdhYVLn22muz9rfPPvuE+++/P6+xKoPi0Wpxp0m2tskmm4S4C0kjoOjhM0CAAAECBAgQIECAAAECBAgQIECggQWmT5+euUsjW9t9990zOyX69etXZ1Z1HTN18803h5EjR1bFf/7552G//fYLixcvzmumscBx8MEHV8XW9Yv7+FC83HrrrbfOayxB+QvUVYw67bTTQtzVUdnibp9YQKjrqLJ1ZfLHP/4xHHvssVWPxc/0QQcdlDUs3rkR75GJF47Xt02aNKnqzpl4sXq8d2TZsmVZw+O9NbHYpxFQ9PAZIECAAAECBAgQIECAAAECBAgQINDAAvEX65MnT65z1G7duoXhw4dnXoMHD67xbLyI+sADD8waH48eil8WV2/x1/+13SFSn6l37do1s3sj3glR2eKX3fGS9GztD3/4Q/j5z39en649U0CBww47LLz11ltZe4w7fYYOHVr1XjzSqnoRJJ80dthhh/Df//63Rui+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6ro/5tBDD80806VLlxrxcczhw4eH+NnI1jp16hQGDRpU4JnqjkB2AUUPnwwCBAgQIECAAAECBAgQIECAAAECJSgQj7aKv85fvnx51uz79OkTnn766bXei0dfxS+ua9slUhlw7rnnhjPOOGOt+Pjv99xzT61i8cijjh07lqBo+aQc79pYsmRJrROKO36yXW7/xRdfhLfeeivES87jMVXxKLVYwIqfpfh3t912W6vPZcuWheOOO67OI7L69esXunbtWj7AZpJqAUWPVC+P5AgQIECAAAECBAgQIECAAAECBAjULjBp0qQwZcqUWh+IRxBdf/31a70/Z86czKXW8cvt+Io7Rrp37171BXc80qpv375rxa3r4ut4b0OM1RpXIH4m4mejrhZ3dhxwwAGJEl20aFE48cQTw5gxY2rtp127dmHo0KGJxhFMIBcBRY9ctDxLgAABAgQIECBAgAABAgQIECBAIEUC8SLxeEn5qlWras0q/go/HlFVV1u5cmVYb7316nzm5JNPDo8//nidzwwYMCBsuummKRJquqm8+uqrmZ0adbWzzjornH322Xkhvfzyy+Giiy6qs+gWO/aZyItXUAIBRY8EeEIJECBAgAABAgQIECBAgAABAgQINLbA9OnTM7s16mrZ7uaob97xjod4pNWaF2CvGe8uj/qKNsxz8+fPr3MHRmUW8eipuFvj8MMPr1diH3/8cbj99tvDvffeu87n410wO+ywwzqf8wCBQgooehRSU18ECBAgQIAAAQIECBAgQIAAAQIEGkEg3sPw1Vdf1Tny+uuvH0aNGpX5gru+uzFuu+22cMstt4RZs2bV2Xfr1q0zRxi1aNGiEWZvyNoEpk6dGj788MN6AcUCxT777JN59ejRI2yyySZhgw02yNz9El+vvPJKiLs7XnrppXr156izejF5qAgCih5FQNUlAQIECBAgQIAAAQIECBAgQIAAgYYUiMdcvfbaayH+XVdr3rx5GD58eBgyZEiIv/KPX27HV0VFRebL7fhL/vjFdjw2a12XnVeOtccee2T60NIn8Omnn4aPPvqoQRPr1KlT5lirli1bNui4BiMQBRQ9fA4IECBAgAABAgQIECBAgAABAgQIlIHAggULwuuvvx6WLFnSoLPp379/2GyzzRp0TIPlJjB58uRMMashmoJHQygboy4BRQ+fDwIECBAgQIAAAQIECBAgQIAAAQJlIjBv3rxM4WPZsmUNMqO+ffuGLbfcskHGMkgygZkzZ2bufomX1herbbHFFmHnnXd2zFmxgPVbLwFFj3oxeYgAAQIECBAgQIAAAQIECBAgQIBAaQjEI67il9v1PZoqn1m1bds29OnTJ3Tu3DmfcDGNJLBw4cLwwQcfhG+//bagGcQj02KxY6uttipovzojkI+Aokc+amIIECBAgAABAgQIECBAgAABAgQIpFzgk08+CfFV6Na1a9fQu3dvv+YvNGwD9hd3fcRLzuPOoCStWbNmoXv37plXvPRcI5AGAUWPNKyCHAgQIECAAAECBAgQIECAAAECBAgUQWD+/PmZL7dnzJiRuPd4UXmPHj1cWJ5YMj0dfPHFFyEWQOLOj1WrVtU7sfbt24cf/OAHYeuttw6tWrWqd5wHCTSEgKJHQygbgwABAgQIECBAgAABAgQIECBAgEAjCsRjjaZNm5Y58mrRokX1ziR+oR2LHXF3R/yrlafA6tWrM4WP+PlYunRp1Sve/xE/A5WvDh06ZD4HdnWU5+egXGal6FEuK2keBAgQIECAAAECBAgQIECAAAECBOohsGDBgswX3PFv/II7Xnoe/7Zs2bLqy+3WrVuHTTfdNHTq1KkePXqEAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAKKHgnwhBIgQIAAAQIECBAgQIAAAQIECBAgQIAAAQLpEVD0SM9ayIQAAQIECBAgQIAAAQIECBAgQIAAAQIECBBIIKDokQBPKAECBAgQIECAAAECBAgQIECAAAECBAgQIJAeAUWP9KyFTAgQIECAAAECBAgQIECAAAECBAgQIECAAIEEAooeCfCEEiBAgAABAgQIECBAgAABAgQIECBAgAABAukRUPRIz1rIhAABAgQIECBAgAABAgQIECBAgAABAgQIEEggoOiRAE8oAQIECBAgQIAAAQIECBAgQIAAAQIECBAgkB4BRY/0rIVMCBAgQIAAAQIECBAgQIAAAQIECBAgQIAAgQQCih4J8IQSIECAAAECBAgQIECAAAECBAgQIECAAAEC6RFQ9EjPWsiEAAECBAgQIECAAAECBAgQIECAAAECBAgQSCCg6JEATygBAgQIECBAgAABAgQIECBAgAABAgQIECCQHgFFj/SshUwIECBAgAABAgQIECBAgAABAgQIECBAgACBBAL1KXr8Pzjiof1aYASoAAAAAElFTkSuQmCC",
            fileName="modelica://OpenIPSL/../../../../../Downloads/autodraw 1_23_2024.png")}),
                                                                   Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end TCL_Building_no_noise_RECORD_DATA1;

  model TCL_simple_example_9
    extends Modelica.Icons.Example;

    OpenIPSL.Electrical.Buses.Bus bus
      annotation (Placement(transformation(extent={{12,-10},{32,10}})));
    Modelica.Blocks.Sources.Constant const(k=0)
      annotation (Placement(transformation(extent={{90,40},{80,50}})));
    OpenIPSL.Electrical.Branches.PwLine pwLine(
      R=0.0001,
      X=0.01,
      G=0,
      B=0) annotation (Placement(transformation(extent={{-18,-10},{2,10}})));
    OpenIPSL.Electrical.Buses.Bus bus1
      annotation (Placement(transformation(extent={{-48,-10},{-28,10}})));
    OpenIPSL.Electrical.Machines.PSSE.GENCLS gENCLS
      annotation (Placement(transformation(extent={{-78,-10},{-58,10}})));
    TCL_Building_no_noise_RECORD_DATA2 tCL_Building_no_noise_RECORD_DATA2_1(
      start0_TCL2=0,
      start0_TCL4=0,
      start0_TCL5=0,
      start0_TCL7=1,
      start0_TCL8=0,
      start0_TCL9=1,
      start0_TCL13=0,
      start0_TCL16=0,
      start0_TCL17=1,
      start0_TCL19=1,
      start0_TCL22=1,
      start0_TCL25=1,
      start0_TCL26=0,
      start0_TCL27=0,
      start0_TCL29=0,
      start0_TCL31=0,
      TCL_b=110000)
      annotation (Placement(transformation(extent={{34,-50},{54,-30}})));
    Modelica.Blocks.Sources.Constant const1(k=0)
      annotation (Placement(transformation(extent={{90,22},{80,32}})));
    Modelica.Blocks.Sources.Constant const2(k=0)
      annotation (Placement(transformation(extent={{90,4},{80,14}})));
    Modelica.Blocks.Sources.Constant const3(k=0)
      annotation (Placement(transformation(extent={{90,-16},{80,-6}})));
    TCL_Building_no_noise_RECORD_DATA1 tCL_Building_no_noise_RECORD_DATA1_1(
      start0_TCL2=0,
      start0_TCL4=0,
      start0_TCL6=0,
      start0_TCL8=0,
      start0_TCL11=0,
      start0_TCL13=0,
      start0_TCL15=0,
      start0_TCL17=0,
      start0_TCL18=0,
      start0_TCL22=0,
      start0_TCL24=0,
      start0_TCL26=0,
      start0_TCL29=0,
      TCL_b=110000)
      annotation (Placement(transformation(extent={{36,-10},{56,10}})));
  equation
    connect(pwLine.n, bus.p)
      annotation (Line(points={{1,0},{22,0}},  color={0,0,255}));
    connect(bus1.p, pwLine.p)
      annotation (Line(points={{-38,0},{-17,0}},
                                               color={0,0,255}));
    connect(gENCLS.p, bus1.p)
      annotation (Line(points={{-58,0},{-38,0}}, color={0,0,255}));
    connect(tCL_Building_no_noise_RECORD_DATA2_1.pwPin, bus.p) annotation (Line(
          points={{34,-40},{28,-40},{28,0},{22,0}}, color={0,0,255}));
    connect(tCL_Building_no_noise_RECORD_DATA2_1.u2, const3.y) annotation (Line(
          points={{55,-35},{68,-35},{68,-11},{79.5,-11}}, color={0,0,127}));
    connect(tCL_Building_no_noise_RECORD_DATA2_1.u1, const2.y) annotation (Line(
          points={{55,-31},{70,-31},{70,9},{79.5,9}}, color={0,0,127}));
    connect(tCL_Building_no_noise_RECORD_DATA2_1.u3, const.y) annotation (Line(
          points={{55,-45},{74,46},{74,45},{79.5,45}}, color={0,0,127}));
    connect(tCL_Building_no_noise_RECORD_DATA2_1.u4, const1.y) annotation (Line(
          points={{55,-49},{74,-2},{94,18},{76,18},{76,27},{79.5,27}}, color={0,
            0,127}));
    connect(tCL_Building_no_noise_RECORD_DATA1_1.pwPin, bus.p)
      annotation (Line(points={{36,0},{22,0}}, color={0,0,255}));
    connect(tCL_Building_no_noise_RECORD_DATA1_1.u1, const2.y)
      annotation (Line(points={{57,9},{79.5,9}}, color={0,0,127}));
    connect(tCL_Building_no_noise_RECORD_DATA1_1.u2, const2.y) annotation (Line(
          points={{57,5},{62,5},{62,8},{72,8},{72,9},{79.5,9}}, color={0,0,127}));
    connect(tCL_Building_no_noise_RECORD_DATA1_1.u3, const2.y) annotation (Line(
          points={{57,-5},{72,-5},{72,9},{79.5,9}}, color={0,0,127}));
    connect(tCL_Building_no_noise_RECORD_DATA1_1.u4, const2.y) annotation (Line(
          points={{57,-9},{72,-9},{72,9},{79.5,9}}, color={0,0,127}));
    annotation (experiment(
        StopTime=2000,
        __Dymola_NumberOfIntervals=1000,
        __Dymola_Algorithm="Dassl"));
  end TCL_simple_example_9;
end TCL;
