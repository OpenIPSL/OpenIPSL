within OpenIPSL.Electrical.ThreePhase.Loads;
model Dyn_wye_1Ph "Variable single-phase load"
  extends ThreePhaseComponent;
  import Modelica.Blocks.Interfaces.*;
  Modelica.Blocks.Interfaces.RealInput P_in "external P [pu]" annotation (
      Placement(
      transformation(
        origin={-120,20},
        extent={{-20,-20},{20,20}}),
      iconTransformation(
        origin={-60,20},
        extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealInput Q_in "external Q [pu]" annotation (
      Placement(
      transformation(
        origin={-120,-40},
        extent={{-20,-20},{20,20}}),
      iconTransformation(
        origin={-60,-60},
        extent={{-20,-20},{20,20}})));
  OpenIPSL.Interfaces.PwPin A annotation (Placement(
      transformation(
        extent={{-56.0,-10.0},{-36.0,10.0}},
        origin={-4,70}),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={71,100})));
  parameter Types.ActivePower P0 "Initial Active power"
    annotation (Dialog(group="Power flow"));
  parameter Types.ReactivePower Q0 "Initial Reactive power"
    annotation (Dialog(group="Power flow"));

protected
  Types.ActivePower P_a(start = P0)
    "Initial active power";
  Types.ReactivePower Q_a(start = Q0)
    "Initial reactive power";

equation
  P_a = P_in * S_p;
  Q_a = Q_in * S_p;

  P_a = (A.vr*A.ir + A.vi*A.ii)*S_p;
  Q_a = (A.vi*A.ir - A.vr*A.ii)*S_p;

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false),
        graphics={Line(points={{-100,100},{100,100},{0,-100},{-100,100}}, color=
           {28,108,200}),Text(
          textColor={28,108,200},
          extent={{-62,90},{66,45}},
          textString="Grounded-Wye Dynamic Load"),Text(
          origin={20,6},
          textColor={28,108,200},
          extent={{-62,45},{22,30}},
          textString="PQ Load")}),
    Documentation(info="<html>
<p>This is a single-phase load model that allows the user to vary the power consumed during the simulation.</p>
<p>The user needs to input the active (<strong><em>P0</em></strong>) and reactive (<strong><em>Q0</em></strong>) powers consumed by the load.
The model allows the load to be represented as constant power only.</p>
<p>In addition to that, the real inputs <strong><em>P_in</em></strong> and <strong><em>Q_in</em></strong> multiply the values of active and reactive power, respectively, being consumed by the load.
This allows the load to vary its consumed power over time during the simulation.
Note that, since active and reactive powers can vary independently, the load's power factor can also vary.</p>
</html>"));
end Dyn_wye_1Ph;
