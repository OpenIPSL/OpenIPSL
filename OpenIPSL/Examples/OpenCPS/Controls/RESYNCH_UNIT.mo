within OpenIPSL.Examples.OpenCPS.Controls;
model RESYNCH_UNIT "Resynchronization control system"
  Controls.FREQ_CTRL freq_ctrl annotation (Placement(transformation(extent={{-52,-80},{-32,-60}})));
  Controls.ANGLE_CTRL angle_ctrl annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={-42,-40})));
  Controls.VOLT_CTRL volt_ctrl
    annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
  Modelica.Blocks.Math.Add add(k2=+1)
    annotation (Placement(transformation(extent={{8,-56},{20,-44}})));
  Modelica.Blocks.Interfaces.RealInput SPEED annotation (Placement(
        transformation(extent={{-102,-80},{-82,-60}}),
        iconTransformation(extent={{100,-80},{80,-60}})));
  Modelica.Blocks.Interfaces.RealInput PMECH0 annotation (Placement(
        transformation(extent={{-24,-38},{-4,-18}}),
        iconTransformation(extent={{100,-40},{80,-20}})));
  Modelica.Blocks.Interfaces.RealOutput P_CTRL annotation (Placement(
        transformation(extent={{40,-60},{60,-40}}),
        iconTransformation(extent={{100,20},{120,40}})));
  Modelica.Blocks.Interfaces.RealInput fi_DN annotation (Placement(
        transformation(extent={{-102,-54},{-82,-34}}),
        iconTransformation(extent={{-100,-40},{-80,-20}})));
  Modelica.Blocks.Interfaces.RealInput fi_IB annotation (Placement(
        transformation(extent={{-102,-30},{-82,-10}}),
        iconTransformation(extent={{-100,-80},{-80,-60}})));
  Modelica.Blocks.Interfaces.RealInput V_IB annotation (Placement(
        transformation(extent={{-102,66},{-82,86}}),
        iconTransformation(extent={{-100,60},{-80,80}})));
  Modelica.Blocks.Interfaces.RealInput V_DN annotation (Placement(
        transformation(extent={{-102,34},{-82,54}}),
        iconTransformation(extent={{-100,20},{-80,40}})));
  Modelica.Blocks.Interfaces.RealOutput V_CTRL annotation (Placement(
        transformation(extent={{100,50},{120,70}}),
        iconTransformation(extent={{100,60},{120,80}})));
  Modelica.Blocks.Math.Add add2(k2=-1)
    annotation (Placement(transformation(extent={{-32,24},{-20,36}})));
  Modelica.Blocks.Math.Add add3(k2=-1)
    annotation (Placement(transformation(extent={{-32,-12},{-20,0}})));
  Modelica.Blocks.Interfaces.BooleanOutput TRIGGER
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  ACT_UNIT aCT_UNIT
    annotation (Placement(transformation(extent={{0,0},{20,20}})));
  Modelica.Blocks.Math.Add add1(k2=+1)
    annotation (Placement(transformation(extent={{-20,-60},{-8,-48}})));
