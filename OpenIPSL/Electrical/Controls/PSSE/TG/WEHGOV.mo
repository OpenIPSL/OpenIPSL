within OpenIPSL.Electrical.Controls.PSSE.TG;
model WEHGOV "Woodward Electric Hydro Governor Model"
  //Governor Parameters
  parameter OpenIPSL.Types.ApparentPower S_b=100e6 "System base";
  parameter OpenIPSL.Types.ApparentPower M_b=100e6 "System base";
  parameter OpenIPSL.Types.PerUnit R_PERM_GATE=1 "Feedback Gate gain";
  parameter OpenIPSL.Types.PerUnit R_PERM_PE=1 "Pelec gain";
  parameter OpenIPSL.Types.Time T_PE=0.5 "Electrical power transducer time constant";
  parameter Integer M=1 "Feedback control switch";
  parameter OpenIPSL.Types.PerUnit SP_Band=0 "Speed deadband";
  parameter OpenIPSL.Types.PerUnit KP=3 "Governor proportional gain";
  parameter OpenIPSL.Types.TimeAging KI=0.36 "Governor integral gain";
  parameter OpenIPSL.Types.Time KD=1.5 "Governor derivative gain";
  parameter OpenIPSL.Types.Time TD=0.1 "Governor derivative controller time constant";
  parameter OpenIPSL.Types.Time TP=0.2 "Pilot valve time constant";
  parameter OpenIPSL.Types.PerUnit GMAX=1 "Maximum limit for the gate position";
  parameter OpenIPSL.Types.PerUnit GMIN=0 "Minimum limit for the gate position";
  parameter OpenIPSL.Types.PerUnit DICN=0.05 "PID integral controller limit from field tuning";
  parameter OpenIPSL.Types.PerUnit DPV=0 "Change in valve output";
  parameter OpenIPSL.Types.Time TDV=0.2 "Distribution valve time constant";
  parameter OpenIPSL.Types.PerUnit GTMXOP=0.1 "Maximum gate opening rate [p.u./s]";
  parameter OpenIPSL.Types.PerUnit GTMXCL=-0.2 "Maximum gate closing rate [p.u./s]";
  parameter OpenIPSL.Types.PerUnit Tg=0.2 "Distribution valve limit";

  //Turbine Parameters
  parameter OpenIPSL.Types.PerUnit G1=0 "Gate position 1 [pu]";
  parameter OpenIPSL.Types.PerUnit G2=0.25 "Gate position 2 [pu]";
//   parameter OpenIPSL.Types.PerUnit G3=0.5 "Gate position 3 [pu]";
//   parameter OpenIPSL.Types.PerUnit G4=0.75 "Gate position 4 [pu]";
//   parameter OpenIPSL.Types.PerUnit G5=1 "Gate position 5 [pu]";
  parameter OpenIPSL.Types.PerUnit FLWG1=0 "Water flow rate 1 [pu]";
  parameter OpenIPSL.Types.PerUnit FLWG2=0.25 "Water flow rate 2 [pu]";
//   parameter OpenIPSL.Types.PerUnit FLWG3=0.5 "Water flow rate 3 [pu]";
//   parameter OpenIPSL.Types.PerUnit FLWG4=0.75 "Water flow rate 4 [pu]";
//   parameter OpenIPSL.Types.PerUnit FLWG5=1 "Water flow rate 5 [pu]";
  parameter OpenIPSL.Types.PerUnit TW=0.2 "Water time constant [s]";
  parameter OpenIPSL.Types.PerUnit FLWP1=0 "Water flow rate 1 [pu]";
  parameter OpenIPSL.Types.PerUnit FLWP2=0.2 "Water flow rate 2 [pu]";
  parameter OpenIPSL.Types.PerUnit FLWP3=0.23 "Water flow rate 3 [pu]";
  parameter OpenIPSL.Types.PerUnit FLWP4=0.4 "Water flow rate 4 [pu]";
  parameter OpenIPSL.Types.PerUnit FLWP5=0.6 "Water flow rate 5 [pu]";
  parameter OpenIPSL.Types.PerUnit FLWP6=0.8 "Water flow rate 6 [pu]";
//   parameter OpenIPSL.Types.PerUnit FLWP7=0.87 "Water flow rate 7 [pu]";
//   parameter OpenIPSL.Types.PerUnit FLWP8=0.9 "Water flow rate 8 [pu]";
//   parameter OpenIPSL.Types.PerUnit FLWP9=0.95 "Water flow rate 9 [pu]";
//   parameter OpenIPSL.Types.PerUnit FLWP10=1 "Water flow rate 10 [pu]";
  parameter OpenIPSL.Types.PerUnit Pmech1=0 "Mechanical power 1 [pu]";
  parameter OpenIPSL.Types.PerUnit Pmech2=0 "Mechanical power 2 [pu]";
  parameter OpenIPSL.Types.PerUnit Pmech3=0.05 "Mechanical power 3 [pu]";
  parameter OpenIPSL.Types.PerUnit Pmech4=0.35 "Mechanical power 4 [pu]";
  BaseClasses.WEHGOV.Turbine Turbine(
    S_b=S_b,
    M_b=M_b,
    G1=G1,
    G2=G2,
    FLWG1=FLWG1,
    FLWG2=FLWG2,
    TW=TW,
    FLWP1=FLWP1,
    FLWP2=FLWP2,
    FLWP3=FLWP3,
    FLWP4=FLWP4,
    FLWP5=FLWP5,
    FLWP6=FLWP6,
    Pmech1=Pmech1,
    Pmech2=Pmech2,
    Pmech3=Pmech3,
    Pmech4=Pmech4,
    Pmech5=Pmech5,
    Pmech6=Pmech6,
    D_TURB=D_TURB)
    annotation (Placement(transformation(extent={{32,-20},{92,20}})));
  parameter OpenIPSL.Types.PerUnit Pmech5=0.66 "Mechanical power 5 [pu]";
  parameter OpenIPSL.Types.PerUnit Pmech6=0.82 "Mechanical power 6 [pu]";
