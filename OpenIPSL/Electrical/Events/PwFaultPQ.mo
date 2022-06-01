within OpenIPSL.Electrical.Events;
model PwFaultPQ "Transitory short-circuit on a node with active and reactive power information"
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(extent={{-40,
            -10},{-20,10}}), iconTransformation(extent={{-80,-10},{-60,10}})));
  parameter Types.PerUnit R "Resistance";
  parameter Types.PerUnit X "Reactance";
  parameter Types.Time t1 "Start time of the fault";
  parameter Types.Time t2 "End time of the fault";
  Types.PerUnit P "Active power supplied to the fault";
  Types.PerUnit Q "Reactive power supplied to the fault";
equation
  p.ir = if time < t1 then 0 else if time < t2 then 1/X*(p.vi - R*p.ii) else 0;
  p.ii = if time < t1 then 0 else if time < t2 then (R*p.vi - X*p.vr)/(X*X + R*
    R) else 0;
  P = p.vr*p.ir + p.vi*p.ii;
  Q = (-p.vr*p.ii) + p.vi*p.ir;
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
          smooth=Smooth.None)}),
    Diagram(coordinateSystem(
        extent={{-60,-60},{60,60}},
        preserveAspectRatio=true), graphics));
end PwFaultPQ;
