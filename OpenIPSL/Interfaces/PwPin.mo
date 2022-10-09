within OpenIPSL.Interfaces;
connector PwPin
  "Connector for electrical blocks treating voltage and current as complex variables"
  Types.PerUnit vr "Real part of the voltage";
  Types.PerUnit vi "Imaginary part of the voltage";
  flow Types.PerUnit ir(start=Modelica.Constants.eps) "Real part of the current";
  flow Types.PerUnit ii(start=Modelica.Constants.eps) "Imaginary part of the current";
  annotation (
    Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid)}),
    Diagram(graphics={Text(
          extent={{-100,160},{100,120}},
          textColor={0,0,255},
          textString="%name"),Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid)}));
end PwPin;
