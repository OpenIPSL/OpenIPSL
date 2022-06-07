within OpenIPSL.Electrical.Buses;
model Bus "Bus model (2014/03/10)"
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enableQ_0=false,
    final enableP_0=false,
    final enablefn=false,
    final enableV_b=false,
    final enableS_b=false,
    final enabledisplayPF=true,
    final enableangle_0=true,
    final enablev_0=true);
  OpenIPSL.Interfaces.PwPin p(vr(start=v_0*cos(angle_0)), vi(start=v_0*sin(angle_0)))
    annotation (Placement(
      transformation(
        extent={{-10.0,-10.0},{10.0,10.0}}),
      iconTransformation(
        extent={{-10,-10},{10,10}})));
  Types.PerUnit v(start=v_0) "Bus voltage magnitude";
  Types.Angle angle(start=angle_0) "Bus voltage angle";
  Modelica.Units.NonSI.Angle_deg angleDisplay=Modelica.Units.Conversions.to_deg(angle) "Angle in degrees for display purposes";
equation
  v = sqrt(p.vr^2 + p.vi^2);
  angle = atan2(p.vi, p.vr);
  p.ir = 0;
  p.ii = 0;
  annotation (Icon(graphics={Rectangle(
          fillPattern=FillPattern.Solid,
          extent={{-10,-100},{10,100}}),Text(
          origin={-0.02605,120.133},
          fillPattern=FillPattern.Solid,
          extent={{-100,-20},{100,20}},
          textString="%name"),Text(
          visible=displayPF,
          origin={0,-120},
          extent={{-60,-20},{60,20}},
          lineColor={170,0,0},
          textString=DynamicSelect("Vpu", String(v, significantDigits=3))),Text(
          visible=displayPF,
          origin={0,-160},
          extent={{-60,-20},{60,20}},
          lineColor={170,0,0},
          textString=DynamicSelect("Angle", String(angleDisplay, significantDigits=3)
             + "°"))}));
end Bus;
