within OpenIPSL.Examples.IEEE14.Generation_Groups;
model GroupBus6 "13.8kV/25MVA reactive power generation unit (synchronous condenser) connected to bus 6"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter Real vf0=3.146313160164693 "Initial field voltage";
  parameter Real vref0=1.228917822125829 "Reference voltage AVR";
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR4TypeII1(
    Ta=0.02,
    Tf=1,
    Ke=1,
    Tr=0.001,
    Ka=20,
    Kf=0.001,
    Te=0.7,
    v0=v_0,
    vrmin=1.395,
    vrmax=6.81) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={2,10})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 Syn5(
    fn=60,
    D=2,
    Sn=25000000,
    xd=1.25,
    xq=1.22,
    x1d=0.232,
    x1q=0.715,
    x2d=0.12,
    x2q=0.12,
    T1d0=4.75,
    T1q0=1.5,
    T2d0=0.06,
    T2q0=0.21,
    M=2*5.06,
    Vn=13800,
    V_b=V_b,
    v_0=v_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    ra=0.0041) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        origin={60,0})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={
            {100,-10},{120,10}}),iconTransformation(extent={{100,-10},{120,10}})));
equation
  connect(aVR4TypeII1.vf, Syn5.vf) annotation (Line(points={{14,10},{36,10}},
                             color={0,0,127}));
  connect(Syn5.v, aVR4TypeII1.v) annotation (Line(points={{82,6},{88,6},{88,32},
          {-22,32},{-22,4},{-10,4}}, color={0,0,127}));
  connect(Syn5.p, pwPin) annotation (Line(points={{80,0},{110,0}},
                   color={0,0,255}));
  connect(Syn5.pm0, Syn5.pm) annotation (Line(points={{44,-22},{44,-26},{28,-26},
          {28,-10},{36,-10}}, color={0,0,127}));
  connect(aVR4TypeII1.vref0, aVR4TypeII1.vref) annotation (Line(points={{2,22},{
          2,28},{-16,28},{-16,16},{-10,16}}, color={0,0,127}));
  connect(Syn5.vf0, aVR4TypeII1.vf0) annotation (Line(points={{44,22},{44,28},{
          22,28},{22,-26},{2,-26},{2,-2}},
                              color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={
                             Text(
          extent={{-93,6},{-24,-12}},
          lineColor={0,0,255},
          textStyle={TextStyle.Italic},
          textString=""),
          Text(extent={{-34,-32},{38,-52}},
          lineColor={28,108,200},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="%name"),
                         Line(points={{-60,-20},{-20,20},{20,-20},{60,20}},
          color={28,108,200}),Ellipse(extent={{-100,-100},{100,100}}, lineColor=
           {28,108,200})}),
    Documentation(info="<html>
<p>13.8kV/25MVA Reactive power generation unit (synchronous condenser) connected to bus 6, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: 6th order, from PSAT.</li>
<li><strong>Exciter</strong>: type II, from PSAT.</li>
</ul>
</html>"));
end GroupBus6;
