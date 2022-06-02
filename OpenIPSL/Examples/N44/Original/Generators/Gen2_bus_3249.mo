within OpenIPSL.Examples.N44.Original.Generators;
model Gen2_bus_3249 "Configuration of synchronous generator with regulators: GENSAL, HYGOV, SCRX;
          Nordic 44 model: Buses 3245, 3249, 5600"

  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Tppd0=0.06 "T''do (> 0)",
    Tppq0=0.1 "T''qo (> 0)",
    D=0 "Speed Damping",
    Tpd0=10.13,
    H=4.543,
    Xd=1.036,
    Xq=0.63,
    Xpd=0.28,
    Xppd=0.21,
    Xppq=0.21,
    Xl=0.11538,
    V_b=420000,
    v_0=PSSE_data.voltages.V3249,
    angle_0=PSSE_data.voltages.A3249,
    P_0=PSSE_data.powers.P3249,
    Q_0=PSSE_data.powers.Q3249,
    M_b=1357000000,
    S10=0.10239,
    S12=0.2742,
    R_a=0) annotation (Placement(transformation(extent={{-60,-20},{6,48}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.HYGOV hYGOV(
    R=0.06 "Permanent droop, p.u",
    r=0.4 "Temporary droop, p.u",
    VELM=0.1 "Gate open/close velosiy limit, p.u/sec",
    T_r=5,
    T_f=0.05,
    T_g=0.2,
    G_MAX=1,
    G_MIN=0,
    T_w=1,
    A_t=1.1,
    D_turb=0.5,
    q_NL=0.1)
    annotation (Placement(transformation(extent={{-62,62},{-2,88}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.SCRX sCRX(
    K=31,
    T_AT_B=0.25385,
    T_B=13,
    T_E=0.05,
    E_MIN=0,
    E_MAX=4,
    r_cr_fd=0,
    C_SWITCH=true)
    annotation (Placement(transformation(extent={{26,-90},{81,-30}})));
  Modelica.Blocks.Sources.Constant cte(k=0)
    annotation (Placement(transformation(extent={{-21,-55},{-11,-45}})));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,
            -10},{120,10}})));
  Original.Data.PSSE_data_Original_case PSSE_data
    annotation (Placement(transformation(extent={{88,88},{98,98}})));
equation
  connect(cte.y, sCRX.VOEL) annotation (Line(points={{-10.5,-50},{8,-50},{8,-93},
          {53.5,-93}}, color={0,0,127}));
  connect(sCRX.VOTHSG, cte.y) annotation (Line(points={{23.25,-48},{8,-48},{8,
          -50},{-10.5,-50}}, color={0,0,127}));
  connect(gENSAL.XADIFD, sCRX.XADIFD) annotation (Line(points={{9.3,-16.6},{14,
          -16.6},{14,-93},{75.5,-93}}, color={0,0,127}));
  connect(gENSAL.EFD0, sCRX.EFD0) annotation (Line(points={{9.3,-3},{18,-3},{18,
          -72},{23.25,-72}}, color={0,0,127}));
  connect(sCRX.EFD, gENSAL.EFD) annotation (Line(points={{83.75,-60},{86,-60},
          {86,-94},{-72,-94},{-72,-6.4},{-66.6,-6.4}}, color={0,0,
          127}));
  connect(hYGOV.PMECH, gENSAL.PMECH) annotation (Line(points={{1,75},{8,75},{8,
          50},{-70,50},{-70,34.4},{-66.6,34.4}}, color={0,0,127}));
  connect(gENSAL.SPEED, hYGOV.SPEED) annotation (Line(points={{9.3,37.8},{16,37.8},
          {16,92},{-68,92},{-68,82.8},{-56,82.8}}, color={0,0,
          127}));
  connect(gENSAL.PMECH0, hYGOV.PMECH0) annotation (Line(points={{9.3,31},{30,31},
          {30,96},{-72,96},{-72,67.2},{-56,67.2}}, color={0,0,
          127}));
  connect(gENSAL.p, p) annotation (Line(points={{6,14},{54,14},{54,0},{110,0}},
                   color={0,0,255}));
  connect(sCRX.VUEL, cte.y) annotation (Line(points={{42.5,-93},{8,-93},{8,-50},
          {-10.5,-50}}, color={0,0,127}));
  connect(sCRX.ECOMP, gENSAL.ETERM) annotation (Line(points={{23.25,-60},{22,-60},
          {22,3.8},{9.3,3.8}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics={Ellipse(extent={{-100,-100},{101,100}},
          lineColor={0,0,255}),Line(
              points={{-76,-26},{-28,52},{27,-52},{74,23}},
              color={0,0,255},
              smooth=Smooth.Bezier)}));
end Gen2_bus_3249;
