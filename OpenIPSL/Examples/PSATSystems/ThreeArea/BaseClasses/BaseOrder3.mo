within OpenIPSL.Examples.PSATSystems.ThreeArea.BaseClasses;
partial model BaseOrder3 "Template for base network and a 3rd order generator"
  extends BaseNetwork;
  OpenIPSL.Electrical.Machines.PSAT.Order3 order3_1(
    Sn=900000000,
    ra=0,
    xd=1.8,
    x1d=0.3,
    M=21,
    v_0=1.05,
    angle_0=0.820649645221365,
    D=2,
    P_0=49999999.9999999,
    Q_0=19794689.2114272,
    T1d0=8,
    xq=1.7,
    V_b=1000,
    Vn=1000)
    annotation (Placement(transformation(extent={{-130,70},{-110,90}})));
equation
  connect(order3_1.p, B800.p) annotation (Line(points={{-110,80},{-104.5,80},{-104.5,
          80},{-100,80}}, color={0,0,255}));
  connect(order3_1.pm, order3_1.pm0) annotation (Line(points={{-132,75},{-132,75},
          {-132,74},{-132,70},{-132,69},{-128,69}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>Extension of <strong>BaseNetwork</strong> but with a third order machine connected to bus 800.</p>
</html>"));
end BaseOrder3;
