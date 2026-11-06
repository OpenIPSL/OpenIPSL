within OpenIPSL.Tests.Controls.IEEE_CIGRE.SCRX9;
model SCRX9_vs_SCRX "SCRX9 DLL exciter and native SCRX exciter on two copies of the same SMIB system"
  extends Modelica.Icons.Example;
  parameter OpenIPSL.Types.Time T_E_common=0.01 "Exciter output time constant used in both systems (the DLL accepts no value below 0.01 s)";
  parameter Real r_cr_fd_common=10 "Crowbar to field resistance ratio used in both systems (inactive here, the field current stays positive)";
  OpenIPSL.Tests.Controls.IEEE_CIGRE.SCRX9.SCRX9 dll(sCRX9(T_E=T_E_common, r_cr_fd=r_cr_fd_common)) "SMIB system with the SCRX9 DLL exciter"
    annotation (Placement(transformation(extent={{-60,-20},{-20,20}})));
  OpenIPSL.Tests.Controls.PSSE.ES.SCRX native(
    pwFault(t1=2.0025, t2=2.1525),
    sCRX(T_E=T_E_common, r_cr_fd=r_cr_fd_common)) "SMIB system with the native SCRX exciter, faulted at the times of the DLL system"
    annotation (Placement(transformation(extent={{20,-20},{60,20}})));
  OpenIPSL.Types.PerUnit dEFD=dll.sCRX9.EFD - native.sCRX.EFD "Field voltage, DLL minus native";
  OpenIPSL.Types.PerUnit dV=dll.GEN1.v - native.GEN1.v "Voltage magnitude of bus GEN1, DLL minus native";
  OpenIPSL.Types.PerUnit dw=dll.gENROU.w - native.gENROU.w "Machine speed deviation, DLL minus native";
  annotation (
    Diagram(graphics={
        Text(
          extent={{-60,40},{-20,24}},
          textColor={28,108,200},
          textString="SCRX9 (DLL)"),
        Text(
          extent={{20,40},{60,24}},
          textColor={28,108,200},
          textString="SCRX (native)")}),
    experiment(
      StopTime=10,
      Interval=0.005,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>
Two copies of the SMIB test system side by side: <code>dll</code> is
<a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.SCRX9.SCRX9\">Tests.Controls.IEEE_CIGRE.SCRX9.SCRX9</a> (exciter
computed by the IEEE/CIGRE DLL) and <code>native</code> is
<a href=\"modelica://OpenIPSL.Tests.Controls.PSSE.ES.SCRX\">Tests.Controls.PSSE.ES.SCRX</a> (the PSS/E-verified Modelica
exciter). Both use the same machine, network, fault and exciter parameters; <code>T_E_common</code> sets the exciter
output time constant of both to 0.01 s, the smallest value the DLL accepts, and <code>r_cr_fd_common</code> the crowbar
ratio of both to 10, inside the range the DLL declares (the field current stays positive, so the crowbar does not
act).
</p>
<p>
Plot <code>dll.sCRX9.EFD</code> with <code>native.sCRX.EFD</code>, <code>dll.GEN1.v</code> with
<code>native.GEN1.v</code>, and the differences <code>dEFD</code>, <code>dV</code> and <code>dw</code>. Before the
fault at 2.0025 s the differences stay below 2e-6 (both systems start in the same steady state; the largest, 1.22e-6 pu
in the field voltage, is the held DLL output just before a sample, and right after each sample it is 3.3e-7 pu); after
it they show the effect of the DLL's 5 ms sample-and-hold and trapezoidal discretisation against the continuous native
model. This is the comparison of Figs. 7 and 9 of H. Chang and L. Vanfretti, American Modelica Conference 2024,
<a href=\"https://doi.org/10.3384/ecp20772\">DOI: 10.3384/ecp20772</a>, in one model.
</p>
<p>
Both systems are faulted from 2.0025 s to 2.1525 s, the paper's 2 s to 2.15 s shifted by half a DLL sample (2.5 ms):
<code>dll</code> inherits these times from its test, and <code>native</code> gets them by a modifier, so that the
native test of the PSS/E package keeps its round times. On a 5 ms sample instant of the DLL the fault and the DLL step
are simultaneous events that the tools order differently (the verification of 2026-10-25 measured that Dymola and
System Modeler step the DLL after the fault and OpenModelica before it); half a sample off the grid the order is
unique and Dymola and OpenModelica agreed to 1e-4 pu in the field voltage.
</p>
<p>
System Modeler 15.0 does not translate the native test system it contains (see the
<a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.README\">README</a>), so this comparison is for Dymola and
OpenModelica.
</p>
</html>"));
end SCRX9_vs_SCRX;
