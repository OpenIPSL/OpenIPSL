within OpenIPSL.Electrical.Machines.PSAT;
model Order3 "Third Order Synchronous Machine with Inputs and Outputs"
  extends BaseClasses.baseMachine(vf(start=vf00), xq0=xq);
  parameter Types.PerUnit xd "d-axis synchronous reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.Time T1d0 "d-axis open circuit transient time constant"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit xq "q-axis synchronous reactance"
    annotation (Dialog(group="Machine parameters"));
  Types.PerUnit e1q(start=e1q0) "q-axis transient voltage";

protected
  parameter Real K=1/(ra^2 + xq*x1d) "a constant for scaling";
  parameter Real c1=ra*K "scaled ra";
  parameter Real c2=x1d*K "scaled x'd";
  parameter Real c3=xq*K " scaled xq";
  parameter Types.PerUnit vf00=V_MBtoSB*(e1q0 + (xd - x1d)*id0) "Inititial value (system base)";
  parameter Real e1q0=vq0 + ra*iq0 + x1d*id0 "Initialization";
initial equation
  der(e1q) = 0;
equation
  der(e1q) = ((-e1q) - (xd - x1d)*id + vf_MB)/T1d0;
  id = (-c1*vd) - c3*vq + e1q*c3;
  iq = c2*vd - c1*vq + e1q*c1;
  vf0 = vf00;
  annotation (Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(
          origin={0,60},
          extent={{-60,-20},{60,20}},
          lineColor={28,108,200},
          textString="Order III")}), Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>September 2015</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Joan Russinol, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end Order3;
