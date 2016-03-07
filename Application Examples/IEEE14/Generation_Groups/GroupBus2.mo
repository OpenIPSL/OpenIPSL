within IEEE14.Generation_Groups;
model GroupBus2
  extends iPSL.Electrical.Essentials.pfComponent;
  parameter Real vf0=2.718126892405429 "Initial field voltage";
  parameter Real vref0=1.181847826013889 "Reference voltage AVR";
  iPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR1TypeII1(
    Ta=0.02,
    Tf=1,
    Ke=1,
    Tr=0.001,
    Ka=20,
    Kf=0.001,
    Te=1.98,
    v0=V_0,
    vrmin=0,
    vrmax=4.38,
    vref0=vref0,
    vf0=vf0) annotation (Placement(transformation(extent={{-50,0},{0,38}})));
  Modelica.Blocks.Sources.Constant const1(k=1.181847826013889) annotation (Placement(transformation(extent={{-94,24},{-68,50}})));
  iPSL.Electrical.Machines.PSAT.SixthOrder.Order6 Syn3(
    Sn=60,
    Vn=69,
    V_b=V_b,
    fn=60,
    ra=0.0031,
    xq=0.98,
    xd1=0.1850,
    xq1=0.36,
    xd2=0.13,
    xq2=0.13,
    Td10=6.1,
    Tq10=0.3,
    Tq20=0.099,
    M=2*6.54,
    D=2,
    V_0=V_0,
    xd=1.05,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(extent={{20,-36},{86,34}})));
  iPSL.Connectors.PwPin pwPin annotation (Placement(transformation(extent={{122,-10},{142,10}}), iconTransformation(extent={{122,-10},{142,10}})));
equation
  connect(aVR1TypeII1.vf, Syn3.vf) annotation (Line(points={{-3.75,23.94},{-2.65,23.94},{-2.65,16.5},{20,16.5}}, color={0,0,127}));
  connect(Syn3.v, aVR1TypeII1.v) annotation (Line(points={{89.3,9.5},{116,9.5},{116,-88},{-82,-88},{-82,-84},{-82,14},{-82,17.1},{-45,17.1}}, color={0,0,127}));
  connect(const1.y, aVR1TypeII1.vref) annotation (Line(points={{-66.7,37},{-54,37},{-54,29.26},{-45,29.26}}, color={0,0,127}));
  connect(Syn3.p, pwPin) annotation (Line(points={{89.3,-0.82626},{110.65,-0.82626},{110.65,0},{132,0}}, color={0,0,255}));
  connect(Syn3.pm0, Syn3.pm) annotation (Line(points={{26.6,-39.5},{26.6,-50},{2,-50},{2,-18.5},{20,-18.5}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,100}})),
    Icon(coordinateSystem(extent={{-120,-100},{120,100}}, preserveAspectRatio=false), graphics={
        Ellipse(extent={{-72,78},{120,-74}}, lineColor={28,108,200}),
        Line(points={{0,26},{26,-6},{44,20}}, color={28,108,200}),
        Line(points={{-16,2},{0,26}}, color={28,108,200}),
        Text(
          extent={{-6,-22},{32,-54}},
          lineColor={28,108,200},
          textString="Gen2 6")}),
    Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSAT Manual 2.1.8</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>13/07/2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad,SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">&LT;iPSL: iTesla Power System Library&GT;</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copyright 2015 RTE (France), AIA (Spain), KTH (Sweden) and DTU (Denmark)</span></p>
<ul>
<li><span style=\"font-family: MS Shell Dlg 2;\">RTE: http://www.rte-france.com/ </span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">AIA: http://www.aia.es/en/energy/</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">KTH: https://www.kth.se/en</span></li>
<li><span style=\"font-family: MS Shell Dlg 2;\">DTU:http://www.dtu.dk/english</span></li>
</ul>
<p><span style=\"font-family: MS Shell Dlg 2;\">The authors can be contacted by email: info at itesla-ipsl dot org</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">This package is part of the iTesla Power System Library (&QUOT;iPSL&QUOT;) .</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The iPSL is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">You should have received a copy of the GNU Lesser General Public License along with the iPSL. If not, see &LT;http://www.gnu.org/licenses/&GT;.</span></p>
</html>"));
end GroupBus2;
