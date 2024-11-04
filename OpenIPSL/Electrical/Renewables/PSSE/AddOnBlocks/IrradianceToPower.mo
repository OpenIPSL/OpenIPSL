within OpenIPSL.Electrical.Renewables.PSSE.AddOnBlocks;
model IrradianceToPower "PV Array Power Output from Irradiance."

  parameter Modelica.Units.SI.ApparentPower M_b = 100000000 "Equipment apparent power";
  parameter Modelica.Units.SI.ActivePower Ypv = 1000 "Rated capacity of the PV array";
  parameter Modelica.Units.SI.Temperature Tcstc = 25 "PV cell temperature under standard test conditions";
  parameter Real fpv = 0.9 "PV derating factor";
  parameter Real ap = -0.48 "Temperature coefficient of power";
  parameter Modelica.Units.SI.RadiantEnergyFluenceRate Gtstc = 1000 "Radiant energy fluence rate of PV array";

  Modelica.Blocks.Interfaces.RealOutput Ppv
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Sources.CombiTimeTable SolarRadiation(table=
        SolarRadiationTable)
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  Modelica.Blocks.Sources.CombiTimeTable SolarArrayTemperature(table=
        SolarArrayTemperatureTable)
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));

  parameter Real SolarRadiationTable[:,:]=fill(0.0, 0, 2)
    "Table matrix (time = first column; e.g., table=[0, 0; 1, 1; 2, 4])";
  parameter Real SolarArrayTemperatureTable[:,:]=fill(0.0, 0, 2)
    "Table matrix (time = first column; e.g., table=[0, 0; 1, 1; 2, 4])";
equation

  Ppv = (Ypv/M_b)*fpv*(SolarRadiation.y[1]/Gtstc)*(1 + ap*(SolarArrayTemperature.y[1] - Tcstc));

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
          extent={{-100,100},{100,-100}},
          textColor={0,0,255},
          textString="Irradiance
to
Power")}));
end IrradianceToPower;
