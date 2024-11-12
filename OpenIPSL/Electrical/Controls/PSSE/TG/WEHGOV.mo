within OpenIPSL.Electrical.Controls.PSSE.TG;
model WEHGOV "Woodward Electric Hydro Governor Model [PSSE-MODELS]"
  //Governor Parameters
  parameter Types.ApparentPower S_b=100e6 "System base";
  parameter Types.ApparentPower M_b=100e6 "System base";
  parameter Types.PerUnit R_PERM_GATE=1 "Feedback Gate gain";
  parameter Types.PerUnit R_PERM_PE=1 "Pelec gain";
  parameter Types.Time T_PE=0.5 "Electrical power transducer time constant";
  parameter Integer M=1 "Feedback control switch";
  parameter Types.PerUnit SP_Band=0 "Speed deadband";
  parameter Types.PerUnit KP=3 "Governor proportional gain";
  parameter Types.TimeAging KI=0.36 "Governor integral gain";
  parameter Types.Time KD=1.5 "Governor derivative gain";
  parameter Types.Time TD=0.1 "Governor derivative controller time constant";
  parameter Types.Time TP=0.2 "Pilot valve time constant";
  parameter Types.PerUnit GMAX=1 "Maximum limit for the gate position";
  parameter Types.PerUnit GMIN=0 "Minimum limit for the gate position";
  parameter Types.PerUnit DICN=0.05 "PID integral controller limit from field tuning";
  parameter Types.PerUnit DPV=0 "Change in valve output";
  parameter Types.Time TDV=0.2 "Distribution valve time constant";
  parameter Types.PerUnit GTMXOP=0.1 "Maximum gate opening rate [p.u./s]";
  parameter Types.PerUnit GTMXCL=-0.2 "Maximum gate closing rate [p.u./s]";
  parameter Types.PerUnit Tg=0.2 "Distribution valve limit";

  //Turbine Parameters
  parameter Types.PerUnit G1=0 "Gate position 1";
  parameter Types.PerUnit G2=0.25 "Gate position 2";
  parameter Types.PerUnit FLWG1=0 "Water flow rate 1";
  parameter Types.PerUnit FLWG2=0.25 "Water flow rate 2";
  parameter Types.Time TW=0.2 "Water time constant";
  parameter Types.PerUnit FLWP1=0 "Water flow rate 1";
  parameter Types.PerUnit FLWP2=0.2 "Water flow rate 2";
  parameter Types.PerUnit FLWP3=0.23 "Water flow rate 3";
  parameter Types.PerUnit FLWP4=0.4 "Water flow rate 4";
  parameter Types.PerUnit FLWP5=0.6 "Water flow rate 5";
  parameter Types.PerUnit FLWP6=0.8 "Water flow rate 6";
  parameter Types.PerUnit Pmech1=0 "Mechanical power 1";
  parameter Types.PerUnit Pmech2=0 "Mechanical power 2";
  parameter Types.PerUnit Pmech3=0.05 "Mechanical power 3";
  parameter Types.PerUnit Pmech4=0.35 "Mechanical power 4";
  parameter Types.PerUnit Pmech5=0.66 "Mechanical power 5";
  parameter Types.PerUnit Pmech6=0.82 "Mechanical power 6";
  parameter Types.PerUnit D_TURB=0 "Turbine damping";

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
    D_TURB=D_TURB) annotation (Placement(transformation(extent={{32,-20},{72,20}})));

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
    Pmech6=Pmech6) annotation (Placement(transformation(extent={{-56,-20},{-16,20}})));

  Modelica.Blocks.Sources.Constant P_ref(k=Pref) annotation (Placement(transformation(origin={-78,30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealInput SPEED
    annotation (Placement(transformation(extent={{-140,40},{-100,80}}),
        iconTransformation(extent={{-100,40},{-60,80}})));
  Modelica.Blocks.Interfaces.RealInput PELEC
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}}),
        iconTransformation(extent={{-100,-80},{-60,-40}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));

  Modelica.Blocks.Interfaces.RealInput PMECH0
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}}),
        iconTransformation(extent={{-100,-20},{-60,20}})));
protected
  parameter Types.PerUnit Pe0(fixed=false);
  parameter Types.PerUnit Pref(fixed=false);

initial equation
  Pe0 = PELEC;
  Pref = R_PERM_PE*Pe0;
equation
  connect(Governor.Gate_Position, Turbine.Gate_Position) annotation (Line(
        points={{-14,0},{18,0},{18,16},{28,16}}, color={0,0,127}));
  connect(P_ref.y, Governor.PREF) annotation (Line(points={{-67,30},{-60,30},{
          -60,16}}, color={0,0,127}));
  connect(SPEED, Governor.SPEED) annotation (Line(points={{-120,60},{-94,60},{
          -94,6},{-60,6}}, color={0,0,127}));
  connect(PELEC, Governor.PELEC) annotation (Line(points={{-120,-60},{-88,-60},
          {-88,-16},{-60,-16}}, color={0,0,127}));
  connect(Turbine.SPEED, SPEED)
    annotation (Line(points={{68,24},{68,60},{-120,60}}, color={0,0,127}));
  connect(Turbine.PMECH, PMECH)
    annotation (Line(points={{74,0},{110,0}}, color={0,0,127}));
  connect(PMECH0, Turbine.PMECH0) annotation (Line(points={{-120,0},{-70,0},{
          -70,-6},{-68,-6},{-68,-24},{18,-24},{18,-16},{28,-16}},
                                                color={0,0,127}));
  connect(Governor.PMECH0, Turbine.PMECH0) annotation (Line(points={{-60,-6},{
          -68,-6},{-68,-24},{18,-24},{18,-16},{28,-16}},
        color={0,0,127}));
  annotation (Icon(graphics={
          Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
          Text(
          extent={{-74,148},{76,52}},
          textColor={28,108,200},
          textString="WEHGOV
"), Text(
          extent={{-62,68},{-4,52}},
          textColor={28,108,200},
          textString="SPEED"),
        Text(
          extent={{-56,8},{2,-8}},
          textColor={28,108,200},
          textString="PMECH0"),
        Text(
          extent={{-64,-52},{-6,-68}},
          textColor={28,108,200},
          textString="PELEC")}),
        Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>Woodward Electric Hydro Governor Model (PSS/E Manual)</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2024-10-05</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Giuseppe Laera, ALSETLab, RPI Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end WEHGOV;
