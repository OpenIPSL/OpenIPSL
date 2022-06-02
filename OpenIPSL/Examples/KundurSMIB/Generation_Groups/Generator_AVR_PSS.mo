within OpenIPSL.Examples.KundurSMIB.Generation_Groups;
model Generator_AVR_PSS "Generation unit used in SMIB AVR PSS system"
  extends OpenIPSL.Interfaces.Generator;
  OpenIPSL.Electrical.Machines.PSAT.Order6 machine(
    Vn=400000,
    V_b=V_b,
    ra=0.003,
    w(fixed=true),
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
    M=7,
    D=0,
    P_0=P_0,
    Q_0=Q_0,
    v_0=v_0,
    angle_0=angle_0,
    Sn=2220000000,
    Taa=0) annotation (Placement(transformation(extent={{20,-30},{80,30}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII avr(
    vfmax=7,
    vfmin=-6.40,
    K0=200,
    T2=1,
    T1=1,
    Te=0.0001,
    Tr=0.015) annotation (Placement(transformation(extent={{-50,-6},{-10,34}})));
  OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pss(
    vsmax=0.2,
    vsmin=-0.2,
    Kw=9.5,
    Tw=1.41,
    T1=0.154,
    T2=0.033,
    T3=1,
    T4=1) annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
equation
  connect(machine.pm0, machine.pm) annotation (Line(points={{26,-33},{26,-40},{0,-40},{0,-15},{14,-15}},
                                             color={0,0,127}));
  connect(machine.p, pwPin) annotation (Line(points={{80,0},{110,0}},
                             color={0,0,255}));
  connect(avr.vf, machine.vf) annotation (Line(points={{-8.33333,14},{10,14},{10,15},{14,15}},
                   color={0,0,127}));
  connect(machine.v, avr.v) annotation (Line(points={{83,9},{88,9},{88,50},{-60,
          50},{-60,24},{-48.3333,24}},
                         color={0,0,127}));
  connect(pss.vs, avr.vs)
    annotation (Line(points={{-59,0},{-54,0},{-54,4},{-48.3333,4}},
                                                       color={0,0,127}));
  connect(pss.vSI, machine.w) annotation (Line(points={{-82,0},{-90,0},{-90,-50},
          {92,-50},{92,27},{83,27}}, color={0,0,127}));
  connect(machine.vf0, avr.vf0) annotation (Line(points={{26,33},{26,40},{-30,
          40},{-30,32.3333}}, color={0,0,127}));
  annotation (
    Documentation(info="<html>
<p> Generation unit composed of order 6 machine, an AVR type III and a PSS type II.</p>
</html>"));
end Generator_AVR_PSS;
