within OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses;
partial model BaseREECC "Base renewable energy electrical controller model C"

  parameter Boolean pfflag=true "Constant output value" annotation (Dialog(tab="Control"));
  parameter Boolean vflag=true "Constant output value" annotation (Dialog(tab="Control"));
  parameter Boolean qflag=true "Constant output value" annotation (Dialog(tab="Control"));
  parameter Boolean pqflag=true "Constant output value" annotation (Dialog(tab="Control"));

  Modelica.Blocks.Interfaces.RealInput ip0 "Initial Active Current" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={120,-320})));
  Modelica.Blocks.Interfaces.RealInput iq0 "Initial Reactive Current" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={240,-320})));
  Modelica.Blocks.Interfaces.RealOutput Iqcmd "Reactive Command Current"
    annotation (Placement(transformation(extent={{300,160},{320,180}})));
  Modelica.Blocks.Interfaces.RealOutput Ipcmd "Active Command Current"
    annotation (Placement(transformation(extent={{300,-180},{320,-160}})));

  Modelica.Blocks.Interfaces.RealInput v0 "Initial Terminal Voltage Magnitude" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-320})));
  Modelica.Blocks.Interfaces.RealInput p0 "Initial Active Power" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-240,-320})));
  Modelica.Blocks.Interfaces.RealInput q0 "Initial Reactive Power" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-120,-320})));
  Modelica.Blocks.Interfaces.RealInput Vt "Terminal Voltage Magnitude"
    annotation (Placement(transformation(extent={{-340,220},{-300,260}})));
  Modelica.Blocks.Interfaces.RealInput Pe "Electrical Power"
    annotation (Placement(transformation(extent={{-340,140},{-300,180}})));
  Modelica.Blocks.Interfaces.RealInput Qext "Reactive Power Reference"
    annotation (Placement(transformation(extent={{-340,-20},{-300,20}})));
  Modelica.Blocks.Interfaces.RealInput Qgen "Reactive Power Generated"
    annotation (Placement(transformation(extent={{-340,60},{-300,100}})));
  Modelica.Blocks.Interfaces.RealInput Pref "Active Power Reference" annotation (Placement(
        transformation(extent={{-340,-100},{-300,-60}})));
  Modelica.Blocks.Interfaces.RealInput Paux "Auxiliary Signal for Active Power" annotation (Placement(
        transformation(extent={{-340,-180},{-300,-140}})));
  annotation (Icon(coordinateSystem(extent={{-300,-300},
            {300,300}}), graphics={Rectangle(extent={{-300,300},{300,-300}},
            lineColor={0,0,255}),
        Text(
          extent={{-140,100},{160,-98}},
          textColor={0,0,255},
          textString="REECCU1"),
        Text(
          extent={{-280,258},{-220,218}},
          textColor={0,0,255},
          textString="VT"),
        Text(
          extent={{-280,178},{-168,138}},
          textColor={0,0,255},
          textString="PGEN"),
        Text(
          extent={{-280,98},{-168,58}},
          textColor={0,0,255},
          textString="QGEN"),
        Text(
          extent={{-280,18},{-168,-22}},
          textColor={0,0,255},
          textString="QEXT"),
        Text(
          extent={{-280,-62},{-168,-102}},
          textColor={0,0,255},
          textString="PREF"),
        Text(
          extent={{-260,-256},{-200,-296}},
          textColor={0,0,255},
          textString="P0"),
        Text(
          extent={{-150,-256},{-90,-296}},
          textColor={0,0,255},
          textString="Q0"),
        Text(
          extent={{-30,-256},{30,-296}},
          textColor={0,0,255},
          textString="V0"),
        Text(
          extent={{90,-256},{150,-296}},
          textColor={0,0,255},
          textString="IP0"),
        Text(
          extent={{204,-256},{264,-296}},
          textColor={0,0,255},
          textString="IQ0"),
        Text(
          extent={{178,168},{290,128}},
          textColor={0,0,255},
          textString="IQCMD"),
        Text(
          extent={{178,-132},{290,-172}},
          textColor={0,0,255},
          textString="IPCMD"),
        Text(
          extent={{-280,-142},{-168,-182}},
          textColor={0,0,255},
          textString="PAUX")}),
        Diagram(coordinateSystem(extent={{-300,-300},{300,300}})),
    Documentation(info="<html>
<p>
The BaseREECC model is the base class that is extended to create the <a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.REECCU1\">REECCU1</a> component.
</p>
</html>"));

end BaseREECC;
