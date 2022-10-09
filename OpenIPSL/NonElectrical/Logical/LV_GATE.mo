within OpenIPSL.NonElectrical.Logical;
block LV_GATE "Passes through the lower value of the two inputs"
  extends Modelica.Blocks.Math.Min;
  annotation (Icon(graphics={Polygon(
          points={{-100,100},{40,100},{100,0},{40,-100},{-100,-100},{-100,100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-100,40},{60,-40}},
          textColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.None,
          textString="LV
GATE")}));
end LV_GATE;
