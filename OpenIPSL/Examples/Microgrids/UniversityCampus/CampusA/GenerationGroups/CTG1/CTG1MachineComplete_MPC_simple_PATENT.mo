within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusA.GenerationGroups.CTG1;
model CTG1MachineComplete_MPC_simple_PATENT
  "Generation group for CTG1 containing the synchronous machine, excitation system, voltage compensator, and turbine governor system."
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
    T_AT_B=2,
    T_B=guData.guDynamics.excSystem.T_A,
    K=50,
    E_MIN=0)
    constrainedby OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-28,-24},
            {10,10}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-40,-64},{-32,-56}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-28,-76},{-20,-68}})));
  replaceable ModelPredictiveControl.GenerationUnits.GASTMPC     governor(
    R=guData.guDynamics.tg.R,
    T_1=guData.guDynamics.tg.T_1,
    T_2=guData.guDynamics.tg.T_2,
    T_3=guData.guDynamics.tg.T_3,
    AT=guData.guDynamics.tg.AT,
    K_T=guData.guDynamics.tg.K_T,
    V_MAX=guData.guDynamics.tg.V_MAX,
    V_MIN=guData.guDynamics.tg.V_MIN,
    D_turb=guData.guDynamics.tg.D_turb)
    constrainedby OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.BaseGovernor
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-30,40},
            {-10,60}})));
  DynParamRecords.GUDynamics guData(redeclare record GUnitDynamics =
        DynParamRecords.CTG1)
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  Electrical.Controls.PSSE.VC.IEEEVC iEEEVC(RC=0, XC=0.05)
    annotation (Placement(transformation(extent={{44,-60},{18,-38}})));
  Modelica.Blocks.Interfaces.RealInput Pm_ref
    "Connector of Real input signal 1" annotation (Placement(transformation(
          extent={{-140,40},{-100,80}}), iconTransformation(extent={{-140,40},{
            -100,80}})));
  Modelica.Blocks.Interfaces.RealInput E_ref annotation (Placement(
        transformation(extent={{-140,-80},{-100,-40}}), iconTransformation(
          extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Continuous.Integrator integrator(
    k=0.01/3600,
    use_reset=true,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=0)
    annotation (Placement(transformation(extent={{-162,182},{-142,202}})));
  Modelica.Blocks.Math.Gain gain(k=0.1/3600)
    annotation (Placement(transformation(extent={{-162,224},{-142,244}})));
  Modelica.Blocks.Math.Add add2
    annotation (Placement(transformation(extent={{-120,202},{-100,222}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y=if time <
        30.01 then false else true)
    annotation (Placement(transformation(extent={{-164,158},{-156,168}})));
  Modelica.Blocks.Math.Add add(k1=-1, k2=+1) annotation (Placement(
        transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={-72,134})));
  Modelica.Blocks.Math.Gain PMU_rate(k=60)
    annotation (Placement(transformation(extent={{-62,108},{-52,118}})));
  Modelica.Blocks.Math.Add add3_1(k1=+1) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={-3,111})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-24,124},{-14,134}})));
  Modelica.Blocks.Sources.Constant const2(k=0)
    annotation (Placement(transformation(extent={{-44,138},{-34,148}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=if time < 30.01
         then true else false)
    annotation (Placement(transformation(extent={{-54,124},{-46,134}})));
  Modelica.Blocks.Math.Add add3_2(k1=+1, k2=+1) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={27,109})));
  Modelica.Blocks.Math.Gain PMU_rate1(k=1)
    annotation (Placement(transformation(extent={{8,108},{14,114}})));
  Modelica.Blocks.Logical.Switch switch2
    annotation (Placement(transformation(extent={{44,134},{54,144}})));
  Modelica.Blocks.Math.Add add3_3(k1=+1, k2=+1) annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=0,
        origin={33,161})));
  Modelica.Blocks.Logical.Switch switch3
    annotation (Placement(transformation(extent={{-4,156},{6,166}})));
  Modelica.Blocks.Interfaces.RealInput Ang_m
    "Connector of Real input signal 2" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-70,200})));
  Modelica.Blocks.Interfaces.RealInput Ang_g
    "Connector of Real input signal 2" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-30,200}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={20,120})));
