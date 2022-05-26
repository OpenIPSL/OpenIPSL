within OpenIPSL.NonElectrical.Nonlinear;
model FrenquencyCalc
  "frequency calculation of a rotating phasor, if the phasor is w.r.t a rotating coordinate system then it is the frequency difference to that system."
  parameter Boolean start_guess=false;
protected
  parameter Modelica.Blocks.Types.Init init_type=if start_guess == true then
      Modelica.Blocks.Types.Init.InitialState else Modelica.Blocks.Types.Init.NoInit;
public
  parameter Real real_start=1;
  parameter Real imag_start=0;
public
  Modelica.Blocks.Interfaces.RealInput real_part
    annotation (Placement(transformation(extent={{-120,44},{-80,84}})));
  Modelica.Blocks.Interfaces.RealOutput y "O/P is in rad/sec" annotation (
      Placement(transformation(extent={{94,-8},{114,12}}), iconTransformation(
          extent={{94,-8},{114,12}})));
  Modelica.Blocks.Continuous.Derivative derOfReal(
    initType=init_type,
    x_start=real_start,
    y_start=0)
    annotation (Placement(transformation(extent={{-58,34},{-38,54}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{-18,16},{4,36}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{26,6},{46,26}})));
  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{58,-22},{78,-2}})));
  Modelica.Blocks.Interfaces.RealInput imag_part
    annotation (Placement(transformation(extent={{-120,-92},{-80,-52}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{-16,-16},{6,4}})));
  Modelica.Blocks.Math.Product product2
    annotation (Placement(transformation(extent={{-22,-90},{0,-70}})));
  Modelica.Blocks.Math.Product product3
    annotation (Placement(transformation(extent={{-14,-54},{8,-34}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{26,-66},{46,-46}})));
  Modelica.Blocks.Continuous.Derivative derOfImag(
    initType=init_type,
    x_start=imag_start,
    y_start=0)
    annotation (Placement(transformation(extent={{-54,-26},{-34,-6}})));
equation
  connect(add.y, division.u1) annotation (Line(points={{47,16},{52,16},{52,-6},
          {56,-6}}, color={0,0,127}));
  connect(add1.y, division.u2) annotation (Line(points={{47,-56},{52,-56},{52,-18},
          {56,-18}}, color={0,0,127}));
  connect(division.y, y) annotation (Line(points={{79,-12},{86,-12},{86,2},{104,
          2}}, color={0,0,127}));
  connect(product.y, add.u1) annotation (Line(points={{5.1,26},{16,26},{16,22},
          {24,22}}, color={0,0,127}));
  connect(product1.y, add.u2) annotation (Line(points={{7.1,-6},{16,-6},{16,10},
          {24,10}}, color={0,0,127}));
  connect(product3.y, add1.u1) annotation (Line(points={{9.1,-44},{17.55,-44},{
          17.55,-50},{24,-50}}, color={0,0,127}));
  connect(product2.y, add1.u2) annotation (Line(points={{1.1,-80},{1.1,-80},{24,
          -80},{24,-62}}, color={0,0,127}));
  connect(real_part, derOfReal.u) annotation (Line(points={{-100,64},{-84,64},{
          -70,64},{-70,44},{-60,44}}, color={0,0,127}));
  connect(derOfReal.y, product.u1) annotation (Line(points={{-37,44},{-30,44},{
          -30,32},{-20.2,32}}, color={0,0,127}));
  connect(product.u2, imag_part) annotation (Line(points={{-20.2,20},{-44,20},{
          -44,22},{-64,22},{-64,-72},{-100,-72}}, color={0,0,127}));
  connect(product2.u1, imag_part) annotation (Line(points={{-24.2,-74},{-46,-74},
          {-46,-72},{-100,-72}}, color={0,0,127}));
  connect(product2.u2, imag_part) annotation (Line(points={{-24.2,-86},{-38,-86},
          {-38,-88},{-46,-88},{-46,-72},{-100,-72}}, color={0,0,127}));
  connect(derOfImag.y, product1.u2) annotation (Line(points={{-33,-16},{-26,-16},
          {-26,-12},{-18.2,-12}}, color={0,0,127}));
  connect(product3.u1, derOfReal.u) annotation (Line(points={{-16.2,-38},{-70,-38},
          {-70,44},{-60,44}}, color={0,0,127}));
  connect(product1.u1, derOfReal.u) annotation (Line(points={{-18.2,0},{-36,0},
          {-36,6},{-70,6},{-70,44},{-60,44}}, color={0,0,127}));
  connect(derOfImag.u, imag_part) annotation (Line(points={{-56,-16},{-64,-16},
          {-64,-72},{-100,-72}}, color={0,0,127}));
  connect(product3.u2, derOfReal.u) annotation (Line(points={{-16.2,-50},{-34,-50},
          {-34,-38},{-70,-38},{-70,44},{-60,44}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-80,88},{-14,62}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="real part"),Text(
          extent={{-82,-44},{-16,-70}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="imag part"),Text(
          extent={{32,4},{110,-20}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          textString="freq.
")}));
end FrenquencyCalc;
