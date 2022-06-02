within OpenIPSL.Examples.PSATSystems.ThreeArea.BaseClasses;
partial model BaseOrder5 "Template for base network and a 5th order generator"
  extends BaseNetwork;
  OpenIPSL.Electrical.Machines.PSAT.Order5_Type2 Syn2(
    Sn=900000000,
    Vn=1000,
    V_b=1000,
    ra=0,
    xd=1.8,
    x1d=0.3,
    M=21,
    v_0=1.05,
    D=2,
    angle_0=0.820649645221366,
    x2d=0.25,
    x2q=0.25,
    T2d0=0.03,
    T2q0=0.05,
    P_0=50000000,
    Q_0=19794689.2114274,
    xq=1.7,
    T1d0=8,
    Taa=0.002)
    annotation (Placement(transformation(extent={{-140,68},{-116,92}})));
equation
  connect(Syn2.pm, Syn2.pm0) annotation (Line(points={{-142.4,74},{-144,74},{-144,
          66.8},{-137.6,66.8}}, color={0,0,127}));
  connect(Syn2.p, B800.p) annotation (Line(points={{-116,80},{-107.4,80},{-107.4,
          80},{-100,80}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>Extension of <strong>BaseNetwork</strong> but with a fifth order machine connected to bus 800.</p>
</html>"));
end BaseOrder5;
