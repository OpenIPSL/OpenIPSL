within OpenIPSL.Electrical.Controls.PSAT.OEL;
model FieldCurrent
  "Estimates the field current from P,Q,V and the d- and q-axis reactances"

  Modelica.Blocks.Interfaces.RealInput v "generator terminal voltage [pu]"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput p "active power [pu]" annotation (
      Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput q "reactive power [pu]" annotation (
      Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput ifield "estimated field current [pu]"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  parameter Types.PerUnit xd;
  parameter Types.PerUnit xq;
protected
  Real gamma_p;
  Real gamma_q;
equation
  gamma_p = xq*p/v;
  gamma_q = xq*q/v;
  ifield = sqrt((v + gamma_q)^2 + p^2) + ((xd/xq - 1)*(gamma_q*(v + gamma_q) +
    gamma_p^2)/sqrt((v + gamma_q)^2 + p^2));

  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={28,108,200}),
                               Text(
          extent={{-90,80},{-58,60}},
          textColor={28,108,200},
          textString="v"),Text(
          extent={{-90,-44},{-62,-60}},
          textColor={28,108,200},
          textString="p"),Text(
          extent={{-88,16},{-60,0}},
          textColor={28,108,200},
          textString="q"),Text(
          extent={{64,16},{92,0}},
          textColor={28,108,200},
          textString="if")}));
end FieldCurrent;
