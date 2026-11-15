within OpenIPSL.Electrical.GFCs.GFMs.VoltageSources;
model VSIOwVReInput
  "Simple voltage source with internal impedance, inputs to control the internal voltage and virtual resistor input for current limiting"
  import Modelica;
  outer OpenIPSL.Electrical.SystemBase SysData;
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enabledisplayPF=false,
    final enablefn=false,
    final enableV_b=false,
    final enableangle_0=true,
    final enablev_0=true,
    final enableQ_0=true,
    final enableP_0=true,
    final enableS_b=true);

  Interfaces.PwPin_p p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0)) "Terminal of the source; the current flows into the pin"
    annotation (Placement(transformation(extent={{100,-10},{120,10}}),
        iconTransformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealOutput Emag "Internal voltage magnitude"
    annotation (Placement(transformation(extent={{100,60},{140,100}})));
  Modelica.Blocks.Interfaces.RealOutput Edelta "Internal voltage angle"
    annotation (Placement(transformation(extent={{100,20},{140,60}}),
        iconTransformation(extent={{100,20},{140,60}})));
  Modelica.Blocks.Interfaces.RealOutput Ereal
    "Real part of the internal voltage source"
    annotation (Placement(transformation(extent={{100,-60},{140,-20}}),
        iconTransformation(extent={{100,-60},{140,-20}})));
  Modelica.Blocks.Interfaces.RealOutput Eimag
    "Imaginary part of the internal voltage source"
    annotation (Placement(transformation(extent={{100,-100},{140,-60}}),
      iconTransformation(extent={{100,-100},{140,-60}})));

  Modelica.Blocks.Interfaces.RealInput R_e(start=0)
    "Virtual resistance in series with the source, pu, machine base" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));

  Modelica.Blocks.Interfaces.RealInput uEmag(start=E0)
    "Magnitude of the internal voltage behind R_a + R_e + jX_d (or its deviation from E0, useEphasorInput = false)"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}}),
        iconTransformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput uEang(start=delta0)
    "Angle of the internal voltage behind R_a + R_e + jX_d (or its deviation from delta0, useEphasorInput = false)"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Math.PolarToRectangular p2R
    "Convert from magnitude and angle to real and imaginary"
    annotation (Placement(transformation(extent={{-60,-20},{-18,22}})));

  parameter OpenIPSL.Types.ApparentPower M_b=SysData.S_b "Voltage source base power rating (VA)"
    annotation (Dialog(tab="Voltage Source parameters"));
  parameter OpenIPSL.Types.PerUnit R_a=1e-3 "Internal source resistance, pu, machine base"
    annotation (Dialog(tab="Voltage Source parameters"));
  parameter OpenIPSL.Types.PerUnit X_d=0.2 "Internal source d-axis reactance, pu, machine base"
    annotation (Dialog(tab="Voltage Source parameters"));
  parameter OpenIPSL.Types.PerUnit Imax = 2.0 "Inverter allowable maximum output current, pu, machine base (not used by this model's equations: the limit is imposed by the R_e computed outside, REGFMA1.Components.CurrentLimiters.Submodels.VRe)"
    annotation (Dialog(tab="Current Limiter Setting"));

  OpenIPSL.Types.PerUnit V(start=v_0) "Bus voltage magnitude";
  OpenIPSL.Types.Angle anglev(start=angle_0) "Bus voltage angle";
  OpenIPSL.Types.PerUnit P(start=P_0/S_b) "Active power injected into the network (system base)";
  OpenIPSL.Types.PerUnit Q(start=Q_0/S_b) "Reactive power injected into the network (system base)";
  OpenIPSL.Types.Angle delta(start=delta0) "Internal voltage source angle (behind R_a + R_e + jX_d)";
  OpenIPSL.Types.PerUnit E(start=E0) "Internal voltage source magnitude (behind R_a + R_e + jX_d)";

  parameter Real CoB=M_b/S_b "Change from system to machine base";
  parameter OpenIPSL.Types.PerUnit p0=P_0/M_b
    "Initial active power (machine base)";
  parameter OpenIPSL.Types.PerUnit q0=Q_0/M_b
    "Initial reactive power (machine base)";

  parameter OpenIPSL.Types.PerUnit E0 = sqrt(Er0^2+Ei0^2) "Initial value of the internal voltage source phasor magnitude";
  parameter OpenIPSL.Types.Angle delta0 = atan2(Ei0, Er0) "Initial value of the internal voltage source phasor angle";
  OpenIPSL.Types.PerUnit Er(start=Er0) "Internal voltage source, real part";
  OpenIPSL.Types.PerUnit Ei(start=Ei0) "Internal voltage source, imaginary part";

  parameter Boolean useEphasorInput = true "If true, the magnitude E and angle delta must be supplied, if false, then a deviation \\Delta E and \\Delta delta should be supplied";

protected
  parameter OpenIPSL.Types.PerUnit vr0=v_0*cos(angle_0) "Initial value of the real part of the terminal voltage";
  parameter OpenIPSL.Types.PerUnit vi0=v_0*sin(angle_0) "Initial value of the imaginary part of the terminal voltage";
  parameter OpenIPSL.Types.PerUnit ir0=-CoB*(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2) "Initial value of the real part of the current into the pin (system base)";
  parameter OpenIPSL.Types.PerUnit ii0=-CoB*(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2) "Initial value of the imaginary part of the current into the pin (system base)";
  parameter OpenIPSL.Types.PerUnit Er0 = vr0 + R_a/CoB*(-ir0) - X_d/CoB*(-ii0) "Initial value of the real part of the internal voltage source phasor (R_e = 0 at the start)";
  parameter OpenIPSL.Types.PerUnit Ei0 = vi0 + R_a/CoB*(-ii0) + X_d/CoB*(-ir0) "Initial value of the imaginary part of the internal voltage source phasor (R_e = 0 at the start)";

