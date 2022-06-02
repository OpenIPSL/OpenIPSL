within OpenIPSL.Examples.PSATSystems.TwoArea.BaseClasses;
partial model BaseOrder6 "Template for base network and a 6th order generator"
  extends BaseNetwork;
  OpenIPSL.Electrical.Machines.PSAT.Order6 order6(
    Sn=991000000,
    Vn=20000,
    V_b=20000,
    v_0=1.05,
    ra=0,
    T1d0=5,
    angle_0=0.145884959290248,
    x2d=0.2,
    x2q=0.2,
    M=6,
    xd=2,
    xq=1.91,
    x1d=0.245,
    x1q=0.42,
    T1q0=0.66,
    T2d0=0.031,
    T2q0=0.061,
    P_0=109999999.9999998,
    Q_0=-13662066.6228504,
    D=0,
    Taa=0.002)
    annotation (Placement(transformation(extent={{-120,20},{-100,40}})));
equation
  connect(order6.p, B1.p) annotation (Line(points={{-100,30},{-89.5,30},{-89.5,30},
          {-80,30}}, color={0,0,255}));
  connect(order6.pm, order6.pm0) annotation (Line(points={{-122,25},{-122,25},{-122,
          19},{-118,19}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>Extension of <strong>BaseNetwork</strong> but with a sixth order machine connected to bus 1.</p>
</html>"));
end BaseOrder6;
