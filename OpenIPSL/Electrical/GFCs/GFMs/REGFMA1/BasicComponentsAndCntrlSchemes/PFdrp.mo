within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.BasicComponentsAndCntrlSchemes;
model PFdrp "P-f droop controller"
  import Modelica;
  outer OpenIPSL.Electrical.SystemBase SysData;
    parameter Real f0     = SysData.fn "System frequency, f0 = 60 Hz";
    parameter Real omega0 = 2*Modelica.Constants.pi*f0 "Synchronous speed, w0 = 2 x pi x f0";
    parameter Real mp     = 0.005 "P-f droop gain. Normal range: 0.005 - 0.05 pu.";

  Modelica.Blocks.Math.Feedback DP "Active power control error"
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
  Modelica.Blocks.Math.Gain mpGain(k=mp)     "P-f droop gain"
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Interfaces.RealInput Pfilt
    "Filtered value of the active power measurement"
    annotation (Placement(transformation(extent={{-140,-100},{-100,-60}})));
  Modelica.Blocks.Interfaces.RealInput Pref "Active power reference"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Math.Add sum_Plim
    annotation (Placement(transformation(extent={{-20,-16},{0,4}})));
  Modelica.Blocks.Interfaces.RealInput Plim_in
    "Input signal from active power limiter function" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-40,-120})));
  Modelica.Blocks.Math.Gain w0Gain(k=omega0) "P-f droop gain"
    annotation (Placement(transformation(extent={{18,-10},{38,10}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,-40})));
  Modelica.Blocks.Sources.Constant omega0val(k=omega0)
    "Outputs the synchronous speed value" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={10,-50})));
  Modelica.Blocks.Interfaces.RealOutput omega_droop
    "Speed output from the P-f droop controller"
    annotation (Placement(transformation(extent={{100,-70},{120,-50}}),
        iconTransformation(extent={{100,-70},{120,-50}})));
  Modelica.Blocks.Interfaces.RealOutput delta_droop
    "Desired internal angle from the P-f droop controller"
    annotation (Placement(transformation(extent={{100,-10},{120,10}}),
        iconTransformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput Edelta0
    "Initial value of the internal angle from the voltage source" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={40,-120})));

  Modelica.Blocks.Continuous.Integrator integrator(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=delta0)
    annotation (Placement(transformation(extent={{52,-6},{64,6}})));
protected
  parameter Real delta0(fixed=false);
initial equation
        delta0 = Edelta0 "Assign the value coming from the voltage source to the initial value of the internal angle delta0 used by the droop block";

equation

  connect(DP.u2, Pfilt)
    annotation (Line(points={{-80,-8},{-80,-80},{-120,-80}}, color={0,0,127}));
  connect(Pref, DP.u1)
    annotation (Line(points={{-120,0},{-88,0}}, color={0,0,127}));
  connect(DP.y, mpGain.u)
    annotation (Line(points={{-71,0},{-62,0}}, color={0,0,127}));
  connect(mpGain.y, sum_Plim.u1)
    annotation (Line(points={{-39,0},{-22,0}},color={0,0,127}));
  connect(sum_Plim.u2, Plim_in)
    annotation (Line(points={{-22,-12},{-32,-12},{-32,-40},{-40,-40},{-40,-120}},
                                                             color={0,0,127}));
  connect(w0Gain.y, add.u1)
    annotation (Line(points={{39,0},{46,0},{46,-28}}, color={0,0,127}));
  connect(omega0val.y, add.u2) annotation (Line(points={{10,-39},{10,-20},{34,-20},
          {34,-28}}, color={0,0,127}));
  connect(add.y, omega_droop)
    annotation (Line(points={{40,-51},{40,-60},{110,-60}}, color={0,0,127}));
  connect(sum_Plim.y, w0Gain.u)
    annotation (Line(points={{1,-6},{8,-6},{8,0},{16,0}}, color={0,0,127}));
  connect(integrator.u, w0Gain.y)
    annotation (Line(points={{50.8,0},{39,0}},
                                             color={0,0,127}));
  connect(integrator.y, delta_droop)
    annotation (Line(points={{64.6,0},{110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          lineThickness=1),
        Text(
          extent={{-100,140},{100,100}},
          textColor={28,108,200},
          textString="%name"),
        Text(
          extent={{-100,62},{100,-40}},
          textColor={28,108,200},
          textString="P-f Drp")}),                               Diagram(
        coordinateSystem(preserveAspectRatio=false)),preferredView="diagram",
    Documentation(info="<html>
<p>This model implements the basic droop fundtion of the P-f control scheme.</p> 

<p>
The gain block \"mpGain\" has a parameter <code>k=mp</code> that is used to set the droop value. The reminder of the model determines the angle and the frequency of the converter.
</p>

<p>
The initial angle for the integrator, <code>delta0</code>, is set as a parameter with <code>fixed=false</code> that is propagated. 
This parameter is set in the P-f droop control scheme base model using the value computed by the voltage source.
In this model, an <code>initial equation</code> sets the initial value of the angle, <code>delta0</code>, through an initial equation that assigns it the value computed by the voltage source.
</p>
</html>"));
end PFdrp;