equation
  if useEphasorInput then
    delta = uEang "Internal voltage angle, delta, provided by the graphical input uEang";
    E = uEmag "Internal voltage magnitude, E, provided by the graphical input uEmag";
    Er = p2R.y_re "Real part of phasor calculated with the p2R block on the diagram layer";
    Ei = p2R.y_im "Imaginary part of phasor calculated with the p2R block on the diagram layer";
  else
    delta = delta0 + uEang "Initial angle plus input increment";
    E = E0 + uEmag "Initial magnitude plus input increment";
    Er = Er0 + p2R.y_re;
    Ei = Ei0 + p2R.y_im;
  end if;
  Er = p.vr + (R_a + R_e)/CoB*(-p.ir) - X_d/CoB*(-p.ii) "The internal voltage behind R_a + R_e + jX_d; the machine-base impedance divided by CoB is on the system base; R_e is the virtual resistance input";
  Ei = p.vi + (R_a + R_e)/CoB*(-p.ii) + X_d/CoB*(-p.ir) "The internal voltage behind R_a + R_e + jX_d; the machine-base impedance divided by CoB is on the system base; R_e is the virtual resistance input";
  -P = p.vr*p.ir + p.vi*p.ii "Active power injection";
  -Q = p.vi*p.ir - p.vr*p.ii "Reactive power injection";
  V = sqrt(p.vr^2 + p.vi^2) "Terminal voltage magnitude";
  anglev = atan2(p.vi, p.vr) "Terminal voltage angle";
  Emag = E "The commanded internal voltage magnitude (behind R_a + R_e + jX_d)";
  Edelta = delta "The commanded internal voltage angle (behind R_a + R_e + jX_d)";
  Ereal = Er;
  Eimag = Ei;
  connect(p2R.u_abs, uEmag) annotation (Line(points={{-64.2,13.6},{-94,13.6},{-94,
          62},{-120,62}}, color={0,0,127}));
  connect(p2R.u_arg, uEang) annotation (Line(points={{-64.2,-11.6},{-94,-11.6},{
          -94,-60},{-120,-60}}, color={0,0,127}));
  annotation (preferredView = "diagram", Dialog(group="System data"),
    Icon(graphics={
        Ellipse(extent={{-100,100},{100,-100}},
                                           lineColor={0,0,255},
          lineThickness=1),
        Ellipse(extent={{-80,80},{80,-80}},lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
                   Text(extent={{-150,140},{150,100}}, textString="%name"),
        Ellipse(
          extent={{0,28},{60,-32}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={229,244,255},
          fillPattern=FillPattern.Solid,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Ellipse(
          extent={{-60,-32},{0,28}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.None,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Rectangle(
          extent={{-28,-48},{32,-68}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineThickness=1),
        Line(points={{-48,-58},{-28,-58}},
                                       color={28,108,200},
          thickness=1),
        Line(points={{32,-58},{52,-58}},
                                     color={28,108,200},
          thickness=1),
        Rectangle(
          extent={{-68,-48},{-48,-68}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={0,128,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{52,-48},{72,-68}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{0,-58},{-20,-118},{20,-118},{0,-58}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid)}),
    Diagram(graphics={Text(
          extent={{-80,-20},{80,-100}},
          textColor={217,67,180},
          textString="Text Layer assigns p2R.y_re and p2R.y_im to uvre and uvim,
which are the real and imaginary input
 voltage deviations from the initial value"), Rectangle(
          extent={{-8,20},{20,-20}},
          lineColor={28,108,200},
          fillColor={217,67,180},
          fillPattern=FillPattern.Solid,
          radius=15)}),
    Documentation(info="<html>
<p>
A voltage source behind the impedance <code>R_a + R_e + jX_d</code> (pu on the machine base <code>M_b</code>, in VA),
where <code>R_e</code> is a virtual resistance given by the input of the same name: the source of the virtual-resistor current limiter
of REGFM_A1 <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2024]</a>.
The input <code>R_e</code> is computed outside, by <code>REGFMA1.Components.CurrentLimiters.Submodels.VRe</code>, from the commanded internal voltage
(the inputs <code>uEmag</code>, <code>uEang</code>) and the terminal voltage; with <code>R_e = 0</code> this is a plain voltage source behind
<code>R_a + jX_d</code>.
</p>
<p>
The outputs <code>Emag</code> and <code>Edelta</code> are the commanded internal voltage, behind <code>R_a + R_e + jX_d</code>;
<code>Ereal</code> and <code>Eimag</code> its real and imaginary parts.
The pin current flows into the source and <code>P</code>, <code>Q</code> are the powers injected into the network,
as in <code>OpenIPSL.Electrical.Sources.SourceBehindImpedance.BaseClasses.baseVoltageSource</code>;
the machine-base impedance is divided by <code>CoB = M_b/S_b</code> to put it on the system base.
</p>
</html>"));
end VSIOwVReInput;
