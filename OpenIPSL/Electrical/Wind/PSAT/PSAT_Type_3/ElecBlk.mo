within OpenIPSL.Electrical.Wind.PSAT.PSAT_Type_3;
model ElecBlk "Electrical block for Type 3 wind machine"
  Modelica.Blocks.Interfaces.RealInput omega_m "Rotor Speed" annotation (
      Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-46.1127,-159.0}),
      iconTransformation(
        origin={2.0,-144.0},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealInput idr(start=idr0, fixed=false) "idr"
    annotation (Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-45.2181,9.0065}),
      iconTransformation(
        origin={2.0,-6.3878},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealInput iqr(start=iqr0, fixed=false) "iqr"
    annotation (Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-44.5564,-24.0}),
      iconTransformation(
        origin={2.0,-74.0},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealOutput Tel "Electrical Torque" annotation (
      Placement(
      transformation(
        extent={{102.0,54.0},{62.0,94.0}},
        origin={44.9293,3.7214}),
      iconTransformation(
        origin={-2.0,-24.0},
        extent={{102.0,54.0},{62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealOutput Vbus "Bus Voltage Magnitude"
    annotation (Placement(
      transformation(
        extent={{102.0,54.0},{62.0,94.0}},
        origin={46.3073,-49.0}),
      iconTransformation(
        origin={-2.0,-124.0},
        extent={{102.0,54.0},{62.0,94.0}})));
  parameter Types.ApparentPower Sbase=100000000 "Power Rating [Normalization Factor]";
  parameter Types.PerUnit Vbus0=1 "Voltage from Power Flow";
  parameter Types.Angle angle_0=-0.00243 "Angle from Power Flow";
  parameter Types.PerUnit Pc=0.0160000000000082 "Active Power, PowerFlow";
  parameter Types.PerUnit Qc=0.030527374471207 "Reactive Power, Power Flow";
  parameter Types.PerUnit omega_m0=min(max(0.5*Pc*Sbase/Pnom + 0.5, 0.5), 1);
  parameter Types.ApparentPower Pnom=10 "Nominal Power";
  parameter Types.Voltage Vbase=400000 "Voltage rating";
  parameter Types.Frequency freq=50 "frequency rating";
  parameter Types.PerUnit Rs=0.1 "stator Resistance";
  parameter Types.PerUnit Xs=1 "stator Reactance";
  parameter Types.PerUnit Rr=0.1 "Rotor Resitance";
  parameter Types.PerUnit Xr=0.8 "rotor Reactance";
  parameter Types.PerUnit Xm=30 "magnetisation reactance";
  parameter Types.Time Hm=0.3 "inertia";
  parameter Types.PerUnit x1=Xm + Xs "stator plus magnetisation impedances";
  parameter SI.AngularVelocity wbase=2*C.pi*freq/poles "basis for angular speed";
  parameter Real k=x1*Pnom/Vbus0/Xm/Sbase "gain for iqr_off computation";
  parameter Types.PerUnit ids0=((-vds0^2) + vds0*Xm*iqr0 - x1*Qc)/(Rs*vds0 - x1*vqs0);
  parameter Types.PerUnit iqs0=((-vds0*vqs0) + vqs0*Xm*iqr0 - Rs*Qc)/(Rs*vds0 - x1*vqs0);
  parameter Types.PerUnit idr0=-(vqs0 + Rs*iqs0 + x1*ids0)/Xm;
  parameter Types.PerUnit iqr0=-x1*Pnom*(2*omega_m0 - 1)/Vbus0/Xm/Sbase/omega_m0;
  parameter Types.PerUnit vds0=-Vbus0*sin(angle_0);
  parameter Types.PerUnit vqs0=Vbus0*cos(angle_0);
  parameter Types.PerUnit vdr0=(-Rr*idr0) + (1 - omega_m0)*((Xm + Xr)*iqr0 + Xm*iqs0);
  parameter Types.PerUnit vqr0=(-Rr*iqr0) - (1 - omega_m0)*((Xm + Xr)*idr0 + Xm*ids0);
  parameter Integer poles=2 "Number of poles-pair";
  Types.PerUnit vds(start=vds0, fixed=false) "stator tension, in dq";
  Types.PerUnit vqs(start=vqs0, fixed=false) "stator tension, in dq";
  Types.PerUnit p "Active power";
  Types.PerUnit q "Reactive Power";
  Types.PerUnit ids(start=ids0, fixed=false) "stator current, in dq";
  Types.PerUnit iqs(start=iqs0, fixed=false) "stator current, in dq";
  Types.PerUnit vdr(start=vdr0, fixed=false) "rotor voltage in dq";
  Types.PerUnit vqr(start=vqr0, fixed=false) "rotor voltage in dq";
  OpenIPSL.Interfaces.PwPin pin annotation (Placement(
      transformation(
        origin={-158.3073,1.6927},
        extent={{-10.0,-10.0},{10.0,10.0}}),
      iconTransformation(
        origin={0.0,-110.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Real slip;
  Types.Angle Anglebus=atan(pin.vi/pin.vr);
  parameter Types.TimeAging i2Hm=1/(2*Hm) "inverse inertia";
equation
  Vbus = sqrt(vds^2 + vqs^2);
  vqs = pin.vr;
  vds = -pin.vi;
  -p = pin.vr*pin.ir + pin.vi*pin.ii;
  -q = pin.vi*pin.ir - pin.vr*pin.ii;
  p = vds*ids + vqs*iqs + vdr*idr + vqr*iqr;
  q = (-Xm*Vbus*idr/x1) - Vbus^2/Xm;
  vds = (-Rs*ids) + x1*iqs + Xm*iqr;
  vqs = (-Rs*iqs) - x1*ids - Xm*idr;
  slip = 1 - omega_m;
  vdr = (-Rr*idr) + slip*(x1*iqr + Xm*iqs);
  vqr = (-Rr*iqr) - slip*(x1*idr + Xm*ids);
  Tel = Xm*(iqr*ids - idr*iqs);
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        grid={10,10}), graphics={Rectangle(
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          origin={1.7639,5.0},
          fillPattern=FillPattern.Solid,
          extent={{-44.3912,-45.0},{44.3912,45.0}},
          textString="elec",
          fontName="Arial")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        grid={5,5})));
end ElecBlk;
