within OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses;
model RotatingExciter "Base model for a rotating exciter system"
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.RotatingExciterBase(
      redeclare replaceable Modelica.Blocks.Continuous.Integrator sISO(
      k=1/T_E,
      initType=Modelica.Blocks.Types.Init.InitialOutput,
      y_start=Efd0));
  annotation (
    Icon(coordinateSystem(initialScale=0.05, extent={{-80,-80},{80,80}}),
        graphics={Rectangle(
          extent={{-80,80},{80,-80}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-52,70},{44,56}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Rotating Exciter"),Text(
          extent={{-81,4},{-57,-6}},
          lineColor={28,108,200},
          textString="I_C"),Text(
          extent={{56,6},{77,-4}},
          lineColor={28,108,200},
          textString="V_E")}),
    Diagram(coordinateSystem(initialScale=0.05, extent={{-80,-80},{80,80}})));
end RotatingExciter;
