package Hisken
  package DAIS
    model TransformerDiscrete
      parameter Real n0 = 1.0375 "Initial tap ratio, from power flow";
      parameter Real n_step = 0.0125;
      parameter Real Ttap = 20;
      parameter Real vlow = 1.04;
      parameter Real m_max = 1.1;
      parameter Real m_step = 0.0125;
      Real m(start = n0) "Tap ratio";
      Real vk "Voltage at primary, p.u.";
      Real vm "Voltage at secondary p.u.";
      Real anglevk "Angle at primary";
      Real anglevm "Angle at secondary ";
      Real x1(start = 0);
      Real y1;
      Real y2;
      Real y5;
      Real y7;
      Real y6;
      PowerSystems.Connectors.PwPin p annotation (
        Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
      PowerSystems.Connectors.PwPin n annotation (
        Placement(transformation(extent = {{100, -8}, {120, 12}})));
    public
      Modelica.Blocks.Logical.ZeroCrossing zeroCrossing(enable = true) annotation (
        Placement(transformation(extent = {{-8, -12}, {12, 8}})));
    equation
      n.vi = p.vi * m;
      n.vr = p.vr * m;
      p.ir + n.ir * m = 0;
      p.ii + n.ii * m = 0;
      vk = sqrt(p.vr ^ 2 + p.vi ^ 2);
      vm = sqrt(n.vr ^ 2 + n.vi ^ 2);
      anglevk = atan2(p.vi, p.vr);
      anglevm = atan2(n.vi, n.vr);
      der(x1) = y1 * y7;
      y2 + vlow - vm = 0;
      y6 - m + m_max - m_step / 2 = 0;
      y5 - x1 + Ttap = 0;
      if y2 < 0 then
        y1 = 1;
      else
        y1 = 0;
      end if;
      if y6 < 0 then
        y7 = 1;
      else
        y7 = 0;
      end if;
      zeroCrossing.u = y5;
      when zeroCrossing.y then
        reinit(x1, 0);
        m = pre(m) + m_step;
      end when;
    end TransformerDiscrete;

    model Load_Hisken
      parameter Real P0 = 0.4 "Active power";
      parameter Real Q0 = 0 "Reactive power";
      parameter Real Pt = 0.4;
      parameter Real As = 0;
      parameter Real At = 2;
      parameter Real Bs = 0;
      parameter Real Bt = 2;
      parameter Real Tp = 5;
      parameter Real Tq = 5;
      Real Pd(start = P0);
      Real xp;
      Real v;
      Real angle;
      //Real Pt;
      PowerSystems.Connectors.PwPin p annotation (
        Placement(transformation(extent = {{-56.0, -10.0}, {-36.0, 10.0}}, origin = {10, 10}), iconTransformation(extent = {{-80.0, 0.0}, {-60.0, 20.0}}, origin = {-40.0, -10.0})));
    equation
      der(xp) = 1/Tp*(P0 - Pd);
      Pd = xp + Pt*(v^2);
      Pd = p.vr*p.ir + p.vi*p.ii;
      Q0 = p.vi*p.ir - p.vr*p.ii;
      angle = atan2(p.vi, p.vr);
      v = sqrt(p.vr^2 + p.vi^2);
    end Load_Hisken;

    model Test_System_HiskenLoad
      PowerSystems.Electrical.Buses.Bus B1 annotation (
        Placement(transformation(extent = {{-131, -10}, {-111, 10}})));
      PowerSystems.Electrical.Buses.Bus B2 annotation (
        Placement(transformation(extent = {{-51, -10}, {-31, 10}})));
      PowerSystems.Electrical.Buses.Bus B3 annotation (
        Placement(transformation(extent = {{13, -10}, {33, 10}})));
      PowerSystems.Electrical.Buses.Bus B4 annotation (
        Placement(transformation(extent = {{69, -10}, {89, 10}})));
      PowerSystems.Electrical.Branches.PwLine pwLine4(G = 0, R = 0, X = 0.65, B = 0) annotation (
        Placement(transformation(origin = {-84, 14}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      PowerSystems.Electrical.Branches.PwLine pwLine2(G = 0, R = 0, X = 0.80, B = 0) annotation (
        Placement(transformation(origin = {50, 0}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      PowerSystems.Electrical.Buses.InfiniteBus infiniteBus(v = 1.05, angle = 0) annotation (
        Placement(transformation(extent = {{-160, -10}, {-140, 10}})));
      TransformerDiscrete transformerDiscrete annotation (
        Placement(transformation(extent = {{-20, -10}, {0, 10}})));
      PowerSystems.Electrical.Branches.PwLinewith2Openings pwLinewith2Openings(B = 0, G = 0, R = 0, X = 0.40625, t1 = 20,
        t2=200) annotation (
        Placement(transformation(extent = {{-94, -24}, {-74, -4}})));
      Load_Hisken load_Hisken annotation (
        Placement(transformation(extent = {{100, -10}, {120, 10}})));
    equation
      connect(pwLine4.n, B2.p) annotation (
        Line(points = {{-77, 14}, {-64, 14}, {-64, 0}, {-41, 0}}, color = {0, 0, 255}));
      connect(pwLine4.p, B1.p) annotation (
        Line(points = {{-91, 14}, {-106, 14}, {-106, 0}, {-121, 0}}, color = {0, 0, 255}));
      connect(B3.p, pwLine2.p) annotation (
        Line(points = {{23, 0}, {43, 0}}, color = {0, 0, 255}));
      connect(pwLine2.n, B4.p) annotation (
        Line(points = {{57, 0}, {79, 0}}, color = {0, 0, 255}));
      connect(infiniteBus.p, B1.p) annotation (
        Line(points = {{-139, 0}, {-121, 0}, {-121, 0}}, color = {0, 0, 255}));
      connect(transformerDiscrete.n, B3.p) annotation (
        Line(points = {{1, 0.2}, {12.5, 0.2}, {12.5, 0}, {23, 0}}, color = {0, 0, 255}));
      connect(transformerDiscrete.p, B2.p) annotation (
        Line(points = {{-21, 0}, {-21, 0}, {-41, 0}}, color = {0, 0, 255}));
      connect(pwLinewith2Openings.n, B2.p) annotation (
        Line(points = {{-77, -14}, {-64, -14}, {-64, 0}, {-41, 0}}, color = {0, 0, 255}));
      connect(pwLinewith2Openings.p, B1.p) annotation (
        Line(points = {{-91, -14}, {-106, -14}, {-106, 0}, {-121, 0}}, color = {0, 0, 255}));
      connect(B4.p, load_Hisken.p) annotation (
        Line(points = {{79, 0}, {99, 0}}, color = {0, 0, 255}));
      annotation (
        Diagram(coordinateSystem(extent = {{-160, -100}, {120, 100}}, preserveAspectRatio = false)),
        Icon(coordinateSystem(extent = {{-160, -100}, {120, 100}})),
        experiment(StopTime = 300, Interval = 0.001, Tolerance = 0.0001, __Dymola_Algorithm = "Dassl"));
    end Test_System_HiskenLoad;

    model TransformerDiscrete2 "Tap changer updated"
      parameter Real m0 = 1.0375 "Initial tap ratio, from power flow";
      parameter Real n_step = 0.0125 "Step size";
      parameter Real Ttap = 20 "Time delay of tap change, second";
      parameter Real vlow = 1.04 "Lower voltage deadband, p.u.";
      parameter Real vhigh = 1.06 "Upper voltage deadband, p.u.";
      parameter Real m_max = 1.1 "Maximum tap position";
      parameter Real m_min = 0.9 "Minimum tap position";
      parameter Real m_step = 0.0125 "Step size";
      Real m(start = m0) "Tap ratio";
      Real vk "Voltage at primary, p.u.";
      Real vm "Voltage at secondary p.u.";
      Real anglevk "Angle at primary";
      Real anglevm "Angle at secondary ";
      Real x1(start = 0) "Timer";
      Real y1;
      Real y2;
      Real y3;
      Real y4;
      Real y5;
      Real y7;
      Real y6;
      OpenIPSL.Interfaces.PwPin p annotation (
        Placement(transformation(extent = {{-120, -10}, {-100, 10}})));
      OpenIPSL.Interfaces.PwPin n annotation (
        Placement(transformation(extent = {{100, -8}, {120, 12}})));
    public
      Modelica.Blocks.Logical.ZeroCrossing zeroCrossing(enable = true) annotation (
        Placement(transformation(extent = {{-8, -12}, {12, 8}})));
    equation
      n.vi = p.vi * m;
      n.vr = p.vr * m;
      p.ir + n.ir * m = 0;
      p.ii + n.ii * m = 0;
      vk = sqrt(p.vr ^ 2 + p.vi ^ 2);
      vm = sqrt(n.vr ^ 2 + n.vi ^ 2);
      anglevk = atan2(p.vi, p.vr);
      anglevm = atan2(n.vi, n.vr);
      der(x1) = y1 * y7;
      y2 + vlow - vm = 0;
      y3 - vhigh + vm = 0;
      y6 - m + m_max - m_step / 2 = 0;
      y4 - m + m_min - m_step / 2 = 0;
      y5 - x1 + Ttap = 0;
      if y2 < 0 or y3 <0 then
        y1 = 1;
      else
        y1 = 0;
      end if;
      if y6 < 0 and vm < vlow then
        y7 = 1;
      elseif y4 > 0 and vm > vhigh then
        y7 = 1;
      else
        y7 = 0;
      end if;
      zeroCrossing.u = y5;
      when zeroCrossing.y and y2 < 0 then
        reinit(x1, 0);
        m = pre(m) + m_step;
      elsewhen zeroCrossing.y and y3 < 0 then
        reinit(x1, 0);
        m = pre(m) - m_step;
      end when;
    end TransformerDiscrete2;

    model Test_System_HiskenLoad_new "OpenIPSL and updated tap changer"
      OpenIPSL.Electrical.Buses.Bus B1 annotation (
        Placement(transformation(extent = {{-131, -10}, {-111, 10}})));
      OpenIPSL.Electrical.Buses.Bus B2 annotation (
        Placement(transformation(extent = {{-51, -10}, {-31, 10}})));
      OpenIPSL.Electrical.Buses.Bus B3 annotation (
        Placement(transformation(extent = {{13, -10}, {33, 10}})));
      OpenIPSL.Electrical.Buses.Bus B4 annotation (
        Placement(transformation(extent = {{69, -10}, {89, 10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine4(G = 0, R = 0, X = 0.65, B = 0) annotation (
        Placement(transformation(origin = {-84, 14}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      OpenIPSL.Electrical.Branches.PwLine pwLine2(G = 0, R = 0, X = 0.80, B = 0) annotation (
        Placement(transformation(origin = {50, 0}, extent = {{-10.0, -10.0}, {10.0, 10.0}})));
      OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(v_0 = 1.05) annotation (
        Placement(transformation(extent = {{-160, -10}, {-140, 10}})));
      TransformerDiscrete2 transformerDiscrete annotation (
        Placement(transformation(extent = {{-20, -10}, {0, 10}})));
      OpenIPSL.Electrical.Branches.PwLine pwLinewith2Openings(B = 0, G = 0, R = 0, X = 0.40625, t1 = 20, t2 = 200) annotation (
        Placement(transformation(extent = {{-94, -24}, {-74, -4}})));
      Load_Hisken_new load_Hisken annotation (
        Placement(transformation(extent = {{100, -10}, {120, 10}})));
      inner OpenIPSL.Electrical.SystemBase SysData annotation (
        Placement(transformation(origin = {-132, 66}, extent = {{-12, -10}, {12, 10}})));
    equation
      connect(pwLine4.n, B2.p) annotation (
        Line(points={{-75,14},{-64,14},{-64,0},{-41,0}}, color = {0, 0, 255}));
      connect(pwLine4.p, B1.p) annotation (
        Line(points={{-93,14},{-106,14},{-106,0},{-121,0}}, color = {0, 0, 255}));
      connect(B3.p, pwLine2.p) annotation (
        Line(points={{23,0},{41,0}}, color = {0, 0, 255}));
      connect(pwLine2.n, B4.p) annotation (
        Line(points={{59,0},{79,0}}, color = {0, 0, 255}));
      connect(infiniteBus.p, B1.p) annotation (
        Line(points={{-140,0},{-121,0},{-121,0}}, color = {0, 0, 255}));
      connect(transformerDiscrete.n, B3.p) annotation (
        Line(points = {{1, 0.2}, {12.5, 0.2}, {12.5, 0}, {23, 0}}, color = {0, 0, 255}));
      connect(transformerDiscrete.p, B2.p) annotation (
        Line(points = {{-21, 0}, {-21, 0}, {-41, 0}}, color = {0, 0, 255}));
      connect(pwLinewith2Openings.n, B2.p) annotation (
        Line(points={{-75,-14},{-64,-14},{-64,0},{-41,0}}, color = {0, 0, 255}));
      connect(pwLinewith2Openings.p, B1.p) annotation (
        Line(points={{-93,-14},{-106,-14},{-106,0},{-121,0}}, color = {0, 0, 255}));
      connect(B4.p, load_Hisken.p) annotation (
        Line(points = {{79, 0}, {99, 0}}, color = {0, 0, 255}));
      annotation (
        Diagram(coordinateSystem(extent = {{-160, -100}, {120, 100}}, preserveAspectRatio = false)),
        Icon(coordinateSystem(extent = {{-160, -100}, {120, 100}})),
        experiment(StopTime = 350, Interval = 0.01, Tolerance = 0.0001, __Dymola_Algorithm = "Dassl"));
    end Test_System_HiskenLoad_new;

    model Load_Hisken_new
      parameter Real P0 = 0.4 "Active power";
      parameter Real Q0 = 0 "Reactive power";
      parameter Real Pt = 0.4;
      parameter Real As = 0;
      parameter Real At = 2;
      parameter Real Bs = 0;
      parameter Real Bt = 2;
      parameter Real Tp = 5;
      parameter Real Tq = 5;
      Real Pd(start = P0);
      Real xp;
      Real v;
      Real angle;
      //Real Pt;
      OpenIPSL.Interfaces.PwPin p annotation (
        Placement(transformation(extent = {{-56.0, -10.0}, {-36.0, 10.0}}, origin = {10, 10}), iconTransformation(extent = {{-80.0, 0.0}, {-60.0, 20.0}}, origin = {-40.0, -10.0})));
    equation
      der(xp) = 1 / Tp * (P0 - Pd);
      Pd = xp + Pt * v ^ 2;
      Pd = p.vr * p.ir + p.vi * p.ii;
      Q0 = p.vi * p.ir - p.vr * p.ii;
      angle = atan2(p.vi, p.vr);
      v = sqrt(p.vr ^ 2 + p.vi ^ 2);
    end Load_Hisken_new;

  end DAIS;
  annotation (
    uses(Modelica(version = "3.2.2"), OpenIPSL(version = "2.0.0-dev")));
end Hisken;
