within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.LimitersAndCntrlSchemes;
model QVdrpCntrlSchemeQLim "Q-v droop control scheme with Q limiter input"
  extends
    OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.BasicComponentsAndCntrlSchemes.Base.QVdrpCntrlSchemeBase;
  Qlimiter
    qlimiter(
    Qmax=Qmax,
    Qmin=Qmin,
    kpqmax=kpqmax,
    kiqmax=kiqmax)
    annotation (Placement(transformation(extent={{-80,-160},{-40,-120}})));
  Modelica.Blocks.Sources.Constant sig_Q0(k=Q0) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-170})));
  parameter Real Qmax=0.44
    "Upper limit of the inverter reactive power output. Normal Range: [0.44-1.0] pu"
    annotation (Dialog(tab="Qmin/Qmax Limiters", group="Reactive Power Overload Controller Parameters"));
  parameter Real Qmin=-0.44
    "Lower limit of the inverter reactive power output. Normal Range: [-0.44 - -1.0] pu"
    annotation (Dialog(tab="Qmin/Qmax Limiters", group="Reactive Power Overload Controller Parameters"));
  parameter Real kpqmax=1.0
    "Proportional gain of the Qmax and Qmin controller. Range when VFLAG=1 is [1-5] pu. Range when VFLAG = 0, [0-0.5] pu."
    annotation (Dialog(tab="Qmin/Qmax Limiters", group="Reactive Power Overload Controller Parameters"));
  parameter Real kiqmax=20.0 "Integral gain of the Qmax and Qmin Controller. Range when VFLAG=1 is [3-20] pu. Range when VFLAG = 0, [3-30] pu"
    annotation (Dialog(tab="Qmin/Qmax Limiters", group="Reactive Power Overload Controller Parameters"));
equation
  connect(qlimiter.Qfilt, Qfilt.y) annotation (Line(points={{-82,-140},{-152,-140},
          {-152,-160},{-159,-160}}, color={0,0,127}));
  connect(qlimiter.Qlim_out, qv_drp1.Qlim) annotation (Line(points={{-39,-140},{
          -30,-140},{-30,-48}}, color={238,46,47}));
  connect(sig_Q0.y, qlimiter.Q0_ini) annotation (Line(points={{-99,-170},{-60,-170},
          {-60,-162}}, color={0,0,127}));
  annotation (Icon(graphics={
                            Text(
          extent={{-100,-4},{100,-106}},
          textColor={238,46,47},
          textString="No Plims"),
                             Rectangle(
          extent={{-100,-20},{100,-82}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid), Text(
          extent={{-98,-20},{98,-82}},
          textColor={28,108,200},
          textString="Qlim in")}), Documentation(info="<html>
<p>
This model extends the base control scheme and adds the reactive power limiter.
</p>

<p>
Note that the constant block <code> sig_Q0</code> provides the value of the reactive power <code>Q0</code> for initialization of the <code>qlimiter</code> block.
</p>

</html>"));
end QVdrpCntrlSchemeQLim;
