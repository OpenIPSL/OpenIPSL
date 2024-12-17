within OpenIPSL.Tests.Controls;
package IEEE_CIGRE
  extends Modelica.Icons.ExamplesPackage;

  package SCRX9
    extends Modelica.Icons.ExamplesPackage;
    package ReadMe "Read this before running the model."
      extends Modelica.Icons.Information;
      annotation (Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE ...&quot; [refHao.]</p>
<p><br>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</p>
<p>In Dymola the experiment annotation shoul result in the additional attributes.</p>
<p><br>    __Dymola_fixedstepsize=0.005,</p>
<p>    __Dymola_Algorithm=&quot;Euler&quot;</p>
</html>"));
    end ReadMe;

    model SCRX9GridFault
      "SCRX9 exciter implemented using DLL is tested under grid fault."
    extends OpenIPSL.Tests.BaseClasses.SMIB(pwFault(t1=2, t2=2.15));
    OpenIPSL.Electrical.Branches.PwLine pwLine(
      R=0.001,
      X=0.2,
      G=0,
      B=0) annotation (Placement(transformation(extent={{-20,-4},{-8,4}})));
    OpenIPSL.Electrical.Branches.PwLine pwLine3(
      R=0.0005,
      X=0.1,
      G=0,
      B=0) annotation (Placement(transformation(extent={{14,-34},{26,-26}})));
    OpenIPSL.Electrical.Branches.PwLine pwLine4(
      R=0.0005,
      X=0.1,
      G=0,
      B=0) annotation (Placement(transformation(extent={{54,-34},{66,-26}})));
    OpenIPSL.Electrical.Machines.PSSE.GENCLS gENCLS(
      M_b=100e6,
      D=0,
      angle_0=0,
      X_d=0.2,
      H=0,
      P_0=10017110,
      Q_0=8006544,
      v_0=1) annotation (Placement(transformation(extent={{100,-10},{90,10}})));
    OpenIPSL.Electrical.Loads.PSSE.Load_variation constantLoad(
      PQBRAK=0.7,
      d_t=0,
      d_P=0,
      angle_0=-0.5762684,
      t1=0,
      characteristic=2,
      P_0=50000000,
      Q_0=10000000,
      v_0=0.9919935) annotation (Placement(transformation(extent={{-10,-72},{10,-52}})));
    OpenIPSL.Electrical.Events.PwFault pwFault(
      t1=2,
      t2=2.15,
      R=C.eps,
      X=C.eps)
           annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=-90,
          origin={40,-60})));
    OpenIPSL.Electrical.Buses.Bus GEN1
      annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
    inner OpenIPSL.Electrical.SystemBase SysData(S_b=100e6, fn=50)
      annotation (Placement(transformation(extent={{-100,80},{-60,100}})));
    OpenIPSL.Electrical.Buses.Bus LOAD(v_0=constantLoad.v_0, angle_0=constantLoad.angle_0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    OpenIPSL.Electrical.Buses.Bus GEN2
      annotation (Placement(transformation(extent={{70,-10},{90,10}})));
    OpenIPSL.Electrical.Buses.Bus FAULT
      annotation (Placement(transformation(extent={{30,-40},{50,-20}})));
    OpenIPSL.Electrical.Branches.PwLine
                               pwLine1(
      R=0.0005,
      G=0,
      B=0,
      X=0.1) annotation (Placement(transformation(extent={{14,26},{26,34}})));
    OpenIPSL.Electrical.Branches.PwLine
                               pwLine2(
      R=0.0005,
      G=0,
      B=0,
      X=0.1) annotation (Placement(transformation(extent={{54,26},{66,34}})));
    OpenIPSL.Electrical.Buses.Bus
                         SHUNT
      annotation (Placement(transformation(extent={{30,20},{50,40}})));
    OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
      Tpd0=5,
      Tppd0=0.07,
      Tpq0=0.9,
      Tppq0=0.09,
      D=0,
      Xd=1.84,
      Xq=1.75,
      Xpd=0.41,
      Xpq=0.6,
      Xppd=0.2,
      Xl=0.12,
      S10=0.11,
      S12=0.39,
      angle_0=0.070492225331847,
      Xppq=0.2,
      R_a=0,
      Xpp=0.2,
      H=4.28,
      M_b=100000000,
      P_0=40000000,
      Q_0=5416582,
      v_0=1) annotation (Placement(transformation(extent={{-82,-10},{-62,10}})));
    OpenIPSL.Electrical.Controls.IEEE_CIGRE.SCRX9.SCRX sCRX
      annotation (Placement(transformation(extent={{-84,-40},{-60,-16}})));
    equation

    connect(GEN1.p,pwLine. p)
      annotation (Line(points={{-30,0},{-19.4,0}}, color={0,0,255}));
    connect(pwLine.n,LOAD. p)
      annotation (Line(points={{-8.6,0},{0,0}}, color={0,0,255}));
    connect(pwLine3.p,LOAD. p) annotation (Line(points={{14.6,-30},{10,-30},{10,0},
            {0,0}},color={0,0,255}));
    connect(constantLoad.p,LOAD. p)
      annotation (Line(points={{0,-52},{0,0}}, color={0,0,255}));
    connect(GEN2.p,gENCLS. p)
      annotation (Line(points={{80,0},{90,0}}, color={0,0,255}));
    connect(pwLine4.n,GEN2. p) annotation (Line(points={{65.4,-30},{70,-30},{70,0},
            {80,0}}, color={0,0,255}));
    connect(FAULT.p,pwLine4. p)
      annotation (Line(points={{40,-30},{54.6,-30}}, color={0,0,255}));
    connect(FAULT.p,pwLine3. n)
      annotation (Line(points={{40,-30},{25.4,-30}}, color={0,0,255}));
    connect(pwFault.p,pwLine4. p)
      annotation (Line(points={{40,-48.3333},{40,-30},{54.6,-30}},
                                                              color={0,0,255}));
    connect(pwLine1.p,LOAD. p)
      annotation (Line(points={{14.6,30},{10,30},{10,0},{0,0}},
                                                              color={0,0,255}));
    connect(pwLine1.n,SHUNT. p)
      annotation (Line(points={{25.4,30},{40,30}}, color={0,0,255}));
    connect(pwLine2.p,SHUNT. p)
      annotation (Line(points={{54.6,30},{40,30}}, color={0,0,255}));
    connect(pwLine2.n,GEN2. p) annotation (Line(points={{65.4,30},{70,30},{70,0},{
            80,0}},  color={0,0,255}));
    connect(gENROU.PMECH,gENROU. PMECH0) annotation (Line(points={{-84,6},{-94,
            6},{-94,26},{-54,26},{-54,5},{-61,5}},     color={0,0,127}));
    connect(gENROU.p,GEN1. p)
      annotation (Line(points={{-62,0},{-30,0}}, color={0,0,255}));

    connect(sCRX.XADIFD, gENROU.XADIFD) annotation (Line(points={{-60,-34},{
            -42,-34},{-42,-9},{-61,-9}}, color={0,0,127}));
    connect(sCRX.ETERM, gENROU.ETERM) annotation (Line(points={{-60,-22},{-36,
            -22},{-36,-3},{-61,-3}}, color={0,0,127}));
    connect(sCRX.EFD, gENROU.EFD) annotation (Line(points={{-85.2,-28},{-94,
            -28},{-94,-6},{-84,-6}}, color={0,0,127}));
      annotation (experiment(
        StopTime=10,
        Interval=0.005,
        Tolerance=1e-09,
        __Dymola_fixedstepsize=0.005,
        __Dymola_Algorithm="Euler"), Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE ...&quot; [refHao.]</p>
</html>"));
    end SCRX9GridFault;

  end SCRX9;

  package GFM
    extends Modelica.Icons.ExamplesPackage;
    model GFM_Test
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR gFM_GFL_IBR annotation (Placement(transformation(rotation=0,
              extent={{-62,-30},{-2,30}})));

      Modelica.Blocks.Sources.Constant Qref(k=0)
        annotation (Placement(transformation(extent={{-92,-6},{-80,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-92,-24},{-80,-12}})));
      Modelica.Blocks.Sources.Step Pref(
        height=0.3,
        offset=0.5,
        startTime=10)
        annotation (Placement(transformation(extent={{-92,12},{-80,24}})));
      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GridWithFault gridWithFault(FaultVoltage=0.4) annotation (Placement(
            transformation(rotation=0, extent={{28,-30},{88,30}})));
    equation

      connect(Qref.y, gFM_GFL_IBR.Q_ref_pu)
        annotation (Line(points={{-79.4,0},{-62,0}}, color={0,0,127}));
      connect(Vref.y, gFM_GFL_IBR.V_ref_pu)
        annotation (Line(points={{-79.4,-18},{-62,-18}}, color={0,0,127}));
      connect(Pref.y, gFM_GFL_IBR.P_ref_pu)
        annotation (Line(points={{-79.4,18},{-62,18}}, color={0,0,127}));
      connect(gFM_GFL_IBR.n2, gridWithFault.p)
        annotation (Line(points={{-2,18},{-2,18},{28,18}},  color={0,0,255}));
      connect(gridWithFault.p1, gFM_GFL_IBR.n1)
        annotation (Line(points={{28,0},{-2,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.n, gridWithFault.p2)
        annotation (Line(points={{-2,-18},{28,-18}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Ellipse(lineColor = {75,138,73},
                    fillColor={255,255,255},
                    fillPattern = FillPattern.Solid,
                    extent={{-100,-100},{100,100}}),
            Polygon(lineColor = {0,0,255},
                    fillColor = {75,138,73},
                    pattern = LinePattern.None,
                    fillPattern = FillPattern.Solid,
                    points={{-36,60},{64,0},{-36,-60},{-36,60}})}),  Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        experiment(
          StopTime=20,
          Interval=1e-05,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end GFM_Test;

    model GFM_TestNoFault
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR gFM_GFL_IBR annotation (Placement(transformation(rotation=0,
              extent={{-62,-30},{-2,30}})));

      Modelica.Blocks.Sources.Constant Qref(k=0)
        annotation (Placement(transformation(extent={{-92,-6},{-80,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-92,-24},{-80,-12}})));
      Modelica.Blocks.Sources.Step Pref(
        height=0,
        offset=0.5,
        startTime=10)
        annotation (Placement(transformation(extent={{-92,12},{-80,24}})));
      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GridWithFault gridWithFault(FaultVoltage=1)   annotation (Placement(
            transformation(rotation=0, extent={{28,-30},{88,30}})));
    equation

      connect(Qref.y, gFM_GFL_IBR.Q_ref_pu)
        annotation (Line(points={{-79.4,0},{-62,0}}, color={0,0,127}));
      connect(Vref.y, gFM_GFL_IBR.V_ref_pu)
        annotation (Line(points={{-79.4,-18},{-62,-18}}, color={0,0,127}));
      connect(Pref.y, gFM_GFL_IBR.P_ref_pu)
        annotation (Line(points={{-79.4,18},{-62,18}}, color={0,0,127}));
      connect(gFM_GFL_IBR.n2, gridWithFault.p)
        annotation (Line(points={{-2,18},{-2,18},{28,18}},  color={0,0,255}));
      connect(gridWithFault.p1, gFM_GFL_IBR.n1)
        annotation (Line(points={{28,0},{-2,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.n, gridWithFault.p2)
        annotation (Line(points={{-2,-18},{28,-18}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Ellipse(lineColor = {75,138,73},
                    fillColor={255,255,255},
                    fillPattern = FillPattern.Solid,
                    extent={{-100,-100},{100,100}}),
            Polygon(lineColor = {0,0,255},
                    fillColor = {75,138,73},
                    pattern = LinePattern.None,
                    fillPattern = FillPattern.Solid,
                    points={{-36,60},{64,0},{-36,-60},{-36,60}})}),  Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        experiment(
          StopTime=5,
          Interval=1e-05,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end GFM_TestNoFault;

    model GFM_InitNoFault
      "This GFM controller and Grid is initialized with initial condiction from termination of GFM_Test"
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GFM_GFL_IBR_Init_SS
                         gFM_GFL_IBR_Init_SS
                                     annotation (Placement(transformation(rotation=0,
              extent={{-62,-30},{-2,30}})));

      Modelica.Blocks.Sources.Constant Qref(k=0)
        annotation (Placement(transformation(extent={{-92,-6},{-80,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-92,-24},{-80,-12}})));
      Modelica.Blocks.Sources.Step Pref(
        height=0,
        offset=0.5,
        startTime=10)
        annotation (Placement(transformation(extent={{-92,12},{-80,24}})));
      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GridWithFault gridWithFault_Init(FaultVoltage=1, FaultTime=1)
                                                           annotation (Placement(
            transformation(rotation=0, extent={{32,-30},{92,30}})));
    equation

      connect(Qref.y, gFM_GFL_IBR_Init_SS.Q_ref_pu)
        annotation (Line(points={{-79.4,0},{-62,0}}, color={0,0,127}));
      connect(Vref.y, gFM_GFL_IBR_Init_SS.V_ref_pu)
        annotation (Line(points={{-79.4,-18},{-62,-18}}, color={0,0,127}));
      connect(Pref.y, gFM_GFL_IBR_Init_SS.P_ref_pu)
        annotation (Line(points={{-79.4,18},{-62,18}}, color={0,0,127}));
      connect(gFM_GFL_IBR_Init_SS.n2, gridWithFault_Init.p)
        annotation (Line(points={{-2,18},{32,18}}, color={0,0,255}));
      connect(gridWithFault_Init.p1, gFM_GFL_IBR_Init_SS.n1)
        annotation (Line(points={{32,0},{-2,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR_Init_SS.n, gridWithFault_Init.p2)
        annotation (Line(points={{-2,-18},{32,-18}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Ellipse(lineColor = {75,138,73},
                    fillColor={255,255,255},
                    fillPattern = FillPattern.Solid,
                    extent={{-100,-100},{100,100}}),
            Polygon(lineColor = {0,0,255},
                    fillColor = {75,138,73},
                    pattern = LinePattern.None,
                    fillPattern = FillPattern.Solid,
                    points={{-36,60},{64,0},{-36,-60},{-36,60}})}),  Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        experiment(
          StopTime=5,
          Interval=1e-05,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Rkfix4"));
    end GFM_InitNoFault;



  end GFM;

  model GFM_InitLine
    "This GFM controller and Grid is initialized with initial condiction from termination of GFM_Test."
    constant Real line_inductance = 0;
    constant Real line_resistance = 0.1;

    OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GFM_GFL_IBR_Init_SS
                       gFM_GFL_IBR_Init_SS
                                   annotation (Placement(transformation(rotation=0,
            extent={{-62,-30},{-2,30}})));

    Modelica.Blocks.Sources.Constant Qref(k=0)
      annotation (Placement(transformation(extent={{-92,-6},{-80,6}})));
    Modelica.Blocks.Sources.Constant Vref(k=1)
      annotation (Placement(transformation(extent={{-92,-24},{-80,-12}})));
    Modelica.Blocks.Sources.Step Pref(
      height=0,
      offset=0.5,
      startTime=10)
      annotation (Placement(transformation(extent={{-92,12},{-80,24}})));
    OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GridWithFault gridWithFault_Init(FaultVoltage=0.5, FaultTime=1)
                                                         annotation (Placement(
          transformation(rotation=0, extent={{74,-30},{134,30}})));
    Modelica.Electrical.Analog.Basic.Resistor resistor(R=line_resistance)
      annotation (Placement(transformation(extent={{24,-10},{44,10}})));
    Modelica.Electrical.Analog.Basic.Resistor resistor1(R=line_resistance)
      annotation (Placement(transformation(extent={{24,-28},{44,-8}})));
    Modelica.Electrical.Analog.Basic.Resistor resistor2(R=line_resistance)
      annotation (Placement(transformation(extent={{24,8},{44,28}})));
  equation

    connect(Qref.y, gFM_GFL_IBR_Init_SS.Q_ref_pu)
      annotation (Line(points={{-79.4,0},{-62,0}}, color={0,0,127}));
    connect(Vref.y, gFM_GFL_IBR_Init_SS.V_ref_pu)
      annotation (Line(points={{-79.4,-18},{-62,-18}}, color={0,0,127}));
    connect(Pref.y, gFM_GFL_IBR_Init_SS.P_ref_pu)
      annotation (Line(points={{-79.4,18},{-62,18}}, color={0,0,127}));
    connect(gridWithFault_Init.p1, resistor.n)
      annotation (Line(points={{74,0},{44,0}}, color={0,0,255}));
    connect(gFM_GFL_IBR_Init_SS.n1, resistor.p)
      annotation (Line(points={{-2,0},{24,0}}, color={0,0,255}));
    connect(resistor2.p, gFM_GFL_IBR_Init_SS.n2)
      annotation (Line(points={{24,18},{-2,18}}, color={0,0,255}));
    connect(resistor2.n, gridWithFault_Init.p)
      annotation (Line(points={{44,18},{74,18}}, color={0,0,255}));
    connect(gFM_GFL_IBR_Init_SS.n, resistor1.p)
      annotation (Line(points={{-2,-18},{24,-18}}, color={0,0,255}));
    connect(resistor1.n, gridWithFault_Init.p2)
      annotation (Line(points={{44,-18},{74,-18}}, color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Ellipse(lineColor = {75,138,73},
                  fillColor={255,255,255},
                  fillPattern = FillPattern.Solid,
                  extent={{-100,-100},{100,100}}),
          Polygon(lineColor = {0,0,255},
                  fillColor = {75,138,73},
                  pattern = LinePattern.None,
                  fillPattern = FillPattern.Solid,
                  points={{-36,60},{64,0},{-36,-60},{-36,60}})}),  Diagram(
          coordinateSystem(preserveAspectRatio=false)),
      experiment(
        StopTime=5,
        Interval=1e-05,
        __Dymola_fixedstepsize=1e-05,
        __Dymola_Algorithm="Euler"));
  end GFM_InitLine;
end IEEE_CIGRE;
