within OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components;
model EMTPTransformer "Three-phase wye-grounded/delta transformer built from three single-phase units, delta grounded through resistors"
  parameter Modelica.Units.SI.ApparentPower Sbase=1e8 "Rating of the three-phase transformer";
  parameter Modelica.Units.SI.Frequency f=60 "Nominal frequency";
  parameter Modelica.Units.SI.Frequency f_cut=1000 "Cut-off frequency of the filters in the single-phase units";
  parameter Modelica.Units.SI.Voltage Winding1Voltage=230e3 "Rated line-to-line voltage of winding 1 (wye, pins Ay, By, Cy)";
  parameter Modelica.Units.SI.Voltage Winding2Voltage=6.5e3 "Rated line-to-line voltage of winding 2 (delta, pins Ad, Bd, Cd)";
  parameter OpenIPSL.Types.PerUnit WindingR_pu=0.00375 "Winding resistance (pu on Sbase)";
  parameter OpenIPSL.Types.PerUnit WindingX_pu=0.15 "Winding reactance (pu on Sbase)";
  parameter Real D=0.9 "Share of the winding impedance placed on winding 1 (the rest is not modelled)";
  final parameter Modelica.Units.SI.Impedance Zbase1=Winding1Voltage^2/Sbase "Base impedance of winding 1";
  final parameter Real Ratio=sqrt(3)*Winding2Voltage/Winding1Voltage "Voltage ratio of each single-phase unit, winding 2 line-to-line over winding 1 phase-to-ground";
  final parameter Modelica.Units.SI.Resistance Rp=D*WindingR_pu*Zbase1 "Series resistance on winding 1";
  final parameter Modelica.Units.SI.Inductance Lp=D*WindingX_pu*Zbase1/(2*Modelica.Constants.pi*f) "Series inductance on winding 1";
  Modelica.Electrical.Analog.Interfaces.Pin Cy "Phase C of winding 1 (wye, grounded neutral)"
    annotation (Placement(transformation(extent={{-108,50},{-88,70}})));
  Modelica.Electrical.Analog.Interfaces.Pin By "Phase B of winding 1 (wye, grounded neutral)"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.Analog.Interfaces.Pin Ay "Phase A of winding 1 (wye, grounded neutral)"
    annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Modelica.Electrical.Analog.Interfaces.Pin Cd "Phase C of winding 2 (delta)"
    annotation (Placement(transformation(extent={{90,50},{110,70}})));
  Modelica.Electrical.Analog.Interfaces.Pin Bd "Phase B of winding 2 (delta)"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Electrical.Analog.Interfaces.Pin Ad "Phase A of winding 2 (delta)"
    annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
  TransformerSubcircuitZeroZsec phaseC(
    n=Ratio,
    Lp=Lp,
    Rp=Rp,
    f_cut=f_cut) "Single-phase unit of phase C (pins Cy and Cd)"
           annotation (Placement(transformation(extent={{-10,40},{10,60}})));
  TransformerSubcircuitZeroZsec phaseB(
    n=Ratio,
    Lp=Lp,
    Rp=Rp,
    f_cut=f_cut) "Single-phase unit of phase B (pins By and Bd)"
           annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
  TransformerSubcircuitZeroZsec phaseA(
    n=Ratio,
    Lp=Lp,
    Rp=Rp,
    f_cut=f_cut) "Single-phase unit of phase A (pins Ay and Ad)"
           annotation (Placement(transformation(extent={{-10,-80},{10,-60}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-46,-100},{-26,-80}})));
  parameter SI.Resistance GroundingResistance=1e9
    "Resistance from each delta terminal to ground";
  Modelica.Electrical.Analog.Sensors.VoltageSensor VPrimABLL "Line-to-line voltage A-B of winding 1" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-30})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor VSecABLL "Line-to-line voltage A-B of winding 2" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={52,-34})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=Rtf_delta)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,22})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R=Rtf_delta)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={20,-38})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R=Rtf_delta)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={68,20})));
  parameter SI.Resistance Rtf_delta=0.5 "Resistance in series with each delta branch";
  Modelica.Electrical.Analog.Basic.Ground ground1
    annotation (Placement(transformation(extent={{94,16},{106,28}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor3(R=
        GroundingResistance) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={100,42})));
  Modelica.Electrical.Analog.Basic.Ground ground2
    annotation (Placement(transformation(extent={{94,-44},{106,-32}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor4(R=
        GroundingResistance) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={100,-18})));
  Modelica.Electrical.Analog.Basic.Ground ground3
    annotation (Placement(transformation(extent={{94,-102},{106,-90}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor5(R=
        GroundingResistance) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={100,-76})));
equation
  connect(Cy, phaseC.pin_p)
    annotation (Line(points={{-98,60},{-10,60}}, color={0,0,255}));
  connect(By, phaseB.pin_p)
    annotation (Line(points={{-100,0},{-10,0}}, color={0,0,255}));
  connect(Ay, phaseA.pin_p)
    annotation (Line(points={{-100,-60},{-10,-60}}, color={0,0,255}));
  connect(phaseB.pin_n, phaseA.pin_n)
    annotation (Line(points={{-10,-20},{-36,-20},{-36,-80},{-10,-80}},
        color={0,0,255}));
  connect(phaseC.pin_n, phaseB.pin_n)
    annotation (Line(points={{-10,40},{-36,40},{-36,-20},{-10,-20}},
        color={0,0,255}));
  connect(phaseB.pin_n, ground.p) annotation (Line(points=
          {{-10,-20},{-36,-20},{-36,-80}}, color={0,0,255}));
  connect(phaseC.pin_p1, Cd)
    annotation (Line(points={{10,60},{100,60}}, color={0,0,255}));
  connect(phaseB.pin_p1, Bd)
    annotation (Line(points={{10,0},{100,0}}, color={0,0,255}));
  connect(phaseA.pin_p1, Ad)
    annotation (Line(points={{10,-60},{100,-60}}, color={0,0,255}));
  connect(VPrimABLL.p, phaseA.pin_p) annotation (Line(
        points={{-70,-40},{-70,-60},{-10,-60}}, color={0,0,255}));
  connect(VPrimABLL.n, phaseB.pin_p) annotation (Line(
        points={{-70,-20},{-70,0},{-10,0}}, color={0,0,255}));
  connect(VSecABLL.p, Ad)
    annotation (Line(points={{52,-44},{52,-60},{100,-60}}, color={0,0,255}));
  connect(VSecABLL.n, Bd)
    annotation (Line(points={{52,-24},{52,0},{100,0}}, color={0,0,255}));
  connect(resistor.p, phaseC.pin_n1)
    annotation (Line(points={{20,32},{20,40},{10,40}}, color={0,0,255}));
  connect(resistor.n, Bd)
    annotation (Line(points={{20,12},{20,0},{100,0}}, color={0,0,255}));
  connect(resistor1.p, phaseB.pin_n1) annotation (Line(
        points={{20,-28},{20,-20},{10,-20}}, color={0,0,255}));
  connect(resistor1.n, Ad) annotation (Line(points={{20,-48},{20,-60},{
          100,-60}}, color={0,0,255}));
  connect(resistor2.p, Cd) annotation (Line(points={{68,30},{68,60},{100,
          60}}, color={0,0,255}));
  connect(resistor2.n, phaseA.pin_n1) annotation (Line(
        points={{68,10},{68,-80},{10,-80}}, color={0,0,255}));
  connect(ground1.p, resistor3.n)
    annotation (Line(points={{100,28},{100,36}}, color={0,0,255}));
  connect(resistor3.p, Cd)
    annotation (Line(points={{100,48},{100,60}}, color={0,0,255}));
  connect(ground2.p, resistor4.n)
    annotation (Line(points={{100,-32},{100,-24}}, color={0,0,255}));
  connect(resistor4.p, Bd)
    annotation (Line(points={{100,-12},{100,0}}, color={0,0,255}));
  connect(ground3.p, resistor5.n)
    annotation (Line(points={{100,-90},{100,-82}}, color={0,0,255}));
  connect(resistor5.p, Ad)
    annotation (Line(points={{100,-70},{100,-60}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>
Three-phase two-winding transformer for the EMT tests: winding 1 (pins <code>Ay</code>, <code>By</code>,
<code>Cy</code>) is a wye with solidly grounded neutral, winding 2 (pins <code>Ad</code>, <code>Bd</code>,
<code>Cd</code>) a delta closed through a resistance <code>Rtf_delta</code> in each branch, with every delta terminal
grounded through the high resistance <code>GroundingResistance</code>, which only fixes the potential of the delta.
Each phase is a
<a href=\"modelica://OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Components.TransformerSubcircuitZeroZsec\">TransformerSubcircuitZeroZsec</a>
with ratio <code>sqrt(3)*Winding2Voltage/Winding1Voltage</code> and the series impedance
<code>D*(WindingR_pu + j*WindingX_pu)</code> on the winding 1 base; the share <code>1 - D</code> of the leakage impedance
that belongs to winding 2 is not modelled.
</p>
<p>
Ported from <code>GridComponents.EMTPtransformer</code> of <a href=\"https://github.com/OpenIPSL/OpenIPSL/pull/362\">OpenIPSL pull request #362</a>: renamed, the parameters of the winding 2
impedance (<code>Zbase2</code>, <code>Rs</code>, <code>Ls</code>), which the single-phase unit never used, removed,
derived parameters made <code>final</code>, the self-connection <code>connect(Bd, Bd)</code> removed and the copied
descriptions corrected. The single-phase units, instances <code>tFsubcircuitZeroZsec2</code>,
<code>tFsubcircuitZeroZsec1</code> and <code>tFsubcircuitZeroZsec</code> in the pull request, are now
<code>phaseA</code>, <code>phaseB</code> and <code>phaseC</code>.
</p>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Ellipse(
          extent={{-80,46},{10,-44}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Ellipse(
          extent={{-10,46},{80,-44}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{-40,12}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{34,-12},{54,0}},
          color={238,46,47},
          thickness=0.5),
        Line(
          points={{34,-12},{34,12}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{34,12},{54,0}},
          color={0,140,72},
          thickness=0.5),
        Line(
          points={{-40,0},{-40,24}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-40,0},{-20,-12}},
          color={0,140,72},
          thickness=0.5),
        Line(
          points={{-60,-12},{-40,0}},
          color={238,46,47},
          thickness=0.5),
        Line(
          points={{-40,0},{-28,0}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-28,0},{-28,-18}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-38,-18},{-20,-18},{-22,-18}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-34,-22},{-22,-22}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{-32,-26},{-24,-26}},
          color={0,0,0},
          thickness=0.5),
        Text(
          extent={{-50,44},{-24,20}},
          textColor={0,0,0},
          textString="1"),
        Text(
          extent={{22,44},{48,20}},
          textColor={0,0,0},
          textString="2"),
        Line(
          points={{-98,60}},
          color={28,108,200},
          thickness=0.5),
        Line(points={{-98,62}}, color={0,140,72}),
        Line(
          points={{-96,60},{-80,60},{-60,38}},
          color={0,140,72},
          thickness=0.5),
        Line(
          points={{98,60},{80,60},{60,38}},
          color={0,140,72},
          thickness=0.5),
        Line(
          points={{-88,0}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-90,0},{-80,0}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{88,0},{80,0}},
          color={28,108,200},
          thickness=0.5),
        Line(
          points={{-90,-60},{-80,-60},{-58,-38}},
          color={238,46,47},
          thickness=0.5),
        Line(
          points={{88,-60},{80,-60},{58,-38}},
          color={238,46,47},
          thickness=0.5)}), Diagram(coordinateSystem(preserveAspectRatio=false)));
end EMTPTransformer;
