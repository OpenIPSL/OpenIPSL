within OpenIPSL.Tests.Controls.PSSE.ES;
model SCRX "SMIB system to test functionality of SCRX model"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  Modelica.Blocks.Sources.Constant const2(k=0)
    annotation (Placement(transformation(extent={{-110,166},{-94,182}})));
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    Tpd0=5,
    Tppd0=0.07,
    Tpq0=0.9,
    Tppq0=0.09,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xpq=0.6,
    Xppd=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    angle_0=0.070492225331847,
    Xppq=0.2,
    R_a=0,
    Xpp=0.2,
    H=4.28,
    M_b=100000000,
    P_0=40000000,
    Q_0=5416582,
    v_0=1) annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
  SCRX_rebuild sCRX_rebuild annotation(
    Placement(transformation(origin = {-70, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  tf_export tf_export1 annotation(
    Placement(transformation(origin = {-70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  tf_export_me_FMU tf_export_me_FMU1 annotation(
    Placement(transformation(origin = {-70, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(gENROU.PMECH, gENROU.PMECH0) annotation(
    Line(points = {{-92, 10}, {-100, 10}, {-100, 32}, {-40, 32}, {-40, 10}, {-46, 10}}, color = {0, 0, 127}));
  connect(gENROU.p, GEN1.p) annotation(
    Line(points = {{-48, 0}, {-30, 0}}, color = {0, 0, 255}));
  connect(sCRX_rebuild.ECOMP, gENROU.ETERM) annotation(
    Line(points = {{-62, -46}, {-36, -46}, {-36, -6}, {-46, -6}}, color = {0, 0, 127}));
  connect(tf_export1.u, gENROU.ETERM) annotation(
    Line(points = {{-62, -70}, {-36, -70}, {-36, -6}, {-46, -6}}, color = {0, 0, 127}));
  connect(tf_export_me_FMU1.u, gENROU.ETERM) annotation(
    Line(points = {{-58, -100}, {-36, -100}, {-36, -6}, {-46, -6}}, color = {0, 0, 127}));
  connect(tf_export_me_FMU1.y, gENROU.EFD) annotation(
    Line(points = {{-80, -100}, {-110, -100}, {-110, -12}, {-92, -12}}, color = {0, 0, 127}));
  annotation (
    experiment(StopTime=10));
end SCRX;
