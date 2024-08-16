within OpenIPSL.NonElectrical.Functions;
function div0protect "Division avoiding 0 by replacing b with eps if requried"
  extends Modelica.Icons.Function;
  import eps=Modelica.Constants.small;

  // Public variables
  input Real a "Dividend";
  input Real b "Divisor";
  output Real c "Quotient";

algorithm
 c := a/(max(b,eps));

  annotation (
    Documentation(info="<html>
<p>This function computes <code>c=a/b</code>. It avoids divisions by zero by replacing
<code>a/b</code> with <code>a/eps</code> or <code>a/b</code> whichever of the divisors is larger.
</p>
</html>"));
end div0protect;
