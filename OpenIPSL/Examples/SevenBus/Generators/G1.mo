within OpenIPSL.Examples.SevenBus.Generators;
model G1 "Generation unit connected to bus FSSV"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter Types.ApparentPower M_b "Machine base power"
    annotation (Dialog(group="Power flow data"));
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    V_b=V_b,
    v_0=v_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    M_b=M_b,
    Tpd0=9.627,
    Tppd0=0.058,
    Tppq0=0.06,
    H=6.3,
    D=0,
    Xq=2.47,
    Xpd=0.3925,
    Xl=0.211,
    Xpq=0.437,
    Tpq0=1.006,
    S10=0.084,
    S12=0.2319,
    Xd=2.47,
    Xppq=0.289,
    Xppd=0.289,
    R_a=0.00344)
    annotation (Placement(transformation(extent={{0,-20},{40,20}})));
  OpenIPSL.Interfaces.PwPin pwPin
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.ST5B sT5B(
    T_R=0,
    T_C1=0.8,
    T_B1=6,
    T_C2=0.08,
    T_B2=0.01,
    K_R=200,
    V_RMAX=5,
    V_RMIN=-4,
    T_1=0.004,
    K_C=0.004,
    T_UC1=2,
    T_UB1=10,
    T_UC2=0.1,
    T_UB2=0.05,
    T_OC1=0.1,
    T_OB1=2,
    T_OC2=0.08,
    T_OB2=0.08)
    annotation (Placement(transformation(extent={{20,-60},{0,-40}})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.PSS2B pSS2B(
    T_w1=2,
    T_w2=2,
    T_6=0,
    T_w3=2,
    T_w4=0,
    T_7=2,
    K_S2=0.1564,
    K_S3=1,
    T_8=0,
    T_9=0,
    K_S1=10,
    T_1=0.25,
    T_2=0.03,
    T_3=0.15,
    T_4=0.015,
    T_10=0,
    T_11=0,
    V_S1MAX=999,
    V_S1MIN=-999,
    V_S2MAX=999,
    V_S2MIN=-999,
    V_STMAX=0.1,
    V_STMIN=-0.1,
    M=0,
    N=0) annotation (Placement(transformation(extent={{60,-46},{40,-26}})));
  Modelica.Blocks.Sources.Constant VUEL(k=-100)
    annotation (Placement(transformation(extent={{-60,-92},{-40,-72}})));
  Modelica.Blocks.Sources.Constant VOEL(k=100)
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.IEESGO iEESGO(
    T_1=0.3,
    T_2=1,
    T_3=0.5,
    T_4=0.1,
    T_5=0.25,
    T_6=0.3,
    K_1=15,
    K_2=0.3,
    K_3=0.5,
    P_MAX=1,
    P_MIN=0) annotation (Placement(transformation(extent={{60,50},{40,30}})));
equation
  connect(gENROU.p, pwPin)
    annotation (Line(points={{40,0},{110,0}}, color={0,0,255}));
  connect(gENROU.ETERM, sT5B.ECOMP) annotation (Line(points={{42,-6},{76,-6},{76,
          -50},{21,-50}}, color={0,0,127}));
  connect(sT5B.XADIFD, gENROU.XADIFD) annotation (Line(points={{2,-61},{2,-72},{
          70,-72},{70,-18},{42,-18}},
                                color={0,0,127}));
  connect(sT5B.EFD0, gENROU.EFD0) annotation (Line(points={{21,-54},{82,-54},{82,
          -10},{42,-10}}, color={0,0,127}));
  connect(gENROU.SPEED, pSS2B.V_S1) annotation (Line(points={{42,14},{88,14},{88,
          -32},{61,-32}}, color={0,0,127}));
  connect(gENROU.PELEC, pSS2B.V_S2) annotation (Line(points={{42,6},{92,6},{92,-40},
          {61,-40}}, color={0,0,127}));
  connect(VUEL.y, sT5B.VUEL) annotation (Line(points={{-39,-82},{14,-82},{14,-61}},
                      color={0,0,127}));
  connect(VOEL.y, sT5B.VOEL) annotation (Line(points={{-39,-50},{-30,-50},{-30,-78},
          {10,-78},{10,-61}}, color={0,0,127}));
  connect(pSS2B.VOTHSG, sT5B.VOTHSG) annotation (Line(points={{39,-36},{28,-36},
          {28,-46},{21,-46}},
                          color={0,0,127}));
  connect(gENROU.EFD, sT5B.EFD) annotation (Line(points={{-4,-12},{-20,-12},{-20,
          -50},{-1,-50}}, color={0,0,127}));
  connect(iEESGO.SPEED, gENROU.SPEED) annotation (Line(points={{58,34},{88,34},{
          88,14},{42,14}}, color={0,0,127}));
  connect(iEESGO.PMECH0, gENROU.PMECH0) annotation (Line(points={{58,46},{92,46},
          {92,10},{42,10}}, color={0,0,127}));
  connect(iEESGO.PMECH, gENROU.PMECH) annotation (Line(points={{39,40},{-20,40},
          {-20,12},{-4,12}}, color={0,0,127}));
  annotation (
    Icon(graphics={Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
          color={0,0,0},
          smooth=Smooth.Bezier),Text(
          extent={{-52,-18},{56,-66}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}),
    Documentation(info="<html>
<p>Generation unit number 1, connected to bus FSSV, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENROU, from PSSE.</li>
<li><strong>Exciter</strong>: ST5B, from PSSE.</li>
<li><strong>Turbine-Governor</strong>: IESGO, from PSSE.</li>
<li><strong>Stabilizer</strong>: PSS2B, from PSSE.</li>
</ul>
</html>"));
end G1;
