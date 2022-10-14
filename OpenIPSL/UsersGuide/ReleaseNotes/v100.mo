within OpenIPSL.UsersGuide.ReleaseNotes;
class v100 "Version 1.0.0 (2016-12-16)"
  extends Modelica.Icons.ReleaseNotes;
  annotation (Documentation(info="<html>
<p>First Release of OpenIPSL</p>
<h4>What&apos;s Changed</h4>
<ul>
<li>Fixing the initialisation issue in OpenModelica for all of the generators by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/3\">#3</a></li>
<li>Updating package and example icons. by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/4\">#4</a></li>
<li>Changing the package structure. close <a href=\"https://github.com/OpenIPSL/OpenIPSL/issues/5\">#5</a> by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/6\">#6</a></li>
<li>Removing import statements by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/9\">#9</a></li>
<li>Removing DTU and Eurostag models. by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/10\">#10</a></li>
<li>Namsskogan application example by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/11\">#11</a></li>
<li>Fixing examples by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/15\">#15</a></li>
<li>Removing the duplicate files of generators. by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/20\">#20</a></li>
<li>Fixing bugs in some of the exciters and making them more consistent. by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/19\">#19</a></li>
<li>Continuous Integration by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/25\">#25</a></li>
<li>Deleting the old tranformer for the sake of passing checks. by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/28\">#28</a></li>
<li>Deleting PwLineFault since it is not used at all. by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/29\">#29</a></li>
<li>Updating the SevenBus example by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/32\">#32</a></li>
<li>Updating BusExt by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/33\">#33</a></li>
<li>N44 update by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/34\">#34</a></li>
<li>Add PwVoltage model back to the library by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/38\">#38</a></li>
<li>Fix of WT3E1 and WT4E1 and removal of package WT1 by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/35\">#35</a></li>
<li>Update RampTrackingFilter by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/36\">#36</a></li>
<li>Updating IEEEST by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/40\">#40</a></li>
<li>Deleting current limiter from KTH Solar package by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/42\">#42</a></li>
<li>Updating exciter Base Classes by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/41\">#41</a></li>
<li>Implementing invFEX as a function in base classes of exciters by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/44\">#44</a></li>
<li>Removing unused parameter Ec0 from SEXS exciter by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/46\">#46</a></li>
<li>Updating PSAT AVR Type III to remove initialization parameters by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/49\">#49</a></li>
<li>Release support by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/48\">#48</a></li>
<li>Fixed the parameter name for Xpq. by <a href=\"https://github.com/Krokkodilli\">@Krokkodilli</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/52\">#52</a></li>
<li>Adding PSAT systems created by Yuwa by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/50\">#50</a></li>
<li>Tuto update by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/54\">#54</a></li>
<li>Update PwLine for JModelica compatibility by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/56\">#56</a></li>
<li>Updating links and text by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/59\">#59</a></li>
<li>Excitation model from CGMES specification, ExcSEXS by <a href=\"https://github.com/fran-jo\">@fran-jo</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/62\">#62</a></li>
<li>Removing leftover files from FACTS in a wrong location by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/63\">#63</a></li>
<li>Update README.md by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/65\">#65</a></li>
<li>Fixing the rotation of the package logo by <a href=\"https://github.com/dietmarw\">@dietmarw</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/66\">#66</a></li>
<li>Fix package.order for CGMES by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/69\">#69</a></li>
<li>Fixed EXAC2 block input for field current by <a href=\"https://github.com/Krokkodilli\">@Krokkodilli</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/57\">#57</a></li>
<li>Extended ci by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/71\">#71</a></li>
<li>Changing some wiki links by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/72\">#72</a></li>
<li>Fix PwFault for Jmodelica by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/73\">#73</a></li>
<li>(doc ) Introducing new documentation by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/74\">#74</a></li>
<li>Doc update by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/75\">#75</a></li>
<li>Documentation links by <a href=\"https://github.com/lvanfretti\">@lvanfretti</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/77\">#77</a></li>
<li>Restructuring Nordic 44 package by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/78\">#78</a></li>
<li>Release support by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/79\">#79</a></li>
<li>Update Tutorial by <a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/80\">#80</a></li>
<li>GENCLS model updates by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/84\">#84</a></li>
<li>Correting active and reactive power equations in PSAT IB model by <a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a> in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/85\">#85</a></li>
</ul>
<h5>New Contributors</h5>
<ul>
<li><a href=\"https://github.com/Krokkodilli\">@Krokkodilli</a> made their first contribution in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/52\">#52</a></li>
<li><a href=\"https://github.com/fran-jo\">@fran-jo</a> made their first contribution in <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/62\">#62</a></li>
</ul>
<h4>Full Changelog</h4>
<p><a href=\"https://github.com/OpenIPSL/OpenIPSL/compare/v0...v1.0.0\">v0...v1.0.0</a></p>
</html>"));
end v100;
