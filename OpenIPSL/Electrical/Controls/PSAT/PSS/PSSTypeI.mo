within OpenIPSL.Electrical.Controls.PSAT.PSS;
model PSSTypeI "PSAT PSS Type I"
  parameter Real Kw "Stabilizer gain [pu/pu]";
  parameter Real Kp "Gain for active power";
  parameter Real Kv "Gain for bus voltage magnitude";
  parameter Types.PerUnit vsmax "Max stabilizer output signal";
  parameter Types.PerUnit vsmin "Min stabilizer output signal";
  parameter Types.Time Tw "Wash-out time constant";
  parameter Types.Time Tc "Lag time constant";
  parameter Boolean useWindupGuard=true
    "true (default, reproduces PSAT): LagLimWindupGuard, output as PSAT's clamp with the state held within the limits; false: SimpleLagLim, as before this option (same output, its state winds up past the limit)"
    annotation (Evaluate=true, choices(checkBox=true), Dialog(group="Limiter"));
  Modelica.Blocks.Interfaces.RealInput w "Rotor speed"
    annotation (Placement(transformation(extent={{-140,60},{-100,100}}), iconTransformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealOutput Vref
    "Indexes of the algebraic variable "
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput Pg "Active power"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput Vg "Voltage magnitude
of the generator to which the PSS is connected through the AVR"
    annotation (Placement(transformation(extent={{-140,-100},{-100,-60}}), iconTransformation(extent={{-140,-80},{-100,-40}})));
  OpenIPSL.NonElectrical.Continuous.DerivativeLag
                                         derivativeLag(
    T=Tw,
    y_start=0,
    x_start=0,
    K=Tw)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Math.Gain gainStabilizer(k=Kw) "Stabilizer gain " annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
  Modelica.Blocks.Math.Gain gainActivePower(k=Kp) "Gain for active power" annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Math.Gain gainVoltage(k=Kv) "Gain for bus voltage magnitude" annotation (Placement(transformation(extent={{-80,-90},{-60,-70}})));
  Modelica.Blocks.Math.Add3 add3 annotation (Placement(transformation(extent={{-44,-6},{-32,6}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=1,
    T=Tc,
    y_start=0,
    outMax=vsmax,
    outMin=vsmin) if not useWindupGuard
    annotation (Placement(transformation(extent={{12,-10},{32,10}})));
  OpenIPSL.NonElectrical.Continuous.LagLimWindupGuard lagLimWindupGuard(
    K=1,
    T=Tc,
    y_start=0,
    outMax=vsmax,
    outMin=vsmin) if useWindupGuard
    annotation (Placement(transformation(extent={{12,14},{32,34}})));
  Modelica.Blocks.Interfaces.RealInput vref0 annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,120})));
equation
  connect(Vg, gainVoltage.u) annotation (Line(points={{-120,-80},{-82,-80}}, color={0,0,127}));
  connect(Pg, gainActivePower.u) annotation (Line(points={{-120,0},{-82,0}}, color={0,0,127}));
  connect(gainStabilizer.y, add3.u1) annotation (Line(points={{-59,80},{-51.65,80},{-51.65,4.8},{-45.2,4.8}}, color={0,0,127}));
  connect(gainActivePower.y, add3.u2) annotation (Line(points={{-59,0},{-45.2,0}}, color={0,0,127}));
  connect(gainVoltage.y, add3.u3) annotation (Line(points={{-59,-80},{-52,-80},{-52,-4.8},{-45.2,-4.8}}, color={0,0,127}));
  connect(add3.y, derivativeLag.u) annotation (Line(points={{-31.4,0},{-22,0}}, color={0,0,127}));
  connect(derivativeLag.y, simpleLagLim.u)
    annotation (Line(points={{1,0},{10,0}}, color={0,0,127}));
  connect(simpleLagLim.y, add.u2) annotation (Line(points={{33,0},{42,0},{42,-6},{68,-6}}, color={0,0,127}));
  connect(derivativeLag.y, lagLimWindupGuard.u)
    annotation (Line(points={{1,0},{6,0},{6,24},{10,24}}, color={0,0,127}));
  connect(lagLimWindupGuard.y, add.u2) annotation (Line(points={{33,24},{42,24},{42,-6},{68,-6}}, color={0,0,127}));
  connect(add.y, Vref) annotation (Line(points={{91,0},{110,0}}, color={0,0,127}));
  connect(vref0, add.u1) annotation (Line(points={{0,120},{0,66},{40,66},{40,6},{68,6}}, color={0,0,127}));
  connect(w, gainStabilizer.u) annotation (Line(points={{-120,80},{-82,80}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-140,-100},{140,-160}},
          textColor={0,0,255},
          textString="%name")}), Documentation(info="<html>
<p>
For more information see <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Milano2013]</a>, section \"18.4.1
Type I\".
</p>
<h5>Limiter of the output</h5>
<p>PSAT clamps the stabilizer output between <code>vsmin</code> and <code>vsmax</code> without a lag
(<code>@PSclass/gcall.m</code>); this model puts the limit on a lag of time constant <code>Tc</code>. The default,
<code>useWindupGuard = true</code>, uses
<a href=\"modelica://OpenIPSL.NonElectrical.Continuous.LagLimWindupGuard\">LagLimWindupGuard</a>: its state stays
within the limits, and with a small <code>Tc</code> the output follows PSAT's clamp. With
<code>useWindupGuard = false</code> the model uses
<a href=\"modelica://OpenIPSL.NonElectrical.Continuous.SimpleLagLim\">SimpleLagLim</a>, as before this option existed.
Its output is the same, but its state runs past the limit until the input turns back, and it needs more events.
<a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.PSS.PSSTypeI_LagLimWindupGuard\">PSSTypeI_LagLimWindupGuard</a> and
<a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.PSS.PSSTypeI_SimpleLagLim\">PSSTypeI_SimpleLagLim</a> show the
difference.</p>
</html>"));
end PSSTypeI;
