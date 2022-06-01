within OpenIPSL.Electrical.ThreePhase.Buses;
model InfiniteBus "Three-phase infinite bus"
  extends ThreePhaseComponent;
  parameter Types.Voltage V_b=400e3
    "Base voltage of the bus"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit V_A=1
    "Voltage magnitude for phase A"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle angle_A = 0 "Voltage angle for phase A"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit V_B=1 "Voltage magnitude for phase B"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle angle_B = -2*C.pi/3 "Voltage angle for phase B"
    annotation (Dialog(group="Power flow data"));
  parameter Types.PerUnit V_C=1 "Voltage magnitude for phase C"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Angle angle_C= 2*C.pi/3 "Voltage angle for phase C"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ActivePower P_A=1e6
    "Initial active power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ReactivePower Q_A=0
    "Initial reactive power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ActivePower P_B=1e6
    "Initial active power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ReactivePower Q_B=0
    "Initial reactive power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ActivePower P_C=1e6
    "Initial active power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.ReactivePower Q_C=0
    "Initial reactive power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Frequency fn=SysData.fn
    "System frequency"
    annotation (Dialog(group="Power flow data", enable=false));
  OpenIPSL.Interfaces.PwPin p1
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
  OpenIPSL.Interfaces.PwPin p2
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  OpenIPSL.Interfaces.PwPin p3
    annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  Types.ActivePower Pa "Active Power supplied by the Infinite bus (phase a)";
  Types.ReactivePower Qa "Reactive Power supplied by the Infinite bus (phase a)";
  Types.ActivePower Pb "Active Power supplied by the Infinite bus (phase b)";
  Types.ReactivePower Qb "Reactive Power supplied by the Infinite bus (phase b)";
  Types.ActivePower Pc "Active Power supplied by the Infinite bus (phase c)";
  Types.ReactivePower Qc "Reactive Power supplied by the Infinite bus (phase c)";
equation
  // Equations for Phase A
  p1.vr = V_A*cos(angle_A);
  p1.vi = V_A*sin(angle_A);
  Pa = -(p1.vr*p1.ir + p1.vi*p1.ii)*S_p;
  Qa = -(p1.vr*p1.ii - p1.vi*p1.ir)*S_p;
  // Equations for Phase B
  p2.vr = V_B*cos(angle_B);
  p2.vi = V_B*sin(angle_B);
  Pb = -(p2.vr*p2.ir + p2.vi*p2.ii)*S_p;
  Qb = -(p2.vr*p2.ii - p2.vi*p2.ir)*S_p;
  // Equations for Phase C
  p3.vr = V_C*cos(angle_C);
  p3.vi = V_C*sin(angle_C);
  Pc = -(p3.vr*p3.ir + p3.vi*p3.ii)*S_p;
  Qc = -(p3.vr*p3.ii - p3.vi*p3.ir)*S_p;
  annotation (Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        grid={10,10}), graphics={Rectangle(
          fillColor={255,255,255},
          extent={{-100,-100},{100,100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Solid),Line(points={{34,86},{82,86},{74,92}},
          color={0,0,0}),Text(
          extent={{14,84},{102,38}},
          lineColor={238,46,47},
          textString=DynamicSelect("0.0", String(P, significantDigits=2))),Line(
          points={{32,-54},{80,-54},{72,-48}}, color={0,0,0}),Text(
          extent={{12,-54},{100,-100}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0", String(Q, significantDigits=2))),Line(
          points={{40,-48},{40,-60}}, color={0,0,0}),Line(points={{80,-54},{72,
          -60}}, color={0,0,0}),Line(points={{82,86},{74,80}}, color={0,0,0})}),
            Documentation(info="<html>
<p>This is a three-phase infinite bus model.</p>
<p>An infinite bus represents a very strong system. This means that no matter how much power is drained from or injected in it, the bus will keep the values of frequency, voltage magnitude and voltage angle constant.</p>
<p>The infinite bus also provides the angle references that can be used in coherency studies or in power flow results.</p>
</html>"));
end InfiniteBus;
