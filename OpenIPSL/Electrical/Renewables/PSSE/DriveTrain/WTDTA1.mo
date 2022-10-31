within OpenIPSL.Electrical.Renewables.PSSE.DriveTrain;
model WTDTA1 "Generic Drive Train Model for Type 3 and Type 4 Wind Machines"
  extends
    OpenIPSL.Electrical.Renewables.PSSE.DriveTrain.BaseClasses.BaseRenewableDriveTrain;

  import Modelica.Constants.pi;

  parameter Modelica.Units.SI.Frequency fn = 60 "System nominal frequency (50 - 60 Hz)";
  parameter Modelica.Units.SI.Time H = 1 "Total inertia constant (No predefined range s)";
  parameter OpenIPSL.Types.PerUnit DAMP "Machine damping factor (No predefined range pu)";
  parameter Real Htfrac "Turbine inertia fraction, Ht/H (No predefined range)";
  parameter Modelica.Units.SI.Frequency Freq1 "First shaft torsional resonancy frequency (No predefined range)";
  parameter OpenIPSL.Types.PerUnit Dshaft "Shaft damping factor (No predefined range pu)";

  Modelica.Blocks.Sources.RealExpression W0_(y=W0)
    annotation (Placement(transformation(extent={{-8,-120},{12,-100}})));
  Modelica.Blocks.Interfaces.RealInput W_0 annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-60,-140})));
  Modelica.Blocks.Interfaces.RealInput P0 annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={60,-140})));

  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{-110,76},{-90,56}})));
  Modelica.Blocks.Math.Division division1
    annotation (Placement(transformation(extent={{-110,-76},{-90,-56}})));
  Modelica.Blocks.Math.Gain Coef1(k=Dshaft) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,20})));
  Modelica.Blocks.Continuous.Integrator integrator(k=1/(2*Ht),
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=W0)
    annotation (Placement(transformation(extent={{-46,50},{-26,70}})));
  Modelica.Blocks.Continuous.Integrator integrator1(k=1/(2*Hg),
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=W0)
    annotation (Placement(transformation(extent={{-16,-70},{4,-50}})));
  Modelica.Blocks.Math.Gain Coef2(k=DAMP) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-30,-20})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Math.Add3 add3_1(k1=-1, k3=-1)
    annotation (Placement(transformation(extent={{-80,76},{-60,56}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=add.y) annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-30,20})));
  Modelica.Blocks.Math.Add add1(k1=-1)
    annotation (Placement(transformation(extent={{-48,-70},{-28,-50}})));
  Modelica.Blocks.Math.Gain w0__(k=w0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={60,0})));
  Modelica.Blocks.Math.Add add2(k1=-1)
    annotation (Placement(transformation(extent={{24,-84},{44,-104}})));
  Modelica.Blocks.Math.Add3 add3_2(k1=-1, k3=-1)
    annotation (Placement(transformation(extent={{-80,-76},{-60,-56}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=integrator2.y)
                                                                 annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-70,84})));
  Modelica.Blocks.Continuous.Integrator integrator2(k=1/(2*Ht),
    initType=Modelica.Blocks.Types.Init.InitialState,           y_start=T0)
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=integrator2.y)
                                                                 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,-84})));
  Modelica.Blocks.Math.Gain w0_(k=w0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={64,-94})));
  Modelica.Blocks.Continuous.Integrator integrator3(k=1, y_start=0)
    annotation (Placement(transformation(extent={{84,-104},{104,-84}})));

  Modelica.Blocks.Math.Add add3(k2=+1)
    annotation (Placement(transformation(extent={{40,50},{60,70}})));
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{0,70},{20,90}})));
  Modelica.Blocks.Math.Add add4(k2=+1)
    annotation (Placement(transformation(extent={{62,-70},{82,-50}})));
  Modelica.Blocks.Sources.Constant const1(k=1)
    annotation (Placement(transformation(extent={{24,-50},{44,-30}})));
protected
  parameter OpenIPSL.Types.PerUnit Ht = H*Htfrac;
  parameter OpenIPSL.Types.PerUnit Hg = H - Ht;
  parameter OpenIPSL.Types.PerUnit Kshaft = 2*Ht*Hg*(2*pi*Freq1)^2/(H*w0);
  parameter Modelica.Units.SI.AngularVelocity w0 = 2*pi*fn;
  parameter OpenIPSL.Types.PerUnit p00(fixed=false);
  parameter OpenIPSL.Types.PerUnit W0(fixed=false);
  parameter OpenIPSL.Types.PerUnit T0 = p00;

initial equation

   p00 = P0;
   W0 = W_0;

