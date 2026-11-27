within OpenIPSL.Tests.Wind.PSSE.WT4G;
model WT4E1 "SMIB system to test the functionality of type-4 wind generator model (WT4G1) with electrical controller (WT4E1)"
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
    angle_0=0,
    R_a=0,
    X_d=2.00000E-1,
    M_b=100000000,
    V_b=100000,
    P_0=-1498805.03287179,
    Q_0=-4334166.52621688,
    v_0=1.00000) annotation (Placement(transformation(extent={{102,-12},{90,12}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    G=0,
    B=0,
    R=2.50000E-3,
    X=2.50000E-3)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  OpenIPSL.Electrical.Wind.PSSE.WT4G.WT4G1 wT4G1(
    angle_0=0.000449674983856771,
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
    Q_0=-5665680.14137508,
    v_0=1) annotation (Placement(transformation(
        extent={{12,12},{-12,-12}},
        rotation=180,
        origin={-52,0})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0.5,
    X=0.5,
    t1=2,
    t2=2.15)
            annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  OpenIPSL.Electrical.Wind.PSSE.WT4G.WT4E1 wT4E1(
    PFAFLG=false,
    VARFLG=true,
    Tfv=0.15,
    Kpv=18,
    KIV=5,
    Kpp=0.05,
    KIP=0.15,
    Kf=0.0,
    Tf=0.08,
    QMX=0.48,
    QMN=-0.47,
    IPMAX=1.1,
    TRV=0.1,
    dPMX=0.5,
    dPMN=-0.5,
    T_Power=0.05,
    KQI=0.15,
    VMINCL=0.9,
    VMAXCL=1.1,
    KVI=120,
    Tv=0.05,
    Tp=0.05,
    ImaxTD=1.7,
    Iphl=1.11,
    Iqhl=1.11,
    PQFLAG=false,
    PSSEMATCH=true)
    annotation (Placement(transformation(extent={{-98,12},{-74,-12}})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=50, S_b=100000000) annotation (Placement(transformation(extent={{-100,80},{-48,100}})));
  OpenIPSL.Electrical.Buses.Bus GEN1
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  OpenIPSL.Electrical.Buses.Bus FAULT
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  OpenIPSL.Electrical.Buses.Bus GEN2
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
equation
  connect(wT4G1.p, GEN1.p) annotation (Line(points={{-38.8,-1.77636e-015},{-40,-1.77636e-015},
          {-40,0},{-30,0}}, color={0,0,255}));
  connect(GEN1.p, pwLine2.p)
    annotation (Line(points={{-30,0},{-19,0}}, color={0,0,255}));
  connect(pwLine2.n, FAULT.p)
    annotation (Line(points={{-1,0},{-1,0},{10,0}}, color={0,0,255}));
  connect(FAULT.p, pwLine.p)
    annotation (Line(points={{10,0},{20,0},{20,20},{31,20}}, color={0,0,255}));
  connect(pwLine1.p, pwLine.p) annotation (Line(points={{31,-20},{20,-20},{20,
          20},{31,20}}, color={0,0,255}));
  connect(pwFault.p, FAULT.p) annotation (Line(points={{18.3333,-50},{14,-50},{
          14,0},{10,0}},
                      color={0,0,255}));
  connect(pwLine.n, GEN2.p)
    annotation (Line(points={{49,20},{60,20},{60,0},{70,0}}, color={0,0,255}));
  connect(pwLine1.n, GEN2.p) annotation (Line(points={{49,-20},{60,-20},{60,0},{
          70,0}}, color={0,0,255}));
  connect(GEN2.p, gENCLS2_1.p)
    annotation (Line(points={{70,0},{90,0},{90,0}}, color={0,0,255}));
  connect(wT4E1.WIQCMD, wT4G1.I_qcmd) annotation (Line(points={{-72.8,8.4},{-68,
          8.4},{-68,9.6},{-62.8,9.6}}, color={0,0,127}));
  connect(wT4E1.WIPCMD, wT4G1.I_pcmd) annotation (Line(points={{-72.8,3.6},{-68,
          3.6},{-68,4.8},{-62.8,4.8}}, color={0,0,127}));
  connect(wT4G1.P, wT4E1.P) annotation (Line(points={{-65.2,-4.8},{-68,-4.8},{-68,
          -2.4},{-75.2,-2.4}}, color={0,0,127}));
  connect(wT4G1.V, wT4E1.V) annotation (Line(points={{-65.2,0},{-70,0},{-70,-9.6},
          {-75.2,-9.6}}, color={0,0,127}));
  connect(wT4G1.Q, wT4E1.Q) annotation (Line(points={{-65.2,-9.6},{-68,-9.6},{-68,
          -6},{-75.2,-6}}, color={0,0,127}));
  annotation (experiment(StopTime=10));
end WT4E1;
