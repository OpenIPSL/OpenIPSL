within OpenIPSL.Electrical.Renewables.PSSE.WindDriveTrain;
model WTDTA1 "Generic Drive Train Model for Type 3 and Type 4 Wind Machines"
  extends
    OpenIPSL.Electrical.Renewables.PSSE.WindDriveTrain.BaseClasses.BaseWTDT;

  import Modelica.Constants.pi;

  parameter Modelica.Units.SI.Frequency fn = SysData.fn "System nominal frequency (50 or 60 Hz)";
  parameter Modelica.Units.SI.Time H = 5.3 "Total inertia constant (No predefined range)";
  parameter OpenIPSL.Types.PerUnit DAMP = 0 "Machine damping factor (No predefined range)";
  parameter Real Htfrac = 0.92 "Turbine inertia fraction, Ht/H (No predefined range)";
  parameter Modelica.Units.SI.Frequency Freq1 = 2.132 "First shaft torsional resonancy frequency (No predefined range)";
  parameter OpenIPSL.Types.PerUnit Dshaft = 1 "Shaft damping factor (No predefined range)";

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
        origin={60,0})));
  Modelica.Blocks.Math.Add add2(k1=-1)
    annotation (Placement(transformation(extent={{24,-84},{44,-104}})));
  Modelica.Blocks.Math.Add3 add3_2(k1=+1,
    k2=-1,
    k3=+1)
    annotation (Placement(transformation(extent={{-80,-76},{-60,-56}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=integrator2.y)
                                                                 annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-70,84})));
  Modelica.Blocks.Continuous.Integrator integrator2(
    k=Kshaft,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=T0)
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=integrator2.y)
                                                                 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,-84})));
  Modelica.Blocks.Math.Gain w0_(k=w0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={64,-94})));
  Modelica.Blocks.Continuous.Integrator integrator3(k=1, y_start=0)
    annotation (Placement(transformation(extent={{84,-104},{104,-84}})));

  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{-110,76},{-90,56}})));
  Modelica.Blocks.Math.Add add3(k2=+1)
    annotation (Placement(transformation(extent={{20,70},{40,90}})));
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-20,76},{0,96}})));
  Modelica.Blocks.Math.Add add4(k2=+1)
    annotation (Placement(transformation(extent={{64,-56},{84,-36}})));
  Modelica.Blocks.Sources.Constant const1(k=1)
    annotation (Placement(transformation(extent={{24,-50},{44,-30}})));
  Modelica.Blocks.Math.Division division1
    annotation (Placement(transformation(extent={{-112,-76},{-92,-56}})));
protected
  parameter OpenIPSL.Types.PerUnit Ht = H*Htfrac;
  parameter OpenIPSL.Types.PerUnit Hg = H - Ht;
  parameter OpenIPSL.Types.PerUnit Kshaft = 2*Ht*Hg*(2*pi*Freq1)^2/(H*w0);
  parameter Modelica.Units.SI.AngularVelocity w0 = 2*pi*fn;
  parameter OpenIPSL.Types.PerUnit W0(fixed=false);
  parameter OpenIPSL.Types.PerUnit T0(fixed=false);

initial equation

   T0 = P0;

equation
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
          -6}}, color={0,0,127}));
  connect(add2.y, w0_.u)
    annotation (Line(points={{45,-94},{52,-94}}, color={0,0,127}));
  connect(w0_.y, integrator3.u)
    annotation (Line(points={{75,-94},{82,-94}}, color={0,0,127}));
  connect(integrator.y, wt)
    annotation (Line(points={{-25,60},{130,60}}, color={0,0,127}));
  connect(add.u1, wt) annotation (Line(points={{18,6},{12,6},{12,60},{130,60}},
        color={0,0,127}));
  connect(division.y, add3_1.u2)
    annotation (Line(points={{-89,66},{-82,66}}, color={0,0,127}));
  connect(Pm, division.u1)
    annotation (Line(points={{-140,60},{-112,60}}, color={0,0,127}));
  connect(add3.u2, wt) annotation (Line(points={{18,74},{12,74},{12,60},{130,60}},
        color={0,0,127}));
  connect(const.y, add3.u1)
    annotation (Line(points={{1,86},{18,86}}, color={0,0,127}));
  connect(const1.y, add4.u1)
    annotation (Line(points={{45,-40},{62,-40}}, color={0,0,127}));
  connect(add4.u2, add.u2) annotation (Line(points={{62,-52},{50,-52},{50,-60},{
          12,-60},{12,-6},{18,-6}}, color={0,0,127}));
  connect(add3.y, division.u2) annotation (Line(points={{41,80},{52,80},{52,104},
          {-112,104},{-112,72}}, color={0,0,127}));
  connect(division1.y, add3_2.u2)
    annotation (Line(points={{-91,-66},{-82,-66}}, color={0,0,127}));
  connect(Pe, division1.u1)
    annotation (Line(points={{-140,-60},{-114,-60}}, color={0,0,127}));
  connect(division1.u2, add4.y) annotation (Line(points={{-114,-72},{-114,-116},
          {110,-116},{110,-46},{85,-46}}, color={0,0,127}));
  connect(wg, add4.y) annotation (Line(points={{130,-60},{110,-60},{110,-46},
          {85,-46}}, color={0,0,127}));
  connect(add2.u1, W_0) annotation (Line(points={{22,-100},{-60,-100},{-60,-140}},
        color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-120,-120},{120,120}})), Icon(
        coordinateSystem(extent={{-120,-120},{120,120}})),
    Documentation(info="<html>
<p>
The WTDTA1 component is a simplified model for the purpose of emulating the behavior of torsional mode oscillations.
The wind turbine shaft damping coefficient (Dshaft) in the drive-train model represents the net damping of the torsional mode seen in the post
fault electrical power response. In real equipment, the drive train oscillation are damped through active control signals, much different from the
simple two mass drive train model represents in the WTDTA1 component. Thus, the drive-train is not a real physical representation of the real drive-train.
</p>
<p>The modelling of such devices is based, mainly, on the following references:</p>
<ul>
<li>Siemens: \"PSS&reg;E Model Library\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a>,</li>
<li>WECC: \"Wind Power Plant Dynamic Modeling Guideline\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[WECCWind]</a>.</li>
</ul>
</html>"));
end WTDTA1;
