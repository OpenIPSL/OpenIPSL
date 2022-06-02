within OpenIPSL.Electrical.Controls.PSAT.OEL;
model OEL "PSATs Over-Excitation Limiter"
  outer OpenIPSL.Electrical.SystemBase SysData;
  Modelica.Blocks.Interfaces.RealInput v "Generator terminal voltage [pu]"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput p "Active power [pu]" annotation (
      Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput q "Reactive power [pu]" annotation (
      Placement(transformation(extent={{-140,-80},{-100,-40}})));
  FieldCurrent field_current(xd=Z_MBtoSB*xd, xq=Z_MBtoSB*xq)
    annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
  Modelica.Blocks.Interfaces.RealOutput v_ref annotation (Placement(
        transformation(extent={{100,-10},{120,10}})));
  parameter Types.Time T0=10 "Integrator time constant";
  parameter Types.PerUnit xd "d-axis estimated generator reactance (machine base)";
  parameter Types.PerUnit xq "q-axis estimated generator reactance (machine base)";
  parameter Types.PerUnit if_lim "Maximum field current (system base)";
  parameter Types.PerUnit vOEL_max "Maximum output signal (machine base)";
  parameter Types.ApparentPower Sn=SysData.S_b "Power rating" annotation (Dialog(group="Machine parameters"));
  parameter Types.Voltage Vn=V_b "Voltage rating"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.Voltage V_b=400e3 "Base voltage of the bus";

  Modelica.Blocks.Math.Feedback add
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
  Modelica.Blocks.Sources.Constant currentLimit(k=if_lim) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-60})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator(
    k=1/T0,
    outMax=vOEL_max,
    outMin=0,
    strict=true)
    annotation (Placement(transformation(extent={{22,-30},{42,-10}})));
  Modelica.Blocks.Interfaces.RealInput v_ref0 "Generator terminal voltage [pu]"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,120}), iconTransformation(
        extent={{-12,-12},{12,12}},
        rotation=-90,
        origin={0,112})));
  Modelica.Blocks.Math.Feedback difference annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={80,0})));
protected
  parameter Real Z_MBtoSB=(SysData.S_b*Vn^2)/(Sn*V_b^2)
    "Z(machine base) -> Z(system base)";
  parameter Real I_MBtoSB=(Sn*V_b)/(SysData.S_b*Vn)
    "I(machine base) -> I(system base)";

equation
  connect(field_current.ifield, add.u1)
    annotation (Line(points={{-19,-20},{-8,-20}}, color={0,0,127}));
  connect(currentLimit.y, add.u2) annotation (Line(points={{8.88178e-016,-49},{
          8.88178e-016,-38},{8.88178e-016,-28},{0,-28}}, color={0,0,127}));
  connect(v_ref, difference.y)
    annotation (Line(points={{110,0},{89,0}}, color={0,0,127}));
  connect(field_current.v, v) annotation (Line(points={{-42,-14},{-60,-14},{-60,60},{-120,60}},
                              color={0,0,127}));
  connect(limIntegrator.y, difference.u2) annotation (Line(points={{43,-20},{80,-20},{80,-8}}, color={0,0,127}));
  connect(difference.u1, v_ref0) annotation (Line(points={{72,0},{40,0},{40,60},{0,60},{0,120}},
                                  color={0,0,127}));
  connect(p, field_current.p) annotation (Line(points={{-120,0},{-80,0},{-80,-20},{-42,-20}},
                                color={0,0,127}));
  connect(q, field_current.q) annotation (Line(points={{-120,-60},{-60,-60},{-60,-26},{-42,-26}},
                               color={0,0,127}));
  connect(add.y, limIntegrator.u)
    annotation (Line(points={{9,-20},{9,-20},{20,-20}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={28,108,200}),
                               Text(
          extent={{-100,80},{-70,50}},
          lineColor={28,108,200},
          textString="v"),Text(
          extent={{-100,20},{-70,-10}},
          lineColor={28,108,200},
          textString="p"),Text(
          extent={{-100,-40},{-70,-70}},
          lineColor={28,108,200},
          textString="q"),Text(
          extent={{-20,100},{20,80}},
          lineColor={28,108,200},
          textString="vref0"),Text(
          extent={{60,-4},{94,-38}},
          lineColor={28,108,200},
          textString="v_ref"),Text(
          extent={{-36,70},{26,-8}},
          lineColor={28,108,200},
          textString="OXL"),
        Text(
          extent={{-72,-40},{70,-80}},
          lineColor={0,0,255},
          textString="%name")}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSAT manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end OEL;
