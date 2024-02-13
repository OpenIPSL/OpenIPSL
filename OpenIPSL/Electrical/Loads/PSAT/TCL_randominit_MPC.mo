within OpenIPSL.Electrical.Loads.PSAT;
model TCL_randominit_MPC
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
  OpenIPSL.Types.PerUnit vr;
  OpenIPSL.Types.PerUnit vi;

  //initial equation
  //  vr = Vo_real;
  //  vi = Vo_img;
public
  Modelica.Blocks.Interfaces.RealInput u annotation (
    Placement(visible = true, transformation(origin = {-55.502, 37.594}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 45.188}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Interfaces.PwPin p annotation (Placement(transformation(extent={{-60,-11},{-40,
            9}}), iconTransformation(extent={{-130,-14},{-100,14}})));
  Modelica.Blocks.Tables.CombiTable1Ds rr(
    table=[0,0.95; 0.925,0.95; 0.949,0.95; 0.95,0.975; 0.974,0.975; 0.975,1; 1,1],
    smoothness=Modelica.Blocks.Types.Smoothness.ConstantSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{-113,70},{-93,90}})));

  Modelica.Blocks.Interfaces.RealInput r annotation (Placement(
        transformation(extent={{-145,70},{-125,90}}),
                                                    iconTransformation(
        extent={{9,-10},{-9,10}},
        rotation=270,
        origin={-1,-106})));
equation
  when {theta < theta_min and pre(switch) <> 1 or theta > theta_max and pre(switch) <> 0} then
    switch = 1 - pre(switch);
  end when;
  der(theta) = ((-theta_a) + theta + R * P/Changeofbase) / (t1 + R * u * range);
  v = sqrt(vr * vr + vi * vi);
  anglev = atan2(p.vi, p.vr);
  P = switch *g0 * v * v * Changeofbase;
  Q = 0;
  P = vr * p.ir + vi * p.ii;
  Q = vi * p.ir - vr * p.ii;
  vr = rr.y[1] * p.vr;
  vi = rr.y[1] * p.vi;

  //if p.vr==0 then
  //   switch=0;
  // end if;
  //annotation(Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}})}), Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  //annotation(Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  connect(r,rr. u)
    annotation (Line(points={{-135,80},{-115,80}},
                                                 color={0,0,127}));
  annotation (
    Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics={  Rectangle(visible = true, fillColor = {255, 255, 255}, extent = {{-100.0, -100.0}, {100.0, 100.0}}), Text(visible = true, origin = {-0.0, 12.959}, fillPattern = FillPattern.Solid, extent = {{-47.0119, -20.8509}, {47.0119, 20.8509}}, textString = "%name", fontName = "Arial")}),
    Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end TCL_randominit_MPC;
