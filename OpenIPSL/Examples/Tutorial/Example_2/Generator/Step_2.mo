within OpenIPSL.Examples.Tutorial.Example_2.Generator;
partial model Step_2 "Adequate connections are performed for connection of stabilizer"
  extends OpenIPSL.Interfaces.Generator;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(
    vfmax=7,
    vfmin=-6.40,
    K0=200,
    T2=1,
    T1=1,
    Te=0.0001,
    Tr=0.015) annotation (Placement(transformation(extent={{0,0},{20,20}})));
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
    Q_0=Q_0) annotation (Placement(transformation(extent={{40,-20},{80,20}})));
  OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pss(
    vsmax=0.2,
    vsmin=-0.2,
    Kw=9.5,
    Tw=1.41,
    T1=0.154,
    T2=0.033,
    T3=1,
    T4=1) annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
equation
  connect(avr.vf, machine.vf)
    annotation (Line(points={{20.8333,10},{36,10},{36,10}}, color={0,0,127}));
  connect(pss.vSI, machine.w) annotation (Line(points={{-42,0},{-60,0},{-60,-40},
          {96,-40},{96,18},{82,18}}, color={0,0,127}));
  connect(pss.vs, avr.vs) annotation (Line(points={{-19,0},{-6,0},{-6,5},{
          0.833333,5}}, color={0,0,127}));
  connect(avr.v, machine.v) annotation (Line(points={{0.833333,15},{-12,15},{-12,
          -34},{90,-34},{90,6},{82,6}}, color={0,0,127}));
  connect(machine.pm, machine.pm0) annotation (Line(points={{36,-10},{32,-10},
          {32,-26},{44,-26},{44,-22}},color={0,0,127}));
  connect(avr.vf0, machine.vf0) annotation (Line(points={{10,19.1667},{10,28},{
          44,28},{44,22}}, color={0,0,127}));
  connect(machine.p, pwPin)
    annotation (Line(points={{80,0},{96,0},{96,0},{110,0}}, color={0,0,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Text(
          extent={{-92,102},{98,84}},
          textColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="Step 2: Connecting model's signals"),Text(
          extent={{-94,86},{88,40}},
          textColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=12,
          horizontalAlignment=TextAlignment.Left,
          textString="1. Generator terminal voltage to voltage input of the AVR

2. PSS output to PSS input of the AVR

3. Generator speed to the input signal of the PSS")}));
end Step_2;
