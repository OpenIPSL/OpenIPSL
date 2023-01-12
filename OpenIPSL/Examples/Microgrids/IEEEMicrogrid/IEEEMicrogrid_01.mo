within OpenIPSL.Examples.Microgrids.IEEEMicrogrid;
model IEEEMicrogrid_01
  extends Modelica.Icons.Example;
  import MicroGrid;
  OpenIPSL.Electrical.Buses.Bus CENTRAL(
    V_b=400,
    v_0=pf_DATA.voltages.VCentral,
    angle_0=pf_DATA.voltages.ACentral,
    displayPF=false)
                    annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=0,
        origin={-140,280})));
  OpenIPSL.Electrical.Branches.PwLine load_line(
    R=0.2686,
    X=0.089300,
    G=0,
    B=0)                                        annotation (Placement(
        transformation(
        extent={{-12,-12},{12,12}},
        rotation=180,
        origin={230,-60})));
  OpenIPSL.Electrical.Buses.Bus LOAD_bus(
    V_b=400,
    v_0=1,
    angle_0=0,
    displayPF=true)               annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=0,
        origin={280,-60})));
  OpenIPSL.Electrical.Branches.PwLine substation_line_2(
    R=0.0785/2,
    X=0.0818/2,
    G=0,
    B=0)                                                annotation (Placement(
        transformation(
        extent={{-12,-12},{12,12}},
        rotation=180,
        origin={-190,300})));
  OpenIPSL.Electrical.Buses.Bus SUBSTATION(
    V_b=400,
    v_0=pf_DATA.voltages.VSb,
    angle_0=pf_DATA.voltages.ASb,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=0,
        origin={-240,280})));
  OpenIPSL.Electrical.Branches.PwLine substation_line_1(
    R=0.04257/2,
    X=0.0796/2,
    G=0,
    B=0)                                                annotation (Placement(
        transformation(
        extent={{-12,-12},{12,12}},
        rotation=180,
        origin={-290,300})));
  OpenIPSL.Electrical.Buses.Bus LVBus(
    V_b=400,
    v_0=pf_DATA.voltages.VGrid,
    angle_0=pf_DATA.voltages.AGrid,
    displayPF=false) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=0,
        origin={-340,280})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer Transformer(
    CZ=1,
    R=0,
    X=0.057,
    G=0,
    B=0,
    CW=1) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={-380,280})));
  OpenIPSL.Electrical.Buses.Bus HVBus(
    V_b=11000,
    v_0=pf_DATA.voltages.VGrid,
    angle_0=pf_DATA.voltages.AGrid,
    displayPF=true) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=0,
        origin={-420,280})));
  OpenIPSL.Electrical.Machines.PSSE.GENCLS GRID(
    V_b=11000,
    v_0=pf_DATA.voltages.VGrid,
    angle_0=pf_DATA.voltages.AGrid,
    P_0=160150.6,
    Q_0=-82900,
    R_a=0.01,
    X_d=0.1)
    annotation (Placement(transformation(extent={{-500,260},{-460,300}})));

  inner OpenIPSL.Electrical.SystemBase SysData(fn=60)
    annotation (Placement(transformation(extent={{-320,-260},{-180,-180}})));
    //Q_0=pf_results.machines.Q1_1,
    //P_0=pf_results.machines.P1_1,
  MicroGrid.Examples.BaseClasses.SMIB.Records.PF_050 pf_results
    annotation (Placement(transformation(extent={{-160,-242},{-100,-182}})));
  OpenIPSL.Electrical.Events.PwFault Fault1(
    R=0.5,
    X=0.5,
    t1=1000,
    t2=1001)
    annotation (Placement(transformation(extent={{-300,200},{-280,220}})));
  OpenIPSL.Electrical.Events.PwFault Fault2(
    R=0.5,
    X=0.5,
    t1=1000,
    t2=1001)
    annotation (Placement(transformation(extent={{-200,200},{-180,220}})));
  OpenIPSL.Electrical.Branches.PwLine substation_line_3(
    R=0.0785/2,
    X=0.0818/2,
    G=0,
    B=0)                                                annotation (Placement(
        transformation(
        extent={{-12,-12},{12,12}},
        rotation=180,
        origin={-190,260})));
  OpenIPSL.Electrical.Branches.PwLine substation_line_4(
    R=0.04257/2,
    X=0.0796/2,
    G=0,
    B=0)                                                annotation (Placement(
        transformation(
        extent={{-12,-12},{12,12}},
        rotation=180,
        origin={-290,260})));
  OpenIPSL.Electrical.Loads.PSSE.Load load(
    V_b=400,
    P_0=15000000,
    Q_0=1000000)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=90,
        origin={460,-60})));
  MicroGrid.Examples.SystemExamples.Data.Records.pf_DATA pf_DATA
    annotation (Placement(transformation(extent={{-62,-240},{0,-186}})));
  OpenIPSL.Electrical.Banks.PSSE.Shunt capacitor_bank(G=0, B=0.02/4)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={450,-248})));
  OpenIPSL.Electrical.Events.Breaker breaker(enableTrigger=false)
    annotation (Placement(transformation(extent={{400,-258},{420,-238}})));
  OpenIPSL.Electrical.Banks.PSSE.Shunt capacitor_bank1(G=0, B=0.02/4)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={450,-218})));
  OpenIPSL.Electrical.Events.Breaker breaker1(enableTrigger=false)
    annotation (Placement(transformation(extent={{400,-228},{420,-208}})));
  OpenIPSL.Electrical.Banks.PSSE.Shunt capacitor_bank2(G=0, B=0.02/4)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={450,-188})));
  OpenIPSL.Electrical.Events.Breaker breaker2(enableTrigger=false)
    annotation (Placement(transformation(extent={{400,-198},{420,-178}})));
  OpenIPSL.Electrical.Banks.PSSE.Shunt capacitor_bank3(G=0, B=0.02/4)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={450,-158})));
  OpenIPSL.Electrical.Events.Breaker breaker3(enableTrigger=false)
    annotation (Placement(transformation(extent={{400,-168},{420,-148}})));
