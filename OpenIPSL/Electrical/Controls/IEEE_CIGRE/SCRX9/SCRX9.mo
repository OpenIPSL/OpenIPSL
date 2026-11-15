within OpenIPSL.Electrical.Controls.IEEE_CIGRE.SCRX9;
model SCRX9 "SCRX9 - Bus fed or solid fed static exciter, IEEE/CIGRE DLL (real-code) implementation"
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  parameter Real T_AT_B=0.1 "Ratio between regulator numerator (lead) and denominator (lag) time constants (DLL parameter TAdTB)";
  parameter OpenIPSL.Types.Time T_B=1 "Regulator denominator (lag) time constant (DLL parameter TB)";
  parameter OpenIPSL.Types.PerUnit K=100 "Excitation power source output gain (DLL parameter K)";
  parameter OpenIPSL.Types.Time T_E=0.005 "Excitation power source output time constant (DLL parameter TE; the DLL raises values below 2*Ts to 2*Ts)";
  parameter OpenIPSL.Types.PerUnit E_MIN=-10 "Minimum exciter output (DLL parameter EMin)";
  parameter OpenIPSL.Types.PerUnit E_MAX=10 "Maximum exciter output (DLL parameter EMax)";
  parameter Boolean C_SWITCH=false "Feeding selection. False for bus fed, and True for solid fed (DLL parameter CSwitch 0 or 1)";
  parameter Real r_cr_fd=10 "Ratio between crowbar circuit resistance and field circuit resistance (DLL parameter RCdRFD)";
  final parameter Modelica.Units.SI.Time Ts=Functions.sampleTime() "Fixed base sample time of the DLL (FixedStepBaseSampleTime)";
protected
  parameter OpenIPSL.Types.PerUnit VR0(fixed=false) "Initial regulator output, OControl of the DLL";
  parameter OpenIPSL.Types.PerUnit VOTHSG0(fixed=false) "Initial stabilizer signal";
  parameter OpenIPSL.Types.PerUnit XADIFD0(fixed=false) "Initial field current";
  parameter OpenIPSL.Types.PerUnit VUEL0(fixed=false) "Initial under-excitation limiter signal";
  parameter OpenIPSL.Types.PerUnit VOEL0(fixed=false) "Initial over-excitation limiter signal";
  Instance dll=Instance(
    {T_AT_B,T_B,K,T_E,E_MIN,E_MAX,if C_SWITCH then 1.0 else 0.0,r_cr_fd},
    {V_REF - VR0/K,ECOMP0,VOTHSG0,XADIFD0,ECOMP0,VUEL0,VOEL0},
    {Efd0},
    2) "One instance of the SCRX9 DLL model, RMS mode";
  discrete OpenIPSL.Types.PerUnit EFD_dll[1] "Output of the DLL, held between samples";
  discrete Integer status(start=0, fixed=true) "Return code of the last DLL step";
initial equation
  if not C_SWITCH then
    VR0 = Efd0/ECOMP0;
  else
    VR0 = Efd0;
  end if;
  V_REF = VR0/K + ECOMP0;
  VOTHSG0 = VOTHSG;
  XADIFD0 = XADIFD;
  VUEL0 = VUEL;
  VOEL0 = VOEL;
  EFD_dll = {Efd0};
initial algorithm
  assert(Functions.count(0) == 7, "SCRX9: the library SCRX9 in OpenIPSL/Resources/Library reports "
     + String(Functions.count(0)) + " inputs, this model passes 7; the library does not match the model.");
  assert(Functions.count(1) == 1, "SCRX9: the library SCRX9 in OpenIPSL/Resources/Library reports "
     + String(Functions.count(1)) + " outputs, this model reads 1; the library does not match the model.");
  assert(T_E >= 2*Ts, "SCRX9: T_E = " + String(T_E) + " s is below 2*Ts = " + String(2*Ts)
     + " s; the DLL's Model_CheckParameters raises it to 2*Ts.", AssertionLevel.warning);
  assert(T_B >= 2*Ts, "SCRX9: T_B = " + String(T_B) + " s is below 2*Ts = " + String(2*Ts)
     + " s; the DLL's Model_CheckParameters raises it to 2*Ts.", AssertionLevel.warning);
