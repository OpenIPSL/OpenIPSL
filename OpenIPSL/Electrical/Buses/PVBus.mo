within OpenIPSL.Electrical.Buses;
model PVBus
  "PV bus: constant active power and terminal voltage magnitude, reactive power free (a PV generator without machine data, as PSAT simulates it)"
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enabledisplayPF=true,
    final enablefn=false,
    final enableV_b=false,
    final enableangle_0=true,
    final enablev_0=true,
    final enableQ_0=true,
    final enableP_0=true,
    final enableS_b=true);
  OpenIPSL.Interfaces.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir0),
    ii(start=ii0)) "Terminal"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  OpenIPSL.Types.PerUnit P(start=P_0/S_b) "Active power injected into the network (system base)";
  OpenIPSL.Types.PerUnit Q(start=Q_0/S_b) "Reactive power injected into the network (system base)";
protected
  parameter OpenIPSL.Types.PerUnit vr0=v_0*cos(angle_0) "Real part of the power flow voltage";
  parameter OpenIPSL.Types.PerUnit vi0=v_0*sin(angle_0) "Imaginary part of the power flow voltage";
  parameter OpenIPSL.Types.PerUnit ir0=-(P_0/S_b*vr0 + Q_0/S_b*vi0)/v_0^2
    "Real part of the power flow current into the pin";
  parameter OpenIPSL.Types.PerUnit ii0=-(P_0/S_b*vi0 - Q_0/S_b*vr0)/v_0^2
    "Imaginary part of the power flow current into the pin";
equation
  P = -(p.vr*p.ir + p.vi*p.ii) "Active power injected; the pin current is positive into the bus";
  Q = p.vr*p.ii - p.vi*p.ir "Reactive power injected";
  P = P_0/S_b "Active power held at its power flow value";
  v_0 = sqrt(p.vr^2 + p.vi^2) "Terminal voltage magnitude held at its power flow value";
  annotation (
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        grid={2,2}), graphics={Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,0},
          fillColor={241,241,241},
          fillPattern=FillPattern.Solid),Text(
          extent={{-80,40},{80,-40}},
          textColor={0,0,255},
          textString="PV"),Text(
          visible=displayPF,
          extent={{-80,100},{80,60}},
          textColor={255,0,0},
          textString=DynamicSelect("0.0 MW",
            OpenIPSL.NonElectrical.Functions.displayPower(P*S_b, " MW"))),Polygon(
          visible=displayPF,
          points=DynamicSelect({{-20,58},{-20,44},{20,51},{-20,58}}, if P >= 0
             then {{-20,58},{-20,44},{20,51},{-20,58}} else {{20,58},{20,44},{-20,
            51},{20,58}}),
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),Text(
          visible=displayPF,
          extent={{-80,-46},{80,-100}},
          textColor={170,85,255},
          textString=DynamicSelect("V pu",
            String(sqrt(p.vr^2 + p.vi^2), significantDigits=4) + " pu")),Text(
          extent={{-100,160},{100,120}},
          textColor={0,0,255},
          textString="%name")}),
    Documentation(info="<html>
<p>PV bus model as implemented in PSAT for time domain simulation. When performing time domain simulations in PSAT, if a dynamic component is not declared along a PV bus, PSAT will model the following behavior in time domain: the active power injected is held at <code>P_0</code> and the terminal voltage magnitude at <code>v_0</code>. Meanwhile, the reactive power is computed to provide whatever the network needs, without limits. These are PSAT&apos;s two equations for such a bus (<code>PVclass</code>, <code>gcall</code> and <code>Gycall</code>, with <code>Settings.pv2pq = 0</code>, the default). The model has no states and no internal variables: two equations on the pin, which starts at its power flow voltage and current. <a href=\"modelica://OpenIPSL.Electrical.Buses.InfiniteBus\">InfiniteBus</a> holds the voltage magnitude and angle instead; this bus holds the magnitude and the active power.</p>
<p><b>Note:</b> If a model includes only PV buses and an infinite bus, a network has no states, and after an abrupt event (e.g., fault) its algebraic equations can have several solutions; which one a tool reaches then depends on its iteration variables. To address this issue, the companion component <a href=\"modelica://OpenIPSL.Electrical.Events.PwFaultSmooth\">PwFaultSmooth</a> clears a fault so that the solution is followed continuously. It is recommended you replace <a href=\"modelica://OpenIPSL.Electrical.Events.PwFault\">PwFault</a> with the companion <a href=\"modelica://OpenIPSL.Electrical.Events.PwFaultSmooth\">PwFaultSmooth</a>, except for a bolted fault (R = X = 0), which PwFaultSmooth does not allow.</p>
<p>With <code>displayPF = true</code> the icon shows the active power injected, in MW, with an arrow for its direction, and the terminal voltage magnitude in pu, as <a href=\"modelica://OpenIPSL.Electrical.Buses.InfiniteBus\">InfiniteBus</a> shows its power flow.</p>
</html>"));
end PVBus;
