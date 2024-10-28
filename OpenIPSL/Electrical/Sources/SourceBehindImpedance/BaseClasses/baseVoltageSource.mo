within OpenIPSL.Electrical.Sources.SourceBehindImpedance.BaseClasses;
partial model baseVoltageSource
  "Base model for voltage sources behind an impedance"
  outer OpenIPSL.Electrical.SystemBase SysData;
  import Modelica.Blocks.Interfaces.*;
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enabledisplayPF=false,
    final enablefn=false,
    final enableV_b=false,
    final enableangle_0=true,
    final enablev_0=true,
    final enableQ_0=true,
    final enableP_0=true,
    final enableS_b=true);
  OpenIPSL.Interfaces.PwPin_p p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0)) "Instantiation of graphical component PwPin_p"
    annotation (Placement(transformation(extent={{100,-10},{120,10}}),
        iconTransformation(extent={{100,-10},{120,10}})));
  RealOutput Emag(start=E0) "Internal voltage magnitude"
    annotation (Placement(transformation(extent={{100,50},{120,70}}),
        iconTransformation(extent={{100,50},{120,70}})));
  RealOutput Edelta(start=delta0) "Internal voltage angle"
    annotation (Placement(transformation(extent={{100,-70},{120,-50}}),
        iconTransformation(extent={{100,-70},{120,-50}})));
  RealOutput Emag0(start=E0)
    "Initial value of the internal voltage source magnitude"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,110}),
        iconTransformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,110})));
  RealOutput Eang0(start=delta0)
    "Initial value of the internal voltage angle"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-110}),
        iconTransformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-110})));
  parameter OpenIPSL.Types.ApparentPower M_b=SysData.S_b "Voltage Source base power rating (MVA)"
    annotation (Dialog(group="Voltage Source parameters"));
  parameter OpenIPSL.Types.PerUnit R_a=1e-3 "Internal source resistance, pu, system base"
    annotation (Dialog(group="Voltage Source parameters"));
  parameter OpenIPSL.Types.PerUnit X_d=0.2 "Internal source d-axis reactance, pu, system base"
    annotation (Dialog(group="Voltage Source parameters"));
  OpenIPSL.Types.PerUnit V(start=v_0) "Bus voltage magnitude";
  OpenIPSL.Types.Angle anglev(start=angle_0) "Bus voltage angle";
  OpenIPSL.Types.PerUnit P(start=P_0/S_b) "Active power (system base)";
  OpenIPSL.Types.PerUnit Q(start=Q_0/S_b) "Reactive power (system base)";
  OpenIPSL.Types.Angle delta(start=delta0) "Internal voltage source angle";
  OpenIPSL.Types.PerUnit E(start=E0) "Internal voltage source magnitude";
protected
  parameter Real CoB=M_b/S_b "Change from system to machine base";
  parameter Real p0=P_0/M_b "Initial active power (machine base)";
  parameter Real q0=Q_0/M_b "Initial reactive power (machine base)";
  parameter OpenIPSL.Types.PerUnit vr0=v_0*cos(angle_0) "Initial value of the real part of the terminal voltage";
  parameter OpenIPSL.Types.PerUnit vi0=v_0*sin(angle_0) "Initial value of the imaginary part of the terminal voltage";
  parameter OpenIPSL.Types.PerUnit ir0=-CoB*(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2) "Initial value of the real part of the current";
  parameter OpenIPSL.Types.PerUnit ii0=-CoB*(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2) "Initial value of the imaginary part of the current";
  parameter OpenIPSL.Types.PerUnit Er0 = vr0 + CoB*R_a*ir0 - CoB*X_d*ii0 "Initial value of the real part of the internal voltage source phasor";
  parameter OpenIPSL.Types.PerUnit Ei0 = vi0 + CoB*R_a*ii0 + CoB*X_d*ir0 "Initial value of the imaginary part of the internal voltage source phasor";
  parameter OpenIPSL.Types.PerUnit E0 = sqrt(Er0^2+Ei0^2) "Initial value of the internal voltage source phasor magnitude";
  parameter OpenIPSL.Types.Angle delta0 = atan2(Ei0, Er0) "Initial value of the internal voltage source phasor angle";
  Real Er(start=Er0) "Internal voltage source, real part";
  Real Ei(start=Ei0) "Internal voltage source, imaginary part";
equation
  Er = p.vr + CoB*R_a*(-p.ir) - CoB*X_d*(-p.ii) "Equation linking the internal voltage source to the terminal bus and the pin";
  Ei = p.vi + CoB*R_a*(-p.ii) + CoB*X_d*(-p.ir) "Equation linking the internal voltage source to the terminal bus and the pin";
  -P = p.vr*p.ir + p.vi*p.ii "Active power injection";
  -Q = p.vi*p.ir - p.vr*p.ii "Reactive power injection";
  V = sqrt(p.vr^2 + p.vi^2) "Terminal voltage magnitude";
  anglev = atan2(p.vi, p.vr) "Terminal voltage angle";
  // Assining variables to outputs
  Emag = sqrt(Er^2+Ei^2) "Attaching a variable to the RealOutput Emag of the model";
  Edelta = atan2(Ei,Er) "Attaching a variable to the RealOutput Edelta of the model";
  Emag0 = E0 "Attaching the initial value to the RealOutput Emag0";
  Eang0 = delta0 "Attaching the initial value to the RealOutput Eang0";
  annotation (Icon(graphics={
        Ellipse(extent={{-100,100},{100,-100}},
                                           lineColor={0,0,255},
          lineThickness=1)}),
           preferredView="text",
    Documentation(info="<html>
<p>
This partial model is used to develop variants of a voltage source with an internal voltage source and internal impedance whose magnitude and angle.

The initial values of the internal voltage source magnitude and angle are calculated based on the impedance and power flow data.

It is based on <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Du2021]</a>, with the difference that the internal impedance includes a resistance and not only a reactance. </p>

</html>"));
end baseVoltageSource;
