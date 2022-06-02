within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1;
model AccelerationLimiter
  "GE General GGOV1 and GGOV1DU Governor Acceleration Control"
  parameter Types.PerUnit Ka=10 "Acceleration limiter gain";
  parameter Types.Time Ta=0.1 "Acceleration limiter time constant";
  parameter Types.Time DELT=0.005 "Time step used in simulation";
  Modelica.Blocks.Math.Gain acceleration(k=Ka*DELT) annotation (Placement(transformation(extent={{14,-6},{38,18}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  Modelica.Blocks.Interfaces.RealInput SPEED
    "Machine speed deviation from nominal (pu)"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}}), iconTransformation(extent={{-140,-60},{-100,-20}})));
  Modelica.Blocks.Continuous.Derivative s8(
    k=1,
    T=Ta,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(extent={{-30,-4},{-10,16}})));
protected
  parameter Types.PerUnit s80(fixed=false);
public
  Modelica.Blocks.Interfaces.RealInput ASET
    "Acceleration limiter setpoint (p.u./s)"
    annotation (Placement(transformation(extent={{-140,60},{-100,100}}),
                                                                       iconTransformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealOutput FSRA
    "Acceleration Controller Output"
    annotation (Placement(transformation(extent={{100,-10},{120,10}}),iconTransformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealInput FSR annotation (Placement(transformation(extent={{-140,-100},{-100,-60}}),
                                                                                                              iconTransformation(extent={{140,-60},{100,-20}})));
initial equation
  s80 = 0;

equation
  connect(acceleration.y, add.u1) annotation (Line(
      points={{39.2,6},{68,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s8.y, add1.u2) annotation (Line(
      points={{-59,0},{-32,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(acceleration.u, add1.y) annotation (Line(
      points={{11.6,6},{-9,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add1.u1, ASET) annotation (Line(points={{-32,12},{-44,12},{-44,80},{-120,80}},
                                                                                       color={0,0,127}));
  connect(s8.u, SPEED) annotation (Line(points={{-82,0},{-120,0}}, color={0,0,127}));
  connect(add.u2, FSR) annotation (Line(points={{68,-6},{52,-6},{52,-80},{-120,-80}}, color={0,0,127}));
  connect(add.y, FSRA) annotation (Line(points={{91,0},{110,0}}, color={0,0,127}));
  annotation (
    Icon(graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}),Text(
          extent={{-90,50},{-60,30}},
          lineColor={28,108,200},
          textString="ASET"), Text(
                    extent={{-70,52},{70,-50}},
                    lineColor={28,108,200},
                    textString="Acceleration
Limiter"),Text( extent={{-90,-30},{-50,-50}},
                    lineColor={28,108,200},
                    textString="SPEED"),Text(
                    extent={{60,52},{90,30}},
                    lineColor={28,108,200},
                    textString="FSRA"),Text(
                    extent={{60,-30},{90,-50}},
                    lineColor={28,108,200},
                    textString="FSR")}),
    Documentation(info="<html>
<p>The following documentation is adapted from
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-Models], chapter 7.12</a>:</p>
<blockquote>
<p>This is an acceleration control system for the general purpose Turbine/Governor models GGOV1 and GGOV1DU.
</p>
</blockquote>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Models</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-11-22</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/maguilerac\">@maguilerac</a>,
       <a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a></p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end AccelerationLimiter;
