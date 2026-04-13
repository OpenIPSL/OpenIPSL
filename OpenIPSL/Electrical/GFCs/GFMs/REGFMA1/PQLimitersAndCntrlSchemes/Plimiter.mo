within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.PQLimitersAndCntrlSchemes;
model Plimiter "Activer power limiter"
  Modelica.Blocks.Sources.Constant Pmax_val(k=Pmax)
    "Upper limit of the inverter active power output"
    annotation (Placement(transformation(extent={{-180,120},{-140,160}})));
  parameter Real Pmax=0.9
    "Upper limit of the inverter active power output. Normal Range: [0.1 - 1] pu";
  Modelica.Blocks.Sources.Constant Pmin_val(k=Pmin)
    "Lower limit of the inverter active power output"
    annotation (Placement(transformation(extent={{-180,-160},{-140,-120}})));
  parameter Real Pmin=0
    "Lower limit of the inverter active power output. The value should be negative when representing energy storage systems.";
  Modelica.Blocks.Interfaces.RealInput Pfilt
    "Filtered measurement of the active power"
    annotation (Placement(transformation(extent={{-240,-20},{-200,20}})));
  Modelica.Blocks.Math.Feedback error_Pmax_Pfilt
    "Error junction of Pmax - Pfilt "
    annotation (Placement(transformation(extent={{-120,120},{-80,160}})));
  Modelica.Blocks.Math.Feedback error_Pmin_Pfilt
    "Error junction of Pmin - Pfilt "
    annotation (Placement(transformation(extent={{-120,-120},{-80,-160}})));
  Modelica.Blocks.Math.Add add_Pmax_PI
    annotation (Placement(transformation(extent={{40,120},{80,160}})));
  Modelica.Blocks.Math.Add add_Pmin_PI
    annotation (Placement(transformation(extent={{40,-160},{80,-120}})));
  Modelica.Blocks.Math.Gain gain_kppmax_Pmax(k=kppmax)
    "Proportional gain of the overload mitigation controller"
    annotation (Placement(transformation(extent={{-40,120},{0,160}})));
  parameter Real kppmax=0.01
    "Proportional gain of the overload mitigation controller. Normal Range: [0.005 - 0.05] pu.";
  Modelica.Blocks.Continuous.LimIntegrator lim_kipmax_Pmax(
    k=kipmax,
    outMax=0.0,
    outMin=-Modelica.Constants.inf,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    limitsAtInit=false,
    y_start=Pmax - P0)
    annotation (Placement(transformation(extent={{-40,40},{0,80}})));
  Modelica.Blocks.Interfaces.RealInput P0_ini
    "Initial value of the of the active power" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-220})));

  Modelica.Blocks.Nonlinear.Limiter lim_Pmax_out(uMax=0.0, uMin=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{100,120},{140,160}})));
  Modelica.Blocks.Math.Add add_Pmaxlim_and_Pminlim
    annotation (Placement(transformation(extent={{160,-10},{180,10}})));
  Modelica.Blocks.Interfaces.RealOutput Plim_out
    "Active power limiter output signal"
    annotation (Placement(transformation(extent={{200,-10},{220,10}})));
  Modelica.Blocks.Nonlinear.Limiter lim_Pmin_out(uMax=Modelica.Constants.inf,
      uMin=0)
    annotation (Placement(transformation(extent={{100,-160},{140,-120}})));
  Modelica.Blocks.Math.Gain gain_kppmax_Pmin(k=kppmax)
    "Proportional gain of the overload mitigation controller"
    annotation (Placement(transformation(extent={{-40,-160},{0,-120}})));
  Modelica.Blocks.Continuous.LimIntegrator lim_kipmax_Pmin(
    outMax=Modelica.Constants.inf,
    outMin=0.0,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    limitsAtInit=false,
    y_start=Pmin - P0)
    annotation (Placement(transformation(extent={{-40,-100},{0,-60}})));
  parameter Real kipmax=0.1
    "Integral gain of theoverload mitigation controller. Nomral Range: [0.05-0.2] pu/s";
