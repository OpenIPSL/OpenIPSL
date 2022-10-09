within OpenIPSL.Electrical.Controls.PSSE.TG;
model ConstantPower "Constant Power (feed through)"
extends BaseClasses.BaseGovernor;
equation
  connect(PMECH0, PMECH) annotation (Line(points={{-240,80},{0,80},{0,0},{250,0}},
               color={0,0,127}));
  annotation (Icon(graphics={
                  Text(
          extent={{-100,160},{100,100}},
          textColor={28,108,200},
          textString="ConstantPower")}));
end ConstantPower;
