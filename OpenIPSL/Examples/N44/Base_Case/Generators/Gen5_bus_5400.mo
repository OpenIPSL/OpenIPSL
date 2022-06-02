within OpenIPSL.Examples.N44.Base_Case.Generators;
model Gen5_bus_5400 "Configuration of synchronous generator with regulators: GENSAL, SEXS, HYGOV;
  Nordic 44 model: Buses 5100, 5400, 5500, 6000, 6500"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Tppd0=0.05 "T''do (> 0)",
    Tppq0=0.15 "T''qo (> 0)",
    D=0 "Speed Damping",
    Tpd0=6.5,
    H=4.1,
    Xd=1.02,
    Xq=0.63,
    Xpd=0.25,
    Xppd=0.16,
    Xppq=0.16,
    Xl=0.13,
    M_b=1225*1e6,
    S10=0.1,
    S12=0.3,
    R_a=0,
    V_b=V_b,
    v_0=v_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(extent={{-64,-18},{0,36}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop, p.u",
    r=0.4 "Temporary droop, p.u",
    VELM=0.2 "Gate open/close velosiy limit, p.u/sec",
    T_r=5,
    T_f=0.05,
    T_g=0.2,
    G_MAX=1,
    G_MIN=0,
    T_w=1,
    A_t=1.1,
    D_turb=0.5,
    q_NL=0.1) annotation (Placement(transformation(extent={{-60,50},{0,76}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
    K=200,
    T_AT_B=0.05,
    T_B=100,
    T_E=0.5,
    E_MIN=0,
    E_MAX=4) annotation (Placement(transformation(extent={{14,-76},{86,-29}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-19,-57},{-9,-47}})));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{
            120,10}})));
equation
  connect(gENSAL.p, p)
    annotation (Line(points={{0,9},{54,9},{54,0},{110,0}}, color={0,0,255}));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{1.25,64.4444},{10,64.4444},{10,50},{10,40},{-74,40},{-74,22.5},{-70.4,22.5}},
                                                              color={0,0,127}));
  connect(sEXS.EFD, gENSAL.EFD) annotation (Line(points={{87.8,-49.8889},{94,-49.8889},{94,-86},{-74,-86},{-74,-4.5},{-70.4,-4.5}},
                                                        color={0,0,127}));
  connect(cte.y, sEXS.VOEL) annotation (Line(points={{-8.5,-52},{37.4,-52},{
          37.4,-76}}, color={0,0,127}));
  connect(gENSAL.EFD0, sEXS.EFD0) annotation (Line(points={{3.2,-4.5},{6,-4.5},{6,-66.8611},{14,-66.8611}},
                                       color={0,0,127}));
  connect(gENSAL.ETERM, sEXS.ECOMP) annotation (Line(points={{3.2,0.9},{10,0.9},{10,-49.8889},{14,-49.8889}},
                                              color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{3.2,27.9},{16,27.9},{16,80},{-66,80},{-66,71.6667},{-57.5,71.6667}},
                                                            color={0,0,127}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{3.2,22.5},{24,22.5},{24,88},{-70,88},{-70,55.7778},{-57.5,55.7778}},
                                                           color={0,0,127}));
  connect(sEXS.VUEL, cte.y) annotation (Line(points={{26.6,-76},{-2,-76},{-2,-52},
          {-8.5,-52}}, color={0,0,127}));
  connect(sEXS.VOTHSG, cte.y) annotation (Line(points={{14,-38.1389},{-2,-38.1389},{-2,-52},{-8.5,-52}},
                                color={0,0,127}));
  connect(gENSAL.XADIFD, sEXS.XADIFD) annotation (Line(points={{2.56,-15.3},{2.56,-80},{66.2,-80},{66.2,-75.4778}}, color={0,0,127}));
  annotation (
    Icon(graphics={Ellipse(extent={{-100,-100},{101,100}}, lineColor={0,0,255}),
          Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier)}));
end Gen5_bus_5400;
