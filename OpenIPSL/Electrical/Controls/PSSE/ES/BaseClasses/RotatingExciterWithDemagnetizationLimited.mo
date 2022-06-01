within OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses;
model RotatingExciterWithDemagnetizationLimited "Base model for a rotating exciter system with demagnetization effect and limited output"
  extends RotatingExciterWithDemagnetization(redeclare replaceable
      Modelica.Blocks.Continuous.LimIntegrator sISO(
      outMin=0,
      k=1/T_E,
      initType=Modelica.Blocks.Types.Init.InitialOutput,
      y_start=Efd0,
      outMax=Modelica.Constants.inf));
  annotation (Icon(graphics={Text(
          extent={{-54,48},{52,36}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Limited")}));
end RotatingExciterWithDemagnetizationLimited;
