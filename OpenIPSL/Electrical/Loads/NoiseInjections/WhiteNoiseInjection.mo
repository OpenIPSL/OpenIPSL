within OpenIPSL.Electrical.Loads.NoiseInjections;
model WhiteNoiseInjection "Load with direct white gaussian noise injection"
  extends BaseClass(noise_gen(startTime=0.1));

equation
  y = noise_gen.y;
end WhiteNoiseInjection;
