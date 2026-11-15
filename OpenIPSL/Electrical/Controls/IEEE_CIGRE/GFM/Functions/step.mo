within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Functions;
impure function step "Advance the DLL instance by one base sample: write the inputs, call Model_Outputs once, read the outputs"
  input Instance dll "DLL instance";
  input Modelica.Units.SI.Time t "Simulation time handed to the DLL";
  input Real u[:] "Inputs in the DLL's order and units: Va, Vb, Vc (kV), Ia, Ib, Ic (kA), IaL1, IbL1, IcL1 (kA), Pref (MW), Qref (Mvar), Vref (pu)";
  input Integer ny "Number of outputs to read (12)";
  output Real y[ny] "Outputs in the DLL's order and units: Ea, Eb, Ec (kV), Idref, Id, Iqref, Iq, Vd, Vq (pu), Freq_pll (Hz), Pout (MW), Qout (Mvar)";
  output Integer status "0 ok, 1 message written to stderr, 2 error, -1 NULL instance, -2 size mismatch";
  external "C" status = GFM_GFL_IBR_oipsl_step(dll, t, u, size(u, 1), y, size(y, 1))
    annotation (Library="GFM_GFL_IBR", LibraryDirectory="modelica://OpenIPSL/Resources/Library");
  annotation (Documentation(info="<html>
<p>
One call is one base sample of the IEEE/CIGRE model: the adapter copies <code>u</code> into the input block, sets the
instance time to <code>t</code>, calls <code>Model_Outputs</code> exactly once and copies the output block into
<code>y</code>. The function is <code>impure</code> because it changes the state of the instance; call it from a
<code>when sample(0, Ts)</code> clause with <code>Ts = sampleTime()</code> so that the DLL clock equals the simulation
time, as <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR\">GFM_GFL_IBR</a> does.
</p>
<p>
The sizes of <code>u</code> and <code>y</code> must equal the DLL's scalar input and output counts (12 and 12, see
<code>count</code>); otherwise the adapter writes a message to the standard error stream and returns -2 without
stepping the model.
</p>
</html>"));
end step;
