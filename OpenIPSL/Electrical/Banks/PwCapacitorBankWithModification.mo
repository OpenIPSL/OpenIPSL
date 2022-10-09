within OpenIPSL.Electrical.Banks;
model PwCapacitorBankWithModification "Capacitor Bank with Bank modification at time t1.
              2014/03/10"
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  parameter Integer nsteps "Number of steps";
  parameter Types.PerUnit Go "Active power losses in each element";
  parameter Types.PerUnit Bo "Reactive power in each element";
  parameter Types.Time t1 "Time for bank Modification";
  parameter Integer nmod "Number of step to switch on/off (+/-)";
  Types.PerUnit G;
  Types.PerUnit B;
  Integer nt;
equation
  if time > t1 then
    nt = nsteps + nmod;
  else
    nt = nsteps;
  end if;
  G = nt*Go;
  B = nt*Bo;
  p.vr = (p.ir*G + p.ii*B)/(G*G + B*B);
  p.vi = ((-p.ir*B) + p.ii*G)/(G*G + B*B);
  annotation (Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={0,0,255}),Line(
          points={{0,90},{0,60}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-60,60},{60,60}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-60,40},{60,40}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-60,-60},{60,-60}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-68,-80},{-48,-60}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-50,-80},{-30,-60}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-30,-80},{-10,-60}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-10,-80},{10,-60}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{12,-80},{32,-60}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{30,-80},{50,-60}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-60,-20},{60,-20}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-60,0},{60,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{0,40},{0,0}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{0,-20},{0,-60}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{-100,-100},{100,-140}},
          textColor={0,0,255},
          textString="%name")}));
end PwCapacitorBankWithModification;
