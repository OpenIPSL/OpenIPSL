within OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses;
model RotatingExciterWithDemagnetization "Base model for a rotating exciter system with demagnetization effect"
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.RotatingExciterBase(
      redeclare Modelica.Blocks.Math.Add3 Sum(k3=K_D), redeclare replaceable
      Modelica.Blocks.Continuous.Integrator sISO(
      k=1/T_E,
      initType=Modelica.Blocks.Types.Init.InitialOutput,
      y_start=Efd0));
  parameter Types.PerUnit K_D "Exciter demagnetizing factor";
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-100}),  iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-90})));
  Modelica.Blocks.Interfaces.RealOutput V_FE annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-90,-40}), iconTransformation(extent={{-80,-60},{-100,-40}})));
equation
  connect(XADIFD, Sum.u3) annotation (Line(points={{0,-100},{0,-38},{-18,-38}},
                     color={0,0,127}));
  connect(V_FE, feedback.u2)
    annotation (Line(points={{-90,-40},{-50,-40},{-50,12}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(initialScale=0.05, extent={{-80,-80},{80,80}}),
        graphics={Rectangle(
          extent={{-80,80},{80,-80}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-50,70},{46,56}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Rotating Exciter"),Text(
          extent={{-81,4},{-57,-6}},
          lineColor={28,108,200},
          textString="I_C"),Text(
          extent={{56,6},{77,-4}},
          lineColor={28,108,200},
          textString="V_E"),Text(
          extent={{-56,60},{52,44}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="with Demagnetization Effect"),Text(
          extent={{-19,-64},{18,-74}},
          lineColor={28,108,200},
          textString="XADIFD"),Text(
          extent={{-77,-44},{-53,-54}},
          lineColor={28,108,200},
          textString="V_FE")}),
    Diagram(coordinateSystem(initialScale=0.05, extent={{-80,-80},{80,80}})));
end RotatingExciterWithDemagnetization;
