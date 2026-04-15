within OpenIPSL.Electrical.Solar.PowerFactory.WECC.PVD1;
model PlantPVD1 "Simple representation of the basic control of a PV system"
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enabledisplayPF=false,
    final enablefn=true,
    final enableV_b=false,
    final enableangle_0=true,
    final enablev_0=true,
    final enableQ_0=true,
    final enableP_0=true,
    final enableS_b=true);
  parameter Types.ApparentPower M_b "PV plant base power" annotation (Dialog(group="Plant parameters"));
  parameter Types.PerUnit Imax=1.1 "Maximum allowable total converter current" annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Boolean PqFlag=true "Priority on current limit flag; true: P prio., false: Q prio." annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Types.Time Tg=0.02 "Inverter current regulator time constat" annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Types.PerUnit Xc=0 "Line drop compensation reactance" annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Types.PerUnit Qmx=0.328 "Maximum reactive power" annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Types.PerUnit Qmn=-0.328 "Minimum reactive power" annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Types.PerUnit v0=0.9 "Low voltage threshold for Volt/Var Control" annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Types.PerUnit v1=1.1 "High voltage threshold for Volt/Var Control" annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Real dqdv=0 "Voltage/Var droop compensation" annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Types.PerUnit fdbd=-99 "Frequency deadband over frequency response" annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Real Ddn=0 "Down regulation droop" annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Real vr_recov=1 "Amount of generation to reconnect after voltage disconnection" annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Real fr_recov=1 "Amount of generation to reconnect after frequency disconnection" annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Types.PerUnit Ft0=0.99 "Frequency tripping repose curve point 0" annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Types.PerUnit Ft1=0.995 "Frequency tripping repose curve point 1" annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Types.PerUnit Ft2=1.005 "Frequency tripping repose curve point 2" annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Types.PerUnit Ft3=1.01 "Frequency tripping repose curve point 3" annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Types.PerUnit Vt0=0.88 "Voltage tripping repose curve point 0" annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Types.PerUnit Vt1=0.9 "Voltage tripping repose curve point 1" annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Types.PerUnit Vt2=1.1 "Voltage tripping repose curve point 2" annotation (Dialog(group="PVD1 Model Parameters"));
  parameter Types.PerUnit Vt3=1.2 "Voltage tripping repose curve point 3" annotation (Dialog(group="PVD1 Model Parameters"));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(origin={110,0}, extent={{-10,-10},{10,10}}), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Solar.PowerFactory.WECC.PVD1.Controller pvd1(
    Ddn=Ddn,
    Ft0=Ft0,
    Ft1=Ft1,
    Ft2=Ft2,
    Ft3=Ft3,
    Imax=Imax,
    PqFlag=PqFlag,
    Pref=P_0/M_b,
    Qmn=Qmn,
    Qmx=Qmx,
    Qref=Q_0/M_b,
    Tg=Tg,
    Vt0=Vt0,
    Vt1=Vt1,
    Vt2=Vt2,
    Vt3=Vt3,
    Xc=Xc,
    dqdv=dqdv,
    fdbd=fdbd,
    fr_recov=fr_recov,
    u_0=v_0,
    v0=v0,
    v1=v1,
    vr_recov=vr_recov) annotation (Placement(transformation(origin={-40,0}, extent={{-20,-20},{20,20}})));
  OpenIPSL.Electrical.Solar.PowerFactory.General.ElmGenstat static_generator(
    M_b=M_b,
    angle_0=angle_0,
    pll_connected=false,
    v_0=v_0) annotation (Placement(transformation(origin={40,0}, extent={{-20,-20},{20,20}})));
  OpenIPSL.Electrical.Solar.PowerFactory.General.StaVmea staVmea(angle_0 = angle_0, use_ref_machine_frequency = false) annotation(
    Placement(transformation(origin = {10, -78}, extent = {{20, -20}, {-20, 20}})));
  CustomMe.FFT_Dominant FFT_Dominant annotation(
    Placement(transformation(origin = {56, -66}, extent = {{10, -10}, {-10, 10}})));
equation
  connect(static_generator.p, p) annotation(
    Line(points = {{62, 0}, {110, 0}}, color = {0, 0, 255}));
  connect(pvd1.Ip, static_generator.id_ref) annotation(
    Line(points = {{-18, 12}, {0, 12}, {0, 16}, {22, 16}}, color = {0, 0, 127}));
  connect(pvd1.Iq, static_generator.iq_ref) annotation(
    Line(points = {{-18, -12}, {0, -12}, {0, 8}, {22, 8}}, color = {0, 0, 127}));
  connect(static_generator.v, pvd1.Vt) annotation(
    Line(points = {{62, 16}, {70, 16}, {70, 40}, {-72, 40}, {-72, 14}, {-68, 14}, {-68, 12}, {-64, 12}}, color = {0, 0, 127}));
  connect(static_generator.i, pvd1.It) annotation(
    Line(points = {{62, 8}, {80, 8}, {80, 46}, {-80, 46}, {-80, 0}, {-64, 0}}, color = {0, 0, 127}));
  connect(staVmea.p, p) annotation(
    Line(points = {{32, -78}, {74, -78}, {74, 0}, {110, 0}}, color = {0, 0, 255}));
  connect(pvd1.freq, staVmea.fe) annotation(
    Line(points = {{-64, -12}, {-80, -12}, {-80, -90}, {-12, -90}}, color = {0, 0, 127}));
  connect(staVmea.omega, FFT_Dominant.f) annotation(
    Line(points = {{34, -66}, {46, -66}}, color = {0, 0, 127}));
  annotation (Icon(graphics={
        Rectangle(
          lineColor={118,18,62},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,100},{100,-100}}),
        Line(
          origin={0,60.31},
          points={{-100,39.6877},{0,-40.3123},{100,39.6877},{100,39.6877}},
          color={118,18,62}),
        Text(
          origin={0,-10},
          textColor={0,0,255},
          extent={{-100,150},{100,110}},
          textString="%name")}));
end PlantPVD1;