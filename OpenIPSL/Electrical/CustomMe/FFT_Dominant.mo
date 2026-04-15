within OpenIPSL.Electrical.CustomMe;

model FFT_Dominant
  Modelica.Blocks.Interfaces.RealOutput f "Measured frequency Hz [Hz]" annotation(
    Placement(transformation(origin = {0, -60}, extent = {{100, 50}, {120, 70}}), iconTransformation(origin = {0, -60}, extent = {{100, 50}, {120, 70}})));
  Real dom_frequency[3];
  Real dom_angles[3];
  //Real store_pvi "To be implemented";
  //Real store_pvr "To be implemented";
protected
  Modelica.Blocks.Interfaces.RealOutput output_value;
equation
  connect(output_value, f);
  dom_frequency[1] = 50/50;
// make pu
  dom_frequency[2] = 50;
  dom_frequency[3] = 50;
  dom_angles[1] = 0;
  dom_angles[2] = 0;
  dom_angles[3] = 0;
//store_pvi = p.vi "To be implemented";
//store_pvr = p.vr "To be implemented";
  output_value = dom_frequency[1];
//TODO: integrate the below function in!
//Modelica.Math.FastFourierTransform.realFFT(meas_signal);
//and measure frequency
//Intended to provide alternate measurement of frequency at the node rather than relying on the base system frequency.
  annotation(
    Diagram(graphics = {Rectangle(origin = {3, -2}, extent = {{-51, 50}, {51, -50}}), Text(origin = {1, -1}, extent = {{-37, 15}, {37, -15}}, textString = "Freq measure", fontSize = 16)}));
end FFT_Dominant;