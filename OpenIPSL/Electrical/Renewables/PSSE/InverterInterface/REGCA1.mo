within OpenIPSL.Electrical.Renewables.PSSE.InverterInterface;
model REGCA1 "Renewable energy generator/converter model A"
  extends BaseClasses.BaseREGC;
  Modelica.Blocks.Math.Add add1
    "Reactive current injected into the network, absorbed positive: the limited current plus the overvoltage correction"
    annotation (Placement(transformation(extent={{112,78},{132,98}})));
  Modelica.Blocks.Nonlinear.Limiter IOLIM(uMax=Modelica.Constants.inf,
                                                    uMin=Iolim)
    "Limit Iolim on the reactive current, absorbed positive: the injected reactive current is at most -Iolim"
    annotation (Placement(transformation(extent={{78,78},{98,98}})));
  Modelica.Blocks.Sources.RealExpression HVRCM(y=Ihv)
    "High voltage reactive current management: the overvoltage correction Ihv"
    annotation (Placement(transformation(extent={{78,44},{98,64}})));
  Real s(start=v_0 - Volim)
    "Curve parameter of the high voltage reactive current management: VT - Volim while s < 0, the correction Ihv while s >= 0";
  OpenIPSL.Types.PerUnit Ihv
    "Reactive current overvoltage correction, absorbed reactive current that holds VT at Volim (machine base)";
protected
  parameter Boolean hvrcm=Khv > 0
    "High voltage reactive current management on; Khv = 0 switches it off, as in PSS/E";
public
  OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.BaseClasses.LVACM LVACM(lvpnt0=
        lvpnt0, lvpnt1=lvpnt1)
    annotation (Placement(transformation(extent={{62,-80},{82,-60}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag simpleLag(
    K=1,
    T=Tfltr,
    y_start=v_0)
    annotation (Placement(transformation(extent={{44,-80},{24,-60}})));
  OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.BaseClasses.LVPL LVPL(
    Brkpt=Brkpt,
    Lvpl1=Lvpl1,
    Zerox=Zerox)
    annotation (Placement(transformation(extent={{10,-80},{-10,-60}})));
  Modelica.Blocks.Math.Product IP
    annotation (Placement(transformation(extent={{100,-26},{120,-6}})));
public
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        origin={-80,-90})));
  Modelica.Blocks.Sources.BooleanConstant Lvplsw_logic(k=Lvplsw)
    annotation (Placement(transformation(extent={{-30,-100},{-50,-80}})));
  Modelica.Blocks.Nonlinear.Limiter limiter4(uMax=rrpwr*Tg, uMin=-C.inf)
    "Ramp limit of the active current: the rise of Ip is at most rrpwr, since the gain 1/Tg follows"
    annotation (Placement(transformation(extent={{-82,-40},{-62,-20}})));
  Modelica.Blocks.Math.Add add2(k2=-1)
    annotation (Placement(transformation(extent={{-110,-40},{-90,-20}})));
  Modelica.Blocks.Sources.RealExpression Terminal_Voltage1(y=VT) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={34,-100})));
  Modelica.Blocks.Sources.RealExpression LowerLimit(y=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
  Modelica.Blocks.Math.Add add3(k2=-1)
    annotation (Placement(transformation(extent={{-86,64},{-66,84}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=Iqrmax, uMin=Iqrmin)
    annotation (Placement(transformation(extent={{-58,64},{-38,84}})));
  Modelica.Blocks.Continuous.Integrator integrator(
    k=1/Tg,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=Iq0)
    annotation (Placement(transformation(extent={{-18,64},{2,84}})));
  Modelica.Blocks.Math.Gain gain(k=-1)
    annotation (Placement(transformation(extent={{-120,70},{-100,90}})));
  Modelica.Blocks.Sources.RealExpression Constant(y=Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-30,-124},{-50,-104}})));
  Modelica.Blocks.Continuous.Integrator integrator1(
    k=1/Tg,
    initType=Modelica.Blocks.Types.Init.InitialState,
    y_start=Ip0)
    annotation (Placement(transformation(extent={{-52,-40},{-32,-20}})));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter
    annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
