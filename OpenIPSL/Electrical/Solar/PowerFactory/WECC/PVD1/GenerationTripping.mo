within OpenIPSL.Electrical.Solar.PowerFactory.WECC.PVD1;
model GenerationTripping
  parameter Real Lv0;
  parameter Real Lv1;
  parameter Real Lv2;
  parameter Real Lv3;
  parameter Real recov;
  parameter Real Tfilter = 1e-2 "Best to set about the time step value for fixed-step solvers";
  Modelica.Blocks.Interfaces.RealInput u annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput TrpLow annotation (
    Placement(visible = true, transformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput TrpHigh annotation (
    Placement(visible = true, transformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Real umin;
  Real umax;
initial equation
  umin = Lv1;
  umax = Lv2;
equation
  // Tracking the minimum and maximum input constrained by the Lv0 and Lv3, respectively
  umin + Tfilter * der(umin) = if noEvent(u < umin and umin > Lv0) then u else umin;
  umax + Tfilter * der(umax) = if noEvent(u > umax and umax < Lv3) then u else umax;
  // Tripping for low values of the input signal
  if noEvent(u < Lv0) then
    TrpLow = 0.0;
  elseif noEvent(u < Lv1) then
    TrpLow = (umin - Lv0 + (if noEvent(u <= umin) then 0 else recov * (u - umin))) / (Lv1 - Lv0);
  else
    TrpLow = if noEvent(umin >= Lv1) then 1.0 else (umin - Lv0 + recov * (Lv1 - umin)) / (Lv1 - Lv0);
  end if;
  // Handling the jump in TrpLow due to a delay in computing the minimum
  when (u <= Lv1) and (umin > Lv1) then
    reinit(umin, Lv1);
  end when;
  // Tripping for high values of the input signal
  if noEvent(u > Lv3) then
    TrpHigh = 0;
  elseif noEvent(u > Lv2) then
    TrpHigh = (Lv3 - umax + (if noEvent(u >= umax) then 0 else recov * (umax - u))) / (Lv3 - Lv2);
  else
    TrpHigh = if noEvent(umax <= Lv2) then 1.0 else (Lv3 - umax + recov * (umax - Lv2)) / (Lv3 - Lv2);
  end if;
// Handling the jump in TrpHihg due to a delay in computing the maximum
  when (u >= Lv2) and (umax < Lv2) then
    reinit(umax, Lv2);
  end when;
  annotation (
    Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {32, 93}, extent = {{-132, 7}, {68, -13}}, textString = "Generation Tripping"), Text(origin = {144, 53}, extent = {{-132, 7}, {-44, -13}}, textString = "TripLow"), Text(origin = {144, -47}, extent = {{-132, 7}, {-44, -13}}, textString = "TripHigh"), Text(origin = {36, 3}, extent = {{-132, 7}, {-44, -13}}, textString = "Input")}));
end GenerationTripping;
