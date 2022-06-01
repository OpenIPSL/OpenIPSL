within OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses;
model RotatingExciterLimited "Base model for a rotating exciter system with limited output"
  extends RotatingExciterBase(redeclare replaceable
      Modelica.Blocks.Continuous.LimIntegrator sISO(
      k=1/T_E,
      y_start=Efd0,
      outMin=0,
      outMax=Modelica.Constants.inf,
      initType=Modelica.Blocks.Types.Init.InitialOutput));
  annotation (Icon(graphics={Text(
          extent={{-56,56},{52,44}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Limited")}));
end RotatingExciterLimited;
