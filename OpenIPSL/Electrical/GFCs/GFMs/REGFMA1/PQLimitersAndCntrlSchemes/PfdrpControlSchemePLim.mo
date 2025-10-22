within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.PQLimitersAndCntrlSchemes;
model PfdrpControlSchemePLim "P-f droop control scheme with limiter input"
  extends OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.BasicComponentsAndCntrlSchemes.Base.PFdrpCntrlSchemeBase;
  OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.PQLimitersAndCntrlSchemes.Plimiter plimiter(
    Pmax=Pmax,
    Pmin=Pmin,
    kppmax=kppmax,
    kipmax=kipmax)
    annotation (Placement(transformation(extent={{-120,-100},{-80,-60}})));
  Modelica.Blocks.Sources.Constant sig_P0(k=P0) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-130,-130})));
  parameter Real Pmax=0.9
    "Upper limit of the inverter active power output. Normal Range: [0.1 - 1] pu"
    annotation (Dialog(tab="Pmin/Pmax Limiters", group="Overlad controller parameters"));
  parameter Real Pmin=0
    "Lower limit of the inverter active power output. The value should be negative when representing energy storage systems."
    annotation (Dialog(tab="Pmin/Pmax Limiters", group="Overlad controller parameters"));
  parameter Real kppmax=0.01
    "Proportional gain of the overload mitigation controller. Normal Range: [0.005 - 0.05] pu."
    annotation (Dialog(tab="Pmin/Pmax Limiters", group="Overlad controller parameters"));
  parameter Real kipmax=0.1
    "Integral gain of theoverload mitigation controller. Nomral Range: [0.05-0.2] pu/s"
    annotation (Dialog(tab="Pmin/Pmax Limiters", group="Overlad controller parameters"));
equation
  connect(plimiter.Pfilt, Pfilt.y)
    annotation (Line(points={{-122,-80},{-159,-80}}, color={0,0,127}));
  connect(sig_P0.y, plimiter.P0_ini) annotation (Line(points={{-119,-130},{-100,
          -130},{-100,-102}}, color={0,0,127}));
  connect(plimiter.Plim_out, pfdroop.Plim_in) annotation (Line(points={{-79,-80},
          {-8,-80},{-8,-24}}, color={238,46,47}));
  annotation (Icon(graphics={Rectangle(
          extent={{-100,-18},{100,-80}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid), Text(
          extent={{-98,-18},{98,-80}},
          textColor={28,108,200},
          textString="Plim in")}), Diagram(coordinateSystem(
          preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
This model extends the base control scheme and adds the active power limiter.
</p>

<p>
Note that the constant block <code> sig_P0</code> provides the value of the active power  <code>P0</code> for initialization of the <code>plimiter</code> block.
</p>

</html>"));
end PfdrpControlSchemePLim;
