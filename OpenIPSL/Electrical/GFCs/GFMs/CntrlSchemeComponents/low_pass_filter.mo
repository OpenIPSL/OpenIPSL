within OpenIPSL.Electrical.GFCs.GFMs.CntrlSchemeComponents;
model low_pass_filter
  "Low pass filter used by multiple components within the package"
  import Modelica;
  parameter Real Tr = 0.01 "Filter time constant. Range: [0.01 - 0.1 sec.]";
  parameter Real y0val = 40.0/100 "Output value at initialization in pu (System Base), e.g. Pout = 40.0/100 ";
  Modelica.Blocks.Continuous.TransferFunction lfp(
    a={Tr,1},
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=y0val)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealInput u "Input signal"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y "Output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(lfp.u, u)
    annotation (Line(points={{-12,0},{-120,0}}, color={0,0,127}));
  connect(lfp.y, y) annotation (Line(points={{11,0},{110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=1),
        Text(
          extent={{-60,40},{60,-40}},
          textColor={28,108,200},
          textString="LFP"),
        Text(
          extent={{-100,162},{100,102}},
          textColor={28,108,200},
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)),preferredView="diagram");
end low_pass_filter;
