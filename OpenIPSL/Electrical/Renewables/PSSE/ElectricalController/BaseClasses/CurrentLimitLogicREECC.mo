within OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses;
model CurrentLimitLogicREECC "Current limit logic for REECC"

  parameter OpenIPSL.Types.PerUnit start_ii "Starting current value from Iqcmd (comes from power flow simulation)";
  parameter OpenIPSL.Types.PerUnit start_ir "Starting current value from Ipcmd (comes from power flow simulation)";
  parameter OpenIPSL.Types.PerUnit Imax "Maximum limit on total converter current";

  Modelica.Blocks.Interfaces.RealInput VDL1_out annotation (Placement(
        transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.BooleanInput pqflag annotation (Placement(
        transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput VDL2_out annotation (Placement(
        transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealInput Iqcmd annotation (Placement(transformation(extent={{140,40},{100,80}})));
  Modelica.Blocks.Interfaces.RealInput Ipcmd annotation (Placement(transformation(extent={{140,-80},{100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput Iqmax annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,110})));
  Modelica.Blocks.Interfaces.RealOutput Iqmin annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,110})));
  Modelica.Blocks.Interfaces.RealOutput Ipmax annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,-110})));
  Modelica.Blocks.Interfaces.RealOutput Ipmin annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,-110})));
equation

    Iqmax = if pqflag == false then min(VDL1_out, Imax) else min(VDL1_out, sqrt(Imax^2 - Ipcmd^2));
    Iqmin = -Iqmax;
    Ipmax = if pqflag == false then min(VDL2_out, sqrt(Imax^2-Iqcmd^2)) else min(VDL2_out, Imax);
    Ipmin = -Ipmax;

  annotation (Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.None), Text(
          extent={{-60,40},{60,-40}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="CLL REECC"), Text(
          extent={{52,80},{92,40}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IQCMD"), Text(
          extent={{52,-40},{92,-80}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IPCMD"), Text(
          extent={{-90,80},{-50,40}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="VDL1"), Text(
          extent={{-90,-40},{-50,-80}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="VDL2"), Text(
          extent={{-68,98},{-28,58}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IQMIN"), Text(
          extent={{52,98},{92,58}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IQMAX")}), Documentation(info="<html>
The pseudo-code for the current limit logic in the REECC electrical controller detailed below:
<pre>
<code>
if Pqflag = true:
   Ipmax = min(VDL2_out, Imax);
   Ipmin = -Ipmax;
   Iqmax = min(VDL1_out, sqrt(Imax^2 Ipcmd^2);
   Iqmin = -Iqmax;
end

if Pqflag = false:
   Ipmax = min(VDL2_out, sqrt(Imax^2 - Iqcmd^2));
   Ipmin = -Ipmax;
   Iqmax = min(VDL1_out, Imax);
   Iqmin = -Iqmax;
end
</code>
</pre>
<p>The modelling of the current limit logic for the REECB electrical controller is based on the following references:</p>
<ul>
<li>Siemens: \"PSS&reg;E Model Library\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a>,</li>
<li>WECC: \"Battery Storage Dynamic Modeling Guideline\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[WECCBattery]</a>.</li>
</ul>
</html>"));
end CurrentLimitLogicREECC;
