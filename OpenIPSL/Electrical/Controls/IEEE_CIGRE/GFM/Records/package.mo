within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM;
package Records "Parameter sets of the GFM_GFL_IBR DLL"
  extends Modelica.Icons.RecordsPackage;

  annotation (Documentation(info="<html>
<p>
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Records.ParameterSet\">ParameterSet</a> holds the 41
parameters of the IEEE/CIGRE model <code>GFM-GFL-IBR-PWM-Model</code> in the order and with the names of its
<code>ParametersInfo</code> table (the three bases as SI quantities, converted to kV and MVA for the DLL); its defaults are the values the Dymola studies of the 2024 and 2026 papers by Chang
and Vanfretti used (a 6.5 kV, 10 MVA converter).
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Records.PSCAD\">PSCAD</a> extends it with the values of
the PSCAD test setup EPRI shared (a 0.65 kV, 100 MVA converter). Select the set through the parameter
<code>dllParameters</code> of
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR\">GFM_GFL_IBR</a>, or extend
<code>ParameterSet</code> with your own modifiers.
</p>
</html>"));
end Records;
