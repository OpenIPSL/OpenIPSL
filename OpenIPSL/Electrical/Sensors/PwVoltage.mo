within OpenIPSL.Electrical.Sensors;
class PwVoltage "Voltage sensor"
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Blocks.Interfaces.RealOutput vr
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput vi
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealOutput v
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
equation
  p.ir = 0;
  p.ii = 0;
  vr = p.vr;
  vi = p.vi;
  v = sqrt(p.vr*p.vr + p.vi*p.vi);
  annotation (Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={0,0,255}),Rectangle(extent={{-80,80},{80,-80}}, lineColor=
          {0,0,255}),Rectangle(extent={{-60,60},{60,0}}, lineColor={0,0,255}),
          Text(
          extent={{-20,-20},{20,-60}},
          textColor={0,0,255},
          textStyle={TextStyle.Bold},
          textString="V"),Line(
          points={{0,0},{40,40}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{80,70},{100,50}},
          textColor={0,0,255},
          textString="vr"),Text(
          extent={{80,10},{100,-10}},
          textColor={0,0,255},
          textString="vi"),Text(
          extent={{80,-50},{100,-70}},
          textColor={0,0,255},
          textString="v"),Text(
          extent={{-100,-100},{100,-160}},
          textColor={0,0,255},
          textString="%name")}));
end PwVoltage;
