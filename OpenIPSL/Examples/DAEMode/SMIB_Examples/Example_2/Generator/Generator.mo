within OpenIPSL.Examples.DAEMode.SMIB_Examples.Example_2.Generator;
model Generator "Generator model composed by PSAT components for Machine, AVR and PSS"
    extends OpenIPSL.Interfaces.Generator;
    OpenIPSL.Electrical.Machines.PSAT.Order6 order6(D = 0, M = 7, P_0 = P_0, Q_0 = Q_0,
    Sn=2220000000,
    w(fixed=true),                                                                                       T1q0 = 1, T2d0 = 0.03, T2q0 = 0.07, Taa = 0.002, v_0 = v_0, V_b = V_b,
    Vn=400000,                                                                                                                                                                               angle_0 = angle_0, ra = 0.003, x1d = 0.3, x1q = 0.65, x2d = 0.23, x2q = 0.25, xd = 1.81, xq = 1.76) annotation (
          Placement(transformation(origin = {9, -5}, extent = {{-15, -15}, {15, 15}})));
    OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII aVRtypeIII(K0 = 200, T1 = 1, T2 = 1, Te = 0.0001, Tr = 0.015, vfmax = 7, vfmin = -6.4) annotation (
          Placement(transformation(origin = {-52, 6}, extent = {{-12, -12}, {12, 12}})));
    OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII pss(
          Kw=9.5,
          T1=0.154,
          T2=0.033,
          T3=1,
          T4=1,
          Tw=1.41,
          vsmax=0.2,
          vsmin=-0.2) annotation (
          Placement(transformation(origin = {-84, 0}, extent = {{-10, -10}, {10, 10}})));
equation
    connect(pss.vSI, order6.w) annotation (
          Line(points={{-96,0},{-100,0},{-100,30},{32,30},{32,8},{25.5,8},{25.5,
          8.5}},                                                                                color = {0, 0, 127}));
    connect(pss.vs, aVRtypeIII.vs) annotation (
          Line(points={{-73,0},{-64,0},{-64,0},{-63,0}},          color = {0, 0, 127}));
    connect(order6.pm0, order6.pm) annotation (
          Line(points={{-3,-21.5},{-3,-21.5},{-3,-30},{-18,-30},{-18,-12},{-9,-12},
          {-9,-12.5}},                                                                                     color = {0, 0, 127}));
    connect(order6.v, aVRtypeIII.v) annotation (
          Line(points={{25.5,-0.5},{38,-0.5},{38,26},{-70,26},{-70,12},{-63,12},
          {-63,12}},                                                                              color = {0, 0, 127}));
    connect(order6.vf0, aVRtypeIII.vf0) annotation (
          Line(points={{-3,11.5},{-3,24},{-52,24},{-52,17}},        color = {0, 0, 127}));
    connect(aVRtypeIII.vf, order6.vf) annotation (
          Line(points={{-39,6},{-23,6},{-23,2.5},{-9,2.5}},      color = {0, 0, 127}));
    connect(order6.p, pwPin) annotation (
          Line(points = {{24, -5}, {62, -5}, {62, 0}, {110, 0}}, color = {0, 0, 255}));
end Generator;
