within OpenIPSL.Examples.PSATSystems.TwoAreaOld.BaseClasses;
partial model BaseOrder3 "Template for base network and a 3rd order generator"
  extends OpenIPSL.Examples.PSATSystems.TwoAreaOld.BaseClasses.BaseNetwork;
  OpenIPSL.Electrical.Machines.PSAT.Order3 order3(
    Sn=991000000,
    Vn=20000,
    V_b=20000,
    v_0=1.05,
    angle_0=0.159255652433349,
    ra=0,
    xd=2,
    xq=1.91,
    x1d=0.245,
    T1d0=5,
    M=2.8756*2,
    P_0=89999999.9999999,
    Q_0=-9093310.5025882,
    D=0) annotation (Placement(transformation(extent={{-112,-10},{-92,10}})));
equation
  connect(order3.pm, order3.pm0) annotation (Line(points={{-114,-5},{-114,-5},{-114,
          -6},{-114,-11},{-110,-11}}, color={0,0,127}));
  connect(order3.p, bus1.p) annotation (Line(points={{-92,0},{-85.5,0},{-85.5,0},
          {-80,0}}, color={0,0,255}));
  annotation (
    Documentation(info="<html>
<p>Extension of <strong>BaseNetwork</strong> but with a third order machine connected to bus 1.</p>
</html>"));
end BaseOrder3;
