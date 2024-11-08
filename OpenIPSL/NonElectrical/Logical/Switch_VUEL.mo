within OpenIPSL.NonElectrical.Logical;
model Switch_VUEL "Switch of a Real input between two outputs"
  extends Modelica.Blocks.Icons.PartialBooleanBlock;
  parameter Integer n;
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y1
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput y2
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
equation
  y1 = if n==1 then u else 0;
  y2 = if n==2 then u else -Modelica.Constants.inf;
  annotation (Icon(graphics={Text(
          extent={{116,94},{160,64}},
          lineColor={28,108,200},
          textString="1"), Text(
          extent={{118,-26},{162,-56}},
          lineColor={28,108,200},
          textString="2")}));
end Switch_VUEL;
