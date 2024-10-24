within OpenIPSL.Electrical.Controls.VariableSpeedDrive.PowerElectronics;
model AC2DCandDC2AC "Phasor based voltage source converter model."
   extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enabledisplayPF=false,
    final enablefn=false,
    final enableV_b=false,
    final enableangle_0=true,
    final enableP_0 = false,
    final enableQ_0=false,
    final enablev_0=true,
    final enableS_b=true);

    import Modelica.Constants.eps;
    import Modelica.Constants.pi;
  OpenIPSL.Interfaces.PwPin p "Grid side pin"
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}}),
        iconTransformation(extent={{-110,-10},{-90,10}})));
  OpenIPSL.Interfaces.PwPin n "Motor side pin" annotation (Placement(transformation(extent={{90,-10},
            {110,10}}), iconTransformation(extent={{90,-10},{110,10}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage Voltage "DC voltage source" annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-46,-14})));
  Modelica.Blocks.Sources.RealExpression Vd0(y=3*sqrt(6)*Vs.y*(V_b)/Modelica.Constants.pi) "DC voltage after converter stage"
                                             annotation (Placement(transformation(extent={{-84,-24},
            {-64,-4}})));
  Modelica.Electrical.Analog.Basic.Resistor Resistor(R=Rdc) "DC link resistor"
    annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
  Modelica.Electrical.Analog.Basic.Inductor Inductor(i(start=Il0, fixed=false),
                                                     L=Ldc) "DC link inductor"
    annotation (Placement(transformation(extent={{-16,-10},{4,10}})));
  Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch switch(Ron=1e-5, Goff=1e-5) "Switch enforcing no inverse current flow in DC link"
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Electrical.Analog.Basic.Capacitor Capacitor(v(start=Vc0, fixed=true),
                                                                     C=Cdc) "DC link capacitor"
                                                               annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,-14})));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent "Current drawn source" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,-14})));
  Modelica.Blocks.Sources.RealExpression Ii(y=Pmotor.y*S_b/Capacitor.v) "Current drawn expression"
                                                               annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={78,-14})));
  Modelica.Blocks.Sources.RealExpression Vs(y=sqrt(p.vr^2 + p.vi^2)) "Inverter side voltage magnitude"
    annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
  Modelica.Blocks.Sources.BooleanExpression open_circuit_condition(y=if
        Resistor.i < 0 then true else false) "Boolean expression for boolean switch to block current from flowing the opposite direction "
    annotation (Placement(transformation(extent={{52,6},{32,26}})));
  Modelica.Blocks.Sources.RealExpression Pmotor(y=-(n.vr*n.ir + n.vi*n.ii)) "Active power for drawn motor current"
    annotation (Placement(transformation(extent={{24,70},{44,90}})));
  Modelica.Blocks.Sources.RealExpression Qmotor(y=n.vr*n.ii - n.vi*n.ir) "Reactive power for drawn motor current"
    annotation (Placement(transformation(extent={{24,54},{44,74}})));
  OpenIPSL.Types.PerUnit P "Active Power";
  Modelica.Units.SI.ActivePower Pdc "DC Circuit Active Power";
  OpenIPSL.Types.PerUnit Q "Reactive Power";
  OpenIPSL.Types.PerUnit S "Apparent Power";

  Modelica.Blocks.Sources.RealExpression Vmotor(y=Capacitor.v*m_input/(2*sqrt(2)
        *V_b)) "Motor terminal voltage"
    annotation (Placement(transformation(extent={{24,38},{44,58}})));
  Modelica.Blocks.Interfaces.RealInput m_input "PWM modulation index input" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={60,-120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={60,-120})));
  Modelica.Blocks.Sources.RealExpression vr_m(y=Vmotor.y*cos(0)) "Motor real current"
    annotation (Placement(transformation(extent={{62,70},{82,90}})));
  Modelica.Blocks.Sources.RealExpression vi_m(y=Vmotor.y*sin(0)) "Motor imaginary current"
    annotation (Placement(transformation(extent={{62,54},{82,74}})));
  Modelica.Electrical.Analog.Basic.Ground ground "Electrical ground"
    annotation (Placement(transformation(extent={{-14,-50},{6,-30}})));

  Modelica.Blocks.Interfaces.RealOutput Vc "Value of Real output" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,-110}), iconTransformation(
        extent={{-18.1811,-18.1819},{21.819,-58.1819}},
        rotation=270,
        origin={-21.8181,-118.181})));
  parameter Modelica.Units.SI.Resistance Rdc=0.1
    "DC link resistance"
    annotation (Dialog(group="DC Link Parameters"));
  parameter Modelica.Units.SI.Inductance Ldc=0.001
    "DC link inductance"
    annotation (Dialog(group="DC Link Parameters"));
  parameter Modelica.Units.SI.Capacitance Cdc=0.02
    "DC link capacitance"
    annotation (Dialog(group="DC Link Parameters"));
  parameter Real m0= 0.1 "Initial PWM modulation value" annotation (Dialog(group="DC Link Parameters"));
  Modelica.Blocks.Sources.RealExpression Smotor(y=sqrt(Pmotor.y^2 + Qmotor.y^2)) "Motor apparent power"
    annotation (Placement(transformation(extent={{62,38},{82,58}})));

