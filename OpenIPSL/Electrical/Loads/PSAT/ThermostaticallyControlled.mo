within OpenIPSL.Electrical.Loads.PSAT;
model ThermostaticallyControlled "Thload - Thermostatically Controlled Load"
  extends OpenIPSL.Electrical.Loads.PSAT.BaseClasses.baseLoad;
  parameter Real Kl=2 "Ceiling conductance output";
  parameter Real Kp=10 "Gain of the proportional controller [pu/pu]";
  parameter Real Ki=25 "Gain of the integral controller [pu/pu]";
  parameter Types.Time Ti=10 "Time constant of integral controller";
  parameter Types.Time T1=1200 "Time constant of the thermal load";
  parameter SI.Temp_C T_ref=70 "Reference temperature";
  parameter SI.Temp_C T0=10 "Initial temperature";
  parameter Types.PerUnit G0 = P_0/100*v_0^2 "Initial conductance";
  parameter Types.PerUnit Gmax = Kl*G0 "Maximum conductance";
  parameter Types.PerUnit Gmin = 0 "Minimum conductance";
  parameter Real K1 = (T_ref-T0)/P_0 "Active power gain [pu/pu]";
  parameter Real K3=1 "Gain anti wind-up";

  OpenIPSL.NonElectrical.Continuous.SimpleLag
                                        firstOrder(
    K=1,
    T=T1,
    y_start=0)
    annotation (Placement(transformation(extent={{-38,-40},{-58,-20}})));
  Modelica.Blocks.Math.Gain gain(k=K1)
                                 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={20,-24})));
  Modelica.Blocks.Math.Gain gain1(k=Kp)
                                 annotation (Placement(transformation(
        extent={{10.5,-10},{-10.5,10}},
        rotation=180,
        origin={-20.5,60})));
  Modelica.Blocks.Math.Add add(k2=-1, k1=+1)
    annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
  Modelica.Blocks.Continuous.LimIntegrator
                                    Limiter(outMax=Gmax, outMin=Gmin,
    k=Ki/Ti,
    limitsAtInit=true,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=G0 - Kp*(T_ref - T0))
    annotation (Placement(transformation(extent={{-12,14},{0,26}})));
  Modelica.Blocks.Interfaces.RealInput t_ref "Reference temperature"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}}), iconTransformation(extent={{-140,60},{-100,100}})));
  Modelica.Blocks.Interfaces.RealInput t_a "Ambient temperature"
                                          annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        origin={-120,-60}), iconTransformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Math.Product product annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={60,-24})));
  Modelica.Blocks.Math.Add add1(k2=+1, k1=+1)
    annotation (Placement(transformation(extent={{20,30},{40,50}})));
  Modelica.Blocks.Nonlinear.Limiter Limiter1(strict=false,
    uMax=Gmax,
    uMin=Gmin)
    annotation (Placement(transformation(extent={{60,30},{80,50}})));
  Modelica.Blocks.Math.Add add4(k2=+1, k1=+1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-18,-30})));
  Modelica.Blocks.Math.Gain gain2(k=K3)
                                 annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        origin={-36,20})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=v^2)
    annotation (Placement(transformation(extent={{50,-70},{70,-50}})));

equation

   P=((Limiter1.y)*(v^2))/S_b;
   Q = Q_0/S_b;

  connect(t_ref, add.u1) annotation (Line(points={{-120,60},{-94,60},{-94,46},{-82,
          46}}, color={0,0,127}));
  connect(product.y, gain.u) annotation (Line(points={{49,-24},{32,-24}},
                                color={0,0,127}));
  connect(gain1.y, add1.u1) annotation (Line(points={{-8.95,60},{11.375,60},{11.375,46},{18,46}},
                                     color={0,0,127}));
  connect(Limiter.y, add1.u2) annotation (Line(points={{0.6,20},{12,20},{12,34},{18,34}},
                        color={0,0,127}));
  connect(add1.y, Limiter1.u)
    annotation (Line(points={{41,40},{58,40}}, color={0,0,127}));
  connect(Limiter1.y, product.u2) annotation (Line(points={{81,40},{90,40},{90,-18},{72,-18}},
                                color={0,0,127}));
  connect(gain.y, add4.u2) annotation (Line(points={{9,-24},{-6,-24}},
                                       color={0,0,127}));
  connect(add4.u1, t_a) annotation (Line(points={{-6,-36},{0,-36},{0,-60},{-120,-60}},
                                 color={0,0,127}));
  connect(firstOrder.u, add4.y) annotation (Line(points={{-36,-30},{-29,-30}},
                                           color={0,0,127}));
  connect(gain1.u, add.y) annotation (Line(points={{-33.1,60},{-50,60},{-50,40},{-59,40}},
                           color={0,0,127}));
  connect(gain2.u, add.y) annotation (Line(points={{-43.2,20},{-50,20},{-50,40},{-59,40}},
                       color={0,0,127}));
  connect(gain2.y, Limiter.u)
    annotation (Line(points={{-29.4,20},{-13.2,20}}, color={0,0,127}));
  connect(realExpression.y, product.u1) annotation (Line(points={{71,-60},{71,-60},
          {90,-60},{90,-30},{72,-30}}, color={0,0,127}));
  connect(firstOrder.y, add.u2) annotation (Line(points={{-59,-30},{-72,-30},{-94,
          -30},{-94,34},{-82,34}}, color={0,0,127}));
  annotation ( Documentation(info="<html>
<p>
This load defines a dynamic load with temperature control. This
component is initialized after the power flow solution and needs a PQ load connected
at the same bus.</p>
<p>
For more information see <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Milano2013]</a>,
section \"16.6 Thermostatically Controlled Load\".
</p>
</html>"));
end ThermostaticallyControlled;
