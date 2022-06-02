within OpenIPSL.NonElectrical.Nonlinear;
model FrequencyCalc "Frequency deviation calculation from a rotating phasor"
  parameter Boolean start_guess=false;
  parameter Real real_start=1 "Phasor initial real part";
  parameter Real imag_start=0 "Phasor initial imaginary part";
  parameter Types.Time Ts = 0.01 "Smoothing filter time constant";

  Modelica.Blocks.Interfaces.RealInput real_part
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealOutput y "O/P is in rad/sec"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Continuous.Der derOfReal
    annotation (Placement(transformation(extent={{-60,10},{-40,30}})));
  Modelica.Blocks.Math.Product ImagXderReal annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Modelica.Blocks.Math.Add diff(k2=-1) annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  Modelica.Blocks.Interfaces.RealInput imag_part
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Math.Product RealXderImag annotation (Placement(transformation(extent={{-20,60},{0,80}})));
  Modelica.Blocks.Math.Product imag2 annotation (Placement(transformation(extent={{-20,-76},{0,-56}})));
  Modelica.Blocks.Math.Product real2 annotation (Placement(transformation(extent={{-20,-44},{0,-24}})));
  Modelica.Blocks.Math.Add sum annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  Modelica.Blocks.Continuous.Der derOfImag
    annotation (Placement(transformation(extent={{-60,50},{-40,70}})));

protected
  parameter Modelica.Blocks.Types.Init init_type=if start_guess == true then
      Modelica.Blocks.Types.Init.InitialState else Modelica.Blocks.Types.Init.NoInit;

equation
  connect(diff.y, division.u1) annotation (Line(points={{41,50},{52,50},{52,6},{68,6}}, color={0,0,127}));
  connect(sum.y, division.u2) annotation (Line(points={{41,-50},{52,-50},{52,-6},{68,-6}}, color={0,0,127}));
  connect(division.y, y) annotation (Line(points={{91,0},{110,0}},
               color={0,0,127}));
  connect(real2.y, sum.u1) annotation (Line(points={{1,-34},{10,-34},{10,-44},{18,-44}}, color={0,0,127}));
  connect(imag2.y, sum.u2) annotation (Line(points={{1,-66},{10,-66},{10,-56},{18,-56}}, color={0,0,127}));
  connect(real_part, derOfReal.u) annotation (Line(points={{-120,60},{-80,60},{-80,20},{-62,20}},
                                      color={0,0,127}));
  connect(imag2.u1, imag_part) annotation (Line(points={{-22,-60},{-120,-60}}, color={0,0,127}));
  connect(imag2.u2, imag_part) annotation (Line(points={{-22,-72},{-72,-72},{-72,-60},{-120,-60}}, color={0,0,127}));
  connect(derOfImag.y, RealXderImag.u2) annotation (Line(points={{-39,60},{-30,60},{-30,64},{-22,64}}, color={0,0,127}));
  connect(derOfImag.u, imag_part) annotation (Line(points={{-62,60},{-72,60},{-72,-60},{-120,-60}},
                                 color={0,0,127}));
  connect(real_part, RealXderImag.u1) annotation (Line(points={{-120,60},{-80,60},{-80,80},{-30,80},{-30,76},{-22,76}}, color={0,0,127}));
  connect(RealXderImag.y, diff.u1) annotation (Line(points={{1,70},{8,70},{8,56},{18,56}}, color={0,0,127}));
  connect(ImagXderReal.y, diff.u2) annotation (Line(points={{1,30},{8,30},{8,44},{18,44}}, color={0,0,127}));
  connect(ImagXderReal.u1, imag_part) annotation (Line(points={{-22,36},{-30,36},{-30,40},{-72,40},{-72,-60},{-120,-60}}, color={0,0,127}));
  connect(derOfReal.y, ImagXderReal.u2) annotation (Line(points={{-39,20},{-30,20},{-30,24},{-22,24}}, color={0,0,127}));
  connect(real2.u2, real_part) annotation (Line(points={{-22,-40},{-80,-40},{-80,60},{-120,60}}, color={0,0,127}));
  connect(real2.u1, real_part) annotation (Line(points={{-22,-28},{-80,-28},{-80,60},{-120,60}}, color={0,0,127}));

annotation (Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}),
  graphics={ Rectangle(extent={{-100,100},{100,-100}}, lineColor = {28, 108, 200}, fillColor = {85, 170, 255}, fillPattern = FillPattern.Solid),
    Text(extent={{-90,80},{40,40}}, lineColor = {28, 108, 200}, fillColor = {28, 108, 200}, fillPattern = FillPattern.Solid, textString = "real part"),
    Text(extent={{-90,-40},{40,-80}}, lineColor = {28, 108, 200}, fillColor = {28, 108, 200}, fillPattern = FillPattern.Solid, textString = "imag part"),
    Text(extent={{20,20},{90,-20}}, lineColor={28,108,200}, fillColor={28,108,200}, fillPattern = FillPattern.Solid, textString="freq")}),
  Documentation(info="<html>
<p>This block uses the real and imaginary components of a Cartesian representation of a voltage phasor to estimate the electrical frequency deviation from nominal value present at the node.</p>
<pre>
    Vr*der(Vi) - Vi*der(Vr)
f = -----------------------
          Vr^2 + Vi^2
</pre>

<p>The calculations are done using the filtered derivative of the real and imaginary parts of the phasor representation.
The user is required to set proper values for initialization of the calculations, together with a smoothing filter time constant, used to filter the derivative components.</p>
<h5>Note</h5>
<p><em>The calculated frequency is just an estimate and can deviate by a certain margin of error.</em></p>

</html>"));
end FrequencyCalc;
