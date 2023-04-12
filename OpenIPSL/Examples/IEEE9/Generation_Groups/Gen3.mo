within OpenIPSL.Examples.IEEE9.Generation_Groups;
model Gen3 "16.5kV/100MVA generation unit connected to bus 1"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter Real vf0=1.079018784709528;
  parameter Real vref0=1.095077501312303;
  parameter Real height_3 annotation (Dialog(group="AVR Disturbance"));
  parameter Real tstart_3 annotation (Dialog(group="AVR Disturbance"));
  parameter Boolean refdisturb_3 annotation (Dialog(group="AVR Disturbance"));
  OpenIPSL.Electrical.Machines.PSAT.Order4 gen(
    Sn=100000000,
    ra=0,
    xd=0.1460,
    xq=0.0969,
    x1d=0.0608,
    x1q=0.0969,
    T1d0=8.96,
    T1q0=0.310,
    V_b=V_b,
    v_0=v_0,
    P_0=P_0,
    Q_0=Q_0,
    M=47.28,
    D=0,
    Vn=16500,
    angle_0=angle_0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={28,14})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII AVR(
    vrmin=-5,
    vrmax=5,
    v0=v_0,
    Ka=20,
    Ta=0.2,
    Kf=0.063,
    Tf=0.35,
    Ke=1,
    Te=0.314,
    Tr=0.001,
    Ae=0.0039,
    Be=1.555) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={-6,10})));
  Modelica.Blocks.Sources.Step step(
    startTime=tstart_3,
    height=height_3,
    offset=vref0) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        origin={-66,30})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-50,12},{-40,22}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=refdisturb_3)
    annotation (Placement(transformation(extent={{-72,12},{-62,22}})));
  OpenIPSL.Interfaces.PwPin pwPin
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  //Real P_MW;
  //Real Q_MVA;
equation
  //P_MW = gen.P*S_b;
  //Q_MVA = gen.Q*S_b;
  connect(gen.v, AVR.v) annotation (Line(
      points={{39,17},{48,17},{48,-14},{-22,-14},{-22,4},{-18,4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y, AVR.vref) annotation (Line(points={{-39.5,17},{-26.75,17},
          {-26.75,16},{-18,16}},color={0,0,127}));
  connect(booleanConstant.y, switch1.u2) annotation (Line(points={{-61.5,17},{-61.5,
          17},{-51,17}}, color={255,0,255}));
  connect(step.y, switch1.u1) annotation (Line(points={{-61.6,30},{-56,30},{-56,
          21},{-51,21}}, color={0,0,127}));
  connect(gen.p, pwPin) annotation (Line(points={{38,14},{66,14},{66,0},{110,0}},
        color={0,0,255}));
  connect(AVR.vf, gen.vf)
    annotation (Line(points={{6,10},{8,10},{8,19},{16,19}}, color={0,0,127}));
  connect(gen.pm0, gen.pm) annotation (Line(points={{20,3},{20,0},{14,0},{14,9},
          {16,9}}, color={0,0,127}));
  connect(AVR.vf0, gen.vf0) annotation (Line(points={{-6,-2},{-6,-2},{-6,-10},{
          -92,-10},{-92,6},{-92,42},{20,42},{20,25}}, color={0,0,127}));
  connect(AVR.vref0, switch1.u3) annotation (Line(points={{-6,22},{-6,22},{-6,
          36},{-84,36},{-84,2},{-56,2},{-56,13},{-51,13}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Ellipse(extent={{-100,-100},{100,100}}, lineColor=
           {28,108,200}),Line(points={{-60,-20},{-20,20},{20,-20},{60,20}},
          color={28,108,200}),Text(
          extent={{-34,-32},{38,-52}},
          lineColor={28,108,200},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="%name"),Text(
          extent={{62,106},{134,68}},
          lineColor={238,46,47},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString=DynamicSelect("0.0", String(P_MW, significantDigits=3))),
          Text(
          extent={{62,-70},{134,-108}},
          lineColor={0,255,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString=DynamicSelect("0.0", String(Q_MVA, significantDigits=3)))}),
    Documentation(info="<html>
<p>16.5kV/100MVA Generation unit, identified as number 3, connected to bus 1, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: 4th order, from PSAT.</li>
<li><strong>Exciter</strong>: type II, from PSAT.</li>
</ul>
<p>Note that the model allows for a disturbance to be introduced in the voltage reference value for the excitation system.</p>
</html>"));
end Gen3;
