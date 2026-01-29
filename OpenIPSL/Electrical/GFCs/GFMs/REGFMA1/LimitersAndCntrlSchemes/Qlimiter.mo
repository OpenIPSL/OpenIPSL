within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.LimitersAndCntrlSchemes;
model Qlimiter "Reactiver power limiter"
  Modelica.Blocks.Sources.Constant Qmax_val(k=Qmax)
    "Upper limit of the inverter reactive power output"
    annotation (Placement(transformation(extent={{-180,120},{-140,160}})));
  Modelica.Blocks.Sources.Constant Qmin_val(k=Qmin)
    "Lower limit of the inverter active power output"
    annotation (Placement(transformation(extent={{-180,-160},{-140,-120}})));
  Modelica.Blocks.Interfaces.RealInput Qfilt
    "Filtered measurement of the reactive power"
    annotation (Placement(transformation(extent={{-240,-20},{-200,20}})));
  Modelica.Blocks.Math.Feedback error_Qmax_Qfilt
    "Error junction of Qmax - Qfilt "
    annotation (Placement(transformation(extent={{-120,120},{-80,160}})));
  Modelica.Blocks.Math.Feedback error_Qmin_Qfilt
    "Error junction of Qmin - Qfilt "
    annotation (Placement(transformation(extent={{-120,-120},{-80,-160}})));
  Modelica.Blocks.Math.Add add_Qmax_PI
    annotation (Placement(transformation(extent={{40,120},{80,160}})));
  Modelica.Blocks.Math.Add add_Qmin_PI
    annotation (Placement(transformation(extent={{40,-160},{80,-120}})));
  Modelica.Blocks.Math.Gain gain_kpqmax_Qmax(k=kpqmax)
    "Proportional gain of the overload mitigation controller"
    annotation (Placement(transformation(extent={{-40,120},{0,160}})));
  Modelica.Blocks.Continuous.LimIntegrator lim_kiqmax_Qmax(
    k=kiqmax,
    outMax=0.0,
    outMin=-Modelica.Constants.inf,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    limitsAtInit=false,
    y_start=Qmax - Q0)
    annotation (Placement(transformation(extent={{-40,40},{0,80}})));
  Modelica.Blocks.Interfaces.RealInput Q0_ini
    "Initial value of the of the active power" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-220})));

  Modelica.Blocks.Nonlinear.Limiter lim_Qmax_out(uMax=0.0, uMin=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{100,120},{140,160}})));
  Modelica.Blocks.Math.Add add_Qmaxlim_and_Qminlim
    annotation (Placement(transformation(extent={{160,-10},{180,10}})));
  Modelica.Blocks.Interfaces.RealOutput Qlim_out
    "Reactive power limiter output signal"
    annotation (Placement(transformation(extent={{200,-10},{220,10}})));
  Modelica.Blocks.Nonlinear.Limiter lim_Qmin_out(uMax=Modelica.Constants.inf,
      uMin=0)
    annotation (Placement(transformation(extent={{100,-160},{140,-120}})));

  parameter Real Qmax=0.44 "Upper limit of the inverter reactive power output. Normal Range: [0.44-1.0] pu";
  parameter Real Qmin=-0.44 "Lower limit of the inverter reactive power output. Normal Range: [-0.44 - -1.0] pu";
  parameter Real kpqmax=3.0
    "Proportional gain of the Qmax and Qmin controller. Range when VFLAG=1 is [1-5] pu. Range when VFLAG = 0, [0-0.5] pu";
  Modelica.Blocks.Math.Gain gain_kpqmax_Qmax1(k=kpqmax)
    "Proportional gain of the overload mitigation controller"
    annotation (Placement(transformation(extent={{-40,-160},{0,-120}})));
  Modelica.Blocks.Continuous.LimIntegrator lim_kiqmax_Qmin(
    k=kiqmax,
    outMax=Modelica.Constants.inf,
    outMin=0.0,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    limitsAtInit=false,
    y_start=Qmin - Q0)
    annotation (Placement(transformation(extent={{-40,-100},{0,-60}})));
  parameter Real kiqmax=20.0 "Integral gain of the Qmax and Qmin Controller. Range when VFLAG=1 is [3-20] pu. Range when VFLAG = 0, [3-30] pu";
