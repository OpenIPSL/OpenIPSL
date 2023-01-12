within OpenIPSL.Electrical.Controls.PSSE.TG;
model DEGOV "DEGOV - Woodward Diesel Governor"
  extends BaseClasses.BaseGovernor;

  parameter Modelica.Units.SI.Time T1 "Governor Mechanism Time Constant";
  parameter Modelica.Units.SI.Time T2 "Turbine Power Time Constant";
  parameter Modelica.Units.SI.Time T3 "Turbine Exhaust Temperature Time Constant";
  parameter OpenIPSL.Types.PerUnit K "Governor Gain";
  parameter Modelica.Units.SI.Time T4 "Governor Lead Time Constant";
  parameter Modelica.Units.SI.Time T5 "Governor Lag Time Constant";
  parameter Modelica.Units.SI.Time T6 "Actuator Time Constant";
  parameter Modelica.Units.SI.Time TD "Engine Time Delay";
  parameter OpenIPSL.Types.PerUnit TMAX "Upper Limit";
  parameter OpenIPSL.Types.PerUnit TMIN "Lower Limit";


  Modelica.Blocks.Continuous.TransferFunction transferFunction(b={-T3,-1}, a={
        T2*T1,T1,1},
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=0)
    annotation (Placement(transformation(extent={{-140,-10},{-120,10}})));
  Modelica.Blocks.Continuous.Integrator integrator(k=K, y_start=P0)
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  NonElectrical.Continuous.LeadLag leadLag(
    K=1,
    T1=T4,
    T2=T5,
    y_start=P0)
           annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=1,
    T=T6,
    y_start=P0,
    outMax=TMAX,
    outMin=TMIN)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime=TD)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-80,-124},{-60,-104}})));
  Modelica.Blocks.Sources.Constant Constant(k=1)
    annotation (Placement(transformation(extent={{-140,-80},{-120,-60}})));

protected
  parameter Types.PerUnit P0(fixed=false) "Power reference of the governor";
initial equation
  P0 = PMECH0;

equation
  connect(SPEED, transferFunction.u) annotation (Line(points={{-240,-120},{-180,
          -120},{-180,0},{-142,0}}, color={0,0,127}));
  connect(transferFunction.y, integrator.u)
    annotation (Line(points={{-119,0},{-102,0}}, color={0,0,127}));
  connect(integrator.y, leadLag.u)
    annotation (Line(points={{-79,0},{-62,0}}, color={0,0,127}));
  connect(leadLag.y, simpleLagLim.u)
    annotation (Line(points={{-39,0},{-22,0}}, color={0,0,127}));
  connect(simpleLagLim.y, fixedDelay.u)
    annotation (Line(points={{1,0},{18,0}}, color={0,0,127}));
  connect(fixedDelay.y, product1.u1)
    annotation (Line(points={{41,0},{60,0},{60,6},{78,6}}, color={0,0,127}));
  connect(Constant.y, add.u1) annotation (Line(points={{-119,-70},{-94,-70},{-94,
          -108},{-82,-108}}, color={0,0,127}));
  connect(add.u2, transferFunction.u) annotation (Line(points={{-82,-120},{-180,
          -120},{-180,0},{-142,0}}, color={0,0,127}));
  connect(add.y, product1.u2) annotation (Line(points={{-59,-114},{70,-114},{70,
          -6},{78,-6}}, color={0,0,127}));
  connect(product1.y, PMECH)
    annotation (Line(points={{101,0},{250,0}}, color={0,0,127}));
end DEGOV;