equation
  [IP.y; add1.y] = -[cos(delta), sin(delta); -sin(delta), cos(delta)]*[p.ir/CoB; p.ii/CoB];
  VT - Volim = if hvrcm then noEvent(min(s, 0)) else s
    "High voltage reactive current management: VT is free below Volim and held at Volim while the correction acts";
  Ihv = if hvrcm then noEvent(max(s, 0)) else 0
    "The correction is zero below Volim and positive while VT is held at Volim";
  assert(not hvrcm or v_0 <= Volim,
    "REGCA1: the initial terminal voltage v_0 is above Volim; the high voltage reactive current management would move the initial point off the power flow");
  V_t = VT;
  Pgen = -(1/CoB)*(p.vr*p.ir + p.vi*p.ii);
  Qgen = -(1/CoB)*(p.vi*p.ir - p.vr*p.ii);
  IQ0 = Iq0;
  IP0 = Ip0;
  V_0 = v_0;
  p_0 = p0;
  q_0 = q0;

  connect(LVPL.V,simpleLag. y)
    annotation (Line(points={{12,-70},{23,-70}}, color={0,0,127}));
  connect(LVACM.y,IP. u2) annotation (Line(points={{83,-70},{92,-70},{92,-22},{98,-22}},
                             color={0,0,127}));
  connect(switch1.u1,LVPL. y)
    annotation (Line(points={{-68,-82},{-56,-82},{-56,-70},{-11,-70}},
                                                           color={0,0,127}));
  connect(Lvplsw_logic.y,switch1. u2) annotation (Line(points={{-51,-90},{-68,-90}},
                                color={255,0,255}));
  connect(simpleLag.u,LVACM. Vt) annotation (Line(points={{46,-70},{60,-70}},
                                                           color={0,0,127}));
  connect(add2.y,limiter4. u)
    annotation (Line(points={{-89,-30},{-84,-30}}, color={0,0,127}));
  connect(Terminal_Voltage1.y,LVACM. Vt) annotation (Line(points={{45,-100},{54,-100},{54,-70},{60,-70}},
                                     color={0,0,127}));
  connect(add3.y,limiter1. u)
    annotation (Line(points={{-65,74},{-60,74}},color={0,0,127}));
  connect(limiter1.y,integrator. u)
    annotation (Line(points={{-37,74},{-20,74}},
                                               color={0,0,127}));
  connect(integrator.y,add3. u2) annotation (Line(points={{3,74},{8,74},{8,56},
          {-92,56},{-92,68},{-88,68}}, color={0,0,127}));
  connect(gain.y,add3. u1) annotation (Line(points={{-99,80},{-88,80}},
                               color={0,0,127}));
  connect(gain.u, Iqcmd) annotation (Line(points={{-122,80},{-134,80},{-134,80},
          {-160,80}}, color={0,0,127}));
  connect(Ipcmd,add2. u1) annotation (Line(points={{-160,-80},{-122,-80},{-122,
          -24},{-112,-24}}, color={0,0,127}));
  connect(Constant.y, switch1.u3) annotation (Line(points={{-51,-114},{-62,-114},
          {-62,-98},{-68,-98}}, color={0,0,127}));
  connect(limiter4.y, integrator1.u)
    annotation (Line(points={{-61,-30},{-54,-30}}, color={0,0,127}));
  connect(LowerLimit.y, variableLimiter.limit2) annotation (Line(points={{-59,
          -60},{-28,-60},{-28,-38},{-22,-38}}, color={0,0,127}));
  connect(integrator1.y, variableLimiter.u)
    annotation (Line(points={{-31,-30},{-22,-30}}, color={0,0,127}));
  connect(variableLimiter.limit1, switch1.y) annotation (Line(points={{-22,-22},
          {-26,-22},{-26,-4},{-124,-4},{-124,-90},{-91,-90}}, color={0,0,127}));
  connect(variableLimiter.y, add2.u2) annotation (Line(points={{1,-30},{26,-30},
          {26,-10},{-118,-10},{-118,-36},{-112,-36}}, color={0,0,127}));
  connect(IP.u1, add2.u2) annotation (Line(points={{98,-10},{-118,-10},{-118,-36},{-112,-36}},
                            color={0,0,127}));
  connect(IOLIM.y, add1.u1)
    annotation (Line(points={{99,88},{104,88},{104,94},{110,94}}, color={0,0,127}));
  connect(IOLIM.u, integrator.y) annotation (Line(points={{76,88},{8,88},{8,
          74},{3,74}}, color={0,0,127}));
  connect(HVRCM.y, add1.u2) annotation (Line(points={{99,54},{104,54},{104,82},
          {110,82}}, color={0,0,127}));
  annotation (Icon(graphics={Text(
          extent={{-82,70},{98,-70}},
          textColor={0,0,255},
          textString="REGCA")}), Documentation(info="<html>
<p>The REGCA1 component is used to represent the renewable source (inverter) interface with the grid. It takes in as input the real current command
(Ipcmd) and the reactive current command (Iqcmd) from the electrical controller, and outputs real (Ip) and reactive (Iq) injected currents to the grid through
OpenIPSL's proprietary pwpin connector.</p>
<p>In order to properly initialize all the components that form the renewable energy source, the REGC_A component has five initialization outputs, which its constant output originates from the
starting power flow: initial real and reactive injection currents (IP0 and IQ0), initial terminal voltage (v_0), and initial active and reactive power
injections (p_0 and q_0). This method reduces repetitiveness of initialization calculation, being calculated once at the REGCA1 component.</p>
<p>The connection with other components requires a closed loop through terminal voltage variable (V_t), and active and reactive power generation (Pgen and Qgen).</p>
<h4>High voltage reactive current management</h4>
<p>The reactive current is handled absorbed positive inside the model: the lag of <code>-Iqcmd</code>, limited below by
<code>Iolim</code> (<code>IOLIM</code>: the injected reactive current is at most <code>-Iolim</code>), plus the overvoltage
correction <code>Ihv &gt;= 0</code>, which absorbs reactive current. The correction holds the terminal voltage
<code>VT</code> at <code>Volim</code> while the current command alone would raise it above <code>Volim</code>, and is zero
otherwise: <code>Ihv &gt;= 0</code>, <code>VT &lt;= Volim</code> and <code>Ihv (Volim - VT) = 0</code>. The two are written
with one curve parameter <code>s</code>, as in an ideal diode: <code>VT - Volim = min(s, 0)</code> and
<code>Ihv = max(s, 0)</code>, both inside <code>noEvent</code>, so that the solver chooses the branch with the network
equations instead of carrying the branch of the last event into an algebraic loop (with the event form, two converters
on one bus with different <code>Volim</code> could be left above the lower one). A positive <code>Khv</code> switches the
management on, and its value is not used (below); <code>Khv = 0</code> switches it off (<code>Ihv = 0</code>), as it does
in PSS/E, and so does a negative <code>Khv</code>. The initial terminal voltage <code>v_0</code> must not be above <code>Volim</code> while the management
is on; an assert stops the simulation otherwise.</p>
<p>Two limits of the clamp. Two converters at one bus with the same <code>Volim</code> hold the same voltage, and the
network fixes only the sum of their corrections: how it splits between them is not determined, and depends on the tool.
And the clamp needs a network that admits an operating point with <code>VT &lt;= Volim</code> for the converter's current
commands: a converter connected directly to a voltage source above <code>Volim</code> has no solution (no current can
move a prescribed voltage), one connected directly to a source at exactly <code>Volim</code> has an undetermined
correction, and one behind an impedance too large for any reactive current to bring the voltage down to
<code>Volim</code> has no solution either. With an ideal source at the converter's terminal, switch the management off
(<code>Khv = 0</code>).</p>
<p>The block diagram of the PSS/E Model Library (section REGCA1 of the chapter Generic Renewable Generator Models) draws the
correction as <code>Khv max(0, VT - Volim)</code> subtracted from the reactive current before the limit <code>Iolim</code>.
Read in the convention of that diagram, the term increases the injected reactive current and raises the voltage further;
PSS/E 36.2 acts the other way. Its correction (the VAR <em>Reactive current overvoltage correction</em>) is a reactive
power: on the sample measured (after a fault, <code>Iolim</code> not binding, machine and system bases both 100 MVA) the
reactive power equals the terminal voltage times the lagged current minus the VAR, so the VAR corresponds to the
reduction of reactive power <code>VT Ihv</code> on the machine base here. It always reduces the injected reactive current, and it is computed in the iterations of PSS/E's network solution, where <code>Khv</code>
and the acceleration factor <code>Accel</code> (a CON of PSS/E's REGCA1 that has no counterpart here) are gains of the
iteration: each call of the model adds <code>Khv max(0, V - Volim)</code>, with the voltage relaxed by <code>Accel</code>,
to a correction rebuilt every time step. PSS/E holds the voltage near <code>Volim</code>, at a level that depends on
<code>Khv</code>, <code>Accel</code>, the network and the settings of PSS/E's network solution (measured with PSS/E 36.2.1
on <code>REGCA1HighVoltage</code>: 1.069 pu with the default settings, 1.067 pu with the network solution converged,
1.085 pu with its acceleration factor 1.6 and 1.20 pu with at most five network iterations; from 1.13 to 0.90 pu for
other gains and overvoltages with the network solution converged at every step, and no converged solution for <code>Khv = 2</code>, <code>Accel = 1</code> on a stronger
overvoltage). A simultaneous solution of the network and the
model, as here, reaches the limit the iteration aims at directly, which is how PowerWorld Simulator documents its REGC_A
[POWERWORLD-REGCA]: at <code>Volim</code> additional reactive current maintains the solved voltage at the threshold. The
clamp is that approximation of PSS/E's behaviour. The value of <code>Khv</code> is therefore not used; only whether it is
positive. Before this was changed
(OpenIPSL issue #466), the correction was <code>Khv max(0, VT - Volim)</code> with the diagram's sign and raised the voltage
after a fault instead of limiting it.</p>
<p>[POWERWORLD-REGCA] PowerWorld Corporation, \"Machine Model: REGC_A\", PowerWorld Simulator help,
<a href=\"https://www.powerworld.com/WebHelp/Content/TransientModels_HTML/Machine%20Model%20REGC_A.htm\">https://www.powerworld.com/WebHelp/Content/TransientModels_HTML/Machine%20Model%20REGC_A.htm</a>.</p>
<p>The modelling of such devices is based, mainly, on the following reference:</p>
<ul>
<li><p>Siemens: \"PSS&reg;E Model Library\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a>.</p>
</li>
</ul>
</html>"));
end REGCA1;
