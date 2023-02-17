within OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses;
partial model BaseREECC "Base renewable energy electrical controller model C"

  Modelica.Blocks.Interfaces.RealInput ip0 annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={120,-320}),  iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={120,-320})));
  Modelica.Blocks.Interfaces.RealInput iq0 annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={230,-320}),  iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={230,-320})));
  Modelica.Blocks.Interfaces.RealOutput Iqcmd
    annotation (Placement(transformation(extent={{300,70},{320,90}}),
        iconTransformation(extent={{300,140},{320,160}})));
  Modelica.Blocks.Interfaces.RealOutput Ipcmd
    annotation (Placement(transformation(extent={{300,-90},{320,-70}}),
        iconTransformation(extent={{300,-160},{320,-140}})));

  Modelica.Blocks.Interfaces.RealInput v0 annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-320}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-320})));
  Modelica.Blocks.Interfaces.RealInput p0 annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-230,-320}),iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-230,-320})));
  Modelica.Blocks.Interfaces.RealInput q0 annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-120,-320}),iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-120,-320})));
  Modelica.Blocks.Interfaces.RealInput Vt
    annotation (Placement(transformation(extent={{-340,220},{-300,260}}),
        iconTransformation(extent={{-340,220},{-300,260}})));
  Modelica.Blocks.Interfaces.RealInput Pe
    annotation (Placement(transformation(extent={{-340,140},{-300,180}}),
        iconTransformation(extent={{-340,140},{-300,180}})));
  Modelica.Blocks.Interfaces.RealInput Qext
    "Connector of second Real input signal"
    annotation (Placement(transformation(extent={{-340,-20},{-300,20}}),
        iconTransformation(extent={{-340,-20},{-300,20}})));
  Modelica.Blocks.Interfaces.RealInput Qgen "Connector of Real input signal 2"
    annotation (Placement(transformation(extent={{-340,60},{-300,100}}),
        iconTransformation(extent={{-340,60},{-300,100}})));
  Modelica.Blocks.Interfaces.RealInput Pref annotation (Placement(
        transformation(extent={{-340,-100},{-300,-60}}),
        iconTransformation(extent={{-340,-100},{-300,-60}})));
  Modelica.Blocks.Interfaces.RealInput Paux annotation (Placement(
        transformation(extent={{-340,-180},{-300,-140}}), iconTransformation(
          extent={{-340,-180},{-300,-140}})));
  Modelica.Blocks.Interfaces.RealInput SOC annotation (Placement(transformation(
          extent={{-340,-260},{-300,-220}}), iconTransformation(extent={{-340,-260},
            {-300,-220}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-300,-300},
            {300,300}}), graphics={Rectangle(extent={{-300,300},{300,-300}},
            lineColor={0,0,255})}),    Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-300,-300},{300,300}})));

end BaseREECC;
