within OpenIPSL.NonElectrical.Continuous;
model RampTrackingFilter "Ramp-tracking filter"
  extends Modelica.Blocks.Interfaces.SISO;
  import Modelica.Blocks.Continuous;
  parameter Real T_1;
  parameter Real T_2;
  parameter Integer M = 5 ">=0, M*N<=8";
  parameter Integer N = 1 ">=0, M*N<=8";
  parameter Real y_start = 0 "Output start value";
//   Continuous.TransferFunction TF1[M](b=fill({1},M), a=fill({T_2,1},M),each y_start=y_start);
//   Continuous.TransferFunction TF2[N](b=fill({T_1,1},N), a=fill({T_2,1},N), each y_start=y_start);
  final parameter Boolean bypass = if M == 0 or N == 0 then true else false "Boolean parameter" annotation(Evaluate = true);
  Continuous.TransferFunction TF1[M](b=fill({1},M), a=fill({T_2,1},M),each y_start=y_start) if bypass == false "Conditional component";
  Continuous.TransferFunction TF2[N](b=fill({T_1,1},N), a=fill({T_2,1},N), each y_start=y_start) if bypass == false "Conditional component";
equation
  if M == 0 or N == 0 then
    u = y;
  elseif M == 1 then
    connect(u, TF2[1].u);
    for i in 1:N-1 loop
      connect(TF2[i].y, TF2[i+1].u);
    end for;
    connect(TF2[N].y, TF1[1].u);
    connect(TF1[1].y, y);
  elseif N == 1 then
    connect(u, TF2[1].u);
    connect(TF2[1].y, TF1[1].u);
    for i in 1:M-2 loop
      connect(TF1[i].y, TF1[i+1].u);
    end for;
    connect(TF1[M-1].y, TF1[M].u);
    connect(TF1[M].y, y);
  elseif M == 1 and N ==1 then
    connect(u, TF2[1].u);
    connect(TF2[1].y, TF1[1].u);
    connect(TF1[1].y, y);
  else
    connect(u, TF2[1].u);
    for i in 1:N-1 loop
      connect(TF2[i].y, TF2[i+1].u);
    end for;
    connect(TF2[N].y, TF1[1].u);
    for i in 1:M-2 loop
      connect(TF1[i].y, TF1[i+1].u);
    end for;
    connect(TF1[M-1].y, TF1[M].u);
    connect(TF1[M].y, y);
  end if;
  annotation (
    Icon( graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={0,0,0}),
        Line(points={{-82,62},{-82,-86}}, color={192,192,192}),
        Polygon(
          points={{-82,84},{-90,62},{-74,62},{-82,84}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-92,-76},{80,-76}}, color={192,192,192}),
        Polygon(
          points={{88,-76},{66,-68},{66,-84},{88,-76}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-82,-76},{-38,-76},{16,4}},
          thickness=1,
          color={238,46,47},
          smooth=Smooth.Bezier),
        Line(points={{100,72},{62,72},{16,4}},
          thickness=1,
          color={238,46,47},
          smooth=Smooth.Bezier),
        Line(
          points={{-82,-76},{-42,-76}},
          color={28,108,200},
          thickness=1,
          pattern=LinePattern.Dash),
        Line(
          points={{-42,-76},{58,72}},
          color={28,108,200},
          thickness=1,
          pattern=LinePattern.Dash),
        Line(
          points={{58,72},{98,72}},
          color={28,108,200},
          thickness=1,
          pattern=LinePattern.Dash),
        Text(
          extent={{-74,28},{78,-28}},
          textColor={0,0,248},
          textString="RTF")}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Manual</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-04-23</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/GiuseppeLaera\">@GiuseppeLaera</a></p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>", info="<html>

<p>This block is used by the <code>PSS2A</code> and <code>PSS2B</code> models under <code>OpenIPSL.Electrical.Controls.PSSE.PSS</code>. This implementation has been done starting from the block diagram descriptions from [PSSE-MODELS]. </p>

<p>However, as noted in <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Laera2022]</a>, in order to validate the implementation against PSS/E v.33&apos;s simulation output, further analysis of the actual model response in PSS/E revealed necessary changes that deviate from the block diagrams in [PSS-MODELS]. Consequently, the implementation herein should not be expected to comply with any other &quot;generic&quot; implementation or block diagram description, but to that implemented in PSS/E v.33.</p>

<p>For more information please refer to <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Laera2022]</a>.</p>

</html>"));
end RampTrackingFilter;
