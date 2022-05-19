within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.GGOV1.DelayModelChoices;
partial block Interface
  "Interface: A Common interface for the delay models. There is no \"behavior\" in this layer, only icon for common inherence."
 parameter Types.Time Teng = C.eps "Transport lag time constant for diesel engine";
  annotation (Icon(graphics={   Rectangle(extent={{-96,-96},{96,96}}, lineColor={244,125,35})}),
                              Documentation(info="<html>
This is only an icon/graphical interface model that provides a common interface to be able to quickly replace between the two types of delay models that are supported with their predifined parameters.
</html>", revisions="<html>
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
"));
end Interface;