equation
  connect(exciter.EFD, machine.EFD) annotation (Line(points={{11.9,-7},{38,-7},{
          38,-6}},                    color={0,0,127}));
  connect(exciter.XADIFD, machine.XADIFD) annotation (Line(points={{6.2,-25.7},{
          6.2,-30},{64,-30},{64,-9},{61,-9}},      color={0,0,127}));
  connect(machine.EFD0, exciter.EFD0) annotation (Line(points={{61,-5},{68,-5},{
          68,-34},{-34,-34},{-34,-13.8},{-29.9,-13.8}},          color={0,0,127}));
  connect(const.y, exciter.VUEL) annotation (Line(points={{-31.6,-60},{-16.6,
          -60},{-16.6,-25.7}},color={0,0,127}));
  connect(const1.y, exciter.VOEL) annotation (Line(points={{-19.6,-72},{-12,-72},
          {-12,-30},{-9,-30},{-9,-25.7}},
                              color={0,0,127}));
  connect(governor.PMECH, machine.PMECH) annotation (Line(points={{-9,50},{28,50},
          {28,6},{38,6}},       color={0,0,127}));

  connect(machine.p, iEEEVC.Gen_terminal) annotation (Line(points={{60,0},{74,0},
          {74,-41.1429},{41.1111,-41.1429}}, color={0,0,255}));
  connect(iEEEVC.VCT, exciter.ECOMP) annotation (Line(points={{15.6889,-50.5714},
          {-42,-50.5714},{-42,-7},{-29.9,-7}}, color={0,0,127}));
  connect(machine.p, pwPin)
    annotation (Line(points={{60,0},{110,0}}, color={0,0,255}));
  connect(Pm_ref, governor.PMECHControllable) annotation (Line(points={{-120,60},
          {-64,60},{-64,26},{-20,26},{-20,38}}, color={0,0,127}));
  connect(E_ref, exciter.EFd_input) annotation (Line(points={{-120,-60},{-90,
          -60},{-90,6.6},{-29.9,6.6}}, color={0,0,127}));
  connect(exciter.VOTHSG, const.y) annotation (Line(points={{-29.9,-0.2},{-50,
          -0.2},{-50,-46},{-22,-46},{-22,-60},{-31.6,-60}}, color={0,0,127}));
  connect(integrator.y,add2. u2) annotation (Line(points={{-141,192},{-134,192},
          {-134,206},{-122,206}},    color={0,0,127}));
  connect(gain.y,add2. u1) annotation (Line(points={{-141,234},{-132,234},{-132,
          218},{-122,218}},    color={0,0,127}));
  connect(booleanExpression1.y,integrator. reset) annotation (Line(points={{-155.6,
          163},{-146,163},{-146,180}},         color={255,0,255}));
  connect(PMU_rate.u,add. y) annotation (Line(points={{-63,113},{-72,113},{-72,
          129.6}},    color={0,0,127}));
  connect(switch1.y,add3_1. u1) annotation (Line(points={{-13.5,129},{-13.5,114},
          {-9,114}},    color={0,0,127}));
  connect(const2.y, switch1.u1) annotation (Line(points={{-33.5,143},{-28,143},
          {-28,133},{-25,133}}, color={0,0,127}));
  connect(booleanExpression.y,switch1. u2)
    annotation (Line(points={{-45.6,129},{-25,129}},
                                                 color={255,0,255}));
  connect(add3_1.y,PMU_rate1. u)
    annotation (Line(points={{2.5,111},{7.4,111}}, color={0,0,127}));
  connect(PMU_rate1.y,add3_2. u1) annotation (Line(points={{14.3,111},{14.3,112},
          {21,112}},         color={0,0,127}));
  connect(add3_2.y,switch2. u3) annotation (Line(points={{32.5,109},{38,109},{
          38,135},{43,135}},color={0,0,127}));
  connect(switch2.u2,booleanExpression. y) annotation (Line(points={{43,139},{
          -30,139},{-30,129},{-45.6,129}},color={255,0,255}));
  connect(switch3.u3,add3_1. y) annotation (Line(points={{-5,157},{-10,157},{
          -10,120},{6,120},{6,111},{2.5,111}},color={0,0,127}));
  connect(switch3.u2,booleanExpression. y) annotation (Line(points={{-5,161},{
          -24,161},{-24,140},{-30,140},{-30,129},{-45.6,129}},
                                                            color={255,0,
          255}));
  connect(switch3.y,add3_3. u2) annotation (Line(points={{6.5,161},{18,161},{18,
          158},{27,158}},          color={0,0,127}));
  connect(add3_3.y, governor.SPEED) annotation (Line(points={{38.5,161},{94,161},
          {94,82},{-46,82},{-46,56},{-28,56}}, color={0,0,127}));
  connect(switch2.y, governor.PMECH0) annotation (Line(points={{54.5,139},{74,
          139},{74,88},{-54,88},{-54,44},{-28,44}}, color={0,0,127}));
  connect(machine.PMECH0, add3_2.u2) annotation (Line(points={{61,5},{78,5},{78,
          68},{12,68},{12,106},{21,106}}, color={0,0,127}));
  connect(machine.PMECH0, switch2.u1) annotation (Line(points={{61,5},{88,5},{
          88,152},{34,152},{34,143},{43,143}}, color={0,0,127}));
  connect(add3_3.u1, machine.SPEED) annotation (Line(points={{27,164},{18,164},
          {18,40},{68,40},{68,7},{61,7}}, color={0,0,127}));
  connect(add3_1.u2, machine.SPEED) annotation (Line(points={{-9,108},{-20,108},
          {-20,94},{68,94},{68,7},{61,7}}, color={0,0,127}));
  connect(switch1.u3, add2.y) annotation (Line(points={{-25,125},{-88,125},{-88,
          212},{-99,212}}, color={0,0,127}));
  connect(PMU_rate.y, integrator.u) annotation (Line(points={{-51.5,113},{-36,
          113},{-36,96},{-184,96},{-184,192},{-164,192}}, color={0,0,127}));
  connect(gain.u, PMU_rate.y) annotation (Line(points={{-164,234},{-184,234},{
          -184,96},{-36,96},{-36,113},{-51.5,113}}, color={0,0,127}));
  connect(Ang_m, add.u2) annotation (Line(points={{-70,200},{-70,142},{-74.4,
          142},{-74.4,138.8}}, color={0,0,127}));
  connect(Ang_g, add.u1) annotation (Line(points={{-30,200},{-30,152},{-64,152},
          {-64,138.8},{-69.6,138.8}}, color={0,0,127}));
  connect(switch3.u1, const2.y) annotation (Line(points={{-5,165},{-28,165},{
          -28,143},{-33.5,143}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,180}})), Icon(
        coordinateSystem(extent={{-100,-100},{100,180}})));
end CTG1MachineComplete_MPC_simple_PATENT;
