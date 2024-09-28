within OpenIPSL.Examples.Microgrids.IEEEMicrogrid.GeneratorGroups;
model DieselGeneratorUnit "Diesel Generation Unit"
  extends OpenIPSL.Interfaces.Generator(V_b = 400);
  Electrical.Machines.PSSE.GENROE gENROE(
    V_b=400,
    P_0=P_0,
    Q_0=Q_0,
    v_0=v_0,
    angle_0=angle_0,
    M_b(displayUnit="V.A") = 50000,
    Tpd0=3.7,
    Tppd0=0.05,
    Tppq0=0.05,
    H=1.07,
    D=0,
    Xd=1,
    Xq=1,
    Xpd=0.296,
    Xppd=0.177,
    Xppq=0.177,
    Xl=0.052,
    S10=0.12,
    S12=0.4,
    R_a=0,
    Xpq=0.4610,
    Tpq0=0.391)
    annotation (Placement(transformation(extent={{20,-20},{60,20}})));
  Electrical.Controls.PSSE.ES.SEXS   sEXS
    annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=180,
        origin={-66,-16})));
  Electrical.Controls.PSSE.TG.DEGOV dEGOV(
    T1=0.01,
    T2=0.02,
    T3=0.2,
    K=40,
    T4=0.25,
    T5=0.009,
    T6=0.0384,
    TD=0.024,
    TMAX=1.1,
    TMIN=0) annotation (Placement(transformation(extent={{-20,2},{0,22}})));
equation
  connect(gENROE.p, pwPin)
    annotation (Line(points={{60,0},{110,0}}, color={0,0,255}));
  connect(sEXS.EFD, gENROE.EFD) annotation (Line(points={{1,-20},{6,-20},{6,-12},
          {16,-12}}, color={0,0,127}));
  connect(zero.y, sEXS.VOTHSG)
    annotation (Line(points={{-59.4,-16},{-21,-16}}, color={0,0,127}));
  connect(sEXS.XADIFD, gENROE.XADIFD) annotation (Line(points={{-2,-31},{-2,-40},
          {70,-40},{70,-18},{62,-18}}, color={0,0,127}));
  connect(sEXS.EFD0, gENROE.EFD0) annotation (Line(points={{-21,-24},{-26,-24},{
          -26,-44},{74,-44},{74,-10},{62,-10}}, color={0,0,127}));
  connect(sEXS.ECOMP, gENROE.ETERM) annotation (Line(points={{-21,-20},{-30,-20},
          {-30,-48},{78,-48},{78,-6},{62,-6}}, color={0,0,127}));
  connect(dEGOV.PMECH,gENROE. PMECH)
    annotation (Line(points={{1,12},{16,12}}, color={0,0,127}));
  connect(gENROE.SPEED, dEGOV.SPEED) annotation (Line(points={{62,14},{70,14},{
          70,28},{-24,28},{-24,18},{-18,18}}, color={0,0,127}));
  connect(gENROE.PMECH0, dEGOV.PMECH0) annotation (Line(points={{62,10},{74,10},
          {74,32},{-28,32},{-28,6},{-18,6}}, color={0,0,127}));
  connect(sEXS.VUEL, zero.y) annotation (Line(points={{-14,-31},{-14,-38},{-36,-38},
          {-36,-16},{-59.4,-16}}, color={0,0,127}));
  connect(sEXS.VOEL, zero.y) annotation (Line(points={{-10,-31},{-10,-38},{-36,-38},
          {-36,-16},{-59.4,-16}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DieselGeneratorUnit;