equation
  connect(Transformer.p, LVBus.p)
    annotation (Line(points={{-358,280},{-340,280}}, color={0,0,255}));
  connect(Transformer.n, HVBus.p)
    annotation (Line(points={{-402,280},{-420,280}}, color={0,0,255}));
  connect(GRID.p, HVBus.p)
    annotation (Line(points={{-460,280},{-420,280}}, color={0,0,255}));
  connect(load_line.p, LOAD_bus.p)
    annotation (Line(points={{240.8,-60},{280,-60}}, color={0,0,255}));
  connect(substation_line_2.p, CENTRAL.p) annotation (Line(points={{-179.2,300},
          {-170,300},{-170,280},{-140,280}},
                                     color={0,0,255}));
  connect(substation_line_3.p, CENTRAL.p) annotation (Line(points={{-179.2,260},
          {-170,260},{-170,280},{-140,280}},
                                     color={0,0,255}));
  connect(substation_line_2.n, SUBSTATION.p) annotation (Line(points={{-200.8,
          300},{-214,300},{-214,280},{-240,280}}, color={0,0,255}));
  connect(substation_line_3.n, SUBSTATION.p) annotation (Line(points={{-200.8,
          260},{-214,260},{-214,280},{-240,280}}, color={0,0,255}));
  connect(Fault2.p, SUBSTATION.p) annotation (Line(points={{-201.667,210},{-214,
          210},{-214,280},{-240,280}}, color={0,0,255}));
  connect(substation_line_1.p, SUBSTATION.p) annotation (Line(points={{-279.2,
          300},{-270,300},{-270,280},{-240,280}}, color={0,0,255}));
  connect(substation_line_4.p, SUBSTATION.p) annotation (Line(points={{-279.2,
          260},{-270,260},{-270,280},{-240,280}}, color={0,0,255}));
  connect(substation_line_1.n, LVBus.p) annotation (Line(points={{-300.8,300},{
          -314,300},{-314,280},{-340,280}}, color={0,0,255}));
  connect(substation_line_4.n, LVBus.p) annotation (Line(points={{-300.8,260},{
          -314,260},{-314,280},{-340,280}}, color={0,0,255}));
  connect(load.p, LOAD_bus.p)
    annotation (Line(points={{440,-60},{280,-60}}, color={0,0,255}));
  connect(breaker.r,capacitor_bank. p)
    annotation (Line(points={{420,-248},{440,-248}}, color={0,0,255}));
  connect(breaker1.r,capacitor_bank1. p)
    annotation (Line(points={{420,-218},{440,-218}}, color={0,0,255}));
  connect(breaker3.r,capacitor_bank3. p)
    annotation (Line(points={{420,-158},{440,-158}}, color={0,0,255}));
  connect(breaker2.r,capacitor_bank2. p)
    annotation (Line(points={{420,-188},{440,-188}}, color={0,0,255}));
  connect(Fault1.p, LVBus.p) annotation (Line(points={{-301.667,210},{-314,210},
          {-314,280},{-340,280}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-540,
            -340},{540,340}})),
                          Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-540,-340},{540,340}}), graphics={
        Rectangle(
          extent={{320,-138},{480,-278}},
          lineColor={0,0,0},
          pattern=LinePattern.Dash,
          lineThickness=0.5),
        Text(
          extent={{378,-248},{476,-292}},
          lineColor={102,44,145},
          textString="Shunt Capacitor",
          textStyle={TextStyle.Bold,TextStyle.Italic}),
        Text(
          extent={{260,-136},{348,-150}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="(4)")}),
    experiment(
      StopTime=86400,
      __Dymola_NumberOfIntervals=1000,
      __Dymola_Algorithm="Dassl"));
end IEEEMicrogrid_01;
