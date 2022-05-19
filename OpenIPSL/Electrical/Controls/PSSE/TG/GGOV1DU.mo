within OpenIPSL.Electrical.Controls.PSSE.TG;
model GGOV1DU "GGOV1DU - Variation of GE General Governor/Turbine Model [IEEE2013]"
  extends Icons.VerifiedModel;
  parameter Integer Rselect=1 "Feedback signal for governor droop"
    annotation (Evaluate=true, choices(
      choice=1 "Electrical power",
      choice=0 "None (isochronous governor)",
      choice=-1 "Governor output (requested stroke)",
      choice=-2 "Fuel valve stroke (true stoke)"));
  parameter Integer Flag=1 "Switch for fuel source characteristic"
    annotation (Evaluate=true, choices(
      choice=0 "Fuel flow independent of speed",
      choice=1 "Fuel flow proportional to speed"));
  parameter Types.DelayType delay=Types.DelayType.FixedDelay
    "Delay type inside the turbine model (use Pade Delay for linearisation)";
  parameter Types.PerUnit R=0.04 "Permanent droop";
  parameter Types.Time T_pelec=1 "Electrical power transducer time constant";
  parameter Types.PerUnit maxerr=0.05 "Maximum value for speed error signal";
  parameter Types.PerUnit minerr=-0.05 "Minimum value for speed error signal";
  parameter Types.PerUnit Kpgov=10 "Governor proportional gain";
  parameter Types.TimeAging Kigov=2 "Governor integral gain";
  parameter Types.Time Kdgov=0 "Governor derivative gain";
  parameter Types.Time Tdgov=1 "Governor derivative controller time constant";
  parameter Types.PerUnit Vmax=1 "Maximum valve position limit";
  parameter Types.PerUnit Vmin=0.15 "Minimum valve position limit";
  parameter Types.Time Tact=0.5 "Actuator time constant";
  parameter Types.PerUnit Kturb=1.5 "Turbine gain";
  parameter Types.PerUnit Wfnl=0.2 "No load fuel flow";
  parameter Types.Time Tb=0.1 "Turbine lag time constant";
  parameter Types.Time Tc=0 "Turbine lead time constant";
  parameter Types.Time Teng=0 "Transport lag time constant for diesel engine";
  parameter Types.Time Tfload=3 "Load Limiter time constant";
  parameter Types.PerUnit Kpload=2 "Load limiter proportional gain for PI controller";
  parameter Types.TimeAging Kiload=0.67 "Load limiter integral gain for PI controller";
  parameter Types.PerUnit Ldref=1 "Load limiter reference value";
  parameter Types.PerUnit Dm=0 "Mechanical damping coefficient";
  parameter Types.TimeAging Ropen=0.1 "Maximum valve opening rate";
  parameter Types.TimeAging Rclose=-0.1 "Maximum valve closing rate";
  parameter Types.TimeAging Kimw=0 "Power controller (reset) gain";
  parameter Types.TimeAging Aset=0.1 "Acceleration limiter setpoint";
  parameter Types.PerUnit Ka=10 "Acceleration limiter gain";
  parameter Types.Time Ta=0.1 "Acceleration limiter time constant";
  parameter Types.ActivePower Trate=0 "Turbine rating";
  parameter Types.PerUnit db=0 "Speed governor deadband";
  parameter Types.Time Tsa=4 "Temperature detection lead time constant";
  parameter Types.Time Tsb=5 "Temperature detection lag time constant";
  parameter Types.TimeAging Rup=99 "Maximum rate of load limit increase";
  parameter Types.TimeAging Rdown=-99 "Maximum rate of load limit decrease";
  parameter Types.Time DELT=0.005 "Time step used in simulation";
  Modelica.Blocks.Interfaces.RealInput SPEED
    "Machine speed deviation from nominal (pu)"
    annotation (Placement(transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}), iconTransformation(extent = {{-100, 40}, {-60, 80}})));
  Modelica.Blocks.Interfaces.RealInput PELEC
    "Machine electrical power (pu)"
    annotation (Placement(transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}),  iconTransformation(extent = {{-100, -80}, {-60, -40}})));
  Modelica.Blocks.Sources.Constant AccelerationSet(k=Aset) annotation (Placement(transformation(origin = {-64, 14}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant P_ref(k=Pref) annotation (Placement(transformation(origin = {-82, -26}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant Pmw_set(k=Pmwset)
    "Supervisory Load Controller Setpoint,"                                                  annotation (Placement(transformation(origin = {-60, -46}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant set(k=Ldref) "load reference" annotation (Placement(transformation(origin = {-62, 80}, extent = {{-10, -10}, {10, 10}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1.Min_select min_select(frs0=fsr0, nu= 3) annotation (Placement(transformation(extent = {{4, -10}, {24, 10}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH "Turbine mechanical power (pu)" annotation (
    Placement(transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1.LoadLimiterDU gGOV1_Temp(
    Kturb=Kturb,
    Kpload=Kpload,
    Kiload=Kiload,
    Vmax= Vmax,
    Vmin=Vmin,
    Dm=Dm,
    Wfnl=Wfnl) annotation (Placement(transformation(origin = {-30, 80}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Nonlinear.Limiter V(uMax=Vmax, uMin=Vmin) annotation (Placement(transformation(origin = {44, 0}, extent = {{-10, -10}, {10, 10}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1.Turbine gGOV1_Turb(
    delay=delay,
    Tact=Tact,
    Kturb=Kturb,
    Tb=Tb,
    Tc=Tc,
    Teng=Teng,
    Tfload=Tfload,
    Dm=Dm,
    Ropen=Ropen,
    Rclose=Rclose,
    Vmax= Vmax,
    Vmin=Vmin,
    Tsa=Tsa,
    Tsb=Tsb,
    DELT=DELT,
    Flag=Flag,
    Wfnl=Wfnl) annotation (Placement(transformation(origin = {82, 0}, extent = {{-10, -10}, {10, 10}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1.AccelerationLimiter gGOV1_Accel(
    Ka=Ka,
    Ta=Ta,
    DELT=DELT) annotation (Placement(transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1.PIDGovernorDU gGOV1_Power(
    Rselect=Rselect,
    R=R,
    T_pelec=T_pelec,
    maxerr=maxerr,
    minerr=minerr,
    Kpgov=Kpgov,
    Kigov=Kigov,
    Kdgov=Kdgov,
    Tdgov=Tdgov,
    Dm=Dm,
    Kimw=Kimw,
    db=db,
    Kturb=Kturb,
    Wfnl=Wfnl) annotation (Placement(transformation(origin = {-30, -52}, extent = {{-10, -10}, {10, 10}})));
protected
  parameter Types.PerUnit Pe0(fixed=false);
  parameter Types.PerUnit Pmech0(fixed=false);
  parameter Types.PerUnit Pref(fixed=false);
  parameter Types.PerUnit Pmwset(fixed=false);
  parameter Types.PerUnit fsr0(fixed=false);

initial equation
  Pe0 = PELEC;
  Pmech0 = PELEC;
  Pref = R*Pe0;
  Pmwset = Pe0;
  fsr0 = (Pmech0 + Dm)/Kturb + Wfnl;

equation
  connect(gGOV1_Turb.PMECH, PMECH) annotation (
    Line(points = {{93, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(set.y, gGOV1_Temp.LDREF) annotation (
    Line(points = {{-51, 80}, {-42, 80}}, color = {0, 0, 127}));
  connect(min_select.yMin, V.u) annotation (
    Line(points = {{25, 0}, {32, 0}}, color = {0, 0, 127}));
  connect(V.y, gGOV1_Turb.FSR) annotation (
    Line(points = {{55, 0}, {70, 0}}, color = {0, 0, 127}));
  connect(AccelerationSet.y, gGOV1_Accel.ASET) annotation (
    Line(points = {{-53, 14}, {-48, 14}, {-48, 4}, {-42, 4}}, color = {0, 0, 127}));
  connect(gGOV1_Temp.TEXM, gGOV1_Turb.TEXM) annotation (
    Line(points = {{-18, 84}, {82, 84}, {82, 11}}, color = {0, 0, 127}));
  connect(SPEED, gGOV1_Turb.SPEED) annotation (
    Line(points = {{-120, 60}, {64, 60}, {64, 8}, {70, 8}}, color = {0, 0, 127}));
  connect(SPEED, gGOV1_Accel.SPEED) annotation (
    Line(points = {{-120, 60}, {-80, 60}, {-80, -4}, {-42, -4}}, color = {0, 0, 127}));
  connect(PELEC, gGOV1_Power.PELEC) annotation (
    Line(points = {{-120, -60}, {-44, -60}, {-44, -60}, {-42, -60}}, color = {0, 0, 127}));
  connect(Pmw_set.y, gGOV1_Power.PMW_SET) annotation (
    Line(points = {{-49, -46}, {-46, -46}, {-46, -52}, {-42, -52}}, color = {0, 0, 127}));
  connect(P_ref.y, gGOV1_Power.P_REF) annotation (
    Line(points = {{-71, -26}, {-46, -26}, {-46, -44}, {-42, -44}}, color = {0, 0, 127}));
  connect(gGOV1_Power.SPEED, SPEED) annotation (
    Line(points = {{-30, -40}, {-30, -12}, {-80, -12}, {-80, 60}, {-120, 60}}, color = {0, 0, 127}));
  connect(PELEC, gGOV1_Turb.PELEC) annotation (
    Line(points = {{-120, -60}, {-80, -60}, {-80, -90}, {64, -90}, {64, -8}, {70, -8}, {70, -8}}, color = {0, 0, 127}));
  connect(gGOV1_Turb.VSTROKE, gGOV1_Power.VSTROKE) annotation (
    Line(points={{93.2,-8},{96,-8},{96,-78},{-34,-78},{-34,-64},{-34,-64}},            color = {0, 0, 127}));
  connect(PELEC, gGOV1_Temp.PELEC) annotation (
    Line(points = {{-120, -60}, {-94, -60}, {-94, 48}, {-30, 48}, {-30, 68}}, color = {0, 0, 127}));
  connect(V.y, gGOV1_Power.GOVOUT1) annotation (
    Line(points = {{55, 0}, {58, 0}, {58, -74}, {-26, -74}, {-26, -64}}, color = {0, 0, 127}));
  connect(V.y, gGOV1_Accel.FSR) annotation (
    Line(points = {{55, 0}, {58, 0}, {58, -32}, {-12, -32}, {-12, -4}, {-18, -4}}, color = {0, 0, 127}));
  connect(gGOV1_Power.FSRN, min_select.u[1]) annotation (
    Line(points={{-19,-52},{-6,-52},{-6,-4},{4,-4},{4,4.66667}},      color = {0, 0, 127}));
  connect(gGOV1_Temp.FSRT, min_select.u[2]) annotation (
    Line(points = {{-19, 74}, {-6, 74}, {-6, 4}, {4, 4}, {4, 0}}, color = {0, 0, 127}));
  connect(gGOV1_Accel.FSRA, min_select.u[3]) annotation (
    Line(points={{-19,4},{-10,4},{-10,0},{4,0},{4,-4.66667}},     color = {0, 0, 127}));
  annotation (
    Diagram,
    Icon(            graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200}),
        Text(
          extent={{-50,80},{10,40}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="SPEED"),
        Text(
          extent={{-50,-40},{10,-80}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="PELEC"),
        Text(
          extent={{30,20},{90,-20}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="PMECH"),
        Text(
          extent={{-100,160},{100,100}},
          lineColor={28,108,200},
          textString="GGOV1DU")}),
    Documentation(info="<html>
<p>The following documentation is adapted from
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-Models], chapter 7.13</a>:</p>
<blockquote>
<p>This is a general purpose Governor/Turbine model that can be used in dynamic studies. This model is a slightly different model than the GGOV1.
The model can be used to represent many different models such as gas turbines, aeroderivative turbines and diesel engines.
This model is a variation of the GGOV1 model and a fairly complete review can be found in
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[IEEE2013]</a>.
</p>
<p>
[...]
</p>
<p>
This model is incredibly versatile and can be used to represent different turbine models with different control modes.
The Governor-Turbine frequency control, for example, can have different feedback signals, such as electric power, turbine output, valve stroke or even an isochronous operation.
Isochronous operations are used when the machine operates in an isolated system. Note that, in this case, the permanent droop parameter <code>R</code> should be set to zero.
In addition to that, the parameters can be set so a particular control loop is used.
This model allows the representation of a frequency control system, a temperature control system and an acceleration limiter control system.
</p>
<p>
[...]
</p>
<p>
In order to represent a diesel generator using this model, one should be careful with setting some parameters. For example, a diesel generator needs to have <code>flag</code> set to 1.
This is because the diesel generator have teir fluid flow proportional on the speed. In addition to that, <code>Teng</code>, which represents the time delay from the engine, should be set to a number greater than 0.
Finally, the variable <code>Dm</code> should also be set to a number greater than 0. This is because in diesel engines, the maximum power output decreases as speed increases.
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
end GGOV1DU;
