within OpenIPSL.Electrical.Wind;
model WindGenerator "Generic wind power generation model"
  import Modelica.Constants.pi;
  import Modelica.Constants.e;
  Modelica.Blocks.Interfaces.RealOutput Vw "Connector of Real output signal"
    annotation (Placement(
      transformation(
        extent={{100.0,-10.0},{120.0,10.0}},
        origin={0.0,0.0}),
      iconTransformation(
        origin={0.0,0.0},
        extent={{100.0,-10.0},{120.0,10.0}})));
  parameter Types.Time tstart=5 "Start time of the wind gust";
  parameter Types.Time tstop=10 "Stop time of the wind gust";
  parameter SI.Velocity v0=14 "steady state wind speed";
  parameter SI.Velocity vmax=25 "peak wind speed for Mexican Hat";
  parameter SI.Velocity wmag=-4 "magnitude of the gust of wind";
  parameter Real sigma=1 "Mexican hat wavelet shape factor";
  parameter Integer typ=1 "1:constant 2:gust 3:mexican hat";
protected
  parameter Types.Time wgwidth=tstop - tstart;
equation
  if typ == 1 then
    Vw = v0;
  elseif typ == 2 then
    if time > tstart and time < tstop then
      Vw = v0 + wmag*(1 - cos((time - tstart)*2*Modelica.Constants.pi/wgwidth))
        /2;
    else
      Vw = v0;
    end if;
  else
    Vw = v0 + (vmax - v0)*(1 - (time - (tstop + tstart)/2)^2/sigma^2)*Modelica.Constants.e
      ^(-(time - (tstop + tstart)/2)^2/(2*sigma^2))
      "2/(sqrt(3*sigma)*Modelica.Constants.pi^(1/4))*(1 - ((time - (tstop + tstart)/2)/sigma)^2)*Modelica.Constants.e^((-((time - (tstop + tstart)/2)/sigma)^2)/(2*sigma^2)) + v0";
  end if;
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        grid={10,10}), graphics={Rectangle(
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineThickness=0.75,
          extent={{-100.0,-100.0},{100.0,100.0}}),Bitmap(
          origin={-0.1255,0},
          extent={{-99.8745,-96.8769},{99.8745,96.877}},
          fileName="modelica://OpenIPSL/Resources/Images/WindGenerator.png")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        grid={5,5})),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2015-07</p></td>
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
end WindGenerator;
