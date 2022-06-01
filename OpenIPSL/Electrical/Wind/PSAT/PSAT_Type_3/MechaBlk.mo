within OpenIPSL.Electrical.Wind.PSAT.PSAT_Type_3;
model MechaBlk "Mechanical block for Type 3 wind machine model"
  Modelica.Blocks.Interfaces.RealInput Tm "engine shaft torque" annotation (
      Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-43.0,7.7602}),
      iconTransformation(
        origin={2.0,-24.0},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealInput Tel "electromagnetical torque"
    annotation (Placement(
      transformation(
        extent={{-102.0,54.0},{-62.0,94.0}},
        origin={-43.0,-34.0}),
      iconTransformation(
        origin={2.0,-124.0},
        extent={{-102.0,54.0},{-62.0,94.0}})));
  Modelica.Blocks.Interfaces.RealOutput omega_m "engine shaft angular velocity"
    annotation (Placement(
      transformation(
        extent={{102.0,54.0},{62.0,94.0}},
        origin={43.0,-74.0}),
      iconTransformation(
        origin={-2.0,-74.0},
        extent={{102.0,54.0},{62.0,94.0}})));
  parameter Types.ApparentPower Sbase=100000000 "Power Rating [Normalization Factor]";
  parameter Types.ApparentPower Pnom=10000000 "Nominal Power";
  parameter Types.Time Hm=0.3 "inertia";
  parameter Types.PerUnit Pc=0.016 "Input Power Flow";
initial equation
  if Pc < Pnom/Sbase and Pc > 0 then
    omega_m = 0.5*Pc*Sbase/Pnom + 0.5;
  elseif Pc*Sbase >= Pnom then
    omega_m = 1;
  else
    omega_m = 0.5;
  end if;
  Tel = Tm;
equation
  der(omega_m) = (Tm - Tel)/(2*Hm);
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        grid={10,10}), graphics={Rectangle(
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          origin={-1.9109,6.1667},
          fillPattern=FillPattern.Solid,
          extent={{-49.8299,-36.1667},{49.8299,36.1667}},
          textString="meca",
          fontName="Arial")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        grid={5,5})));
end MechaBlk;
