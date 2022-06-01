within OpenIPSL.Electrical.Wind.PSAT.PSAT_Type_3;
model ElecDynBlk "Dynamical equations for electrical block of a type 3 wind machine"
  Modelica.Blocks.Interfaces.RealInput omega_m "Rotor Speed" annotation (
      Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-45.2439,-151.0508}),
      iconTransformation(
        origin={2.0,-124.0},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealInput Vbus "Vbus" annotation (Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-45.2049,-85.6189}),
      iconTransformation(
        origin={2.0,-24.0},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealOutput idr(start=idr0, fixed=false)
    "saturated idr" annotation (Placement(
      transformation(
        extent={{102.0,54.0},{62.0,94.0}},
        origin={43.0,-29.0}),
      iconTransformation(
        origin={-2.0,-24.0},
        extent={{102.0,54.0},{62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealOutput iqr(start=iqr0, fixed=false)
    "saturated iqr" annotation (Placement(
      transformation(
        extent={{102.0,54.0},{62.0,94.0}},
        origin={43.0,-94.0}),
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
  parameter Types.PerUnit x2=Xm + Xr "rotor plus magnetisation impedances";
  parameter SI.AngularVelocity wbase=2*C.pi*freq/poles "basis for angular speed";
  parameter Types.PerUnit iqr_max;
  parameter Types.PerUnit idr_max;
  parameter Types.PerUnit iqr_min;
  parameter Types.PerUnit idr_min;
  parameter Integer poles=2 "Number of poles-pair";
  parameter Real Kv=10 "Voltage control gain";
  parameter Types.Time Te=0.01 "Power Control time constant";
  parameter Real k=x1*Pnom/Vbus0/Xm/Sbase "gain for iqr_off computation";
  parameter Types.PerUnit ids0=((-vds0^2) + vds0*Xm*iqr0 - x1*Qc)/(Rs*vds0 - x1*vqs0);
  parameter Types.PerUnit iqs0=((-vds0*vqs0) + vqs0*Xm*iqr0 - Rs*Qc)/(Rs*vds0 - x1*vqs0);
  parameter Types.PerUnit idr0=-(vqs0 + Rs*iqs0 + x1*ids0)/Xm;
  parameter Types.PerUnit iqr0=-x1*Pnom*(2*omega_m0 - 1)/Vbus0/Xm/Sbase/omega_m0;
  parameter Types.PerUnit vds0=-Vbus0*sin(angle_0);
  parameter Types.PerUnit vqs0=Vbus0*cos(angle_0);
  parameter Types.PerUnit vdr0=(-Rr*idr0) + (1 - omega_m0)*(x2*iqr0 + Xm*iqs0);
  parameter Types.PerUnit vqr0=(-Rr*iqr0) - (1 - omega_m0)*(x2*idr0 + Xm*ids0);
  Types.PerUnit idrI "internal, non saturated idr";
  Types.PerUnit iqrI "internal, non saturated iqr";
  Types.PerUnit Vref;
  Types.PerUnit iqr_off;
  Types.PerUnit pwa;
  parameter Types.TimeAging i2Hm=1/(2*Hm) "inverse inertia";
protected
  parameter Types.Time Tdmy = 1 "dummy time constant";
initial equation
  0 = ((-(Xs + Xm)*pwa/Vbus/Xm/omega_m) - iqr - iqr_off);
  Vref = Vbus0 - (idrI + Vbus0/Xm)/Kv;
  iqr_off = (-k*max(min(2*omega_m0 - 1, 1), 0)/omega_m0) - iqrI;
equation
  der(Vref) = 0;
  der(iqr_off) = 0;
  pwa = max(min(2*omega_m - 1, 1), 0)*Pnom/Sbase;
  der(iqrI) = ((-(Xs + Xm)*pwa/Vbus/Xm/omega_m) - iqr - iqr_off)/Te;
  der(idrI) = (Kv*(Vbus - Vref) - Vbus/Xm - idr)/Tdmy;
  iqr = min(max(iqrI, iqr_min), iqr_max);
  idr = min(max(idrI, idr_min), idr_max);
  when iqrI > iqr_max and der(iqrI) < 0 then
    reinit(iqrI, iqr_max);
  elsewhen iqrI < iqr_min and der(iqrI) > 0 then
    reinit(iqrI, iqr_min);
  end when;
  when idrI > idr_max and der(idrI) < 0 then
    reinit(idrI, idr_max);
  elsewhen idrI < idr_min and der(idrI) > 0 then
    reinit(idrI, idr_min);
  end when;
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        grid={10,10}), graphics={Rectangle(
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          origin={0.294,8.6655},
          fillPattern=FillPattern.Solid,
          extent={{-47.919,-38.6655},{47.919,38.6655}},
          textString="elecDyn",
          fontName="Arial")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        grid={5,5})));
end ElecDynBlk;
