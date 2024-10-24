within OpenIPSL.NonElectrical.Nonlinear;
model Deadband2
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real db=0.1 "Deadband";

algorithm

  when u < (pre(y) - db) then
    y :=u + db;
  end when;

  when u <= (pre(y) + db) and u >= (pre(y) - db) then
    y :=pre(y);
  end when;

  when u > (pre(y) + db) then
    y :=u - db;
  end when;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Deadband2;
