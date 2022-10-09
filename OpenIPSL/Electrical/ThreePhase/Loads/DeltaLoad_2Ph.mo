within OpenIPSL.Electrical.ThreePhase.Loads;
model DeltaLoad_2Ph "Two-phase delta load"
  extends ThreePhaseComponent;
  OpenIPSL.Interfaces.PwPin A(
    vr(start=var0),
    vi(start=vai0),
    ir(start=iar0),
    ii(start=iai0)) annotation (Placement(
      transformation(
        extent={{35.0,0.0},{55.0,20.0}},
        origin={0.0,0.0}),
      iconTransformation(
        extent={{35.0,120.0},{55.0,100.0}},
        origin={0.0,0.0})));
  OpenIPSL.Interfaces.PwPin B(
    vr(start=vbr0),
    vi(start=vbi0),
    ir(start=ibr0),
    ii(start=ibi0)) annotation (Placement(
      transformation(
        extent={{-35.0,0.0},{-55.0,20.0}},
        origin={0.0,0.0}),
      iconTransformation(
        extent={{-35.0,120.0},{-55.0,100.0}},
        origin={0.0,0.0})));
  parameter Integer ModelType=0 "0- Constant Power Model, 1- ZIP Model;"
    annotation (choices(choice=0 "Constant Power", choice=1 "ZIP Model"),
      Dialog(group="Power flow"));

  parameter Types.PerUnit VA=1 "Voltage magnitude for phase A"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle AngA= 0 "Voltage angle for phase A"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit VB=1 "Voltage magnitude for phase B"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle AngB = -2*C.pi/3 "Voltage angle for phase B"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ActivePower P_ab=1e6
    "Initial active power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ReactivePower Q_ab=0
    "Initial reactive power"
    annotation (Dialog(group="Power flow data"));

  parameter Real A_ab=0 "Percentage of Constant Power Load for Line AB [%]"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real B_ab=0 "Percentage of Constant Current Load for Line AB [%]"
    annotation (Dialog(group="Load Parameters for ZIP Model"));
  parameter Real C_ab=0 "Percentage of Constant Impedance Load for Line AB [%]"
    annotation (Dialog(group="Load Parameters for ZIP Model"));

protected
  parameter Real[1, 2] TPhasePower=[P_ab, Q_ab]/S_p;
  parameter Real[1, 3] ZIP_coef=[A_ab/100, B_ab/100, C_ab/100];

  // Calculating the Line Voltage in p.u.
  Real Vabr=(A.vr - B.vr)/sqrt(3);
  Real Vabi=(A.vi - B.vi)/sqrt(3);

  // Calculating the Magnitude of V and V squared
  Real Vab=sqrt(Vabr^2 + Vabi^2);
  Real Vab2=Vab^2;

  // Calculating the Coefficients for Adjusting the Power
  Real Coef_A=ZIP_coef[1, 1] + ZIP_coef[1, 2]*Vab + ZIP_coef[1, 3]*Vab2;

  Real in_coef=Coef_A;

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

  Real Coef=Coefficients(in_coef, ModelType);

  // Calculating new value for Active and Reactive Power
  Real Pab=TPhasePower[1, 1]*Coef;
  Real Qab=TPhasePower[1, 2]*Coef;

  // Initializing voltages for each pin
  parameter Real var0=VA*cos(AngA) "Initialization";
  parameter Real vai0=VA*sin(AngA) "Initialization";
  parameter Real vbr0=VB*cos(AngB) "Initialization";
  parameter Real vbi0=VB*sin(AngB) "Initialization";
  parameter Real iar0=(TPhasePower[1, 1]*(var0 - vbr0) + TPhasePower[1, 2]*(
      vai0 - vbi0))/((var0 - vbr0)^2 + (vai0 - vbi0)^2) "Initialization";
  parameter Real iai0=(TPhasePower[1, 1]*(vai0 - vbi0) - TPhasePower[1, 2]*(
      var0 - vbr0))/((var0 - vbr0)^2 + (vai0 - vbi0)^2) "Initialization";
  parameter Real ibr0=-iar0 "Initialization";
  parameter Real ibi0=-iai0 "Initialization";
equation
  A.ir = (Pab*(A.vr - B.vr) + Qab*(A.vi - B.vi))/((A.vr - B.vr)^2 + (A.vi - B.vi)
    ^2);
  A.ii = (Pab*(A.vi - B.vi) - Qab*(A.vr - B.vr))/((A.vr - B.vr)^2 + (A.vi - B.vi)
    ^2);
  B.ir = -(Pab*(A.vr - B.vr) + Qab*(A.vi - B.vi))/((A.vr - B.vr)^2 + (A.vi - B.vi)
    ^2);
  B.ii = -(Pab*(A.vi - B.vi) - Qab*(A.vr - B.vr))/((A.vr - B.vr)^2 + (A.vi - B.vi)
    ^2);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false),
        graphics={Line(points={{-100,100},{100,100},{0,-100},{-100,100}}, color=
           {28,108,200}),Text(
          origin={-24,20},
          textColor={28,108,200},
          extent={{-18,72},{66,45}},
          textString="Delta Load"),Text(
          origin={18,4},
          textColor={28,108,200},
          extent={{-62,45},{28,26}},
          textString="PQ/ZIP Load")}),
          Documentation(info="<html>
<p>This is a two-phase delta load model. The model allows the user to represent active and reactive power being consumed between two phases.</p>
<p>The user needs to input the active (<strong><em>P_ab</em></strong>) and reactive (<strong><em>Q_ab</em></strong>) powera consumed between phases one and two (A and B).</p>
<p>In addition, the model allows the load to be represented as constant power, or as a ZIP model.
In the first approach, the power consumed between the two phases is kept constant throughout simulation.
The latter approach allows the load to be represented as a sum of three terms: constant impedance, constant current and constant power.
This means that, depending on voltage levels supplied, the load will consume a different power value.</p>
</html>"));
end DeltaLoad_2Ph;
