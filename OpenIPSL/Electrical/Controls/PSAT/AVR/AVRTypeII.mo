within OpenIPSL.Electrical.Controls.PSAT.AVR;
model AVRTypeII "PSAT AVR Type 2"

  Modelica.Blocks.Interfaces.RealInput v "Generator terminal voltage [pu]"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}}),
        iconTransformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput vf "Field voltage [pu]" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={110,0}), iconTransformation(extent={{100,-20},{140,20}})));
  Modelica.Blocks.Interfaces.RealInput vref
    "Reference generator terminal voltage [pu]" annotation (Placement(
        transformation(extent={{-140,40},{-100,80}}), iconTransformation(extent=
           {{-140,40},{-100,80}})));
  parameter Types.PerUnit vrmin=-5 "Minimum regulator voltage";
  parameter Types.PerUnit vrmax=5 "Maximum regulator voltage";
  parameter Real Ka=100 "Amplifier gain [pu/pu]";
  parameter Types.Time Ta=0.5 "Amplifier time constant";
  parameter Real Kf=0.15 "Stabilizer gain [pu/pu]";
  parameter Types.Time Tf=0.1 "Stabilizer time constant";
  parameter Real Ke=0 "Field circuit integral deviation [pu/pu]";
  parameter Types.Time Te=0.2 "Field circuit time constant";
  parameter Types.Time Tr=0.001 "Measurement time constant";
  parameter Real Ae=0.0006 "1st ceiling coefficient";
  parameter Real Be=0.9 "2nd ceiling coefficient";
  parameter Types.PerUnit v0=1 "Initial measured voltage";
protected
  parameter Types.PerUnit vfstate=vr10 - (Ae*Modelica.Math.exp(Be*
      abs(vf00))*vf00);
  parameter Types.PerUnit vf00(fixed=false) "Initialization of vf";
  parameter Types.PerUnit vr10=Ke*vf00 + Ae*Modelica.Math.exp(Be*abs(
      vf00))*vf00 "Initialization";
  parameter Types.PerUnit vr20=-vf00*Kf/Tf "Initialization";
public
  Modelica.Blocks.Interfaces.RealOutput vref0 "Voltage reference at t=0 [pu]"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,110}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,120})));
  Modelica.Blocks.Interfaces.RealInput vf0
    "Reference generator terminal voltage [pu]" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-112}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{30,10},{50,-10}})));
  Modelica.Blocks.Continuous.TransferFunction ExcitationSystem(
    y_start=vf00,
    a={Te,Ke},
    x_start={vfstate},
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{52,-10},{72,10}})));
  NonElectrical.Nonlinear.CeilingBlock ceilingBlock(Ae=Ae, Be=Be)
    annotation (Placement(transformation(extent={{72,30},{52,50}})));
  Modelica.Blocks.Continuous.Derivative derivativeBlock(
    y_start=0,
    initType=Modelica.Blocks.Types.Init.SteadyState,
    T=Tf,
    x_start=vf00,
    k=Kf) annotation (Placement(transformation(extent={{72,-50},{52,-30}})));
  Modelica.Blocks.Math.Feedback feedback1
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder2(
    k=1,
    T=Tr,
    y_start=v0,
    initType=Modelica.Blocks.Types.Init.SteadyState) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,-34})));
  Modelica.Blocks.Math.Feedback Verr
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    outMax=vrmax,
    outMin=vrmin,
    K=Ka,
    T=Ta,
    y_start=vr10)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
initial algorithm
  vf00 := vf0;
algorithm
  vref0 := v0 + vr10/Ka;

equation
  connect(ExcitationSystem.y, vf)
    annotation (Line(points={{73,0},{88,0},{110,0}}, color={0,0,127}));
  connect(ceilingBlock.y, feedback.u2)
    annotation (Line(points={{51,40},{40,40},{40,8}}, color={0,0,127}));
  connect(v, firstOrder2.u) annotation (Line(points={{-120,-60},{-60,-60},{-60,
          -46}}, color={0,0,127}));
  connect(Verr.u2, firstOrder2.y)
    annotation (Line(points={{-60,-8},{-60,-23}}, color={0,0,127}));
  connect(Verr.y, feedback1.u1)
    annotation (Line(points={{-51,0},{-48,0}}, color={0,0,127}));
  connect(Verr.u1, vref) annotation (Line(points={{-68,0},{-80,0},{-80,60},{-120,
          60}}, color={0,0,127}));
  connect(feedback.y, ExcitationSystem.u)
    annotation (Line(points={{49,0},{49,0},{50,0}}, color={0,0,127}));
  connect(ceilingBlock.u, vf) annotation (Line(points={{74,40},{80,40},{80,0},{
          110,0}}, color={0,0,127}));
  connect(derivativeBlock.u, vf) annotation (Line(points={{74,-40},{86,-40},{86,
          0},{110,0}}, color={0,0,127}));
  connect(feedback1.u2, derivativeBlock.y) annotation (Line(points={{-40,-8},{-40,
          -8},{-40,-40},{51,-40}}, color={0,0,127}));
  connect(feedback1.y, simpleLagLim.u)
    annotation (Line(points={{-31,0},{-12,0}}, color={0,0,127}));
  connect(simpleLagLim.y, feedback.u1)
    annotation (Line(points={{11,0},{11,0},{32,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false), graphics={Text(
          extent={{32,-28},{46,-36}},
          lineColor={28,108,200},
          textString="vr2"),Text(
          extent={{-2,0},{-8,12}},
          lineColor={28,108,200},
          textString="vr1"),Text(
          extent={{-72,-14},{-64,-20}},
          lineColor={28,108,200},
          textString="Vm"),Text(
          extent={{24,12},{30,2}},
          lineColor={28,108,200},
          textString="vr")}),
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-90,80},{-50,40}},
          lineColor={0,0,255},
          textString="vref"),Text(
          extent={{-100,-40},{-60,-70}},
          lineColor={0,0,255},
          textString="v"),Text(
          extent={{60,20},{100,-20}},
          lineColor={0,0,255},
          textString="vf"),Text(
          extent={{-40,40},{40,-40}},
          lineColor={0,0,255},
          textString="AVR2"),Text(
          extent={{16,-60},{56,-100}},
          lineColor={0,0,255},
          textString="vf0
"),Text( extent={{2,102},{42,62}},
          lineColor={0,0,255},
          textString="vref0")}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
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
</html>", info="<html>
<h5 style=\"color: #ff0000\">WARNING</h5>
<p style=\"color: #ff0000\">The PSAT Toolbox called this model &quot;AVR Type II&quot;
 (see <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Milano2013], section 18.3.2</a>)
 when it actually is the &quot;IEEE <strong>Type I</strong>&quot;
 (see <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Milano2010], chapter 16.2.1</a>).</p>
</html>"));
end AVRTypeII;
