within OpenIPSL.Examples.AKD.Components;
model Gen_gov_exc_stab "Generation unit with machine, exciter, turbine-governor, and stabilizer models"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter Types.ApparentPower M_b "Machine base power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Time Tpd0 "d-axis transient open-circuit time constant"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.Time Tppd0 "d-axis sub-transient open-circuit time constant"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.Time Tppq0 "q-axis transient open-circuit time constant"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.Time H "Inertia constant"
    annotation (Dialog(group="Machine parameters"));
  parameter Real D "Speed damping"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Xd "d-axis reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Xq "q-axis reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Xpd "d-axis transient reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Xppd "d-axis sub-transient reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Xl "leakage reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit S10 "Saturation factor at 1.0 pu"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit S12 "Saturation factor at 1.2 pu"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit R_a=0 "Armature resistance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit R=0.05 "Permanent droop";
  parameter Types.PerUnit r=0.3 "Temporary droop";
  parameter Types.Time T_r=5 "Governor time constant";
  parameter Types.Time T_f=0.05 "Filter time constant";
  parameter Types.Time T_g=0.5 "Servo time constant";
  parameter Types.TimeAging VELM=0.2 "Gate open/close velocity limit";
  parameter Types.PerUnit G_MAX=0.9 "Maximum gate limit";
  parameter Types.PerUnit G_MIN=0 "Minimum gate limit";
  parameter Types.Time T_w=1.25 "Water time constant";
  parameter Types.PerUnit A_t=1.2 "Turbine gain";
  parameter Types.PerUnit D_turb=0.2 "Turbine damping";
  parameter Types.PerUnit q_NL=0.08 "Water flow at no load";
  parameter Types.Time T_R=0.02 "Voltage input time constant";
  parameter Types.PerUnit K_A=200.0 "AVR gain";
  parameter Types.Time T_A=0.001 "AVR time constant";
  parameter Types.PerUnit V_RMAX=6.08 "Maximum AVR output";
  parameter Types.PerUnit V_RMIN=-6.08 "Minimum AVR output";
  parameter Types.PerUnit K_E=1 "Exciter field gain";
  parameter Types.Time T_E=0.55 "Exciter time constant";
  parameter Types.PerUnit K_F=0.06 "Rate feedback gain";
  parameter Types.Time T_F1=0.3 "Rate feedback time constant";
  parameter Types.Time T_F2=0.6 "Rate feedback time constant";
  parameter Types.PerUnit E_1=2.85 "Exciter saturation point 1";
  parameter Types.PerUnit S_EE_1=0.3 "Saturation at E_1";
  parameter Types.PerUnit E_2=3.8 "Exciter saturation point 2";
  parameter Types.PerUnit S_EE_2=0.6 "Saturation at E_2";
  parameter Types.Time A_1=3 "Filter Coefficient";
  parameter Real A_2=0 "Filter Coefficient";
  parameter Types.Time A_3=0 "Filter Coefficient";
  parameter Real A_4=0 "Filter Coefficient";
  parameter Types.Time A_5=0 "Filter Coefficient";
  parameter Real A_6=0 "Filter Coefficient";
  parameter Types.Time T_1=0 "Lead Time Constant";
  parameter Types.Time T_2=0 "Lag Time Constant";
  parameter Types.Time T_3=0 "Lead Time Constant";
  parameter Types.Time T_4=0 "Lag Time Constant";
  parameter Types.Time T_5=1.65 "Washout Time Constant";
  parameter Types.Time T_6=1.65 "Washout Time Constant";
  parameter Types.PerUnit K_S=6.2 "Stabilizer Gain";
  parameter Types.PerUnit L_SMAX=0.26 "Output Limits";
  parameter Types.PerUnit L_SMIN=-0.1 "Output Limits";
  parameter Types.PerUnit V_CU=999 "Output Limits";
  parameter Types.PerUnit V_CL=-999 "Output Limits";
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    V_b=V_b,
    v_0=v_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    M_b=M_b,
    Tpd0=Tpd0,
    Tppd0=Tppd0,
    Tppq0=Tppq0,
    H=H,
    D=D,
    Xd=Xd,
    Xq=Xq,
    Xpd=Xpd,
    Xppd=Xppd,
    Xppq=Xppd,
    Xl=Xl,
    S10=S10,
    S12=S12,
    R_a=R_a) annotation (Placement(transformation(extent={{20,-20},{59,20}})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{90,-10},
            {110,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=R,
    r=r,
    T_r=T_r,
    T_f=T_f,
    T_g=T_g,
    VELM=VELM,
    G_MAX=G_MAX,
    G_MIN=G_MIN,
    T_w=T_w,
    A_t=A_t,
    D_turb=D_turb,
    q_NL=q_NL) annotation (Placement(transformation(extent={{0,40},{-20,20}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.IEEET2 iEEET2_1(
    T_R=T_R,
    K_A=K_A,
    T_A=T_A,
    V_RMAX=V_RMAX,
    V_RMIN=V_RMIN,
    K_E=K_E,
    T_E=T_E,
    K_F=K_F,
    T_F1=T_F1,
    T_F2=T_F2,
    E_1=E_1,
    S_EE_1=S_EE_1,
    E_2=E_2,
    S_EE_2=S_EE_2)
    annotation (Placement(transformation(extent={{0,-40},{-20,-20}})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.IEEEST iEEEST(
    A_1=A_1,
    A_2=A_2,
    A_3=A_3,
    A_4=A_4,
    A_5=A_5,
    A_6=A_6,
    T_1=T_1,
    T_2=T_2,
    T_3=T_3,
    T_4=T_4,
    T_5=T_5,
    T_6=T_6,
    K_S=K_S,
    L_SMAX=L_SMAX,
    L_SMIN=L_SMIN,
    V_CU=V_CU,
    V_CL=V_CL)
    annotation (Placement(transformation(extent={{40,-98},{20,-78}})));
  Modelica.Blocks.Sources.Constant disabled_exc_lims(k=0)
    annotation (Placement(transformation(extent={{-40,-72},{-20,-52}})));
  Modelica.Blocks.Sources.Constant disabled_comp_vt(k=0)
    annotation (Placement(transformation(extent={{20,-72},{40,-52}})));
equation
  connect(gENSAL.p, pwPin)
    annotation (Line(points={{59,0},{100,0}}, color={0,0,255}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{60.95,10},{80,10},
          {80,36},{-2,36}}, color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{60.95,14},{70,14},
          {70,24},{-2,24}}, color={0,0,127}));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{-21,30},{-30,30},
          {-30,12},{16.1,12}}, color={0,0,127}));
  connect(iEEET2_1.EFD, gENSAL.EFD) annotation (Line(points={{-21,-30},{-30,-30},
          {-30,-12},{16.1,-12}}, color={0,0,127}));
  connect(iEEEST.VOTHSG, iEEET2_1.VOTHSG) annotation (Line(points={{19,-88},{10,
          -88},{10,-26},{1,-26}}, color={0,0,127}));
  connect(gENSAL.ETERM, iEEET2_1.ECOMP) annotation (Line(points={{60.95,-6},{80,
          -6},{80,-30},{1,-30}}, color={0,0,127}));
  connect(gENSAL.PELEC, iEEEST.V_S) annotation (Line(points={{60.95,6},{74,6},{74,
          -92},{42,-92}}, color={0,0,127}));
  connect(disabled_comp_vt.y, iEEEST.V_CT) annotation (Line(points={{41,-62},{58,
          -62},{58,-84},{42,-84}}, color={0,0,127}));
  connect(gENSAL.EFD0, iEEET2_1.EFD0) annotation (Line(points={{60.95,-10},{70,-10},
          {70,-34},{1,-34}}, color={0,0,127}));
  connect(gENSAL.XADIFD, iEEET2_1.XADIFD) annotation (Line(points={{60.95,-18},{
          66,-18},{66,-46},{-18,-46},{-18,-41}}, color={0,0,127}));
  connect(disabled_exc_lims.y, iEEET2_1.VOEL)
    annotation (Line(points={{-19,-62},{-10,-62},{-10,-41}}, color={0,0,127}));
  connect(disabled_exc_lims.y, iEEET2_1.VUEL)
    annotation (Line(points={{-19,-62},{-6,-62},{-6,-41}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Ellipse(extent={{-60,60},{60,-60}}, lineColor={0,
          0,255}),Text(
          extent={{-34,24},{32,-28}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="GEN")}),
    Documentation(info="<html>
<p>This generation unit model allows for instantiantions with different parameter sets. The model is composed by:</p>
<ul>
<li><strong>Machine model</strong>: GENSAL, a salient pole synchronous generator model.</li>
<li><strong>Exciter model</strong>: IEEET2, an IEEE type-2 excitation model.</li>
<li><strong>Turbine-governor model</strong>: HYGOV, a hydro turbine governor model.</li>
<li><strong>Stabilizer model</strong>: IEEEST, an IEEE power system stabilizer model.</li>
</ul>
</html>"));
end Gen_gov_exc_stab;
