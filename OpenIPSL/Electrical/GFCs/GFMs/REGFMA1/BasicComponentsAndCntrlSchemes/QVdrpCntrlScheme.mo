within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.BasicComponentsAndCntrlSchemes;
model QVdrpCntrlScheme "Q-v control scheme with no Q limiters"
  extends Base.QVdrpCntrlSchemeBase;
  Modelica.Blocks.Sources.Constant Qlimsig(k=0) "Active power limiter signal"
    annotation (Placement(transformation(extent={{-60,-120},{-40,-100}})));
equation
  connect(Qlimsig.y, qv_drp1.Qlim) annotation (Line(points={{-39,-110},{-30,
          -110},{-30,-48}}, color={0,0,127}));
  annotation (Icon(graphics={
                          Text(
          extent={{-100,0},{100,-80}},
          textColor={238,46,47},
          textString="No Qlims")}), Documentation(info="<html>
This model is extended from <code>*.BasicComponentsAndCntrlSchemes.QVdrpCntrlSchemeBase.</code>
It sets the signal for the reactive power limiter to zero, which implies that no such functionality exists in this scheme's variant.

</html>"));
end QVdrpCntrlScheme;
