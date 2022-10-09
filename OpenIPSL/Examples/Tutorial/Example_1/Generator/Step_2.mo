within OpenIPSL.Examples.Tutorial.Example_1.Generator;
partial model Step_2 "AVR and disabled PSS"
  extends OpenIPSL.Interfaces.Generator;
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(
    vfmax=7,
    vfmin=-6.40,
    K0=200,
    T2=1,
    T1=1,
    Te=0.0001,
    Tr=0.015) annotation (Placement(transformation(extent={{-52,-6},{-12,34}})));
  Modelica.Blocks.Sources.Constant pss_off(k=0)
    annotation (Placement(transformation(extent={{-100,-4},{-80,16}})));
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
    Q_0=Q_0) annotation (Placement(transformation(extent={{20,-30},{80,30}})));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Rectangle(
          extent={{-64,42},{-2,-12}},
          lineColor={255,0,0},
          lineThickness=1),Text(
          extent={{-96,104},{94,86}},
          textColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="Step 2: AVR model and parameters"),Text(
          extent={{-82,56},{20,40}},
          textColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=12,
          textString="Electrical.Controls.PSAT.AVR.AVRtypeIII"),Text(
          extent={{-138,-14},{-36,-30}},
          textColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=12,
          textString="Modelica.Blocks.Sources.Constant"),Rectangle(
          extent={{-108,24},{-74,-12}},
          lineColor={255,0,0},
          lineThickness=1)}));
end Step_2;
