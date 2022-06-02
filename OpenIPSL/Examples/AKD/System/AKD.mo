within OpenIPSL.Examples.AKD.System;
model AKD "Part of the Norwegian transmission system, ready for simulation"
  extends Modelica.Icons.Example;
  Components.Gen_no_contr gen58553(
    V_b=130000,
    M_b=120000000,
    Tpd0=7.34,
    Tppd0=0.05,
    Tppq0=0.25,
    H=2.31,
    D=0,
    Xd=1.2020,
    Xq=0.658,
    Xpd=0.3060,
    Xppd=0.194,
    Xl=0.113,
    S10=0.08,
    S12=0.245,
    R_a=0.004,
    v_0=PF_data.voltages.V58553,
    angle_0=PF_data.voltages.A58553,
    P_0=PF_data.powers.P58553,
    Q_0=PF_data.powers.Q58553)
    annotation (Placement(transformation(extent={{-94,-2},{-70,20}})));
  Components.Gen_no_contr gen58583(
    V_b=130000,
    M_b=120000000,
    Tpd0=7.34,
    Tppd0=0.05,
    Tppq0=0.25,
    H=2.31,
    D=0,
    Xd=1.2020,
    Xq=0.6580,
    Xpd=0.3060,
    Xppd=0.1940,
    Xl=0.113,
    S10=0.08,
    S12=0.245,
    R_a=0.004,
    v_0=PF_data.voltages.V58583,
    angle_0=PF_data.voltages.A58583,
    P_0=PF_data.powers.P58583,
    Q_0=PF_data.powers.Q58583)
    annotation (Placement(transformation(extent={{-34,33},{-10,55}})));
  Components.Gen_gov_exc_stab gen58567(
    V_b=14700,
    M_b=120000000,
    Tpd0=7.9,
    Tppd0=0.05,
    Tppq0=0.25,
    H=2.93,
    D=0,
    Xd=1.13,
    Xq=0.632,
    Xpd=0.31,
    Xppd=0.194,
    Xl=0.123,
    S10=0.0607,
    S12=0.232,
    R_a=0.004,
    R=0.08,
    r=0.4,
    T_r=8,
    T_f=0.05,
    T_g=0.2,
    VELM=0.2,
    G_MAX=1,
    G_MIN=0,
    T_w=1.2,
    A_t=1.1,
    D_turb=0.3,
    q_NL=0.1,
    T_R=0.06,
    K_A=150,
    T_A=0,
    V_RMAX=4,
    V_RMIN=-4,
    K_E=1,
    T_E=0.04,
    K_F=0.011,
    T_F1=0.4,
    T_F2=0.7,
    E_1=6.5,
    S_EE_1=0.054,
    E_2=8,
    S_EE_2=0.2020,
    A_1=3,
    A_2=0,
    A_3=0,
    A_4=0,
    A_5=0,
    A_6=0,
    T_1=10000,
    T_2=3,
    T_3=1,
    T_4=3,
    T_5=0.001,
    T_6=3,
    K_S=-13.5,
    L_SMAX=0.03,
    L_SMIN=-0.03,
    V_CU=0,
    V_CL=0,
    v_0=PF_data.voltages.V58567,
    angle_0=PF_data.voltages.A58567,
    P_0=PF_data.powers.P58567,
    Q_0=PF_data.powers.Q58567)
    annotation (Placement(transformation(extent={{-102,-46},{-78,-24}})));
  Components.Gen_no_contr gen58573(
    V_b=130000,
    M_b=120000000,
    Tpd0=7.34,
    Tppd0=0.05,
    Tppq0=0.25,
    H=2.31,
    D=0,
    Xd=1.2020,
    Xq=0.658,
    Xpd=0.306,
    Xppd=0.194,
    Xl=0.113,
    S10=0.08,
    S12=0.245,
    R_a=0.004,
    v_0=PF_data.voltages.V58573,
    angle_0=PF_data.voltages.A58573,
    P_0=PF_data.powers.P58573,
    Q_0=PF_data.powers.Q58573)
    annotation (Placement(transformation(extent={{82,4},{60,26}})));
  OpenIPSL.Electrical.Branches.PwLine line_58553_58563(
    R=0.19224,
    X=0.78070,
    G=0,
    B=0.00257*0.5)
    annotation (Placement(transformation(extent={{-36,-10},{-24,-2}})));
  OpenIPSL.Electrical.Branches.PwLine line_58563_58573(
    R=0.37478,
    X=1.52958,
    G=0,
    B=0.00408*0.5)
    annotation (Placement(transformation(extent={{24,-16},{36,-8}})));
  OpenIPSL.Electrical.Branches.PwLine line_58553_58583(
    R=0.22669,
    X=1.30550,
    B=0.00526*0.5,
    G=0) annotation (Placement(transformation(extent={{-36,16},{-24,24}})));
  OpenIPSL.Electrical.Branches.PwLine line_58573_58583(
    R=0.25195,
    X=1.30183,
    G=0,
    B=0.00272*0.5)
    annotation (Placement(transformation(extent={{22,16},{34,24}})));
  Components.Gen_no_contr gen58653(
    V_b=130000,
    M_b=120000000,
    Tpd0=7.34,
    Tppd0=0.05,
    Tppq0=0.25,
    H=2.31,
    D=0,
    Xd=1.2020,
    Xq=0.658,
    Xpd=0.306,
    Xppd=0.194,
    Xl=0.113,
    S10=0.08,
    S12=0.245,
    R_a=0.004,
    v_0=PF_data.voltages.V58653,
    angle_0=PF_data.voltages.A58653,
    P_0=PF_data.powers.P58653,
    Q_0=PF_data.powers.Q58653)
    annotation (Placement(transformation(extent={{120,-11},{98,11}})));
  OpenIPSL.Electrical.Branches.PwLine line_58573_58653(
    G=0,
    R=0.49047,
    X=2.01225,
    B=0.00404*0.5,
    t1=1,
    t2=1.05,
    opening=1) annotation (Placement(transformation(
        extent={{-7,-4.5},{7,4.5}},
        origin={69,-0.5})));
  OpenIPSL.Electrical.Buses.BusExt bus_58583(
    nn=2,
    np=1,
    v_0=PF_data.voltages.V58583,
    angle_0=PF_data.voltages.A58583)
    annotation (Placement(transformation(extent={{-2,30},{0,50}})));
  OpenIPSL.Electrical.Buses.BusExt bus_58553(
    nn=1,
    np=2,
    v_0=PF_data.voltages.V58553,
    angle_0=PF_data.voltages.A58553)
    annotation (Placement(transformation(extent={{-62,-2},{-60,18}})));
  OpenIPSL.Electrical.Buses.BusExt bus_58563(
    np=3,
    nn=2,
    v_0=PF_data.voltages.V58563,
    angle_0=PF_data.voltages.A58563)
    annotation (Placement(transformation(extent={{-2,-50},{0,4}})));
  OpenIPSL.Electrical.Buses.BusExt bus_58567(
    nn=1,
    v_0=PF_data.voltages.V58567,
    angle_0=PF_data.voltages.A58567,
    np=1) annotation (Placement(transformation(extent={{-70,-45},{-68,-25}})));
  OpenIPSL.Electrical.Buses.BusExt bus_58566(
    np=1,
    v_0=PF_data.voltages.V58566,
    angle_0=PF_data.voltages.A58566,
    nn=1) annotation (Placement(transformation(extent={{69,-45},{71,-25}})));
  OpenIPSL.Electrical.Buses.BusExt bus_58573(
    nn=2,
    np=2,
    v_0=PF_data.voltages.V58573,
    angle_0=PF_data.voltages.A58573)
    annotation (Placement(transformation(extent={{50,-12},{52,24}})));
  OpenIPSL.Electrical.Buses.BusExt bus_58653(
    nn=1,
    np=1,
    v_0=PF_data.voltages.V58653,
    angle_0=PF_data.voltages.A58653)
    annotation (Placement(transformation(extent={{88,-12},{90,10}})));
  OpenIPSL.Electrical.Banks.PwCapacitorBank shunt_58553_58563(nsteps=1, B=-0.0005)
    annotation (Placement(transformation(extent={{-46,-22},{-38,-14}})));
  OpenIPSL.Electrical.Banks.PwCapacitorBank shunt_58563_58553(nsteps=1, B=0.0005)
    annotation (Placement(transformation(extent={{-22,-22},{-14,-14}})));
  OpenIPSL.Electrical.Banks.PwCapacitorBank shunt_58563_58573(nsteps=1, B=0.0005)
    annotation (Placement(transformation(extent={{16,-22},{24,-14}})));
  OpenIPSL.Electrical.Banks.PwCapacitorBank shunt_58573_58563(nsteps=1, B=-0.0005)
    annotation (Placement(transformation(extent={{38,-22},{46,-14}})));
  Data.PF_data PF_data
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=1000000000)
    annotation (Placement(transformation(extent={{60,60},{104,84}})));
  OpenIPSL.Electrical.Loads.PSSE.Load Load_58563(
    V_b=130000,
    P_0=8290000,
    Q_0=0,
    v_0=PF_data.voltages.V58563,
    angle_0=PF_data.voltages.A58563,
    characteristic=2)
    annotation (Placement(transformation(extent={{13,-64},{27,-52}})));
  Components.Gen_gov_exc_stab gen58566(
    V_b=9500,
    M_b=60000000,
    Tpd0=7.34,
    Tppd0=0.05,
    Tppq0=0.25,
    H=2.31,
    D=0,
    Xd=1.202,
    Xq=0.658,
    Xpd=0.306,
    Xppd=0.187,
    Xl=0.113,
    S10=0.08,
    S12=0.245,
    R_a=0.005,
    R=0.08,
    r=0.4,
    T_r=8,
    T_f=0.05,
    T_g=0.2,
    VELM=0.2,
    G_MAX=1,
    G_MIN=0,
    T_w=1.2,
    A_t=1.1,
    D_turb=0.3,
    q_NL=0.1,
    T_R=0.06,
    K_A=150,
    T_A=0,
    V_RMAX=4,
    V_RMIN=-4,
    K_E=1,
    T_E=0.04,
    K_F=0.011,
    T_F1=0.4,
    T_F2=0.7,
    E_1=6.5,
    S_EE_1=0.054,
    E_2=8,
    S_EE_2=0.202,
    T_1=10000,
    T_2=3,
    T_3=1,
    T_4=3,
    T_5=0.001,
    T_6=3,
    K_S=-13.5,
    L_SMAX=0.03,
    L_SMIN=-0.03,
    V_CU=0,
    V_CL=0,
    v_0=PF_data.voltages.V58566,
    angle_0=PF_data.voltages.A58566,
    P_0=PF_data.powers.P58566,
    Q_0=PF_data.powers.Q58566)
    annotation (Placement(transformation(extent={{112,-46},{90,-24}})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer(
    R=0.027500,
    X=0.989170,
    G=0,
    B=0,
    t1=1,
    t2=1,
    ANG1=2.61799387799)
    annotation (Placement(transformation(extent={{-30,-38},{-42,-30}})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer
    twoWindingTransformer1(
    G=0,
    B=0,
    t1=1,
    t2=1,
    ANG1=2.61799387799,
    R=0.065,
    X=2.113330)
    annotation (Placement(transformation(extent={{34,-38},{46,-30}})));
equation
  connect(line_58553_58583.n, bus_58583.n[1]) annotation (Line(
      points={{-24.6,20},{-6,20},{-6,37},{-2,37}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gen58583.pwPin, bus_58583.n[2]) annotation (Line(
      points={{-13.6,44},{-6.84,44},{-6.84,43},{-2,43}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_58583.p[1], line_58573_58583.p) annotation (Line(
      points={{0,40},{5,40},{5,20},{22.6,20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gen58553.pwPin, bus_58553.n[1]) annotation (Line(
      points={{-73.6,9},{-66.84,9},{-66.84,8},{-62,8}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_58553.p[1], line_58553_58563.p) annotation (Line(
      points={{-60,5},{-56,5},{-56,-6},{-35.4,-6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_58553_58583.p, bus_58553.p[2]) annotation (Line(
      points={{-35.4,20},{-56,20},{-56,11},{-60,11}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_58563_58573.n, bus_58573.n[1]) annotation (Line(
      points={{35.4,-12},{44,-12},{44,0.6},{50,0.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_58573_58583.n, bus_58573.n[2]) annotation (Line(
      points={{33.4,20},{44,20},{44,11.4},{50,11.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_58573_58653.p, bus_58573.p[1]) annotation (Line(
      points={{62.7,-0.5},{62.7,0.6},{52,0.6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gen58573.pwPin, bus_58573.p[2]) annotation (Line(
      points={{63.3,15},{56.77,15},{56.77,11.4},{52,11.4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(line_58573_58653.n, bus_58653.n[1]) annotation (Line(
      points={{75.3,-0.5},{82,-0.5},{82,-1},{88,-1}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(bus_58653.p[1], gen58653.pwPin) annotation (Line(
      points={{90,-1},{94.77,-1},{94.77,0},{101.3,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(shunt_58553_58563.p, line_58553_58563.p) annotation (Line(
      points={{-42,-14},{-42,-11.48},{-35.4,-11.48},{-35.4,-6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(shunt_58563_58553.p, line_58553_58563.n) annotation (Line(
      points={{-18,-14},{-18,-11.48},{-24.6,-11.48},{-24.6,-6}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(shunt_58563_58573.p, line_58563_58573.p) annotation (Line(
      points={{20,-14},{20,-12.48},{24.6,-12.48},{24.6,-12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(shunt_58573_58563.p, line_58563_58573.n) annotation (Line(
      points={{42,-14},{42,-12.48},{35.4,-12.48},{35.4,-12}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(gen58567.pwPin, bus_58567.n[1]) annotation (Line(points={{-81.6,-35},
          {-75.8,-35},{-70,-35}},color={0,0,255}));
  connect(Load_58563.p, bus_58563.p[1]) annotation (Line(points={{20,-52},{20,-38},
          {6,-38},{6,-38},{0,-38},{0,-36},{0,-34},{0,-33.8}}, color={0,0,255}));
  connect(line_58563_58573.p, bus_58563.p[2]) annotation (Line(points={{24.6,-12},
          {12,-12},{12,-23},{0,-23}}, color={0,0,255}));
  connect(line_58553_58563.n, bus_58563.n[1]) annotation (Line(points={{-24.6,-6},
          {-12,-6},{-12,-31.1},{-2,-31.1}}, color={0,0,255}));
  connect(gen58566.pwPin, bus_58566.p[1]) annotation (Line(points={{93.3,-35},{
          82.65,-35},{71,-35}}, color={0,0,255}));
  connect(twoWindingTransformer.n, bus_58567.p[1])
    annotation (Line(points={{-42.6,-34},{-68,-34},{-68,-35}},
                                                             color={0,0,255}));
  connect(twoWindingTransformer.p, bus_58563.n[2])
    annotation (Line(points={{-29.4,-34},{-2,-34},{-2,-14.9}},
                                                             color={0,0,255}));
  connect(twoWindingTransformer1.n, bus_58566.n[1])
    annotation (Line(points={{46.6,-34},{69,-34},{69,-35}},
                                                          color={0,0,255}));
  connect(twoWindingTransformer1.p, bus_58563.p[3])
    annotation (Line(points={{33.4,-34},{0,-34},{0,-12.2}},
                                                          color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            120,100}}), graphics={Text(
          extent={{-12,56},{8,50}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 58583"),Text(
          extent={{-72,24},{-52,18}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 58553"),Text(
          extent={{-79,-45},{-59,-51}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 58567"),Text(
          extent={{60,-46},{80,-52}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 58566"),Text(
          extent={{-11,-51},{9,-57}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 58563"),Text(
          extent={{40,30},{60,24}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 58573"),Text(
          extent={{80,16},{100,10}},
          lineColor={0,128,0},
          textStyle={TextStyle.Bold},
          textString="bus 58653")}),
    Documentation(info="<html>
<p>This example system represents small portion of the Norwegian transmission system, going under the line opening between buses 58573 and 58653, at both ends. The line opens at 1s and the event lasts for 50ms and, after that, the line is reconnected.</p>
<p>The system should be simulated during 10 seconds and the variables of interest are:</p>
<ul>
<li><code>bus_58563.v</code></li>
<li><code>bus_58563.angle</code></li>
</ul>
</html>"),
    experiment(StopTime=10));
end AKD;
