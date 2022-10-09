within OpenIPSL.Electrical.Buses;
model InfiniteBus "PSAT Infinite Bus"
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enableQ_0=false,
    final enableP_0=false,
    final enablefn=false,
    final enableV_b=false,
    final enableS_b=true,
    final enabledisplayPF=true,
    final enableangle_0=true,
    final enablev_0=true);
  Types.ActivePower P "Active Power absorbed by the Infinite bus";
  Types.ReactivePower Q "Reactive Power absorbed by the Infinite bus";
  Interfaces.PwPin p
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));

equation
  p.vr = v_0*cos(angle_0);
  p.vi = v_0*sin(angle_0);
  P = -(p.vr*p.ir + p.vi*p.ii)*S_b;
  Q = -(p.vi*p.ir - p.vr*p.ii)*S_b;
  annotation (
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        grid={2,2}), graphics={Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,0},
          fillColor={241,241,241},
          fillPattern=FillPattern.Solid),Text(
          visible=displayPF,
          extent={{-80,100},{80,20}},
          textColor={255,0,0},
          textString=DynamicSelect("0.0 MW",
            OpenIPSL.NonElectrical.Functions.displayPower(P, " MW"))),Polygon(
          visible=displayPF,
          points=DynamicSelect({{-20,30},{-20,10},{20,20},{-20,30}}, if P >= 0
             then {{-20,30},{-20,10},{20,20},{-20,30}} else {{20,30},{20,10},{-20,
            20},{20,30}}),
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),Text(
          visible=displayPF,
          extent={{-80,-20},{80,-100}},
          textColor={0,255,0},
          textString=DynamicSelect("0.0 Mvar",
            OpenIPSL.NonElectrical.Functions.displayPower(Q, " Mvar"))),Polygon(
          visible=displayPF,
          points=DynamicSelect({{-20,-30},{-20,-10},{20,-20},{-20,-30}}, if Q
             >= 0 then {{-20,-30},{-20,-10},{20,-20},{-20,-30}} else {{20,-30},
            {20,-10},{-20,-20},{20,-30}}),
          lineColor={0,255,0},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid),Text(
          extent={{-100,160},{100,120}},
          textColor={0,0,255},
          textString="%name")}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Last update</p></td>
<td><p>2015-12-14</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a></p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end InfiniteBus;
