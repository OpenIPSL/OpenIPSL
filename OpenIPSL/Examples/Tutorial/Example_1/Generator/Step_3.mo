within OpenIPSL.Examples.Tutorial.Example_1.Generator;
model Step_3 "Connecting models and assembling generation unit"
  extends OpenIPSL.Interfaces.Generator;
  OpenIPSL.Electrical.Machines.PSAT.Order6 machine(
    Vn=400000,
    ra=0.003,
    xd=1.81,
    xq=1.76,
    x1d=0.3,
    x1q=0.65,
    x2d=0.23,
    x2q=0.25,
    T1d0=8,
    T1q0=1,
    T2d0=0.03,
    T2q0=0.07,
    Taa=0.002,
    M=7,
    D=0,
    Sn=2220000000,
    V_b=V_b,
    v_0=v_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(extent={{16,-70},
            {76,-10}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(
    vfmax=7,
    vfmin=-6.40,
    K0=200,
    T2=1,
    T1=1,
    Te=0.0001,
    Tr=0.015) annotation (Placement(transformation(extent={{-54,-46},
            {-14,-6}})));
  Modelica.Blocks.Sources.Constant pss_off(k=0) annotation (Placement(transformation(extent={{-98,-46},{-78,-26}})));
equation
  connect(pss_off.y, avr.vs) annotation (Line(points={{-77,-36},{-52.3333,-36},
          {-52.3333,-36}}, color={0,0,127}));
  connect(avr.v, machine.v) annotation (Line(points={{-52.3333,-16},{-70,-16},{
          -70,6},{86,6},{86,-31},{82.5,-31},{79,-31}}, color={0,0,127}));
  connect(avr.vf, machine.vf) annotation (Line(points={{-12.3333,-26},{10,-26},
          {10,-25}}, color={0,0,127}));
  connect(machine.pm, machine.pm0) annotation (Line(points={{10,-55},{10,-55},{-4,
          -55},{-4,-80},{22,-80},{22,-76.5},{22,-73}}, color={0,0,127}));
  connect(avr.vf0, machine.vf0) annotation (Line(points={{-34,-7.66667},{-34,4},
          {22,4},{22,-7}}, color={0,0,127}));
  connect(machine.p, pwPin) annotation (Line(points={{76,-40},{76,-40.9256},{110,
          -40.9256},{110,0}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        grid={2,2}), graphics={Text(
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{-92,104},{98,86}},
          textString="Step 4: Connecting model's signals",
          fontSize=15,
          textStyle={TextStyle.Bold}),Text(
          origin={0,-8},
          fillPattern=FillPattern.Solid,
          lineThickness=1,
          extent={{-94,60},{36,54}},
          fontSize=10,
          horizontalAlignment=TextAlignment.Left,
          lineColor={0,0,0},
          textString="1. Machine's terminal voltage to AVR's input signal

2. AVR's output field voltage to machine's input field voltage

3. Initially calculated mechanical power to input signal of the machine's
mechanical power

4. Machine's power terminal to the generator model power terminal

5. Constant pss_off to the PSS input at the AVR

6. Initial generator field voltage to initial AVR field voltage

7. Generator pin to External pin")}));
end Step_3;
