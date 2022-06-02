within OpenIPSL.Electrical.ThreePhase.Loads;
model Dyn_wye_3Ph_balanced "Variable balanced three-phase wye load"
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
        origin={159,100})));
  OpenIPSL.Interfaces.PwPin B annotation (Placement(
      transformation(
        extent={{-56.0,-10.0},{-36.0,10.0}},
        origin={46,70}),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={70,100})));
  OpenIPSL.Interfaces.PwPin C annotation (Placement(
      transformation(
        extent={{-56.0,-10.0},{-36.0,10.0}},
        origin={96,70}),
      iconTransformation(
        extent={{-80.0,0.0},{-60.0,20.0}},
        origin={-19,100})));
  parameter Types.ActivePower P0 "Initial Active power"
    annotation (Dialog(group="Power flow"));
  parameter Types.ReactivePower Q0 "Initial Reactive power"
    annotation (Dialog(group="Power flow"));

protected
  Types.ActivePower P_a(start = P0 / 3)
    "Initial active power";
  Types.ReactivePower Q_a(start = Q0 / 3)
    "Initial reactive power";
  Types.ActivePower P_b(start = P0 / 3)
    "Initial active power";
  Types.ReactivePower Q_b(start = Q0 / 3)
    "Initial reactive power";
  Types.ActivePower P_c(start = P0 / 3)
    "Initial active power";
  Types.ReactivePower Q_c(start = Q0 / 3)
    "Initial reactive power";

equation
  P_a = P_in * S_p / 3;
  P_b = P_in * S_p / 3;
  P_c = P_in * S_p / 3;
  Q_a = Q_in * S_p / 3;
  Q_b = Q_in * S_p / 3;
  Q_c = Q_in * S_p / 3;

  P_a = (A.vr*A.ir + A.vi*A.ii)*S_p;
  Q_a = (A.vi*A.ir - A.vr*A.ii)*S_p;
  P_b = (B.vr*B.ir + B.vi*B.ii)*S_p;
  Q_b = (B.vi*B.ir - B.vr*B.ii)*S_p;
  P_c = (C.vr*C.ir + C.vi*C.ii)*S_p;
  Q_c = (C.vi*C.ir - C.vr*C.ii)*S_p;

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false),
        graphics={Line(points={{-100,100},{100,100},{0,-100},{-100,100}}, color=
           {28,108,200}),Text(
          lineColor={28,108,200},
          extent={{-62,90},{66,45}},
          textString="Grounded-Wye Dynamic Load"),Text(
          origin={20,6},
          lineColor={28,108,200},
          extent={{-62,45},{22,30}},
          textString="PQ Load")}),
    Documentation(info="<html>
<p>This is a three-phase wye load model that allows the user to vary the power consumed during the simulation.</p>
<p>The user needs to input the entire active (<strong><em>P0</em></strong>) and reactive (<strong><em>Q0</em></strong>) powers consumed by the load.
Since the model represents a balanced load, the active and reactive powers consumed by each phase are <strong><em>P0/3</em></strong> and <strong><em>Q0/3</em></strong>.
The model allows the load to be represented as constant power only.</p>
<p>In addition to that, the real inputs <strong><em>P_in</em></strong> and <strong><em>Q_in</em></strong> multiply the values of active and reactive power, respectively, being consumed by the load.
This allows the load to vary its consumed power over time during the simulation. Note that, since active and reactive powers can vary independently, the load's power factor can also vary.
In addition, note that by changing <strong><em>P0</em></strong> and <strong><em>Q0</em></strong>, the values of power consumed by the three phases vary identically.
This makes the load to be characterized as balanced.</p>
</html>"));
end Dyn_wye_3Ph_balanced;
