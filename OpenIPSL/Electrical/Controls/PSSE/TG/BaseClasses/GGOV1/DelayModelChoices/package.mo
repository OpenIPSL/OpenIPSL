within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1;
package DelayModelChoices "Provides choices for delay models to use either in simulation (Fixed Delay or Pade Approximation) or in linearization (Pade Approximation)"
  extends Modelica.Icons.VariantsPackage;

  block FixedDelay "Fixed Delay (MSL)"
    extends Modelica.Blocks.Nonlinear.FixedDelay(delayTime = Teng);
    extends DelayModelChoices.Interface;
  annotation (Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>None</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2022-05-11</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>
       <a href=\"https://github.com/lvanfretti\">@lvanfretti</a>
    </p>
</td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>
", info="<html>
<p>This model extends the Fixed Delay model from the MSL, and it extends the &quot;Interface&quot; model, so that the delay models can be repleaceable while keeping default parameters.</p>
</html>"));
  end FixedDelay;
end DelayModelChoices;
