within OpenIPSL.Electrical.ThreePhase.Banks;
model CapacitorBank_3Ph "Three-phase capacitor bank"
  extends ThreePhaseComponent;
  import Modelica.Constants.pi;
  OpenIPSL.Interfaces.PwPin A(vr(start=var0), vi(start=vai0)) annotation (
      Placement(
      transformation(
        extent={{80.0,0.0},{100.0,20.0}},
        origin={0.0,0.0}),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={159,100})));
  OpenIPSL.Interfaces.PwPin B(vr(start=vbr0), vi(start=vbi0)) annotation (
      Placement(
      transformation(
        extent={{-10.0,0.0},{10.0,20.0}},
        origin={0.0,0.0}),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={70,100})));
  OpenIPSL.Interfaces.PwPin C(vr(start=vcr0), vi(start=vci0)) annotation (
      Placement(
      transformation(
        extent={{-100.0,0.0},{-80.0,20.0}},
        origin={0.0,0.0}),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={-19,100})));

  parameter Types.PerUnit VA=1
    "Voltage magnitude"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle AngA = 0 "Voltage angle for phase A"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit VB=1 "Voltage magnitude"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle AngB=-2*pi/3 "Voltage angle for phase B"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit VC=1 "Voltage magnitude"
      annotation (Dialog(group="Power flow data"));
  parameter Types.Angle AngC=2*pi/3 "Voltage angle for phase C"
    annotation (Dialog(group="Power flow data"));

  parameter Types.ReactivePower Q_a=0
    "Initial reactive power"
    annotation (Dialog(group="Power flow data"));

  parameter Types.ReactivePower Q_b=0
    "Initial reactive power"
    annotation (Dialog(group="Power flow data"));

  parameter Types.ReactivePower Q_c=0
    "Initial reactive power"
    annotation (Dialog(group="Power flow data"));

protected
  Real Pa=0;
  Real Pb=0;
  Real Pc=0;
  Real Qa=Q_a/S_p;
  Real Qb=Q_b/S_p;
  Real Qc=Q_c/S_p;

  // Initializing voltages for each pin
  parameter Real var0=VA*cos(AngA) "Initialization";
  parameter Real vai0=VA*sin(AngA) "Initialization";
  parameter Real vbr0=VB*cos(AngB) "Initialization";
  parameter Real vbi0=VB*sin(AngB) "Initialization";
  parameter Real vcr0=VC*cos(AngC) "Initialization";
  parameter Real vci0=VC*sin(AngC) "Initialization";
equation
  Pa = (A.vr*A.ir + A.vi*A.ii);
  Pb = (B.vr*B.ir + B.vi*B.ii);
  Pc = (C.vr*C.ir + C.vi*C.ii);
  Qa = (-A.vi*A.ir + A.vr*A.ii)/((A.vr)^2 + (A.vi)^2);
  Qb = (-B.vi*B.ir + B.vr*B.ii)/((B.vr)^2 + (B.vi)^2);
  Qc = (-C.vi*C.ir + C.vr*C.ii)/((C.vr)^2 + (C.vi)^2);

  annotation (Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=true), graphics={Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{0,70},{0,54}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-40,42},{40,42}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-40,54},{40,54}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{0,42},{0,14}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-40,2},{40,2}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-40,14},{40,14}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{0,2},{0,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-38,-22},{38,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-28,-30},{-20,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-20,-30},{-12,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-12,-30},{-4,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-4,-30},{4,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{4,-30},{12,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{12,-30},{20,-22}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{20,-30},{28,-22}},
          color={0,0,255},
          smooth=Smooth.None)}),
          Documentation(info="<html>
<p>This model represents a three-phase capacitor bank.</p>
<p>This device is used to supply reactive power to the system, increasing the voltage in the three-phase bus the bank is connected to.</p>
<p>The reactive power supplied by the capacitor bank is constant and it is defined by parameters Q_a, Q_b and Q_c, which correspond to the reactive power supplied in phases A, B and C, respectively.</p>
</html>"));
end CapacitorBank_3Ph;
