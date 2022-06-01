within OpenIPSL.Electrical.Machines.PSAT.BaseClasses;
partial model baseMachine "Base machine for PSAT models"
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enabledisplayPF=false,
    final enablefn=false,
    final enableangle_0=true,
    final enablev_0=true,
    final enableQ_0=true,
    final enableP_0=true,
    final enableV_b=true,
    final enableS_b=true);
  import CM = Modelica.ComplexMath;
  import Complex;
  parameter Types.ApparentPower Sn "Power rating"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.Voltage Vn "Voltage rating"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit ra "Armature resistance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit x1d "d-axis transient reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.Time M "Mechanical starting time, 2H [Ws/VA]"
    annotation (Dialog(group="Machine parameters"));
  parameter Real D "Damping coefficient"
    annotation (Dialog(group="Machine parameters"));

  OpenIPSL.Interfaces.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0)) annotation (Placement(transformation(
        origin={100,0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Interfaces.RealOutput delta(
    start=delta0,
    quantity="Angle",
    unit="rad",
    displayUnit="rad") "Rotor angle" annotation (Placement(transformation(
        origin={110,60},
        extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput w(start=1) "Rotor speed [pu]"
    annotation (Placement(transformation(
        origin={110,90},
        extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput v(start=v_0)
    "Generator terminal voltage [pu]" annotation (Placement(transformation(
        origin={110,30},
        extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput P(start=p0) "Active power [pu]"
    annotation (Placement(transformation(
        origin={110,-30},
        extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput Q(start=q0) "Reactive power [pu]"
    annotation (Placement(transformation(
        origin={110,-70},
        extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealInput vf "Field voltage [pu]" annotation (
      Placement(transformation(
        origin={-120,50},
        extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealOutput vf0 "Initial field voltage [pu]"
    annotation (Placement(transformation(
        origin={-80,110},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.Blocks.Interfaces.RealOutput pm0(start=pm00)
    "Initial mechanical power [pu]" annotation (Placement(transformation(
        origin={-80,-110},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Blocks.Interfaces.RealInput pm(start=pm00) "Mechanical power [pu]"
    annotation (Placement(transformation(
        origin={-120,-50},
        extent={{-20,-20},{20,20}})));
  Types.Angle anglev(start=angle_0) "Bus voltage angle";
  Types.PerUnit vd(start=vd0) "d-axis voltage";
  Types.PerUnit vq(start=vq0) "q-axis voltage";
  Types.PerUnit id(start=id0) "d-axis current";
  Types.PerUnit iq(start=iq0) "q-axis current";
protected
  Types.PerUnit pe(start=pm00) "electrical power transmitted through the air-gap";
  Types.PerUnit vf_MB=vf*V_b/Vn "field voltage on machine base";
  parameter Types.AngularVelocity w_b=2*C.pi*fn "Base frequency in rad/s";
  // Define multiplicative transforms to go from one pu-base to another:
  parameter Real S_SBtoMB=S_b/Sn "S(system base) -> S(machine base)";
  parameter Real I_MBtoSB=(Sn*V_b)/(S_b*Vn) "I(machine base) -> I(system base)";
  parameter Real V_MBtoSB=Vn/V_b "V(machine base) -> V(system base)";
  parameter Real Z_MBtoSB=(S_b*Vn^2)/(Sn*V_b^2)
    "Z(machine base) -> Z(system base)";

  // Initialize stator quantities (system base):
  parameter Types.PerUnit p0=P_0/S_b
    "Initial active power generation in pu (system base)";
  parameter Types.PerUnit q0=Q_0/S_b
    "Initial reactive power generation in pu (system base)";
  parameter Complex Vt0=CM.fromPolar(v_0, angle_0)
    "Init. val., conjugate";
  parameter Complex S0(re=p0, im=-q0) "Init. val., conjugate";
  parameter Complex I0=S0/(CM.conj(Vt0)) "Init. val., conjugate";
  parameter Types.PerUnit vr0=CM.real(Vt0) "Init. val.";
  parameter Types.PerUnit vi0=CM.imag(Vt0) "Init. val.";
  parameter Types.PerUnit ir0=-CM.real(I0) "Init. val.";
  parameter Types.PerUnit ii0=-CM.imag(I0) "Init. val.";

  // Initialize DQ-quantities (machine base)
  parameter Types.PerUnit xq0 "used for setting the initial rotor angle";
  parameter Types.Angle delta0=CM.arg((Vt0 + ((ra + CM.j*xq0)*Z_MBtoSB*I0)))
    "Init. val. rotor angle";
  parameter Complex Vdq0=Vt0*CM.fromPolar(1/V_MBtoSB, (-delta0 + (C.pi/2)))
    "Init. val (machine base)";
  parameter Complex Idq0=I0*CM.fromPolar(1/I_MBtoSB, (-delta0 + (C.pi/2)))
    "(pu, machine base)";
  parameter Types.PerUnit vd0=CM.real(Vdq0) "Init. val.";
  parameter Types.PerUnit vq0=CM.imag(Vdq0) "Init. val.";
  parameter Types.PerUnit id0=CM.real(Idq0) "Init. val.";
  parameter Types.PerUnit iq0=CM.imag(Idq0) "Init. val.";

  parameter Types.PerUnit pm00=((vq0 + ra*iq0)*iq0 + (vd0 + ra*id0)*id0)/S_SBtoMB
    "Initial value (system base)";

equation
  v = sqrt(p.vr^2 + p.vi^2);
  anglev = atan2(p.vi, p.vr);
  der(delta) = w_b*(w - 1);
  if D > Modelica.Constants.eps then
    der(w) = (pm*S_SBtoMB - pe - D*(w - 1))/M;
  else
    der(w) = (pm*S_SBtoMB - pe)/M;
  end if;
  [p.ir; p.ii] = -[sin(delta), cos(delta); -cos(delta), sin(delta)]*[id; iq]*
    I_MBtoSB;
  [p.vr; p.vi] = [sin(delta), cos(delta); -cos(delta), sin(delta)]*[vd; vq]*
    V_MBtoSB;
  P = -p.vr*p.ir - p.vi*p.ii;
  Q = -p.vi*p.ir + p.vr*p.ii;
  pe = (vq + ra*iq)*iq + (vd + ra*id)*id "pu, machine base";
  pm0 = pm00 "pu, system base";
  annotation (
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}),
        graphics={Rectangle(
          fillColor={255,255,255},
          extent={{-100,-100},{100,100}},
          lineColor={28,108,200},
          fillPattern=FillPattern.Solid),Text(
          origin={-80,50},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="vf"),Text(
          origin={-80,-50},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="pm"),Text(
          origin={-80,90},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="vf0"),Text(
          origin={-80,-90},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="pm0"),Text(
          origin={85,60},
          extent={{-15,-10},{15,10}},
          lineColor={28,108,200},
          textString="delta"),Text(
          origin={90,90},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="w"),Text(
          origin={90,30},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="v"),Ellipse(extent={{-40,40},{40,-40}}, lineColor={28,108,
          200}),Line(
          points={{-20,0},{-9,15},{9,-15},{20,0}},
          color={28,108,200},
          smooth=Smooth.Bezier),Text(
          origin={0,-60},
          extent={{-60,-20},{60,20}},
          lineColor={28,108,200},
          textString="%name"),Text(
          origin={90,-31},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="P"),Text(
          origin={90,-70},
          extent={{-10,-10},{10,10}},
          lineColor={28,108,200},
          textString="Q")}));
end baseMachine;
