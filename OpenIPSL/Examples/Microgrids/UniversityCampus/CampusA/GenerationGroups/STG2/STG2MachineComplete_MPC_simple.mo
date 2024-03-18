within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.STG2;
model STG2MachineComplete_MPC_simple
  "Generation group for STG2 containing the synchronous machine, excitation system, and turbine governor system."
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
  replaceable ModelPredictiveControl.GenerationUnits.SEXSMPC          exciter(
    T_E=guData.guDynamics.excSystem.T_E)
    constrainedby OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-28,-24},
            {10,10}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-40,-54},{-32,-46}})));
  replaceable ModelPredictiveControl.GenerationUnits.TGOVMPC     governor(
    R=guData.guDynamics.tg.R,
    D_t=guData.guDynamics.tg.D_t,
    T_1=guData.guDynamics.tg.T_1,
    T_2=guData.guDynamics.tg.T_2,
    T_3=guData.guDynamics.tg.T_3,
    V_MAX=guData.guDynamics.tg.V_MAX,
    V_MIN=guData.guDynamics.tg.V_MIN)
    constrainedby OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.BaseGovernor
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-30,40},
            {-10,60}})));
  DynParamRecords.GUDynamics guData(redeclare record GUnitDynamics =
        DynParamRecords.STG2)
    annotation (Placement(transformation(extent={{-80,-56},{-60,-36}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-70,34},{-50,54}})));
  Modelica.Blocks.Interfaces.RealInput Pm_ref
    "Connector of Real input signal 1" annotation (Placement(transformation(
          extent={{-140,40},{-100,80}}), iconTransformation(extent={{-140,40},{
            -100,80}})));
  Modelica.Blocks.Interfaces.RealInput E_ref annotation (Placement(
        transformation(extent={{-140,-80},{-100,-40}}), iconTransformation(
          extent={{-140,-80},{-100,-40}})));
equation
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

  connect(machine.p, pwPin)
    annotation (Line(points={{60,0},{110,0}}, color={0,0,255}));
  connect(exciter.VOEL, exciter.VUEL) annotation (Line(points={{-9,-25.7},{-9,
          -50},{-16.6,-50},{-16.6,-25.7}},
                                      color={0,0,127}));
  connect(add.u1,Pm_ref)
    annotation (Line(points={{-72,50},{-96,50},{-96,60},{-120,60}},
                                                  color={0,0,127}));
  connect(add.u2, machine.PMECH0) annotation (Line(points={{-72,38},{-80,38},{
          -80,30},{76,30},{76,5},{61,5}}, color={0,0,127}));
  connect(add.y, governor.PMECH0)
    annotation (Line(points={{-49,44},{-28,44}}, color={0,0,127}));
  connect(E_ref, exciter.EFd_input) annotation (Line(points={{-120,-60},{-88,
          -60},{-88,6.6},{-29.9,6.6}}, color={0,0,127}));
  connect(exciter.VOTHSG, const.y) annotation (Line(points={{-29.9,-0.2},{-48,
          -0.2},{-48,-42},{-24,-42},{-24,-50},{-31.6,-50}}, color={0,0,127}));
end STG2MachineComplete_MPC_simple;
