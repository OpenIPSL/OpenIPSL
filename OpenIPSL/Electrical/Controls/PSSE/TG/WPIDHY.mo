within OpenIPSL.Electrical.Controls.PSSE.TG;
model WPIDHY
  extends OpenIPSL.Icons.VerifiedModel;
    parameter OpenIPSL.Types.Time T_REG=1;

  parameter OpenIPSL.Types.PerUnit REG=-0.05;
  parameter OpenIPSL.Types.PerUnit K_P=2;
                                //3;

  parameter OpenIPSL.Types.TimeAging K_I=0.5;
                                     //0.3;
  parameter OpenIPSL.Types.Time K_D=0;

  parameter OpenIPSL.Types.Time T_A=0.025;
                                 //0.01;
  parameter OpenIPSL.Types.Time T_W=2.3;
                               //1.47;
  parameter OpenIPSL.Types.Time T_B=0.1;
                               //0.25;
  parameter OpenIPSL.Types.PerUnit VELMX=0.1;
                                    //0.1320;
  parameter OpenIPSL.Types.PerUnit VELMN=-0.1320;
  parameter OpenIPSL.Types.PerUnit GATMX=1;
  parameter OpenIPSL.Types.PerUnit GATMN=0;
  parameter OpenIPSL.Types.PerUnit PMAX=1;
  parameter OpenIPSL.Types.PerUnit PMIN=0;
                                 //0.2580;
  parameter OpenIPSL.Types.PerUnit D=2;
                                //0;
  parameter OpenIPSL.Types.PerUnit G0=0.08;
                                  //0.0833;
  parameter OpenIPSL.Types.PerUnit G1=0.3;
                                 //0.5;
  parameter OpenIPSL.Types.PerUnit G2=0.75;
  parameter OpenIPSL.Types.PerUnit P1=0.25;
                                  //0.5910;
  parameter OpenIPSL.Types.PerUnit P2=0.75;
                                  //0.8170;
  parameter OpenIPSL.Types.PerUnit P3=1;
                               //0.9785;
  Modelica.Blocks.Interfaces.RealInput SPEED
    "Machine speed deviation from nominal (pu)"
    annotation (Placement(transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}), iconTransformation(extent = {{-100, 40}, {-60, 80}})));
  Modelica.Blocks.Interfaces.RealInput PELEC
    "Machine electrical power (pu)"
    annotation (Placement(transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}),  iconTransformation(extent = {{-100, -80}, {-60, -40}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH "Turbine mechanical power (pu)" annotation (
    Placement(transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
  Modelica.Blocks.Math.Add add1(k1=-1)
    annotation (Placement(transformation(extent={{-76,-64},{-56,-44}})));
  Modelica.Blocks.Sources.Constant const(k=PREF)
    annotation (Placement(transformation(extent={{-98,-52},{-90,-44}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag simpleLag(
    K=REG,
    T=T_REG,
    y_start=s01)
    annotation (Placement(transformation(extent={{-46,-64},{-26,-44}})));
  Modelica.Blocks.Math.Add3 add3_1
    annotation (Placement(transformation(extent={{-14,34},{4,52}})));
  Modelica.Blocks.Math.Gain gain(k=K_P)
    annotation (Placement(transformation(extent={{-44,66},{-30,80}})));
  Modelica.Blocks.Continuous.Integrator integrator(
    k=K_I,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=0)
    annotation (Placement(transformation(extent={{-48,38},{-28,58}})));
  Modelica.Blocks.Continuous.Derivative derivative(
    k=K_D,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    x_start=s01)
    annotation (Placement(transformation(extent={{-48,6},{-28,26}})));
  Modelica.Blocks.Math.Add add3(k1=-1)
    annotation (Placement(transformation(extent={{-80,-26},{-60,-6}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag simpleLag1(
    K=1,
    T=T_A,
    y_start=s02)
    annotation (Placement(transformation(extent={{12,36},{26,50}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag simpleLag2(
    K=1,
    T=T_A,
    y_start=s02)
    annotation (Placement(transformation(extent={{32,38},{42,48}})));
  OpenIPSL.NonElectrical.Continuous.DerivativeLag derivativeLag(
    K=1,
    T=T_B,
    y_start=0,
    x_start=s02)
    annotation (Placement(transformation(extent={{50,36},{64,50}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=VELMX, uMin=VELMN)
    annotation (Placement(transformation(extent={{70,38},{80,48}})));
  Modelica.Blocks.Continuous.Integrator integrator1(initType=Modelica.Blocks.Types.Init.InitialOutput,
      y_start=sG)
    annotation (Placement(transformation(extent={{-40,-20},{-30,-10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=GATMX, uMin=GATMN)
    annotation (Placement(transformation(extent={{-24,-20},{-14,-10}})));
  Modelica.Blocks.Tables.CombiTable1Ds combiTable1Ds(table=[G0,0; G1,P1; G2,P2;
        1,P3], smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments)
    annotation (Placement(transformation(extent={{-2,-24},{16,-6}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag leadLag1(
    K=1,
    T1=-T_W,
    T2=T_W/2,
    y_start=p0,
    x_start=0) annotation (Placement(transformation(extent={{24,-24},{42,-6}})));
  Modelica.Blocks.Math.Add add2(k1=-1)
    annotation (Placement(transformation(extent={{74,-6},{86,6}})));
  Modelica.Blocks.Math.Gain gain1(k=D)
    annotation (Placement(transformation(extent={{10,66},{24,80}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax=PMAX, uMin=PMIN)
    annotation (Placement(transformation(extent={{52,-20},{62,-10}})));
protected
  parameter OpenIPSL.Types.PerUnit PREF(fixed=false);
  parameter OpenIPSL.Types.PerUnit s00(fixed=false);
  parameter OpenIPSL.Types.PerUnit p0(fixed=false);
  parameter OpenIPSL.Types.PerUnit PMECH0(fixed=false);
  parameter OpenIPSL.Types.PerUnit s01(fixed=false);
  parameter OpenIPSL.Types.PerUnit s02(fixed=false);
  parameter OpenIPSL.Types.PerUnit sG(fixed=false);

initial equation
  PREF = PELEC;//+0.00027;
  PMECH0 = PELEC;
  p0 = PMECH0;

  s00 = PELEC-PREF;
  s01 = s00*REG;
  s02 = s01*K_P;
  sG = (if p0 > P2 then ((p0-P2)*(1-G2)/(P3-P2) + G2) elseif p0 < P1 then (p0*(G1-G0)/P1 + G0) else (p0-P1)*(G2-G1)/(P2-P1) + G1);

equation
  connect(PELEC, add1.u2)
    annotation (Line(points={{-120,-60},{-78,-60}}, color={0,0,127}));
  connect(add1.y, simpleLag.u)
    annotation (Line(points={{-55,-54},{-48,-54}}, color={0,0,127}));
  connect(const.y, add1.u1)
    annotation (Line(points={{-89.6,-48},{-78,-48}}, color={0,0,127}));
  connect(simpleLag.y, add3.u2) annotation (Line(points={{-25,-54},{-18,-54},{-18,
          -32},{-86,-32},{-86,-22},{-82,-22}}, color={0,0,127}));
  connect(SPEED, add3.u1) annotation (Line(points={{-120,60},{-86,60},{-86,-10},
          {-82,-10}}, color={0,0,127}));
  connect(add3.y, gain.u) annotation (Line(points={{-59,-16},{-56,-16},{-56,73},
          {-45.4,73}}, color={0,0,127}));
  connect(integrator.u, gain.u) annotation (Line(points={{-50,48},{-56,48},{-56,
          73},{-45.4,73}}, color={0,0,127}));
  connect(derivative.u, gain.u) annotation (Line(points={{-50,16},{-56,16},{-56,
          73},{-45.4,73}}, color={0,0,127}));
  connect(integrator.y, add3_1.u2) annotation (Line(points={{-27,48},{-20,48},{-20,
          43},{-15.8,43}}, color={0,0,127}));
  connect(gain.y, add3_1.u1) annotation (Line(points={{-29.3,73},{-22,73},{-22,50.2},
          {-15.8,50.2}}, color={0,0,127}));
  connect(derivative.y, add3_1.u3) annotation (Line(points={{-27,16},{-22,16},{-22,
          35.8},{-15.8,35.8}}, color={0,0,127}));
  connect(add3_1.y, simpleLag1.u)
    annotation (Line(points={{4.9,43},{10.6,43}}, color={0,0,127}));
  connect(simpleLag2.y, derivativeLag.u)
    annotation (Line(points={{42.5,43},{48.6,43}}, color={0,0,127}));
  connect(simpleLag1.y, simpleLag2.u)
    annotation (Line(points={{26.7,43},{31,43}}, color={0,0,127}));
  connect(derivativeLag.y, limiter.u)
    annotation (Line(points={{64.7,43},{69,43}}, color={0,0,127}));
  connect(limiter.y, integrator1.u) annotation (Line(points={{80.5,43},{84,43},{
          84,28},{-20,28},{-20,-2},{-44,-2},{-44,-15},{-41,-15}}, color={0,0,127}));
  connect(integrator1.y, limiter1.u)
    annotation (Line(points={{-29.5,-15},{-25,-15}}, color={0,0,127}));
  connect(limiter1.y, combiTable1Ds.u) annotation (Line(points={{-13.5,-15},{-3.8,
          -15},{-3.8,-15}}, color={0,0,127}));
  connect(combiTable1Ds.y[1], leadLag1.u)
    annotation (Line(points={{16.9,-15},{22.2,-15}}, color={0,0,127}));
  connect(leadLag1.y, limiter2.u)
    annotation (Line(points={{42.9,-15},{51,-15}}, color={0,0,127}));
  connect(limiter2.y, add2.u2) annotation (Line(points={{62.5,-15},{68,-15},{68,
          -3.6},{72.8,-3.6}}, color={0,0,127}));
  connect(gain1.y, add2.u1) annotation (Line(points={{24.7,73},{90,73},{90,16},{
          64,16},{64,3.6},{72.8,3.6}}, color={0,0,127}));
  connect(gain1.u, add3.u1) annotation (Line(points={{8.6,73},{-10,73},{-10,92},
          {-86,92},{-86,-10},{-82,-10}}, color={0,0,127}));
  connect(add2.y, PMECH)
    annotation (Line(points={{86.6,0},{110,0}}, color={0,0,127}));
  annotation (
        Icon(graphics={Rectangle(lineColor = {28, 108, 200}, extent = {{-100, 100}, {100, -100}}),
        Text(lineColor = {28, 108, 200}, fillColor = {255, 255, 255},
            fillPattern =                                                           FillPattern.Solid, extent = {{-50, 80}, {10, 40}}, textString = "SPEED"),
        Text(lineColor = {28, 108, 200}, fillColor = {255, 255, 255},
            fillPattern =                                                           FillPattern.Solid, extent = {{-50, -40}, {10, -80}}, textString = "PELEC"),
        Text(lineColor = {28, 108, 200}, fillColor = {255, 255, 255},
            fillPattern =                                                           FillPattern.Solid, extent = {{30, 20}, {90, -20}}, textString = "PMECH"),
        Text(lineColor={28,108,200},     extent = {{-100, 160}, {100, 100}},
          textString="WPIDHY")}),
    Documentation(info="<html>
<p>The following documentation is adapted from
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-Models], chapter 7.12</a>:</p>
<blockquote>
<p>This is a general purpose Governor/Turbine model that can be used in dynamic studies.
The model can be used to represent many different models such as gas turbines, aeroderivative turbines and diesel engines.
This model represents the usual PSSE implementation of the GGOV1 and a fairly complete review of this model can be found in
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[IEEE2013]</a>.
</p>
<p>
[...]
</p>
<p>
This model is incredibly versatile and can be used to represent different turbine models with different control modes.
The Governor-Turbine frequency control, for example, can have different feedback signals, such as electric power, turbine output, valve stroke or even an isochronous operation.
Isochronous operations are used when the machine operates in an isolated system. Note that, in this case, the permanent droop parameter <code>R</code> should be set to zero.
In addition to that, the parameters can be set so a particular control loop is used.
This model allows the representation of a frequency control system, a temperature control system and an acceleration limiter control system.
</p>
<p>
[...]
</p>
<p>
In order to represent a diesel generator using this model, one should be careful with setting some parameters. For example, a diesel generator needs to have <code>flag</code> set to 1.
This is because the diesel generator have teir fluid flow proportional on the speed. In addition to that, <code>Teng</code>, which represents the time delay from the engine, should be set to a number greater than 0.
Finally, the variable <code>Dm</code> should also be set to a number greater than 0. This is because in diesel engines, the maximum power output decreases as speed increases.
</p>
</blockquote>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Models</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-11-22</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/maguilerac\">@maguilerac</a>,
       <a href=\"https://github.com/marcelofcastro\">@marcelofcastro</a></p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end WPIDHY;
