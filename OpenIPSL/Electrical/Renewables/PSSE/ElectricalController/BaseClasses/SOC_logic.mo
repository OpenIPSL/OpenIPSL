within OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses;
model SOC_logic "State of charge logic for REECC"
  Modelica.Blocks.Interfaces.RealInput SOC
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput ipmax_SOC
    annotation (Placement(transformation(extent={{100,-60},{120,-40}}),
        iconTransformation(extent={{100,-60},{120,-40}})));
  Modelica.Blocks.Interfaces.RealOutput ipmin_SOC
    annotation (Placement(transformation(extent={{100,40},{120,60}}),
        iconTransformation(extent={{100,40},{120,60}})));
        parameter Real SOCmin;
        parameter Real SOCmax;
equation
  ipmax_SOC = if SOC <= SOCmin then 0 else 1;
  ipmin_SOC = if SOC >= SOCmax then 0 else 1;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
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
          textString="IPMAX SOC")}),                             Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SOC_logic;
