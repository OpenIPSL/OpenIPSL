within OpenIPSL.Examples.Microgrids.UniversityCampuses.GeneratorGroups;
model GasTurbineUnit3
  extends OpenIPSL.Interfaces.Generator(V_b = 13800);
  Electrical.Machines.PSSE.GENROE gENROE(
    V_b=13800,
    P_0=P_0,
    Q_0=Q_0,
    v_0=v_0,
    angle_0=angle_0,
    M_b=16667000,
    Tpd0=4.610,
    Tppd0=0.054,
    Tppq0=0.107,
    H=183.30/16.667,
    D=0,
    Xd=1.850,
    Xq=1.750,
    Xpd=0.225,
    Xppd=0.155,
    Xppq=0.155,
    Xl=0.113,
    S10=0.087,
    S12=0.2681,
    R_a=0.034,
    Xpq=0.1125,
    Tpq0=1) annotation (Placement(transformation(extent={{20,-20},{60,20}})));
equation
  connect(gENROE.p, pwPin)
    annotation (Line(points={{60,0},{110,0}}, color={0,0,255}));
  connect(gENROE.PMECH0, gENROE.PMECH) annotation (Line(points={{62,10},{70,10},
          {70,26},{6,26},{6,10},{16,10},{16,12}}, color={0,0,127}));
  connect(gENROE.EFD0, gENROE.EFD) annotation (Line(points={{62,-10},{72,-10},{
          72,-30},{6,-30},{6,-12},{16,-12}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
                                   Diagram(coordinateSystem(preserveAspectRatio=
           false)));
end GasTurbineUnit3;