equation
  connect(PMECH0, add.u1) annotation (Line(points={{-14,-28},{0,-28},{0,-46.4},
          {6.8,-46.4}}, color={0,0,127}));
  connect(V_CTRL, volt_ctrl.y)
    annotation (Line(points={{110,60},{30,60},{-19,60}}, color={0,0,127}));
  connect(V_IB, volt_ctrl.u1) annotation (Line(points={{-92,76},{-60,76},{-60,
          65},{-39,65}}, color={0,0,127}));
  connect(V_DN, volt_ctrl.u2) annotation (Line(points={{-92,44},{-92,44},{-60,
          44},{-60,55},{-39,55}}, color={0,0,127}));
  connect(fi_IB, angle_ctrl.fi_IB) annotation (Line(points={{-92,-20},{-78,-20},
          {-64,-20},{-64,-35},{-51,-35}}, color={0,0,127}));
  connect(fi_DN, angle_ctrl.fi_DN) annotation (Line(points={{-92,-44},{-80,-44},
          {-64,-44},{-64,-45},{-51,-45}}, color={0,0,127}));
  connect(add.y, P_CTRL) annotation (Line(points={{20.6,-50},{20.6,-50},{50,-50}},
        color={0,0,127}));
  connect(SPEED, freq_ctrl.SPEED)
    annotation (Line(points={{-92,-70},{-51,-70}}, color={0,0,127}));
  connect(add2.u1, volt_ctrl.u1) annotation (Line(points={{-33.2,33.6},{-50,
          33.6},{-50,65},{-39,65}}, color={0,0,127}));
  connect(add2.u2, volt_ctrl.u2) annotation (Line(points={{-33.2,26.4},{-56,
          26.4},{-56,55},{-39,55}}, color={0,0,127}));
  connect(add3.u1, angle_ctrl.fi_IB) annotation (Line(points={{-33.2,-2.4},{-64,
          -2.4},{-64,-35},{-51,-35}}, color={0,0,127}));
  connect(add3.u2, angle_ctrl.fi_DN) annotation (Line(points={{-33.2,-9.6},{-60,
          -9.6},{-60,-45},{-51,-45}}, color={0,0,127}));
  connect(aCT_UNIT.VOLT_DIFF, add2.y) annotation (Line(points={{1,15},{-10,15},
          {-10,30},{-19.4,30}}, color={0,0,127}));
  connect(aCT_UNIT.FI_DIFF, add3.y) annotation (Line(points={{1,5},{-10,5},{-10,
          -6},{-19.4,-6}}, color={0,0,127}));
  connect(aCT_UNIT.SPEED, freq_ctrl.SPEED) annotation (Line(points={{1,10},{-68,
          10},{-68,-70},{-51,-70}}, color={0,0,127}));
  connect(aCT_UNIT.TRIGGER, TRIGGER) annotation (Line(points={{21,10},{60,10},{
          60,0},{110,0}}, color={255,0,255}));
  connect(aCT_UNIT.START_FI, angle_ctrl.TRIGGER) annotation (Line(points={{21,6},
          {28,6},{28,-16},{-42,-16},{-42,-30}}, color={255,0,255}));
  connect(aCT_UNIT.START_FREQ, freq_ctrl.TRIGGER) annotation (Line(points={{21,
          15},{36,15},{36,-42},{-42,-42},{-42,-60}}, color={255,0,255}));
  connect(freq_ctrl.BLOCK, TRIGGER) annotation (Line(points={{-42,-80},{-42,-88},
          {80,-88},{80,0},{110,0}}, color={255,0,255}));
  connect(freq_ctrl.fi_IB, angle_ctrl.fi_IB) annotation (Line(points={{-51,-64},
          {-78,-64},{-78,-20},{-64,-20},{-64,-35},{-51,-35}}, color={0,0,127}));
  connect(angle_ctrl.y, add1.u1) annotation (Line(points={{-31,-40},{-26,-40},{
          -26,-50.4},{-21.2,-50.4}}, color={0,0,127}));
  connect(freq_ctrl.P_REF, add1.u2) annotation (Line(points={{-31,-70},{-26,-70},
          {-26,-57.6},{-21.2,-57.6}}, color={0,0,127}));
  connect(add1.y, add.u2) annotation (Line(points={{-7.4,-54},{-6,-54},{-6,-53.6},
          {0,-53.6},{6.8,-53.6}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-56,100},{64,80}},
          textColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="RESYNCH UNIT"),Text(
          extent={{-76,80},{-48,60}},
          textColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="V_IB"),Text(
          extent={{-76,38},{-48,18}},
          textColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="V_DN"),Text(
          extent={{-74,-20},{-46,-40}},
          textColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="fi_DN"),Text(
          extent={{-74,-62},{-46,-82}},
          textColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="fi_IB"),Text(
          extent={{40,82},{92,62}},
          textColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="V_CTRL"),Text(
          extent={{42,40},{94,20}},
          textColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="P_CTRL"),Text(
          extent={{40,-18},{80,-38}},
          textColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="P_0"),Text(
          extent={{20,-60},{78,-80}},
          textColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="SPEED")}),
    Documentation(info="<html>
<p>This resynchronization system uses the voltage magnitude, angle and frequency controls to eliminate the differences between the mentioned variables
from two different electrical nodes in order to allow the resynchronization of an islanded system.</p>
</html>"));
end RESYNCH_UNIT;
