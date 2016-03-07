within iPSL.Examples.Controls.PSSE.PSS;
model STABNI "Simple Machine Infinite Bus with Machine, Governor and Excitation system"
  extends iPSL.Examples.SMIBpartial;
  iPSL.Electrical.Machines.PSSE.GENSAL.GENSAL generator(
    Xppd=0.2,
    Xppq=0.2,
    Xl=0.12,
    V_0=1,
    angle_0=4.05,
    P_0=39.99995,
    Q_0=5.416571,
    M_b=100,
    Tpd0=6.7000,
    Tppd0=0.28000E-01,
    Tppq0=0.35000E-01,
    H=4.4100,
    D=0,
    Xd=1.2200,
    Xq=0.76000,
    Xpd=0.29700,
    S10=0.18600,
    S12=0.802) annotation (Placement(transformation(extent={{-98,-14},{-70,12}})));
  iPSL.Electrical.Controls.PSSE.TG.HYGOV HYGOV(VELM=0.02, G_MAX=0.415) annotation (Placement(transformation(
        extent={{-19,-14},{19,14}},
        rotation=180,
        origin={-75,28})));
  iPSL.Electrical.Controls.PSSE.ES.SCRX.SCRX SCRX(
    V_0=1,
    V_c0=1,
    T_AT_B=0.01,
    T_B=10,
    K=100,
    T_E=0.05,
    E_MIN=0,
    E_MAX=5,
    r_cr_fd=0,
    C_SWITCH=false) annotation (Placement(transformation(
        extent={{-18,-16},{18,16}},
        rotation=180,
        origin={-86,-38})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(
        extent={{-2,-2},{2,2}},
        rotation=180,
        origin={-60,-36})));
equation
  connect(SCRX.VUEL, const.y) annotation (Line(
      points={{-68.15,-33.04},{-63.67,-33.04},{-63.67,-36},{-62.2,-36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(SCRX.VOEL, const.y) annotation (Line(
      points={{-68.15,-37.2},{-63.67,-37.2},{-63.67,-36},{-62.2,-36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.EFD0, SCRX.EFD0) annotation (Line(
      points={{-68.88,-10.1},{-66,-10.1},{-66,-18.64},{-68.15,-18.64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(generator.PMECH0, HYGOV.PMECH0) annotation (Line(points={{-68.88,-4.9},{-58,-4.9},{-58,8},{-48,8},{-48,35},{-56.475,35}}, color={0,0,127}));
  connect(generator.SPEED, HYGOV.SPEED) annotation (Line(points={{-68.88,10.7},{-56,10.7},{-52,10.7},{-52,22},{-52,21},{-56.475,21}}, color={0,0,127}));
  connect(generator.XADIFD, SCRX.XADIFD) annotation (Line(points={{-68.88,-12.7},{-62,-12.7},{-62,-29.52},{-67.85,-29.52}}, color={0,0,127}));
  connect(SCRX.ECOMP, SCRX.ETERM) annotation (Line(points={{-68.15,-45.52},{-52,-45.52},{-52,-24.24},{-67.85,-24.24}}, color={0,0,127}));
  connect(generator.ETERM, SCRX.ETERM) annotation (Line(points={{-68.88,5.5},{-52,5.5},{-52,-24.24},{-67.85,-24.24}}, color={0,0,127}));
  connect(SCRX.VOTHSG, const.y) annotation (Line(points={{-68.15,-41.04},{-64,-41.04},{-64,-38},{-63.67,-37.2},{-63.67,-36},{-62.2,-36}}, color={0,0,127}));
  connect(generator.PMECH, HYGOV.PMECH0) annotation (Line(points={{-97.72,5.5},{-110,5.5},{-110,14},{-48,14},{-48,35},{-56.475,35}}, color={0,0,127}));
  connect(SCRX.EFD, generator.EFD) annotation (Line(points={{-104.6,-31.76},{-110,-31.76},{-110,-7.5},{-97.72,-7.5}}, color={0,0,127}));
  connect(generator.p, GEN1.p) annotation (Line(points={{-68.6,-1},{-53.3,-1},{-53.3,0},{-40,0}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-120},{100,80}})),
    Icon(coordinateSystem(extent={{-100,-120},{100,80}})),
    Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
end STABNI;
