within OpenIPSL.Electrical.Controls.PSAT.PSS;
model PSSTypeIII "PSAT PSS Type III"
  parameter Real Kw "Stabilizer gain";
  parameter Types.Time Tw "Wash-out time constant";
  parameter Types.Time T1 "First stabilizer time constant";
  parameter Types.Time T2 "Second stabilizer time constant";
  parameter Types.Time T3 "Third stabilizer time constant";
  parameter Types.Time T4 "Fourth stabilizer time constant";
  parameter Types.Time Tc "Lag time constant of the output limiter";
  parameter Types.PerUnit vsmax "Max stabilizer output signal";
  parameter Types.PerUnit vsmin "Min stabilizer output signal";
  parameter Boolean useWindupGuard=true
    "true (default, reproduces PSAT): LagLimWindupGuard, output as PSAT's clamp with the state held within the limits; false: SimpleLagLim, as before this option (same output, its state winds up past the limit)"
    annotation (Evaluate=true, choices(checkBox=true), Dialog(group="Limiter"));
  OpenIPSL.NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=1,
    T=Tc,
    y_start=0,
    outMax=vsmax,
    outMin=vsmin) if not useWindupGuard
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  OpenIPSL.NonElectrical.Continuous.LagLimWindupGuard lagLimWindupGuard(
    K=1,
    T=Tc,
    y_start=0,
    outMax=vsmax,
    outMin=vsmin) if useWindupGuard
    annotation (Placement(transformation(extent={{40,14},{60,34}})));
  Modelica.Blocks.Interfaces.RealInput vs1 "Rotor speed" annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput Vref
    "Indexes of the algebraic variable" annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  OpenIPSL.NonElectrical.Continuous.DerivativeLag derivativeLag(K=Kw*Tw, T=Tw,
    y_start=0)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction(b={T1,T3,1}, a={
        T2,T4,1})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
equation
  connect(simpleLagLim.y, Vref)
    annotation (Line(points={{61,0},{110,0}}, color={0,0,127}));
  connect(vs1, derivativeLag.u)
    annotation (Line(points={{-120,0},{-62,0}}, color={0,0,127}));
  connect(derivativeLag.y, transferFunction.u)
    annotation (Line(points={{-39,0},{-12,0}}, color={0,0,127}));
  connect(simpleLagLim.u, transferFunction.y)
    annotation (Line(points={{38,0},{11,0}}, color={0,0,127}));
  connect(lagLimWindupGuard.y, Vref)
    annotation (Line(points={{61,24},{80,24},{80,0},{110,0}}, color={0,0,127}));
  connect(lagLimWindupGuard.u, transferFunction.y)
    annotation (Line(points={{38,24},{24,24},{24,0},{11,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-140,-100},{140,-160}},
          textColor={0,0,255},
          textString="%name")}), Documentation(info="<html>
<p>
For more information see <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Milano2013]</a>, section \"18.4.3
Type III\".
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
<a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.PSS.PSSTypeIII_LagLimWindupGuard\">PSSTypeIII_LagLimWindupGuard</a> and
<a href=\"modelica://OpenIPSL.Tests.Controls.PSAT.PSS.PSSTypeIII_SimpleLagLim\">PSSTypeIII_SimpleLagLim</a> show the
difference.</p>
</html>"));
end PSSTypeIII;
