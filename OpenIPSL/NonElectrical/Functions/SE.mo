within OpenIPSL.NonElectrical.Functions;
function SE "Scaled Quadratic Saturation Function (PTI PSS/E) "
  extends Modelica.Icons.Function;
  input Real u "Unsaturated Input";
  input Real SE1;
  input Real SE2;
  input Real E1;
  input Real E2;
  output Real sys "Saturated Output";
protected
  parameter Real a=if SE2 <> 0 then sqrt(SE1*E1/(SE2*E2)) else 0;
  parameter Real A=E2 - (E1 - E2)/(a - 1);
  parameter Real B=if abs(E1 - E2) < Modelica.Constants.eps then 0 else SE2*E2*
      (a - 1)^2/(E1 - E2)^2;
algorithm
  if SE1 == 0.0 or u <= 0.0 then
    sys := 0.0;
  else
    if u <= A then
      sys := 0.0;
    else
      sys := B*(u - A)^2/u;
    end if;
  end if;
  annotation (Documentation(info="<html>
</html>"));
end SE;
