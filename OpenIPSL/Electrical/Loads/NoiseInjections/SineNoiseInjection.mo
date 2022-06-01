within OpenIPSL.Electrical.Loads.NoiseInjections;
model SineNoiseInjection "Load with noise and sine reference injection"
  extends BaseClass;
  parameter Real amplitude=1 "Amplitude of sine wave";
  parameter Types.Frequency freqHz(start=1) "Frequency of sine wave";
  parameter Types.Angle phase=0 "Phase of sine wave";
  parameter Real offset=0 "Offset of output signal";
  parameter Types.Time startTime=0
    "Output = offset for time < startTime";

  Modelica.Blocks.Sources.Sine sine(
    amplitude=amplitude,
    freqHz=freqHz,
    phase=phase,
    offset=offset,
    startTime=startTime)
    annotation (Placement(transformation(extent={{10,12},{30,32}})));
equation
  y = noise_gen.y + sine.y;
end SineNoiseInjection;
