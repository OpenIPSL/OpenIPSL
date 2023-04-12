within OpenIPSL.Examples.IEEE9.Generation_Groups;
model Gen1 "18kV/100MVA generation unit connected to bus 2"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter Real vf0=1.755517086537914;
  parameter Real vref0=1.118023800520641;
  parameter Real height_1 annotation (Dialog(group="AVR Disturbance"));
  parameter Real tstart_1 annotation (Dialog(group="AVR Disturbance"));
  parameter Boolean refdisturb_1 annotation (Dialog(group="AVR Disturbance"));
  OpenIPSL.Electrical.Machines.PSAT.Order4 gen(
    Sn=100000000,
    Vn=18000,
    V_b=V_b,
    v_0=v_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    ra=0,
    xd=0.8958,
    xq=0.8645,
    x1d=0.1198,
    x1q=0.1969,
    T1d0=6,
    T1q0=0.5350,
    M=12.8,
    D=0) annotation (Placement(transformation(
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
    startTime=tstart_1,
    offset=vref0,
    height=height_1) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={-56,-2})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-50,12},{-40,22}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=refdisturb_1)
    annotation (Placement(transformation(extent={{-80,2},{-70,12}})));
  OpenIPSL.Interfaces.PwPin pwPin
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  //Real P_MW;
  //Real Q_MVA;
equation
  //P_MW = gen.P*S_b;
  // Q_MVA = gen.Q*S_b;
  connect(gen.v, AVR.v) annotation (Line(
      points={{39,17},{48,17},{48,-14},{-22,-14},{-22,4},{-18,4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y, AVR.vref) annotation (Line(points={{-39.5,17},{-26.75,17},
          {-26.75,16},{-18,16}},color={0,0,127}));
  connect(booleanConstant.y, switch1.u2) annotation (Line(points={{-69.5,7},{-66,
          7},{-66,17},{-51,17}}, color={255,0,255}));
  connect(step.y, switch1.u1)
    annotation (Line(points={{-56,2.4},{-56,21},{-51,21}}, color={0,0,127}));
  connect(gen.p, pwPin) annotation (Line(points={{38,14},{66,14},{66,0},{110,0}},
        color={0,0,255}));
  connect(AVR.vf, gen.vf)
    annotation (Line(points={{6,10},{8,10},{8,19},{16,19}}, color={0,0,127}));
  connect(gen.pm0, gen.pm) annotation (Line(points={{20,3},{20,0},{14,0},{14,9},
          {16,9}}, color={0,0,127}));
  connect(gen.vf0, AVR.vf0) annotation (Line(points={{20,25},{10,25},{10,36},{-26,
          36},{-26,-8},{-6,-8},{-6,-2}}, color={0,0,127}));
  connect(AVR.vref0, switch1.u3) annotation (Line(points={{-6,22},{-30,22},{-30,
          50},{-68,50},{-68,42},{-68,13},{-51,13}}, color={0,0,127}));
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
<p>18kV/100MVA Generation unit, identified as number 1, connected to bus 2, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: 4th order, from PSAT.</li>
<li><strong>Exciter</strong>: type II, from PSAT.</li>
</ul>
<p>Note that the model allows for a disturbance to be introduced in the voltage reference value for the excitation system.</p>
</html>"));
end Gen1;