equation
  connect(Pm, division.u1)
    annotation (Line(points={{-140,60},{-112,60}},color={0,0,127}));
  connect(Pe, division1.u1)
    annotation (Line(points={{-140,-60},{-112,-60}},color={0,0,127}));
  connect(add3_1.y, integrator.u)
    annotation (Line(points={{-59,66},{-54,66},{-54,60},{-48,60}},
                                                 color={0,0,127}));
  connect(Coef1.u, realExpression.y)
    annotation (Line(points={{-58,20},{-41,20}}, color={0,0,127}));
  connect(integrator1.y, add.u2) annotation (Line(points={{5,-60},{12,-60},{12,-6},
          {18,-6}}, color={0,0,127}));
  connect(Coef2.u, add.u2) annotation (Line(points={{-18,-20},{12,-20},{12,-6},{
          18,-6}}, color={0,0,127}));
  connect(Coef2.y, add1.u1) annotation (Line(points={{-41,-20},{-52,-20},{-52,-54},
          {-50,-54}}, color={0,0,127}));
  connect(add.y, w0__.u)
    annotation (Line(points={{41,0},{48,0}}, color={0,0,127}));
  connect(division.y, add3_1.u2)
    annotation (Line(points={{-89,66},{-82,66}}, color={0,0,127}));
  connect(division1.y, add3_2.u2)
    annotation (Line(points={{-89,-66},{-82,-66}}, color={0,0,127}));
  connect(add3_2.y, add1.u2)
    annotation (Line(points={{-59,-66},{-50,-66}}, color={0,0,127}));
  connect(Coef1.y, add3_1.u1) annotation (Line(points={{-81,20},{-86,20},{-86,58},
          {-82,58}}, color={0,0,127}));
  connect(add3_2.u1, add3_1.u1) annotation (Line(points={{-82,-58},{-86,-58},{-86,
          58},{-82,58}}, color={0,0,127}));
  connect(realExpression1.y, add3_1.u3) annotation (Line(points={{-81,84},{-86,84},
          {-86,74},{-82,74}}, color={0,0,127}));
  connect(w0__.y, integrator2.u)
    annotation (Line(points={{71,0},{78,0}}, color={0,0,127}));
  connect(realExpression2.y, add3_2.u3) annotation (Line(points={{-81,-84},{-86,
          -84},{-86,-74},{-82,-74}}, color={0,0,127}));
  connect(add1.y, integrator1.u) annotation (Line(points={{-27,-60},{-18,-60}},
                           color={0,0,127}));
  connect(add2.u2, add.u2) annotation (Line(points={{22,-88},{12,-88},{12,-6},{18,
          -6}},     color={0,0,127}));
  connect(add2.y, w0_.u)
    annotation (Line(points={{45,-94},{52,-94}}, color={0,0,127}));
  connect(W0_.y, add2.u1) annotation (Line(points={{13,-110},{20,-110},{20,-100},
          {22,-100}}, color={0,0,127}));
  connect(w0_.y, integrator3.u)
    annotation (Line(points={{75,-94},{82,-94}}, color={0,0,127}));
  connect(const.y, add3.u1) annotation (Line(points={{21,80},{30,80},{30,66},
          {38,66}},
                color={0,0,127}));
  connect(integrator.y, add3.u2)
    annotation (Line(points={{-25,60},{6,60},{6,54},{38,54}},
                                                color={0,0,127}));
  connect(add.u1, add3.u2)
    annotation (Line(points={{18,6},{12,6},{12,54},{38,54}}, color={0,0,127}));
  connect(const1.y, add4.u1) annotation (Line(points={{45,-40},{54,-40},{54,
          -54},{60,-54}}, color={0,0,127}));
  connect(add4.u2, add.u2) annotation (Line(points={{60,-66},{12,-66},{12,-6},
          {18,-6}}, color={0,0,127}));
  connect(add3.y, division.u2) annotation (Line(points={{61,60},{72,60},{72,104},
          {-118,104},{-118,72},{-112,72}}, color={0,0,127}));
  connect(wt, add3.u2) annotation (Line(points={{130,60},{80,60},{80,40},{12,40},
          {12,54},{38,54}}, color={0,0,127}));
  connect(wg, add.u2) annotation (Line(points={{130,-60},{100,-60},{100,-74},{48,
          -74},{48,-66},{12,-66},{12,-6},{18,-6}}, color={0,0,127}));
  connect(add4.y, division1.u2) annotation (Line(points={{83,-60},{90,-60},{90,-54},
          {112,-54},{112,-116},{-116,-116},{-116,-72},{-112,-72}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-120,-120},{120,120}})), Icon(
        coordinateSystem(extent={{-120,-120},{120,120}}), graphics={Text(
          extent={{-80,40},{80,-40}},
          textColor={0,0,255},
          textString="WTDTA1"),
        Text(
          extent={{-100,74},{-40,44}},
          textColor={0,0,255},
          textString="PMECH"),
        Text(
          extent={{-100,-48},{-50,-74}},
          textColor={0,0,255},
          textString="PELE"),
        Text(
          extent={{-84,-90},{-34,-116}},
          textColor={0,0,255},
          textString="W0"),
        Text(
          extent={{36,-90},{86,-116}},
          textColor={0,0,255},
          textString="P0"),
        Text(
          extent={{64,-48},{114,-74}},
          textColor={0,0,255},
          textString="WG"),
        Text(
          extent={{64,72},{114,46}},
          textColor={0,0,255},
          textString="WT")}));
end WTDTA1;
