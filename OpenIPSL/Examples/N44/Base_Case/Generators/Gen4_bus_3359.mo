within OpenIPSL.Examples.N44.Base_Case.Generators;
model Gen4_bus_3359 "Configuration of synchronous generator with regulators: GENROU, STAB2A, IEEET2, IEESGO;
  Nordic 44 model: Buses 3300, 3359, 8500"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    Tppd0=0.05 "d-axis sub-transient open-circuit time constant s",
    Tpq0=1 "q-axis transient open-circuit time constant s",
    Tppq0=0.05 "q-axis transient open-circuit time constant s",
    D=0 "Damping",
    Tpd0=4.75,
    H=4.82,
    Xd=2.13,
    Xq=2.03,
    Xpd=0.31,
    Xpq=0.403,
    Xppd=0.1937,
    Xppq=0.1937,
    Xl=0.14531,
    M_b=1350*1e6,
    S10=0.1089,
    S12=0.37795,
    R_a=0,
    v_0=v_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    V_b=V_b) annotation (Placement(transformation(extent={{-56,-24},{6,42}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.IEESGO iEESGO(
    T_1=0.01,
    T_2=0,
    T_3=0.15,
    T_4=0.3,
    T_5=8,
    T_6=0.4,
    K_1=0,
    K_2=0.7,
    K_3=0.43,
    P_MAX=1,
    P_MIN=0) annotation (Placement(transformation(
        extent={{-30,-13},{30,13}},
        origin={-22,71})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
    K=165,
    T_AT_B=0.2,
    T_B=10,
    T_E=0.04,
    E_MIN=0,
    E_MAX=5,
    r_cr_fd=0,
    C_SWITCH=true) annotation (Placement(transformation(
        extent={{-27.5,-33.5},{27.5,33.5}},
        origin={58.5,-59.5})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.STAB2A sTAB2A(
    H_LIM=0.03,
    K_2=1,
    T_2=4.5,
    K_3=0,
    T_3=2,
    K_4=0.68,
    K_5=1,
    T_5=0.01)
    annotation (Placement(transformation(extent={{-61,-61},{-18,-36}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-10,-63},{0,-53}})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={
            {100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
equation
  connect(gENROU.p, pwPin)
    annotation (Line(points={{6,9},{66,9},{66,0},{110,0}}, color={0,0,255}));
  connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(points={{9.25,72.4444},{20,72.4444},{20,46},{-66,46},{-66,25.5},{-62.2,25.5}},
                                                                   color={0,0,
          127}));
  connect(gENROU.SPEED, iEESGO.SPEED) annotation (Line(points={{9.1,32.1},{24,32.1},{24,88},{-56,88},{-56,79.6667},{-49.5,79.6667}},
                                                                 color={0,0,127}));
  connect(gENROU.PMECH0, iEESGO.PMECH0) annotation (Line(points={{9.1,25.5},{30,25.5},{30,92},{-60,92},{-60,63.7778},{-49.5,63.7778}},
                                                                    color={0,0,
          127}));
  connect(sTAB2A.VOTHSG, sCRX.VOTHSG) annotation (Line(points={{-16.0455,-48.5},{8,-48.5},{8,-39.0278},{31,-39.0278}},
                                                 color={0,0,127}));
  connect(gENROU.PELEC, sTAB2A.PELEC) annotation (Line(points={{9.1,18.9},{18,18.9},{18,-32},{-68,-32},{-68,-48.5},{-60.4136,-48.5}},
                                                                  color={0,0,
          127}));
  connect(sCRX.EFD, gENROU.EFD) annotation (Line(points={{87.375,-55.7778},{92,-55.7778},{92,-96},{-80,-96},{-80,-7.5},{-62.2,-7.5}},
                                                                  color={0,0,
          127}));
  connect(cte.y, sCRX.VUEL) annotation (Line(points={{0.5,-58},{16,-58},{16,-93},
          {40.625,-93}}, color={0,0,127}));
  connect(gENROU.XADIFD, sCRX.XADIFD) annotation (Line(points={{8.48,-20.7},{14,-20.7},{14,-92.2556},{70.875,-92.2556}},
                                               color={0,0,127}));
  connect(gENROU.ETERM, sCRX.ECOMP) annotation (Line(points={{9.1,-0.9},{26,-0.9},{26,-55.7778},{31,-55.7778}},
                                              color={0,0,127}));
  connect(gENROU.EFD0, sCRX.EFD0) annotation (Line(points={{9.1,-7.5},{22,-7.5},{22,-79.9722},{31,-79.9722}},
                                        color={0,0,127}));
  connect(sCRX.VOEL, cte.y) annotation (Line(points={{48.875,-93},{10,-93},{10,
          -58},{0.5,-58}}, color={0,0,127}));
  annotation (
    Icon(graphics={Line(
          points={{-76,-26},{-28,52},{27,-52},{74,23}},
          color={0,0,255},
          smooth=Smooth.Bezier),Ellipse(extent={{-100,-100},{101,100}},
          lineColor={0,0,255})}));
end Gen4_bus_3359;
