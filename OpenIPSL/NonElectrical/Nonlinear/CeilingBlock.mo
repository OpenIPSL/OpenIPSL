within OpenIPSL.NonElectrical.Nonlinear;
block CeilingBlock
  "Implements the ceiling function primarily found inside AVRs."
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real Ae=0 "First ceiling coefficient";
  parameter Real Be=1 "Second ceiling coefficient";

equation
  y = (Ae*Modelica.Math.exp(Be*abs(u)))*u;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Text(
          extent={{-78,42},{72,-30}},
          textColor={28,108,200},
          textString="y=Ae*u*exp(Be|u|)")}));
end CeilingBlock;
