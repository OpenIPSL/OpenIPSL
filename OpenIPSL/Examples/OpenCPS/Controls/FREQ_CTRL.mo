within OpenIPSL.Examples.OpenCPS.Controls;
model FREQ_CTRL "Voltage frequency control used in resynchronization"

  Modelica.Blocks.Interfaces.RealInput SPEED annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}}),
        iconTransformation(extent={{-100,-10},{-80,10}})));
  Modelica.Blocks.Interfaces.RealOutput P_REF annotation (Placement(
        transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-20,-18},{0,2}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-60,-80},{-40,-60}})));
  Modelica.Blocks.Math.Gain unit_conv(k=50)
    annotation (Placement(transformation(extent={{8,-18},{28,2}})));
  Modelica.Blocks.Logical.Xor xor
    annotation (Placement(transformation(extent={{-62,-40},{-42,-20}})));
  Modelica.Blocks.Interfaces.BooleanInput TRIGGER annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,100})));
  Modelica.Blocks.Interfaces.RealInput fi_IB annotation (Placement(
        transformation(extent={{-110,50},{-90,70}}),
        iconTransformation(extent={{-100,50},{-80,70}})));
  Modelica.Blocks.Math.Add add(k2=-1, k1=+1)
    annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
  FREQ_CALC fREQ_CALC(
    T_w=0.05,
    T_f=3/2/Modelica.Constants.pi/50,
    fi_0=-0.049263488930001)
                         annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={-76,60})));
  Modelica.Blocks.Interfaces.BooleanInput BLOCK annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-100})));
  Modelica.Blocks.Math.Gain gain1(k=3)
    annotation (Placement(transformation(extent={{40,20},{60,40}})));
  Modelica.Blocks.Math.Add add1(k2=1)
    annotation (Placement(transformation(extent={{74,-10},{94,10}})));
  Modelica.Blocks.Continuous.Integrator integrator(k=6)
    annotation (Placement(transformation(extent={{38,-40},{58,-20}})));
equation
  connect(const.y, switch1.u3) annotation (Line(points={{-39,-70},{-28,-70},{-28,
          -16},{-22,-16}}, color={0,0,127}));
  connect(xor.y, switch1.u2) annotation (Line(points={{-41,-30},{-34,-30},{-34,
          -8},{-22,-8}}, color={255,0,255}));
  connect(TRIGGER, xor.u1) annotation (Line(points={{0,100},{0,34},{-70,34},{-70,
          -30},{-64,-30}}, color={255,0,255}));
  connect(add.y, switch1.u1)
    annotation (Line(points={{-35,0},{-22,0}}, color={0,0,127}));
  connect(SPEED, add.u2) annotation (Line(points={{-100,0},{-80,0},{-80,-6},{-58,
          -6}}, color={0,0,127}));
  connect(fi_IB, fREQ_CALC.ANGLE)
    annotation (Line(points={{-100,60},{-85,60}}, color={0,0,127}));
  connect(BLOCK, xor.u2) annotation (Line(points={{0,-100},{0,-100},{0,-48},{0,
          -46},{-70,-46},{-70,-38},{-64,-38}}, color={255,0,255}));
  connect(switch1.y, unit_conv.u)
    annotation (Line(points={{1,-8},{6,-8}}, color={0,0,127}));
  connect(integrator.y, add1.u2) annotation (Line(points={{59,-30},{59,-30},{64,
          -30},{64,-6},{72,-6}}, color={0,0,127}));
  connect(gain1.y, add1.u1)
    annotation (Line(points={{61,30},{64,30},{64,6},{72,6}}, color={0,0,127}));
  connect(add1.y, P_REF)
    annotation (Line(points={{95,0},{110,0},{110,0}}, color={0,0,127}));
  connect(unit_conv.y, gain1.u) annotation (Line(points={{29,-8},{32,-8},{32,30},
          {38,30}}, color={0,0,127}));
  connect(integrator.u, gain1.u) annotation (Line(points={{36,-30},{32,-30},{32,
          30},{38,30}}, color={0,0,127}));
  connect(add.u1, switch1.u3) annotation (Line(points={{-58,6},{-66,6},{-66,-16},
          {-22,-16}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-52,96},{48,76}},
          textColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="FREQ CTRL"),Text(
          extent={{-82,8},{-18,-10}},
          textColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="SPEED"),Text(
          extent={{34,10},{98,-8}},
          textColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="P_REF")}),
    Documentation(info="<html>
<p>This frequency controller, which is based on simple PI, is used to reduce the error (ideally to zero) of the voltage frequency difference between two different nodes in the system.</p>
<p>After the difference is reduced to zero, and the errors on voltage magnitude and angle are also zero, the two nodes can be connected without major issues.</p>
<p>Note that this system uses the Frequency Calculator system.</p>
</html>"));
end FREQ_CTRL;
