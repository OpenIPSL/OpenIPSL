within OpenIPSL.Electrical.Loads.NoiseInjections;
model WienerProcessInjection "Load with white gaussian noise injection using Wiener process"
  extends BaseClass;

initial equation
  y = 0;

equation
  der(y) = noise_gen.y;
end WienerProcessInjection;
