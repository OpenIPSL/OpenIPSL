within OpenIPSL.UsersGuide.ReleaseNotes;
class v310 "Version 3.1.0 (2026-02-24)"
  extends Modelica.Icons.ReleaseNotes;
  annotation (Documentation(info="<html>
<h4>What&apos;s Changed</h4>
<p>
This release version 3.1.0 of <code><strong>OpenIPSL</strong></code> is led by an
<strong>Industrial-Grade Model Expansion</strong>. The release significantly expands the availability of <strong>new models</strong> and examples,
with broad additions across synchronous machine dynamics, governors, excitation and stabilizer
systems, and WECC-type renewable energy source models (Wind, PV and BESS), while also improving compatibility and quality checks.
</p>

<h5>Highlights</h5>
<p>
<strong>Primary highlight:</strong> <strong>Industrial-Grade Model Expansion</strong>:
</p>
<ul>
<li><strong>Industrial-Grade Model Expansion</strong>: substantial additions and hardening of production-ready dynamic models and associated examples.</li>
<li><strong>Comprehensive model catalog growth</strong>: expanded synchronous machine, governor, excitation systems, and <strong>WECC renewable models</strong> for large-scale stability studies.</li>
<li><strong>WECC renewables energy source models (RES)</strong>: WECC generic renewable models, including REGC, REEC, and REPC components for Wind/PV/BESS integration studies. Pre-defined templates with hierarchical modeling for BESS, PV and Wind.</li>
<li><strong>Expanded Microgrid and Voltage Source Models</strong>: new and updated IEEE/University Campus microgrid examples and voltage-behind-impedance source variants.</li>
<li><strong>Generic Variable Speed Drive Model</strong>: new model for variable speed drive systems with their power electronics and controller modules.</li>
<li><strong>Model quality and robustness improvements</strong>: targeted updates to key dynamic models and release checks.</li>
<li><strong>New Addition to Tutorial Examples</strong>: new example showing the integration of power flow records from GridCal/VeraGrid.</li>
</ul>

<h5>New component additions:</h5>
<p>
Key additions highlighted for this release include:
</p>
<ul>
<li><strong>New machine models:</strong> CIM5, CIM6, GENTPJ.</li>
<li><strong>Renewable Energy (WECC generic models):</strong> Renewable Energy Generator/Converter (REGC) models REGC_A; Renewable Energy Electric Controller (REEC) models REEC_A, REEC_B, and REEC_C; Renewable Energy Plant Controller (REPC) models REPC_A.</li>
<li><strong>Governing systems (thermal, gas, and hydro):</strong> DEGOV, IEEEG2, WEHGOV, WPIDHY, and WSIEG1.</li>
<li><strong>Excitation systems and compensators:</strong> AC7B, AC8B, DC4B, ESDC1A, ESDC2A, ESURRY, EXBAS, EXNI, SCRX, and IEEEVC.</li>
</ul>

<h5>Changes in detail</h5>
<ul>
<li>Merge pull request <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/347\">#347</a>: broad model updates and additions that form the core of this industrial-grade model expansion.</li>
<li>Merge pull request <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/341\">#341</a>: University Campus Microgrid model and example additions.</li>
<li>Merge pull request <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/345\">#345</a>: IEEE Microgrid updates and new related components.</li>
<li>Merge pull request <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/327\">#327</a>: WECC Renewables package expansion and model updates.</li>
<li>Merge pull request <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/267\">#267</a>: PVD1 model additions and related cleanup.</li>
<li>Merge pull request <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/349\">#349</a>: Voltage-behind-impedance models for GFC workflows.</li>
<li>Update Reals IEE2ST, REECA1, REECB1, REECCU1, and REPCA1 in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/366\">#366</a>.</li>
<li>Added experiment annotations and modified ULTC example in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/376\">#376</a>.</li>
</ul>

<h5>Full Changelog</h5>
<p><code><a href=\"https://github.com/OpenIPSL/OpenIPSL/compare/v3.0.1...v3.1.0\">v3.0.1...v3.1.0</a></code></p>
</html>"));
end v310;