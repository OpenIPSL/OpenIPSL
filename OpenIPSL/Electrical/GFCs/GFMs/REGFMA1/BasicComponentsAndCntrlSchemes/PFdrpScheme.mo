within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.BasicComponentsAndCntrlSchemes;
model PFdrpScheme "P-f droop control scheme model without P limiters"
  extends Base.PFdrpCntrlSchemeBase;
  Modelica.Blocks.Sources.Constant Plimsig(k=0) "Active power limiter signal"
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
equation
  connect(Plimsig.y, pfdroop.Plim_in)
    annotation (Line(points={{-39,-50},{-8,-50},{-8,-24}}, color={0,0,127}));
  annotation (Documentation(info="<html>
This model is extended from <code>*.BasicComponentsAndCntrlSchemes.PFdrpCntrlSchemeBase.</code>
It sets the signal for the active power limiter to zero, which implies that no such functionality exists in this scheme's variant.

</html>"), Icon(graphics={Text(
          extent={{-100,0},{100,-80}},
          textColor={238,46,47},
          textString="No Plims")}));
end PFdrpScheme;
