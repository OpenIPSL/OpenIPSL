within OpenIPSL.Electrical.Branches.PSAT;
model TwoWindingTransformer "Modeled as series reactances without iron losses"
  outer OpenIPSL.Electrical.SystemBase SysData;
  import Modelica.ComplexMath.conj;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.j;
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  OpenIPSL.Interfaces.PwPin n
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  parameter Types.ApparentPower S_b=SysData.S_b "System base power"
    annotation (Dialog(group="Power flow"));
  parameter Types.Voltage V_b=40e3 "Sending end bus voltage"
    annotation (Dialog(group="Power flow"));
  parameter Types.ApparentPower Sn=SysData.S_b "Power rating"
    annotation (Dialog(group="Transformer parameters"));
  parameter Types.Voltage Vn=40e3 "Voltage rating"
    annotation (Dialog(group="Transformer parameters"));
  parameter Types.PerUnit rT=0.01 "Resistance(transformer base)"
    annotation (Dialog(group="Transformer parameters"));
  parameter Types.PerUnit xT=0.1 "Reactance(transformer base)"
    annotation (Dialog(group="Transformer parameters"));
  parameter Real m=1.0 "Optional fixed tap ratio"
    annotation (Dialog(group="Transformer parameters"));
  parameter Boolean displayPF=false "Display power flow results:" annotation (
      Dialog(
      group="Visualisation",
      __Dymola_compact=true,
      __Dymola_descriptionLabel=true), choices(checkBox=true));
  Types.ActivePower P12;
  Types.ActivePower P21;
  Types.ReactivePower Q12;
  Types.ReactivePower Q21;
  Complex vs(re=p.vr, im=p.vi);
  Complex is(re=p.ir, im=p.ii);
  Complex vr(re=n.vr, im=n.vi);
  Complex ir(re=n.ir, im=n.ii);
protected
  parameter Types.Impedance Zn = Vn^2/Sn "Transformer base impedance";
  parameter Types.Impedance Zb = V_b^2/S_b "System base impedance";
  parameter Types.PerUnit r = rT * Zn/Zb "Resistance (system base)";
  parameter Types.PerUnit x = xT * Zn/Zb "Reactance (system base)";
  parameter Boolean tc = m > 1.0 or m < 1.0 "Internal parameter to switch on the icon arrow";
equation
  r*p.ir - x*p.ii = 1/m^2*p.vr - 1/m*n.vr;
  r*p.ii + x*p.ir = 1/m^2*p.vi - 1/m*n.vi;
  r*n.ir - x*n.ii = n.vr - 1/m*p.vr;
  x*n.ir + r*n.ii = n.vi - 1/m*p.vi;
  //Calculations for the power flow display
  P12 = real(vs*conj(is))*S_b;
  P21 = -real(vr*conj(ir))*S_b;
  Q12 = imag(vs*conj(is))*S_b;
  Q21 = -imag(vr*conj(ir))*S_b;

  annotation (
    Icon(graphics={Ellipse(extent={{-46,30},{8,-30}}, lineColor={0,0,255}),
          Ellipse(extent={{-10,30},{44,-30}}, lineColor={0,0,255}),Line(
          points={{100,0},{44,0},{44,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-100,0},{-46,0}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{-38,20},{-4,-20}},
          lineColor={28,108,200},
          textString="1"),Text(
          extent={{4,18},{32,-16}},
          lineColor={28,108,200},
          textString="2"),
        Text(
          extent={{-80,90},{80,30}},
          lineColor={0,0,255},
          textString="%name"),
        Line(
          visible= tc,
          points={{-60,-40},{0,40}},
          color={28,108,200}),
        Line(
          points={{0,40},{-10,36}},
          color={28,108,200},
          visible=tc),
        Line(
          visible=tc,
          points={{0,40},{0,30}},
          color={28,108,200}),
        Text(
          visible=tc,
          extent={{-80,-40},{-40,-60}},
          lineColor={28,108,200},
          textString="TC"),Text(
          visible=displayPF,
          extent={{-200,160},{-20,40}},
          lineColor={255,0,0},
          textString=DynamicSelect("0.0 MW",
            OpenIPSL.NonElectrical.Functions.displayPower(P12, " MW"))),Polygon(
          visible=displayPF,
          points=DynamicSelect({{-120,70},{-120,50},{-80,60},{-120,70}}, if P12
             >= 0 then {{-120,70},{-120,50},{-80,60},{-120,70}} else {{-80,70},
            {-80,50},{-120,60},{-80,70}}),
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),Text(
          visible=displayPF,
          extent={{20,160},{200,40}},
          lineColor={255,0,0},
          textString=DynamicSelect("0.0 MW",
            OpenIPSL.NonElectrical.Functions.displayPower(P21, " MW"))),Polygon(
          visible=displayPF,
          points=DynamicSelect({{80,70},{80,50},{120,60},{80,70}}, if P21 >= 0
             then {{80,70},{80,50},{120,60},{80,70}} else {{120,70},{120,50},{
            80,60},{120,70}}),
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),Text(
          visible=displayPF,
          extent={{-200,-40},{-20,-160}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0 Mvar",
            OpenIPSL.NonElectrical.Functions.displayPower(Q12, " Mvar"))),
          Polygon(
          visible=displayPF,
          points=DynamicSelect({{-120,-70},{-120,-50},{-80,-60},{-120,-70}},
            if Q12 >= 0 then {{-120,-70},{-120,-50},{-80,-60},{-120,-70}} else
            {{-80,-70},{-80,-50},{-120,-60},{-80,-70}}),
          lineColor={0,255,0},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid),Text(
          visible=displayPF,
          extent={{20,-40},{200,-160}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0 Mvar",
            OpenIPSL.NonElectrical.Functions.displayPower(Q21, " Mvar"))),
          Polygon(
          visible=displayPF,
          points=DynamicSelect({{80,-70},{80,-50},{120,-60},{80,-70}}, if Q21
             >= 0 then {{80,-70},{80,-50},{120,-60},{80,-70}} else {{120,-70},{
            120,-50},{80,-60},{120,-70}}),
          lineColor={0,255,0},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid)}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2015-09-29</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end TwoWindingTransformer;
