within OpenIPSL.Examples.PSATSystems.TwoAreaOld.BaseClasses;
partial model BaseOrder5 "Template for base network and a 5th order generator"
  extends OpenIPSL.Examples.PSATSystems.TwoAreaOld.BaseClasses.BaseNetwork;
  OpenIPSL.Electrical.Machines.PSAT.Order5_Type2 order5(
    Sn=991000000,
    Vn=20000,
    V_b=20000,
    v_0=1.05,
    angle_0=0.159255652433349,
    ra=0,
    T1d0=5,
    x2d=0.2,
    x2q=0.2,
    T2d0=0.05,
    T2q0=0.1,
    xd=1.1,
    xq=0.7,
    x1d=0.25,
    M=6,
    D=0,
    Taa=0.002,
    P_0=89999999.9999999,
    Q_0=-9093310.5025882)
    annotation (Placement(transformation(extent={{-112,-10},{-92,10}})));
equation
  connect(order5.p, bus1.p) annotation (Line(points={{-92,0},{-84.35,0},{-84.35,
          0},{-80,0}}, color={0,0,255}));
  connect(order5.pm, order5.pm0) annotation (Line(points={{-114,-5},{-114,-5},{-114,
          -11},{-110,-11}}, color={0,0,127}));
  annotation (
    Documentation(info="<html>
<p>Extension of <strong>BaseNetwork</strong> but with a fifth order machine connected to bus 1.</p>
</html>"));
end BaseOrder5;
