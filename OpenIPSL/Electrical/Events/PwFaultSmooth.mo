within OpenIPSL.Electrical.Events;
model PwFaultSmooth
  "Shunt fault applied at t1 and cleared from t2 on with its admittance decaying as exp(-(time - t2)/Tc)"
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(extent={{-80,-10},{-60,10}}),
        iconTransformation(extent={{-80,-10},{-60,10}})));
  parameter OpenIPSL.Types.PerUnit R = 1e-5 "Resistance";
  parameter OpenIPSL.Types.PerUnit X = 1e-3 "Reactance";
  parameter OpenIPSL.Types.Time t1 = 5   "Start time of the fault";
  parameter OpenIPSL.Types.Time t2 = 5.6 "Start of the clearing";
  parameter OpenIPSL.Types.Time Tc=1e-4 "Time constant of the clearing";
  Real k(start=0, fixed=true) "Fraction of the fault admittance connected; keep its start value at 0 (see Documentation)";
initial equation
  assert(R*R + X*X > 0, "PwFaultSmooth needs a fault impedance R + jX other than zero; use PwFault for a bolted fault");
  assert(Tc > 0, "PwFaultSmooth needs a clearing time constant Tc > 0");
  assert(t2 > t1, "PwFaultSmooth needs t2 > t1: the clearing starts after the fault is applied");
equation
  der(k) = if time < t2 then 0 else -k/Tc "Held while the fault is on, then decays";
  assert(not initial() or t1 > time, "PwFaultSmooth applies its fault by an event at t1, so t1 must be after the start time of the simulation");
  when time >= t1 then
    reinit(k, 1);
  end when;
  p.ir = k*(R*p.vr + X*p.vi)/(R*R + X*X) "Real part of the fault current";
  p.ii = k*(R*p.vi - X*p.vr)/(R*R + X*X) "Imaginary part of the fault current";
  annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-60,-60},{60,60}}),
      graphics={Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
        Rectangle(extent={{-20,10},{20,-10}},
                                            lineColor={0,0,255},
                                                               fillColor={215,215,
              215},
          fillPattern=FillPattern.Solid,
          radius=2.5),
        Line(points={{20,0},{40,0},{40,-40}},   color={0,0,255},
          smooth=Smooth.Bezier),
        Line(points={{28,-44},{52,-44}}, color={0,0,255}),
        Line(points={{30,-48},{50,-48}}, color={0,0,255}),
        Line(points={{34,-52},{48,-52}}, color={0,0,255}),
        Line(points={{36,-56},{44,-56}}, color={0,0,255}),
        Rectangle(extent={{-30,2},{-20,-2}},  lineColor={0,0,255},
                                                                 fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          radius=0.5),
        Line(points={{-4,20},{6,-4},{-10,2},{4,-22}},    color={255,0,0}, thickness=0.5,
          smooth=Smooth.Bezier),
        Text(extent={{-110,110},{110,70}}, textColor={0,0,255}, textString="%name"),
                         Line(
          points={{-2,-20},{4,-22},{4,-16}},
          color={255,0,0},
          smooth=Smooth.None)}),
    Documentation(info="<html>
<p>This model provides a dynamic alternative to the shunt fault model <a href=\"modelica://OpenIPSL.Electrical.Events.PwFault\">PwFault</a>. The fault can be applied at <code>t1</code> and cleared from <code>t2</code> on by an exponential decay of its admittance with time constant <code>Tc</code> instead of a &quot;jump&quot;, i.e. instead of an algebraic transition as in <a href=\"modelica://OpenIPSL.Electrical.Events.PwFault\">PwFault</a>. The fraction <code>k</code> of the admittance that is connected is a state, so the integrator follows the clearing in small steps and the solve after the clearing tracks the network&apos;s solution continuously from the faulted point.</p>
<p>Use it where the network has almost no states (e.g., when using the <a href=\"modelica://OpenIPSL.Electrical.Buses.PVBus\">PVBus</a> models in a network with an infinite bus): there the algebraic equations after an abrupt clearing, as applied by <a href=\"modelica://OpenIPSL.Electrical.Events.PwFault\">PwFault</a>,
can have many exact solutions, and the one a tool reaches from the faulted point depends on the variables it iterates on. PSAT restarts that solve from the pre-fault voltages; in the cases where this clearing was tested (PSAT&apos;s <code>d_014_statcom</code> and <code>d_014_twt</code>, with PV buses around an infinite bus), it reaches PSAT&apos;s solution in Dymola, OpenModelica and System Modeler. A bolted fault (R = X = 0) is not possible here; use PwFault.</p>
<p>The parameters are checked at initialization: <code>t1</code> must be after the start time of the simulation (the fault is applied by an event at <code>t1</code>, which does not occur when the run starts at or after <code>t1</code>), <code>t2</code> after <code>t1</code>, and <code>Tc</code> positive (zero divides by zero at <code>t2</code>, a negative value makes the fault grow).</p>
<p><strong>Note:</strong> Observe that with <code>Tc=1e-4</code>, after 20 <code>Tc</code>, that is 2 ms, the dynamics will have largely settled, with less than 1e-8 of the admittance left.</p>
<p><strong>Note on the start value of <code>k</code>:</strong> keep it at 0, the default. <code>k</code> is the fraction of
the fault admittance that is connected, and it is a state that starts at its start value (<code>fixed=true</code>)
and stays there until <code>t1</code>, where it is set to 1. Its start value therefore applies from time 0, not
only during the fault. With 0 no fault admittance is connected before <code>t1</code>, so the network starts at
the power flow solution its components were initialised for. Any other value connects that fraction of the fault
from time 0: the voltages before the fault are not the power flow voltages, and the run starts on another
operating point. Even a small value matters, because the fault admittance is large: in
<a href=\"modelica://OpenIPSL.Tests.Buses.PVBus_SMIBPSAT_SmoothFault\">Tests.Buses.PVBus_SMIBPSAT_SmoothFault</a>
(<code>X = 0.001</code> pu) a start value of 0.01 holds bus <code>FAULT</code> at 0.60 pu instead of 0.996 pu
before the fault. A start value of 1 is the value <code>k</code> is set to at <code>t1</code>: the whole fault is
then on from time 0 (bus <code>FAULT</code> at 0.015 pu), as if <code>t1</code> were 0.</p>
<p><strong>Note:</strong> Because <code>k</code> is a state, a linearisation of a model with this fault shows one more eigenvalue, at 0 (its derivative is 0 before the clearing).</p>
</html>"));
end PwFaultSmooth;
