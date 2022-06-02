within OpenIPSL.Examples.TwoAreas.Groups.PSAT;
model G2 "20kV/900MVA generation unit connected to bus 2"
  extends TwoAreas.Support.Generator;
  OpenIPSL.Electrical.Machines.PSAT.Order6 order6_1(
    Sn=900000000,
    Vn=20000,
    ra=0.0025,
    x1d=0.3,
    M=13,
    D=0,
    xd=1.80,
    xq=1.7,
    x1q=0.55,
    x2d=0.25,
    x2q=0.25,
    T1d0=8,
    T1q0=0.4,
    T2d0=0.03,
    T2q0=0.05,
    V_b=V_b,
    v_0=v_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(extent={{40,-20},{80,20}})));
equation
  connect(order6_1.p, pwPin) annotation (Line(points={{80,0},{100,0}},
                                     color={0,0,255}));
  connect(order6_1.vf0, order6_1.vf) annotation (Line(points={{44,22},{44,28},{
          28,28},{28,10},{36,10}}, color={0,0,127}));
  connect(order6_1.pm0, order6_1.pm) annotation (Line(points={{44,-22},{44,-28},
          {28,-28},{28,-10},{36,-10}}, color={0,0,127}));
  annotation (
    Documentation(info="<html>
<p>20kV/900MVA generation unit connected to bus 2, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: 6th order from PSAT.</li>
</ul>
</html>"));
end G2;
