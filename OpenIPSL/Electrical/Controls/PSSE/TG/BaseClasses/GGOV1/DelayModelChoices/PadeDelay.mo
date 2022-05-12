within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1.DelayModelChoices;
block PadeDelay "Pade Delay (MSL)"
  extends Modelica.Blocks.Nonlinear.PadeDelay(delayTime=Teng,n=2,m=n,balance=true);
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
</html>",
 info="<html>
<p>This model extends the Pade Delay model from the MSL, and it extends the &quot;Interface&quot; model, so that the delay models can be repleaceable while keeping default parameters.</p>
</html>"));
end PadeDelay;
