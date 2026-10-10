within OpenIPSL.Electrical.Loads.PSAT;
model ThermostaticallyControlled "Thload - Thermostatically Controlled Load"
  extends OpenIPSL.Electrical.Loads.PSAT.BaseClasses.baseLoad;
  parameter Real Kl=2 "Ceiling conductance output, ratio of Gmax to G0 (PSAT: K_L)";
  parameter Real Kp=10 "Gain of the proportional controller, pu/degC on the system base (PSAT: K_p)";
  parameter Real Ki=25 "Gain of the integral controller, pu/degC on the system base (PSAT: K_i)";
  parameter Types.Time Ti=10 "Time constant of the integral controller (PSAT: T_i)";
  parameter Types.Time T1=1200 "Time constant of the thermal load (PSAT: T_1)";
  parameter Modelica.Units.NonSI.Temperature_degC T_ref=70
    "Reference temperature, the value of the input t_ref at the start (PSAT: Theta_ref)";
  parameter Modelica.Units.NonSI.Temperature_degC T0=10
    "Ambient temperature, the value of the input t_a at the start, used for K1 (PSAT: Theta_a)";
  parameter Types.PerUnit G0 = P_0/S_b/v_0^2 "Initial conductance, system base (PSAT: g^0 = p^0/(v^0)^2)";
  parameter Types.PerUnit Gmax = Kl*G0 "Maximum conductance, system base (PSAT: g^max)";
  parameter Types.PerUnit Gmin = 0 "Minimum conductance, system base (PSAT: fixed at 0)";
  parameter Real K1 = (T_ref-T0)/(P_0/S_b) "Active power gain, degC/pu on the system base (PSAT: K_1)";
  parameter Real K3=1 "Auxiliary gain at the input of the integrator; not in PSAT (1 reproduces PSAT)";

  OpenIPSL.NonElectrical.Continuous.SimpleLag
                                        firstOrder(
    K=1,
    T=T1,
    y_start=T_ref)
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
    y_start=G0)
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
  assert(Kl >= 1, "ThermostaticallyControlled: Kl < 1 puts G0 above Gmax, so the load cannot start in steady state; PSAT uses Kl = 2 instead.", AssertionLevel.warning);
  assert(not initial() or abs(t_ref - T_ref) <= 1e-6*max(1, abs(T_ref)),
    "ThermostaticallyControlled: the input t_ref must equal T_ref at the start, which the steady-state start values assume.");
  assert(not initial() or abs(t_a - T0) <= 1e-6*max(1, abs(T0)),
    "ThermostaticallyControlled: the input t_a must equal T0 at the start, which K1 and the steady-state start values assume.");
  P = Limiter1.y*v^2;
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
This load defines a dynamic load with temperature control: a conductance <code>G</code>, set by a
PI controller of the temperature <code>T</code> of a first-order thermal model, with
<code>P = G*v^2</code>:</p>
<p><code>T1*der(T) = t_a - T + K1*P</code>,
<code>der(x) = Ki/Ti*(t_ref - T)</code>,
<code>G = Kp*(t_ref - T) + x</code>, and <code>Q = Q_0/S_b</code> constant.</p>
<p>The integrator state <code>x</code> is limited to [<code>Gmin</code>, <code>Gmax</code>] with
anti-windup, and <code>G</code> is limited to the same range. <code>G</code>, <code>Kp</code> and
<code>Ki</code> are on the system base (pu/degC for the gains), as in PSAT (<code>@THclass</code>).</p>
<p>The load starts in steady state at its power flow, as in PSAT (<code>@THclass/setx0.m</code>):
<code>G0 = P_0/S_b/v_0^2</code>, <code>T = T_ref</code>, <code>x = G0</code>,
<code>Gmax = Kl*G0</code> and <code>K1 = (T_ref - T0)/(P_0/S_b)</code>, where <code>T0</code> is the
ambient temperature. The inputs <code>t_ref</code> and <code>t_a</code> must equal <code>T_ref</code>
and <code>T0</code> at the start; the model stops at initialisation if they do not. <code>Kl</code> must be at least 1, or the load cannot start in
steady state: PSAT replaces <code>Kl &lt; 1</code> with 2; this model warns.</p>
<p>PSAT's thermostatically controlled load takes only active power and leaves the reactive power to
the PQ load at its bus; this model carries both, <code>P_0</code> under temperature control and
<code>Q_0</code> constant, and needs no PQ load beside it.</p>
<p>Two errors of the PSAT 2.1.11 manual: in eq. 16.13, <code>K1 = (T_ref - T0)/p0</code> needs the
ambient temperature, not the initial one (which is <code>T_ref</code>; <code>setx0.m</code> uses the
ambient temperature, column 7 of <code>Thload.con</code>), and Table 16.7 gives <code>Kp</code> and
<code>Ki</code> no unit where they are in pu/degC.</p>
<p>
For more information see <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Milano2013]</a>,
section \"16.6 Thermostatically Controlled Load\".
</p>
</html>"));
end ThermostaticallyControlled;
