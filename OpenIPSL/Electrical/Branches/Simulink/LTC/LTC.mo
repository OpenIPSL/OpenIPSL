within OpenIPSL.Electrical.Branches.Simulink.LTC;
model LTC "Load tap changing transformer branch"
  Modelica.Blocks.Continuous.LimIntegrator imLimitedIntegrator(
    outMax=1,
    k=1,
    outMin=-delay1,
    y_start=-delay1,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{62,8},{78,24}})));
  LTC_deadband deadband1(Uplim=Uplim, Downlim=Downlim)
    annotation (Placement(transformation(extent={{-12,-14},{54,42}})));
  parameter Real Uplim=0.01;
  parameter Real Downlim=-0.01;
  parameter Real Ymin=0.88 "Min Ratio";
  parameter Real Ymax=1.2 "Max Ratio";
  parameter Real delay1;
  parameter Real delay2;
  parameter Real positionNo=33;
  parameter Real r0=1 "Transformer Ratio";
  LTC_switch lTC_switch
    annotation (Placement(transformation(extent={{88,6},{108,26}})));
  Modelica.Blocks.Sources.Constant imSetPoint(k=0)
    annotation (Placement(transformation(extent={{62,-20},{82,0}})));
  Modelica.Blocks.Sources.Constant imSetPoint1(k=1)
    annotation (Placement(transformation(extent={{-76,-38},{-56,-18}})));
  Modelica.Blocks.Interfaces.RealOutput r annotation (Placement(transformation(
          extent={{178,6},{198,26}}), iconTransformation(extent={{78,0},{114,38}})));
  LTC_lookup lTC_lookup(Uplim=Uplim, Downlim=Downlim)
    annotation (Placement(transformation(extent={{-2,42},{42,86}})));
  Modelica.Blocks.Continuous.LimIntegrator imLimitedIntegrator1(
    outMin=Ymin,
    outMax=Ymax,
    k=(Ymax - Ymin)/(positionNo*delay2),
    y_start=r0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{120,8},{136,24}})));
  LTC_quantizer lTC_quantizer
    annotation (Placement(transformation(extent={{150,6},{170,26}})));
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(
          extent={{-84,12},{-64,32}}), iconTransformation(extent={{-116,4},{-80,
            42}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{-34,6},{-14,26}})));
equation
  connect(lTC_lookup.out, lTC_switch.LTCin) annotation (Line(
      points={{36.94,64.22},{84,64.22},{84,20.9},{91.6,20.9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(r, lTC_quantizer.n) annotation (Line(
      points={{188,16},{182,16},{182,16.1},{168.5,16.1}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimitedIntegrator1.y, lTC_quantizer.p)
    annotation (Line(points={{136.8,16},{152.7,16}}, color={0,0,127}));
  connect(imLimitedIntegrator1.u, lTC_switch.r) annotation (Line(points={{118.4,
          16},{105.1,16},{105.1,16.8}}, color={0,0,127}));
  connect(imLimitedIntegrator.y, lTC_switch.Signalin)
    annotation (Line(points={{78.8,16},{91.7,16}}, color={0,0,127}));
  connect(deadband1.signal, imLimitedIntegrator.u) annotation (Line(points={{
          42.78,16.24},{51.39,16.24},{51.39,16},{60.4,16}}, color={0,0,127}));
  connect(imSetPoint.y, lTC_switch.Normalin) annotation (Line(points={{83,-10},
          {88,-10},{88,10.7},{91.7,10.7}}, color={0,0,127}));
  connect(add.y, deadband1.u)
    annotation (Line(points={{-13,16},{1.2,16},{1.2,16.24}}, color={0,0,127}));
  connect(lTC_lookup.u, deadband1.u) annotation (Line(points={{3.72,63.78},{-8,
          63.78},{-8,16},{1.2,16},{1.2,16.24}}, color={0,0,127}));
  connect(add.u1, u)
    annotation (Line(points={{-36,22},{-74,22}}, color={0,0,127}));
  connect(imSetPoint1.y, add.u2) annotation (Line(points={{-55,-28},{-44,-28},{
          -44,10},{-36,10}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            200,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{200,
            100}}), graphics={Rectangle(
          extent={{-78,70},{80,-32}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-60,32},{66,-58}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="LTC
    ")}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>Load Tap Changer</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end LTC;
