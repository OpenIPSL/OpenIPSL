within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Records;
record ParameterSet "The 41 parameters of the GFM-GFL-IBR-PWM DLL model in ParametersInfo order (defaults: the 6.5 kV, 10 MVA set of the Dymola studies)"
  extends Modelica.Icons.Record;
  parameter Modelica.Units.SI.Voltage Vbase(displayUnit="kV", min=1, max=1e6)=6500 "Vbase: RMS L-L base voltage (DLL unit kV)" annotation (Dialog(group="Bases"));
  parameter Modelica.Units.SI.ApparentPower Sbase(displayUnit="MV.A", min=1e3, max=1e10)=10e6 "Sbase: MVA base (DLL unit MVA)" annotation (Dialog(group="Bases"));
  parameter Modelica.Units.SI.Voltage Vdcbase(displayUnit="kV", min=1, max=1e6)=13000 "Vdcbase: dc base voltage (DLL unit kV)" annotation (Dialog(group="Bases"));
  parameter OpenIPSL.Types.PerUnit KpI(min=0.001, max=100)=0.5 "KpI: current control proportional gain (pu/pu)" annotation (Dialog(group="Current control"));
  parameter OpenIPSL.Types.PerUnit KiI(min=0, max=100)=1.0 "KiI: current control integral gain (pu/pu)" annotation (Dialog(group="Current control"));
  parameter Integer Wtype(min=0, max=1)=1 "Wtype: frequency generation control type, 0 PLL, 1 droop (2 VSM and 3 dVOC are listed by the DLL but not implemented)" annotation (Dialog(group="Frequency and voltage control"), choices(choice=0 "PLL", choice=1 "Droop"));
  parameter Real KpPLL(min=1, max=500)=20 "KpPLL: PLL proportional gain (DLL unit pu/rad/s)" annotation (Dialog(group="Frequency and voltage control"));
  parameter Real KiPLL(min=0.1, max=5000)=200 "KiPLL: PLL integral gain (DLL unit pu/rad/s)" annotation (Dialog(group="Frequency and voltage control"));
  parameter Modelica.Units.SI.Frequency del_f_limit(min=10, max=20)=12 "del_f_limit: delta frequency limit (Hz)" annotation (Dialog(group="Frequency and voltage control"));
  parameter OpenIPSL.Types.PerUnit KpP(min=0.001, max=100)=0.5 "KpP: active power control proportional gain (pu/pu)" annotation (Dialog(group="Power control"));
  parameter OpenIPSL.Types.PerUnit KiP(min=0, max=100)=10 "KiP: active power control integral gain (pu/pu)" annotation (Dialog(group="Power control"));
  parameter Integer Qflag(min=0, max=1)=0 "Qflag: Q control, 0 reactive power control, 1 voltage control" annotation (Dialog(group="Power control"), choices(choice=0 "Q control", choice=1 "V control"));
  parameter OpenIPSL.Types.PerUnit KpQ(min=0.001, max=100)=0.5 "KpQ: reactive power control proportional gain (pu/pu)" annotation (Dialog(group="Power control"));
  parameter OpenIPSL.Types.PerUnit KiQ(min=0, max=100)=20 "KiQ: reactive power control integral gain (pu/pu)" annotation (Dialog(group="Power control"));
  parameter OpenIPSL.Types.PerUnit KpV(min=0.001, max=100)=0.5 "KpV: voltage magnitude control (PLL based) proportional gain (pu/pu)" annotation (Dialog(group="Frequency and voltage control"));
  parameter OpenIPSL.Types.PerUnit KiV(min=0, max=1000)=150 "KiV: voltage magnitude control (PLL based) integral gain (pu/pu)" annotation (Dialog(group="Frequency and voltage control"));
  parameter OpenIPSL.Types.PerUnit KpVq(min=0, max=100)=0 "KpVq: q-axis voltage magnitude control (PLL based) proportional gain (pu/pu)" annotation (Dialog(group="Frequency and voltage control"));
  parameter OpenIPSL.Types.PerUnit KiVq(min=0, max=1000)=0 "KiVq: q-axis voltage magnitude control (PLL based) integral gain (pu/pu)" annotation (Dialog(group="Frequency and voltage control"));
  parameter OpenIPSL.Types.PerUnit Imax(min=1, max=1.7)=1.2 "Imax: maximum value of current magnitude (pu)" annotation (Dialog(group="Limits"));
  parameter OpenIPSL.Types.PerUnit Pmax(min=0, max=1)=1 "Pmax: maximum value of active power (pu)" annotation (Dialog(group="Limits"));
  parameter OpenIPSL.Types.PerUnit Pmin(min=-1, max=0)=0 "Pmin: minimum value of active power (pu)" annotation (Dialog(group="Limits"));
  parameter OpenIPSL.Types.PerUnit Qmax(min=0, max=1)=1 "Qmax: maximum value of reactive power (pu)" annotation (Dialog(group="Limits"));
  parameter OpenIPSL.Types.PerUnit Qmin(min=-1, max=0)=-1 "Qmin: minimum value of reactive power (pu)" annotation (Dialog(group="Limits"));
  parameter Integer PQflag(min=0, max=1)=0 "PQflag: current limit priority, 0 active power (P) priority, 1 reactive power (Q) priority" annotation (Dialog(group="Limits"), choices(choice=0 "P priority", choice=1 "Q priority"));
  parameter OpenIPSL.Types.PerUnit KfDroop(min=0, max=500)=33 "KfDroop: frequency droop gain (pu/pu)" annotation (Dialog(group="Droop"));
  parameter OpenIPSL.Types.PerUnit KvDroop(min=0, max=500)=5 "KvDroop: voltage droop gain (pu/pu)" annotation (Dialog(group="Droop"));
  parameter OpenIPSL.Types.PerUnit K_POD(min=0, max=50)=0 "K_POD: power oscillation damper gain (pu/pu)" annotation (Dialog(group="Power oscillation damper"));
  parameter Modelica.Units.SI.Time T_POD(min=0.001, max=1)=0.01 "T_POD: power oscillation damper time constant (s)" annotation (Dialog(group="Power oscillation damper"));
  parameter Modelica.Units.SI.Time T1_POD(min=0.001, max=1)=0.01 "T1_POD: power oscillation damper lead time constant (s)" annotation (Dialog(group="Power oscillation damper"));
  parameter Modelica.Units.SI.Time T2_POD(min=0.001, max=1)=0.001 "T2_POD: power oscillation damper lag time constant (s)" annotation (Dialog(group="Power oscillation damper"));
  parameter OpenIPSL.Types.PerUnit POD_min(min=-1, max=0)=-0.5 "POD_min: power oscillation damper minimum limit (pu)" annotation (Dialog(group="Power oscillation damper"));
  parameter OpenIPSL.Types.PerUnit POD_max(min=0, max=1)=0.5 "POD_max: power oscillation damper maximum limit (pu)" annotation (Dialog(group="Power oscillation damper"));
  parameter OpenIPSL.Types.PerUnit Vdip(min=0.7, max=0.9)=0.8 "Vdip: under-voltage threshold below which the controller states are frozen (pu)" annotation (Dialog(group="Limits"));
  parameter OpenIPSL.Types.PerUnit Vup(min=1.1, max=1.3)=1.2 "Vup: over-voltage threshold above which the controller states are frozen (pu)" annotation (Dialog(group="Limits"));
  parameter OpenIPSL.Types.PerUnit KpVdq(min=0, max=100)=3 "KpVdq: Vd and Vq controller (droop mode) proportional gain (pu)" annotation (Dialog(group="Droop"));
  parameter OpenIPSL.Types.PerUnit KiVdq(min=0, max=100)=10 "KiVdq: Vd and Vq controller (droop mode) integral gain (pu)" annotation (Dialog(group="Droop"));
  parameter Modelica.Units.SI.Time Tr(min=0, max=0.1)=0.001 "Tr: power measurement transducer time constant (s)" annotation (Dialog(group="Power control"));
  parameter OpenIPSL.Types.PerUnit Rchoke(min=0, max=1)=0.005 "Rchoke: filter resistance as the controller assumes it (pu)" annotation (Dialog(group="Filter seen by the controller"));
  parameter OpenIPSL.Types.PerUnit Lchoke(min=0.001, max=1)=0.08 "Lchoke: filter inductance as the controller assumes it (pu)" annotation (Dialog(group="Filter seen by the controller"));
  parameter OpenIPSL.Types.PerUnit Cfilt(min=0.001, max=1)=0.1 "Cfilt: filter capacitance as the controller assumes it (pu)" annotation (Dialog(group="Filter seen by the controller"));
  parameter OpenIPSL.Types.PerUnit Rdamp(min=0.001, max=10)=9.4868 "Rdamp: filter damper resistance as the controller assumes it (pu)" annotation (Dialog(group="Filter seen by the controller"));
  annotation (Documentation(info="<html>
<p>
One field per entry of the <code>ParametersInfo</code> table of the IEEE/CIGRE model <code>GFM-GFL-IBR-PWM-Model</code>
(EPRI, version 1.1.0.0), in the DLL's order and with the DLL's names; each description starts with the DLL's name and
gives the DLL's unit. The three bases are SI quantities here (V, V.A, V, shown in kV and MV.A); the converter model
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR\">GFM_GFL_IBR</a> divides them by 1e3 and
1e6 when it builds the parameter vector, so the DLL receives kV and MVA as its table requires. The flags
<code>Wtype</code>, <code>Qflag</code> and <code>PQflag</code> are integers here and reach the DLL as the doubles 0 or 1.
The <code>min</code> and <code>max</code> attributes are the DLL's <code>MinValue</code> and <code>MaxValue</code>, except
for <code>Wtype</code>: the DLL table allows 0 to 100, but the C code implements only 0 (PLL) and 1 (droop).
</p>
<p>
The defaults are the values that the Dymola studies of OpenIPSL pull request #362 (the 2024 American Modelica Conference
and 2026 CIGRE papers by Chang and Vanfretti) effectively used: the C glue of those studies overwrote the parameter block
with these constants on every call (lines 1132-1171 of the PR's <code>GFM_GFL_IBR.c</code>). They describe a 6.5 kV,
10 MVA, 13 kV dc converter in droop mode with Q control and P priority. The <code>DefaultValue</code> column of the DLL
differs in eleven entries:
</p>
<ul>
<li><code>Vbase</code> 0.65 kV, <code>Sbase</code> 1000 MVA, <code>Vdcbase</code> 1.3 kV;</li>
<li><code>Wtype</code> 0, <code>Qflag</code> 1, <code>PQflag</code> 1;</li>
<li><code>KfDroop</code> 30, <code>KvDroop</code> 22.22;</li>
<li><code>Rchoke</code> 0, <code>Lchoke</code> 0.15, <code>Cfilt</code> 0.01666.</li>
</ul>
<p>
Cite EPRI report [EPRI2023] and D. Ramasubramanian, EPSR 205 (2022) 107739 (EPRI's condition for the redistribution);
see <a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM\">the GFM package</a> and
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.Provenance\">IEEE_CIGRE.Provenance</a>.
</p>
</html>"));
end ParameterSet;
