within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.STG1;
model STG1MachineESVC
  "Generation group for STG1 containing the synchronous machine, excitation system and voltage compensator"
  extends OpenIPSL.Interfaces.Generator;

  replaceable OpenIPSL.Electrical.Machines.PSSE.GENROU machine(
    V_b=V_b,
    Tpd0=guData.guDynamics.machine.Tpd0,
    Tppd0=guData.guDynamics.machine.Tppd0,
    Tpq0=guData.guDynamics.machine.Tpq0,
    Tppq0=guData.guDynamics.machine.Tppq0,
    D=guData.guDynamics.machine.D,
    Xd=guData.guDynamics.machine.Xd,
    Xq=guData.guDynamics.machine.Xq,
    Xpd=guData.guDynamics.machine.Xpd,
    Xpq=guData.guDynamics.machine.Xpq,
    Xppd=guData.guDynamics.machine.Xppd,
    Xl=guData.guDynamics.machine.Xl,
    S10=guData.guDynamics.machine.S10,
    S12=guData.guDynamics.machine.S12,
    angle_0=angle_0,
    Xppq=guData.guDynamics.machine.Xppq,
    R_a=guData.guDynamics.machine.R_a,
    Xpp=guData.guDynamics.machine.Xpp,
    H=guData.guDynamics.machine.H,
    M_b=guData.guDynamics.machine.M_b,
    P_0=P_0,
    Q_0=Q_0,
    v_0=v_0) constrainedby
    OpenIPSL.Electrical.Machines.PSSE.BaseClasses.baseMachine
    annotation (choicesAllMatching=true,
                Placement(transformation(extent={{40,-10},
            {60,10}})));
  replaceable Electrical.Controls.PSSE.ES.ESST2A                      exciter(
    T_R=guData.guDynamics.excSystem.T_R,
    V_RMAX=guData.guDynamics.excSystem.V_RMAX,
    V_RMIN=guData.guDynamics.excSystem.V_RMIN,
    K_A=guData.guDynamics.excSystem.K_A,
    T_A=guData.guDynamics.excSystem.T_A,
    K_P=guData.guDynamics.excSystem.K_P,
    K_I=guData.guDynamics.excSystem.K_I,
    K_C=guData.guDynamics.excSystem.K_C,
    K_F=guData.guDynamics.excSystem.K_F,
    T_F=guData.guDynamics.excSystem.T_F,
    K_E=guData.guDynamics.excSystem.K_E,
    T_E=guData.guDynamics.excSystem.T_E,
    EFD_MAX=guData.guDynamics.excSystem.EFD_MAX)
    constrainedby
    OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-28,-24},
            {10,10}})));
  Modelica.Blocks.Sources.Constant const(k=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-32,-66},{-24,-58}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-40,-80},{-32,-72}})));
  replaceable OpenIPSL.Electrical.Controls.PSSE.TG.ConstantPower governor
    constrainedby
    OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.BaseGovernor
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-30,40},
            {-10,60}})));
  replaceable OpenIPSL.Electrical.Controls.PSSE.PSS.DisabledPSS         pss
    constrainedby OpenIPSL.Electrical.Controls.PSSE.PSS.BaseClasses.BasePSS
    annotation (choicesAllMatching=true,
    Placement(transformation(extent = {{-88, -6}, {-48, 12}})));
  Electrical.Controls.PSSE.VC.IEEEVC iEEEVC(RC=0, XC=0.05)
    annotation (Placement(transformation(extent={{44,-60},{18,-38}})));
  DynParamRecords.GUDynamics guData(redeclare record GUnitDynamics =
        OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.DynParamRecords.STG1)
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
equation
  connect(pss.V_S2, governor.PMECH0) annotation (
    Line(points={{-90,-0.6},{-94,-0.6},{-94,30},{-40,30},{-40,44},{-28,44}},              color = {0, 0, 127}));
  connect(pss.V_S1, machine.SPEED) annotation (
    Line(points={{-90,6.6},{-98,6.6},{-98,68},{80,68},{80,7},{61,7}},                color = {0, 0, 127}));
  connect(pss.VOTHSG, exciter.VOTHSG) annotation (
    Line(points={{-46,3},{-40,3},{-40,-0.2},{-29.9,-0.2}},              color = {0, 0, 127}));
  connect(exciter.EFD, machine.EFD) annotation (Line(points={{11.9,-7},{38,-7},{
          38,-6}},                    color={0,0,127}));
  connect(exciter.XADIFD, machine.XADIFD) annotation (Line(points={{6.2,-25.7},{
          6.2,-30},{64,-30},{64,-9},{61,-9}},      color={0,0,127}));
  connect(machine.EFD0, exciter.EFD0) annotation (Line(points={{61,-5},{68,-5},{
          68,-34},{-34,-34},{-34,-13.8},{-29.9,-13.8}},          color={0,0,127}));
  connect(const.y, exciter.VUEL) annotation (Line(points={{-23.6,-62},{-16.6,
          -62},{-16.6,-25.7}},color={0,0,127}));
  connect(const1.y, exciter.VOEL) annotation (Line(points={{-31.6,-76},{-9,-76},
          {-9,-25.7}},        color={0,0,127}));
  connect(governor.PMECH, machine.PMECH) annotation (Line(points={{-9,50},{28,50},
          {28,6},{38,6}},       color={0,0,127}));
  connect(governor.SPEED, machine.SPEED) annotation (Line(points={{-28,56},{-40,
          56},{-40,68},{80,68},{80,7},{61,7}},       color={0,0,127}));
  connect(machine.PMECH0, governor.PMECH0) annotation (Line(points={{61,5},{74,5},
          {74,30},{-40,30},{-40,44},{-28,44}},         color={0,0,127}));

  connect(exciter.Bus, pwPin) annotation (Line(points={{8.1,6.6},{20,6.6},{20,34},
          {86,34},{86,0},{110,0}}, color={0,0,255}));
  connect(machine.p, iEEEVC.Gen_terminal) annotation (Line(points={{60,0},{72,0},
          {72,-41.1429},{41.1111,-41.1429}}, color={0,0,255}));
  connect(iEEEVC.Bus, exciter.Gen_terminal) annotation (Line(points={{20.8889,
          -41.1429},{-38,-41.1429},{-38,6.6},{-26.1,6.6}}, color={0,0,255}));
  connect(iEEEVC.VCT, exciter.ECOMP) annotation (Line(points={{15.6889,-50.5714},
          {-42,-50.5714},{-42,-7},{-29.9,-7}}, color={0,0,127}));
end STG1MachineESVC;
