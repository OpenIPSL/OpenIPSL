within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.BasicComponentsAndCntrlSchemes;
model QVdrp "Q-V droop congroller"
  import Modelica;
  Modelica.Blocks.Interfaces.RealInput Qref "Reactive power reference"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput Qfilt
    "Filtered reactive power measurement"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Blocks.Math.Gain mqGain(k=k) "Q-v droop gain"
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  parameter Real k=0.05 "Gain value multiplied with input signal";
  Modelica.Blocks.Interfaces.RealInput Vref "Voltage mangitude reference"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput Qlim "Reactive power limiter input"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
  Modelica.Blocks.Math.Add3 sum_Vref_Qlim_DeltaQmq
    "Vref - Delta Q * mq + Qlim summing junction"
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Interfaces.RealOutput Vout_qv_droop
    "Voltage signal output of Q-v droop"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(Qref, feedback.u1)
    annotation (Line(points={{-120,0},{-68,0}}, color={0,0,127}));
  connect(Qfilt, feedback.u2) annotation (Line(points={{-120,-60},{-60,-60},
          {-60,-8}}, color={0,0,127}));
  connect(feedback.y, mqGain.u)
    annotation (Line(points={{-51,0},{-42,0}}, color={0,0,127}));
  connect(Qlim, sum_Vref_Qlim_DeltaQmq.u3) annotation (Line(points={{0,-120},
          {0,-20},{-16,-20},{-16,-8},{-2,-8}}, color={0,0,127}));
  connect(mqGain.y, sum_Vref_Qlim_DeltaQmq.u2)
    annotation (Line(points={{-19,0},{-2,0}}, color={0,0,127}));
  connect(Vref, sum_Vref_Qlim_DeltaQmq.u1) annotation (Line(points={{-120,
          60},{-12,60},{-12,8},{-2,8}}, color={0,0,127}));
  connect(sum_Vref_Qlim_DeltaQmq.y, Vout_qv_droop)
    annotation (Line(points={{21,0},{110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=0.5), Text(
          extent={{-82,42},{80,-40}},
          textColor={28,108,200},
          textString="Q-v Drp")}), Diagram(coordinateSystem(
          preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
This model implements the vbasic droop function of the Q-v control scheme.
</p>

<p>
The gain block \"mqGain\" has a parameter <code>k</code>, set to a default value. This parameter is propagated so that it can be modified by the Q-v control scheme base model.
</p>

</html>"));
end QVdrp;
