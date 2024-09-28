within OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses;
function invFEX "Inverse F_EX function for initialization"
  input Real K_C=K_C;
  input Real Efd0;
  input Real Ifd0;
  output Real VE0;
algorithm
  if Ifd0 <= 0 then
    VE0 := Efd0;
  elseif K_C*Ifd0/(Efd0 + 0.577*K_C*Ifd0) <= 0.433 then
    VE0 := Efd0 + 0.577*K_C*Ifd0;
  elseif K_C*Ifd0/sqrt((Efd0^2 + (K_C*Ifd0)^2)/0.75) > 0.433 and K_C*Ifd0/sqrt(
      (Efd0^2 + (K_C*Ifd0)^2)/0.75) < 0.75 then
    VE0 := sqrt((Efd0^2 + (K_C*Ifd0)^2)/0.75);
  else
    VE0 := (Efd0 + 1.732*K_C*Ifd0)/1.732;
  end if;
  annotation (Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PAGV2 - Section 15.2.4, PSS&reg;E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2016-04-19</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a></p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end invFEX;
