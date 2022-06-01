within OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses;
model RectifierCommutationVoltageDrop "Base model for excitation system with commutation voltage drop on rectifier"
  parameter Types.PerUnit K_C "Rectifier load factor";
  Modelica.Blocks.Interfaces.RealInput V_EX annotation (Placement(
        transformation(extent={{-140,-20},{-100,20}}), iconTransformation(
          extent={{-120,-10},{-100,10}})));
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        origin={-120,50}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-110})));
  Modelica.Blocks.Interfaces.RealOutput EFD annotation (Placement(
        transformation(extent={{100,-10},{120,10}}), iconTransformation(extent=
            {{100,-10},{120,10}})));
  Modelica.Blocks.Math.Gain gain2(k=K_C) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={-70,50})));
  NonElectrical.Nonlinear.FEX fEX annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={10,0})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={70,0})));
  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
equation
  connect(V_EX, division.u2) annotation (Line(points={{-120,0},{-80,0},{-80,-6},
          {-42,-6}}, color={0,0,127}));
  connect(XADIFD, gain2.u)
    annotation (Line(points={{-120,50},{-82,50},{-82,50}}, color={0,0,127}));
  connect(gain2.y, division.u1) annotation (Line(points={{-59,50},{-52,50},{-52,
          6},{-42,6}}, color={0,0,127}));
  connect(division.y, fEX.u)
    annotation (Line(points={{-19,0},{-9.5,0},{0,0}}, color={0,0,127}));
  connect(product1.y, EFD)
    annotation (Line(points={{81,0},{110,0}}, color={0,0,127}));
  connect(fEX.y, product1.u2)
    annotation (Line(points={{21,0},{48,0},{48,-6},{58,-6}}, color={0,0,127}));
  connect(product1.u1, division.u2) annotation (Line(points={{58,6},{48,6},{48,
          20},{-80,20},{-80,-6},{-42,-6}}, color={0,0,127}));
  annotation (
    Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-68,96},{70,60}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Rectifier Commutation
Voltage Drop"),Text(
          extent={{-99,4},{-70,-6}},
          lineColor={28,108,200},
          textString="V_EX"),Text(
          extent={{-19,-86},{18,-96}},
          lineColor={28,108,200},
          textString="XADIFD"),Text(
          extent={{76,6},{98,-4}},
          lineColor={28,108,200},
          textString="EFD")}));
end RectifierCommutationVoltageDrop;
