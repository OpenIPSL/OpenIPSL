within OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses;
model SelectLogic
  "Selection of voltage signal depending on the Excitation limiters"
  Modelica.Blocks.Interfaces.RealInput V1
    annotation (Placement(transformation(extent={{-138,40},{-98,80}})));
  Modelica.Blocks.Interfaces.RealInput V2
    annotation (Placement(transformation(extent={{-138,-20},{-98,20}})));
  Modelica.Blocks.Interfaces.RealInput V3
    annotation (Placement(transformation(extent={{-138,-80},{-98,-40}})));
  Modelica.Blocks.Interfaces.RealInput VOEL annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-60,96}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-60,112})));
  Modelica.Blocks.Interfaces.RealInput VUEL annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,96}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,112})));
  Modelica.Blocks.Interfaces.RealInput VERR annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,96}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,112})));
  Modelica.Blocks.Interfaces.RealOutput Vout
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
equation
  Vout = if VOEL > 0 then V3 else if VUEL > 0 then V2 else V1;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Text(
          extent={{-42,54},{38,-48}},
          textColor={0,0,255},
          textString="Select
Logic"),Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255})}));
end SelectLogic;
