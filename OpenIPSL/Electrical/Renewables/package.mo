within OpenIPSL.Electrical;
package Renewables "Models that can be used to represent wind, solar, and battery storage energy sources"

annotation (Documentation(info="<html>
<p>This package contains models that can be used to create renewable energy sources, such as Photovoltaic, Wind, and Battery Energy Storage Systems.
 The models implemented are found in standard power system dynamic tools, such as Siemens PTI PSS&reg;E, PowerWorld, General Electric PSLF,
 and are based on the Western Electricity Coordinating Council (WECC) renewable energy guidelines. It is worth mentioning that the components implemented
in this package are based on the second generation renewable energy models.</p>
<p>The package contains a subpackage called PSS&reg;E, from where four different subpackages contains the components for different parts of the renewable sources.</p>
<p>The modelling of such devices is based, mainly, on the following references:</p>
<ul>
<li>Siemens: \"PSS&reg;E Model Library\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a>,</li>
<li>WECC: \"Battery Storage Dynamic Modeling Guideline\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[WECCBattery]</a>,</li>
<li>WECC: \"Solar Photovoltaic Power Plant Modeling and Validation Guideline\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[WECCPhotovoltaic]</a>,</li>
<li>WECC: \"Wind Power Plant Dynamic Modeling Guideline\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[WECCWind]</a>.</li>
</ul>
</html>"));
end Renewables;
