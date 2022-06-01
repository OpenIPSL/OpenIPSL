within OpenIPSL.Electrical.Wind.PSSE.WT3G;
model WT3G1 "Wind Machine Model with DFIG and Ative Power Control done by a Converter (Type 3)"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter Types.PerUnit X_eq "Equivalent reactance for current injection";
  parameter Types.PerUnit K_pll "PLL first integrator gain";
  parameter Types.TimeAging K_ipll "PLL second integrator gain";
  parameter Types.PerUnit P_llmax "PLL maximum limit";
  parameter Types.Power P_rated "Turbine rating, not used in the equation";
  parameter Complex Zs(re=0, im=X_eq) "Equivalent impedance (ZSORCE)"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ApparentPower M_b=100 "Machine base power"
    annotation (Dialog(group="Power flow data"));
  Types.PerUnit VT(start=v_0) "Bus voltage magnitude";
  Types.Angle anglev(start=angle_0) "Bus voltage angle";
  Types.PerUnit VY(start=0) "y-axis terminal voltage";
  Types.PerUnit VX(start=v_0) "x-axis terminal voltage";
  Complex Is "Equivalent internal current source";
  OpenIPSL.Interfaces.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir1),
    ii(start=ii1)) annotation (Placement(transformation(extent={{100,-10},{120,
            10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Continuous.Integrator imIntegrator(
    k=wbase,
    y_start=angle_0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{50,-30},{70,-10}})));
  Modelica.Blocks.Continuous.LimIntegrator imIntegrator1(
    outMin=-P_llmax,
    outMax=P_llmax,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    k=K_ipll) annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=1,
    T=0.02,
    y_start=Eqcmd0)
    annotation (Placement(transformation(extent={{-60,70},{-40,90}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag imSimpleLag1(
    K=1,
    T=0.02,
    y_start=Ix0)
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  Modelica.Blocks.Math.Gain imGain(k=-1/X_eq)
    annotation (Placement(transformation(extent={{-20,70},{0,90}})));
  Modelica.Blocks.Interfaces.RealOutput Iy(start=Iy0) annotation (Placement(
        transformation(extent={{20,70},{40,90}}), iconTransformation(extent={{
            100,-100},{120,-80}})));
  Modelica.Blocks.Interfaces.RealOutput Ix(start=Ix0) annotation (Placement(
        transformation(extent={{20,30},{40,50}}), iconTransformation(extent={{
            100,-70},{120,-50}})));
  Modelica.Blocks.Interfaces.RealOutput Iterm(start=Iy0) annotation (Placement(
        transformation(extent={{98,60},{118,80}}), iconTransformation(extent={{
            -100,-40},{-120,-20}})));
  Modelica.Blocks.Interfaces.RealInput Eqcmd(start=Eqcmd0) annotation (
      Placement(transformation(extent={{-110,70},{-90,90}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        origin={-90,70})));
  Modelica.Blocks.Interfaces.RealInput Ipcmd(start=Ipcmd0) annotation (
      Placement(transformation(extent={{-110,30},{-90,50}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        origin={-90,30})));
  Modelica.Blocks.Math.Gain imGain1(k=K_pll/wbase)
    annotation (Placement(transformation(extent={{-80,-30},{-60,-10}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
  Modelica.Blocks.Nonlinear.Limiter imLimited(uMin=-P_llmax, uMax=P_llmax)
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  Modelica.Blocks.Interfaces.RealOutput delta(start=angle_0) annotation (
      Placement(transformation(extent={{80,-30},{100,-10}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        origin={110,-30})));
  Modelica.Blocks.Interfaces.RealOutput V=VT annotation (Placement(
        transformation(extent={{100,20},{120,40}}), iconTransformation(extent={
            {-100,-80},{-120,-60}})));
  Modelica.Blocks.Interfaces.RealOutput P "On machine base" annotation (
      Placement(transformation(extent={{100,-40},{120,-20}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        origin={110,70})));
  Modelica.Blocks.Interfaces.RealOutput Q annotation (Placement(transformation(
          extent={{100,-80},{120,-60}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        origin={110,30})));
  Modelica.Blocks.Interfaces.RealOutput ipcmd0=Ipcmd0 annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-50,110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,110})));
  Modelica.Blocks.Interfaces.RealOutput eqcmd0=Eqcmd0 annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=-90,
        origin={-70,108}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,110})));
protected
 parameter Types.AngularVelocity wbase=2*C.pi*fn "System base speed";
  parameter Types.PerUnit p0=P_0/M_b
    "initial value of bus active power in p.u. machinebase";
  parameter Types.PerUnit q0=Q_0/M_b
    "initial value of bus reactive power in p.u. machinebase";
  parameter Types.PerUnit vr0=v_0*cos(angle_0)
    "Real component of initial terminal voltage";
  parameter Types.PerUnit vi0=v_0*sin(angle_0)
    "Imaginary component of initial terminal voltage";
  parameter Types.PerUnit ir0=(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2)
    "Real component of initial armature current, mbase";
  parameter Types.PerUnit ii0=(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2)
    "Imaginary component of initial armature current, mbase";
  parameter Types.PerUnit Isr0=ir0 + vi0/X_eq "Source current re mbase";
  parameter Types.PerUnit Isi0=ii0 - vr0/X_eq "Source current im mbase";
  parameter Real CoB=M_b/S_b;
  parameter Types.PerUnit ir1=-CoB*(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2)
    "Real component of initial armature current, sbase";
  parameter Types.PerUnit ii1=-CoB*(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2)
    "Imaginary component of initial armature current, sbase";
  parameter Types.PerUnit Ix0=Isr0*cos(-angle_0) - Isi0*sin(-angle_0);
  parameter Types.PerUnit Iy0=Isr0*sin(-angle_0) + cos(-angle_0)*Isi0;
  parameter Types.PerUnit Eqcmd0=-Iy0*X_eq;
  parameter Types.PerUnit Ipcmd0=Ix0;
  parameter Types.PerUnit VX0=cos(angle_0)*vr0 + sin(angle_0)*vi0;
  parameter Types.PerUnit VY0=(-sin(angle_0)*vr0) + cos(angle_0)*vi0;
protected
  Modelica.Blocks.Interfaces.RealInput Vy annotation (Placement(transformation(
          extent={{-110,-30},{-90,-10}}), iconTransformation(extent={{-118,-40},
            {-96,-18}})));

equation
  anglev = atan2(p.vi, p.vr);
  VT = sqrt(p.vr*p.vr + p.vi*p.vi);
  Iterm = sqrt(p.ir*p.ir + p.ii*p.ii);
  Is.re = p.ir/CoB - p.vi/X_eq;
  //Note that, the positive direction for p.ir is the antidirection of ir0
  Is.im = p.ii/CoB + p.vr/X_eq;
  Vy = VY;
  [Ix; Iy] = -[cos(delta), sin(delta); -sin(delta), cos(delta)]*[Is.re; Is.im];
  [VX; VY] = [cos(delta), sin(delta); -sin(delta), cos(delta)]*[p.vr; p.vi];
  -P = p.vr*p.ir/CoB + p.vi*p.ii/CoB;
  -Q = p.vi*p.ir/CoB - p.vr*p.ii/CoB;
  connect(Eqcmd, imSimpleLag.u)
    annotation (Line(points={{-100,80},{-66.5,80},{-62,80}}, color={0,0,127}));
  connect(Ipcmd, imSimpleLag1.u)
    annotation (Line(points={{-100,40},{-82,40},{-62,40}}, color={0,0,127}));
  connect(add.y, imLimited.u)
    annotation (Line(points={{11,-20},{11,-20},{18,-20}}, color={0,0,127}));
  connect(imLimited.y, imIntegrator.u)
    annotation (Line(points={{41,-20},{48,-20}}, color={0,0,127}));
  connect(imIntegrator.y, delta)
    annotation (Line(points={{71,-20},{71,-20},{90,-20}}, color={0,0,127}));
  connect(Vy, imGain1.u) annotation (Line(points={{-100,-20},{-90,-20},{-82,-20}},
        color={0,0,127}));
  connect(imSimpleLag.y, imGain.u)
    annotation (Line(points={{-39,80},{-39,80},{-22,80}}, color={0,0,127}));
  connect(imGain.y, Iy)
    annotation (Line(points={{1,80},{30,80},{30,80}}, color={0,0,127}));
  connect(imSimpleLag1.y, Ix)
    annotation (Line(points={{-39,40},{30,40},{30,40}}, color={0,0,127}));
  connect(imGain1.y, add.u2) annotation (Line(points={{-59,-20},{-40,-20},{-20,
          -20},{-20,-26},{-12,-26}}, color={0,0,127}));
  connect(imIntegrator1.u, add.u2) annotation (Line(points={{-42,10},{-50,10},{
          -50,-20},{-20,-20},{-20,-26},{-12,-26}}, color={0,0,127}));
  connect(imIntegrator1.y, add.u1) annotation (Line(points={{-19,10},{-16,10},{
          -16,-14},{-12,-14}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-42,18},{48,-10}},
          lineColor={28,108,200},
          textString="WT3G1"),Text(
          extent={{-98,-24},{-84,-36}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="V"),Text(
          extent={{80,76},{94,64}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="P"),Text(
          extent={{80,36},{94,24}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Q"),Text(
          extent={{-74,36},{-40,24}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Ipcmd"),Text(
          extent={{-74,76},{-40,64}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Eqcmd"),Text(
          extent={{72,-24},{98,-36}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="delta"),Text(
          extent={{-98,-64},{-72,-76}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Iterm"),Text(
          extent={{74,-52},{98,-64}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="I_x"),Text(
          extent={{74,-84},{98,-96}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="I_y"),Text(
          extent={{-66,96},{-32,84}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Eqcmd0"),Text(
          extent={{-26,96},{8,84}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Ipcmd0")}));
end WT3G1;
