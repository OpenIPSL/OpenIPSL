within OpenIPSL.Electrical.ThreePhase.Loads;
model WyeLoad_1Ph "Single-phase load"
  extends ThreePhaseComponent;

  OpenIPSL.Interfaces.PwPin A(
    vr(start=var0),
    vi(start=vai0),
    ir(start=iar0),
    ii(start=iai0)) annotation (Placement(
      transformation(
        extent={{-10.0,0.0},{10.0,20.0}},
        origin={0.0,0.0}),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={70,100})));
  parameter Integer ModelType=0 "0- Constant Power Model, 1- ZIP Model;";

  parameter Types.PerUnit VA=1
    "Voltage magnitude"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle AngA= 0 "Voltage angle for phase A"
    annotation (Dialog(group="Power flow data"));

  parameter Types.ActivePower P_a=1e6
    "Initial active power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ReactivePower Q_a=0
    "Initial reactive power"
    annotation (Dialog(group="Power flow data"));

  parameter Real A_pa=0 "Percentage of Constant Power Load for Phase A [%]"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real B_pa=0 "Percentage of Constant Current Load for Phase A [%]"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real C_pa=0 "Percentage of Constant Impedance Load for Phase A [%]"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
protected
  parameter Real[1, 2] TPhasePower=[P_a, Q_a]/S_p;
  parameter Real[1, 3] ZIP_coef=[A_pa/100, B_pa/100, C_pa/100];
  // Calculating V and V2
  Real Va=sqrt(A.vr^2 + A.vi^2);
  Real Va2=Va^2;
  // Calculating the Coefficients for Adjusting the Power
  Real Coef_A=ZIP_coef[1, 1] + ZIP_coef[1, 2]*Va + ZIP_coef[1, 3]*Va2;

  function Coefficients
    input Real in_coef;
    input Integer ModelType;
    output Real Coef;
  algorithm
    if ModelType == 0 then
      Coef := 1;
    elseif ModelType == 1 then
      Coef := in_coef;
    end if;
  end Coefficients;

  Real Coef=Coefficients(Coef_A, ModelType);

  // Calculating new value for Active and Reactive Power
  Real Pa=TPhasePower[1, 1]*Coef;
  Real Qa=TPhasePower[1, 2]*Coef;
  // Initializing voltages
  parameter Real var0=VA*cos(AngA) "Initialization";
  parameter Real vai0=VA*sin(AngA) "Initialization";
  parameter Real iar0=(TPhasePower[1, 1]*var0 + TPhasePower[1, 2]*vai0)/(var0^2
       + vai0^2) "Initialization";
  parameter Real iai0=(TPhasePower[1, 1]*vai0 - TPhasePower[1, 2]*var0)/(var0^2
       + vai0^2) "Initialization";
equation
  Pa = A.vr*A.ir + A.vi*A.ii;
  Qa = A.vi*A.ir - A.vr*A.ii;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false),
        graphics={Line(points={{-100,100},{100,100},{0,-100},{-100,100}}, color=
           {28,108,200}),Text(
          textColor={28,108,200},
          extent={{-62,90},{66,45}},
          textString="Grounded-Wye Load"),Text(
          origin={18,4},
          textColor={28,108,200},
          extent={{-62,45},{28,26}},
          textString="PQ/ZIP Load")}),
          Documentation(info="<html>
<p>This is a single-phase load model.</p>
<p>The user needs to input the active (<strong><em>P_a</em></strong>) and reactive (<strong><em>Q_a</em></strong>) powers consumed by the phase.
Since the values come from independent parameters, the model allows the representation of unbalanced loads.</p>
<p>In addition, the model allows the load to be represented as constant power, or as a ZIP model.
In the first approach, the load consumes the same value of active and reactive powers throughout the simulation.
The latter approach allows the load to be represented as a sum of three terms: constant impedance, constant current and constant power. This means that, depending on voltage levels supplied, the load will consume different values of power.</p>
</html>"));
end WyeLoad_1Ph;
