within OpenIPSL.Examples.PSATSystems.TwoArea.BaseClasses;
partial model BaseOrder4 "Template for base network and a 4th order generator"
  extends BaseNetwork;
  OpenIPSL.Electrical.Machines.PSAT.Order4 order4(
    Sn=991000000,
    Vn=20000,
    V_b=20000,
    v_0=1.05,
    ra=0,
    xd=2,
    xq=1.91,
    x1d=0.245,
    x1q=0.42,
    T1d0=5,
    T1q0=0.66,
    M=2.8756*2,
    P_0=109999999.9999998,
    Q_0=-13662066.6228504,
    angle_0=0.145884959290248,
    D=0) annotation (Placement(transformation(extent={{-120,20},{-100,40}})));
equation
  connect(order4.p, B1.p) annotation (Line(points={{-100,30},{-89.5,30},{-89.5,30},
          {-80,30}}, color={0,0,255}));
  connect(order4.pm, order4.pm0) annotation (Line(points={{-122,25},{-122,25},{-122,
          24},{-122,19},{-118,19}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>Extension of <strong>BaseNetwork</strong> but with a fourth order machine connected to bus 1.</p>
</html>"));
end BaseOrder4;
