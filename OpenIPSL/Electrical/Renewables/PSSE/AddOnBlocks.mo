within OpenIPSL.Electrical.Renewables.PSSE;
package AddOnBlocks
  "This package contains additional add ons that can be added to the original renewable models."
  model IrradianceToPower "PV Array Power Output from Irradiance."

    parameter Modelica.Units.SI.ActivePower Ypv = 1000 "Rated capacity of the PV array";
    parameter Modelica.Units.SI.Temperature Tcstc = 25 "PV cell temperature under standard test conditions";
    parameter Real fpv = 0.9 "PV derating factor";
    parameter Real ap = -0.48 "Temperature coefficient of power";
    parameter Modelica.Units.SI.RadiantEnergyFluenceRate Gtstc = 1000;




    Modelica.Blocks.Interfaces.RealOutput Ppv
      annotation (Placement(transformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Sources.CombiTimeTable SolarRadiation
      annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
    Modelica.Blocks.Sources.CombiTimeTable SolarArrayTemperature
      annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));




  equation

    Ppv = Ypv*fpv*(SolarRadiation.y[1]/Gtstc)*(1 + ap*(SolarArrayTemperature.y[1] - Tcstc));

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
          Polygon(
            points={{-100,-60},{-60,-100},{-100,-100},{-100,-60}},
            lineColor={0,0,0},
            fillColor={255,170,85},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-100,-20},{-20,-100},{-60,-100},{-100,-60},{-100,-20}},
            lineColor={0,0,0},
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-100,20},{20,-100},{-20,-100},{-100,-20},{-100,20}},
            lineColor={0,0,0},
            fillColor={255,170,85},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-100,60},{60,-100},{20,-100},{-100,20},{-100,60}},
            lineColor={0,0,0},
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-100,100},{100,-100},{60,-100},{-100,60},{-100,100}},
            lineColor={0,0,0},
            fillColor={255,170,85},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-100,100},{100,-100},{100,-60},{-60,100},{-100,100}},
            lineColor={0,0,0},
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-20,100},{100,-20},{100,-60},{-60,100},{-20,100}},
            lineColor={0,0,0},
            fillColor={255,170,85},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-20,100},{100,-20},{100,20},{20,100},{-20,100}},
            lineColor={0,0,0},
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{60,100},{100,60},{100,20},{20,100},{60,100}},
            lineColor={0,0,0},
            fillColor={255,170,85},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{60,100},{100,60},{100,60},{100,100},{60,100}},
            lineColor={0,0,0},
            fillColor={255,255,170},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-80,80},{80,-80}},
            textColor={0,0,255},
            textString="Irradiance
to
Power")}),   Diagram(coordinateSystem(preserveAspectRatio=false)));
  end IrradianceToPower;
end AddOnBlocks;
