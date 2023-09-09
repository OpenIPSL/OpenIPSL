within OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.BaseClasses;
model LVACM "Low Voltage Active Control Management"
        parameter OpenIPSL.Types.PerUnit lvpnt0 "Low voltage point for low voltage active current management";
        parameter OpenIPSL.Types.PerUnit lvpnt1 "High voltage point for low voltage active current management";
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput Vt
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));

equation
  y = smooth(1,noEvent(if Vt <= lvpnt0 then 0 elseif Vt >= lvpnt1 then 1 else (1/(lvpnt1-lvpnt0))*(Vt-lvpnt0)));
    annotation (Icon(graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0}),
        Text(
          extent={{-80,40},{80,-40}},
          lineColor={28,108,200},
          textStyle={TextStyle.Bold},
          textString="%name"),
        Line(points={{-32,66}}, color={28,108,200})}),
    Documentation(info="<html>
<p>
In the inverter inteface model block diagram there are two blocks labeled, \"high-voltage reactive current management\" and \"low-voltage power logic\".
These blocks represent logic associated with the dynamic model and the limit in active power injection into the system.
</p>
<p>The modelling of such devices is based, mainly, on the following reference:</p>
<ul>
<li><p>Siemens: \"PSS&reg;E Model Library\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a>.</p>
</li>
</ul>
</html>"));
end LVACM;
