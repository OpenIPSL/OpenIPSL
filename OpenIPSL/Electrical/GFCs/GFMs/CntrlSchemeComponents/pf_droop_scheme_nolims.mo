within OpenIPSL.Electrical.GFCs.GFMs.CntrlSchemeComponents;
model pf_droop_scheme_nolims
  "P-f droop control scheme without Pmax/Pmin limiters"
  import Modelica;
  low_pass_filter Pfilt(Tr=Tr, y0val=P0)
    annotation (Placement(transformation(extent={{-180,-90},{-160,-70}})));
  pf_drp pfdroop(f0=f0, mp=mp)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Interfaces.RealInput Edelta0
    "Initial value of the internal angle from the voltage source" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={80,-220}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={80,-220})));
  Modelica.Blocks.Interfaces.RealOutput omega_droop
    "Speed output from the P-f droop controller"
    annotation (Placement(transformation(extent={{200,-90},{220,-70}}),
        iconTransformation(extent={{200,-90},{220,-70}})));
  Modelica.Blocks.Interfaces.RealOutput delta_droop
    "Desired internal angle from the P-f droop controller"
    annotation (Placement(transformation(extent={{200,70},{220,90}}),
        iconTransformation(extent={{200,70},{220,90}})));
  Modelica.Blocks.Interfaces.RealInput Pmeas
    "Value of the active power measurement"
    annotation (Placement(transformation(extent={{-240,-100},{-200,-60}}),
        iconTransformation(extent={{-240,-100},{-200,-60}})));
  Modelica.Blocks.Interfaces.RealInput Pref "Active power reference"
    annotation (Placement(transformation(extent={{-240,60},{-200,100}}),
        iconTransformation(extent={{-240,60},{-200,100}})));
  Modelica.Blocks.Sources.Constant Plimsig(k=0) "Active power limiter signal"
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Modelica.Blocks.Interfaces.RealInput Pout0
    "Initial value of the active power from the voltage source" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-80,-220}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-80,-220})));

  parameter Real f0=60 "Synchronous frequency, f0 = 60 Hz"
    annotation (Dialog(group="P-f droop controller parameters"));
  parameter Real mp=0.005 "P-f droop gain. Normal range: 0.005 - 0.05 pu."
    annotation (Dialog(group="P-f droop controller parameters"));
  parameter Real Tr=0.01 "Filter time constant, sec. Normal Range: [0.01 - 0.1 sec.]"
    annotation (Dialog(group="P-f droop controller parameters"));
protected
  parameter Real P0(fixed=false);
  parameter Real delta0(fixed=false);
initial equation
        delta0 = Edelta0 "Assign the value coming from the voltage source to the initial value of the internal angle delta0 used by the droop block";
    P0 = Pout0 "Assigne the value coming from the voltage source to the inital value of P0 used by the filter block";
equation
  connect(pfdroop.omega_droop, omega_droop) annotation (Line(points={{22,-12},
          {60,-12},{60,-80},{210,-80}},
                                    color={0,0,127}));
  connect(Pfilt.y, pfdroop.Pfilt) annotation (Line(points={{-159,-80},{-140,-80},
          {-140,-16},{-24,-16}},
                               color={0,0,127}));
  connect(Pfilt.u, Pmeas) annotation (Line(points={{-182,-80},{-220,-80}},
                       color={0,0,127}));
  connect(pfdroop.Pref, Pref)
    annotation (Line(points={{-24,0},{-40,0},{-40,80},{-220,80}},
                                                color={0,0,127}));
  connect(Plimsig.y,pfdroop. Plim_in)
    annotation (Line(points={{-19,-50},{-8,-50},{-8,-24}}, color={0,0,127}));
  connect(Edelta0, pfdroop.Edelta0) annotation (Line(points={{80,-220},{80,-180},
          {8,-180},{8,-24}},color={0,0,127}));
  connect(pfdroop.delta_droop, delta_droop)
    annotation (Line(points={{22,0},{120,0},{120,80},{210,80}},
                                              color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},
            {200,200}}),                                        graphics={
          Rectangle(
          extent={{-200,200},{200,-200}},
          lineColor={28,108,200},
          lineThickness=1), Text(
          extent={{-100,102},{100,0}},
          textColor={28,108,200},
          textString="P-f Drp"),
                            Text(
          extent={{-100,-2},{100,-104}},
          textColor={238,46,47},
          textString="No Plims")}),                              Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{200,200}})));
end pf_droop_scheme_nolims;
