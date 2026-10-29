within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Records;
record PSCAD "Parameter set of EPRI's PSCAD test setup (0.65 kV, 100 MVA converter), the constants of GFM_GFL_IBR_PSCAD.c"
  extends ParameterSet(
    Vbase=650,
    Sbase=100e6,
    Vdcbase=1500,
    KiI=20,
    KpV=1,
    KiV=10,
    PQflag=1,
    KfDroop=20,
    KvDroop=30,
    Rchoke=0,
    Lchoke=0.1,
    Cfilt=0.016666);
  annotation (Documentation(info="<html>
<p>
The twelve values in which the source file <code>GFM_GFL_IBR_PSCAD.c</code> of OpenIPSL pull request #362 differed from
<code>GFM_GFL_IBR.c</code> (lines 1132-1171): the parameter constants of the PSCAD v5.0.2 test setup that EPRI shared in
April 2026, a 0.65 kV, 100 MVA, 1.5 kV dc converter in droop mode with Q priority (<code>PQflag = 1</code>). All other
fields keep the values of
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Records.ParameterSet\">ParameterSet</a>.
</p>
<p>
The PSCAD variant of the DLL also used a base sample time of 2e-5 s instead of 1e-5 s. That value is
<code>Model_Info.FixedStepBaseSampleTime</code>, a compile-time constant of the DLL and not one of its parameters, so it
is <strong>not</strong> reproduced here: a converter using this record is still stepped every 1e-5 s by the shipped
library. The electrical filter of such a converter must be scaled to the 0.65 kV base as well; the pull request used
<code>c_filter = 0.0105 F</code>, <code>r_damp = 0.0401 Ohm</code>, <code>l_filter = 1.1207e-6 H</code> and
<code>r_l = 0</code>, as the test
<a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.GFM.GFL_FaultPSCAD\">GFL_FaultPSCAD</a> does.
</p>
</html>"));
end PSCAD;
