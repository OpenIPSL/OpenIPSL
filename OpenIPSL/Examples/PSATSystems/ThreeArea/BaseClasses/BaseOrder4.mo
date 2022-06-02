within OpenIPSL.Examples.PSATSystems.ThreeArea.BaseClasses;
partial model BaseOrder4 "Template for base network and a 4th order generator"
  extends BaseNetwork;
  OpenIPSL.Electrical.Machines.PSAT.Order4 order4_1(
    Sn=900000000,
    Vn=1000,
    V_b=1000,
    ra=0,
    xd=1.8,
    x1d=0.3,
    M=21,
    v_0=1.05,
    angle_0=0.820649645221365,
    P_0=49999999.9999999,
    Q_0=19794689.2114272,
    D=2,
    T1q0=0.4,
    xq=1.7,
    x1q=0.5,
    T1d0=8) annotation (Placement(transformation(extent={{-140,68},{-116,92}})));
equation
  connect(order4_1.p, B800.p) annotation (Line(points={{-116,80},{-107.4,80},{-107.4,
          80},{-100,80}}, color={0,0,255}));
  connect(order4_1.pm, order4_1.pm0) annotation (Line(points={{-142.4,74},{-144,
          74},{-144,66.8},{-137.6,66.8}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>Extension of <strong>BaseNetwork</strong> but with a fourth order machine connected to bus 800.</p>
</html>"));
end BaseOrder4;
