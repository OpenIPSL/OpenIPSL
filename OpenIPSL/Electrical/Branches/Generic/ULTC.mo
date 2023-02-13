within OpenIPSL.Electrical.Branches.Generic;
model ULTC "Discrete tap changer based on Hisken"
  parameter Real m0 = 1.0375 "Initial tap ratio, from power flow";
  parameter Types.Time Ttap = 20 "Time delay of tap change";
  parameter Types.PerUnit vlow = 1.04 "Lower voltage deadband";
  parameter Types.PerUnit vhigh = 1.06 "Upper voltage deadband";
  parameter Real m_max = 1.1 "Maximum tap position";
  parameter Real m_min = 0.9 "Minimum tap position";
  parameter Real m_step = 0.0125 "Step size";
  Real m(start = m0, fixed = true) "Tap ratio";
  Types.PerUnit vk "Voltage at primary";
  Types.PerUnit vm "Voltage at secondary";
  Types.Angle anglevk "Angle at primary";
  Types.Angle anglevm "Angle at secondary ";
  Types.Time x1(start = 0, fixed = true) "Timer";
  Real y1;
  Real y2;
  Real y3;
  Real y4;
  Real y5;
  Real y7;
  Real y6;
  Modelica.Blocks.Logical.ZeroCrossing zeroCrossing(enable = true) annotation (
    Placement(transformation(extent = {{-8, -12}, {12, 8}})));
  Interfaces.PwPin p annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  Interfaces.PwPin n annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  n.vi = p.vi * m;
  n.vr = p.vr * m;
  p.ir + n.ir * m = 0;
  p.ii + n.ii * m = 0;
  vk = sqrt(p.vr ^ 2 + p.vi ^ 2);
  vm = sqrt(n.vr ^ 2 + n.vi ^ 2);
  anglevk = atan2(p.vi, p.vr);
  anglevm = atan2(n.vi, n.vr);
  der(x1) = y1 * y7;
  y2 + vlow - vm = 0;
  y3 - vhigh + vm = 0;
  y6 - m + m_max - m_step / 2 = 0;
  y4 - m + m_min - m_step / 2 = 0;
  y5 - x1 + Ttap = 0;
  if y2 < 0 or y3 <0 then
    y1 = 1;
  else
    y1 = 0;
  end if;
  if y6 < 0 and vm < vlow then
    y7 = 1;
  elseif y4 > 0 and vm > vhigh then
    y7 = 1;
  else
    y7 = 0;
  end if;
  zeroCrossing.u = y5;
  when zeroCrossing.y and y2 < 0 then
    reinit(x1, 0);
    m = pre(m) + m_step;
  elsewhen zeroCrossing.y and y3 < 0 then
    reinit(x1, 0);
    m = pre(m) - m_step;
  end when;
  annotation (Icon(graphics={ Ellipse(extent={{-46,30},{8,-30}}, lineColor={0,0,
          255}),Ellipse(extent={{-10,30},{44,-30}}, lineColor={0,0,255}),Line(
          points={{100,0},{44,0},{44,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-100,0},{-46,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{70,0},{70,-40},{-36,-40},{-20,18},{-20,18}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-30,6},{-20,18}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-20,2},{-20,16}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{-100,-40},{100,-100}},
          lineColor={0,128,0},
          textString="ULTC"),
        Text(
          extent={{-100,100},{100,40}},
          lineColor={0,0,255},
          textString="%name")}), Documentation(info="<html>
<p>See <a href=\"modelica:OpenIPSL/Resources/docs/ULTC/ultc.pdf\">PDF documentation</a> by Mohammed Ahsan Adib Murad. </p>
</html>"));
end ULTC;
