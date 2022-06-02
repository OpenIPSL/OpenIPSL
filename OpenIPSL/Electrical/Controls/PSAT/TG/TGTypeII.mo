within OpenIPSL.Electrical.Controls.PSAT.TG;
model TGTypeII "TG Type II"
  Modelica.Blocks.Interfaces.RealInput pm0 "Initial mechanical power [pu]"
    annotation (Placement(
      transformation(
        origin={0,120},
        extent={{-20,-20},{20,20}},
        rotation=-90),
      iconTransformation(
        origin={0.0,120.0},
        extent={{-20.0,-20.0},{20.0,20.0}},
        rotation=-90)));
  Modelica.Blocks.Interfaces.RealOutput pm "Mechanical power [pu]" annotation (
      Placement(
      transformation(
        origin={109.815,0},
        extent={{-10.0,-10.0},{10.0,10.0}}),
      iconTransformation(
        origin={110.0,-0.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Interfaces.RealInput w "Rotor speed [pu]" annotation (
      Placement(
      transformation(
        origin={-120,5e-06},
        extent={{-20,-20},{20,20}}),
      iconTransformation(
        origin={-120.0,-0.0},
        extent={{-20.0,-20.0},{20.0,20.0}})));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(
        origin={-50,6.66134e-16},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction1(a={Ts,1}, b={T3,
        1}) annotation (Placement(transformation(
        origin={10,4.44089e-16},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  parameter Types.PerUnit wref=1 "Reference speed";
  parameter Types.PerUnit R=0.2 "Droop";
  parameter Types.PerUnit pmax0=1 "Maximum turbine output";
  parameter Types.PerUnit pmin0=0 "Minimum turbine output";
  parameter Types.Time Ts=0.1 "Governor Time constant";
  parameter Types.Time T3=-0.1 "Transient gain time constant";
  parameter Types.ApparentPower S_b=100e6 "System base power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ApparentPower Sn=20e6 "Nominal power";
  Modelica.Blocks.Math.Gain gain1(k=1/Ro) annotation (Placement(transformation(
        origin={-20,6.66134e-16},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Sources.Constant const(k=wref) annotation (Placement(transformation(
        origin={-90,20},
        extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Add add2 annotation (Placement(transformation(
        origin={50,0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=pmax, uMin=pmin) annotation (
      Placement(transformation(
        origin={80,-5.55112e-16},
        extent={{-10.0,-10.0},{10.0,10.0}})));
protected
  parameter Real Ro=R*S_b/Sn;
  parameter Real pmax=pmax0*Sn/S_b;
  parameter Real pmin=pmin0*Sn/S_b;
equation

  connect(add2.u1, pm0) annotation (Line(points={{38,6},{32,6},{32,50},{0,50},{0,120}}, color={0,0,127}));
  connect(add1.u1, const.y) annotation (Line(points={{-62,6},{-68,6},{-68,20},{-79,20}}, color={0,0,127}));
  connect(w, add1.u2) annotation (Line(points={{-120,0},{-80,0},{-80,-6},{-62,-6}}, color={0,0,127}));
  connect(add2.u2, transferFunction1.y) annotation (Line(points={{38,-6},{30,-6},{30,0},{21,0}}, color={0,0,127}));
  connect(gain1.y, transferFunction1.u) annotation (Line(points={{-9,0},{-2,0}}, color={0,0,127}));
  connect(add1.y, gain1.u) annotation (Line(points={{-39,0},{-32,0}}, color={0,0,127}));
  connect(add2.y, limiter1.u) annotation (Line(points={{61,0},{68,0}}, color={0,0,127}));
  connect(limiter1.y, pm) annotation (Line(points={{91,0},{109.815,0}}, color={0,0,127}));
  annotation (
    Icon( graphics={Rectangle(lineColor={0,0,0}, extent={{-100,-100},{100,100}}),
                                                  Text(
          origin={0,-40},
          extent={{-60,40},{60,-40}},
          fontName="Arial",
          lineColor={0,0,255},
          textString="TGTypeII"),
                            Text(
          origin={0,80},
          fillPattern=FillPattern.Solid,
          extent={{-20,10},{20,-10}},
          textString="pm0"),Text(
          origin={-80,0},
          extent={{-20,10},{20,-10}},
          lineColor={0,0,0},
          textString="w"), Text(
          origin={80,0},
          extent={{-20,10},{20,-10}},
          lineColor={0,0,0},
          textString="pm"),
        Text(
          extent={{-80,80},{80,20}},
          lineColor={0,0,0},
          textString="%name")}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-09</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end TGTypeII;
