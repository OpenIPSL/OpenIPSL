within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.BasicComponentsAndCntrlSchemes;
model LPFilter
  "Low pass filter used by multiple components within the package based on MSL components"
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
        coordinateSystem(preserveAspectRatio=false)),preferredView="diagram",
    Documentation(info="<html>
Low-pass filter model built using the <code>Modelica.Blocks.Continuous.TransferFunction</code> block from the MSL.

The numerator is set to <code>b=1</code>. The denominator is set to <code>{Tr,1}</code> where <code>Tr</code> is the time constant of the filter.
The model is set to initialize with the option \"Initial Output\", the value of the initial outpu is <code>y0val</code>, which is propagted. This is later set by the P-f or Q-v control schemes to match the value of the active or reactive power that has been determined by the voltage source.
</html>"));
end LPFilter;
