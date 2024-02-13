within OpenIPSL.Electrical.Loads.PSAT;
model TCL_randominit
  "On Off model of Thermostatically Controlled Load"
  //extends OpenIPSL.Electrical.Loads.PSAT.BaseEquations.PQ(break p);
  extends OpenIPSL.Electrical.Loads.PSAT.BaseEquations.ChangeBase;
  //parameter Real anglev0 = 0 "Power flow, node angle";
  parameter Real v0 = 1 "Power flow, node voltage";
  parameter Real p0 = 0.50;
  //Base is 100MVA
  parameter Real g0 = p0/ v0 ^ 2;
  parameter Real theta_ref = 20;
  parameter Real theta_a = 32;
  parameter Real theta_min = 19.75;
  parameter Real theta_max = 20.25;
  parameter Real t1 = R * C;
  parameter Real R = 100;
  parameter Real C = 80;
  parameter Real range = 4.5;
  parameter Integer start0 = 1;

  //parameter Real k = 1;
  Real theta(start = theta_ref, fixed = true);
  Real v "voltage";
  Real anglev "voltage angle";
  Integer switch(start = start0);
  OpenIPSL.Types.PerUnit P;
  OpenIPSL.Types.PerUnit Q;
  //initial equation
  //  vr = Vo_real;
  //  vi = Vo_img;
public
  Modelica.Blocks.Interfaces.RealInput u annotation (
    Placement(visible = true, transformation(origin = {-55.502, 37.594}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 45.188}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Interfaces.PwPin p annotation (Placement(transformation(extent={{-60,-11},{-40,
            9}}), iconTransformation(extent={{-130,-14},{-100,14}})));
equation
  when {theta < theta_min and pre(switch) <> 1 or theta > theta_max and pre(switch) <> 0} then
    switch = 1 - pre(switch);
  end when;
  der(theta) = ((-theta_a) + theta + R * P/Changeofbase) / (t1 + R * u * range);
  v = sqrt(p.vr * p.vr + p.vi * p.vi);
  anglev = atan2(p.vi, p.vr);
  P = switch *g0 * v * v * Changeofbase;
  Q = 0;
  P = p.vr * p.ir + p.vi * p.ii;
  Q = p.vi * p.ir - p.vr * p.ii;
  //if p.vr==0 then
  //   switch=0;
  // end if;
  //annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}})}), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  //annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics={  Rectangle(visible = true, fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(visible = true, origin = {-0.0, 12.959}, fillPattern = FillPattern.Solid, extent = {{-47.0119, -20.8509}, {47.0119, 20.8509}}, textString = "%name", fontName = "Arial")}),
    Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end TCL_randominit;