protected
  parameter OpenIPSL.Types.Voltage Vc0 = 2*sqrt(2)*Vmotor0*V_b/m0 "Initial capacitor voltage";
  parameter OpenIPSL.Types.Current Il0 = 0 "Initial inductor current";
  parameter OpenIPSL.Types.PerUnit Vmotor0 = (3*sqrt(3)/(2*pi))*m0 "Initial terminal voltage";

  Modelica.Blocks.Sources.RealExpression Capacitor_Voltage(y=Capacitor.v) "Capacitor voltage"
    annotation (Placement(transformation(extent={{-84,-84},{-64,-64}})));

equation
  connect(Vd0.y, Voltage.v)
    annotation (Line(points={{-63,-14},{-58,-14}}, color={0,0,127}));
  connect(Voltage.p, Resistor.p)
    annotation (Line(points={{-46,-4},{-46,0},{-42,0}},      color={0,0,255}));
  connect(Resistor.n, Inductor.p)
    annotation (Line(points={{-22,0},{-16,0}},     color={0,0,255}));
  connect(Inductor.n, switch.p)
    annotation (Line(points={{4,0},{10,0}},     color={0,0,255}));
  connect(switch.n, Capacitor.p)
    annotation (Line(points={{30,0},{30,-4}},    color={0,0,255}));
  connect(Voltage.n, Capacitor.n) annotation (Line(points={{-46,-24},{-46,-28},{
          30,-28},{30,-24}}, color={0,0,255}));
  connect(switch.n, signalCurrent.p) annotation (Line(points={{30,0},{50,0},{50,
          -4}},                                                                            color={0,0,255}));
  connect(signalCurrent.n, Capacitor.n) annotation (Line(points={{50,-24},{50,-28},
          {30,-28},{30,-24}}, color={0,0,255}));
  connect(signalCurrent.i, Ii.y) annotation (Line(points={{62,-14},{67,-14}}, color={0,0,127}));
  connect(open_circuit_condition.y, switch.control)
    annotation (Line(points={{31,16},{20,16},{20,12}},    color={255,0,255}));
    P =  p.vr*p.ir + p.vi*p.ii;
    Q = (-p.vr*p.ii) + p.vi*p.ir;
    Q = 0;
    S = sqrt(P^2 + Q^2);
    Pdc = Vd0.y*Resistor.i;
    P*S_b = Pdc;

    n.vr = vr_m.y;
    n.vi = vi_m.y;
  connect(ground.p, Capacitor.n) annotation (Line(points={{-4,-30},{-4,-28},{30,
          -28},{30,-24}},
                     color={0,0,255}));
  connect(Capacitor_Voltage.y, Vc) annotation (Line(points={{-63,-74},{-50,-74},
          {-50,-110}}, color={0,0,127}));
  annotation (preferredView = "info",Icon(
        graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200}),
        Line(points={{-100,-100},{100,100}}, color={28,108,200}),
        Text(
          extent={{-90,80},{30,20}},
          textColor={28,108,200},
          textString="AC/DC"),
        Text(
          extent={{-30,-20},{90,-80}},
          textColor={28,108,200},
          textString="DC/AC")}),                                                                 Diagram( graphics={Rectangle(
          extent={{14,90},{94,40}},
          lineColor={0,0,255},
          pattern=LinePattern.Dash), Text(
          extent={{24,98},{84,92}},
          lineColor={0,0,255},
          pattern=LinePattern.Dash,
          textString="Motor Variables"),                                                       Rectangle(
          extent={{-80,80},{-40,40}},
          lineColor={0,0,255},
          pattern=LinePattern.Dash), Text(
          extent={{-92,88},{-30,82}},
          lineColor={0,0,255},
          pattern=LinePattern.Dash,
          textString="Grid Variables"),                                                        Rectangle(
          extent={{-94,-54},{-54,-94}},
          lineColor={0,0,255},
          pattern=LinePattern.Dash), Text(
          extent={{-106,-46},{-44,-52}},
          lineColor={0,0,255},
          pattern=LinePattern.Dash,
          textString="DC Link Variables")}),
    Documentation(info="<html>
<p>The AC2DCandDC2AC component represents the power electronics component of the variable speed drive.
The model provides an interface between two terminals. Terminal pin p is related to the grid bus side and terminal pin n is related to the 
motor terminal bus. The model is an average representation of the switching components of a real variable speed drive, thus being ideal for long simulation durations on phasor dynamic simulations.</p>
<p>The model has one input and one output connectors. The m_input input connector represents the pwn modulation index, while the Vc output connector represents the capacitor voltage value used in the controller logic block.</p>
<p>The modelling of such devices is based, mainly, on the following reference:</p>
<ul>
<li>Panasetsky: Variable Speed Drive Modeling\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[Panasetsky2016]</a>,</li>
</ul>
</html>"));
end AC2DCandDC2AC;