protected
  parameter Real P0(fixed=false);
initial equation
    P0 = P0_ini "Maps the value coming from the voltage source to the inital value of P0 used by the filter block";

equation
  connect(Pfilt, error_Pmax_Pfilt.u2)
    annotation (Line(points={{-220,0},{-100,0},{-100,124}}, color={0,0,127}));
  connect(Pmax_val.y, error_Pmax_Pfilt.u1)
    annotation (Line(points={{-138,140},{-116,140}}, color={0,0,127}));
  connect(Pmin_val.y, error_Pmin_Pfilt.u1)
    annotation (Line(points={{-138,-140},{-116,-140}}, color={0,0,127}));
  connect(error_Pmin_Pfilt.u2, Pfilt)
    annotation (Line(points={{-100,-124},{-100,0},{-220,0}}, color={0,0,127}));
  connect(error_Pmax_Pfilt.y, gain_kppmax_Pmax.u)
    annotation (Line(points={{-82,140},{-44,140}}, color={0,0,127}));
  connect(lim_kipmax_Pmax.u, error_Pmax_Pfilt.y) annotation (Line(points={{
          -44,60},{-60,60},{-60,140},{-82,140}}, color={0,0,127}));
  connect(gain_kppmax_Pmax.y, add_Pmax_PI.u1) annotation (Line(points={{2,
          140},{26,140},{26,152},{36,152}}, color={0,0,127}));
  connect(lim_kipmax_Pmax.y, add_Pmax_PI.u2) annotation (Line(points={{2,60},
          {26,60},{26,128},{36,128}}, color={0,0,127}));
  connect(add_Pmax_PI.y, lim_Pmax_out.u)
    annotation (Line(points={{82,140},{96,140}}, color={0,0,127}));
  connect(add_Pmaxlim_and_Pminlim.y, Plim_out)
    annotation (Line(points={{181,0},{210,0}}, color={0,0,127}));
  connect(lim_Pmax_out.y, add_Pmaxlim_and_Pminlim.u1) annotation (Line(
        points={{142,140},{160,140},{160,40},{140,40},{140,6},{158,6}},
        color={0,0,127}));
  connect(lim_Pmin_out.y, add_Pmaxlim_and_Pminlim.u2) annotation (Line(
        points={{142,-140},{160,-140},{160,-20},{140,-20},{140,-6},{158,-6}},
        color={0,0,127}));
  connect(add_Pmin_PI.y, lim_Pmin_out.u)
    annotation (Line(points={{82,-140},{96,-140}}, color={0,0,127}));
  connect(error_Pmin_Pfilt.y, gain_kppmax_Pmin.u)
    annotation (Line(points={{-82,-140},{-44,-140}}, color={0,0,127}));
  connect(lim_kipmax_Pmin.u, error_Pmin_Pfilt.y) annotation (Line(points={{
          -44,-80},{-60,-80},{-60,-140},{-82,-140}}, color={0,0,127}));
  connect(gain_kppmax_Pmin.y, add_Pmin_PI.u2) annotation (Line(points={{2,
          -140},{14,-140},{14,-152},{36,-152}}, color={0,0,127}));
  connect(lim_kipmax_Pmin.y, add_Pmin_PI.u1) annotation (Line(points={{2,
          -80},{20,-80},{20,-128},{36,-128}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},
            {200,200}}), graphics={
        Rectangle(
          extent={{-200,200},{200,-200}},
          lineColor={28,108,200},
          lineThickness=1), Text(
          extent={{-102,40},{98,-62}},
          textColor={28,108,200},
          textString="Pmin/max
Limiters"),
        Text(
          extent={{-200,264},{202,204}},
          textColor={28,108,200},
          textString="%name")}),
                          Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-200,-200},{200,200}})),
    Documentation(info="<html>
This model implements the active power limiter. The upper branch limits the the maximum power, while the lower branch limits the minimum power.
</html>"));
end Plimiter;
