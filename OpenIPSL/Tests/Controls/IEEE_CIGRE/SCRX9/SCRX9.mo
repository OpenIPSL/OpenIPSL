within OpenIPSL.Tests.Controls.IEEE_CIGRE.SCRX9;
model SCRX9 "SMIB system to test the SCRX9 exciter computed by the IEEE/CIGRE DLL"
  extends OpenIPSL.Tests.BaseClasses.SMIB(pwFault(t1=2.0025, t2=2.1525));
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    Tpd0=5,
    Tppd0=0.07,
    Tpq0=0.9,
    Tppq0=0.09,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xpq=0.6,
    Xppd=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    angle_0=0.070492225331847,
    Xppq=0.2,
    R_a=0,
    Xpp=0.2,
    H=4.28,
    M_b=100000000,
    P_0=40000000,
    Q_0=5416582,
    v_0=1) annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(extent={{6,-6},{-6,6}}, origin={-34,-80})));
  OpenIPSL.Electrical.Controls.IEEE_CIGRE.SCRX9.SCRX9 sCRX9(
    T_AT_B=0.1,
    T_B=1,
    K=100,
    E_MIN=-10,
    E_MAX=10,
    C_SWITCH=false,
    r_cr_fd=10,
    T_E=0.01)
    annotation (Placement(transformation(extent={{-60,-60},{-80,-40}})));
equation
  connect(gENROU.PMECH, gENROU.PMECH0) annotation (Line(points={{-92,10},{-100,10},{-100,32},{-40,32},{-40,10},{-46,10}},
                                                     color={0,0,127}));
  connect(sCRX9.EFD, gENROU.EFD) annotation (Line(points={{-81,-50},{-100,-50},{-100,-10},{-92,-10}},
                                            color={0,0,127}));
  connect(gENROU.ETERM, sCRX9.ECOMP) annotation (Line(points={{-46,-6},{-34,-6},{-34,-50},{-59,-50}},
                                         color={0,0,127}));
  connect(sCRX9.XADIFD, gENROU.XADIFD) annotation (Line(points={{-78,-61},{-78,-68},{-42,-68},{-42,-18},{-46,-18}},
                                                color={0,0,127}));
  connect(sCRX9.EFD0, gENROU.EFD0) annotation (Line(points={{-59,-54},{-38,-54},{-38,-10},{-46,-10}},
                                          color={0,0,127}));
  connect(gENROU.p, GEN1.p)
    annotation (Line(points={{-48,0},{-30,0}}, color={0,0,255}));
  connect(sCRX9.VOTHSG, zero.y) annotation (Line(points={{-59,-46},{-54,-46},{-54,-80},{-40.6,-80}}, color={0,0,127}));
  connect(sCRX9.VUEL, zero.y) annotation (Line(points={{-66,-61},{-66,-80},{-40.6,-80}}, color={0,0,127}));
  connect(sCRX9.VOEL, zero.y) annotation (Line(points={{-70,-61},{-70,-80},{-40.6,-80}}, color={0,0,127}));
  annotation (
    experiment(
      StopTime=10,
      Interval=0.005,
      Tolerance=1e-06),
    Documentation(info="<html>
<p>
The SMIB system of the PSS/E exciter tests (<a href=\"modelica://OpenIPSL.Tests.BaseClasses.SMIB\">Tests.BaseClasses.SMIB</a>,
fault at bus <code>FAULT</code> from 2.0025 s to 2.1525 s) with the GENROU machine and exciter data of
<a href=\"modelica://OpenIPSL.Tests.Controls.PSSE.ES.SCRX\">Tests.Controls.PSSE.ES.SCRX</a>, where the native exciter is
replaced by <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.SCRX9.SCRX9\">IEEE_CIGRE.SCRX9.SCRX9</a>, the
same exciter computed by the compiled SCRX9 example model of the IEEE/CIGRE DLL standard. <code>VOTHSG</code>,
<code>VUEL</code> and <code>VOEL</code> are zero.
</p>
<p>
Two exciter parameters differ from the native test. <code>T_E</code> is 0.01 s instead of 0.005 s: the DLL's
<code>Model_CheckParameters</code> raises any <code>T_E</code> below twice its 5 ms sample time to 0.01 s, so 0.01 s
is the smallest value the DLL accepts as given. <code>r_cr_fd</code> is 10 instead of 0: the DLL declares the range
[0.001, 100] for this ratio and warns about 0; the field current stays positive in this test (its minimum is about
1.19 pu), so the crowbar never acts and the value does not change the result.
</p>
<p>
The fault times are those of the base class and the paper (2 s to 2.15 s) shifted by half a DLL sample, 2.5 ms, so
that neither edge of the fault falls on a 5 ms sample instant of the DLL. On a sample instant the fault and the DLL
step are simultaneous events, and the tools order them differently: the verification of 2026-10-25 measured that
Dymola and System Modeler step the DLL after the fault (it sees the faulted voltage at 2 s), while OpenModelica steps
it just before (it sees the faulted voltage 5 ms later), which moved the field voltage by up to 3.3 pu for one sample
between the tools. Half a sample off the grid the order is unique, and Dymola and OpenModelica agreed to 1e-4 pu in
the field voltage. The native test
<a href=\"modelica://OpenIPSL.Tests.Controls.PSSE.ES.SCRX\">Tests.Controls.PSSE.ES.SCRX</a> keeps the round times; it
has no sampled controller.
</p>
<p>
Plot <code>sCRX9.EFD</code>, <code>GEN1.v</code> and <code>gENROU.w</code>. The system starts in steady state
(<code>sCRX9.EFD</code> stays within 1e-4 pu of <code>gENROU.EFD0</code> until the fault; the native test drifts the
same, from the SMIB power-flow data). The default solver (DASSL) stops at every
5 ms sample of the DLL; explicit Euler with a fixed step of 0.005 s steps the DLL at the same instants at less cost,
with a less accurate network solution between samples. The
test is the system of Figs. 8 and 9 of H. Chang and L. Vanfretti, American Modelica Conference 2024,
<a href=\"https://doi.org/10.3384/ecp20772\">DOI: 10.3384/ecp20772</a>; the paper's DLL used the parameters of its
Table 1 hard-coded in C, while this test passes the parameters of the native test through the wrapper. The run
settings for each tool are in the <a href=\"modelica://OpenIPSL.Tests.Controls.IEEE_CIGRE.README\">README</a>.
</p>
</html>"));
end SCRX9;
