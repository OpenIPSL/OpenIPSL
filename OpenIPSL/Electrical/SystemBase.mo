within OpenIPSL.Electrical;
record SystemBase "System Base Definition"
  parameter Types.ApparentPower S_b=100e6 "System base";
  parameter Types.Frequency fn=50 "System frequency";
  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-120,-100},{120,100}}), graphics={Rectangle(extent={{-120,100},{120,-100}},
          lineColor={28,108,200}),Text(
          extent={{-100,40},{100,0}},
          textColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="System Base: %S_b"),Text(
          extent={{-100,-20},{100,-60}},
          textColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="Frequency: %fn"),Text(
          extent={{-100,100},{100,60}},
          textColor={28,108,200},
          horizontalAlignment=TextAlignment.Center,
          textString="System Data")}),
    defaultComponentName="SysData",
    defaultComponentPrefixes="inner",
    missingInnerMessage="
    No 'System Data' component is defined.
    A default component will be used, and generate a system base of 100 MVA,
    and a frequency of 50 Hz");
end SystemBase;
