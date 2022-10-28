within OpenIPSL.DataSets.Examples.Generation_Group;
model Generator1
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Electrical.Machines.PSSE.GENSAE gENSAE(
    Tpd0=gU_Dynamics.guDynamics.machine.Tpd0,
    Tppd0=gU_Dynamics.guDynamics.machine.Tppd0,
    R_a=gU_Dynamics.guDynamics.machine.R_a,
    Tppq0=gU_Dynamics.guDynamics.machine.Tppq0,
    H=gU_Dynamics.guDynamics.machine.H,
    D=gU_Dynamics.guDynamics.machine.D,
    Xd=gU_Dynamics.guDynamics.machine.Xd,
    Xq=gU_Dynamics.guDynamics.machine.Xq,
    Xpd=gU_Dynamics.guDynamics.machine.Xpd,
    Xppd=gU_Dynamics.guDynamics.machine.Xppd,
    Xl=gU_Dynamics.guDynamics.machine.Xl,
    S10=gU_Dynamics.guDynamics.machine.S10,
    S12=gU_Dynamics.guDynamics.machine.S12,
    angle_0=0.070492225331847,
    Xppq=gU_Dynamics.guDynamics.machine.Xppq,
    M_b=gU_Dynamics.guDynamics.machine.M_b,
    P_0=40000000,
    Q_0=5416582,
    v_0=1) annotation (Placement(transformation(extent={{26,-20},{66,20}})));
  Modelica.Blocks.Sources.Constant zero(k=0)
    annotation (Placement(transformation(extent={{0,-78},{-12,-66}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ESST1A eSST1A(
    V_IMAX=gU_Dynamics.guDynamics.excSystem.V_IMAX,
    V_IMIN=gU_Dynamics.guDynamics.excSystem.V_IMIN,
    T_C=gU_Dynamics.guDynamics.excSystem.T_C,
    T_B=gU_Dynamics.guDynamics.excSystem.T_B,
    T_C1=gU_Dynamics.guDynamics.excSystem.T_C1,
    T_B1=gU_Dynamics.guDynamics.excSystem.T_B1,
    K_A=gU_Dynamics.guDynamics.excSystem.K_A,
    V_AMAX=gU_Dynamics.guDynamics.excSystem.V_AMAX,
    V_AMIN=gU_Dynamics.guDynamics.excSystem.V_AMIN,
    V_RMAX=gU_Dynamics.guDynamics.excSystem.V_RMAX,
    V_RMIN=gU_Dynamics.guDynamics.excSystem.V_RMIN,
    K_C=gU_Dynamics.guDynamics.excSystem.K_C,
    K_F=gU_Dynamics.guDynamics.excSystem.K_F,
    T_F=gU_Dynamics.guDynamics.excSystem.T_F,
    K_LR=gU_Dynamics.guDynamics.excSystem.K_LR,
    I_LR=gU_Dynamics.guDynamics.excSystem.I_LR,
    T_A=gU_Dynamics.guDynamics.excSystem.T_A,
    T_R=gU_Dynamics.guDynamics.excSystem.T_R)
    annotation (Placement(transformation(extent={{-50,-54},{-82,-22}})));
  Modelica.Blocks.Sources.Constant minusInf(k=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-42,-88},{-54,-76}})));
  Modelica.Blocks.Sources.Constant plusInf(k=Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{36,-76},{24,-64}})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.PSS2B pSS2B(
    T_w1=gU_Dynamics.guDynamics.pss.T_w1,
    T_w2=gU_Dynamics.guDynamics.pss.T_w2,
    T_6=gU_Dynamics.guDynamics.pss.T_6,
    T_w3=gU_Dynamics.guDynamics.pss.T_w3,
    T_w4=gU_Dynamics.guDynamics.pss.T_w4,
    T_7=gU_Dynamics.guDynamics.pss.T_7,
    K_S2=gU_Dynamics.guDynamics.pss.K_S2,
    K_S3=gU_Dynamics.guDynamics.pss.K_S3,
    T_8=gU_Dynamics.guDynamics.pss.T_8,
    T_9=gU_Dynamics.guDynamics.pss.T_9,
    K_S1=gU_Dynamics.guDynamics.pss.K_S1,
    T_1=gU_Dynamics.guDynamics.pss.T_1,
    T_2=gU_Dynamics.guDynamics.pss.T_2,
    T_3=gU_Dynamics.guDynamics.pss.T_3,
    T_4=gU_Dynamics.guDynamics.pss.T_4,
    T_10=gU_Dynamics.guDynamics.pss.T_10,
    T_11=gU_Dynamics.guDynamics.pss.T_11,
    V_S1MAX=gU_Dynamics.guDynamics.pss.V_S1MAX,
    V_S1MIN=gU_Dynamics.guDynamics.pss.V_S1MIN,
    V_S2MAX=gU_Dynamics.guDynamics.pss.V_S2MAX,
    V_S2MIN=gU_Dynamics.guDynamics.pss.V_S2MIN,
    V_STMAX=gU_Dynamics.guDynamics.pss.V_STMAX,
    V_STMIN=gU_Dynamics.guDynamics.pss.V_STMIN,
    M=gU_Dynamics.guDynamics.pss.M,
    N=gU_Dynamics.guDynamics.pss.N)
         annotation (Placement(transformation(extent={{19,13},{-19,-13}},
        rotation=90,
        origin={-27,15})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},
            {120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  GU_Dynamics gU_Dynamics(redeclare record GUnitDynamics = IEEE421.ST.ESST1A_1
        (redeclare record PSS = .OpenIPSL.DataSets.IEEE421.PSS_Data.PSS2B_2 (
              K_S2=gU_Dynamics.guDynamics.pss.T_7/(2*gU_Dynamics.guDynamics.machine.H))))
    annotation (Placement(transformation(extent={{-90,32},{-70,52}})));
equation
  connect(gENSAE.PMECH,gENSAE. PMECH0) annotation (Line(points={{22,12},{10,12},
          {10,30},{76,30},{76,10},{68,10}},          color={0,0,127}));
  connect(eSST1A.ECOMP,gENSAE. ETERM) annotation (Line(points={{-48.4,-38},{96,-38},
          {96,-6},{68,-6}},                 color={0,0,127}));
  connect(minusInf.y,eSST1A. VUEL2) annotation (Line(points={{-54.6,-82},{-70.816,
          -82},{-70.816,-55.584}},                                                                         color={0,0,127}));
  connect(eSST1A.VUEL,zero. y) annotation (Line(points={{-59.6,-55.6},{-60,-55.6},
          {-60,-72},{-12.6,-72}},                                                           color={0,0,127}));

  connect(plusInf.y,eSST1A. VOEL) annotation (Line(points={{23.4,-70},{6,-70},{6,
          -60},{-66,-60},{-66,-55.6}},                                                         color={0,0,127}));
  connect(eSST1A.EFD,gENSAE. EFD) annotation (Line(points={{-83.6,-38},{-92,-38},
          {-92,-12},{22,-12}},              color={0,0,127}));
  connect(eSST1A.EFD0,gENSAE. EFD0) annotation (Line(points={{-48.4,-44.4},{32,-44.4},
          {32,-44},{92,-44},{92,-10},{68,-10}},
                                          color={0,0,127}));
  connect(eSST1A.VOTHSG,zero. y) annotation (Line(points={{-48.4,-31.6},{-48.4,-30},
          {-34,-30},{-34,-72},{-12.6,-72}},                                                             color={0,0,127}));
  connect(gENSAE.SPEED,pSS2B. V_S1) annotation (Line(points={{68,14},{82,14},{82,
          46},{-22,46},{-22,35.9},{-21.8,35.9}},    color={0,0,127}));
  connect(gENSAE.PELEC,pSS2B. V_S2) annotation (Line(points={{68,6},{90,6},{90,54},
          {-32.2,54},{-32.2,35.9}},               color={0,0,127}));
  connect(pSS2B.VOTHSG,eSST1A. VOTHSG2) annotation (Line(points={{-27,-5.9},{-27,
          -16},{-48.4,-16},{-48.4,-25.2}},             color={0,0,127}));
  connect(gENSAE.XADIFD,eSST1A. XADIFD) annotation (Line(points={{68,-18},{86,-18},
          {86,-96},{-78.8,-96},{-78.8,-55.6}},                                                                             color={0,0,127}));
  connect(eSST1A.VT,gENSAE. ETERM) annotation (Line(points={{-48.44,-50.52},{96,
          -50.52},{96,-6},{68,-6}},                                                                                      color={0,0,127}));
  connect(gENSAE.p, pwPin)
    annotation (Line(points={{66,0},{110,0}}, color={0,0,255}));
  connect(eSST1A.VUEL3, eSST1A.VUEL2) annotation (Line(points={{-74.296,-55.592},
          {-74.296,-66},{-70.816,-66},{-70.816,-55.584}}, color={0,0,127}));
  annotation (Icon(graphics={Text(
          extent={{-93,6},{-24,-12}},
          lineColor={0,0,255},
          textStyle={TextStyle.Italic},
          textString=""),
          Text(extent={{-34,-32},{38,-52}},
          lineColor={28,108,200},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="%name"),
                         Line(points={{-60,-20},{-20,20},{20,-20},{60,20}},
          color={28,108,200}),Ellipse(extent={{-100,-100},{100,100}}, lineColor=
           {28,108,200})}), Diagram(graphics={
        Rectangle(
          extent={{-56,94},{98,66}},
          lineColor={28,108,200},
          radius=5,
          lineThickness=0.5,
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-48,94},{94,68}},
          textColor={0,0,0},
          textString="1. Drag and Drop from the DataSets package.
2. Choose the appropriate parameter data set from the dropdown list.
3. Insert component references."),
        Line(
          points={{-56,84},{-72,56}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled},
          pattern=LinePattern.Dash),
        Line(
          points={{-38,64},{-68,36},{-70,-14}},
          color={28,108,200},
          pattern=LinePattern.Dash,
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled},
          smooth=Smooth.Bezier),
        Line(
          points={{0,66},{40,54},{54,22}},
          color={28,108,200},
          pattern=LinePattern.Dash,
          thickness=0.5,
          smooth=Smooth.Bezier,
          arrow={Arrow.None,Arrow.Filled}),
        Line(
          points={{-10,66},{2,36},{-12,18}},
          color={28,108,200},
          pattern=LinePattern.Dash,
          thickness=0.5,
          smooth=Smooth.Bezier,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{-84,78},{-60,68}},
          textColor={28,108,200},
          textString="1-2",
          textStyle={TextStyle.Bold}),
        Text(
          extent={{-66,42},{-48,32}},
          textColor={28,108,200},
          textStyle={TextStyle.Bold},
          textString="3"),
        Text(
          extent={{-4,44},{14,34}},
          textColor={28,108,200},
          textStyle={TextStyle.Bold},
          textString="3"),
        Text(
          extent={{46,42},{64,32}},
          textColor={28,108,200},
          textStyle={TextStyle.Bold},
          textString="3")}));
end Generator1;
