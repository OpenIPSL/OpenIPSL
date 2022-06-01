within OpenIPSL.Electrical.Banks.PSSE;
model CSVGN1 "STATIC SHUNT COMPENSATOR MODEL"
  extends Icons.VerifiedModel;
  outer OpenIPSL.Electrical.SystemBase SysData
    "Must add this line in all models";
  parameter Types.ApparentPower S_b=SysData.S_b "System base power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ActivePower P_0=1e6 "Initial active power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ReactivePower Q_0=0 "Initial reactive power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit v_0=1 "Initial voltage magnitude at terminal bus"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle angle_0=0 "Initial voltage angle"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit ra=0 "Armature resistance" annotation (Dialog(group="Plant parameters", enable = false));
  parameter Types.PerUnit x1d=9999 "d-axis transient reactance, should be set to 9999" annotation (Dialog(group="Plant parameters", enable = false));
  parameter Real K=1 annotation (Dialog(group="Device parameters"));
  parameter Types.Time T1=0 annotation (Dialog(group="Device parameters"));
  parameter Types.Time T2=0 annotation (Dialog(group="Device parameters"));
  parameter Types.Time T3=0 annotation (Dialog(group="Device parameters"));
  parameter Types.Time T4=0 annotation (Dialog(group="Device parameters"));
  parameter Types.Time T5=0 annotation (Dialog(group="Device parameters"));
  parameter Types.ReactivePower RMIN=0 "Reactor minimum var output" annotation (Dialog(group="Device parameters"));
  parameter Types.PerUnit VMAX=0.5 annotation (Dialog(group="Device parameters"));
  parameter Types.PerUnit VMIN=0 annotation (Dialog(group="Device parameters"));
  parameter Types.ReactivePower CBASE=100e6 "Capacitor output" annotation (Dialog(group="Device parameters"));
  parameter Types.ApparentPower MBASE=100e6 "Power range of SVC" annotation (Dialog(group="Device parameters"));
  Types.PerUnit v(start=v_0) "Bus voltage magnitude";
  Types.Angle anglev(start=angle_0) " Bus voltage angle";
  Types.PerUnit P;
  Types.PerUnit Q;
  Types.PerUnit vd(start=vd0) "voltage direct axis";
  Types.PerUnit vq(start=vq0) "voltage quadrature axis";
  Types.PerUnit id(start=id0) "current direct axis";
  Types.PerUnit iq(start=iq0) "current quadrature axis";
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{46,-10},{66,10}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{76,-10},{96,10}})));
  Modelica.Blocks.Interfaces.RealOutput Y(start=Y0)
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput V
    annotation (Placement(transformation(extent={{-140,30},{-100,70}})));
  Modelica.Blocks.Math.Add add1(k1=-1)
    annotation (Placement(transformation(extent={{-78,-10},{-58,10}})));
  Modelica.Blocks.Sources.Constant const(k=MBASE/S_b)
    annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  Modelica.Blocks.Sources.Constant const1(k=CBASE/S_b)
    annotation (Placement(transformation(extent={{30,30},{50,50}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLagLim LagLim(
    outMin=RMIN/MBASE,
    outMax=1,
    T=T5,
    K=1,
    y_start=k50)
    annotation (Placement(transformation(extent={{16,-10},{36,10}})));
  Modelica.Blocks.Sources.Constant const2(k=Vref)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-68,32})));
  OpenIPSL.Interfaces.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0))
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  NonElectrical.Continuous.LeadLag leadLag(
    K=K,
    T1=T1+C.eps,
    T2=T3+C.eps,
    y_start=k30)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  NonElectrical.Continuous.LeadLagLim leadLagLim(
    K=K,
    T1=T2+C.eps,
    T2=T4+C.eps,
    outMax=VMAX,
    outMin=VMIN,
    y_start=k30)
    annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG
    annotation (Placement(transformation(extent={{-140,-70},{-100,-30}})));
  Modelica.Blocks.Math.Add add2(k2=-1)
    annotation (Placement(transformation(extent={{-78,-40},{-58,-20}})));
