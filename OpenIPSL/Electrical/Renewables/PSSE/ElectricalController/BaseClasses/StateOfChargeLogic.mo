within OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses;
model StateOfChargeLogic "State of charge logic for REECC"
  Modelica.Blocks.Interfaces.RealInput SOC "State of Charge of the Battery"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput ipmax_SOC "Maximum Battery Charge"
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
  Modelica.Blocks.Interfaces.RealOutput ipmin_SOC "Minimum Battery Charge"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
        parameter OpenIPSL.Types.PerUnit SOCmin "Minimum allowable state of charge";
        parameter OpenIPSL.Types.PerUnit SOCmax "Maximum allowable state of charge";
equation
  ipmax_SOC = if SOC <= SOCmin then 0 else 1;
  ipmin_SOC = if SOC >= SOCmax then 0 else 1;

  annotation (Icon(graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.None),
        Text(
          extent={{-50,156},{48,74}},
          textColor={28,108,200},
          textString="SOC Logic"),
        Text(
          extent={{-90,12},{-60,-14}},
          textColor={28,108,200},
          textString="SOC"),
        Text(
          extent={{14,90},{94,10}},
          textColor={28,108,200},
          textString="IPMIN SOC"),
        Text(
          extent={{14,-10},{94,-90}},
          textColor={28,108,200},
          textString="IPMAX SOC")}),
    Documentation(info="<html>
The pseudo-code for the state of charge current limit in batteries is as follows:
<pre>
<code>
If SOC greater of equal to SOCmax:
   Ipmin = 0;
else:
   Ipmax = 0;
end
</code>
</pre>
<p>The modelling of the state of charge for the REECC electrical controller is based on the following references:</p>
<ul>
<li>Siemens: \"PSS&reg;E Model Library\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a>,</li>
<li>WECC: \"Battery Storage Dynamic Modeling Guideline\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[WECCBattery]</a>.</li>
</ul>
</html>"));
end StateOfChargeLogic;
