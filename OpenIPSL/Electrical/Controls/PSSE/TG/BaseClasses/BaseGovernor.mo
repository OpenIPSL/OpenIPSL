within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses;
partial model BaseGovernor "Base turbine governor model"

  Modelica.Blocks.Interfaces.RealInput SPEED annotation (Placement(
        transformation(extent={{-260,-140},{-220,-100}}), iconTransformation(
          extent={{-100,40},{-60,80}})));
  Modelica.Blocks.Interfaces.RealInput PMECH0 annotation (Placement(
        transformation(extent={{-260,60},{-220,100}}), iconTransformation(
          extent={{-100,-80},{-60,-40}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH annotation (Placement(
        transformation(extent = {{240, -10}, {260, 10}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
  annotation (Icon(            graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200}),
        Text(
          extent={{-50,80},{10,40}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="SPEED"),
        Text(
          extent={{-50,-40},{10,-80}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="PMECH0"),
        Text(
          extent={{30,20},{90,-20}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="PMECH")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-240,-240},{240,
            200}})));
end BaseGovernor;
