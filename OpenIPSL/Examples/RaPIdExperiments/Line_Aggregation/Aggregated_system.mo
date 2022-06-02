within OpenIPSL.Examples.RaPIdExperiments.Line_Aggregation;
model Aggregated_system "Simple test system with aggregated lines for export and usage in RaPId"

  OpenIPSL.Electrical.Machines.PSSE.GENROE gENROE(
    M_b=100000000,
    Tpd0=5,
    Tppd0=0.07,
    w0=0,
    Tpq0=0.9,
    Tppq0=0.09,
    H=4.28,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xpq=0.6,
    Xppd=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    v_0=1,
    angle_0=0.070492225331847,
    P_0=40000000,
    Q_0=5416582,
    Xppq=0.2,
    Xpp=0.2)
    annotation (Placement(transformation(extent={{-78,-10},{-38,30}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=0.001,
    G=0,
    B=0,
    X=0.1) annotation (Placement(transformation(extent={{6,0},{26,20}})));
  OpenIPSL.Electrical.Buses.Bus LOAD
    annotation (Placement(transformation(extent={{32,0},{52,20}})));
  OpenIPSL.Electrical.Buses.Bus GEN1
    annotation (Placement(transformation(extent={{-24,0},{-4,20}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-120,10},{-100,30}})));
  OpenIPSL.Electrical.Loads.PSSE.Load_variation constantLoad(
    PQBRAK=0.7,
    characteristic=1,
    d_t=0,
    d_P=0,
    t1=0,
    v_0=0.9919935,
    angle_0=-0.5762684,
    P_0=50000000,
    Q_0=10000000)
    annotation (Placement(transformation(extent={{40,-50},{62,-26}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    G=0,
    B=0,
    R=0.0001,
    X=0.02) annotation (Placement(transformation(extent={{78,0},{98,20}})));
  OpenIPSL.Electrical.Buses.Bus GEN2
    annotation (Placement(transformation(extent={{102,0},{122,20}})));
  OpenIPSL.Electrical.Machines.PSSE.GENROE gENROE1(
    D=0,
    S10=0.11,
    S12=0.39,
    v_0=1,
    angle_0=0,
    Tpd0=7.6969,
    Tppd0=0.0413,
    w0=0,
    Tpq0=1.6732,
    Tppq0=0.0763,
    H=7.9284,
    Xd=1.0003,
    Xq=1.3005,
    Xpd=0.1638,
    Xpq=0.8517,
    Xppd=0.2,
    Xl=0.1111,
    P_0=10017110,
    Q_0=8006544,
    M_b=100000000,
    R_a=0.0,
    Xppq=0.2,
    Xpp=0.2)
    annotation (Placement(transformation(extent={{180,-12},{140,28}})));
  Modelica.Blocks.Interfaces.RealInput pref_disturb
    annotation (Placement(transformation(extent={{-182,-6},{-142,34}})));
  inner Electrical.SystemBase SysData(S_b=100000000, fn=50)
    annotation (Placement(transformation(extent={{-200,-60},{-160,-40}})));
equation
  connect(pwLine.n, LOAD.p)
    annotation (Line(points={{25,10},{25,10},{42,10}}, color={0,0,255}));
  connect(pwLine.p, GEN1.p)
    annotation (Line(points={{7,10},{7,10},{-14,10}}, color={0,0,255}));
  connect(gENROE.p, GEN1.p)
    annotation (Line(points={{-38,10},{-38,10},{-14,10}}, color={0,0,255}));
  connect(gENROE.EFD, gENROE.EFD0) annotation (Line(points={{-82,-2},{-90,-2},
          {-90,-20},{-34,-20},{-34,0},{-36,0}},
                                           color={0,0,127}));
  connect(gENROE.PMECH, add.y)
    annotation (Line(points={{-82,22},{-82,20},{-99,20}}, color={0,0,127}));
  connect(add.u1, gENROE.PMECH0) annotation (Line(points={{-122,26},{-132,26},{
          -132,42},{-28,42},{-28,20},{-36,20}}, color={0,0,127}));
  connect(constantLoad.p, LOAD.p) annotation (Line(points={{51,-26},{50,-26},{
          50,10},{42,10}}, color={0,0,255}));
  connect(pwLine1.n, GEN2.p)
    annotation (Line(points={{97,10},{97,10},{112,10}}, color={0,0,255}));
  connect(gENROE1.EFD0, gENROE1.EFD) annotation (Line(points={{138,-2},{134,-2},
          {134,-16},{186,-16},{186,-4},{184,-4}}, color={0,0,127}));
  connect(gENROE1.PMECH, gENROE1.PMECH0) annotation (Line(points={{184,20},{190,
          20},{190,-20},{130,-20},{130,18},{138,18}}, color={0,0,127}));
  connect(gENROE1.p, GEN2.p) annotation (Line(points={{140,8},{126,8},{126,10},
          {112,10}}, color={0,0,255}));
  connect(pwLine1.p, LOAD.p)
    annotation (Line(points={{79,10},{42,10}}, color={0,0,255}));
  connect(pref_disturb, add.u2)
    annotation (Line(points={{-162,14},{-134,14},{-122,14}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -60},{200,60}})),
    Documentation(info="<html>
<p>This is a Two-Machine system contains inputs for disturbances on the mechanical power supply of the generator connected to bus GEN1.
These disturbances allow the user to export this model as an FMU and add different disturbances in other software packages.
Also note that all lines are aggregated into a single equivalent branch component.</p>
<p>This system is not for simulation, but it can be used for linearization or FMU export.</p>
</html>"));
end Aggregated_system;
