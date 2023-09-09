within OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses;
model CurrentLimitLogicREECB "Current Limit Logic for REECB"

  parameter OpenIPSL.Types.PerUnit start_ii "Starting current value from Iqcmd (comes from power flow simulation)";
  parameter OpenIPSL.Types.PerUnit start_ir "Starting current value from Ipcmd (comes from power flow simulation)";
  parameter OpenIPSL.Types.PerUnit Imax "Maximum limit on total converter current";

  Modelica.Blocks.Interfaces.RealInput Iqcmd annotation (Placement(transformation(extent={{140,30},{100,70}})));
  Modelica.Blocks.Interfaces.RealInput Ipcmd annotation (Placement(transformation( extent={{140,-70},{100,-30}})));
  Modelica.Blocks.Interfaces.RealOutput Iqmin annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,110})));
  Modelica.Blocks.Interfaces.RealOutput Iqmax annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,110})));
  Modelica.Blocks.Interfaces.RealOutput Ipmin annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,-110})));
  Modelica.Blocks.Interfaces.RealOutput Ipmax annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,-110})));
  Modelica.Blocks.Interfaces.BooleanInput Pqflag "Priority to reactive current (false) or active current (true)." annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));

equation

  Ipmax = if Pqflag == true then Imax else sqrt(Imax^2 - Iqcmd^2);
  Ipmin = 0;
  Iqmax = if Pqflag == true then sqrt(Imax^2 - Ipcmd^2) else Imax;
  Iqmin = -Iqmax;

  annotation (Icon(graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200}), Text(
          extent={{-60,40},{60,-40}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="CLL REECB"), Text(
          extent={{-80,106},{-40,66}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IQMIN"), Text(
          extent={{40,106},{80,66}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IQMAX"), Text(
          extent={{-78,-68},{-38,-108}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IPMIN"), Text(
          extent={{40,-68},{80,-108}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IPMAX"), Text(
          extent={{52,70},{92,30}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IQCMD"), Text(
          extent={{50,-30},{90,-70}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IPCMD")}),
    Documentation(info="<html>
The pseudo-code for the current limit logic in the REECB electrical controller detailed below:
<pre>
<code>
if Pqflag = true:
   Ipmax = Imax;
   Ipmin = 0;
   Iqmax = sqrt(Imax^2 - Ipcmd^2);
   Iqmin = -Iqmax;
end

if Pqflag = false:
   Ipmax = sqrt(Imax^2 - Iqcmd^2);
   Ipmin = 0;
   Iqmax = Imax;
   Iqmin = -Iqmax;
end
</code>
</pre>
<p>The modelling of the current limit logic for the REECB electrical controller is based on the following references:</p>
<ul>
<li>Siemens: \"PSS&reg;E Model Library\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a>,</li>
<li>WECC: \"Solar Photovoltaic Power Plant Modeling and Validation Guideline\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[WECCPhotovoltaic]</a>.</li>
</ul>
</html>"));
end CurrentLimitLogicREECB;
