within OpenIPSL.NonElectrical.Logical;
model NegCurLogic "Negative current logic block"
  Modelica.Blocks.Interfaces.RealInput Vd(start=nstartvalue) annotation (
      Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealOutput Efd(start=nstartvalue) annotation (
      Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput XadIfd(start=nstartvalue) annotation (
      Placement(transformation(extent={{-140,-80},{-100,-40}})));
  parameter Real RC_rfd;
  parameter Real nstartvalue;
  Real Crowbar_V;
equation
  Efd = if XadIfd < 0 then Crowbar_V else Vd;
  Crowbar_V = if not (RC_rfd > 0 or RC_rfd < 0) then 0 else (-1)*RC_rfd*XadIfd;
  annotation (
    Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-80,80},{80,-80}},
          lineColor={0,0,255},
          textString="Negative Current Logic"),
                                    Text(
          extent={{-150,150},{150,110}},
          lineColor={0,0,255},
          textString="%name")}));
end NegCurLogic;
