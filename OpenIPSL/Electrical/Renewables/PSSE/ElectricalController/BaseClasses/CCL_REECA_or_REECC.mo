within OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses;
model CCL_REECA_or_REECC "Current limit logic for REECA and REECC"

  parameter OpenIPSL.Types.PerUnit start_ii;
  parameter OpenIPSL.Types.PerUnit start_ir;
  parameter Real Imax;
  Modelica.Blocks.Interfaces.RealInput VDL1_out annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,60}), iconTransformation(extent={{-140,80},{-100,40}})));
  Modelica.Blocks.Interfaces.BooleanInput pqflag annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,0}), iconTransformation(
        extent={{0,0},{40,40}},
        rotation=180,
        origin={140,20})));
  Modelica.Blocks.Interfaces.RealInput VDL2_out annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,-60}), iconTransformation(extent={{-140,-40},{-100,-80}})));
  Modelica.Blocks.Interfaces.RealInput Iqcmd(start = -start_ii) annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,60}), iconTransformation(
        extent={{-13.3335,-13.3336},{26.6673,26.6664}},
        rotation=180,
        origin={126.667,66.6664})));
  Modelica.Blocks.Interfaces.RealInput Ipcmd(start =  start_ir) annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,-60}), iconTransformation(
        extent={{-3.63659,79.9998},{36.3659,39.9999}},
        rotation=180,
        origin={136.363,-0.0002})));
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
    Ipmin = 0;

  annotation (Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.None),  Text(
          extent={{-60,40},{60,-40}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="CLL REECA(C)"),     Text(
          extent={{52,80},{92,40}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IQCMD"),            Text(
          extent={{52,-40},{92,-80}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IPCMD"),            Text(
          extent={{-90,80},{-50,40}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="VDL1"),             Text(
          extent={{-90,-40},{-50,-80}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="VDL2"),             Text(
          extent={{-68,98},{-28,58}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IQMIN"),            Text(
          extent={{52,98},{92,58}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IQMAX")}));
end CCL_REECA_or_REECC;
