within OpenIPSL.NonElectrical.Nonlinear;
model Deadband1
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real db=0.1 "Deadband";
  parameter Real err=0.1 "Step";

equation
  if err < Modelica.Constants.eps then
    if u >= db then
          y = u - db;
    elseif u <= -db then
          y = u + db;
    else
      y = 0;
    end if;

  else
    if u >= db then
      y = u - err;
    elseif u <= -db then
      y = u + err;
    else
      y = 0;
    end if;
  end if;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Deadband1;
