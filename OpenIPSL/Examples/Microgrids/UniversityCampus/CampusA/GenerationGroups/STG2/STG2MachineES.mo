within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.STG2;
model STG2MachineES
  "Generation group for STG2 containing the synchronous machine and the excitation system"
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
  replaceable Electrical.Controls.PSSE.ES.AC7B                        exciter(
    T_R=guData.guDynamics.excSystem.T_R,
    K_PR=guData.guDynamics.excSystem.K_PR,
    K_IR=guData.guDynamics.excSystem.K_IR,
    K_DR=guData.guDynamics.excSystem.K_DR,
    T_DR=guData.guDynamics.excSystem.T_DR,
    V_RMAX=guData.guDynamics.excSystem.V_RMAX,
    V_RMIN=guData.guDynamics.excSystem.V_RMIN,
    K_PA=guData.guDynamics.excSystem.K_PA,
    K_IA=guData.guDynamics.excSystem.K_IA,
    V_AMIN=guData.guDynamics.excSystem.V_AMIN,
    V_AMAX=guData.guDynamics.excSystem.V_AMAX,
    K_P=guData.guDynamics.excSystem.K_P,
    K_L=guData.guDynamics.excSystem.K_L,
    T_E=guData.guDynamics.excSystem.T_E,
    K_C=guData.guDynamics.excSystem.K_C,
    K_D=guData.guDynamics.excSystem.K_D,
    K_E=guData.guDynamics.excSystem.K_E,
    K_F1=guData.guDynamics.excSystem.K_F1,
    K_F2=guData.guDynamics.excSystem.K_F2,
    K_F3=guData.guDynamics.excSystem.K_F3,
    T_F3=guData.guDynamics.excSystem.T_F3,
    V_EMIN=guData.guDynamics.excSystem.V_EMIN,
    V_FEMAX=guData.guDynamics.excSystem.V_FEMAX,
    E_1=guData.guDynamics.excSystem.E_1,
    S_EE_1=guData.guDynamics.excSystem.S_EE_1,
    E_2=guData.guDynamics.excSystem.E_2,
    S_EE_2=guData.guDynamics.excSystem.S_EE_2)
    constrainedby
    OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-28,-24},
            {10,10}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-40,-54},{-32,-46}})));
  replaceable OpenIPSL.Electrical.Controls.PSSE.TG.ConstantPower governor
    constrainedby
    OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.BaseGovernor
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-30,40},
            {-10,60}})));
  replaceable OpenIPSL.Electrical.Controls.PSSE.PSS.DisabledPSS         pss
    constrainedby OpenIPSL.Electrical.Controls.PSSE.PSS.BaseClasses.BasePSS
    annotation (choicesAllMatching=true,
    Placement(transformation(extent = {{-88, -6}, {-48, 12}})));
  DynParamRecords.GUDynamics guData(redeclare record GUnitDynamics =
        DynParamRecords.STG2)
    annotation (Placement(transformation(extent={{-80,-56},{-60,-36}})));
equation
  connect(pss.V_S2, governor.PMECH0) annotation (
    Line(points={{-90,-0.6},{-94,-0.6},{-94,30},{-40,30},{-40,44},{-28,44}},              color = {0, 0, 127}));
  connect(pss.V_S1, machine.SPEED) annotation (
    Line(points={{-90,6.6},{-98,6.6},{-98,68},{80,68},{80,7},{61,7}},                color = {0, 0, 127}));
  connect(pss.VOTHSG, exciter.VOTHSG) annotation (
    Line(points={{-46,3},{-40,3},{-40,-0.2},{-29.9,-0.2}},              color = {0, 0, 127}));
  connect(exciter.EFD, machine.EFD) annotation (Line(points={{11.9,-7},{38,-7},
          {38,-6}},                   color={0,0,127}));
  connect(exciter.XADIFD, machine.XADIFD) annotation (Line(points={{6.2,-25.7},
          {6.2,-30},{64,-30},{64,-9},{61,-9}},     color={0,0,127}));
  connect(machine.EFD0, exciter.EFD0) annotation (Line(points={{61,-5},{68,-5},
          {68,-34},{-36,-34},{-36,-13.8},{-29.9,-13.8}},         color={0,0,127}));
  connect(exciter.ECOMP, machine.ETERM) annotation (Line(points={{-29.9,-7},{
          -36,-7},{-36,20},{68,20},{68,-3},{61,-3}},        color={0,0,127}));
  connect(const.y, exciter.VUEL) annotation (Line(points={{-31.6,-50},{-16.6,
          -50},{-16.6,-25.7}},color={0,0,127}));
  connect(governor.PMECH, machine.PMECH) annotation (Line(points={{-9,50},{28,50},
          {28,6},{38,6}},       color={0,0,127}));
  connect(governor.SPEED, machine.SPEED) annotation (Line(points={{-28,56},{-40,
          56},{-40,68},{80,68},{80,7},{61,7}},       color={0,0,127}));
  connect(machine.PMECH0, governor.PMECH0) annotation (Line(points={{61,5},{74,5},
          {74,30},{-40,30},{-40,44},{-28,44}},         color={0,0,127}));

  connect(machine.p, pwPin)
    annotation (Line(points={{60,0},{110,0}}, color={0,0,255}));
  connect(exciter.VT, machine.ETERM) annotation (Line(points={{-30.09,6.43},{
          -36,6.43},{-36,20},{68,20},{68,-3},{61,-3}},
                                                   color={0,0,127}));
  connect(exciter.VOEL, exciter.VUEL) annotation (Line(points={{-9,-25.7},{-9,
          -50},{-16.6,-50},{-16.6,-25.7}},
                                      color={0,0,127}));
end STG2MachineES;
