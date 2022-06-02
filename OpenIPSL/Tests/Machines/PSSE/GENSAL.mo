within OpenIPSL.Tests.Machines.PSSE;
model GENSAL "SMIB system to test functionality of generator model with salient poles and quadratic saturation on d-axis"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Tpd0=5,
    Tppd0=0.07,
    Tppq0=0.09,
    H=4.28,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xppd=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    angle_0=0.070492225331847,
    Xppq=0.2,
    R_a=0,
    M_b=100000000,
    P_0=40000000,
    Q_0=5416582,
    v_0=1) annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
equation
  connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{-92,10},{-100,10},{-100,26},{-42,26},{-42,10},{-46,10}},
                                                     color={0,0,127}));
  connect(gENSAL.EFD, gENSAL.EFD0) annotation (Line(points={{-92,-10},{-100,-10},{-100,-30},{-42,-30},{-42,-10},{-46,-10}},
                                                     color={0,0,127}));
  connect(gENSAL.p, GEN1.p)
    annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  annotation (experiment(StopTime=10));
end GENSAL;
