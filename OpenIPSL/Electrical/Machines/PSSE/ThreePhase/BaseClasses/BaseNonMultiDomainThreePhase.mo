within OpenIMDML.NonMultiDomain.Motors.ThreePhase.BaseClasses;
partial model BaseNonMultiDomainThreePhase "Base class model for the non multi-domain three-phase induction motor models."

  parameter OpenIPSL.Types.ApparentPower M_b = 15e6 "Machine base power"
                                                                        annotation (Dialog(group="Power flow data"));
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enabledisplayPF=false,
    final enablefn=false,
    final enableV_b=false,
    final enableangle_0=false,
    final enablev_0=false,
    final enableQ_0=false,
    final enableP_0=false,
    final enableS_b=true);

    import Modelica.Constants.pi;
    import OpenIPSL.NonElectrical.Functions.SE;
    import Modelica.Constants.eps;

  parameter Boolean Sup = true "True: Start-up process, False: Steady-state condition" annotation (Dialog(group="Motor Setup"));
  parameter Boolean Ctrl = true "True: Model for VSD control, False: Model not controllable"
                                                                                            annotation (Dialog(group="Motor Setup"));
  parameter Real N = 1 "Number of pair of Poles"
                                                annotation (Dialog(group="Machine parameters"));
  parameter Modelica.Units.SI.Time H = 0.4 "Inertia constant"
                                                             annotation (Dialog(group="Machine parameters"));

  OpenIPSL.Types.PerUnit v "Bus voltage magnitude";
  OpenIPSL.Types.Angle anglev " Bus voltage angle";
  OpenIPSL.Types.Angle delta " Bus voltage angle";
  OpenIPSL.Types.PerUnit s;
  OpenIPSL.Types.PerUnit P;
  OpenIPSL.Types.PerUnit Q;
  Modelica.Units.SI.AngularVelocity nr;
  Modelica.Units.SI.AngularVelocity ns;
  Modelica.Units.SI.AngularVelocity w_sync;
  OpenIPSL.Types.PerUnit P_motor "OK";
  OpenIPSL.Types.PerUnit Q_motor "OK";
  OpenIPSL.Types.PerUnit Vr "OK";
  OpenIPSL.Types.PerUnit Vi "OK";
  OpenIPSL.Types.PerUnit Ir "OK";
  OpenIPSL.Types.PerUnit Ii "OK";
  OpenIPSL.Types.PerUnit Imag;

  Modelica.Blocks.Sources.RealExpression Rotor_Speed(y=nr)
    annotation (Placement(transformation(extent={{-60,-10},{-80,10}})));
  Modelica.Blocks.Math.Gain we_fix(k=1)
    annotation (Placement(transformation(extent={{80,-88},{90,-78}})));
  Modelica.Blocks.Sources.Constant we_source_fix(k=0)
                                                 if not Ctrl
    annotation (Placement(transformation(extent={{32,-86},{44,-74}})));
  OpenIPSL.Interfaces.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0_sys),
    ii(start=ii0_sys))
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealOutput wr
    "Absolute angular velocity of flange as output signal"
    annotation (Placement(transformation(extent={{-100,-10},{-120,10}}),
        iconTransformation(
        extent={{20,-20},{-20,20}},
        rotation=90,
        origin={60,-120})));
  Modelica.Blocks.Interfaces.RealInput we if Ctrl annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={60,-120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-60,-120})));

protected
  parameter Modelica.Units.SI.Inertia J_load = 2*H*M_b/((2*pi*fn/N)^2);
  parameter OpenIPSL.Types.PerUnit p0 = P_0/M_b;
  parameter OpenIPSL.Types.PerUnit q0 = Q_0/M_b;
  parameter Modelica.Units.SI.AngularVelocity w_b=2*pi*fn/N "Base freq in rad/s";
  parameter OpenIPSL.Types.PerUnit vr0=v_0*cos(angle_0);
  parameter OpenIPSL.Types.PerUnit vi0=v_0*sin(angle_0);
  parameter OpenIPSL.Types.PerUnit ir0=(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2);
  parameter OpenIPSL.Types.PerUnit ii0=(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2);
  parameter OpenIPSL.Types.PerUnit ir0_sys = CoB*ir0 "Initial real current in system base";
  parameter OpenIPSL.Types.PerUnit ii0_sys = CoB*ii0 "Initial imaginary current in system base";
  parameter Real CoB = M_b/S_b;
equation
  connect(wr,Rotor_Speed. y) annotation (Line(points={{-110,0},{-81,0}},
                   color={0,0,127}));
  connect(we,we_fix. u)
    annotation (Line(points={{60,-120},{60,-83},{79,-83}}, color={0,0,127}));
  connect(we_source_fix.y,we_fix. u)
    annotation (Line(points={{44.6,-80},{70,-80},{70,-83},{79,-83}},
                                                            color={0,0,127}));

  //Synchronous speed based on controllable boolean parameter
  w_sync = (if Ctrl == true then we_fix.y else w_b);

  //Network Interface Equations
  [Vr; Vi] = [p.vr; p.vi];
  [Ir; Ii] = (1/CoB)*[p.ir; p.ii];
  Imag = sqrt(Ir^2 + Ii^2);
  v = sqrt(p.vr^2 + p.vi^2);
  anglev = atan2(p.vi, p.vr);
  delta = anglev;

  //Active and Reactive Power Consumption in the system base
  P = p.vr*p.ir + p.vi*p.ii;
  Q = (-p.vr*p.ii) + p.vi*p.ir;

  //Active and Reactive Power Consumption in the machine base
  P_motor = P/CoB;
  Q_motor = Q/CoB;

  //Rotor speed equation
  ns = w_sync/N;
  nr = (1-s)*ns;

  annotation (preferredView = "info",Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
                                          Ellipse(
          fillColor={255,255,255},
          extent={{-56,-58},{55.932,54}}), Text(
          extent={{-50,48},{50,-52}},
          lineColor={0,0,0},
          textString="M"),Text(
          origin={0,-80},
          extent={{-100,-20},{100,20}},
          fontName="Arial",
          lineColor={0,0,0},
          textString="%name"),
        Text(
          extent={{-90,100},{-30,60}},
          textColor={238,46,47},
          textString="NMD")}),   Diagram(coordinateSystem(preserveAspectRatio=false)));
end BaseNonMultiDomainThreePhase;
