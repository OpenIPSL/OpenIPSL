within OpenIPSL.Electrical.Controls.PSSE.PSS.BaseClasses;
partial model BasePSS "Base model for PSSs from PSSE"
  Modelica.Blocks.Interfaces.RealInput V_S2 "PSS input signal 2" annotation (Placement(transformation(extent={{-240,-60},{-200,-20}}), iconTransformation(extent={{-120,-50},{-100,-30}})));
  Modelica.Blocks.Interfaces.RealInput V_S1 "PSS input signal 1" annotation (Placement(transformation(extent={{-240,20},{-200,60}}), iconTransformation(extent={{-120,30},{-100,50}})));
  Modelica.Blocks.Interfaces.RealOutput VOTHSG "PSS output" annotation (Placement(transformation(extent={{200,-10},{220,10}}),
                                                                                                                             iconTransformation(extent={{100,-10},{120,10}})));
  annotation (Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255}),
                              Text(
          extent={{-90,60},{-60,20}},
          lineColor={28,108,200},
          textString="V_S1"),  Text(
          extent={{-90,-20},{-60,-60}},
          lineColor={28,108,200},
          textString="V_S2"),Text(
          extent={{40,20},{90,-20}},
          lineColor={28,108,200},
          textString="VOTHSG")}),
                              Diagram(coordinateSystem(preserveAspectRatio=false,
                   extent={{-200,-80},{200,80}})));
end BasePSS;
