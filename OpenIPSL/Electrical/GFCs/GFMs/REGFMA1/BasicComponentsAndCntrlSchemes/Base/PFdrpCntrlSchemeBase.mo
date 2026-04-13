within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.BasicComponentsAndCntrlSchemes.Base;
partial model PFdrpCntrlSchemeBase
  "Partial / Base model of the P-f droop control scheme base model to use with variants with and without P limiters"
  import Modelica;
  outer OpenIPSL.Electrical.SystemBase SysData;
  LPFilter Pfilt(Tr=Tr, y0val=P0)
    annotation (Placement(transformation(extent={{-180,-90},{-160,-70}})));
  PFdrp pfdroop(f0=f0, mp=mp)
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
  Modelica.Blocks.Interfaces.RealInput Pout0
    "Initial value of the active power from the voltage source" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-80,-220}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-80,-220})));

  parameter Real f0=SysData.fn "Synchronous frequency, f0 = 50 or 60 Hz"
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
          textString="P-f Drp")}),                               Diagram(
        coordinateSystem(                           extent={{-200,-200},{200,200}},
          grid={1,1}), graphics={Polygon(
          points={{-8,-31},{-13,-51},{-3,-51},{-8,-31}},
          lineColor={238,46,47},
          fillColor={255,49,52},
          fillPattern=FillPattern.Solid,
          lineThickness=1)}),
    Documentation(info="<html>
This is a partial model (or base model) that is extended to implement the P-f droop scheme variants.
It contains the basic droop function and the active power measurement filter. 
A red triangle indicates the input for the signal of the active power limiters.
</html>"));
end PFdrpCntrlSchemeBase;