equation
  connect(ECOMP, DiffV.u2) annotation (Line(points={{-200,0},{-132,0},{-132,-6},{-122,-6}}, color={0,0,127}));
  when sample(0, Ts) then
    (EFD_dll, status) = Functions.step(
      dll,
      time,
      {V_REF - VR0/K,ECOMP,VOTHSG,XADIFD,ECOMP,VUEL,VOEL},
      1);
  end when;
  EFD = EFD_dll[1];
  assert(status == 0 or status == 1, "SCRX9: the DLL returned status " + String(status)
     + " (2 error, -1 instance not created, -2 size mismatch); its message is on the standard error stream of the simulation.");
  annotation (
    Diagram(coordinateSystem(extent={{-200,-200},{200,160}}), graphics={
        Rectangle(
          extent={{-60,60},{160,-60}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-56,50},{156,20}},
          textColor={28,108,200},
          textString="IEEE/CIGRE DLL SCRX9"),
        Text(
          extent={{-56,10},{156,-14}},
          textColor={0,0,0},
          textString="when sample(0, Ts): EFD = step(VRef, Ec, Vs, IFD, VT, VUEL, VOEL)"),
        Text(
          extent={{-56,-24},{156,-50}},
          textColor={0,0,0},
          textString="VRef = V_REF - VR0/K, Ec = VT = ECOMP, Vs = VOTHSG, IFD = XADIFD")}),
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Text(
          extent={{-100,160},{100,100}},
          textColor={28,108,200},
          textString="SCRX9 DLL")}),
    Documentation(info="<html>
<p>
Bus fed or solid fed static excitation system (AC4A of [IEEE1992] / AC4C of [IEEE2016], the PSS/E model SCRX), computed
by the compiled C code of the IEEE/CIGRE DLL Modeling Standard example model <code>SCRX9</code> instead of by Modelica
equations. It extends the same base class as <a href=\"modelica://OpenIPSL.Electrical.Controls.PSSE.ES.SCRX\">PSSE.ES.SCRX</a>
and has the same ports and parameters, so the two models are interchangeable in a generating unit.
</p>
<h4>Ports and DLL signals</h4>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\">
<tr><th>DLL input</th><th>Connected to</th></tr>
<tr><td>VRef</td><td><code>V_REF - VR0/K</code> (constant, see the initialisation below)</td></tr>
<tr><td>Ec</td><td><code>ECOMP</code></td></tr>
<tr><td>Vs</td><td><code>VOTHSG</code></td></tr>
<tr><td>IFD</td><td><code>XADIFD</code></td></tr>
<tr><td>VT</td><td><code>ECOMP</code> (bus fed supply voltage, as in the native model)</td></tr>
<tr><td>VUEL</td><td><code>VUEL</code></td></tr>
<tr><td>VOEL</td><td><code>VOEL</code></td></tr>
</table>
<p>
The single DLL output <code>EFD</code> drives the port <code>EFD</code>. <code>EFD0</code> (the machine's initial field
voltage) is the initial output handed to the DLL.
</p>
<h4>Parameters</h4>
<p>
The eight parameters go to the DLL in the order of its <code>ParametersInfo</code>: <code>T_AT_B</code> (TAdTB),
<code>T_B</code> (TB), <code>K</code> (K), <code>T_E</code> (TE), <code>E_MIN</code> (EMin), <code>E_MAX</code> (EMax),
<code>C_SWITCH</code> (CSwitch, 0 bus fed, 1 solid fed, an <code>int32_T</code> in the DLL) and <code>r_cr_fd</code>
(RCdRFD). The DLL's <code>Model_CheckParameters</code> raises <code>T_E</code> and <code>T_B</code> to
<code>2*Ts</code> = 0.01 s when they are smaller; the model warns at initialisation when that happens.
</p>
<h4>Initialisation (derived from Model_Initialize and Model_Outputs of SCRX9.c)</h4>
<p>
<code>Model_Initialize</code> works back from the initial output <code>EFD</code> and the initial input <code>VT</code>:
</p>
<pre>
OControl0 = EFD/VT  (CSwitch = 0)   or   EFD  (CSwitch = 1), limited to [EMin, EMax]
OLeadLag0 = OControl0/K,  Verr0 = OLeadLag0,  VOffset = OLeadLag0  (VOffset is never updated)
</pre>
<p>
and <code>Model_Outputs</code> computes at every sample
</p>
<pre>
Verr     = VRef - Ec + Vs + VUEL + VOEL + VOffset
OControl = REALPOLE(K, TE) applied to LeadLag(Verr), limited to [EMin, EMax]
EFD      = OControl*VT (CSwitch = 0) or OControl (CSwitch = 1)
EFD      = -IFD*RCdRFD instead, when IFD &lt; 0 and RCdRFD &gt; 1e-8
</pre>
<p>
so the DLL is in steady state when <code>VRef - Ec + Vs + VUEL + VOEL = 0</code> at time zero. The native SCRX computes
<code>VR0 = Efd0/ECOMP0</code> (bus fed) or <code>VR0 = Efd0</code> (solid fed) and <code>V_REF = VR0/K + ECOMP0</code>.
This model computes <code>VR0</code> and <code>V_REF</code> with the same initial equations, passes
<code>EFD = Efd0</code> as the initial output and <code>VT = Ec = ECOMP0</code> as initial inputs, so that the DLL
computes <code>OControl0 = VR0</code> and <code>VOffset = VR0/K</code>, and feeds the DLL
<code>VRef = V_REF - VR0/K</code>. Then
</p>
<pre>
Verr = V_REF - ECOMP + VOTHSG + VUEL + VOEL     (VRef = V_REF - VR0/K = ECOMP0, a constant)
</pre>
<p>
is the error signal of the native model, the reference keeps the native value <code>V_REF</code>, and the first step
at time zero returns <code>EFD = Efd0</code>. Two differences remain, both inside the vendor code: the DLL adds
<code>VOEL</code> (the PSS/E convention, VS = VOTHSG + VUEL + VOEL) where <code>PSSE.ES.SCRX</code> subtracts it, and with
<code>r_cr_fd = 0</code> and a negative field current the DLL keeps the regulator output where the native negative
current logic gives zero (the DLL also declares the range [0.001, 100] for <code>r_cr_fd</code>, and the adapter
warns about 0). If <code>OControl0</code> lies outside [EMin, EMax] the DLL clips it and prints a warning; the
initial state is then not a steady state, as in the native model.
</p>
<h4>Fixed-step contract</h4>
<p>
The DLL is a fixed-step controller with its own sample time <code>Ts</code> (<code>FixedStepBaseSampleTime</code>,
0.005 s), read from the library. The model calls the DLL once per sample in <code>when sample(0, Ts)</code>: the inputs
are sampled and the output is held between samples (zero-order hold), as in the host loop of the standard. Every sample
is a time event, so every solver steps the DLL at the same instants; the explicit Euler method with step
<code>Ts</code> is the cheapest (with a less accurate network solution between samples), DASSL with the default
tolerance works as well. Compared with the continuous native model the held output
delays the exciter by up to one sample, and the DLL integrates its blocks with the trapezoidal rule.
</p>
<h4>Errors</h4>
<p>
The DLL cannot call Modelica runtime functions. Its messages (<code>LastErrorMessage</code>,
<code>LastGeneralMessage</code>, size mismatches) go to the standard error stream of the simulation, and the model
stops with an assertion that names the DLL when a step returns an error code.
</p>
<h4>Provenance and references</h4>
<p>
<code>SCRX9.c</code> is the example model of the IEEE/CIGRE DLL Modeling Standard (API V2) by Garth Irwin
(Electranix), September 14, 2021, in the revision distributed by CIGRE JWG B4.82 with its example code (DLL_V1_1).
Appendix E of CIGRE Technical Brochure 958, &quot;Guidelines for use of real-code in EMT models for HVDC, FACTs and
inverter based generators in power systems analysis&quot;, JWG B4.82/IEEE, 2025, prints another revision with the same
control code, which adds return-code tests and empty <code>Model_FirstCall</code> and <code>Model_Iterate</code>
functions; see <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.Provenance\">IEEE_CIGRE.Provenance</a>.
The source with its provenance block and the build project are in
<code>OpenIPSL/Resources/C-Sources/IEEE_CIGRE/</code>; how to build the library is in
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.README\">IEEE_CIGRE.README</a>. The integration in
Modelica follows H. Chang and L. Vanfretti, &quot;Integrating the IEEE/CIGRE DLL Modeling Standard to Use 'Real Code'
Models for Power System Analysis in Modelica Tools,&quot; Proceedings of the American Modelica Conference 2024, October
14-16, 2024, Storrs, Connecticut, USA,
<a href=\"https://doi.org/10.3384/ecp20772\">DOI: 10.3384/ecp20772</a>.
</p>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>IEEE/CIGRE DLL Modeling Standard API V2, SCRX9 example model (CIGRE JWG B4.82 example code DLL_V1_1; another revision is printed in CIGRE TB 958 Appendix E)</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2026-10</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Hao Chang, Rensselaer Polytechnic Institute (first version, OpenIPSL PR #362); rewritten for the OpenIPSL adapter in 2026</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end SCRX9;
