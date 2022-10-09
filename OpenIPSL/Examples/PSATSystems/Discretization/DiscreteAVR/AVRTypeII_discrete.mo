within OpenIPSL.Examples.PSATSystems.Discretization.DiscreteAVR;
model AVRTypeII_discrete "Discretized PSAT Exciter Type 2"
  parameter Real vrmin=0 "Minimum regulator voltage, p.u";
  parameter Real vrmax=7.57 "Maximum regulator voltage, p.u";
  parameter Real Ka=7.04 "Amplifier gain, p.u/p.u";
  parameter Real Ta=0.4 "Amplifier time constant, s";
  parameter Real Kf=1 "Stabilizer gain, p.u/p.u";
  parameter Real Tf=0.05 "Stabilizer time constant, s";
  parameter Real Ke=1 "Field circuit integral deviation, p.u/p.u";
  parameter Real Te=0.4 "Field circui time constant, s";
  parameter Real Tr=0.05 "Measurement time constant, s";
  parameter Real Ae=0 "1st ceiling coefficient";
  parameter Real Be=0 "2nd ceiling coefficient";
  parameter Real v0=1 "Initialization";
  parameter Real vref0=1.9832 "Initialization";
  parameter Real vf0=1.0442 "Initialization";
  parameter Real vm0=v0 "Initialization";
  parameter Real vr10=Ka*(vref0 - vm0 - vr20 - vf0*Kf/Tf) "Initialization";
  parameter Real vr20=-vf0*Kf/Tf "Initialization";
  parameter Real e=Modelica.Constants.e;
  Real Se;
  Real vm(start=vm0, fixed=true);
  Real vr1(start=vr10, fixed=true);
  Real vr2(start=vr20, fixed=true);
  Real vr;
  Modelica.Blocks.Interfaces.RealInput vref
    "Connector of clocked, Real input signal" annotation (Placement(
        transformation(extent={{-140,40},{-100,80}}),
        iconTransformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput v
    "Connector of clocked, Real input signal" annotation (Placement(
        transformation(extent={{-140,-80},{-100,-40}}),
        iconTransformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput vf(start=vf0)
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  vm = previous(vm) + (v - vm)/Tr;
  vr1 = previous(vr1) + (Ka*(vref - vm - vr2 - vf*Kf/Tf) - vr1)/Ta;
  if vr1 >= vrmin and vr1 <= vrmax then
    vr = vr1;
  elseif vr1 > vrmax then
    vr = vrmax;
  else
    vr = vrmin;
  end if;
  vr2 = previous(vr2) - (vf*Kf/Tf + vr2)/Tf;
  vf = previous(vf) - (vf*(Ke + Se) - vr)/Te;
  Se = Ae*e^(Be*abs(vf));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-96,72},{-64,50}},
          textColor={0,0,255},
          textString="vref"),Text(
          extent={{-104,-48},{-72,-70}},
          textColor={0,0,255},
          textString="v"),Text(
          extent={{70,10},{102,-12}},
          textColor={0,0,255},
          textString="vf"),Text(
          extent={{-38,46},{38,-14}},
          textColor={0,0,255},
          textString="Discrete
AVR2")}),
    Documentation(info="<html>
<p>This AVR model is supposed to represent the Type 2 from PSAT. However, differently from the model that is found in the main body of the library, this AVR has a discrete implementation.</p>
</html>"));
end AVRTypeII_discrete;
