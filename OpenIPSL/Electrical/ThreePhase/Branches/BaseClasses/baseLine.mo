within OpenIPSL.Electrical.ThreePhase.Branches.BaseClasses;
partial model baseLine "Partial base power line model"

  outer OpenIPSL.Electrical.SystemBase SysData;
  parameter Types.ApparentPower S=SysData.S_b "Nominal Power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Frequency f=SysData.fn "System Frequency"
    annotation (Dialog(group="Power flow data"));
protected
  parameter Real zero=Modelica.Constants.eps;

  annotation (
    Icon(coordinateSystem(
        extent={{-140,-100},{140,100}},
        preserveAspectRatio=true), graphics={Rectangle(
          extent={{-140,-100},{140,100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(points={{-90,0},{-30,0}}, color={
          0,0,255}),Line(points={{-30,0},{-30,20},{30,20},{30,-20},{-30,-20},{-30,
          0}}, color={0,0,255}),Line(points={{90,0},{30,0}}, color={0,0,255}),
          Line(points={{-60,0},{-60,-20}}, color={0,0,255}),Line(points={{-80,-20},
          {-40,-20},{-40,-55},{-80,-55},{-80,-20}}, color={0,0,255}),Line(
          points={{60,0},{60,-20}}, color={0,0,255}),Line(points={{80,-20},{40,
          -20},{40,-55},{80,-55},{80,-20}}, color={0,0,255}),Line(points={{-60,
          -55},{-60,-70}}, color={0,0,255}),Line(points={{-45,-70},{-75,-70}},
          color={0,0,255}),Line(points={{-50,-72.5},{-70,-72.5}}, color={0,0,
          255}),Line(points={{-55,-75},{-65,-75}}, color={0,0,255}),Line(points=
           {{60,-55},{60,-70}}, color={0,0,255}),Line(points={{45,-70},{75,-70}},
          color={0,0,255}),Line(points={{50,-72.5},{70,-72.5}}, color={0,0,255}),
          Line(points={{55,-75},{65,-75}}, color={0,0,255}),Text(
          lineColor={28,108,200},
          extent={{-29,-18},{20,18}},
          textString="G +jB "),Text(
          lineColor={28,108,200},
          extent={{-15,5},{-5,13}},
          textString="ser"),Text(
          lineColor={28,108,200},
          extent={{19,5},{29,13}},
          textString="ser"),Text(
          lineColor={28,108,200},
          extent={{-75,-28},{-55,-47}},
          textString="jB"),Text(
          lineColor={28,108,200},
          extent={{-56,-25},{-46,-33}},
          textString="sht"),Text(
          lineColor={28,108,200},
          extent={{65,-28},{45,-47}},
          textString="jB"),Text(
          lineColor={28,108,200},
          extent={{64,-25},{74,-33}},
          textString="sht"),Text(
          lineColor={28,108,200},
          extent={{-65,55},{65,85}},
          textString="PI MODEL")}),
    Diagram(coordinateSystem(
        extent={{-140,-100},{140,100}},
        preserveAspectRatio=true)),
    Documentation(info="<html>
<p>This model was design to represent the base data for a power-line modeled in three-phase approach.</p>
</html>"));

end baseLine;
