within OpenIPSL.Electrical.Controls.PSSE.UEL;
model MNLEX2 "Minimum Excitation Limiter [PSSE-MODELS]"
  parameter Types.PerUnit K_F2=0.1 "Rate feedback gain";
  parameter Types.Time T_F2=1 "Rate feedback time constant (>0)";
  parameter Types.PerUnit K_M=0.3 "MEL gain";
  parameter Types.Time T_M=0.5 "MEL time constant";
  parameter Types.PerUnit MEL_MAX=0.1 "Maximum limiter output";
  parameter Types.PerUnit Q_0=2.5 "Reactive power circle center in PQ plane (pu on machine base)";
  parameter Types.PerUnit Radius=3 "Reactive power circle radius in PQ plane (pu on machine base)";
  Modelica.Blocks.Interfaces.RealInput QELEC
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput Eterm
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput PELEC
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Math.Add add(k1=-1)
    annotation (Placement(transformation(extent={{-74,-10},{-54,10}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{-80,50},{-60,70}})));
  Modelica.Blocks.Math.Gain gain(k=Q_0)
    annotation (Placement(transformation(extent={{-46,50},{-26,70}})));
  Modelica.Blocks.Math.Product product2
    annotation (Placement(transformation(extent={{-34,-10},{-14,10}})));
  Modelica.Blocks.Math.Add3 add3_1(k1=-1)
    annotation (Placement(transformation(extent={{12,-10},{32,10}})));
  Modelica.Blocks.Math.Gain gain1(k=Radius)
    annotation (Placement(transformation(extent={{-16,70},{4,90}})));
  Modelica.Blocks.Math.Product product3
    annotation (Placement(transformation(extent={{20,70},{40,90}})));
  Modelica.Blocks.Math.Product product4
    annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  NonElectrical.Continuous.SimpleLagLim
                             simpleLagLim(
    K=K_M,
    T=T_M,
    y_start=0,
    outMax=MEL_MAX,
    outMin=0)
    annotation (Placement(transformation(extent={{68,-10},{88,10}})));
  Modelica.Blocks.Interfaces.RealOutput VUEL
    annotation (Placement(transformation(extent={{100,-10},{120,10}}),
        iconTransformation(extent={{100,-10},{120,10}})));
  NonElectrical.Continuous.DerivativeLag derivativeLag(
    K=K_F2,
    T=T_F2,
    y_start=0)
    annotation (Placement(transformation(extent={{84,-50},{64,-30}})));
equation
  connect(Eterm, product1.u1)
    annotation (Line(points={{-120,60},{-88,60},{-88,66},{-82,66}}, color={0,0,127}));
  connect(Eterm, product1.u2)
    annotation (Line(points={{-120,60},{-88,60},{-88,54},{-82,54}}, color={0,0,127}));
  connect(QELEC, add.u2)
    annotation (Line(points={{-120,0},{-88,0},{-88,-6},{-76,-6}}, color={0,0,127}));
  connect(product1.y, gain.u) annotation (Line(points={{-59,60},{-48,60}}, color={0,0,127}));
  connect(gain.y, add.u1) annotation (Line(points={{-25,60},{-20,60},{-20,28},
          {-88,28},{-88,6},{-76,6}},
               color={0,0,127}));
  connect(add.y, product2.u1)
    annotation (Line(points={{-53,0},{-42,0},{-42,6},{-36,6}}, color={0,0,127}));
  connect(product2.u2, add.y)
    annotation (Line(points={{-36,-6},{-42,-6},{-42,0},{-53,0}}, color={0,0,127}));
  connect(product2.y, add3_1.u2)
    annotation (Line(points={{-13,0},{10,0}},             color={0,0,127}));
  connect(gain1.u, product1.y)
    annotation (Line(points={{-18,80},{-54,80},{-54,60},{-59,60}}, color={0,0,127}));
  connect(gain1.y, product3.u1)
    annotation (Line(points={{5,80},{10,80},{10,86},{18,86}}, color={0,0,127}));
  connect(product3.u2, product3.u1)
    annotation (Line(points={{18,74},{10,74},{10,86},{18,86}}, color={0,0,127}));
  connect(product3.y, add3_1.u1)
    annotation (Line(points={{41,80},{44,80},{44,50},{0,50},{0,8},{10,8}},   color={0,0,127}));
  connect(product4.y, add3_1.u3)
    annotation (Line(points={{-59,-60},{0,-60},{0,-8},{10,-8}},   color={0,0,127}));
  connect(PELEC, product4.u1)
    annotation (Line(points={{-120,-60},{-88,-60},{-88,-54},{-82,-54}}, color={0,0,127}));
  connect(PELEC, product4.u2)
    annotation (Line(points={{-120,-60},{-88,-60},{-88,-66},{-82,-66}}, color={0,0,127}));
  connect(add3_1.y, feedback.u1) annotation (Line(points={{33,0},{42,0}}, color={0,0,127}));
  connect(feedback.y, simpleLagLim.u)
    annotation (Line(points={{59,0},{66,0}},  color={0,0,127}));
  connect(simpleLagLim.y, VUEL)
    annotation (Line(points={{89,0},{110,0}},  color={0,0,127}));
  connect(derivativeLag.u, VUEL) annotation (Line(points={{86,-40},{96,-40},{
          96,0},{110,0}},
                       color={0,0,127}));
  connect(derivativeLag.y, feedback.u2)
    annotation (Line(points={{63,-40},{50,-40},{50,-8}}, color={0,0,127}));
  annotation (
    Icon( graphics={
          Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}), Text(
          extent={{-70,28},{66,-30}},
          textColor={28,108,200},
          textString="MNLEX2")}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>Minimum Excitation Limiter (PSS/E Manual)</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2024-10-05</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Giuseppe Laera, ALSETLab, RPI Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end MNLEX2;
