within OpenIPSL.Data.PowerPlant.GenerationGroup;
model Generator2
  "Generation Group for the example that uses the Anderson-based data set"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Electrical.Machines.PSSE.GENROE gENROE(
    P_0=P_0,
    Q_0=Q_0,
    v_0=v_0,
    angle_0=angle_0,
    Tpd0=gUDynamics.guDynamics.machine.Tpd0,
    Tppd0=gUDynamics.guDynamics.machine.Tppd0,
    R_a=gUDynamics.guDynamics.machine.R_a,
    Tppq0=gUDynamics.guDynamics.machine.Tppq0,
    H=gUDynamics.guDynamics.machine.H,
    D=gUDynamics.guDynamics.machine.D,
    Xd=gUDynamics.guDynamics.machine.Xd,
    Xq=gUDynamics.guDynamics.machine.Xq,
    Xpd=gUDynamics.guDynamics.machine.Xpd,
    Xppd=gUDynamics.guDynamics.machine.Xppd,
    Xl=gUDynamics.guDynamics.machine.Xl,
    S10=gUDynamics.guDynamics.machine.S10,
    S12=gUDynamics.guDynamics.machine.S12,
    Xppq=gUDynamics.guDynamics.machine.Xppq,
    M_b=gUDynamics.guDynamics.machine.M_b,
    Xpq=gUDynamics.guDynamics.machine.Xpq,
    Tpq0=gUDynamics.guDynamics.machine.Tpq0)
    annotation (Placement(transformation(extent={{26,-20},{66,20}})));
  Modelica.Blocks.Sources.Constant zero(k=0)
    annotation (Placement(transformation(extent={{4,-74},{-8,-62}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ESDC1A eSDC1A(
    T_C=0,
    T_B=0,
    K_A=gUDynamics.guDynamics.excSystem.K_A,
    V_RMAX=gUDynamics.guDynamics.excSystem.V_RMAX,
    V_RMIN=gUDynamics.guDynamics.excSystem.V_RMIN,
    K_E=gUDynamics.guDynamics.excSystem.K_E,
    T_E=gUDynamics.guDynamics.excSystem.T_E,
    K_F=gUDynamics.guDynamics.excSystem.K_F,
    T_A=gUDynamics.guDynamics.excSystem.T_A1,
    T_R=gUDynamics.guDynamics.excSystem.T_R,
    T_F1=gUDynamics.guDynamics.excSystem.T_F1,
    E_1=gUDynamics.guDynamics.excSystem.E_1,
    E_2=gUDynamics.guDynamics.excSystem.E_2,
    S_EE_1=gUDynamics.guDynamics.excSystem.S_EE_1,
    S_EE_2=gUDynamics.guDynamics.excSystem.S_EE_2)
    annotation (Placement(transformation(extent={{-50,-54},{-82,-22}})));
  Modelica.Blocks.Sources.Constant minusInf(k=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-40,-86},{-52,-74}})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.IEE2ST iEE2ST(
    K_1=gUDynamics.guDynamics.pss.K_QS,
    K_2=gUDynamics.guDynamics.pss.K_QV,
    T_5=gUDynamics.guDynamics.pss.Tp_Q1,
    T_6=gUDynamics.guDynamics.pss.T_Q1,
    T_7=gUDynamics.guDynamics.pss.Tp_Q2,
    T_8=gUDynamics.guDynamics.pss.T_Q2,
    T_9=gUDynamics.guDynamics.pss.Tp_Q3,
    T_1=0,
    T_2=0,
    T_3=gUDynamics.guDynamics.pss.T_Q,
    T_4=gUDynamics.guDynamics.pss.T_Q,
    T_10=gUDynamics.guDynamics.pss.T_Q3,
    L_SMAX=gUDynamics.guDynamics.pss.V_SLIM,
    L_SMIN=-gUDynamics.guDynamics.pss.V_SLIM,
    V_CU=99,
    V_CL=-99) annotation (Placement(transformation(
        extent={{19,13},{-19,-13}},
        rotation=90,
        origin={-27,15})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},
            {120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.IEESGO iEESGO(
    T_1=0,
    T_2=gUDynamics.guDynamics.turbGovernor.T_2,
    T_3=gUDynamics.guDynamics.turbGovernor.T_1,
    T_4=gUDynamics.guDynamics.turbGovernor.T_3,
    T_5=gUDynamics.guDynamics.turbGovernor.T_4,
    T_6=gUDynamics.guDynamics.turbGovernor.T_5,
    K_2=1,
    K_3=1 - gUDynamics.guDynamics.turbGovernor.F/gUDynamics.guDynamics.turbGovernor.T_5,
    P_MAX=gUDynamics.guDynamics.turbGovernor.P_MAX,
    P_MIN=0.0,
    K_1=1/gUDynamics.guDynamics.turbGovernor.R)
    annotation (Placement(transformation(extent={{40,-50},{20,-70}})));
  GUDynamics gUDynamics(redeclare record GUnitDynamics = GUnitDynamics)
    annotation (Placement(transformation(extent={{-94,34},{-74,54}})));
  replaceable record GUnitDynamics = Anderson.Steam.Fossil.AndersonF15
    constrainedby GUDynamicsTemplate annotation (choicesAllMatching=true);
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
           {28,108,200})}),
    Documentation(info="<html>
<p>Generation Group for the example that uses the Anderson-based data set.</p>
<h5>Instructions</h5>
<p>
The steps for the correct use of the data sets are indicated below:
</p>
<ol>
<li>Drag and Drop an instance of a <code>OpenIPSL.Data.PowerPlant.GUDynamics</code>
    record to the diagram layer of your generation group model.</li>
<li>Propagate the <code>GUnitDynamics</code> parameter of the <code>GUDynamics</code> record.</li>
<li>Go to the upper-level model that contains an instance of this generation group
    (e.g., <a href=\"modelica://OpenIPSL.Data.PowerPlant.Examples.Anderson\">Anderson</a> example model).
    Complete the local instructions and come back to continue with step 4.</li>
<li>Insert component references inside the parameter fields of the Synchronous Machine,
    Excitation System, Power System Stabilizer and Turbine/Governor blocks.
    For example, to specify the inertia constant of the GENROE synchronous machine
    (i.e., H), you must fill its field with this expression:
    <code>gUDynamics.guDynamics.machine.H</code>.
    To do this, you can either type the value or recreate the whole path,
    by first clicking the <strong>Insert Component Reference</strong> option and
    then navigating the references accordingly.</li>
</ol>
</html>"));
end Generator2;
