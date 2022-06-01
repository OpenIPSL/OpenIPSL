within OpenIPSL.Electrical.Wind.PSAT.PSAT_Type_3;
model WindBlk "Wind block for Type 3 wind machine model"
  import Modelica.Constants.pi;
  Modelica.Blocks.Interfaces.RealInput vw "Real voltage" annotation (Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-43.0,7.7602}),
      iconTransformation(
        origin={2.0,-2.4053},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealInput theta_p "Pitch angle" annotation (
      Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-43.0,-34.0}),
      iconTransformation(
        origin={2.0,-76.5688},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealInput omega_m "Mechanical speed" annotation (
      Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-43.0,-74.0}),
      iconTransformation(
        origin={2.0,-146.3226},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealOutput Tm "Mechanical torque" annotation (Placement(
      transformation(
        extent={{102.0,54.0},{62.0,94.0}},
        origin={43.0,-74.0}),
      iconTransformation(
        origin={-2.0,-71.3573},
        extent={{102.0,54.0},{62.0,94.0}})));
  parameter SI.Velocity vw_base=15 "Vw Nominal";
  parameter SI.Density rho=1.225 "Air Density";
  parameter Types.ApparentPower Sbase=100000000 "Power Rating [Normalization Factor]";
  parameter SI.Length l=75 "Blade length";
  parameter Real ngb=0.01123596 "gear box ratio";
  parameter Real Radapt=ngb*l "r_{gearbox}*r";
  parameter Integer poles=2 "Number of poles-pair";
  parameter Types.Frequency freq=50 "frequency rating";
  parameter SI.AngularVelocity wbase=2*pi*freq;
  parameter SI.Area Ar=pi*l^2 "blades area";
  Real lambda "Tip speed Ratio";
  Real lambdai "Tip Speed Ratio optimal";
  Real cp "Capacity coefficient";
  Types.ApparentPower Pw "Power in the Wind";
equation
  lambda = omega_m*wbase*Radapt/(vw*vw_base);
  lambdai = 1/(1/(lambda + 0.08*theta_p) - 0.035/(theta_p^3 + 1));
  cp = 0.22*(116/lambdai - 0.4*theta_p - 5)*exp(-12.5/lambdai);
  Pw = 0.5*rho*cp*Ar*(vw*vw_base)^3/(Sbase);
  Tm = Pw/omega_m;
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        grid={10,10}), graphics={Rectangle(
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          origin={5.2917,-1.4606},
          fillPattern=FillPattern.Solid,
          extent={{-39.3935,-41.4606},{39.3935,41.4606}},
          textString="wind",
          fontName="Arial")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        grid={5,5})));
end WindBlk;
