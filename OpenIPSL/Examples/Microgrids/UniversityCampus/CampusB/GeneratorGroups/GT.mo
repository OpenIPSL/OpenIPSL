within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusB.GeneratorGroups;
package GT "Gas turbine unit for Microgrid B."
  model GasTurbineUnit
    "Generation group for GT containing the synchronous machine, excitation system, and turbine governor system."
    extends OpenIPSL.Interfaces.Generator;
    Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(
          extent={{6,6},{-6,-6}},
          rotation=180,
          origin={-84,-32})));
    replaceable Electrical.Machines.PSSE.GENROE          machine(
      V_b=V_b,
      Tpd0=gUData.guDynamics.machine.Tpd0,
      Tppd0=gUData.guDynamics.machine.Tppd0,
      Tpq0=gUData.guDynamics.machine.Tpq0,
      Tppq0=gUData.guDynamics.machine.Tppq0,
      D=gUData.guDynamics.machine.D,
      Xd=gUData.guDynamics.machine.Xd,
      Xq=gUData.guDynamics.machine.Xq,
      Xpd=gUData.guDynamics.machine.Xpd,
      Xpq=gUData.guDynamics.machine.Xpq,
      Xppd=gUData.guDynamics.machine.Xppd,
      Xl=gUData.guDynamics.machine.Xl,
      S10=gUData.guDynamics.machine.S10,
      S12=gUData.guDynamics.machine.S12,
      angle_0=angle_0,
      Xppq=gUData.guDynamics.machine.Xppq,
      R_a=gUData.guDynamics.machine.R_a,
      Xpp=gUData.guDynamics.machine.Xpp,
      H=gUData.guDynamics.machine.H,
      M_b=gUData.guDynamics.machine.M_b,
      P_0=P_0,
      Q_0=Q_0,
      v_0=v_0) constrainedby
      OpenIPSL.Electrical.Machines.PSSE.BaseClasses.baseMachine
      annotation (choicesAllMatching=true,
                  Placement(transformation(extent={{20,-20},{60,20}})));
    replaceable Electrical.Controls.PSSE.TG.GAST                     governor(
      R=gUData.guDynamics.tg.R,
      T_1=gUData.guDynamics.tg.T_1,
      T_2=gUData.guDynamics.tg.T_2,
      T_3=gUData.guDynamics.tg.T_3,
      AT=gUData.guDynamics.tg.AT,
      K_T=gUData.guDynamics.tg.K_T,
      V_MAX=gUData.guDynamics.tg.V_MAX,
      V_MIN=gUData.guDynamics.tg.V_MIN,
      D_turb=gUData.guDynamics.tg.D_turb)
      constrainedby Electrical.Controls.PSSE.TG.BaseClasses.BaseGovernor
      annotation (Placement(transformation(extent={{-54,20},{-14,60}})));
    replaceable Electrical.Controls.PSSE.ES.EXAC1                   baseExciter(
      T_R=gUData.guDynamics.excSystem.T_R,
      T_B=gUData.guDynamics.excSystem.T_B,
      T_C=gUData.guDynamics.excSystem.T_C,
      K_A=gUData.guDynamics.excSystem.K_A,
      T_A=gUData.guDynamics.excSystem.T_A,
      V_RMAX=gUData.guDynamics.excSystem.V_RMAX,
      V_RMIN=gUData.guDynamics.excSystem.V_RMIN,
      T_E=gUData.guDynamics.excSystem.T_E,
      K_F=gUData.guDynamics.excSystem.K_F,
      T_F=gUData.guDynamics.excSystem.T_F,
      K_C=gUData.guDynamics.excSystem.K_C,
      K_D=gUData.guDynamics.excSystem.K_D,
      K_E=gUData.guDynamics.excSystem.K_E,
      E_1=gUData.guDynamics.excSystem.E_1,
      E_2=gUData.guDynamics.excSystem.E_2,
      S_EE_1=gUData.guDynamics.excSystem.S_EE_1,
      S_EE_2=gUData.guDynamics.excSystem.S_EE_2)
      constrainedby Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter
      annotation (Placement(transformation(extent={{-54,-60},{-14,-20}})));
    DynParamRecords.GUDynamics gUData(redeclare record GUnitDynamics =
          OpenIPSL.Examples.Microgrids.UniversityCampus.CampusB.GeneratorGroups.DynParamRecords.GT)
      annotation (Placement(transformation(extent={{-92,-4},{-72,16}})));
  equation
    connect(zero.y, baseExciter.VOTHSG)
      annotation (Line(points={{-77.4,-32},{-56,-32}}, color={0,0,127}));
    connect(baseExciter.VUEL, zero.y) annotation (Line(points={{-42,-62},{-42,-70},
            {-62,-70},{-62,-32},{-77.4,-32}}, color={0,0,127}));
    connect(baseExciter.VOEL, zero.y) annotation (Line(points={{-34,-62},{-34,-70},
            {-62,-70},{-62,-32},{-77.4,-32}}, color={0,0,127}));
    connect(machine.PMECH, governor.PMECH) annotation (Line(points={{16,12},{-2,12},
            {-2,40},{-12,40}}, color={0,0,127}));
    connect(machine.EFD, baseExciter.EFD) annotation (Line(points={{16,-12},{-2,-12},
            {-2,-40},{-12,-40}}, color={0,0,127}));
    connect(machine.SPEED, governor.SPEED) annotation (Line(points={{62,14},{80,14},
            {80,78},{-70,78},{-70,52},{-50,52}}, color={0,0,127}));
    connect(machine.PMECH0, governor.PMECH0) annotation (Line(points={{62,10},{88,
            10},{88,84},{-78,84},{-78,28},{-50,28}}, color={0,0,127}));
    connect(machine.p, pwPin)
      annotation (Line(points={{60,0},{110,0}}, color={0,0,255}));
    connect(machine.XADIFD, baseExciter.XADIFD) annotation (Line(points={{62,-18},
            {74,-18},{74,-72},{-18,-72},{-18,-62}}, color={0,0,127}));
    connect(machine.EFD0, baseExciter.EFD0) annotation (Line(points={{62,-10},{82,
            -10},{82,-80},{-66,-80},{-66,-48},{-56,-48}}, color={0,0,127}));
    connect(machine.ETERM, baseExciter.ECOMP) annotation (Line(points={{62,-6},{90,
            -6},{90,-88},{-72,-88},{-72,-40},{-56,-40}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
                                     Diagram(coordinateSystem(preserveAspectRatio=
             false)));
  end GasTurbineUnit;
end GT;
