within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusB.GeneratorGroups;
package ST "Steam turbine generation unit for Microgrid B."
  model SteamTurbineUnit
    "Generation group for ST containing the synchronous machine, excitation system, and turbine governor system."
      extends OpenIPSL.Interfaces.Generator(V_b = 13800);
    replaceable Electrical.Machines.PSSE.GENROE baseMachine(
      M_b=gUData.guDynamics.machine.M_b,
      Tpd0=gUData.guDynamics.machine.Tpd0,
      Tppd0=gUData.guDynamics.machine.Tppd0,
      Tppq0=gUData.guDynamics.machine.Tppq0,
      H=gUData.guDynamics.machine.H,
      D=gUData.guDynamics.machine.D,
      Xd=gUData.guDynamics.machine.Xd,
      Xq=gUData.guDynamics.machine.Xq,
      Xpd=gUData.guDynamics.machine.Xpd,
      Xppd=gUData.guDynamics.machine.Xppd,
      Xppq=gUData.guDynamics.machine.Xppq,
      Xl=gUData.guDynamics.machine.Xl,
      S10=gUData.guDynamics.machine.S10,
      S12=gUData.guDynamics.machine.S12,
      R_a=gUData.guDynamics.machine.R_a,
      Xpq=gUData.guDynamics.machine.Xpq,
      Tpq0=gUData.guDynamics.machine.Tpq0,
      Xpp=gUData.guDynamics.machine.Xpp) constrainedby
      Electrical.Machines.PSSE.BaseClasses.baseMachine
      annotation (Placement(transformation(extent={{40,-20},{80,20}})));
    replaceable Electrical.Controls.PSSE.ES.EXST1 baseExciter(
      T_R=gUData.guDynamics.excSystem.T_R,
      V_IMAX=gUData.guDynamics.excSystem.V_IMAX,
      V_IMIN=gUData.guDynamics.excSystem.V_IMIN,
      T_C=gUData.guDynamics.excSystem.T_C,
      T_B=gUData.guDynamics.excSystem.T_B,
      K_A=gUData.guDynamics.excSystem.K_A,
      T_A=gUData.guDynamics.excSystem.T_A,
      V_RMAX=gUData.guDynamics.excSystem.V_RMAX,
      V_RMIN=gUData.guDynamics.excSystem.V_RMIN,
      K_C=gUData.guDynamics.excSystem.K_C,
      K_F=gUData.guDynamics.excSystem.K_F,
      T_F=gUData.guDynamics.excSystem.T_F) constrainedby
      Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter
      annotation (Placement(transformation(extent={{-60,-60},{-20,-20}})));
    replaceable Electrical.Controls.PSSE.TG.TGOV1 baseGovernor(
      R=gUData.guDynamics.tg.R,
      D_t=gUData.guDynamics.tg.D_t,
      T_1=gUData.guDynamics.tg.T_1,
      T_2=gUData.guDynamics.tg.T_2,
      T_3=gUData.guDynamics.tg.T_3,
      V_MAX=gUData.guDynamics.tg.V_MAX,
      V_MIN=gUData.guDynamics.tg.V_MIN) constrainedby
      Electrical.Controls.PSSE.TG.BaseClasses.BaseGovernor
      annotation (Placement(transformation(extent={{-60,20},{-20,60}})));
    Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(
          extent={{6,6},{-6,-6}},
          rotation=180,
          origin={-84,-32})));
    DynParamRecords.GUDynamics gUData(redeclare record GUnitDynamics =
          OpenIPSL.Examples.Microgrids.UniversityCampus.CampusB.GeneratorGroups.DynParamRecords.ST)
      annotation (Placement(transformation(extent={{-92,-8},{-72,12}})));
  equation
    connect(baseMachine.p, pwPin)
      annotation (Line(points={{80,0},{110,0}}, color={0,0,255}));
    connect(baseExciter.EFD, baseMachine.EFD) annotation (Line(points={{-18,-40},{
            20,-40},{20,-12},{36,-12}}, color={0,0,127}));
    connect(baseGovernor.PMECH, baseMachine.PMECH) annotation (Line(points={{-18,40},
            {20,40},{20,12},{36,12}}, color={0,0,127}));
    connect(zero.y, baseExciter.VOTHSG)
      annotation (Line(points={{-77.4,-32},{-62,-32}}, color={0,0,127}));
    connect(baseExciter.VUEL, zero.y) annotation (Line(points={{-48,-62},{-48,-70},
            {-70,-70},{-70,-32},{-77.4,-32}}, color={0,0,127}));
    connect(baseExciter.VOEL, zero.y) annotation (Line(points={{-40,-62},{-40,-70},
            {-70,-70},{-70,-32},{-77.4,-32}}, color={0,0,127}));
    connect(baseMachine.XADIFD, baseExciter.XADIFD) annotation (Line(points={{82,-18},
            {86,-18},{86,-70},{-24,-70},{-24,-62}}, color={0,0,127}));
    connect(baseMachine.ETERM, baseExciter.ECOMP) annotation (Line(points={{82,-6},
            {96,-6},{96,-80},{-74,-80},{-74,-40},{-62,-40}}, color={0,0,127}));
    connect(baseMachine.EFD0, baseExciter.EFD0) annotation (Line(points={{82,-10},
            {92,-10},{92,-76},{-68,-76},{-68,-48},{-62,-48}}, color={0,0,127}));
    connect(baseMachine.SPEED, baseGovernor.SPEED) annotation (Line(points={{82,14},
            {90,14},{90,76},{-70,76},{-70,52},{-56,52}}, color={0,0,127}));
    connect(baseMachine.PMECH0, baseGovernor.PMECH0) annotation (Line(points={{82,
            10},{96,10},{96,84},{-76,84},{-76,28},{-56,28}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end SteamTurbineUnit;
end ST;
