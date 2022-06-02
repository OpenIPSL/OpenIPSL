within OpenIPSL.Examples.PSATSystems.ThreeArea.BaseClasses;
partial model BaseOrder6 "Template for base network and a 6th order generator"
  extends BaseNetwork;
  OpenIPSL.Electrical.Machines.PSAT.Order6 Syn2(
    Sn=900000000,
    Vn=1000,
    V_b=1000,
    ra=0,
    xd=1.8,
    x1d=0.3,
    M=21,
    v_0=1.05,
    D=2,
    T1q0=0.4,
    x2d=0.25,
    x2q=0.25,
    T2d0=0.03,
    T2q0=0.05,
    x1q=0.55,
    Q_0=19794689.2114274,
    angle_0=0.820649645221366,
    P_0=50000000) annotation (Placement(transformation(extent={{-136,68},{-112,92}})));
equation
  connect(Syn2.p, B800.p) annotation (Line(points={{-112,80},{-107.4,80},{-107.4,
          80},{-100,80}}, color={0,0,255}));
  connect(Syn2.pm0, Syn2.pm) annotation (Line(points={{-133.6,66.8},{-133.6,66},
          {-140,66},{-140,74},{-138.4,74}},
                                          color={0,0,127}));
  annotation (Documentation(info="<html>
<p>Extension of <strong>BaseNetwork</strong> but with a sixth order machine connected to bus 800.</p>
</html>"));
end BaseOrder6;
