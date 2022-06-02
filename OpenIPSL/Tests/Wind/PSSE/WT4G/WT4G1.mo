within OpenIPSL.Tests.Wind.PSSE.WT4G;
model WT4G1 "SMIB system to test the functionality of type-4 wind generator model (WT4G1)"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=2.50000E-2,
    X=2.50000E-2,
    G=0,
    B=0.05000/2) annotation (Placement(transformation(extent={{30,10},{50,30}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=2.50000E-2,
    X=2.50000E-2,
    G=0,
    B=0.05000/2) annotation (Placement(transformation(extent={{30,-30},{50,-10}})));
  OpenIPSL.Electrical.Machines.PSSE.GENCLS gENCLS2_1(
    angle_0=-1.570655e-005,
    R_a=0,
    X_d=2.00000E-1,
    M_b=100000000,
    V_b=100000,
    P_0=-1498800,
    Q_0=-4334000,
    v_0=1.00000) annotation (Placement(transformation(extent={{102,-12},{90,12}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    G=0,
    B=0,
    R=2.50000E-3,
    X=2.50000E-3)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  OpenIPSL.Electrical.Wind.PSSE.WT4G.WT4G1 wT4G1(
    angle_0=0.02574992,
    M_b=100000000,
    T_IQCmd=0.02,
    T_IPCmd=0.02,
    V_LVPL1=0.4,
    V_LVPL2=0.9,
    G_LVPL=1.11,
    V_HVRCR=1.2,
    CUR_HVRCR=2,
    RIp_LVPL=2,
    T_LVPL=0.02,
    V_b=100000,
    P_0=1500000,
    Q_0=-5665800,
    v_0=0.9999999) annotation (Placement(transformation(
        extent={{12,12},{-12,-12}},
        rotation=180,
        origin={-52,0})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0.5,
    X=0.5,
    t1=2,
    t2=2.15)
            annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=50, S_b=100000000) annotation (Placement(transformation(extent={{-100,80},{-48,100}})));
  OpenIPSL.Electrical.Buses.Bus GEN1
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  OpenIPSL.Electrical.Buses.Bus FAULT
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  OpenIPSL.Electrical.Buses.Bus GEN2
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
equation
  connect(wT4G1.p, GEN1.p) annotation (Line(points={{-38.8,-1.77636e-015},{-40,
          -1.77636e-015},{-40,0},{-30,0}}, color={0,0,255}));
  connect(GEN1.p, pwLine2.p)
    annotation (Line(points={{-30,0},{-19,0}}, color={0,0,255}));
  connect(pwLine2.n, FAULT.p)
    annotation (Line(points={{-1,0},{-1,0},{10,0}}, color={0,0,255}));
  connect(FAULT.p, pwLine.p)
    annotation (Line(points={{10,0},{20,0},{20,20},{31,20}}, color={0,0,255}));
  connect(pwLine1.p, pwLine.p) annotation (Line(points={{31,-20},{20,-20},{20,20},
          {31,20}}, color={0,0,255}));
  connect(pwFault.p, FAULT.p) annotation (Line(points={{18.3333,-50},{14,-50},{
          14,0},{10,0}}, color={0,0,255}));
  connect(pwLine.n, GEN2.p)
    annotation (Line(points={{49,20},{60,20},{60,0},{70,0}}, color={0,0,255}));
  connect(pwLine1.n, GEN2.p) annotation (Line(points={{49,-20},{60,-20},{60,0},
          {70,0}}, color={0,0,255}));
  connect(GEN2.p, gENCLS2_1.p)
    annotation (Line(points={{70,0},{90,0},{90,0}}, color={0,0,255}));
  connect(wT4G1.I_qcmd, wT4G1.I_qcmd0) annotation (Line(points={{-62.8,9.6},{-66,
          9.6},{-66,16},{-59.2,16},{-59.2,13.2}}, color={0,0,127}));
  connect(wT4G1.I_pcmd, wT4G1.I_pcmd0) annotation (Line(points={{-62.8,4.8},{-68,
          4.8},{-68,18},{-54.4,18},{-54.4,13.2}}, color={0,0,127}));
  annotation (experiment(StopTime=10));
end WT4G1;
