within OpenIPSL.NonElectrical.Continuous;
model RampTrackingFilter "Ramp-tracking filter"
  extends Modelica.Blocks.Interfaces.SISO;
  import Modelica.Blocks.Continuous;
  parameter Real T_1;
  parameter Real T_2;
  parameter Integer M = 5 ">=0, M*N<=8";
  parameter Integer N = 1 ">=0, M*N<=8";
  parameter Real y_start = 0 "Output start value";
  Continuous.TransferFunction TF1[M](b=fill({1},M), a=fill({T_2,1},M),each y_start=y_start);
  Continuous.TransferFunction TF2[N](b=fill({T_1,1},N), a=fill({T_2,1},N), each y_start=y_start);
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
    connect(TF1[M-1].y, y);
    connect(u, TF1[M].u);
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
    connect(TF1[M-1].y, y);
    connect(u, TF1[M].u);
  end if;
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        initialScale=0.05), graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={0,0,0}),Text(
          extent={{-58,40},{40,-4}},
          textColor={0,0,255},
          textString="1+sT"),Text(
          extent={{-64,20},{56,-58}},
          textColor={0,0,255},
          textString="(1+sT )"),Text(
          extent={{22,28},{44,-4}},
          textColor={0,0,255},
          textString="1"),Text(
          extent={{24,-10},{46,-42}},
          textColor={0,0,255},
          textString="2"),Text(
          extent={{54,2},{66,-16}},
          textColor={0,0,255},
          textString="M"),Line(
          points={{-60,40},{-74,40},{-74,-40},{-60,-40}},
          color={0,0,255},
          thickness=1),Line(
          points={{60,40},{76,40},{76,-40},{60,-40}},
          color={0,0,255},
          thickness=1),Text(
          extent={{76,48},{94,28}},
          textColor={0,0,255},
          textString="N"),Line(
          points={{-68,0},{70,0}},
          color={0,0,255},
          thickness=1)}),
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
</html>"));
end RampTrackingFilter;
