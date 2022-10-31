within OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses;
model CLL_REECB "Current Limit Logic for REECB"

  parameter OpenIPSL.Types.PerUnit start_ii;
  parameter OpenIPSL.Types.PerUnit start_ir;
  parameter OpenIPSL.Types.PerUnit Imax;

  Modelica.Blocks.Interfaces.RealInput Iqcmd(start = -start_ii) annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={70,120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,50})));
  Modelica.Blocks.Interfaces.RealInput Ipcmd(start = start_ir) annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={70,-120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={120,-50})));
  Modelica.Blocks.Interfaces.RealOutput Iqmin annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,110})));
  Modelica.Blocks.Interfaces.RealOutput Iqmax annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,110})));
  Modelica.Blocks.Interfaces.RealOutput Ipmin annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,-110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,-110})));
  Modelica.Blocks.Interfaces.RealOutput Ipmax annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,-110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,-110})));
  Modelica.Blocks.Interfaces.BooleanInput Pqflag "Priority to reactive current (false) or active current (true)." annotation (Placement(transformation(extent={{-140,
            -20},{-100,20}})));

equation

  Ipmax = if Pqflag == true then Imax else sqrt(Imax^2 - Iqcmd^2);
  Ipmin = 0;
  Iqmax = if Pqflag == true then sqrt(Imax^2 - Ipcmd^2) else Imax;
  Iqmin = -Iqmax;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200}),        Text(
          extent={{-60,40},{60,-40}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="CLL REECB"),        Text(
          extent={{-80,106},{-40,66}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IQMIN"),            Text(
          extent={{40,106},{80,66}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IQMAX"),            Text(
          extent={{-78,-68},{-38,-108}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IPMIN"),            Text(
          extent={{40,-68},{80,-108}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IPMAX"),            Text(
          extent={{52,70},{92,30}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IQCMD"),            Text(
          extent={{50,-30},{90,-70}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="IPCMD")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end CLL_REECB;
