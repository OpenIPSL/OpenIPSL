within OpenIPSL.Electrical.Events;
model PwFault "Transitory short-circuit on a node. Shunt impedance connected only during a specified interval of time.
              Developed by AIA. 2014/12/16"
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(extent={{-80,
            -10},{-60,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  parameter Types.PerUnit R "Resistance";
  parameter Types.PerUnit X "Reactance";
  parameter Types.Time t1 "Start time of the fault";
  parameter Types.Time t2 "End time of the fault";
  import Modelica.Constants.eps;
protected
  parameter Boolean ground=abs(R) < eps and abs(X) < eps;
equation
  if time < t1 then
    p.ii = 0;
    p.ir = 0;
  elseif time < t2 and ground then
    p.vr = 1E-10;
    // This is to avoid numerical problems
    p.vi = 0;
  elseif time < t2 then
    p.ii = (R*p.vi - X*p.vr)/(X*X + R*R);
    p.ir = (R*p.vr + X*p.vi)/(R*R + X*X);
  else
    p.ii = 0;
    p.ir = 0;
  end if;
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-60,-60},{60,60}}), graphics={Rectangle(extent={{-60,60},{60,-60}},
          lineColor={0,0,255}),Rectangle(
          extent={{-28,26},{12,6}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),Line(
          points={{12,16},{26,16},{26,-24}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{14,-24},{38,-24}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{16,-28},{36,-28}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{20,-32},{34,-32}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{22,-36},{30,-36}},
          color={0,0,255},
          smooth=Smooth.None),Rectangle(
          extent={{-38,18},{-28,14}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),Line(
          points={{-12,34},{-4,16},{-18,16},{-6,-6}},
          color={255,0,0},
          smooth=Smooth.None,
          thickness=0.5),Line(
          points={{-12,-4},{-6,-6},{-6,0}},
          color={255,0,0},
          smooth=Smooth.None),Text(
          extent={{-110,110},{110,70}},
          textColor={0,0,255},
          textString="%name")}),
    Diagram(coordinateSystem(
        extent={{-60,-60},{60,60}},
        preserveAspectRatio=true), graphics));
end PwFault;
