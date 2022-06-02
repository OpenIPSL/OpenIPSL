within OpenIPSL.Examples.DAEMode.SMIB_Examples.Example_1.Generator;
model Generator "Generator model composed by PSAT components"
    extends OpenIPSL.Interfaces.Generator;
    OpenIPSL.Electrical.Machines.PSAT.Order6 order6(D = 5, M = 7, P_0 = P_0, Q_0 = Q_0,
    Sn=2220000000, T1q0 = 1, T2d0 = 0.03, T2q0 = 0.07, Taa = 0.002, v_0 = v_0, V_b = V_b,
    Vn=400000, angle_0 = angle_0, ra = 0.003, x1d = 0.3, x1q = 0.65, x2d = 0.23, x2q = 0.25, xd = 1.81, xq = 1.76) annotation (
          Placement(transformation(origin = {9, -5}, extent = {{-15, -15}, {15, 15}})));
    OpenIPSL.Electrical.Controls.PSAT.AVR.AVRtypeIII aVRtypeIII(K0 = 10, T1 = 1, T2 = 1, Te = 0.0001, Tr = 0.015, vfmax = 7, vfmin = -6.4) annotation (
          Placement(transformation(origin = {-52, 6}, extent = {{-12, -12}, {12, 12}})));
    Modelica.Blocks.Sources.Constant pss_off(k = 0) annotation (
          Placement(transformation(origin = {-88, 0}, extent = {{-10, -10}, {10, 10}})));
equation
    connect(order6.pm0, order6.pm) annotation (
          Line(points={{-3,-21.5},{-3,-21.5},{-3,-30},{-18,-30},{-18,-12},{-9,
                -12},{-9,-12.5}}, color = {0, 0, 127}));
    connect(order6.v, aVRtypeIII.v) annotation (
          Line(points={{25.5,-0.5},{38,-0.5},{38,26},{-70,26},{-70,12},{-63,12},
                {-63,12}}, color = {0, 0, 127}));
    connect(order6.vf0, aVRtypeIII.vf0) annotation (
          Line(points={{-3,11.5},{-3,24},{-52,24},{-52,17}}, color = {0, 0, 127}));
    connect(aVRtypeIII.vf, order6.vf) annotation (
          Line(points={{-39,6},{-23,6},{-23,2.5},{-9,2.5}}, color = {0, 0, 127}));
    connect(order6.p, pwPin) annotation (
          Line(points = {{24, -5}, {62, -5}, {62, 0}, {110, 0}}, color = {0, 0, 255}));
    connect(pss_off.y, aVRtypeIII.vs) annotation (
          Line(points={{-77,0},{-64,0},{-64,0},{-63,0}}, color = {0, 0, 127}));
  annotation (Documentation(info="<html>

</html>"));
end Generator;
