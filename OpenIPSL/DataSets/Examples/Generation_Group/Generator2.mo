within OpenIPSL.DataSets.Examples.Generation_Group;
model Generator2
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Electrical.Machines.PSSE.GENROE gENROE(
    P_0=P_0,
    Q_0=Q_0,
    v_0=v_0,
    angle_0=angle_0,
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
    Xppq=gU_Dynamics.guDynamics.machine.Xppq,
    M_b=gU_Dynamics.guDynamics.machine.M_b,
    Xpq=gU_Dynamics.guDynamics.machine.Xpq,
    Tpq0=gU_Dynamics.guDynamics.machine.Tpq0)
           annotation (Placement(transformation(extent={{26,-20},{66,20}})));
  Modelica.Blocks.Sources.Constant zero(k=0)
    annotation (Placement(transformation(extent={{4,-74},{-8,-62}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ESDC1A eSDC1A(
    T_C=0,
    T_B=0,
    K_A=gU_Dynamics.guDynamics.excSystem.K_A,
    V_RMAX=gU_Dynamics.guDynamics.excSystem.V_RMAX,
    V_RMIN=gU_Dynamics.guDynamics.excSystem.V_RMIN,
    K_E=gU_Dynamics.guDynamics.excSystem.K_E,
    T_E=gU_Dynamics.guDynamics.excSystem.T_E,
    K_F=gU_Dynamics.guDynamics.excSystem.K_F,
    T_A=gU_Dynamics.guDynamics.excSystem.T_A1,
    T_R=gU_Dynamics.guDynamics.excSystem.T_R,
    T_F1=gU_Dynamics.guDynamics.excSystem.T_F1,
    E_1=gU_Dynamics.guDynamics.excSystem.E_1,
    E_2=gU_Dynamics.guDynamics.excSystem.E_2,
    S_EE_1=gU_Dynamics.guDynamics.excSystem.S_EE_1,
    S_EE_2=gU_Dynamics.guDynamics.excSystem.S_EE_2)
    annotation (Placement(transformation(extent={{-50,-54},{-82,-22}})));
  Modelica.Blocks.Sources.Constant minusInf(k=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-40,-86},{-52,-74}})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.IEE2ST iEE2ST(
    K_1=gU_Dynamics.guDynamics.pss.K_QS,
    K_2=gU_Dynamics.guDynamics.pss.K_QV,
    T_5=gU_Dynamics.guDynamics.pss.Tp_Q1,
    T_6=gU_Dynamics.guDynamics.pss.T_Q1,
    T_7=gU_Dynamics.guDynamics.pss.Tp_Q2,
    T_8=gU_Dynamics.guDynamics.pss.T_Q2,
    T_9=gU_Dynamics.guDynamics.pss.Tp_Q3,
    T_1=0,
    T_2=0,
    T_3=gU_Dynamics.guDynamics.pss.T_Q,
    T_4=gU_Dynamics.guDynamics.pss.T_Q,
    T_10=gU_Dynamics.guDynamics.pss.T_Q3,
    L_SMAX=gU_Dynamics.guDynamics.pss.V_SLIM,
    L_SMIN=-gU_Dynamics.guDynamics.pss.V_SLIM,
    V_CU=99,
    V_CL=-99)
         annotation (Placement(transformation(extent={{19,13},{-19,-13}},
        rotation=90,
        origin={-27,15})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},
            {120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  GU_Dynamics gU_Dynamics(redeclare record GUnitDynamics = GUnitDynamics)
    annotation (Placement(transformation(extent={{-90,32},{-70,52}})));
  replaceable record GUnitDynamics = GU_Dynamics_Template annotation (
      choicesAllMatching=true);
  OpenIPSL.Electrical.Controls.PSSE.TG.IEESGO iEESGO(
    T_1=0,
    T_2=gU_Dynamics.guDynamics.turbGovernor.T_2,
    T_3=gU_Dynamics.guDynamics.turbGovernor.T_1,
    T_4=gU_Dynamics.guDynamics.turbGovernor.T_3,
    T_5=gU_Dynamics.guDynamics.turbGovernor.T_4,
    T_6=gU_Dynamics.guDynamics.turbGovernor.T_5,
    K_2=1,
    K_3=1 - gU_Dynamics.guDynamics.turbGovernor.F/gU_Dynamics.guDynamics.turbGovernor.T_5,
    P_MAX=gU_Dynamics.guDynamics.turbGovernor.P_MAX,
    P_MIN=0.0,
    K_1=1/gU_Dynamics.guDynamics.turbGovernor.R)
             annotation (Placement(transformation(extent={{40,-50},{20,-70}})));

equation
  connect(eSDC1A.ECOMP,gENROE. ETERM) annotation (Line(points={{-48.4,-38},{96,-38},
          {96,-6},{68,-6}},                 color={0,0,127}));

  connect(eSDC1A.EFD,gENROE. EFD) annotation (Line(points={{-83.6,-38},{-92,-38},
          {-92,-12},{22,-12}},              color={0,0,127}));
  connect(eSDC1A.EFD0,gENROE. EFD0) annotation (Line(points={{-48.4,-44.4},{32,-44.4},
          {32,-44},{92,-44},{92,-10},{68,-10}},
                                          color={0,0,127}));
  connect(gENROE.SPEED, iEE2ST.V_S1) annotation (Line(points={{68,14},{82,14},{
          82,46},{-22,46},{-22,37.8},{-21.8,37.8}}, color={0,0,127}));
  connect(gENROE.PELEC, iEE2ST.V_S2) annotation (Line(points={{68,6},{90,6},{90,
          54},{-32.2,54},{-32.2,37.8}}, color={0,0,127}));
  connect(gENROE.XADIFD,eSDC1A. XADIFD) annotation (Line(points={{68,-18},{86,-18},
          {86,-96},{-78.8,-96},{-78.8,-55.6}},                                                                             color={0,0,127}));
  connect(gENROE.p, pwPin)
    annotation (Line(points={{66,0},{110,0}}, color={0,0,255}));
  connect(minusInf.y, eSDC1A.VUEL) annotation (Line(points={{-52.6,-80},{-59.6,
          -80},{-59.6,-55.6}}, color={0,0,127}));
  connect(eSDC1A.VOEL, zero.y) annotation (Line(points={{-66,-55.6},{-66,-68},{
          -8.6,-68}}, color={0,0,127}));
  connect(iEE2ST.VOTHSG, eSDC1A.VOTHSG) annotation (Line(points={{-27,-5.9},{
          -27,-31.6},{-48.4,-31.6}}, color={0,0,127}));
  connect(iEE2ST.VCT, gENROE.ETERM) annotation (Line(points={{-42.6,15},{-54,15},
          {-54,-8},{-38,-8},{-38,-38},{96,-38},{96,-6},{68,-6}}, color={0,0,127}));
  connect(iEESGO.PMECH, gENROE.PMECH) annotation (Line(points={{19,-60},{10,-60},
          {10,12},{22,12}}, color={0,0,127}));
  connect(gENROE.PMECH0, iEESGO.PMECH0) annotation (Line(points={{68,10},{74,10},
          {74,-54},{38,-54}}, color={0,0,127}));
  connect(iEESGO.SPEED, iEE2ST.V_S1) annotation (Line(points={{38,-66},{82,-66},
          {82,46},{-22,46},{-22,37.8},{-21.8,37.8}}, color={0,0,127}));
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
          extent={{-80,98},{72,66}},
          lineColor={28,108,200},
          radius=5,
          lineThickness=0.5,
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-76,94},{84,70}},
          textColor={0,0,0},
          textString="1. Drag and Drop from the DataSets package.
2. Propagate to the upper-level.
3. Go to the generator component in the upper-level model.
 Choose the appropriate parameter data set from the dropdown list.
4. Insert component references."),
        Line(
          points={{-40,90},{-56,90},{-72,56}},
          color={28,108,200},
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled},
          pattern=LinePattern.Dash),
        Line(
          points={{-36,66},{-68,36},{-70,-14}},
          color={28,108,200},
          pattern=LinePattern.Dash,
          thickness=0.5,
          arrow={Arrow.None,Arrow.Filled},
          smooth=Smooth.Bezier),
        Line(
          points={{26,66},{40,54},{54,22}},
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
          textString="4"),
        Text(
          extent={{-4,44},{14,34}},
          textColor={28,108,200},
          textStyle={TextStyle.Bold},
          textString="4"),
        Text(
          extent={{46,42},{64,32}},
          textColor={28,108,200},
          textStyle={TextStyle.Bold},
          textString="4"),
        Line(
          points={{4,66},{16,34},{-12,-22},{18,-56}},
          color={28,108,200},
          pattern=LinePattern.Dash,
          thickness=0.5,
          smooth=Smooth.Bezier,
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{6,30},{24,20}},
          textColor={28,108,200},
          textStyle={TextStyle.Bold},
          textString="4")}));
end Generator2;
