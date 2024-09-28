within OpenIPSL.NonElectrical.Continuous;
model Washout
  extends Modelica.Blocks.Interfaces.SISO;
  parameter OpenIPSL.Types.PerUnit K_I "Gain (pu)";
  parameter OpenIPSL.Types.Time T_I "Lead time constant (sec)";
  Modelica.Blocks.Math.Gain gain(k=K_I/T_I)
    annotation (Placement(transformation(extent={{-20,30},{0,50}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Continuous.Integrator integrator
    annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
  Modelica.Blocks.Math.Gain gain1(k=1/T_I)
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
equation
  connect(gain1.y, integrator.u)
    annotation (Line(points={{-19,-30},{-2,-30}}, color={0,0,127}));
  connect(integrator.y, add.u2) annotation (Line(points={{21,-30},{32,-30},{32,-6},
          {38,-6}}, color={0,0,127}));
  connect(gain.y, add.u1)
    annotation (Line(points={{1,40},{32,40},{32,6},{38,6}}, color={0,0,127}));
  connect(u, gain.u) annotation (Line(points={{-120,0},{-48,0},{-48,40},{-22,40}},
        color={0,0,127}));
  connect(add.y, y) annotation (Line(points={{61,0},{110,0}}, color={0,0,127}));
  connect(gain1.u, y) annotation (Line(points={{-42,-30},{-60,-30},{-60,-60},{80,
          -60},{80,0},{110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Washout;
