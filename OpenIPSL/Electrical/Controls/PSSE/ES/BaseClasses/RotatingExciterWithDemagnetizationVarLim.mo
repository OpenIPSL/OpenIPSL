within OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses;
model RotatingExciterWithDemagnetizationVarLim "Base model for a rotating exciter system with demagnetization effect and variable limits in output"
  extends RotatingExciterWithDemagnetization(redeclare replaceable
      OpenIPSL.NonElectrical.Continuous.IntegratorLimVar sISO(K=1/T_E, y_start=
          Efd0), redeclare Modelica.Blocks.Math.Add3 Sum(k3=K_D));
  parameter Types.PerUnit K_D "Exciter demagnetizing factor";
  Modelica.Blocks.Interfaces.RealInput outMin annotation (Placement(
        transformation(extent={{-120,50},{-80,90}}), iconTransformation(extent=
            {{100,50},{80,70}})));
  Modelica.Blocks.Interfaces.RealInput outMax annotation (Placement(
        transformation(extent={{120,50},{80,90}}), iconTransformation(extent={{
            -100,50},{-80,70}})));
equation
  connect(outMax, sISO.outMax)
    annotation (Line(points={{100,70},{8,70},{8,34}}, color={0,0,127}));
  connect(outMin, sISO.outMin) annotation (Line(points={{-100,70},{-60,70},{-20,
          70},{-20,0},{-8,0},{-8,6}}, color={0,0,127}));
  annotation (Icon(graphics={Text(
          extent={{-54,48},{52,36}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Limited"),Text(
          extent={{-79,66},{-48,56}},
          lineColor={28,108,200},
          textString="outMax"),Text(
          extent={{47,66},{78,56}},
          lineColor={28,108,200},
          textString="outMin")}));
end RotatingExciterWithDemagnetizationVarLim;