//   parameter OpenIPSL.Types.PerUnit Pmech7=0.85 "Mechanical power 7 [pu]";
//   parameter OpenIPSL.Types.PerUnit Pmech8=0.86 "Mechanical power 8 [pu]";
//   parameter OpenIPSL.Types.PerUnit Pmech9=0.88 "Mechanical power 9 [pu]";
//   parameter OpenIPSL.Types.PerUnit Pmech10=0.9 "Mechanical power 10 [pu]";
  parameter OpenIPSL.Types.PerUnit D_TURB=0 "Turbine damping";

  BaseClasses.WEHGOV.Governor Governor(
    S_b=S_b,
    M_b=M_b,
    R_PERM_PE=R_PERM_PE,
    R_PERM_GATE=R_PERM_GATE,
    T_PE=T_PE,
    M=M,
    SP_Band=SP_Band,
    KP=KP,
    KI=KI,
    KD=KD,
    TD=TD,
    TP=TP,
    GMAX=GMAX,
    GMIN=GMIN,
    DICN=DICN,
    DPV=DPV,
    TDV=TDV,
    GTMXOP=GTMXOP,
    GTMXCL=GTMXCL,
    Tg=Tg,
    G1=G1,
    G2=G2,
    FLWG1=FLWG1,
    FLWG2=FLWG2,
    FLWP1=FLWP1,
    FLWP2=FLWP2,
    FLWP3=FLWP3,
    FLWP4=FLWP4,
    FLWP5=FLWP5,
    FLWP6=FLWP6,
    Pmech1=Pmech1,
    Pmech2=Pmech2,
    Pmech3=Pmech3,
    Pmech4=Pmech4,
    Pmech5=Pmech5,
    Pmech6=Pmech6)
    annotation (Placement(transformation(extent={{-56,-20},{4,20}})));
//     G3=G3,
//     G4=G4,
//     G5=G5,
//     FLWG3=FLWG3,
//     FLWG4=FLWG4,
//     FLWG5=FLWG5,
//     FLWP7=FLWP7,
//     FLWP8=FLWP8,
//     FLWP9=FLWP9,
//     FLWP10=FLWP10,
//     Pmech7=Pmech7,
//     Pmech8=Pmech8,
//     Pmech9=Pmech9,
//     Pmech10=Pmech10)
//     G3=G3,
//     G4=G4,
//     G5=G5,
//     FLWG3=FLWG3,
//     FLWG4=FLWG4,
//     FLWG5=FLWG5,
//     FLWP7=FLWP7,
//     FLWP8=FLWP8,
//     FLWP9=FLWP9,
//     FLWP10=FLWP10,
//     Pmech7=Pmech7,
//     Pmech8=Pmech8,
//     Pmech9=Pmech9,
//     Pmech10=Pmech10,
  Modelica.Blocks.Sources.Constant P_ref(k=Pref) annotation (Placement(transformation(origin={-78,30},     extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput SPEED
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput PELEC
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

  Modelica.Blocks.Interfaces.RealInput PMECH0
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
protected
  parameter OpenIPSL.Types.PerUnit Pe0(fixed=false);
  parameter OpenIPSL.Types.PerUnit Pref(fixed=false);

initial equation
  Pe0 = PELEC;
  Pref = R_PERM_PE*Pe0;

equation
  connect(Governor.Gate_Position, Turbine.Gate_Position) annotation (Line(
        points={{5.11111,0},{12,0},{12,14},{28,14}}, color={0,0,127}));
  connect(P_ref.y, Governor.PREF) annotation (Line(points={{-67,30},{-64,30},{
          -64,15.5556},{-58.2222,15.5556}},
                                        color={0,0,127}));
  connect(SPEED, Governor.SPEED) annotation (Line(points={{-120,60},{-90,60},{
          -90,0},{-58.2222,0}},
                            color={0,0,127}));
  connect(PELEC, Governor.PELEC) annotation (Line(points={{-120,-60},{-80,-60},
          {-80,-15.5556},{-58.2222,-15.5556}},color={0,0,127}));
  connect(Turbine.SPEED, SPEED)
    annotation (Line(points={{82,24},{82,60},{-120,60}}, color={0,0,127}));
  connect(Turbine.PMECH, PMECH)
    annotation (Line(points={{94,0},{110,0}}, color={0,0,127}));
  connect(PMECH0, Turbine.PMECH0) annotation (Line(points={{-120,0},{-94,0},{
          -94,-40},{16,-40},{16,-16},{28,-16}}, color={0,0,127}));
  connect(Governor.PMECH0, Turbine.PMECH0) annotation (Line(points={{-58.2222,
          -8.88889},{-94,-8.88889},{-94,-40},{16,-40},{16,-16},{28,-16}},
        color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
          Text(
          extent={{-74,58},{76,-38}},
          textColor={28,108,200},
          textString="WEHGOV
"),     Text(
          extent={{-102,68},{-44,52}},
          textColor={28,108,200},
          textString="SPEED"),
        Text(
          extent={{-96,8},{-38,-8}},
          textColor={28,108,200},
          textString="PMECH0"),
        Text(
          extent={{-104,-52},{-46,-68}},
          textColor={28,108,200},
          textString="PELEC")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end WEHGOV;
