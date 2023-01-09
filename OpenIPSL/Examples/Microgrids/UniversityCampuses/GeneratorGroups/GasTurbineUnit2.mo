within OpenIPSL.Examples.Microgrids.UniversityCampuses.GeneratorGroups;
model GasTurbineUnit2
  extends OpenIPSL.Interfaces.Generator(V_b = 13800);
  Electrical.Machines.PSSE.GENROE gENROE(
    V_b=13800,
    P_0=P_0,
    Q_0=Q_0,
    v_0=v_0,
    angle_0=angle_0,
    M_b=16667000,
    Tpd0=4.610,
    Tppd0=0.054,
    Tppq0=0.107,
    H=183.30/16.667,
    D=2,
    Xd=1.850,
    Xq=1.750,
    Xpd=0.225,
    Xppd=0.155,
    Xppq=0.155,
    Xl=0.113,
    S10=0.087,
    S12=0.2681,
    R_a=0.034,
    Xpq=0.1125,
    Tpq0=1) annotation (Placement(transformation(extent={{20,-20},{60,20}})));
  Electrical.Controls.PSSE.ES.ESAC1A eSAC1A
    annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
  Modelica.Blocks.Sources.Constant zero(k=0) annotation (Placement(transformation(
        extent={{6,6},{-6,-6}},
        rotation=180,
        origin={-66,-16})));
  Modelica.Blocks.Sources.Constant minusInf(k=-Modelica.Constants.inf) annotation (Placement(transformation(extent={{-60,-74},
            {-52,-66}})));
  Modelica.Blocks.Sources.Constant plusInf(k=Modelica.Constants.inf) annotation (Placement(transformation(extent={{-60,-88},
            {-52,-80}})));
  Electrical.Controls.PSSE.TG.GAST gAST(D_turb=1)
    annotation (Placement(transformation(extent={{-20,2},{0,22}})));
equation
  connect(gENROE.p, pwPin)
    annotation (Line(points={{60,0},{110,0}}, color={0,0,255}));
  connect(eSAC1A.EFD, gENROE.EFD) annotation (Line(points={{1,-20},{6,-20},{6,-12},
          {16,-12}}, color={0,0,127}));
  connect(eSAC1A.XADIFD, gENROE.XADIFD) annotation (Line(points={{-2,-31},{-2,-36},
          {68,-36},{68,-18},{62,-18}}, color={0,0,127}));
  connect(eSAC1A.EFD0, gENROE.EFD0) annotation (Line(points={{-21,-24},{-34,-24},
          {-34,-42},{74,-42},{74,-10},{62,-10}}, color={0,0,127}));
  connect(gENROE.ETERM, eSAC1A.ECOMP) annotation (Line(points={{62,-6},{80,-6},{
          80,-48},{-40,-48},{-40,-20},{-21,-20}}, color={0,0,127}));
  connect(zero.y, eSAC1A.VOTHSG)
    annotation (Line(points={{-59.4,-16},{-21,-16}}, color={0,0,127}));
  connect(minusInf.y, eSAC1A.VUEL) annotation (Line(points={{-51.6,-70},{-14,
          -70},{-14,-31}}, color={0,0,127}));
  connect(plusInf.y, eSAC1A.VOEL) annotation (Line(points={{-51.6,-84},{-10,-84},
          {-10,-31}}, color={0,0,127}));
  connect(gAST.PMECH, gENROE.PMECH)
    annotation (Line(points={{1,12},{16,12}}, color={0,0,127}));
  connect(gENROE.SPEED, gAST.SPEED) annotation (Line(points={{62,14},{74,14},{
          74,32},{-26,32},{-26,18},{-18,18}}, color={0,0,127}));
  connect(gENROE.PMECH0, gAST.PMECH0) annotation (Line(points={{62,10},{80,10},
          {80,38},{-34,38},{-34,6},{-18,6}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
                                   Diagram(coordinateSystem(preserveAspectRatio=
           false)));
end GasTurbineUnit2;
