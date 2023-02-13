within OpenIPSL.Examples.MPC.GenerationUnits;
model G1 "Generation unit connected to bus BG1"
  outer OpenIPSL.Electrical.SystemBase SysData;
  extends OpenIPSL.Electrical.Essentials.pfComponent;

  OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
            100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  OpenIPSL.Electrical.Machines.PSSE.GENROE gen(
    M_b=100000000,
    Tpd0=5,
    Tppd0=0.07,
    Tppq0=0.09,
    H=4.28,
    D=0,
    Xd=1.84,
    Xq=1.75,
    Xpd=0.41,
    Xppd=0.2,
    Xl=0.12,
    S10=0.11,
    S12=0.39,
    Xppq=0.2,
    R_a=0,
    V_b=V_b,
    v_0=v_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    Xpq=0.1,
    Tpq0=2)  annotation (Placement(transformation(extent={{32,-20},{72,20}})));
  SEXS4MPC SEXS(T_E=0.1)
    annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  IEESGO4MPC IEESGO
    annotation (Placement(transformation(extent={{-6,-52},{14,-32}})));
  Modelica.Blocks.Sources.Constant non_active_inputs(k=0)
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
equation
  connect(gen.p, conn)
    annotation (Line(points={{72,0},{110,0}}, color={0,0,255}));
  connect(SEXS.EFD0, gen.EFD0) annotation (Line(points={{-11,6},{-20,6},{-20,-24},
          {80,-24},{80,-10},{74,-10}}, color={0,0,127}));
  connect(SEXS.ECOMP, gen.ETERM) annotation (Line(points={{-11,10},{-20,10},{-20,
          28},{80,28},{80,-6},{74,-6}}, color={0,0,127}));
  connect(IEESGO.SPEED, gen.SPEED) annotation (Line(points={{-4,-36},{-24,-36},
          {-24,32},{84,32},{84,14},{74,14}}, color={0,0,127}));
  connect(IEESGO.PMECH0, gen.PMECH0) annotation (Line(points={{-4,-48},{-10,-48},
          {-10,-56},{84,-56},{84,10},{74,10}}, color={0,0,127}));
  connect(non_active_inputs.y, SEXS.VOTHSG) annotation (Line(points={{-39,-10},
          {-16,-10},{-16,14},{-11,14}}, color={0,0,127}));
  connect(IEESGO.PMECH, gen.PMECH) annotation (Line(points={{15,-42},{20,-42},{
          20,12},{28,12}}, color={0,0,127}));
  connect(SEXS.EFD, gen.EFD) annotation (Line(points={{11,10},{16,10},{16,-12},
          {28,-12}}, color={0,0,127}));
  connect(gen.XADIFD, SEXS.XADIFD) annotation (Line(points={{74,-18},{78,-18},{
          78,-22},{8,-22},{8,-1}}, color={0,0,127}));
  connect(non_active_inputs.y, SEXS.VUEL)
    annotation (Line(points={{-39,-10},{-4,-10},{-4,-1}}, color={0,0,127}));
  connect(non_active_inputs.y, SEXS.VOEL)
    annotation (Line(points={{-39,-10},{0,-10},{0,-1}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
          color={0,0,0},
          smooth=Smooth.Bezier),Text(
          extent={{-52,-18},{56,-66}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}),
    Documentation(info="<html>
<p>24kV/100MVA generation unit connected to bus BG1, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENSAL, a salient pole synchronous machine from PSSE.</li>
<li><strong>Exciter</strong>: SEXS, a simplified excitation system from PSSE.</li>
<li><strong>Turbine/Governor</strong>: HYGOV, a hydro-turbine governor from PSSE.</li>
</ul>
</html>"));
end G1;
