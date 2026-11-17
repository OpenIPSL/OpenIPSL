within OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses;
model CurrentLimitLogicREECA "Current limit logic for REECA"

  parameter OpenIPSL.Types.PerUnit start_ii "Starting current value from Iqcmd (comes from power flow simulation)";
  parameter OpenIPSL.Types.PerUnit start_ir "Starting current value from Ipcmd (comes from power flow simulation)";
  parameter OpenIPSL.Types.PerUnit Imax "Maximum limit on total converter current";

  OpenIPSL.Types.PerUnit Ipre "Square of the current left by the priority axis: Imax^2 - Iqcmd^2 (Q priority) or Imax^2 - Ipcmd^2 (P priority)";
  OpenIPSL.Types.PerUnit Ipost "Current left for the other axis, sqrt(Ipre), zero when Ipre is negative";

  Modelica.Blocks.Interfaces.RealInput VDL1_out annotation (Placement(
        transformation(
        extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.BooleanInput pqflag annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,0})));
  Modelica.Blocks.Interfaces.RealInput VDL2_out annotation (Placement(
        transformation(
        extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealInput Iqcmd annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,60})));
  Modelica.Blocks.Interfaces.RealInput Ipcmd annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,-60})));
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

    Ipre = if pqflag == false then Imax^2 - Iqcmd^2 else Imax^2 - Ipcmd^2;
    Ipost = noEvent(if Ipre > 0 then sqrt(Ipre) else 0) "Ipre is zero when the priority command is at Imax: noEvent keeps a solver iterate below zero out of sqrt";

    Iqmax = if pqflag == false then min(VDL1_out, Imax) else min(Ipost, VDL1_out);
    Iqmin = -Iqmax;
    Ipmax = if pqflag == false then min(Ipost, VDL2_out) else min(VDL2_out, Imax);
    Ipmin = 0;

  annotation (Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.None), Text(
          extent={{-60,40},{60,-40}},
          textColor={28,108,200},
          textString="CLL REECA"), Text(
          extent={{52,80},{92,40}},
          textColor={28,108,200},
          textString="IQCMD"), Text(
          extent={{52,-40},{92,-80}},
          textColor={28,108,200},
          textString="IPCMD"), Text(
          extent={{-90,80},{-50,40}},
          textColor={28,108,200},
          textString="VDL1"), Text(
          extent={{-90,-40},{-50,-80}},
          textColor={28,108,200},
          textString="VDL2"), Text(
          extent={{42,106},{82,66}},
          textColor={28,108,200},
          textString="IQMIN"), Text(
          extent={{-78,106},{-38,66}},
          textColor={28,108,200},
          textString="IQMAX")}), Documentation(info="<html>
<p>
The current limit logic keeps the current command within the circle |I| = Imax. The priority axis (active current with
<code>Pqflag = true</code>, reactive current with <code>Pqflag = false</code>) is limited to <code>Imax</code>; the other axis
gets the circular limit <code>sqrt(Imax^2 - I^2)</code>, the current left on the circle, where <code>I</code> is the
priority command. Both are further limited by the voltage dependent limits <code>VDL1</code> and <code>VDL2</code>.
</p>
The pseudo-code for the current limit logic in the REECA electrical controller detailed below:
<pre>
<code>
if Pqflag = true:
   Ipre = Imax^2 - Ipcmd^2;
else:
   Ipre = Imax^2 - Iqcmd^2;

if Ipre is less than 0:
   Ipost = 0;
else:
   Ipost = sqrt(Ipre);

if Pqflag = true:
   Ipmax = min(VDL2_out, Imax);
   Ipmin = 0;
   Iqmax = min(Ipost, VDL1_out);
   Iqmin = -Iqmax;
end

if Pqflag = false:
   Ipmax = min(Ipost, VDL2_out);
   Ipmin = 0;
   Iqmax = min(VDL1_out, Imax);
   Iqmin = -Iqmax;
end
</code>
</pre>
<p>The modelling of the current limit logic for the REECA electrical controller is based on the following references:</p>
<ul>
<li>Siemens: \"PSS&reg;E Model Library\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a>,</li>
<li>WECC: \"Wind Power Plant Dynamic Modeling Guideline\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[WECCWind]</a>.</li>
</ul>
</html>"));
end CurrentLimitLogicREECA;
