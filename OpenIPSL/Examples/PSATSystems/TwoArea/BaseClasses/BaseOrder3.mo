within OpenIPSL.Examples.PSATSystems.TwoArea.BaseClasses;
partial model BaseOrder3 "Template for base network and a 3rd order generator"
  extends BaseNetwork;
  OpenIPSL.Electrical.Machines.PSAT.Order3 order3_1(
    Sn=991000000,
    Vn=20000,
    V_b=20000,
    v_0=1.05,
    ra=0,
    xd=2,
    xq=1.91,
    x1d=0.245,
    T1d0=5,
    M=2.8756*2,
    P_0=109999999.9999998,
    Q_0=-13662066.6228504,
    angle_0=0.145884959290248,
    D=0) annotation (Placement(transformation(extent={{-120,20},{-100,40}})));
equation
  connect(order3_1.p, B1.p) annotation (Line(points={{-100,30},{-89.5,30},{-89.5,
          30},{-80,30}}, color={0,0,255}));
  connect(order3_1.pm, order3_1.pm0) annotation (Line(points={{-122,25},{-122,25},
          {-122,20},{-122,19},{-118,19}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>Extension of <strong>BaseNetwork</strong> but with a third order machine connected to bus 1.</p>
</html>"));
end BaseOrder3;
