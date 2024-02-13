within OpenIPSL.Electrical.Loads.PSAT;
package BaseEquations
  model PQ
    Real P "Active power";
    Real Q "Reactive power";
    Interfaces.PwPin  p annotation (
      Placement(transformation(extent={{-60,-11},{-40,9}}),     iconTransformation(extent={{-130,
              -14},{-100,14}})));
  equation
    P = p.vr * p.ir + p.vi * p.ii;
    Q = p.vi * p.ir - p.vr * p.ii;
    annotation (
      Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end PQ;

  model ChangeBase
    parameter Real Sn = 2000 "VA, Nominal power of the Load";
    parameter Real Sbase = 1e8 "VA, System base";
    Real Changeofbase;
  equation
    Changeofbase = Sn / Sbase;
    annotation (
      Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end ChangeBase;
  annotation (
    Diagram(coordinateSystem(extent = {{-148.5, -105.0}, {148.5, 105.0}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end BaseEquations;
