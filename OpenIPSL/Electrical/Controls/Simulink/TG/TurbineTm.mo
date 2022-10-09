within OpenIPSL.Electrical.Controls.Simulink.TG;
model TurbineTm "Hydraulic turbine model. Mechanical torque as output"
  Modelica.Blocks.Interfaces.RealInput z "Gate opening" annotation (Placement(
        transformation(extent={{-95,2},{-88,10}}), iconTransformation(extent={{
            -92,20},{-78,34}})));
  Modelica.Blocks.Sources.Constant Hs(k=1)
    annotation (Placement(transformation(extent={{-74,-12},{-58,4}})));
  Modelica.Blocks.Math.Gain Tw(k=1/1) "Water time constant"
    annotation (Placement(transformation(extent={{0,-8},{20,12}})));
  Modelica.Blocks.Continuous.Integrator imIntegrator(
    k=1,
    y_start=init_Turbine_V1,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{28,-6},{44,10}})));
  Modelica.Blocks.Interfaces.RealInput Omega "Rotor speed in p.u" annotation (
      Placement(transformation(extent={{-96,-26},{-90,-18}}),
        iconTransformation(extent={{-92,-22},{-78,-8}})));
  Modelica.Blocks.Interfaces.RealOutput Tm "Mechanical Torque Tm as output"
    annotation (Placement(transformation(extent={{106,-2},{112,6}}),
        iconTransformation(extent={{30,-4},{46,14}})));
  parameter Real init_Turbine_V1;
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{52,-6},{68,10}})));
  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{84,-6},{100,10}})));
  Modelica.Blocks.Math.Add add(k1=-1)
    annotation (Placement(transformation(extent={{-28,-8},{-8,12}})));
  Modelica.Blocks.Math.Division division1
    annotation (Placement(transformation(extent={{-78,14},{-64,28}})));
  Modelica.Blocks.Math.Product product1
    annotation (Placement(transformation(extent={{-52,14},{-38,28}})));
equation
  connect(Tw.y, imIntegrator.u)
    annotation (Line(points={{21,2},{21,2},{26.4,2}}, color={0,0,127}));
  connect(imIntegrator.y, product.u2) annotation (Line(points={{44.8,2},{48,2},
          {48,-2.8},{50.4,-2.8}}, color={0,0,127}));
  connect(division.y, Tm)
    annotation (Line(points={{100.8,2},{109,2}}, color={0,0,127}));
  connect(product.y, division.u1) annotation (Line(points={{68.8,2},{76,2},{76,
          6.8},{82.4,6.8}}, color={0,0,127}));
  connect(division.u2, Omega) annotation (Line(points={{82.4,-2.8},{76,-2.8},{
          76,-22},{-93,-22}}, color={0,0,127}));
  connect(add.y, Tw.u)
    annotation (Line(points={{-7,2},{-5.55,2},{-2,2}}, color={0,0,127}));
  connect(Hs.y, add.u2) annotation (Line(points={{-57.2,-4},{-57.2,-4},{-30,-4}},
        color={0,0,127}));
  connect(product1.y, add.u1) annotation (Line(points={{-37.3,21},{-34,21},{-34,
          8},{-30,8}}, color={0,0,127}));
  connect(division1.y, product1.u1) annotation (Line(points={{-63.3,21},{-58,21},
          {-58,25.2},{-53.4,25.2}}, color={0,0,127}));
  connect(product1.u2, product1.u1) annotation (Line(points={{-53.4,16.8},{-58,
          16.8},{-58,25.2},{-53.4,25.2}}, color={0,0,127}));
  connect(division1.u1, imIntegrator.y) annotation (Line(points={{-79.4,25.2},{
          -84,25.2},{-84,46},{44.8,46},{44.8,2}}, color={0,0,127}));
  connect(z, division1.u2) annotation (Line(points={{-91.5,6},{-84,6},{-84,16.8},
          {-79.4,16.8}}, color={0,0,127}));
  connect(product.u1, add.u1) annotation (Line(points={{50.4,6.8},{46,6.8},{46,
          28},{-34,28},{-34,8},{-30,8}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(extent={{-78,46},{32,-44}}, lineColor={
          0,0,255}),Text(
          extent={{-78,32},{-64,20}},
          textColor={0,0,255},
          textString="z"),Text(
          extent={{-76,-8},{-56,-28}},
          textColor={0,0,255},
          textString="omega"),Text(
          extent={{18,14},{28,0}},
          textColor={0,0,255},
          textString="Tm"),Text(
          extent={{-52,18},{8,-20}},
          textColor={0,0,255},
          textString="Hy turbine")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics={Text(
          extent={{-96,0},{-80,-2}},
          textColor={0,0,127},
          textString="z (gate opening)"),Text(
          extent={{-96,-28},{-80,-30}},
          textColor={0,0,127},
          textString="w (rotor speed)"),Text(
          extent={{102,10},{128,8}},
          textColor={0,0,127},
          textString="Tm (mech. torque)"),Text(
          extent={{52,14},{70,14}},
          textColor={0,0,127},
          textString="Pm (mech. power)"),Text(
          extent={{-8,-6},{22,-8}},
          textColor={0,0,127},
          textString="1/Tw (water time constant)")}));
end TurbineTm;
