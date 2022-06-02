within OpenIPSL.Tests.Controls.CGMES.TG;
model GovHydroIEEE0_Test "SMIB system to test functionality of turbine governor GovHydroIEEE0 model"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  Modelica.Blocks.Sources.Constant const2(k=0) annotation (Placement(transformation(extent={{-110,166},{-94,182}})));
  OpenIPSL.Electrical.Machines.PSSE.GENROU generator(
    M_b=100000000,
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
    P_0=40000000,
    angle_0=0.070492225331847,
    Q_0=5416582,
    Xppq=0.2,
    R_a=0,
    Xpp=0.2,
    H=4.28) annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
  Electrical.Controls.CGMES.TG.GovHydroIEEE0 govHydroIEEE0_1 annotation (Placement(transformation(
        extent={{-14,14},{14,-14}},
        rotation=180,
        origin={-70,40})));
equation
  connect(generator.p, GEN1.p) annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  connect(generator.EFD0, generator.EFD) annotation (Line(points={{-46,-10},{-38,-10},{-38,-30},{-100,-30},{-100,-10},{-92,-10}}, color={0,0,127}));
  connect(generator.SPEED, govHydroIEEE0_1.SPEED) annotation (Line(points={{-46,14},{-40,14},{-40,40},{-53.2,40}}, color={0,0,127}));
  connect(generator.PELEC, govHydroIEEE0_1.Pref) annotation (Line(points={{-46,6},{-38,6},{-38,51.2},{-53.2,51.2}}, color={0,0,127}));
  connect(govHydroIEEE0_1.PMECH, generator.PMECH) annotation (Line(points={{-85.4,40},{-100,40},{-100,10},{-92,10}}, color={0,0,127}));
  annotation (experiment(StopTime=5));
end GovHydroIEEE0_Test;
