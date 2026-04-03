within OpenIPSL.Electrical.CustomMe;

model FFT_Dominant
  //OpenIPSL.Interfaces.PwPin p annotation(
  //  Placement(transformation(origin = {30, 0}, extent = {{-120, -10}, {-100, 10}}), iconTransformation(origin = {30, 30}, extent = {{-120, -10}, {-100, 10}})));
  Modelica.Blocks.Interfaces.RealOutput f "Measured frequency Hz [Hz]" annotation(
    Placement(transformation(origin = {0, -60}, extent = {{100, 50}, {120, 70}}), iconTransformation(origin = {-54, -72}, extent = {{100, 50}, {120, 70}})));
  Real dom_frequency[3];
  Real dom_angles[3];
  //Real store_pvi;
  //Real store_pvr;
protected
  Modelica.Blocks.Interfaces.RealOutput output_value;
equation
  connect(output_value, f);
  dom_frequency[1] = 50;
  dom_frequency[2] = 50;
  dom_frequency[3] = 50;
  dom_angles[1] = 0;
  dom_angles[2] = 0;
  dom_angles[3] = 0;
//store_pvi = p.vi;
//store_pvr = p.vr;
  output_value = dom_frequency[1];
//TODO: integrate the below function in!
//Modelica.Math.FastFourierTransform.realFFT(meas_signal);
// and measure frequency
  annotation(
    Diagram(graphics = {Rectangle(origin = {-21, 0}, extent = {{-49, 48}, {49, -48}}), Text(origin = {-19, -1}, extent = {{-37, 15}, {37, -15}}, textString = "FFT", fontSize = 16)}));
end FFT_Dominant;