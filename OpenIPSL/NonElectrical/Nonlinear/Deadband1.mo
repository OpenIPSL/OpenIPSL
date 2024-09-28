within OpenIPSL.NonElectrical.Nonlinear;
model Deadband1
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real db=0.1 "Deadband";
  parameter Real err=0.1 "Step";

// protected
//   Real dummy_der "Dummy variable for derivative used in equation section";

equation

//   dummy_der = der(u);

  if err == 0 then
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
//     else
//       if dummy_der > 0 and u <= 0 and pre(u) >  then
//         y = u + err;
//       elseif dummy_der < 0 and u > 0 then
//         y = u - err;
    else
      y = 0;
    end if;
//     end if;

  end if;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Deadband1;
