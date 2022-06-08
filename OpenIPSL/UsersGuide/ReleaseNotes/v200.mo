within OpenIPSL.UsersGuide.ReleaseNotes;
class v200 "Version 2.0.0 (2022-06-08)"
  extends Modelica.Icons.ReleaseNotes;
  annotation (Documentation(info="<html>
<h4>What&apos;s Changed</h4>
<p>
This new release version 2.0.0 of <code><strong>OpenIPSL</strong></code> is a 
<strong>non-backwards compatible</strong> release based on the 
<a href=\"https://github.com/modelica/ModelicaStandardLibrary/releases/tag/v3.2.3%2Bbuild.4\">
Modelica Standard Library version 3.2.3</a>.
</p>
<p>
A conversion script is provided for user libraries using <code><strong>OpenIPSL</strong></code> version 
1.5.0 and older. <em>(Note: Models that extended from any of the old <code>Examples</code> models 
will have to be converted manually by the user.)</em>
</p>
<h5>Highlights</h5>
<ul>
<li>Changed the license to the <a href=\"https://opensource.org/licenses/BSD-3-Clause\">
3-Clause BSD License</a>.</li>
<li>Use of SI or per-unit units <strong>only</strong> in quantities 
(i.e., no more customs scaled kilo or Mega units).</li>
<li>The old <code>Examples</code> models have been moved under 
<a href=\"modelica://OpenIPSL.Tests\"><code>Tests</code></a>.</li>
<li>The old external <code>Application Examples</code> package has now been incorporated as 
<a href=\"modelica://OpenIPSL.Examples\"><code>Examples</code></a> and is part of this library.</li>
</ul>

<h5>Changes in detail</h5>
<p>
This release consists of 
<a href=\"https://github.com/OpenIPSL/OpenIPSL/issues?q=is%3Aissue+milestone%3A2.0.0+is%3Aclosed\">
39 closed issues</a> and 
<a href=\"https://github.com/OpenIPSL/OpenIPSL/pulls?q=is%3Apr+milestone%3A2.0.0+is%3Aclosed\">
61 merged pull requests</a>:
</p>
<ul>
<li>fix typo in DerivativeLag by <a href=\"https://github.com/pierre-haessig\">@pierre-haessig</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/156\">#156</a></li>
<li>Update to new version of journal paper by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/159\">#159</a></li>
<li>This fixes the description string of the sub-transient time constants by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/163\">#163</a></li>
<li>add ControlledBreaker model under Events sub-package by <a href=\"https://github.com/BiswarupM\">@BiswarupM</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/169\">#169</a></li>
<li>Update README.md by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/171\">#171</a></li>
<li>Fix error in Tutorial: by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/161\">#161</a></li>
<li>(doc) Small update in publication list by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/158\">#158</a></li>
<li>Updating the KundurSMIB package to make use of the Generator interface by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/175\">#175</a></li>
<li>Rebased PlantModel branch (replaces PR <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/157\">#157</a>) by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/177\">#177</a></li>
<li>Fixes <a href=\"https://github.com/OpenIPSL/OpenIPSL/issues/172\">#172</a> by removing duplicate implementations (with conversion) by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/178\">#178</a></li>
<li>Clean implementation of the two and three winding transformer by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/180\">#180</a></li>
<li>N44 update by <a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/181\">#181</a></li>
<li>Fix defaultComponentPrefixes annotation by <a href=\"https://github.com/tbeu\">@tbeu</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/184\">#184</a></li>
<li>This fixes <a href=\"https://github.com/OpenIPSL/OpenIPSL/issues/112\">#112</a> and beyond by now introducing proper SI unit types by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/183\">#183</a></li>
<li>Fixes <a href=\"https://github.com/OpenIPSL/OpenIPSL/issues/174\">#174</a> by providing a non-zero start value for ii and ir by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/190\">#190</a></li>
<li>Fixes <a href=\"https://github.com/OpenIPSL/OpenIPSL/issues/93\">#93</a> by removing superfluous shunt models by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/191\">#191</a></li>
<li>Adding discrete ULTC (closes <a href=\"https://github.com/OpenIPSL/OpenIPSL/issues/189\">#189</a>) by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/192\">#192</a></li>
<li>Machine base power rating change by <a href=\"https://github.com/ManuelNvro\">@ManuelNvro</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/196\">#196</a></li>
<li>Removing the infinite bus from the example by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/203\">#203</a></li>
<li>Remove hard coded and doubly defined start values for w and delta by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/204\">#204</a></li>
<li>Add new ThreePhase package by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/198\">#198</a></li>
<li>Fix exciters by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/209\">#209</a></li>
<li>Fixing the machine models by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/211\">#211</a></li>
<li>Fixing governor models by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/215\">#215</a></li>
<li>Fix wind models by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/216\">#216</a></li>
<li>Fixing PSS models by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/214\">#214</a></li>
<li>Fix Banks models by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/213\">#213</a></li>
<li>Fix exciter models by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/212\">#212</a></li>
<li>Sorting the examples and excitation models alphabetical by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/222\">#222</a></li>
<li>Remove SMIBpartial2 and instead update SMIBpartial by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/225\">#225</a></li>
<li>Mark verified models via a distinctive icon by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/228\">#228</a></li>
<li>Correct calculation of I_T in ESSTB4 by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/230\">#230</a></li>
<li>Adds documentation of verification by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/218\">#218</a></li>
<li>Fix Terminator dimension warning by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/231\">#231</a></li>
<li>Include PSAT PSS and load models from FOSSEE1 branch by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/232\">#232</a></li>
<li>Explains the PSAT AVR models mix up by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/233\">#233</a></li>
<li>Fix the CI setup by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/224\">#224</a></li>
<li>Fix HTML syntax errors and also add package icons. by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/235\">#235</a></li>
<li>Better implementation of PSTransformer by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/236\">#236</a></li>
<li>Sort classes in alphabetical order when appropriate by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/237\">#237</a></li>
<li>Cleans up and proper place for base classes by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/239\">#239</a></li>
<li>Fix gencls by <a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/240\">#240</a></li>
<li>Add an initial speed deviation and remove superfluous initial equationns by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/241\">#241</a></li>
<li>Cleans up the PSS and ES models by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/242\">#242</a></li>
<li>Clean up description strings wrt to units by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/243\">#243</a></li>
<li>Clean up/reimplement FACTS models by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/244\">#244</a></li>
<li>Add references to PSSE control models. by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/249\">#249</a></li>
<li>Rescue of CGMES models by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/238\">#238</a></li>
<li>Updated and fix the conversion script. by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/251\">#251</a></li>
<li>Introduce nominal values to help numerical solvers by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/252\">#252</a></li>
<li>Fix GGOV1 by <a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/254\">#254</a></li>
<li>Fixing the initialisation issues with GENCLS and other PSS gen models by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/258\">#258</a></li>
<li>Fix units by <a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/257\">#257</a></li>
<li>Update Documentation in User&apos;s Guide by <a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/259\">#259</a></li>
<li>Moving the CI files where they belong. by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/261\">#261</a></li>
<li>Corrected display units of reactive power by <a href=\"https://github.com/sergio-dorado\">@sergio-dorado</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/268\">#268</a></li>
<li>Improves the layout and documentation of the Plant model by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/271\">#271</a></li>
<li>Converts CI from Travis to GitHub actions by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/272\">#272</a></li>
<li>Improves documentation of GENCLS and unlocks parameters by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/273\">#273</a></li>
<li>Clean up of NonElectrical/Logical by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/275\">#275</a></li>
<li>Replaces custom LV and HV gate definitions with MSL blocks by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/274\">#274</a></li>
<li>Changed <span style=\"font-family: monospace;\">V</span> attribute to <span style=\"font-family: monospace;\">v</span> (lowercase) in class <span style=\"font-family: monospace;\">Bus</span> by <a href=\"https://github.com/sergio-dorado\">@sergio-dorado</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/279\">#279</a></li>
<li>Clean-up and reimplementation of PowerFactory solar models by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/266\">#266</a></li>
<li>Changing License by <a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/281\">#281</a></li>
<li>Update README.md by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/284\">#284</a></li>
<li>Update CITATION.cff by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/283\">#283</a></li>
<li>Moves and converts Application Examples and old Examples to Examples and Tests, respectively by <a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/286\">#286</a></li>
<li>Update the User&apos;s Guide by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/287\">#287</a></li>
<li>Add option to use PadeDelay instead of normal delay to be used for linearisation by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/288\">#288</a></li>
<li>Improved user interface for delay block in Turbine govenor by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/290\">#290</a></li>
<li>Increase tests&apos; and examples&apos; compatibility with OMEdit by <a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/291\">#291</a></li>
<li>Fixing soft PMU implementation by <a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/293\">#293</a></li>
<li>Adding description sentence to all models in the library by <a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/294\">#294</a></li>
<li>File clean up in preparation of 2.0.0 release by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/295\">#295</a></li>
</ul>
<h5>New Contributors</h5>
<ul>
<li><a href=\"https://github.com/pierre-haessig\">@pierre-haessig</a> made their first contribution in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/156\">#156</a></li>
<li><a href=\"https://github.com/BiswarupM\">@BiswarupM</a> made their first contribution in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/169\">#169</a></li>
<li><a href=\"https://github.com/ManuelNvro\">@ManuelNvro</a> made their first contribution in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/196\">#196</a></li>
<li><a href=\"https://github.com/sergio-dorado\">@sergio-dorado</a> made their first contribution in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/268\">#268</a></li>
</ul>
<h5>Full Changelog</h5>
<p><code><a href=\"https://github.com/OpenIPSL/OpenIPSL/compare/v1.5.0...v2.0.0\">v1.5.0...v2.0.0</a></code></p>
</html>"));
end v200;
