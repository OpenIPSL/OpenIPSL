within OpenIPSL.Electrical.Renewables.PSSE.DriveTrain.BaseClasses;
partial model BaseRenewableDriveTrain


  Modelica.Blocks.Interfaces.RealInput Pm
    annotation (Placement(transformation(extent={{-160,40},{-120,80}})));
  Modelica.Blocks.Interfaces.RealInput Pe
    annotation (Placement(transformation(extent={{-160,-80},{-120,-40}})));
  Modelica.Blocks.Interfaces.RealOutput wt
    annotation (Placement(transformation(extent={{120,50},{140,70}})));
  Modelica.Blocks.Interfaces.RealOutput wg
    annotation (Placement(transformation(extent={{120,-70},{140,-50}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
            -120,-120},{120,120}}), graphics={Rectangle(
          extent={{-120,120},{120,-120}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.None)}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-120,-120},{120,120}})));
end BaseRenewableDriveTrain;
