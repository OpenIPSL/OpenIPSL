within OpenIPSL.Examples.Microgrids.IEEEMicrogrid;
model IEEEMicrogrid "IEEE Microgrid Model"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Buses.Bus Bus4(
    V_b=400,
    v_0=PF_results.voltages.V4,
    angle_0=PF_results.voltages.A4,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=0,
        origin={140,100})));
  OpenIPSL.Electrical.Branches.PwLine substation_line_2(
    R=0.0785/2,
    X=0.0818/2,
    G=0,
    B=0)                                                annotation (Placement(
        transformation(
        extent={{-12,-12},{12,12}},
        rotation=180,
        origin={90,120})));
  OpenIPSL.Electrical.Buses.Bus Bus3(
    V_b=400,
    v_0=PF_results.voltages.V3,
    angle_0=PF_results.voltages.A3,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=0,
        origin={40,100})));
  OpenIPSL.Electrical.Branches.PwLine substation_line_1(
    R=0.04257/2,
    X=0.0796/2,
    G=0,
    B=0)                                                annotation (Placement(
        transformation(
        extent={{-12,-12},{12,12}},
        rotation=180,
        origin={-10,120})));
  OpenIPSL.Electrical.Buses.Bus Bus2(
    V_b=400,
    v_0=PF_results.voltages.V2,
    angle_0=PF_results.voltages.A2,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=0,
        origin={-60,100})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer Transformer(
    CZ=1,
    R=0,
    X=0.057,
    G=0,
    B=0,
    CW=1,
    VB1=11000,
    VB2=400)
          annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-100,100})));
  OpenIPSL.Electrical.Buses.Bus Bus1(
    V_b=11000,
    v_0=PF_results.voltages.V1,
    angle_0=PF_results.voltages.A1,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=0,
        origin={-140,100})));
  OpenIPSL.Electrical.Machines.PSSE.GENCLS GRID(
    V_b=11000,
    R_a=0,
    X_d=1)
    annotation (Placement(transformation(extent={{-250,80},{-210,120}})));

  inner OpenIPSL.Electrical.SystemBase SysData(fn=60)
    annotation (Placement(transformation(extent={{-208,160},{-156,180}})));
  OpenIPSL.Electrical.Events.PwFault Fault1(
    R=0.01,
    X=0.1,
    t1=1000,
    t2=1001) annotation (Placement(transformation(extent={{-20,140},{0,160}})));
  OpenIPSL.Electrical.Events.PwFault Fault2(
    R=0.5,
    X=0.5,
    t1=1000,
    t2=1001) annotation (Placement(transformation(extent={{80,140},{100,160}})));
  OpenIPSL.Electrical.Branches.PwLine substation_line_3(
    R=0.0785/2,
    X=0.0818/2,
    G=0,
    B=0)                                                annotation (Placement(
        transformation(
        extent={{-12,-12},{12,12}},
        rotation=180,
        origin={90,80})));
  OpenIPSL.Electrical.Branches.PwLine substation_line_4(
    R=0.04257/2,
    X=0.0796/2,
    G=0,
    B=0)                                                annotation (Placement(
        transformation(
        extent={{-12,-12},{12,12}},
        rotation=180,
        origin={-10,80})));
  OpenIPSL.Electrical.Loads.PSSE.Load load(
    V_b=400,
    P_0(displayUnit="kW") = PF_results.loads.P1,
    Q_0(displayUnit="kvar") = PF_results.loads.Q1,
    v_0=PF_results.voltages.V5,
    angle_0=PF_results.voltages.A5)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-10,-150})));
  OpenIPSL.Electrical.Banks.PSSE.Shunt capacitor_bank(G=0, B=0.02/4)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-190,-150})));
  OpenIPSL.Electrical.Banks.PSSE.Shunt capacitor_bank1(G=0, B=0.02/4)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-150,-150})));
  OpenIPSL.Electrical.Banks.PSSE.Shunt capacitor_bank2(G=0, B=0.02/4)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-150})));
  OpenIPSL.Electrical.Banks.PSSE.Shunt capacitor_bank3(G=0, B=0.02/4)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,-150})));
  GeneratorGroups.DieselGeneratorUnit Diesel(
    P_0(displayUnit="kW") = PF_results.machines.PDT,
    Q_0=PF_results.machines.QDT,
    v_0=PF_results.voltages.V4,
    angle_0=PF_results.voltages.A4) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={230,100})));
  Electrical.Buses.Bus Bus5(
    V_b=400,
    v_0=PF_results.voltages.V5,
    angle_0=PF_results.voltages.A5,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={-130,-70})));
  Electrical.Buses.Bus Bus6(
    V_b=400,
    v_0=PF_results.voltages.V6,
    angle_0=PF_results.voltages.A6,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={-10,-70})));
  Electrical.Branches.PwLine LoadLine(
    R=0.2686,
    X=0.089300,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=270,
        origin={-10,0})));
  Electrical.Events.Breaker BreakerGrid(enableTrigger=false) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-170,100})));
  inner Data.PF_results PF_results(
    redeclare record Voltages =
        OpenIPSL.Examples.Microgrids.IEEEMicrogrid.Data.VoltagesMicrogrid,
    redeclare record Machines =
        OpenIPSL.Examples.Microgrids.IEEEMicrogrid.Data.MachinesMicrogrid,
    redeclare record Loads =
        OpenIPSL.Examples.Microgrids.IEEEMicrogrid.Data.LoadsMicrogrid)
    annotation (Placement(transformation(extent={{-242,160},{-218,184}})));
  Electrical.Branches.PwLine LoadLine1(
    R=0.2686,
    X=0.089300,
    G=0,
    B=0) annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=270,
        origin={140,-2})));
  Electrical.Buses.Bus Bus7(
    V_b=400,
    v_0=PF_results.voltages.V7,
    angle_0=PF_results.voltages.A7,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=90,
        origin={140,-70})));
  Electrical.Controls.VariableSpeedDrive.PowerElectronics.AC2DCandDC2AC
    aC2DCandDC2AC(
    V_b=400,
    v_0=PF_results.voltages.V7,
    angle_0=PF_results.voltages.A7,
    Rdc=0.01,
    Cdc=0.000001,
    m0=0.095)
    annotation (Placement(transformation(extent={{100,-120},{80,-100}})));
  Electrical.Controls.VariableSpeedDrive.ControllerLogic.VoltsHertzController
    voltsHertzController(
    V_b=400,
    f_max=80,
    f_min=0,
    m0=0.095,
    Kp=0.5,
    Ki=0.2)
    annotation (Placement(transformation(extent={{100,-160},{80,-140}})));
  Electrical.Machines.PSSE.CIM5 Motor1(
    V_b=400,
    M_b=50000,
    Sup=true,
    T_nom=0.4,
    D=1)
    annotation (Placement(transformation(extent={{40,-120},{60,-100}})));
  Modelica.Blocks.Sources.Ramp Sync_Speed(
    height=0.9*1.9*Modelica.Constants.pi*SysData.fn,
    duration=3,
    offset=0.1*1.9*Modelica.Constants.pi*SysData.fn,
    startTime=0)
    annotation (Placement(transformation(extent={{140,-160},{120,-140}})));
  Electrical.Renewables.PSSE.PV PV(
    M_b(displayUnit="V.A") = 80000,
    V_b=400,
    P_0=PF_results.machines.PPV,
    Q_0=PF_results.machines.QPV,
    v_0=PF_results.voltages.V4,
    angle_0=PF_results.voltages.A4,
    QFunctionality=0,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1
      RenewableGenerator,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECB1
      RenewableController,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.PlantController.REPCA1
      PlantController)
    annotation (Placement(transformation(extent={{240,120},{220,140}})));
  Electrical.Renewables.PSSE.BESS BESS(
    M_b(displayUnit="V.A") = 50000,
    V_b=400,
    P_0=PF_results.machines.PBESS,
    Q_0=PF_results.machines.QBESS,
    v_0=PF_results.voltages.V4,
    angle_0=PF_results.voltages.A4,
    QFunctionality=0,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.REGCA1
      RenewableGenerator,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECCU1
      RenewableController,
    redeclare OpenIPSL.Electrical.Renewables.PSSE.PlantController.REPCA1
      PlantController)
    annotation (Placement(transformation(extent={{240,60},{220,80}})));
  Electrical.Buses.Bus BusGrid(
    V_b=11000,
    v_0=PF_results.voltages.V1,
    angle_0=PF_results.voltages.A1,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=0,
        origin={-196,100})));
  Electrical.Controls.VariableSpeedDrive.PowerElectronics.AC2DCandDC2AC
    aC2DCandDC2AC1(
    V_b=400,
    v_0=PF_results.voltages.V7,
    angle_0=PF_results.voltages.A7,
    Rdc=0.01,
    Cdc=0.000001,
    m0=0.095)
    annotation (Placement(transformation(extent={{214,-120},{194,-100}})));
  Electrical.Controls.VariableSpeedDrive.ControllerLogic.VoltsHertzController
    voltsHertzController1(
    V_b=400,
    f_max=80,
    f_min=0,
    m0=0.095,
    Kp=0.5,
    Ki=0.2)
    annotation (Placement(transformation(extent={{214,-160},{194,-140}})));
  Electrical.Machines.PSSE.CIM5 Motor2(
    V_b=400,
    M_b=50000,
    Sup=true,
    T_nom=0.4,
    D=1)
    annotation (Placement(transformation(extent={{154,-120},{174,-100}})));
  Modelica.Blocks.Sources.Ramp Sync_Speed1(
    height=0.9*1.9*Modelica.Constants.pi*SysData.fn,
    duration=3,
    offset=0.1*1.9*Modelica.Constants.pi*SysData.fn,
    startTime=0)
    annotation (Placement(transformation(extent={{254,-160},{234,-140}})));
