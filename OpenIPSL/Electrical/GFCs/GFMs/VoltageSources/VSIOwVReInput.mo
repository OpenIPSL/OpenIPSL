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

  // Instantiation of graphical components
  Interfaces.PwPin_p                   p
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
    "Input to vary the virtual resistance in per unit" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));

  Modelica.Blocks.Interfaces.RealInput uEmag(start=0)
    "Input to vary the voltage magnitude of the voltage source"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}}),
        iconTransformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput uEang(start=0)
    "Input to vary the angle of the voltage source"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Math.PolarToRectangular p2R
    "Convert from magnitude and angle to real and imaginary"
    annotation (Placement(transformation(extent={{-60,-20},{-18,22}})));

  // Voltage source internal impedance parameters
  parameter Real M_b=100 "Voltage Source base power rating (MVA)"
    annotation (Dialog(tab="Voltage Source parameters"));
  parameter Real R_a=1e-3 "Internal source resistance, pu, system base"
    annotation (Dialog(tab="Voltage Source parameters"));
  parameter Real X_d=0.2 "Internal source d-axis reactance, pu, system base"
    annotation (Dialog(tab="Voltage Source parameters"));

  // Current limiter maximum current limit
  parameter Real Imax = 2.0 "Inverter allowable maximum output current limit, pu"
    annotation (Dialog(tab="Current Limiter Setting"));

  // Terminal Voltage Variables
  Real V(start=v_0) "Bus voltage magnitude";
  Real anglev(start=angle_0) "Bus voltage angle";
  Real P(start=P_0/S_b) "Active power (system base)";
  Real Q(start=Q_0/S_b) "Reactive power (system base)";
  Real delta(start=delta0) "Internal voltage source angle";
  Real E(start=E0) "Internal voltage source magnitude";

  // Change of base
  parameter Real CoB=M_b/S_b "Change from system to machine base";
  parameter Real p0=P_0/M_b
    "Initial active power (machine base)";
  parameter Real q0=Q_0/M_b
    "Initial reactive power (machine base)";

  // Auxiliary parameters and variables
  parameter Real E0  = sqrt(Er0^2+Ei0^2) "Initial value of the internal voltage source phasor magnitude";
  parameter Real delta0 = atan2(Ei0, Er0) "Initial value of the internal voltage source phasor angle";
  Real Er(start=Er0) "Internal voltage source, real part";
  Real Ei(start=Ei0) "Internal voltage source, imaginary part";

  // Choice of input type
  parameter Boolean useEphasorInput = true "If true, the magnitude E and angle delta must be supplied, if false, then a deviation \\Delta E and \\Delta delta should be supplied";


protected
  parameter Real vr0=v_0*cos(angle_0);
  parameter Real vi0=v_0*sin(angle_0);
  parameter Real ir0=CoB*(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2);
  parameter Real ii0=CoB*(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2);
  parameter Real Er0 = vr0 + CoB*R_a*ir0 - CoB*X_d*ii0 "Initial value of the real part of the internal voltage source phasor";
  parameter Real Ei0 = vi0 + CoB*R_a*ii0 + CoB*X_d*ir0 "Initial value of the imaginary part of the internal voltage source phasor";

equation
  if useEphasorInput then
    delta = uEang   "Internal voltage angle, delta, provided by the graphical input uEang";
    E = uEmag   "Internal voltage magnitude, E, provided by the graphical input uEmag";
    Er = p2R.y_re "Real part of phasor calculated with the p2R block on the diagram layer";
    Ei = p2R.y_im "Imaginary part of phasor calculated with the p2R block on the diagram layer";
  else
    delta = delta0 + uEang "Initial angle plus input increment";
    E = E0 + uEmag "Initial magnitude plus input increment";
    Er = Er0 + p2R.y_re;
    Ei = Ei0 + p2R.y_im;
  end if;
  Er = p.vr + CoB*(R_a + R_e)*p.ir - CoB*X_d*p.ii; // R_e is the virtual resistance input
  Ei = p.vi + CoB*(R_a + R_e)*p.ii + CoB*X_d*p.ir; // R_e is the virtual resistance input
  P = p.vr*p.ir + p.vi*p.ii;
  Q = p.vi*p.ir - p.vr*p.ii;
  V = sqrt(p.vr^2 + p.vi^2);
  anglev = atan2(p.vi, p.vr);
  Emag = E;
  Edelta = delta;
  Ereal = Er;
  Eimag = Ei;

  // Polar/Rectangular Conversion
  connect(p2R.u_abs, uEmag) annotation (Line(points={{-64.2,13.6},{-94,13.6},{-94,
          62},{-120,62}}, color={0,0,127}));
  connect(p2R.u_arg, uEang) annotation (Line(points={{-64.2,-11.6},{-94,-11.6},{
          -94,-60},{-120,-60}}, color={0,0,127}));
    annotation (Dialog(group="System data"),
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
                             preferredView="text",
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
          radius=15)}));
end VSIOwVReInput;
