within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1;
model PIDGovernorDU "GE GGOV1DU General Governor Frequency Controller"
  parameter Integer Rselect=1 "Feedback signal for governor droop" annotation (Evaluate=true, choices(
      choice=1 "Electrical power",
      choice=0 "None (isochronous governor)",
      choice=-1 "Governor output (requested stroke)",
      choice=-2 "Fuel valve stroke (true stoke)"));
  parameter Types.PerUnit R=0.04 "Permanent droop";
  parameter Types.Time T_pelec=1 "Electrical power transducer time constant";
  parameter Types.PerUnit maxerr=0.05 "Maximum value for speed error signal";
  parameter Types.PerUnit minerr=-0.05 "Minimum value for speed error signal";
  parameter Types.PerUnit Kpgov=10 "Governor proportional gain";
  parameter Types.TimeAging Kigov=2 "Governor integral gain";
  parameter Types.Time Kdgov=0 "Governor derivative gain";
  parameter Types.Time Tdgov=1 "Governor derivative controller time constant";
  parameter Types.PerUnit Kturb=1.5 "Turbine gain";
  parameter Types.PerUnit Wfnl=0.2 "No load fuel flow";
  parameter Types.TimeAging Kimw=0 "Power controller (reset) gain";
  parameter Types.PerUnit db=0 "Speed governor deadband";
  parameter Types.PerUnit Dm=0 "Mechanical damping coefficient";
  Modelica.Blocks.Math.Gain KPGOV(k=Kpgov) annotation (Placement(transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.Integrator s2(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=s20) annotation (Placement(transformation(origin = {10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Continuous.Derivative s1(
    k=Kdgov,
    T=Tdgov,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent = {{20, 20}, {40, 40}})));
  Modelica.Blocks.Math.Add3 GovernorPID annotation (Placement(transformation(origin = {84, 1.77636e-15}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Nonlinear.DeadZone deadZone(uMax=db) annotation (Placement(transformation(extent={{10,60},{30,80}})));
  Modelica.Blocks.Nonlinear.Limiter limiterSerror(uMax=maxerr, uMin=minerr) annotation (Placement(transformation(extent = {{40, 60}, {60, 80}})));
  Modelica.Blocks.Math.Add3 add3_2(k1=-1, k3=-1) annotation (Placement(transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain r(k=R) "Permanent droop" annotation (Placement(transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Add add2 annotation (Placement(transformation(origin = {-44, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Continuous.LimIntegrator s7(
    k=Kimw,
    outMax=1.1*R,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=s70) "Power controller" annotation (Placement(transformation(origin = {-70, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Add add3(k2=-1) annotation (Placement(transformation(origin = {-70, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  OpenIPSL.NonElectrical.Continuous.SimpleLag s0(
    T=T_pelec,
    y_start=s00,
    K=1) annotation (Placement(transformation(origin = {-82, -80}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain KPGOV1(k=Kigov/Kpgov) annotation (Placement(transformation(origin = {38, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Math.Add LoadlimiterPI2(k1=-1) annotation (Placement(transformation(origin = {66, -50}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealInput PELEC
    "Machine electrical power (pu)"
    annotation (Placement(transformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput PMW_SET
    "Supervisory Load Controller Setpoint"
    annotation (Placement(transformation(origin = {-120, 1.77636e-15}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, -1.77636e-15}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput P_REF annotation (Placement(transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput SPEED
    "Machine speed deviation from nominal (pu)"
    annotation (Placement(transformation(origin = {-1.77636e-15, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {1.77636e-15, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput VSTROKE "Valve Stroke" annotation (Placement(transformation(
        origin={-40,-120},extent={{-20, -20},{20, 20}},
        rotation=90), iconTransformation(
        origin={-40,-120},extent={{-20, -20},{20, 20}},
        rotation=90)));

  Modelica.Blocks.Interfaces.RealInput GOVOUT1
    "Governor Output before Limiter" annotation (Placement(transformation(
        origin={40,-120},extent={{-20, -20},{20, 20}},
        rotation=90),iconTransformation(
        origin={40,-120},extent={{-20, -20},{20, 20}},
        rotation=90)));

  Modelica.Blocks.Interfaces.RealOutput FSRN annotation (Placement(transformation(origin = {110, 1.77636e-15}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1.R_select rSELECT(Rselect = Rselect) annotation (
    Placement(transformation(origin = {-30, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
protected
  parameter Types.PerUnit Pe0(fixed=false);
  parameter Types.PerUnit Pmech0(fixed=false);
  parameter Types.PerUnit s00(fixed=false);
  parameter Types.PerUnit s20(fixed=false);
  parameter Types.PerUnit s70(fixed=false);
  parameter Types.PerUnit fsr0(fixed=false);
initial equation
  Pe0 = PELEC;
  Pmech0 = PELEC;
  s00 = Pe0;
  s20 = fsr0;
  s70 = 0;
  //assume s70=0
  fsr0 = (Pmech0 + Dm)/Kturb + Wfnl;

equation
  connect(deadZone.y, limiterSerror.u) annotation (
    Line(points = {{31, 70}, {38, 70}}, color = {0, 0, 127}));
  connect(add3_2.y, deadZone.u) annotation (
    Line(points = {{1, 70}, {8, 70}}, color = {0, 0, 127}));
  connect(add2.y, add3_2.u2) annotation (
    Line(points = {{-33, 70}, {-22, 70}}, color = {0, 0, 127}));
  connect(add3.y, s7.u) annotation (
    Line(points = {{-70, 29}, {-70, 34}}, color = {0, 0, 127}));
  connect(s2.u, KPGOV1.y) annotation (
    Line(points = {{22, -50}, {27, -50}}, color = {0, 0, 127}));
  connect(KPGOV1.u, LoadlimiterPI2.y) annotation (
    Line(points = {{50, -50}, {55, -50}}, color = {0, 0, 127}));
  connect(PELEC, s0.u) annotation (
    Line(points = {{-120, -80}, {-94, -80}}, color = {0, 0, 127}));
  connect(FSRN, GovernorPID.y) annotation (
    Line(points = {{110, 0}, {95, 0}}, color = {0, 0, 127}));
  connect(add3_2.u3, r.y) annotation (
    Line(points={{-22,62},{-30,62},{-30,21},{-30,21}}, color = {0, 0, 127}));
  connect(add2.u2, s7.y) annotation (
    Line(points={{-56,64},{-70,64},{-70,57},{-70,57}}, color = {0, 0, 127}));
  connect(P_REF, add2.u1) annotation (
    Line(points = {{-120, 80}, {-70, 80}, {-70, 76}, {-56, 76}, {-56, 76}}, color = {0, 0, 127}));
  connect(SPEED, add3_2.u1) annotation (
    Line(points = {{0, 120}, {0, 88}, {-30, 88}, {-30, 78}, {-22, 78}}, color = {0, 0, 127}));
  connect(rSELECT.y, r.u) annotation (
    Line(points={{-30,-13},{-30,-13},{-30,-2},{-30,-2}}, color = {0, 0, 127}));
  connect(PMW_SET, add3.u1) annotation (
    Line(points = {{-120, 0}, {-76, 0}, {-76, 6}, {-76, 6}}, color = {0, 0, 127}));
  connect(s0.y, add3.u2) annotation (
    Line(points = {{-71, -80}, {-64, -80}, {-64, 6}}, color = {0, 0, 127}));
  connect(s0.y, rSELECT.Pelect) annotation (
    Line(points={{-71,-80},{-38,-80},{-38,-36},{-38,-36}}, color = {0, 0, 127}));
  connect(VSTROKE, rSELECT.ValveStroke) annotation (
    Line(points = {{-40, -120}, {-40, -120}, {-40, -90}, {-30, -90}, {-30, -36}, {-30, -36}}, color = {0, 0, 127}));
  connect(GOVOUT1, rSELECT.GovernorOutput) annotation (
    Line(points = {{40, -120}, {40, -120}, {40, -90}, {-22, -90}, {-22, -36}, {-22, -36}}, color = {0, 0, 127}));
  connect(KPGOV.y, GovernorPID.u2) annotation (
    Line(points={{41,0},{72,0},{72,0},{72,0}}, color = {0, 0, 127}));
  connect(s1.y, GovernorPID.u1) annotation (
    Line(points={{41,30},{60,30},{60,8},{72,8},{72,8}}, color = {0, 0, 127}));
  connect(s2.y, GovernorPID.u3) annotation (
    Line(points={{-1,-50},{-8,-50},{-8,-30},{60,-30},{60,-8},{72,-8},{72,-8}}, color = {0, 0, 127}));
  connect(LoadlimiterPI2.u1, s2.y) annotation (
    Line(points={{78,-44},{90,-44},{90,-30},{-8,-30},{-8,-50},{-1,-50},{-1,-50}}, color = {0, 0, 127}));
  connect(GOVOUT1, LoadlimiterPI2.u2) annotation (
    Line(points = {{40, -120}, {40, -120}, {40, -90}, {90, -90}, {90, -56}, {78, -56}, {78, -56}}, color = {0, 0, 127}));
  connect(limiterSerror.y, KPGOV.u) annotation (
    Line(points={{61,70},{80,70},{80,50},{0,50},{0,0},{18,0}}, color = {0, 0, 127}));
  connect(s1.u, limiterSerror.y) annotation (
    Line(points={{18,30},{0,30},{0,50},{80,50},{80,70},{62,70},{62,70},{61,70}}, color = {0, 0, 127}));
  annotation (
    Diagram,
    Icon(graphics={Rectangle(lineColor = {0, 0, 255}, extent = {{-100, 100}, {100, -100}}),Text(
          lineColor={28,108,200},
          extent={{-20,100},{20,80}},
          textString="SPEED"), Text(
          lineColor={28,108,200},
          extent={{-90,90},{-50,68}},
          textString="P_REF"), Text(
          lineColor={28,108,200},
          extent={{-90,10},{-48,-12}},
          textString="PMW_SET"), Text(
          lineColor={28,108,200},
          extent={{-90,-70},{-50,-90}},
          textString="PELEC"), Text(
          lineColor={28,108,200},
          extent={{60,10},{90,-10}},
          textString="FSRN"), Text(
          lineColor={28,108,200},
          extent={{-40,20},{40,-20}},
          textString="Governor"), Text(
          lineColor={28,108,200},
          extent={{-60,-80},{-20,-100}},
          textString="VSTROKE"), Text(
          lineColor={28,108,200},
          extent={{20,-80},{60,-100}},
          textString="GOVOUT1")}),
    Documentation(info="<html>
<p>The following documentation is adapted from
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-Models], chapter 7.13</a>:</p>
<blockquote>
<p>
Frequency control system for the general purpose Turbine/Governor models GGOV1DU.
Note that four feedback variables can be chosen for the droop control.
If the turbine is set to be isochronous, it is necessary to set the permanent droop to zero.
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
end PIDGovernorDU;
