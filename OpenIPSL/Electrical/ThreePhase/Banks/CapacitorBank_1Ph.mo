within OpenIPSL.Electrical.ThreePhase.Banks;
model CapacitorBank_1Ph "Single-phase capacitor bank"
  extends ThreePhaseComponent;

  OpenIPSL.Interfaces.PwPin A(vr(start=var0), vi(start=vai0)) annotation (
      Placement(
      transformation(
        extent={{-10.0,0.0},{10.0,20.0}},
        origin={0.0,0.0}),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={70,100})));
  parameter Types.PerUnit VA=1
    "Voltage magnitude"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle AngA = 0 "Voltage angle for phase A"
    annotation (Dialog(group="Power flow data"));

  parameter Types.ReactivePower Q_a=0
    "Initial reactive power"
    annotation (Dialog(group="Power flow data"));
protected
  Real Pa=0;
  Real Qa=Q_a/S_p;

  // Initializing voltages for each pin
  parameter Real var0=VA*cos(AngA) "Initialization";
  parameter Real vai0=VA*sin(AngA) "Initialization";
equation
  Pa = (A.vr*A.ir + A.vi*A.ii);
  Qa = (-A.vi*A.ir + A.vr*A.ii)/((A.vr)^2 + (A.vi)^2);
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
<p>This model represents a single-phase capacitor bank.</p>
<p>This device is used to supply reactive power to the system, increasing the voltage in the bus it is connected to.</p>
<p>The reactive power supplied by the capacitor bank is constant and it is defined by parameter Q_a.</p>
</html>"));
end CapacitorBank_1Ph;
