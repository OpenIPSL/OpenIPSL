within OpenIPSL.Electrical.Controls.PSSE.PSS;
model STAB2A "STAB2A - Power Sensitive Stabilizing Unit (ASEA) [PSSE-MODELS]"
  parameter Types.PerUnit K_2=1 "Input washout filter gain";
  parameter Types.Time T_2=1 "Input washout filter time constant";
  parameter Types.PerUnit K_3=1 "Low-pass filter proportional gain";
  parameter Types.Time T_3=1 "Low-pass filter time constant";
  parameter Types.PerUnit K_4=1 "Washout filter output proportional gain";
  parameter Types.PerUnit K_5=1 "Output low-pass filter proportional gain";
  parameter Types.Time T_5=1 "Output low-pass filter time constant";
  parameter Types.PerUnit H_LIM=5 "Limit value for stabilizer output";
  input Modelica.Blocks.Interfaces.RealInput PELEC
    "Machine electrical power [pu]" annotation (Placement(transformation(extent={{-180,-20},{-140,20}}),
                                  iconTransformation(extent={{-140,-20},{-100,20}})));
  output Modelica.Blocks.Interfaces.RealOutput VOTHSG "PSS output signal"
    annotation (Placement(transformation(extent={{140,-10},{160,10}}),
        iconTransformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction(
    b={-K_2*T_2,0},
    a={T_2,1},
    initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction1(
    a={T_2,1},
    initType=Modelica.Blocks.Types.Init.SteadyState,
    b={K_2*T_2,0})
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction2(
    a={T_2,1},
    initType=Modelica.Blocks.Types.Init.SteadyState,
    b={K_2*T_2,0})
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction3(
    initType=Modelica.Blocks.Types.Init.SteadyState,
    b={K_3},
    a={T_3,1}) annotation (Placement(transformation(extent={{-20,10},{0,30}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction4(
    initType=Modelica.Blocks.Types.Init.SteadyState,
    b={K_5},
    a={T_5,1}) annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction5(
    initType=Modelica.Blocks.Types.Init.SteadyState,
    b={K_5},
    a={T_5,1}) annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  Modelica.Blocks.Math.Gain K(k=K_4)
    annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=H_LIM, uMin=-H_LIM)
    annotation (Placement(transformation(extent={{110,-10},{130,10}})));
equation
  connect(PELEC, transferFunction.u) annotation (Line(
      points={{-160,0},{-122,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction.y, transferFunction1.u) annotation (Line(
      points={{-99,0},{-92,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction1.y, transferFunction2.u) annotation (Line(
      points={{-69,0},{-62,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction2.y, transferFunction3.u) annotation (Line(
      points={{-39,0},{-30,0},{-30,20},{-22,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction4.y, transferFunction5.u) annotation (Line(
      points={{71,0},{78,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K.u, transferFunction2.y) annotation (Line(
      points={{-22,-20},{-30,-20},{-30,0},{-39,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, transferFunction4.u) annotation (Line(
      points={{41,0},{48,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction3.y, add.u1) annotation (Line(
      points={{1,20},{10,20},{10,6},{18,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(K.y, add.u2) annotation (Line(
      points={{1,-20},{10,-20},{10,-6},{18,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(transferFunction5.y, limiter.u)
    annotation (Line(points={{101,0},{108,0}},
                                             color={0,0,127}));
  connect(VOTHSG, limiter.y)
    annotation (Line(points={{150,0},{131,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-140,-40},{140,40}},
        grid={2,2})),
    Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
          lineColor={0,0,255}),Text(
          extent={{-40,80},{40,40}},
          textColor={28,108,200},
          textString="STAB2A"),Text(
          extent={{50,20},{90,-20}},
          textColor={28,108,200},
          textString="VOTHSG"),Text(
          extent={{-90,20},{-50,-20}},
          textColor={28,108,200},
          textString="PELEC")}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td>PSS&reg;E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-10-16</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end STAB2A;
