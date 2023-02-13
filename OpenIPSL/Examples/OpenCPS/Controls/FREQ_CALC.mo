within OpenIPSL.Examples.OpenCPS.Controls;
model FREQ_CALC "Frequency calculator"
  parameter Types.Time T_w "Smoothing filter time constant";
  parameter Types.Time T_f "Derivative filter time constant";
  parameter Types.Angle fi_0 "Initial angle";

  Modelica.Blocks.Interfaces.RealInput ANGLE annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}}),
        iconTransformation(extent={{-100,-10},{-80,10}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Sources.Constant const1(k=fi_0)
    annotation (Placement(transformation(extent={{-90,-50},{-70,-30}})));
  Modelica.Blocks.Math.Gain gain(k=1)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Continuous.Derivative derivative(k=1, T=T_f)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(k=1, T=T_w)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Interfaces.RealOutput d_FREQ
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput x_DERIVATIVE
    "Connector of Real output signal"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
equation
  connect(const1.y, add.u2) annotation (Line(points={{-69,-40},{-66,-40},{-66,-6},
          {-62,-6}}, color={0,0,127}));
  connect(ANGLE, add.u1) annotation (Line(points={{-100,0},{-66,0},{-66,6},{-62,
          6}}, color={0,0,127}));
  connect(gain.u, add.y)
    annotation (Line(points={{-22,0},{-39,0}}, color={0,0,127}));
  connect(derivative.u, gain.y)
    annotation (Line(points={{18,0},{1,0}}, color={0,0,127}));
  connect(derivative.y, firstOrder.u)
    annotation (Line(points={{41,0},{49.5,0},{58,0}}, color={0,0,127}));
  connect(firstOrder.y, d_FREQ)
    annotation (Line(points={{81,0},{98,0},{98,40},{110,40}},
                                              color={0,0,127}));
  connect(derivative.u, x_DERIVATIVE)
    annotation (Line(points={{18,0},{18,-40},{110,-40}}, color={0,0,127}));
  annotation ( Documentation(info="<html>
<p>This model of frequency calculator is based on a washout filter followed by a first order filter that is meant to smooth the washout output. The model can have as input the angle value of the phasor, the output will be an estimate of the frequency based on the angle variation.</p>
</html>"));
end FREQ_CALC;
