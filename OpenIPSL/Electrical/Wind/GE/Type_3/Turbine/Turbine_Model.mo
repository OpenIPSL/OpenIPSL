within OpenIPSL.Electrical.Wind.GE.Type_3.Turbine;
model Turbine_Model "Type 3 wind turbine model"
  parameter Types.ApparentPower GEN_base=1000000;
  parameter Types.ApparentPower WT_base=1000000;
  parameter Real Kpp=1;
  parameter Real Kip=1;
  parameter Types.TimeAging pirat=1;
  parameter Types.Angle pimax=1;
  parameter Types.Angle pimin=1;
  parameter Types.TimeAging pwrat=1;
  parameter Types.PerUnit pwmax=1;
  parameter Types.PerUnit pwmin=1;
  parameter Real Kic=1;
  parameter Real Kpc=1;
  parameter Types.Time Tp=1;
  parameter Types.Time Tpc=1;
  parameter Real Kptrq=1;
  parameter Real Kitrq=1;
  parameter Real Dtg=1;
  parameter Types.Time H=1;
  parameter Types.Time Hg=1;
  parameter Real Ktg=1;
  parameter Real KI=1;
  parameter Real wndtge_kp=1;
  parameter Types.PerUnit wt_x0_0=1;
  parameter Types.PerUnit wt_x1_0=1;
  parameter Types.PerUnit wt_x2_0=1;
  parameter Types.PerUnit wt_x3_0=1;
  parameter Types.PerUnit wt_x4_0=1;
  parameter Types.PerUnit wt_x5_0=1;
  parameter Types.PerUnit wt_x6_0=1;
  parameter Types.PerUnit wt_x7_0=1;
  parameter Types.PerUnit wt_x8_0=1;
  parameter Types.PerUnit wt_x9_0=1;
  parameter Real wbase=1;
  parameter Real wndtge_ang0=1;
  parameter Real wndtge_spd0=1;
  Modelica.Blocks.Interfaces.RealInput Pelec "Electrical power" annotation (
      Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-88.0,11.0}),
      iconTransformation(
        origin={2.0,-137.1586},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealInput Wind_Speed "Wind speed" annotation (
      Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-88.0,-29.0}),
      iconTransformation(
        origin={2.0,-7.5581},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealOutput Pord "Active power command" annotation (
     Placement(
      transformation(
        extent={{102.0,54.0},{62.0,94.0}},
        origin={128.0,-75.6493}),
      iconTransformation(
        origin={-2.0,-7.6782},
        extent={{102.0,54.0},{62.0,94.0}})));
  Rotor_Model rotor_Model1(
    wt_x6_0=wt_x6_0,
    wt_x7_0=wt_x7_0,
    wt_x8_0=wt_x8_0,
    wt_x9_0=wt_x9_0,
    Dtg=Dtg,
    H=H,
    Hg=Hg,
    Ktg=Ktg,
    wbase=wbase,
    wndtge_ang0=wndtge_ang0,
    wndtge_spd0=wndtge_spd0) annotation (Placement(transformation(
        origin={-100.5502,45.01},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Wind_Power_Model wind_Power_Model1(KI=KI, wndtge_kp=wndtge_kp) annotation (
      Placement(transformation(
        origin={-132.1327,37.6573},
        extent={{-10.0,-10.0},{10.0,10.0}})));
protected
  Boolean thlim1(start=true);
  Boolean pwlim2(start=true);
  Modelica.Blocks.Math.Gain Change_Base(k=GEN_base/WT_base) annotation (
      Placement(transformation(
        origin={-130.0,85.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(
        origin={-92.0602,80.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Continuous.Integrator integrator1(k=1/5, y_start=wt_x5_0)
    annotation (Placement(transformation(
        origin={-66.7293,85.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add2(k1=-1) annotation (Placement(transformation(
        origin={-35.0,58.2372},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Gain Gain_Kpp(k=Kpp) annotation (Placement(transformation(
        origin={-6.8708,73.0513},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Continuous.Integrator integrator2(k=Kip, y_start=wt_x1_0)
    annotation (Placement(transformation(
        origin={-1.8708,43.0036},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add3 add31 annotation (Placement(transformation(
        origin={23.3965,65.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Continuous.Integrator integrator3(k=Kic, y_start=wt_x3_0)
    annotation (Placement(transformation(
        origin={-35.0,-32.7609},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add3 annotation (Placement(transformation(
        origin={-7.225,-25.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Gain Gain_Kpc(k=Kpc) annotation (Placement(transformation(
        origin={-35.0,1.579},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add4(k1=-1) annotation (Placement(transformation(
        origin={-105.0,-11.8301},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add5(k2=-1) annotation (Placement(transformation(
        origin={52.373,60.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Gain Gain_iTP(k=1/Tp) annotation (Placement(transformation(
        origin={80.0,60.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=pirat) annotation (Placement(
        transformation(
        origin={107.1696,60.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator1(
    y_start=wt_x0_0,
    outMax=pimax,
    outMin=pimin,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(
        transformation(
        origin={135.0,60.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Gain Gain_Kptrq(k=Kptrq) annotation (Placement(transformation(
        origin={-35.0,-75.421},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add6 annotation (Placement(transformation(
        origin={-7.225,-82.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Continuous.Integrator integrator4(k=Kitrq, y_start=wt_x2_0)
    annotation (Placement(transformation(
        origin={-35.0,-106.8211},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
        origin={22.2601,-70.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Continuous.LimIntegrator limIntegrator2(
    outMax=pwmax,
    outMin=pwmin,
    y_start=wt_x4_0) annotation (Placement(transformation(
        origin={139.1753,-76.2002},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax=pwrat) annotation (Placement(
        transformation(
        origin={111.3449,-76.2002},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Gain Gain_iTPc(k=1/Tpc) annotation (Placement(transformation(
        origin={84.1753,-76.2002},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Add add8(k2=-1) annotation (Placement(transformation(
        origin={56.5483,-76.2002},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Math.Gain Change_Base1(k=WT_base/GEN_base) annotation (
      Placement(transformation(
        origin={175.0,-1.9789},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Sources.Constant const(k=1) annotation (Placement(transformation(
        origin={-147.5253,-5.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
equation
  connect(Pelec, Change_Base.u) annotation (Line(
      origin={-156.0,85.0},
      points={{-14.0,0.0},{14.0,0.0}},
      color={0,0,127}));
  connect(Wind_Speed, wind_Power_Model1.Wind_Speed) annotation (Line(
      origin={-150.1058,44.9084},
      points={{-19.8942,0.0916},{4.9606,0.0916},{4.9606,-0.09163},{9.9731,-0.09163}},
      color={0,0,127}));

  connect(integrator1.y, add2.u1) annotation (Line(
      origin={-50.6823,74.6186},
      points={{-5.047,10.3814},{0.6823,10.3814},{0.6823,-10.3814},{3.6823,-10.3814}},
      color={0,0,127}));

  connect(add1.u2, integrator1.y) annotation (Line(
      origin={-79.8948,75.9958},
      points={{-24.1654,-1.9958},{-25.1654,-1.9958},{-25.1654,-7.0083},{25.1654,
          -7.0083},{25.1654,9.0042},{24.1655,9.0042}},
      color={0,0,127}));
  connect(add1.y, integrator1.u) annotation (Line(
      origin={-79.812,82.5},
      points={{-1.2482,-2.5},{0.0827,-2.5},{0.0827,2.5},{1.0827,2.5}},
      color={0,0,127}));
  connect(Change_Base1.y, Pord) annotation (Line(
      origin={193.5,-1.8141},
      points={{-7.5,-0.1648},{-4.5,-0.1648},{-4.5,0.1648},{16.5,0.1648}},
      color={0,0,127}));
  connect(const.y, add4.u1) annotation (Line(
      origin={-128.3813,-14.5849},
      points={{-8.144,9.5849},{-1.6187,9.5849},{-1.6187,9.5849},{11.3813,8.7548}},
      color={0,0,127}));

  connect(add4.u2, limIntegrator2.y) annotation (Line(
      origin={16.5876,-49.6768},
      points={{-133.588,31.8467},{-136.588,31.8467},{-136.588,-5.3232},{136.588,
          -5.3232},{136.588,-26.5234},{133.588,-26.5234}},
      color={0,0,127}));
  connect(limIntegrator2.y, Change_Base1.u) annotation (Line(
      origin={158.2938,-39.0896},
      points={{-8.1185,-37.1106},{1.7062,-37.1106},{1.7062,37.1107},{4.7062,
          37.1107}},
      color={0,0,127}));
  connect(add8.y, Gain_iTPc.u) annotation (Line(
      origin={69.8618,-76.2002},
      points={{-2.3135,0.0},{2.3135,0.0}},
      color={0,0,127}));
  connect(add5.y, Gain_iTP.u) annotation (Line(
      origin={65.6865,60.0},
      points={{-2.3135,0.0},{2.3135,0.0}},
      color={0,0,127}));
  connect(Gain_iTPc.y, limiter2.u) annotation (Line(
      origin={97.2601,-76.2002},
      points={{-2.0848,0.0},{2.0848,0.0}},
      color={0,0,127}));
  connect(product1.y, add8.u1) annotation (Line(
      origin={34.2519,-67.0},
      points={{-0.9918,-3.0},{7.2964,-3.2002},{7.2964,-3.2002},{10.2964,-3.2002}},
      color={0,0,127}));

  connect(limIntegrator2.y, add8.u2) annotation (Line(
      origin={97.3618,-84.8669},
      points={{52.8135,8.6667},{55.8135,8.6667},{55.8135,-11.3333},{-55.8135,-11.3333},
          {-55.8135,2.6667},{-52.8135,2.6667}},
      color={0,0,127}));
  connect(limiter2.y, limIntegrator2.u) annotation (Line(
      origin={124.7601,-76.2002},
      points={{-2.4152,0.0},{2.4152,0.0}},
      color={0,0,127}));
  connect(integrator4.y, add6.u2) annotation (Line(
      origin={-20.9188,-97.4105},
      points={{-3.0812,-9.4106},{0.6938,-9.4106},{0.6938,9.4105},{1.6938,9.4105}},
      color={0,0,127}));

  connect(add31.u2, integrator2.y) annotation (Line(
      origin={10.196,54.0018},
      points={{1.2005,10.9982},{-0.0668,10.9982},{-0.0668,-10.9982},{-1.0668,-10.9982}},
      color={0,0,127}));

  connect(add3.y, add31.u3) annotation (Line(
      origin={11.1982,16.0},
      points={{-7.4232,-41.0},{0.4054,-41.0},{0.4054,41.0},{0.1983,41.0}},
      color={0,0,127}));
  connect(add2.y, Gain_Kptrq.u) annotation (Line(
      origin={-40.3485,3.0264},
      points={{16.3485,55.2108},{17.0758,55.6318},{17.0758,22.3946},{-19.6515,
          22.3946},{-19.6515,-78.0264},{-6.6515,-78.4474}},
      color={0,0,127}));
  connect(rotor_Model1.omega_gen, product1.u1) annotation (Line(
      origin={-41.5592,-14.7662},
      points={{-50.991,66.7762},{-26.3238,66.7762},{-26.3238,-42.1593},{51.8193,
          -42.1593},{51.8193,-49.2338}},
      color={0,0,127}));
  connect(add6.y, product1.u2) annotation (Line(
      origin={7.1388,-79.0},
      points={{-3.3638,-3.0},{0.1213,-3.0},{0.1213,3.0},{3.1213,3.0}},
      color={0,0,127}));
  connect(Gain_Kptrq.y, add6.u1) annotation (Line(
      origin={-20.9188,-75.7105},
      points={{-3.0812,0.2895},{0.6938,0.2895},{0.6938,-0.2895},{1.6938,-0.2895}},
      color={0,0,127}));

  connect(wind_Power_Model1.Theta, limIntegrator1.y) annotation (Line(
      origin={-28.0648,76.8501},
      points={{-112.068,-39.4497},{-117.08,-39.4497},{-117.08,28.1499},{-91.0554,
          28.1499},{177.065,28.1499},{177.065,-16.8501},{174.065,-16.8501}},
      color={0,0,127}));
  connect(limIntegrator1.y, add5.u2) annotation (Line(
      origin={93.1865,51.3333},
      points={{52.8135,8.6667},{55.8135,8.6667},{55.8135,-11.3333},{-55.8135,-11.3333},
          {-55.8135,2.6667},{-52.8135,2.6667}},
      color={0,0,127}));
  connect(limiter1.y, limIntegrator1.u) annotation (Line(
      origin={120.5848,60.0},
      points={{-2.4152,0.0},{2.4152,0.0}},
      color={0,0,127}));
  connect(Gain_iTP.y, limiter1.u) annotation (Line(
      origin={93.0848,60.0},
      points={{-2.0848,0.0},{2.0848,0.0}},
      color={0,0,127}));
  connect(add31.y, add5.u1) annotation (Line(
      origin={38.3789,65.5},
      points={{-3.9824,-0.5},{0.9941,-0.5},{0.9941,0.5},{1.9941,0.5}},
      color={0,0,127}));
  connect(integrator3.y, add3.u2) annotation (Line(
      origin={-20.9188,-31.8805},
      points={{-3.0812,-0.8804},{0.6937,-0.8804},{0.6937,0.8805},{1.6938,0.8805}},
      color={0,0,127}));

  connect(add4.y, Gain_Kpc.u) annotation (Line(
      origin={-60.25,-5.1256},
      points={{-33.75,-6.7045},{10.25,-6.7045},{10.25,6.7046},{13.25,6.7046}},
      color={0,0,127}));
  connect(Gain_Kpc.y, add3.u1) annotation (Line(
      origin={-21.6125,-9.689},
      points={{-2.3875,11.268},{0.6125,11.268},{0.6125,-1.957},{-0.6125,-1.957},
          {-0.6125,-9.311},{2.3875,-9.311}},
      color={0,0,127}));
  connect(Gain_Kpp.y, add31.u1) annotation (Line(
      origin={8.0797,73.0257},
      points={{-3.9505,0.0256},{0.3168,0.0256},{0.3168,-0.0257},{3.3168,-0.0257}},
      color={0,0,127}));

  connect(add2.y, Gain_Kpp.u) annotation (Line(
      origin={-20.6531,65.6443},
      points={{-3.3469,-7.4071},{0.7823,-7.4071},{0.7823,7.407},{1.7823,7.407}},
      color={0,0,127}));

  connect(Change_Base.y, rotor_Model1.Pe) annotation (Line(
      origin={-111.2201,65.5087},
      points={{-7.7799,19.4913},{1.2201,19.4913},{1.2201,-12.8593},{2.6699,-12.8593},
          {2.6699,-13.2639}},
      color={0,0,127}));
  connect(rotor_Model1.omega_gen, add2.u2) annotation (Line(
      origin={-64.1526,52.1236},
      points={{-28.3976,-0.1136},{14.1526,-0.1136},{14.1526,0.1136},{17.1526,
          0.1136}},
      color={0,0,127}));
  connect(wind_Power_Model1.Pm, rotor_Model1.Pm) annotation (Line(
      origin={-114.9521,38.2345},
      points={{-9.1806,-0.31293},{1.3894,-0.31293},{1.3894,0.31291},{6.4019,
          0.31291}},
      color={0,0,127}));
  connect(rotor_Model1.omega_turb, wind_Power_Model1.omega) annotation (Line(
      origin={-116.3415,31.1587},
      points={{23.7913,7.24754},{28.8037,7.24754},{28.8037,-6.5139},{-28.8037,-6.5139},
          {-28.8037,-0.73366},{-23.7912,-0.73366}},
      color={0,0,127}));
  add1.u1 = if Change_Base.y >= 0.75 then 1.2 else ((-0.67*Change_Base.y) +
    1.42)*Change_Base.y + 0.51;
  integrator2.u = if thlim1 then add2.y else 0;
  integrator3.u = if thlim1 then add4.y else 0;
  integrator4.u = if pwlim2 then add2.y else 0;
  thlim1 = not (limIntegrator1.y <= pimin + C.eps and limiter1.y < 0);
  pwlim2 = not (limIntegrator2.y >= pwmax and limiter2.y > 0);
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        grid={10,10}), graphics={Rectangle(
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          fillPattern=FillPattern.Solid,
          extent={{-44.9792,-41.316},{44.9792,41.316}},
          textString="Turbine",
          fontName="Arial")}),
    Diagram(coordinateSystem(
        extent={{-210.0,-148.5},{210.0,148.5}},
        preserveAspectRatio=true,
        grid={5,5})));
end Turbine_Model;
