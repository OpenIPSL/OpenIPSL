within OpenIPSL.Electrical.Renewables.PSSE.WindDriveTrain.BaseClasses;
partial model BaseWTDT
  "Base class for the drive train of the WECC generic renewable models"

  extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enabledisplayPF=false,
    final enablefn=false,
    final enableV_b=false,
    final enableangle_0=false,
    final enablev_0=false,
    final enableQ_0=false,
    final enableP_0=false,
    final enableS_b=false);

  Modelica.Blocks.Interfaces.RealInput Pm "Mechanical Power"
    annotation (Placement(transformation(extent={{-160,40},{-120,80}})));
  Modelica.Blocks.Interfaces.RealInput Pe "Electrical Power"
    annotation (Placement(transformation(extent={{-160,-80},{-120,-40}})));
  Modelica.Blocks.Interfaces.RealOutput wt "Rotational Speed Deviation Turbine Blade"
    annotation (Placement(transformation(extent={{120,50},{140,70}})));
  Modelica.Blocks.Interfaces.RealOutput wg "Rotational Speed Deviation Generator"
    annotation (Placement(transformation(extent={{120,-70},{140,-50}})));
  Modelica.Blocks.Interfaces.RealInput W_0 annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-60,-140})));
  Modelica.Blocks.Interfaces.RealInput P0 annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={60,-140})));
  annotation (Icon(coordinateSystem(extent={{
            -120,-120},{120,120}}), graphics={Rectangle(
          extent={{-120,120},{120,-120}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.None), Text(
          extent={{-80,40},{80,-40}},
          textColor={0,0,255},
          textString="WTDTA1"),
        Text(
          extent={{-100,74},{-40,44}},
          textColor={0,0,255},
          textString="PMECH"),
        Text(
          extent={{-100,-48},{-50,-74}},
          textColor={0,0,255},
          textString="PELE"),
        Text(
          extent={{-84,-90},{-34,-116}},
          textColor={0,0,255},
          textString="W0"),
        Text(
          extent={{36,-90},{86,-116}},
          textColor={0,0,255},
          textString="P0"),
        Text(
          extent={{64,-48},{114,-74}},
          textColor={0,0,255},
          textString="WG"),
        Text(
          extent={{64,72},{114,46}},
          textColor={0,0,255},
          textString="WT")}), Diagram(coordinateSystem(
          extent={{-120,-120},{120,120}})),
    Documentation(info="<html>
<p>
The BaseWTDT model is the base class that is extended to create the <a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.WindDriveTrain.WTDTA1\">WTDTA1</a> component.
</p>
</html>"));
end BaseWTDT;