protected
  parameter Types.PerUnit p0=P_0/S_b "Active power (system base)";
  parameter Types.PerUnit q0=Q_0/S_b "Reactive power (system base)";
  parameter Types.PerUnit Y0=q0/(v_0*v_0) "Capacitor output";
  parameter Types.PerUnit vr0=v_0*cos(angle_0) "Initialization";
  parameter Types.PerUnit vi0=v_0*sin(angle_0) "Initialization";
  parameter Types.PerUnit ir0=(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2) "Initialization";
  parameter Types.PerUnit ii0=(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2) "Initialization";
  parameter Types.Angle delta0=atan2(vi0 + ra*ii0 + x1d*ir0, vr0 + ra*ir0 - x1d*ii0) "Initialization";
  parameter Types.PerUnit vd0=vr0*cos(C.pi/2 - delta0) - vi0*sin(C.pi/2 - delta0) "Initialization";
  parameter Types.PerUnit vq0=vr0*sin(C.pi/2 - delta0) + vi0*cos(C.pi/2 - delta0) "Initialization";
  parameter Types.PerUnit id0=ir0*cos(C.pi/2 - delta0) - ii0*sin(C.pi/2 - delta0) "Initialization";
  parameter Types.PerUnit iq0=ir0*sin(C.pi/2 - delta0) + ii0*cos(C.pi/2 - delta0) "Initialization";
  parameter Types.PerUnit k50(fixed=false);
  parameter Types.PerUnit k30(fixed=false);
  parameter Types.PerUnit k0(fixed=false);
  parameter Types.PerUnit Vref(fixed=false);
initial equation
  k50 = (CBASE/S_b - Y0)/(MBASE/S_b);
  k30 = k50;
  k0 = k30/K;
  Vref = V - k0;
equation
  v = sqrt(p.vr^2 + p.vi^2);
  anglev = atan2(p.vi, p.vr);
  [p.ir; p.ii] = -[sin(delta0), cos(delta0); -cos(delta0), sin(delta0)]*[id; iq];
  [p.vr; p.vi] = [sin(delta0), cos(delta0); -cos(delta0), sin(delta0)]*[vd; vq];
  vq = id/Y;
  vd = -iq/Y;
  -P = p.vr*p.ir + p.vi*p.ii;
  -Q = p.vi*p.ir - p.vr*p.ii;
  connect(const1.y, add.u1) annotation (Line(
      points={{51,40},{70,40},{70,6},{74,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, Y) annotation (Line(
      points={{97,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(product1.y, add.u2) annotation (Line(
      points={{67,0},{70,0},{70,-6},{74,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(V, add1.u2) annotation (Line(
      points={{-120,50},{-90,50},{-90,-6},{-80,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const.y, product1.u1) annotation (Line(
      points={{-19,40},{0,40},{0,20},{40,20},{40,6},{44,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(leadLag.y, leadLagLim.u)
    annotation (Line(points={{-19,0},{-14,0}}, color={0,0,127}));
  connect(leadLagLim.y, LagLim.u)
    annotation (Line(points={{9,0},{14,0}}, color={0,0,127}));
  connect(LagLim.y, product1.u2)
    annotation (Line(points={{37,0},{40,0},{40,-6},{44,-6}}, color={0,0,127}));
  connect(VOTHSG, add2.u2) annotation (Line(points={{-120,-50},{-90,-50},{-90,-36},
          {-80,-36}}, color={0,0,127}));
  connect(add1.y, add2.u1) annotation (Line(points={{-57,0},{-54,0},{-54,-14},{-90,
          -14},{-90,-24},{-80,-24}}, color={0,0,127}));
  connect(add2.y, leadLag.u) annotation (Line(points={{-57,-30},{-48,-30},{-48,0},
          {-42,0}}, color={0,0,127}));
  connect(const2.y, add1.u1) annotation (Line(points={{-79,32},{-86,32},{-86,6},
          {-80,6}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={0,0,255}),Text(
          extent={{-46,20},{40,-26}},
          lineColor={0,0,255},
          textString="CSVGN1"),Text(
          extent={{-100,-100},{100,-140}},
          lineColor={0,0,255},
          textString="%name")}), Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Manual</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2020-09</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>ALSETLab, Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end CSVGN1;