equation
  connect(substation_line_2.p, Bus4.p) annotation (Line(points={{100.8,120},{
          118,120},{118,100},{140,100}}, color={0,0,255}));
  connect(substation_line_3.p, Bus4.p) annotation (Line(points={{100.8,80},{118,
          80},{118,100},{140,100}}, color={0,0,255}));
  connect(substation_line_2.n, Bus3.p) annotation (Line(points={{79.2,120},{62,
          120},{62,100},{40,100}}, color={0,0,255}));
  connect(substation_line_3.n, Bus3.p) annotation (Line(points={{79.2,80},{62,
          80},{62,100},{40,100}}, color={0,0,255}));
  connect(Fault2.p, Bus3.p) annotation (Line(points={{78.3333,150},{56,150},{56,
          100},{40,100}}, color={0,0,255}));
  connect(substation_line_1.p, Bus3.p) annotation (Line(points={{0.8,120},{18,
          120},{18,100},{40,100}}, color={0,0,255}));
  connect(substation_line_4.p, Bus3.p) annotation (Line(points={{0.8,80},{18,80},
          {18,100},{40,100}}, color={0,0,255}));
  connect(substation_line_1.n, Bus2.p) annotation (Line(points={{-20.8,120},{-38,
          120},{-38,100},{-60,100}}, color={0,0,255}));
  connect(substation_line_4.n, Bus2.p) annotation (Line(points={{-20.8,80},{-38,
          80},{-38,100},{-60,100}}, color={0,0,255}));
  connect(Fault1.p, Bus2.p) annotation (Line(points={{-21.6667,150},{-46,150},{
          -46,100},{-60,100}}, color={0,0,255}));
  connect(Diesel.pwPin, Bus4.p)
    annotation (Line(points={{219,100},{140,100}}, color={0,0,255}));
  connect(Bus5.p, Bus4.p) annotation (Line(points={{-130,-70},{-130,60},{140,60},
          {140,100}}, color={0,0,255}));
  connect(load.p, Bus6.p)
    annotation (Line(points={{-10,-140},{-10,-70}}, color={0,0,255}));
  connect(Bus6.p, LoadLine.n)
    annotation (Line(points={{-10,-70},{-10,-10.8}}, color={0,0,255}));
  connect(BreakerGrid.r, Bus1.p)
    annotation (Line(points={{-160,100},{-140,100}}, color={0,0,255}));
  connect(LoadLine.p, Bus4.p) annotation (Line(points={{-10,10.8},{-10,60},{140,
          60},{140,100}}, color={0,0,255}));
  connect(LoadLine1.p, Bus4.p)
    annotation (Line(points={{140,8.8},{140,100}}, color={0,0,255}));
  connect(LoadLine1.n, Bus7.p)
    annotation (Line(points={{140,-12.8},{140,-70}}, color={0,0,255}));
  connect(voltsHertzController.Vc, aC2DCandDC2AC.Vc)
    annotation (Line(points={{96,-138},{96,-122}}, color={0,0,127}));
  connect(voltsHertzController.m, aC2DCandDC2AC.m_input)
    annotation (Line(points={{84,-138},{84,-122}}, color={0,0,127}));
  connect(Motor1.wr, voltsHertzController.motor_speed)
    annotation (Line(points={{56,-122},{56,-146},{78,-146}}, color={0,0,127}));
  connect(voltsHertzController.we, Motor1.we)
    annotation (Line(points={{78,-154},{44,-154},{44,-122}}, color={0,0,127}));
  connect(Motor1.p, aC2DCandDC2AC.n)
    annotation (Line(points={{60,-110},{80,-110}}, color={0,0,255}));
  connect(Sync_Speed.y, voltsHertzController.W_ref)
    annotation (Line(points={{119,-150},{102,-150}}, color={0,0,127}));
  connect(BESS.pwPin, Bus4.p) annotation (Line(points={{220,70},{180,70},{180,
          100},{140,100}}, color={0,0,255}));
  connect(PV.pwPin, Bus4.p) annotation (Line(points={{220,130},{180,130},{180,
          100},{140,100}}, color={0,0,255}));
  connect(Bus1.p, Transformer.p)
    annotation (Line(points={{-140,100},{-122,100}}, color={0,0,255}));
  connect(Transformer.n, Bus2.p)
    annotation (Line(points={{-78,100},{-60,100}}, color={0,0,255}));
  connect(BusGrid.p, BreakerGrid.s)
    annotation (Line(points={{-196,100},{-180,100}}, color={0,0,255}));
  connect(BusGrid.p, GRID.p)
    annotation (Line(points={{-196,100},{-210,100}}, color={0,0,255}));
  connect(capacitor_bank.p, Bus5.p) annotation (Line(points={{-190,-140},{-190,-96},
          {-130,-96},{-130,-70}}, color={0,0,255}));
  connect(capacitor_bank1.p, Bus5.p) annotation (Line(points={{-150,-140},{-150,
          -110},{-130,-110},{-130,-70}}, color={0,0,255}));
  connect(capacitor_bank2.p, Bus5.p) annotation (Line(points={{-110,-140},{-110,
          -110},{-130,-110},{-130,-70}}, color={0,0,255}));
  connect(capacitor_bank3.p, Bus5.p) annotation (Line(points={{-70,-140},{-70,-96},
          {-130,-96},{-130,-70}}, color={0,0,255}));
  connect(aC2DCandDC2AC.p, Bus7.p) annotation (Line(points={{100,-110},{120,-110},
          {120,-90},{140,-90},{140,-70}},
                      color={0,0,255}));
  connect(voltsHertzController1.Vc, aC2DCandDC2AC1.Vc)
    annotation (Line(points={{210,-138},{210,-122}}, color={0,0,127}));
  connect(voltsHertzController1.m, aC2DCandDC2AC1.m_input)
    annotation (Line(points={{198,-138},{198,-122}}, color={0,0,127}));
  connect(Motor2.wr, voltsHertzController1.motor_speed) annotation (Line(
        points={{170,-122},{170,-146},{192,-146}}, color={0,0,127}));
  connect(voltsHertzController1.we, Motor2.we) annotation (Line(points={{192,-154},
          {158,-154},{158,-122}}, color={0,0,127}));
  connect(Motor2.p, aC2DCandDC2AC1.n)
    annotation (Line(points={{174,-110},{194,-110}}, color={0,0,255}));
  connect(Sync_Speed1.y, voltsHertzController1.W_ref)
    annotation (Line(points={{233,-150},{216,-150}}, color={0,0,127}));
  connect(aC2DCandDC2AC1.p, Bus7.p) annotation (Line(points={{214,-110},{240,-110},
          {240,-90},{140,-90},{140,-70}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-260,
            -200},{260,200}})),
                          Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-260,-200},{260,200}}), graphics={
        Text(
          extent={{-152,142},{-130,130}},
          textColor={28,108,200},
          textString="(1)"),
        Text(
          extent={{-72,142},{-50,130}},
          textColor={28,108,200},
          textString="(2)"),
        Text(
          extent={{28,142},{50,130}},
          textColor={28,108,200},
          textString="(3)"),
        Text(
          extent={{128,142},{150,130}},
          textColor={28,108,200},
          textString="(4)"),
        Text(
          extent={{6,-64},{28,-76}},
          textColor={28,108,200},
          textString="(6)"),
        Text(
          extent={{-116,-64},{-94,-76}},
          textColor={28,108,200},
          textString="(5)"),
        Text(
          extent={{158,-64},{180,-76}},
          textColor={28,108,200},
          textString="(7)")}),
    experiment(
      StopTime=20,
      __Dymola_NumberOfIntervals=1000,
      __Dymola_Algorithm="Dassl"),
    Documentation(info="<html>
<p>The IEEEMicrogrid example model was developed based on an example from the IEEE Technical Report <a href=\"modelica://OpenIPSL.UsersGuide.References\">[PES-TR66]</a>.
The microgrid has a total load of 60 kW, distributed equally among three load types: static, and two VSD (Variable Speed Drive) driven motors, 
each having a capacity of 20 kW. The static load follows a ZIP load model with a 0.85 lagging power factor, consisting of equal proportions of constant current, 
power, and impedance load. The VSD motor load represents a pump while the static load represents common building electrical loads.
The microgrid operates in grid-connected mode without exchanging active power with the main grid. The solar PV system generates 35 kW, the diesel generator produces 20 kW,
 and the battery energy storage system injects 5.5 kW to maintain power balance within the microgrid.</p>

</html>"));
end IEEEMicrogrid;
