within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1;
model Turbine "GE General GGOV1 and GGOV1DU Turbine Model"
  parameter Integer Flag = 1 "Switch for fuel source characteristic"
    annotation(Evaluate = true,
    choices(choice = 0 "Fuel flow independent of speed", choice = 1 "Fuel flow proportional to speed"));
  parameter Types.DelayType delay=Types.DelayType.FixedDelay "Delay type (for linearisation)";
  parameter Types.Time Tact = 0.5 "Actuator time constant";
  parameter Types.PerUnit Kturb = 1.5 "Turbine gain";
  parameter Types.Time Tb = 0.1 "Turbine lag time constant";
  parameter Types.Time Tc = 0 "Turbine lead time constant";
  parameter Types.Time Teng = 0 "Transport lag time constant for diesel engine";
  parameter Types.Time Tfload = 3 "Load Limiter time constant";
  parameter Types.PerUnit Dm = 0 "Mechanical damping coefficient";
  parameter Types.PerUnit Vmax = 1 "Maximum valve position limit";
  parameter Types.PerUnit Vmin = 0.15 "Minimum valve position limit";
  parameter Types.TimeAging Ropen = 0.1 "Maximum valve opening rate";
  parameter Types.TimeAging Rclose = -0.1 "Maximum valve closing rate";
  parameter Types.Time Tsa = 4 "Temperature detection lead time constant";
  parameter Types.Time Tsb = 5 "Temperature detection lag time constant";
  parameter Types.Time DELT = 0.005 "Time step used in simulation";
  parameter Types.PerUnit Wfnl = 0.2 "No load fuel flow";
  Modelica.Blocks.Math.Product product annotation (
    Placement(transformation(extent = {{0, -44}, {20, -24}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag s4(K = 1, T1 = Tc, T2 = Tb, y_start = s40) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, origin={150,-40})));
  Modelica.Blocks.Math.Gain gain1(k = Kturb) annotation (
    Placement(transformation(origin = {78, -40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Add add4(k2 = -1) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, origin = {48, -40})));
  Modelica.Blocks.Math.Add add5(k1 = -1) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, origin={184,0})));
  Modelica.Blocks.Math.Gain gain2(k = Dm) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, origin = {90, 6})));
  OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1.Flag flag10(Flag=Flag) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, origin = {-30, 0})));
  OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1.Dm_select dm_select(Dm = Dm) annotation (
    Placement(transformation(extent = {{-40, 30}, {-20, 50}})));
  Modelica.Blocks.Math.Gain Tactgain(k = 1 / Tact) annotation (
    Placement(transformation(origin = {-130, -40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Nonlinear.Limiter V1(uMax = Ropen, uMin = Rclose) annotation (
    Placement(transformation(extent = {{-110, -50}, {-90, -30}})));
  Modelica.Blocks.Continuous.Integrator s3(k = 1, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = s30) annotation (
    Placement(transformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Add add8(k2 = -1) annotation (
    Placement(transformation(origin = {-160, -40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput SPEED "Machine speed deviation from nominal (pu)" annotation (
    Placement(transformation(extent = {{-240, 60}, {-200, 100}}), iconTransformation(extent = {{-140, 60}, {-100, 100}})));
  Modelica.Blocks.Interfaces.RealInput FSR "Governor Output" annotation (
    Placement(transformation(extent = {{-240, -20}, {-200, 20}}), iconTransformation(extent = {{-140, -20}, {-100, 20}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH "Turbine mechanical power (pu)" annotation (
    Placement(transformation(extent = {{200, -10}, {220, 10}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag s5(T = Tfload, y_start = s50, K = 1) annotation (
    Placement(transformation(extent = {{10, 10}, {-10, -10}}, rotation = 180, origin = {120, 60})));
  OpenIPSL.NonElectrical.Continuous.LeadLag s9(T1 = Tsa, T2 = Tsb, y_start = s90, K = 1) annotation (
    Placement(transformation(extent = {{80, 50}, {100, 70}})));
  Modelica.Blocks.Math.Product product1 annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 180, origin = {60, 60})));
  Modelica.Blocks.Interfaces.RealOutput TEXM "Measured Exhaust Temperature" annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = -90, origin = {0, 110}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, 110})));
  Modelica.Blocks.Interfaces.RealOutput VSTROKE "Valve Position" annotation (
    Placement(transformation(extent = {{200, -90}, {220, -70}}), iconTransformation(extent = {{-12, -12}, {12, 12}}, origin = {112, -80})));
  Modelica.Blocks.Interfaces.RealInput PELEC "Machine electrical power (pu)" annotation (
    Placement(transformation( origin = {-220, -80},extent = {{-20, -20}, {20, 20}}), iconTransformation(extent = {{-140, -100}, {-100, -60}})));
  Modelica.Blocks.Sources.Constant const(k = Wfnl) annotation (
    Placement(transformation(extent = {{0, -70}, {20, -50}})));
  Modelica.Blocks.Math.Add Dw2w annotation (
    Placement(transformation(extent = {{-120, 10}, {-100, 30}})));
  Modelica.Blocks.Sources.Constant const1(k = 1) annotation (
    Placement(transformation(extent = {{-160, 0}, {-140, 20}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(limitsAtInit = true, uMax = Vmax, uMin = Vmin) annotation (
    Placement(transformation(extent = {{-48, -50}, {-28, -30}})));
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime=Teng)
    if delay == Types.DelayType.FixedDelay "Use fixed delay model"
    annotation(Placement(transformation(extent={{108,-32},{120,-20}})));
  Modelica.Blocks.Nonlinear.PadeDelay padeDelay(
    delayTime=C.eps,
    n=2,
    balance=true) if delay == Types.DelayType.PadeDelay "Use pade delay model"
    annotation (Placement(transformation(extent={{108,-60},{120,-48}})));
protected
  parameter Types.PerUnit Pmech0(fixed = false);
  parameter Types.PerUnit s30(fixed = false);
  parameter Types.PerUnit s40(fixed = false);
  parameter Types.PerUnit s50(fixed = false);
  parameter Types.PerUnit s90(fixed = false);
  parameter Types.PerUnit fsr0(fixed = false);
initial equation
  Pmech0 = PELEC;
  s30 = fsr0;
  s40 = Pmech0;
  s50 = s90;
  s90 = fsr0;
  fsr0 = (Pmech0 + Dm) / Kturb + Wfnl;
equation
  connect(s4.y, add5.u2) annotation (
    Line(points={{161,-40},{166,-40},{166,-6},{172,-6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(product.y, add4.u1) annotation (
    Line(points = {{21, -34}, {36, -34}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(gain2.y, add5.u1) annotation (
    Line(points={{101,6},{172,6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(dm_select.y, gain2.u) annotation (
    Line(points = {{-19, 40}, {20, 40}, {20, 6}, {78, 6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(V1.y, s3.u) annotation (
    Line(points = {{-89, -40}, {-82, -40}}, color = {0, 0, 127}));
  connect(Tactgain.y, V1.u) annotation (
    Line(points = {{-119, -40}, {-112, -40}}, color = {0, 0, 127}));
  connect(add8.y, Tactgain.u) annotation (
    Line(points = {{-149, -40}, {-142, -40}}, color = {0, 0, 127}));
  connect(add5.y, PMECH) annotation (
    Line(points={{195,0},{210,0}}, color = {0, 0, 127}));
  connect(s5.u, s9.y) annotation (
    Line(points = {{108, 60}, {101, 60}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(product1.u2, gain2.u) annotation (
    Line(points = {{48, 66}, {20, 66}, {20, 6}, {78, 6}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(product1.u1, add4.u1) annotation (
    Line(points = {{48, 54}, {30, 54}, {30, -34}, {36, -34}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(s9.u, product1.y) annotation (
    Line(points = {{78, 60}, {71, 60}}, color = {0, 0, 127}));
  connect(s5.y, TEXM) annotation (
    Line(points = {{131, 60}, {160, 60}, {160, 80}, {0, 80}, {0, 110}}, color = {0, 0, 127}));
  connect(const.y, add4.u2) annotation (
    Line(points = {{21, -60}, {28, -60}, {28, -46}, {36, -46}}, color = {0, 0, 127}));
  connect(Dw2w.y, dm_select.speed) annotation (
    Line(points = {{-99, 20}, {-80, 20}, {-80, 40}, {-42, 40}}, color = {0, 0, 127}));
  connect(flag10.speed, dm_select.speed) annotation (
    Line(points = {{-42, 0}, {-80, 0}, {-80, 40}, {-42, 40}}, color = {0, 0, 127}));
  connect(add4.y, gain1.u) annotation (
    Line(points = {{59, -40}, {66, -40}}, color = {0, 0, 127}));
  connect(flag10.y, product.u1) annotation (
    Line(points = {{-19, 0}, {-10, 0}, {-10, -28}, {-2, -28}}, color = {0, 0, 127}));
  connect(limiter.y, product.u2) annotation (
    Line(points = {{-27, -40}, {-2, -40}}, color = {0, 0, 127}));
  connect(VSTROKE, limiter.y) annotation (
    Line(points = {{210, -80}, {-20, -80}, {-20, -40}, {-27, -40}}, color = {0, 0, 127}));
  connect(add8.u2, limiter.y) annotation (
    Line(points = {{-172, -46}, {-180, -46}, {-180, -80}, {-20, -80}, {-20, -40}, {-27, -40}}, color = {0, 0, 127}));
  connect(s3.y, limiter.u) annotation (
    Line(points = {{-59, -40}, {-50, -40}}, color = {0, 0, 127}));
  connect(const1.y, Dw2w.u2) annotation (
    Line(points = {{-139, 10}, {-130, 10}, {-130, 14}, {-122, 14}}, color = {0, 0, 127}));
  connect(SPEED, Dw2w.u1) annotation (
    Line(points = {{-220, 80}, {-130, 80}, {-130, 26}, {-122, 26}}, color = {0, 0, 127}));
  connect(FSR, add8.u1) annotation (
    Line(points = {{-220, 0}, {-180, 0}, {-180, -34}, {-172, -34}, {-172, -34}}, color = {0, 0, 127}));
  connect(fixedDelay.y, s4.u) annotation (Line(points={{120.6,-26},{130,-26},{130,-40},{138,-40}}, color={0,0,127}));
  connect(padeDelay.y, s4.u) annotation (Line(points={{120.6,-54},{130,-54},{130,-40},{138,-40}}, color={0,0,127},
      pattern=LinePattern.Dash));
  connect(gain1.y, fixedDelay.u) annotation (Line(points={{89,-40},{98,-40},{98,-26},{106.8,-26}}, color={0,0,127}));
  connect(gain1.y, padeDelay.u) annotation (Line(points={{89,-40},{98,-40},{98,-54},{106.8,-54}}, color={0,0,127},
      pattern=LinePattern.Dash));
  annotation (
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics={ Rectangle(lineColor = {0, 0, 255}, extent = {{-100, 100}, {100, -100}}), Text(lineColor = {28, 108, 200}, extent = {{-60, 40}, {60, -40}}, textString = "Turbine
Model"), Text(origin = {-4, 0},lineColor = {28, 108, 200}, extent = {{-90, 90}, {-40, 68}}, textString = "SPEED"), Text(origin = {-6, 82},lineColor = {28, 108, 200}, extent = {{-90, -70}, {-50, -90}}, textString = "FSR"), Text(lineColor = {28, 108, 200}, extent = {{40, 12}, {90, -12}}, textString = "PMECH"), Text(lineColor = {28, 108, 200}, extent = {{-20, 90}, {30, 70}}, textString = "TEXM"), Text(lineColor = {28, 108, 200}, extent = {{30, -70}, {92, -92}}, textString = "VSTROKE"), Text(origin = {-4, -78},lineColor = {28, 108, 200}, extent = {{-90, 10}, {-40, -14}}, textString = "PELEC")}),
    Documentation(info="<html>
<p>The following documentation is adapted from
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-Models], chapter 7.12</a>:</p>
<blockquote>
<p>
Turbine dynamic system for the general purpose Turbine/Governor models GGOV1 and GGOV1DU.
</p>
</blockquote>
<h5>Linearisation</h5>
<p>
If one wants to use this model in combination with linear analysis then the parameter <code>delayType</code>
needs to get changed to \"Pade Delay\".

The Pade Delay model herein has as default n=2 and m=n.

Linearisation will fail if <code>padeDelay.delayTime = 0</code>. The default time-delay is set to <code>padeDelay.delayTime = C.eps</code>.
</p>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Models</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2022-05-11</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/maguilerac\">@maguilerac</a>,
       <a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a>
       <a href=\"https://github.com/lvanfretti\">@lvanfretti</a>
    </p>
</td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Turbine;
