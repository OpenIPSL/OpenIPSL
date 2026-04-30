within OpenIPSL.Electrical.CustomMe;

model FFT_Dominant
    
  Modelica.Blocks.Interfaces.RealOutput f "Measured frequency Hz [Hz]" annotation(
    Placement(transformation(origin = {0, -60}, extent = {{100, 50}, {120, 70}}), iconTransformation(origin = {0, -60}, extent = {{100, 50}, {120, 70}})));

protected
  Modelica.Blocks.Interfaces.RealOutput output_value_save;
            
equation
  connect(output_value_save, f) "Connect to frequency output";
  output_value_save=1;
  

  annotation(
    Diagram(graphics = {Rectangle(origin = {3, -2}, extent = {{-51, 50}, {51, -50}}), Text(origin = {1, -1}, extent = {{-37, 15}, {37, -15}}, textString = "Freq measure", fontSize = 16)}));
end FFT_Dominant;