protected
  parameter Real Q0(fixed=false);
initial equation
    Q0 = Q0_ini "Maps the value coming from the voltage source to the inital value of Q0 used by the filter block";

equation
  connect(Qfilt,error_Qmax_Qfilt. u2)
    annotation (Line(points={{-220,0},{-100,0},{-100,124}}, color={0,0,127}));
  connect(Qmax_val.y,error_Qmax_Qfilt. u1)
    annotation (Line(points={{-138,140},{-116,140}}, color={0,0,127}));
  connect(Qmin_val.y,error_Qmin_Qfilt. u1)
    annotation (Line(points={{-138,-140},{-116,-140}}, color={0,0,127}));
  connect(error_Qmin_Qfilt.u2,Qfilt)
    annotation (Line(points={{-100,-124},{-100,0},{-220,0}}, color={0,0,127}));
  connect(error_Qmax_Qfilt.y,gain_kpqmax_Qmax. u)
    annotation (Line(points={{-82,140},{-44,140}}, color={0,0,127}));
  connect(lim_kiqmax_Qmax.u,error_Qmax_Qfilt. y) annotation (Line(points={{
          -44,60},{-60,60},{-60,140},{-82,140}}, color={0,0,127}));
  connect(gain_kpqmax_Qmax.y,add_Qmax_PI. u1) annotation (Line(points={{2,
          140},{26,140},{26,152},{36,152}}, color={0,0,127}));
  connect(lim_kiqmax_Qmax.y,add_Qmax_PI. u2) annotation (Line(points={{2,60},
          {26,60},{26,128},{36,128}}, color={0,0,127}));
  connect(add_Qmax_PI.y,lim_Qmax_out. u)
    annotation (Line(points={{82,140},{96,140}}, color={0,0,127}));
  connect(add_Qmaxlim_and_Qminlim.y,Qlim_out)
    annotation (Line(points={{181,0},{210,0}}, color={0,0,127}));
  connect(lim_Qmax_out.y,add_Qmaxlim_and_Qminlim. u1) annotation (Line(
        points={{142,140},{160,140},{160,40},{140,40},{140,6},{158,6}},
        color={0,0,127}));
  connect(lim_Qmin_out.y,add_Qmaxlim_and_Qminlim. u2) annotation (Line(
        points={{142,-140},{160,-140},{160,-20},{140,-20},{140,-6},{158,-6}},
        color={0,0,127}));
  connect(add_Qmin_PI.y,lim_Qmin_out. u)
    annotation (Line(points={{82,-140},{96,-140}}, color={0,0,127}));
  connect(error_Qmin_Qfilt.y, gain_kpqmax_Qmax1.u)
    annotation (Line(points={{-82,-140},{-44,-140}}, color={0,0,127}));
  connect(gain_kpqmax_Qmax1.y, add_Qmin_PI.u2) annotation (Line(points={{2,
          -140},{26,-140},{26,-152},{36,-152}}, color={0,0,127}));
  connect(lim_kiqmax_Qmin.u, error_Qmin_Qfilt.y) annotation (Line(points={{
          -44,-80},{-60,-80},{-60,-140},{-82,-140}}, color={0,0,127}));
  connect(lim_kiqmax_Qmin.y, add_Qmin_PI.u1) annotation (Line(points={{2,
          -80},{20,-80},{20,-128},{36,-128}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},
            {200,200}}), graphics={
        Rectangle(
          extent={{-200,200},{200,-200}},
          lineColor={28,108,200},
          lineThickness=1), Text(
          extent={{-102,40},{98,-62}},
          textColor={28,108,200},
          textString="Qmin/max
Limiters"),
        Text(
          extent={{-200,264},{202,204}},
          textColor={28,108,200},
          textString="%name")}),
                          Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-200,-200},{200,200}})),
    Documentation(info="<html>
This model implements the reactive power limiter. The upper branch limits the the maximum power, while the lower branch limits the minimum power.
</html>"));
end Qlimiter;
