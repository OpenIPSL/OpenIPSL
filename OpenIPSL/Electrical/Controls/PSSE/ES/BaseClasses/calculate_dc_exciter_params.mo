within OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses;
function calculate_dc_exciter_params
  "Automatic Calculation of DC Exciter Parameters"
  extends Modelica.Icons.Function;
  input Real V_RMAX_init;
  input Real V_RMIN_init;
  input Real K_E_init;
  input Real E_2;
  input Real S_EE_2;
  input Real Efd0;
  input Real SE_Efd0;
  output Real V_RMAX;
  output Real V_RMIN;
  output Real K_E;
algorithm
  if V_RMAX_init == 0 then
    if K_E_init <= 0 then
      V_RMAX := S_EE_2*E_2;
    else
      V_RMAX := S_EE_2 + K_E_init;
    end if;
  else
    V_RMAX := V_RMAX_init;
  end if;
  if K_E_init == 0 then
    K_E := V_RMAX/(10*Efd0) - SE_Efd0;
  else
    K_E := K_E_init;
  end if;
  if V_RMAX_init == 0 then
    V_RMIN := -V_RMAX;
  else
    V_RMIN := V_RMIN_init;
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
end calculate_dc_exciter_params;
