within OpenIPSL.Tests.Controls;
package IEEE_CIGRE
  extends Modelica.Icons.ExamplesPackage;

  package SCRX9
    extends Modelica.Icons.ExamplesPackage;
    package ReadMe "Read this before running the model."
      extends Modelica.Icons.Information;
      annotation (Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><b>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</b></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><span style=\"font-family: Courier New;\">experiment(</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;StopTime=10,</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tolerance=1e-05,</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;__Dymola_fixedstepsize=0.005,</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;__Dymola_Algorithm=&quot;Euler&quot;));</span></p>
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
      annotation (Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><br><b>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</b></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"));
    end SCRX9GridFault;

  end SCRX9;

  package GFM
    extends Modelica.Icons.ExamplesPackage;
    package ReadMe "Read this before running the model."
      extends Modelica.Icons.Information;
      annotation (Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br>GFM_TestNoFault will save the model termination status in your workspace. it generate<b> list.dat </b>file. </p>
<p><br>GFM_InitNoFault will load the termination state from <b>list.dat</b> file as initial condition to prevent initial transient. </p>
<p><br>GFM_InitLine will load the termination state from <b>list.dat</b> file as initial condition to prevent initial transient. </p>
<h4><span style=\"background-color: #ffffff\">Pre-Configuration </span></h4>
<p>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</p>
<p>In Dymola the experiment annotation shoul result in the additional attributes.</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;</p>
</html>"));
    end ReadMe;

    model GFM_Test
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      Modelica.Blocks.Sources.Constant Qref(k=0)
        annotation (Placement(transformation(extent={{-92,-6},{-80,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-94,-46},{-82,-34}})));
      Modelica.Blocks.Sources.Step Pref(
        height=0.2,
        offset=0.5,
        startTime=2)
        annotation (Placement(transformation(extent={{-92,34},{-80,46}})));
      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GridWithFault gridWithFault(
          FaultVoltage=0.8)                                                                                    annotation (Placement(
            transformation(rotation=0, extent={{32,-28},{90,30}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR gFM_GFL_IBR
        annotation (Placement(transformation(extent={{-42,-24},{8,26}})));
    equation

      connect(gFM_GFL_IBR.C, gridWithFault.C) annotation (Line(points={{8,16},{
              24,16},{24,18.4},{32,18.4}}, color={0,0,255}));
      connect(gFM_GFL_IBR.B, gridWithFault.B)
        annotation (Line(points={{8,1},{32,1}}, color={0,0,255}));
      connect(gFM_GFL_IBR.A, gridWithFault.A) annotation (Line(points={{8,-14},
              {24,-14},{24,-16.4},{32,-16.4}}, color={0,0,255}));
      connect(Pref.y, gFM_GFL_IBR.P_ref_pu) annotation (Line(points={{-79.4,40},
              {-52,40},{-52,16},{-42,16}}, color={0,0,127}));
      connect(Qref.y, gFM_GFL_IBR.Q_ref_pu) annotation (Line(points={{-79.4,0},
              {-50,0},{-50,1},{-42,1}}, color={0,0,127}));
      connect(Vref.y, gFM_GFL_IBR.V_ref_pu) annotation (Line(points={{-81.4,-40},
              {-52,-40},{-52,-14},{-42,-14}}, color={0,0,127}));
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
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          StopTime=10,
          Interval=0.001,
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
      connect(gFM_GFL_IBR.C, gridWithFault.C)
        annotation (Line(points={{-2,18},{-2,18},{28,18}}, color={0,0,255}));
      connect(gridWithFault.B, gFM_GFL_IBR.B)
        annotation (Line(points={{28,0},{-2,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.A, gridWithFault.A)
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
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"));
    end GFM_TestNoFault;

    model GFM_SaveInit
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
            transformation(rotation=0, extent={{36,-30},{96,30}})));
    equation

      connect(Qref.y, gFM_GFL_IBR.Q_ref_pu)
        annotation (Line(points={{-79.4,0},{-62,0}}, color={0,0,127}));
      connect(Vref.y, gFM_GFL_IBR.V_ref_pu)
        annotation (Line(points={{-79.4,-18},{-62,-18}}, color={0,0,127}));
      connect(Pref.y, gFM_GFL_IBR.P_ref_pu)
        annotation (Line(points={{-79.4,18},{-62,18}}, color={0,0,127}));
      connect(gFM_GFL_IBR.C, gridWithFault.C)
        annotation (Line(points={{-2,18},{36,18}}, color={0,0,255}));
      connect(gFM_GFL_IBR.B, gridWithFault.B)
        annotation (Line(points={{-2,0},{36,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.A, gridWithFault.A)
        annotation (Line(points={{-2,-18},{36,-18}}, color={0,0,255}));
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
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(Interval=1e-05, __Dymola_Algorithm="Euler"));
    end GFM_SaveInit;

    model GFM_InitNoFault
      "This GFM controller and Grid is initialized with initial condiction from termination of GFM_Test"
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GFM_GFL_IBR_Init_SS
                         gFM_GFL_IBR_Init_SS
                                     annotation (Placement(transformation(rotation=0,
              extent={{-58,-10},{-38,10}})));

      Modelica.Blocks.Sources.Constant Qref(k=0)
        annotation (Placement(transformation(extent={{-98,-6},{-86,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-98,-26},{-86,-14}})));
      Modelica.Blocks.Sources.Step Pref(
        height=0,
        offset=0.5,
        startTime=10)
        annotation (Placement(transformation(extent={{-98,14},{-86,26}})));
      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GridWithFault gridWithFault_Init(FaultVoltage=1, FaultTime=1)
                                                           annotation (Placement(
            transformation(rotation=0, extent={{42,-10},{62,10}})));
    equation

      connect(Qref.y, gFM_GFL_IBR_Init_SS.Q_ref_pu)
        annotation (Line(points={{-85.4,0},{-58,0}}, color={0,0,127}));
      connect(Vref.y, gFM_GFL_IBR_Init_SS.V_ref_pu)
        annotation (Line(points={{-85.4,-20},{-66,-20},{-66,-6},{-58,-6}},
                                                         color={0,0,127}));
      connect(Pref.y, gFM_GFL_IBR_Init_SS.P_ref_pu)
        annotation (Line(points={{-85.4,20},{-66,20},{-66,6},{-58,6}},
                                                       color={0,0,127}));
      connect(gFM_GFL_IBR_Init_SS.C, gridWithFault_Init.C)
        annotation (Line(points={{-38,6},{42,6}}, color={0,0,255}));
      connect(gFM_GFL_IBR_Init_SS.B, gridWithFault_Init.B)
        annotation (Line(points={{-38,0},{42,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR_Init_SS.A, gridWithFault_Init.A)
        annotation (Line(points={{-38,-6},{42,-6}}, color={0,0,255}));
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
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          Interval=1e-05,
          Tolerance=1e-06,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end GFM_InitNoFault;



    model GFM_InitLine
      "This GFM controller and Grid is initialized with initial condiction from termination of GFM_Test."
      constant Real line_inductance = 1e-3;
      constant Real line_resistance = 0.8;

      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GFM_GFL_IBR_Init_SS
                         gFM_GFL_IBR_Init_SS(r_damp=40.08173)
                                     annotation (Placement(transformation(rotation=0,
              extent={{-144,-30},{-84,30}})));

      Modelica.Blocks.Sources.Constant Qref(k=0)
        annotation (Placement(transformation(extent={{-176,-6},{-164,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-176,-24},{-164,-12}})));
      Modelica.Blocks.Sources.Step Pref(
        height=0.2,
        offset=0.5,
        startTime=1)
        annotation (Placement(transformation(extent={{-176,12},{-164,24}})));
      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GridWithFault gridWithFault_Init(
        FaultVoltage=0.98,
        FaultTime=5,
        FaultDuration=0.2)                                 annotation (Placement(
            transformation(rotation=0, extent={{110,-30},{170,30}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor(R=line_resistance)
        annotation (Placement(transformation(extent={{24,-10},{44,10}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor1(R=line_resistance)
        annotation (Placement(transformation(extent={{24,-28},{44,-8}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor2(R=line_resistance)
        annotation (Placement(transformation(extent={{24,8},{44,28}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor(L=line_inductance)
        annotation (Placement(transformation(extent={{52,8},{72,28}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor1(L=line_inductance)
        annotation (Placement(transformation(extent={{50,-10},{70,10}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor2(L=line_inductance)
        annotation (Placement(transformation(extent={{50,-28},{70,-8}})));
      Modelica.Electrical.Analog.Sensors.MultiSensor   multiSensor
        annotation (Placement(transformation(extent={{-56,8},{-36,28}})));
      Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1
        annotation (Placement(transformation(extent={{-32,-10},{-12,10}})));
      Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor2
        annotation (Placement(transformation(extent={{-12,-28},{8,-8}})));
      Modelica.Blocks.Interfaces.RealOutput i2
        "Current in the branch from p to n as output signal"
        annotation (Placement(transformation(extent={{-34,-76},{-14,-56}})));
      Modelica.Blocks.Interfaces.RealOutput i3
        "Current in the branch from p to n as output signal"
        annotation (Placement(transformation(extent={{-12,-92},{8,-72}})));
      Modelica.Electrical.Analog.Basic.Ground ground2
        annotation (Placement(transformation(extent={{-52,-44},{-40,-32}})));
    equation

      connect(Qref.y, gFM_GFL_IBR_Init_SS.Q_ref_pu)
        annotation (Line(points={{-163.4,0},{-144,0}},
                                                     color={0,0,127}));
      connect(Vref.y, gFM_GFL_IBR_Init_SS.V_ref_pu)
        annotation (Line(points={{-163.4,-18},{-144,-18}},
                                                         color={0,0,127}));
      connect(resistor.n, inductor1.p)
        annotation (Line(points={{44,0},{50,0}}, color={0,0,255}));
      connect(resistor2.n, inductor.p)
        annotation (Line(points={{44,18},{52,18}}, color={0,0,255}));
      connect(resistor1.n, inductor2.p)
        annotation (Line(points={{44,-18},{50,-18}}, color={0,0,255}));
      connect(inductor.n,gridWithFault_Init.C)
        annotation (Line(points={{72,18},{110,18}}, color={0,0,255}));
      connect(inductor1.n, gridWithFault_Init.B)
        annotation (Line(points={{70,0},{110,0}}, color={0,0,255}));
      connect(inductor2.n, gridWithFault_Init.A)
        annotation (Line(points={{70,-18},{110,-18}}, color={0,0,255}));
      connect(Pref.y, gFM_GFL_IBR_Init_SS.P_ref_pu)
        annotation (Line(points={{-163.4,18},{-144,18}}, color={0,0,127}));
      connect(gFM_GFL_IBR_Init_SS.A, currentSensor2.p)
        annotation (Line(points={{-84,-18},{-12,-18}}, color={0,0,255}));
      connect(currentSensor2.n, resistor1.p)
        annotation (Line(points={{8,-18},{24,-18}}, color={0,0,255}));
      connect(currentSensor1.n, resistor.p)
        annotation (Line(points={{-12,0},{24,0}}, color={0,0,255}));
      connect(currentSensor1.p, gFM_GFL_IBR_Init_SS.B)
        annotation (Line(points={{-32,0},{-84,0}}, color={0,0,255}));
      connect(currentSensor1.i, i2) annotation (Line(points={{-22,-11},{-24,-11},
              {-24,-66}}, color={0,0,127}));
      connect(currentSensor2.i, i3)
        annotation (Line(points={{-2,-29},{-2,-82}}, color={0,0,127}));
      connect(gFM_GFL_IBR_Init_SS.C, multiSensor.pc)
        annotation (Line(points={{-84,18},{-56,18}}, color={0,0,255}));
      connect(multiSensor.nc, resistor2.p)
        annotation (Line(points={{-36,18},{24,18}}, color={0,0,255}));
      connect(multiSensor.pv, multiSensor.pc) annotation (Line(points={{-46,28},{-70,
              28},{-70,18},{-56,18}}, color={0,0,255}));
      connect(ground2.p, multiSensor.nv) annotation (Line(points={{-46,-32},{-46,8}},
                                  color={0,0,255}));
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
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><h4></p><p>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          StopTime=10,
          Interval=1e-05,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end GFM_InitLine;

    model GFM_Transformer
      constant Real line_inductance = 0;
      constant Real line_resistance = 1000;

      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR gFM_GFL_IBR(r_damp=40)
                                                                          annotation (Placement(transformation(rotation=0,
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
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GridWithFault          gridWithFault(Vbase=
            230000, FaultVoltage=0.4)                                                                          annotation (Placement(
            transformation(rotation=0, extent={{180,-30},{240,30}})));
      Modelica.Electrical.Analog.Ideal.IdealTransformer
                                                   transformer1(n=1/35.38)
                 annotation (Placement(transformation(extent={{68,12},{88,32}})));
      Modelica.Electrical.Analog.Ideal.IdealTransformer
                                                   transformer2(n=1/35.38)
                 annotation (Placement(transformation(extent={{68,-20},{88,0}})));
      Modelica.Electrical.Analog.Ideal.IdealTransformer
                                                   transformer3(n=1/35.38)
                 annotation (Placement(transformation(extent={{68,-52},{88,-32}})));
      Modelica.Electrical.Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{94,-72},{114,-52}})));
      Modelica.Electrical.Analog.Sensors.VoltageSensor high annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={150,14})));
      Modelica.Electrical.Analog.Sensors.VoltageSensor low annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={50,16})));
    equation

      connect(Qref.y, gFM_GFL_IBR.Q_ref_pu)
        annotation (Line(points={{-79.4,0},{-62,0}}, color={0,0,127}));
      connect(Vref.y, gFM_GFL_IBR.V_ref_pu)
        annotation (Line(points={{-79.4,-18},{-62,-18}}, color={0,0,127}));
      connect(Pref.y, gFM_GFL_IBR.P_ref_pu)
        annotation (Line(points={{-79.4,18},{-62,18}}, color={0,0,127}));
      connect(transformer1.n2, transformer2.n2) annotation (Line(points={{88,12},{104,
              12},{104,-20},{88,-20}}, color={0,0,255}));
      connect(transformer3.n2, transformer2.n2) annotation (Line(points={{88,-52},{104,
              -52},{104,-20},{88,-20}}, color={0,0,255}));
      connect(transformer3.n2, ground.p)
        annotation (Line(points={{88,-52},{104,-52}}, color={0,0,255}));
      connect(high.n,gridWithFault.C)  annotation (Line(points={{150,24},{150,32},{170,
              32},{170,18},{180,18}}, color={0,0,255}));
      connect(high.p, gridWithFault.B)
        annotation (Line(points={{150,4},{150,0},{180,0}}, color={0,0,255}));
      connect(transformer2.p1, transformer1.n1)
        annotation (Line(points={{68,0},{68,12}}, color={0,0,255}));
      connect(transformer3.p1, transformer2.n1)
        annotation (Line(points={{68,-32},{68,-20}}, color={0,0,255}));
      connect(transformer3.n1, transformer1.p1) annotation (Line(points={{68,-52},{64,
              -52},{64,32},{68,32}}, color={0,0,255}));
      connect(low.n, transformer1.p1)
        annotation (Line(points={{50,26},{50,32},{68,32}}, color={0,0,255}));
      connect(low.p, transformer2.p1)
        annotation (Line(points={{50,6},{50,0},{68,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.C, transformer1.p1) annotation (Line(points={{-2,18},
              {24,18},{24,32},{68,32}}, color={0,0,255}));
      connect(gFM_GFL_IBR.B, transformer2.p1)
        annotation (Line(points={{-2,0},{68,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.A, transformer3.p1) annotation (Line(points={{-2,-18},{24,
              -18},{24,-32},{68,-32}}, color={0,0,255}));
      connect(transformer1.p2,gridWithFault.C)  annotation (Line(points={{88,32},
              {170,32},{170,18},{180,18}}, color={0,0,255}));
      connect(transformer2.p2, gridWithFault.B)
        annotation (Line(points={{88,0},{180,0}}, color={0,0,255}));
      connect(transformer3.p2, gridWithFault.A) annotation (Line(points={{88,-32},
              {170,-32},{170,-18},{180,-18}}, color={0,0,255}));
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
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(Interval=1e-05, __Dymola_Algorithm="Euler"));
    end GFM_Transformer;

    model Transformer_test
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GridWithFault gridWithFault(Vbase=
            230000,                                                                          FaultVoltage=0.4) annotation (Placement(
            transformation(rotation=0, extent={{100,-30},{160,30}})));
      Modelica.Electrical.Analog.Basic.Transformer transformer1(
        L1=0.00056,
        L2=0.23,
        M=0.011)
        annotation (Placement(transformation(extent={{-12,12},{8,32}})));
      Modelica.Electrical.Analog.Basic.Transformer transformer2(
        L1=0.00056,
        L2=0.23,
        M=0.011)
        annotation (Placement(transformation(extent={{-12,-20},{8,0}})));
      Modelica.Electrical.Analog.Basic.Transformer transformer3(
        L1=0.00056,
        L2=0.23,
        M=0.011)
        annotation (Placement(transformation(extent={{-12,-52},{8,-32}})));
      Modelica.Electrical.Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{14,-72},{34,-52}})));
      Modelica.Electrical.Analog.Sensors.VoltageSensor high annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={70,14})));
      Modelica.Electrical.Analog.Basic.Resistor resistor3(R=1.78)
        annotation (Placement(transformation(extent={{28,22},{48,42}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor4(R=1.78)
        annotation (Placement(transformation(extent={{28,-10},{48,10}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor5(R=1.78)
        annotation (Placement(transformation(extent={{28,-42},{48,-22}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor(R=1000) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-76,20})));
      Modelica.Electrical.Analog.Basic.Resistor resistor1(R=1000) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-76,0})));
      Modelica.Electrical.Analog.Basic.Resistor resistor2(R=1000) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-76,-20})));
      Modelica.Electrical.Analog.Basic.Ground ground1
        annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
      Modelica.Electrical.Analog.Sensors.VoltageSensor low annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-32,14})));
    equation

      connect(transformer1.n2, transformer2.n2) annotation (Line(points={{8,12},
              {24,12},{24,-20},{8,-20}}, color={0,0,255}));
      connect(transformer3.n2, transformer2.n2) annotation (Line(points={{8,-52},
              {24,-52},{24,-20},{8,-20}}, color={0,0,255}));
      connect(transformer3.n2, ground.p)
        annotation (Line(points={{8,-52},{24,-52}}, color={0,0,255}));
      connect(high.n,gridWithFault.C)  annotation (Line(points={{70,24},{70,32},
              {90,32},{90,18},{100,18}}, color={0,0,255}));
      connect(high.p, gridWithFault.B)
        annotation (Line(points={{70,4},{70,0},{100,0}}, color={0,0,255}));
      connect(transformer1.p2, resistor3.p)
        annotation (Line(points={{8,32},{28,32}}, color={0,0,255}));
      connect(resistor3.n,gridWithFault.C)  annotation (Line(points={{48,32},{
              90,32},{90,18},{100,18}}, color={0,0,255}));
      connect(transformer2.p2, resistor4.p)
        annotation (Line(points={{8,0},{28,0}}, color={0,0,255}));
      connect(resistor4.n, gridWithFault.B)
        annotation (Line(points={{48,0},{100,0}}, color={0,0,255}));
      connect(transformer3.p2, resistor5.p)
        annotation (Line(points={{8,-32},{28,-32}}, color={0,0,255}));
      connect(resistor5.n, gridWithFault.A) annotation (Line(points={{48,-32},{
              90,-32},{90,-18},{100,-18}}, color={0,0,255}));
      connect(resistor.n, resistor1.n) annotation (Line(points={{-86,20},{-90,
              20},{-90,0},{-86,0}}, color={0,0,255}));
      connect(resistor2.n, resistor1.n) annotation (Line(points={{-86,-20},{-90,
              -20},{-90,0},{-86,0}}, color={0,0,255}));
      connect(resistor2.n, ground1.p)
        annotation (Line(points={{-86,-20},{-90,-20}}, color={0,0,255}));
      connect(transformer2.p1, transformer1.n1)
        annotation (Line(points={{-12,0},{-12,12}}, color={0,0,255}));
      connect(transformer3.p1, transformer2.n1)
        annotation (Line(points={{-12,-32},{-12,-20}}, color={0,0,255}));
      connect(transformer3.n1, transformer1.p1) annotation (Line(points={{-12,
              -52},{-16,-52},{-16,32},{-12,32}}, color={0,0,255}));
      connect(resistor.p, transformer1.p1) annotation (Line(points={{-66,20},{
              -42,20},{-42,32},{-12,32}}, color={0,0,255}));
      connect(resistor1.p, transformer2.p1)
        annotation (Line(points={{-66,0},{-12,0}}, color={0,0,255}));
      connect(resistor2.p, transformer3.p1) annotation (Line(points={{-66,-20},
              {-42,-20},{-42,-32},{-12,-32}}, color={0,0,255}));
      connect(low.n, transformer1.p1) annotation (Line(points={{-32,24},{-32,32},
              {-12,32}}, color={0,0,255}));
      connect(low.p, transformer2.p1)
        annotation (Line(points={{-32,4},{-32,0},{-12,0}}, color={0,0,255}));
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
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          Interval=1e-06,
          Tolerance=1e-08,
          __Dymola_Algorithm="Euler"));
    end Transformer_test;

    model GFM_Test_no_grid
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      Electrical.Controls.IEEE_CIGRE.GFM.tools.GFM_GFL_IBR_test
        gFM_GFL_IBR_test(
        r_damp=40.08173,
        Vbase=0,
        Sbase=0,
        VDC_base=0,
        w_type=0) annotation (Placement(transformation(rotation=0, extent={{-62,
                -30},{-2,30}})));

      Modelica.Blocks.Sources.Constant Qref(k=0)
        annotation (Placement(transformation(extent={{-92,-6},{-80,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-92,-24},{-80,-12}})));
      Modelica.Blocks.Sources.Step Pref(
        height=0.2,
        offset=0.5,
        startTime=5)
        annotation (Placement(transformation(extent={{-92,12},{-80,24}})));
    equation

      connect(Qref.y, gFM_GFL_IBR_test.Q_ref_pu)
        annotation (Line(points={{-79.4,0},{-62,0}}, color={0,0,127}));
      connect(Vref.y, gFM_GFL_IBR_test.V_ref_pu)
        annotation (Line(points={{-79.4,-18},{-62,-18}}, color={0,0,127}));
      connect(Pref.y, gFM_GFL_IBR_test.P_ref_pu)
        annotation (Line(points={{-79.4,18},{-62,18}}, color={0,0,127}));
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
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          StopTime=2,
          Interval=1e-05,
          Tolerance=1e-08,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"),
        __Dymola_experimentFlags(Advanced(
            InlineMethod=0,
            InlineOrder=2,
            InlineFixedStep=1e-05)));
    end GFM_Test_no_grid;

    model GFM_EMTPFault_Test
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.EMTPGrid
               eMTPGrid
        annotation (Placement(transformation(extent={{60,-20},{100,20}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.ShortFault
                 shortFault(line_capacitance=1e-6)
        annotation (Placement(transformation(extent={{0,-28},{40,20}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR          gFM_GFL_IBR(r_damp=
            40.08173)                                                     annotation (Placement(transformation(rotation=0,
              extent={{-56,-20},{-16,20}})));
      Modelica.Blocks.Sources.Constant Qref(k=0)
        annotation (Placement(transformation(extent={{-100,-6},{-88,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-82,-18},{-70,-6}})));
      Modelica.Blocks.Sources.Step Pref(
        height=0.2,
        offset=0.5,
        startTime=2)
        annotation (Placement(transformation(extent={{-82,6},{-70,18}})));
    equation

      connect(shortFault.C_n,eMTPGrid. C)
        annotation (Line(points={{40,12},{60,12}}, color={0,0,255}));
      connect(shortFault.B_n,eMTPGrid. B)
        annotation (Line(points={{40,0},{60,0}}, color={0,0,255}));
      connect(shortFault.A_n,eMTPGrid. A)
        annotation (Line(points={{40,-12},{60,-12}}, color={0,0,255}));
      connect(Qref.y,gFM_GFL_IBR. Q_ref_pu)
        annotation (Line(points={{-87.4,0},{-56,0}}, color={0,0,127}));
      connect(Vref.y,gFM_GFL_IBR. V_ref_pu)
        annotation (Line(points={{-69.4,-12},{-56,-12}}, color={0,0,127}));
      connect(Pref.y,gFM_GFL_IBR. P_ref_pu)
        annotation (Line(points={{-69.4,12},{-56,12}}, color={0,0,127}));
      connect(gFM_GFL_IBR.A, shortFault.A)
        annotation (Line(points={{-16,-12},{0,-12}}, color={0,0,255}));
      connect(gFM_GFL_IBR.B, shortFault.B)
        annotation (Line(points={{-16,0},{0,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.C, shortFault.C)
        annotation (Line(points={{-16,12},{0,12}}, color={0,0,255}));
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
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          StopTime=10,
          Interval=0.001,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end GFM_EMTPFault_Test;

    model GFM_EMTPFull_Test
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR          gFM_GFL_IBR(r_damp=
            40.08173)                                                     annotation (Placement(transformation(rotation=0,
              extent={{-80,-20},{-40,20}})));
      Modelica.Blocks.Sources.Constant Qref(k=0)
        annotation (Placement(transformation(extent={{-124,-6},{-112,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-106,-18},{-94,-6}})));
      Modelica.Blocks.Sources.Step Pref(
        height=0.2,
        offset=0.5,
        startTime=2)
        annotation (Placement(transformation(extent={{-106,6},{-94,18}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.EMTPGrid
               eMTPGrid(Vbase=230000)
        annotation (Placement(transformation(extent={{94,-20},{134,20}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.SmoothShortFault
                 smoothShortFault(R=5, line_capacitance=1e-6)
        annotation (Placement(transformation(extent={{76,-28},{36,20}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.EMTPtransformer
                      eMTPtransformer(f_cut=500, Rtf_delta=0.3)
        annotation (Placement(transformation(extent={{20,-20},{-20,20}})));
    equation

      connect(Qref.y,gFM_GFL_IBR. Q_ref_pu)
        annotation (Line(points={{-111.4,0},{-80,0}},color={0,0,127}));
      connect(Vref.y,gFM_GFL_IBR. V_ref_pu)
        annotation (Line(points={{-93.4,-12},{-80,-12}}, color={0,0,127}));
      connect(Pref.y,gFM_GFL_IBR. P_ref_pu)
        annotation (Line(points={{-93.4,12},{-80,12}}, color={0,0,127}));
      connect(smoothShortFault.C, eMTPGrid.C)
        annotation (Line(points={{76,12},{94,12}}, color={0,0,255}));
      connect(smoothShortFault.B, eMTPGrid.B)
        annotation (Line(points={{76,0},{94,0}}, color={0,0,255}));
      connect(smoothShortFault.A, eMTPGrid.A)
        annotation (Line(points={{76,-12},{94,-12}}, color={0,0,255}));
      connect(eMTPtransformer.Cy, smoothShortFault.C_n)
        annotation (Line(points={{19.6,12},{36,12}}, color={0,0,255}));
      connect(eMTPtransformer.By, smoothShortFault.B_n)
        annotation (Line(points={{20,0},{36,0}}, color={0,0,255}));
      connect(eMTPtransformer.Ay, smoothShortFault.A_n)
        annotation (Line(points={{20,-12},{36,-12}}, color={0,0,255}));
      connect(gFM_GFL_IBR.C, eMTPtransformer.Cd)
        annotation (Line(points={{-40,12},{-20,12}}, color={0,0,255}));
      connect(gFM_GFL_IBR.B, eMTPtransformer.Bd)
        annotation (Line(points={{-40,0},{-20,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.A, eMTPtransformer.Ad)
        annotation (Line(points={{-40,-12},{-20,-12}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -140,-100},{140,100}}),                             graphics={
            Ellipse(lineColor = {75,138,73},
                    fillColor={255,255,255},
                    fillPattern = FillPattern.Solid,
                    extent={{-100,-100},{100,100}}),
            Polygon(lineColor = {0,0,255},
                    fillColor = {75,138,73},
                    pattern = LinePattern.None,
                    fillPattern = FillPattern.Solid,
                    points={{-36,60},{64,0},{-36,-60},{-36,60}})}),  Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{
                140,100}})),
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          StopTime=10,
          Interval=0.001,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end GFM_EMTPFull_Test;

    model GFM_EMTPFull_Mod_TF_Test
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR          gFM_GFL_IBR(r_damp=
            40.08173)                                                     annotation (Placement(transformation(rotation=0,
              extent={{-86,-20},{-46,20}})));
      Modelica.Blocks.Sources.Constant Qref(k=0.07)
        annotation (Placement(transformation(extent={{-132,-6},{-120,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-132,-26},{-120,-14}})));
      Modelica.Blocks.Sources.Step Pref(
        height=0.2,
        offset=0.5,
        startTime=2)
        annotation (Placement(transformation(extent={{-132,14},{-120,26}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.EMTPGrid
               eMTPGrid(Vbase=230000)
        annotation (Placement(transformation(extent={{88,-20},{128,20}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.SmoothShortFault
                 smoothShortFault(
        R=5,
        faultTime=3,
        line_capacitance=1e-6,
        f_cut=1e3)
        annotation (Placement(transformation(extent={{70,-28},{30,20}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.EMTPtransformerZeroSeq
                      eMTPtransformerZeroSeq(f_cut=500, Rtf_delta=0.3)
        annotation (Placement(transformation(extent={{20,-20},{-36,20}})));
    equation

      connect(Qref.y,gFM_GFL_IBR. Q_ref_pu)
        annotation (Line(points={{-119.4,0},{-86,0}},color={0,0,127}));
      connect(Vref.y,gFM_GFL_IBR. V_ref_pu)
        annotation (Line(points={{-119.4,-20},{-100,-20},{-100,-12},{-86,-12}},
                                                         color={0,0,127}));
      connect(Pref.y,gFM_GFL_IBR. P_ref_pu)
        annotation (Line(points={{-119.4,20},{-100,20},{-100,12},{-86,12}},
                                                       color={0,0,127}));
      connect(smoothShortFault.C, eMTPGrid.C)
        annotation (Line(points={{70,12},{88,12}}, color={0,0,255}));
      connect(smoothShortFault.B, eMTPGrid.B)
        annotation (Line(points={{70,0},{88,0}}, color={0,0,255}));
      connect(smoothShortFault.A, eMTPGrid.A)
        annotation (Line(points={{70,-12},{88,-12}}, color={0,0,255}));
      connect(eMTPtransformerZeroSeq.Cy, smoothShortFault.C_n)
        annotation (Line(points={{19.6,12},{30,12}}, color={0,0,255}));
      connect(eMTPtransformerZeroSeq.By, smoothShortFault.B_n)
        annotation (Line(points={{20,0},{30,0}}, color={0,0,255}));
      connect(eMTPtransformerZeroSeq.Ay, smoothShortFault.A_n)
        annotation (Line(points={{20,-12},{30,-12}}, color={0,0,255}));
      connect(gFM_GFL_IBR.C, eMTPtransformerZeroSeq.Cd)
        annotation (Line(points={{-46,12},{-36,12}}, color={0,0,255}));
      connect(gFM_GFL_IBR.B, eMTPtransformerZeroSeq.Bd)
        annotation (Line(points={{-46,0},{-36,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.A, eMTPtransformerZeroSeq.Ad)
        annotation (Line(points={{-46,-12},{-36,-12}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -140,-100},{140,100}}),                             graphics={
            Ellipse(lineColor = {75,138,73},
                    fillColor={255,255,255},
                    fillPattern = FillPattern.Solid,
                    extent={{-100,-100},{100,100}}),
            Polygon(lineColor = {0,0,255},
                    fillColor = {75,138,73},
                    pattern = LinePattern.None,
                    fillPattern = FillPattern.Solid,
                    points={{-36,60},{64,0},{-36,-60},{-36,60}})}),  Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{
                140,100}})),
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          StopTime=10,
          Interval=0.001,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end GFM_EMTPFull_Mod_TF_Test;

    model GFM_EMTPFullPSCAD
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR          gFM_GFL_IBR(r_damp=
            40.08173)                                                     annotation (Placement(transformation(rotation=0,
              extent={{-86,-20},{-46,20}})));
      Modelica.Blocks.Sources.Constant Qref(k=0.06)
        annotation (Placement(transformation(extent={{-132,-6},{-120,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-132,-26},{-120,-14}})));
      Modelica.Blocks.Sources.Step Pref(
        height=0.2,
        offset=0.5,
        startTime=2)
        annotation (Placement(transformation(extent={{-132,14},{-120,26}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.SmoothShortFault
                 smoothShortFault(
        R=5,
        line_capacitance=1e-6,
        f_cut=1e3)
        annotation (Placement(transformation(extent={{70,-28},{30,20}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.EMTPtransformerZeroSeq
                      eMTPtransformerZeroSeq(f_cut=500, Rtf_delta=0.3)
        annotation (Placement(transformation(extent={{20,-20},{-36,20}})));
      Electrical.Controls.IEEE_CIGRE.GFM_PSCAD.GridComponents.GridWithFault
        gridWithFault(
        Vbase=230000,
        Vgrid=1,
        FaultVoltage=0.95,
        FaultTime=6,
        FaultDuration=10)
        annotation (Placement(transformation(extent={{100,-20},{140,20}})));
    equation

      connect(Qref.y,gFM_GFL_IBR. Q_ref_pu)
        annotation (Line(points={{-119.4,0},{-86,0}},color={0,0,127}));
      connect(Vref.y,gFM_GFL_IBR. V_ref_pu)
        annotation (Line(points={{-119.4,-20},{-100,-20},{-100,-12},{-86,-12}},
                                                         color={0,0,127}));
      connect(Pref.y,gFM_GFL_IBR. P_ref_pu)
        annotation (Line(points={{-119.4,20},{-100,20},{-100,12},{-86,12}},
                                                       color={0,0,127}));
      connect(eMTPtransformerZeroSeq.Cy, smoothShortFault.C_n)
        annotation (Line(points={{19.6,12},{30,12}}, color={0,0,255}));
      connect(eMTPtransformerZeroSeq.By, smoothShortFault.B_n)
        annotation (Line(points={{20,0},{30,0}}, color={0,0,255}));
      connect(eMTPtransformerZeroSeq.Ay, smoothShortFault.A_n)
        annotation (Line(points={{20,-12},{30,-12}}, color={0,0,255}));
      connect(gFM_GFL_IBR.C, eMTPtransformerZeroSeq.Cd)
        annotation (Line(points={{-46,12},{-36,12}}, color={0,0,255}));
      connect(gFM_GFL_IBR.B, eMTPtransformerZeroSeq.Bd)
        annotation (Line(points={{-46,0},{-36,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.A, eMTPtransformerZeroSeq.Ad)
        annotation (Line(points={{-46,-12},{-36,-12}}, color={0,0,255}));
      connect(smoothShortFault.B, gridWithFault.B)
        annotation (Line(points={{70,0},{100,0}}, color={0,0,255}));
      connect(smoothShortFault.C, gridWithFault.C)
        annotation (Line(points={{70,12},{100,12}}, color={0,0,255}));
      connect(smoothShortFault.A, gridWithFault.A)
        annotation (Line(points={{70,-12},{100,-12}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -140,-100},{140,100}}),                             graphics={
            Ellipse(lineColor = {75,138,73},
                    fillColor={255,255,255},
                    fillPattern = FillPattern.Solid,
                    extent={{-100,-100},{100,100}}),
            Polygon(lineColor = {0,0,255},
                    fillColor = {75,138,73},
                    pattern = LinePattern.None,
                    fillPattern = FillPattern.Solid,
                    points={{-36,60},{64,0},{-36,-60},{-36,60}})}),  Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{
                140,100}})),
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          StopTime=10,
          Interval=0.001,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end GFM_EMTPFullPSCAD;

    model DYMOLA_GFL_Fstep
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR          gFM_GFL_IBR(r_damp=
            40.08173)                                                     annotation (Placement(transformation(rotation=0,
              extent={{-86,-20},{-46,20}})));
      Modelica.Blocks.Sources.Constant Qref(k=0.07)
        annotation (Placement(transformation(extent={{-124,-6},{-112,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-124,-26},{-112,-14}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.EMTPtransformerZeroSeq
                      eMTPtransformerZeroSeq(f_cut=500, Rtf_delta=0.3)
        annotation (Placement(transformation(extent={{20,-20},{-36,20}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GridFStep gridFStep(
          Vbase=230000, FstepTime=2)
        annotation (Placement(transformation(extent={{44,-20},{84,20}})));
      Modelica.Blocks.Sources.Constant Vref1(k=0.5)
        annotation (Placement(transformation(extent={{-124,12},{-112,24}})));
    equation

      connect(Qref.y,gFM_GFL_IBR. Q_ref_pu)
        annotation (Line(points={{-111.4,0},{-86,0}},color={0,0,127}));
      connect(Vref.y,gFM_GFL_IBR. V_ref_pu)
        annotation (Line(points={{-111.4,-20},{-88,-20},{-88,-12},{-86,-12}},
                                                         color={0,0,127}));
      connect(gFM_GFL_IBR.C, eMTPtransformerZeroSeq.Cd)
        annotation (Line(points={{-46,12},{-36,12}}, color={0,0,255}));
      connect(gFM_GFL_IBR.B, eMTPtransformerZeroSeq.Bd)
        annotation (Line(points={{-46,0},{-36,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.A, eMTPtransformerZeroSeq.Ad)
        annotation (Line(points={{-46,-12},{-36,-12}}, color={0,0,255}));
      connect(eMTPtransformerZeroSeq.Ay, gridFStep.A)
        annotation (Line(points={{20,-12},{44,-12}}, color={0,0,255}));
      connect(eMTPtransformerZeroSeq.By, gridFStep.B)
        annotation (Line(points={{20,0},{44,0}}, color={0,0,255}));
      connect(eMTPtransformerZeroSeq.Cy, gridFStep.C)
        annotation (Line(points={{19.6,12},{44,12}}, color={0,0,255}));
      connect(Vref1.y, gFM_GFL_IBR.P_ref_pu) annotation (Line(points={{-111.4,
              18},{-96,18},{-96,12},{-86,12}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -140,-100},{140,100}}),                             graphics={
            Ellipse(lineColor = {75,138,73},
                    fillColor={255,255,255},
                    fillPattern = FillPattern.Solid,
                    extent={{-100,-100},{100,100}}),
            Polygon(lineColor = {0,0,255},
                    fillColor = {75,138,73},
                    pattern = LinePattern.None,
                    fillPattern = FillPattern.Solid,
                    points={{-36,60},{64,0},{-36,-60},{-36,60}})}),  Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{
                140,100}})),
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          StopTime=10,
          Interval=0.001,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end DYMOLA_GFL_Fstep;

    model DYMOLA_GFL_Vstep
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR          gFM_GFL_IBR(r_damp=
            40.08173)                                                     annotation (Placement(transformation(rotation=0,
              extent={{-86,-20},{-46,20}})));
      Modelica.Blocks.Sources.Constant Qref(k=0.03)
        annotation (Placement(transformation(extent={{-124,-6},{-112,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-124,-26},{-112,-14}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.EMTPtransformerZeroSeq
                      eMTPtransformerZeroSeq(f_cut=500, Rtf_delta=0.3)
        annotation (Placement(transformation(extent={{20,-20},{-36,20}})));
      Modelica.Blocks.Sources.Constant Vref1(k=0.5)
        annotation (Placement(transformation(extent={{-124,12},{-112,24}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GridWithFault
        gridWithFault(
        Vbase=230000,
        FaultVoltage=0.95,
        FaultTime=2,
        FaultDuration=10)
        annotation (Placement(transformation(extent={{48,-20},{88,20}})));
    equation

      connect(Qref.y,gFM_GFL_IBR. Q_ref_pu)
        annotation (Line(points={{-111.4,0},{-86,0}},color={0,0,127}));
      connect(Vref.y,gFM_GFL_IBR. V_ref_pu)
        annotation (Line(points={{-111.4,-20},{-88,-20},{-88,-12},{-86,-12}},
                                                         color={0,0,127}));
      connect(gFM_GFL_IBR.C, eMTPtransformerZeroSeq.Cd)
        annotation (Line(points={{-46,12},{-36,12}}, color={0,0,255}));
      connect(gFM_GFL_IBR.B, eMTPtransformerZeroSeq.Bd)
        annotation (Line(points={{-46,0},{-36,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.A, eMTPtransformerZeroSeq.Ad)
        annotation (Line(points={{-46,-12},{-36,-12}}, color={0,0,255}));
      connect(Vref1.y, gFM_GFL_IBR.P_ref_pu) annotation (Line(points={{-111.4,
              18},{-96,18},{-96,12},{-86,12}}, color={0,0,127}));
      connect(eMTPtransformerZeroSeq.Cy, gridWithFault.C)
        annotation (Line(points={{19.6,12},{48,12}}, color={0,0,255}));
      connect(eMTPtransformerZeroSeq.By, gridWithFault.B)
        annotation (Line(points={{20,0},{48,0}}, color={0,0,255}));
      connect(eMTPtransformerZeroSeq.Ay, gridWithFault.A)
        annotation (Line(points={{20,-12},{48,-12}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -140,-100},{140,100}}),                             graphics={
            Ellipse(lineColor = {75,138,73},
                    fillColor={255,255,255},
                    fillPattern = FillPattern.Solid,
                    extent={{-100,-100},{100,100}}),
            Polygon(lineColor = {0,0,255},
                    fillColor = {75,138,73},
                    pattern = LinePattern.None,
                    fillPattern = FillPattern.Solid,
                    points={{-36,60},{64,0},{-36,-60},{-36,60}})}),  Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{
                140,100}})),
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          StopTime=10,
          Interval=0.001,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end DYMOLA_GFL_Vstep;

    model DYMOLA_GFL_Pramp
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR          gFM_GFL_IBR(r_damp=
            40.08173)                                                     annotation (Placement(transformation(rotation=0,
              extent={{-86,-20},{-46,20}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-124,-26},{-112,-14}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.EMTPtransformerZeroSeq
                      eMTPtransformerZeroSeq(f_cut=500, Rtf_delta=0.3)
        annotation (Placement(transformation(extent={{20,-20},{-36,20}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GridWithFault
        gridWithFault(
        Vbase=230000,
        FaultVoltage=0.95,
        FaultTime=10,
        FaultDuration=0.1)
        annotation (Placement(transformation(extent={{48,-20},{88,20}})));
      Modelica.Blocks.Sources.Ramp ramp(
        height=0.4,
        duration=0.8,
        offset=0,
        startTime=2)
        annotation (Placement(transformation(extent={{-124,16},{-112,28}})));
      Modelica.Blocks.Sources.Ramp ramp1(
        height=0.05,
        duration=0.8,
        offset=-0.03,
        startTime=2)
        annotation (Placement(transformation(extent={{-128,-6},{-116,6}})));
    equation

      connect(Vref.y,gFM_GFL_IBR. V_ref_pu)
        annotation (Line(points={{-111.4,-20},{-88,-20},{-88,-12},{-86,-12}},
                                                         color={0,0,127}));
      connect(gFM_GFL_IBR.C, eMTPtransformerZeroSeq.Cd)
        annotation (Line(points={{-46,12},{-36,12}}, color={0,0,255}));
      connect(gFM_GFL_IBR.B, eMTPtransformerZeroSeq.Bd)
        annotation (Line(points={{-46,0},{-36,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.A, eMTPtransformerZeroSeq.Ad)
        annotation (Line(points={{-46,-12},{-36,-12}}, color={0,0,255}));
      connect(eMTPtransformerZeroSeq.Cy, gridWithFault.C)
        annotation (Line(points={{19.6,12},{48,12}}, color={0,0,255}));
      connect(eMTPtransformerZeroSeq.By, gridWithFault.B)
        annotation (Line(points={{20,0},{48,0}}, color={0,0,255}));
      connect(eMTPtransformerZeroSeq.Ay, gridWithFault.A)
        annotation (Line(points={{20,-12},{48,-12}}, color={0,0,255}));
      connect(ramp.y, gFM_GFL_IBR.P_ref_pu) annotation (Line(points={{-111.4,22},
              {-96,22},{-96,12},{-86,12}}, color={0,0,127}));
      connect(ramp1.y, gFM_GFL_IBR.Q_ref_pu)
        annotation (Line(points={{-115.4,0},{-86,0}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -140,-100},{140,100}}),                             graphics={
            Ellipse(lineColor = {75,138,73},
                    fillColor={255,255,255},
                    fillPattern = FillPattern.Solid,
                    extent={{-100,-100},{100,100}}),
            Polygon(lineColor = {0,0,255},
                    fillColor = {75,138,73},
                    pattern = LinePattern.None,
                    fillPattern = FillPattern.Solid,
                    points={{-36,60},{64,0},{-36,-60},{-36,60}})}),  Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{
                140,100}})),
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          StopTime=10,
          Interval=0.001,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end DYMOLA_GFL_Pramp;

    model VSCperPhase
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      Modelica.Electrical.Analog.Sources.SignalVoltage IGBTaverage annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={-100,-18})));
      Modelica.Electrical.Analog.Basic.Resistor R_Damp annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-28,-18})));
      Modelica.Electrical.Analog.Basic.Inductor L_Filter
        annotation (Placement(transformation(extent={{-74,10},{-54,-10}})));
      Modelica.Electrical.Analog.Basic.Capacitor C_Filter annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-46,-18})));
      Modelica.Electrical.Analog.Sensors.PotentialSensor V_Grid annotation (
          Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=90,
            origin={-28,10})));
      Modelica.Electrical.Analog.Sensors.CurrentSensor I_Bridge
        annotation (Placement(transformation(extent={{-92,6},{-80,-6}})));
      Modelica.Electrical.Analog.Sensors.CurrentSensor I_Grid
        annotation (Placement(transformation(extent={{-22,6},{-10,-6}})));
    equation

      connect(IGBTaverage.p, I_Bridge.p) annotation (Line(points={{-100,-8},{
              -100,0},{-92,0}}, color={0,0,255}));
      connect(I_Bridge.n, L_Filter.p)
        annotation (Line(points={{-80,0},{-74,0}}, color={0,0,255}));
      connect(C_Filter.p, L_Filter.n)
        annotation (Line(points={{-46,-8},{-46,0},{-54,0}}, color={0,0,255}));
      connect(R_Damp.p, L_Filter.n)
        annotation (Line(points={{-28,-8},{-28,0},{-54,0}}, color={0,0,255}));
      connect(I_Grid.p, L_Filter.n)
        annotation (Line(points={{-22,0},{-54,0}}, color={0,0,255}));
      connect(V_Grid.p, L_Filter.n)
        annotation (Line(points={{-28,4},{-28,0},{-54,0}}, color={0,0,255}));
      connect(IGBTaverage.n, C_Filter.n) annotation (Line(points={{-100,-28},{
              -100,-32},{-46,-32},{-46,-28}}, color={0,0,255}));
      connect(R_Damp.n, C_Filter.n) annotation (Line(points={{-28,-28},{-28,-32},
              {-46,-32},{-46,-28}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -140,-100},{140,100}}),                             graphics={
            Ellipse(lineColor = {75,138,73},
                    fillColor={255,255,255},
                    fillPattern = FillPattern.Solid,
                    extent={{-100,-100},{100,100}}),
            Polygon(lineColor = {0,0,255},
                    fillColor = {75,138,73},
                    pattern = LinePattern.None,
                    fillPattern = FillPattern.Solid,
                    points={{-36,60},{64,0},{-36,-60},{-36,60}})}),  Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{
                140,100}})),
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          StopTime=10,
          Interval=0.001,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end VSCperPhase;
  end GFM;

  package GFM_PSCAD
    extends Modelica.Icons.ExamplesPackage;
    package ReadMe "Read this before running the model."
      extends Modelica.Icons.Information;
      annotation (Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br>GFM_TestNoFault will save the model termination status in your workspace. it generate<b> list.dat </b>file. </p>
<p><br>GFM_InitNoFault will load the termination state from <b>list.dat</b> file as initial condition to prevent initial transient. </p>
<p><br>GFM_InitLine will load the termination state from <b>list.dat</b> file as initial condition to prevent initial transient. </p>
<h4><span style=\"background-color: #ffffff\">Pre-Configuration </span></h4>
<p>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</p>
<p>In Dymola the experiment annotation shoul result in the additional attributes.</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;</p>
</html>"));
    end ReadMe;

    model GFM_Test
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      Modelica.Blocks.Sources.Constant Qref(k=0)
        annotation (Placement(transformation(extent={{-92,-6},{-80,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-94,-46},{-82,-34}})));
      Modelica.Blocks.Sources.Step Pref(
        height=0.2,
        offset=0.2,
        startTime=2)
        annotation (Placement(transformation(extent={{-92,34},{-80,46}})));
      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GridWithFault gridWithFault(Vbase=650)        annotation (Placement(
            transformation(rotation=0, extent={{100,-28},{158,30}})));
      Electrical.Controls.IEEE_CIGRE.GFM_PSCAD.GFM_GFL_IBR_PSCAD gFM_GFL_IBR
        annotation (Placement(transformation(extent={{-50,-28},{8,30}})));
      Electrical.Controls.IEEE_CIGRE.GFM_PSCAD.GridComponents.Line_R line_R(
          Resistance=0.005)
        annotation (Placement(transformation(extent={{22,-28},{80,30}})));
    equation

      connect(Vref.y, gFM_GFL_IBR.V_ref_pu) annotation (Line(points={{-81.4,-40},{-60,
              -40},{-60,-16.4},{-50,-16.4}}, color={0,0,127}));
      connect(Qref.y, gFM_GFL_IBR.Q_ref_pu)
        annotation (Line(points={{-79.4,0},{-78,1},{-50,1}}, color={0,0,127}));
      connect(Pref.y, gFM_GFL_IBR.P_ref_pu) annotation (Line(points={{-79.4,40},{-60,
              40},{-60,18.4},{-50,18.4}}, color={0,0,127}));
      connect(gFM_GFL_IBR.C, line_R.p2)
        annotation (Line(points={{8,18.4},{22,18.4}}, color={0,0,255}));
      connect(gFM_GFL_IBR.B, line_R.p)
        annotation (Line(points={{8,1},{22,1}}, color={0,0,255}));
      connect(gFM_GFL_IBR.A, line_R.p1)
        annotation (Line(points={{8,-16.4},{22,-16.4}}, color={0,0,255}));
      connect(line_R.n2, gridWithFault.C)
        annotation (Line(points={{80,18.4},{100,18.4}}, color={0,0,255}));
      connect(line_R.n, gridWithFault.B)
        annotation (Line(points={{80,1},{100,1}}, color={0,0,255}));
      connect(line_R.n1, gridWithFault.A)
        annotation (Line(points={{80,-16.4},{100,-16.4}}, color={0,0,255}));
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
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          StopTime=10,
          Interval=0.001,
          __Dymola_fixedstepsize=2e-05,
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
      connect(gFM_GFL_IBR.C, gridWithFault.C)
        annotation (Line(points={{-2,18},{-2,18},{28,18}}, color={0,0,255}));
      connect(gridWithFault.B, gFM_GFL_IBR.B)
        annotation (Line(points={{28,0},{-2,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.A, gridWithFault.A)
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
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"));
    end GFM_TestNoFault;

    model GFM_SaveInit
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
            transformation(rotation=0, extent={{36,-30},{96,30}})));
    equation

      connect(Qref.y, gFM_GFL_IBR.Q_ref_pu)
        annotation (Line(points={{-79.4,0},{-62,0}}, color={0,0,127}));
      connect(Vref.y, gFM_GFL_IBR.V_ref_pu)
        annotation (Line(points={{-79.4,-18},{-62,-18}}, color={0,0,127}));
      connect(Pref.y, gFM_GFL_IBR.P_ref_pu)
        annotation (Line(points={{-79.4,18},{-62,18}}, color={0,0,127}));
      connect(gFM_GFL_IBR.C, gridWithFault.C)
        annotation (Line(points={{-2,18},{36,18}}, color={0,0,255}));
      connect(gFM_GFL_IBR.B, gridWithFault.B)
        annotation (Line(points={{-2,0},{36,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.A, gridWithFault.A)
        annotation (Line(points={{-2,-18},{36,-18}}, color={0,0,255}));
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
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(Interval=1e-05, __Dymola_Algorithm="Euler"));
    end GFM_SaveInit;

    model GFM_InitNoFault
      "This GFM controller and Grid is initialized with initial condiction from termination of GFM_Test"
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GFM_GFL_IBR_Init_SS
                         gFM_GFL_IBR_Init_SS
                                     annotation (Placement(transformation(rotation=0,
              extent={{-58,-10},{-38,10}})));

      Modelica.Blocks.Sources.Constant Qref(k=0)
        annotation (Placement(transformation(extent={{-98,-6},{-86,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-98,-26},{-86,-14}})));
      Modelica.Blocks.Sources.Step Pref(
        height=0,
        offset=0.5,
        startTime=10)
        annotation (Placement(transformation(extent={{-98,14},{-86,26}})));
      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GridWithFault gridWithFault_Init(FaultVoltage=1, FaultTime=1)
                                                           annotation (Placement(
            transformation(rotation=0, extent={{42,-10},{62,10}})));
    equation

      connect(Qref.y, gFM_GFL_IBR_Init_SS.Q_ref_pu)
        annotation (Line(points={{-85.4,0},{-58,0}}, color={0,0,127}));
      connect(Vref.y, gFM_GFL_IBR_Init_SS.V_ref_pu)
        annotation (Line(points={{-85.4,-20},{-66,-20},{-66,-6},{-58,-6}},
                                                         color={0,0,127}));
      connect(Pref.y, gFM_GFL_IBR_Init_SS.P_ref_pu)
        annotation (Line(points={{-85.4,20},{-66,20},{-66,6},{-58,6}},
                                                       color={0,0,127}));
      connect(gFM_GFL_IBR_Init_SS.C, gridWithFault_Init.C)
        annotation (Line(points={{-38,6},{42,6}}, color={0,0,255}));
      connect(gFM_GFL_IBR_Init_SS.B, gridWithFault_Init.B)
        annotation (Line(points={{-38,0},{42,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR_Init_SS.A, gridWithFault_Init.A)
        annotation (Line(points={{-38,-6},{42,-6}}, color={0,0,255}));
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
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          Interval=1e-05,
          Tolerance=1e-06,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end GFM_InitNoFault;

    model GFM_InitLine
      "This GFM controller and Grid is initialized with initial condiction from termination of GFM_Test."
      constant Real line_inductance = 1e-3;
      constant Real line_resistance = 0.8;

      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GFM_GFL_IBR_Init_SS
                         gFM_GFL_IBR_Init_SS(r_damp=40.08173)
                                     annotation (Placement(transformation(rotation=0,
              extent={{-144,-30},{-84,30}})));

      Modelica.Blocks.Sources.Constant Qref(k=0)
        annotation (Placement(transformation(extent={{-176,-6},{-164,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-176,-24},{-164,-12}})));
      Modelica.Blocks.Sources.Step Pref(
        height=0.2,
        offset=0.5,
        startTime=1)
        annotation (Placement(transformation(extent={{-176,12},{-164,24}})));
      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GridWithFault gridWithFault_Init(
        FaultVoltage=0.98,
        FaultTime=5,
        FaultDuration=0.2)                                 annotation (Placement(
            transformation(rotation=0, extent={{110,-30},{170,30}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor(R=line_resistance)
        annotation (Placement(transformation(extent={{24,-10},{44,10}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor1(R=line_resistance)
        annotation (Placement(transformation(extent={{24,-28},{44,-8}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor2(R=line_resistance)
        annotation (Placement(transformation(extent={{24,8},{44,28}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor(L=line_inductance)
        annotation (Placement(transformation(extent={{52,8},{72,28}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor1(L=line_inductance)
        annotation (Placement(transformation(extent={{50,-10},{70,10}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor2(L=line_inductance)
        annotation (Placement(transformation(extent={{50,-28},{70,-8}})));
      Modelica.Electrical.Analog.Sensors.MultiSensor   multiSensor
        annotation (Placement(transformation(extent={{-56,8},{-36,28}})));
      Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1
        annotation (Placement(transformation(extent={{-32,-10},{-12,10}})));
      Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor2
        annotation (Placement(transformation(extent={{-12,-28},{8,-8}})));
      Modelica.Blocks.Interfaces.RealOutput i2
        "Current in the branch from p to n as output signal"
        annotation (Placement(transformation(extent={{-34,-76},{-14,-56}})));
      Modelica.Blocks.Interfaces.RealOutput i3
        "Current in the branch from p to n as output signal"
        annotation (Placement(transformation(extent={{-12,-92},{8,-72}})));
      Modelica.Electrical.Analog.Basic.Ground ground2
        annotation (Placement(transformation(extent={{-52,-44},{-40,-32}})));
    equation

      connect(Qref.y, gFM_GFL_IBR_Init_SS.Q_ref_pu)
        annotation (Line(points={{-163.4,0},{-144,0}},
                                                     color={0,0,127}));
      connect(Vref.y, gFM_GFL_IBR_Init_SS.V_ref_pu)
        annotation (Line(points={{-163.4,-18},{-144,-18}},
                                                         color={0,0,127}));
      connect(resistor.n, inductor1.p)
        annotation (Line(points={{44,0},{50,0}}, color={0,0,255}));
      connect(resistor2.n, inductor.p)
        annotation (Line(points={{44,18},{52,18}}, color={0,0,255}));
      connect(resistor1.n, inductor2.p)
        annotation (Line(points={{44,-18},{50,-18}}, color={0,0,255}));
      connect(inductor.n,gridWithFault_Init.C)
        annotation (Line(points={{72,18},{110,18}}, color={0,0,255}));
      connect(inductor1.n, gridWithFault_Init.B)
        annotation (Line(points={{70,0},{110,0}}, color={0,0,255}));
      connect(inductor2.n, gridWithFault_Init.A)
        annotation (Line(points={{70,-18},{110,-18}}, color={0,0,255}));
      connect(Pref.y, gFM_GFL_IBR_Init_SS.P_ref_pu)
        annotation (Line(points={{-163.4,18},{-144,18}}, color={0,0,127}));
      connect(gFM_GFL_IBR_Init_SS.A, currentSensor2.p)
        annotation (Line(points={{-84,-18},{-12,-18}}, color={0,0,255}));
      connect(currentSensor2.n, resistor1.p)
        annotation (Line(points={{8,-18},{24,-18}}, color={0,0,255}));
      connect(currentSensor1.n, resistor.p)
        annotation (Line(points={{-12,0},{24,0}}, color={0,0,255}));
      connect(currentSensor1.p, gFM_GFL_IBR_Init_SS.B)
        annotation (Line(points={{-32,0},{-84,0}}, color={0,0,255}));
      connect(currentSensor1.i, i2) annotation (Line(points={{-22,-11},{-24,-11},
              {-24,-66}}, color={0,0,127}));
      connect(currentSensor2.i, i3)
        annotation (Line(points={{-2,-29},{-2,-82}}, color={0,0,127}));
      connect(gFM_GFL_IBR_Init_SS.C, multiSensor.pc)
        annotation (Line(points={{-84,18},{-56,18}}, color={0,0,255}));
      connect(multiSensor.nc, resistor2.p)
        annotation (Line(points={{-36,18},{24,18}}, color={0,0,255}));
      connect(multiSensor.pv, multiSensor.pc) annotation (Line(points={{-46,28},{-70,
              28},{-70,18},{-56,18}}, color={0,0,255}));
      connect(ground2.p, multiSensor.nv) annotation (Line(points={{-46,-32},{-46,8}},
                                  color={0,0,255}));
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
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><h4></p><p>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          StopTime=10,
          Interval=1e-05,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end GFM_InitLine;

    model GFM_Transformer
      constant Real line_inductance = 0;
      constant Real line_resistance = 1000;

      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR gFM_GFL_IBR(r_damp=40)
                                                                          annotation (Placement(transformation(rotation=0,
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
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GridWithFault          gridWithFault(Vbase=
            230000, FaultVoltage=0.4)                                                                          annotation (Placement(
            transformation(rotation=0, extent={{180,-30},{240,30}})));
      Modelica.Electrical.Analog.Ideal.IdealTransformer
                                                   transformer1(n=1/35.38)
                 annotation (Placement(transformation(extent={{68,12},{88,32}})));
      Modelica.Electrical.Analog.Ideal.IdealTransformer
                                                   transformer2(n=1/35.38)
                 annotation (Placement(transformation(extent={{68,-20},{88,0}})));
      Modelica.Electrical.Analog.Ideal.IdealTransformer
                                                   transformer3(n=1/35.38)
                 annotation (Placement(transformation(extent={{68,-52},{88,-32}})));
      Modelica.Electrical.Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{94,-72},{114,-52}})));
      Modelica.Electrical.Analog.Sensors.VoltageSensor high annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={150,14})));
      Modelica.Electrical.Analog.Sensors.VoltageSensor low annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={50,16})));
    equation

      connect(Qref.y, gFM_GFL_IBR.Q_ref_pu)
        annotation (Line(points={{-79.4,0},{-62,0}}, color={0,0,127}));
      connect(Vref.y, gFM_GFL_IBR.V_ref_pu)
        annotation (Line(points={{-79.4,-18},{-62,-18}}, color={0,0,127}));
      connect(Pref.y, gFM_GFL_IBR.P_ref_pu)
        annotation (Line(points={{-79.4,18},{-62,18}}, color={0,0,127}));
      connect(transformer1.n2, transformer2.n2) annotation (Line(points={{88,12},{104,
              12},{104,-20},{88,-20}}, color={0,0,255}));
      connect(transformer3.n2, transformer2.n2) annotation (Line(points={{88,-52},{104,
              -52},{104,-20},{88,-20}}, color={0,0,255}));
      connect(transformer3.n2, ground.p)
        annotation (Line(points={{88,-52},{104,-52}}, color={0,0,255}));
      connect(high.n,gridWithFault.C)  annotation (Line(points={{150,24},{150,32},{170,
              32},{170,18},{180,18}}, color={0,0,255}));
      connect(high.p, gridWithFault.B)
        annotation (Line(points={{150,4},{150,0},{180,0}}, color={0,0,255}));
      connect(transformer2.p1, transformer1.n1)
        annotation (Line(points={{68,0},{68,12}}, color={0,0,255}));
      connect(transformer3.p1, transformer2.n1)
        annotation (Line(points={{68,-32},{68,-20}}, color={0,0,255}));
      connect(transformer3.n1, transformer1.p1) annotation (Line(points={{68,-52},{64,
              -52},{64,32},{68,32}}, color={0,0,255}));
      connect(low.n, transformer1.p1)
        annotation (Line(points={{50,26},{50,32},{68,32}}, color={0,0,255}));
      connect(low.p, transformer2.p1)
        annotation (Line(points={{50,6},{50,0},{68,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.C, transformer1.p1) annotation (Line(points={{-2,18},
              {24,18},{24,32},{68,32}}, color={0,0,255}));
      connect(gFM_GFL_IBR.B, transformer2.p1)
        annotation (Line(points={{-2,0},{68,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.A, transformer3.p1) annotation (Line(points={{-2,-18},{24,
              -18},{24,-32},{68,-32}}, color={0,0,255}));
      connect(transformer1.p2,gridWithFault.C)  annotation (Line(points={{88,32},
              {170,32},{170,18},{180,18}}, color={0,0,255}));
      connect(transformer2.p2, gridWithFault.B)
        annotation (Line(points={{88,0},{180,0}}, color={0,0,255}));
      connect(transformer3.p2, gridWithFault.A) annotation (Line(points={{88,-32},
              {170,-32},{170,-18},{180,-18}}, color={0,0,255}));
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
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(Interval=1e-05, __Dymola_Algorithm="Euler"));
    end GFM_Transformer;

    model Transformer_test
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GridWithFault gridWithFault(Vbase=
            230000,                                                                          FaultVoltage=0.4) annotation (Placement(
            transformation(rotation=0, extent={{100,-30},{160,30}})));
      Modelica.Electrical.Analog.Basic.Transformer transformer1(
        L1=0.00056,
        L2=0.23,
        M=0.011)
        annotation (Placement(transformation(extent={{-12,12},{8,32}})));
      Modelica.Electrical.Analog.Basic.Transformer transformer2(
        L1=0.00056,
        L2=0.23,
        M=0.011)
        annotation (Placement(transformation(extent={{-12,-20},{8,0}})));
      Modelica.Electrical.Analog.Basic.Transformer transformer3(
        L1=0.00056,
        L2=0.23,
        M=0.011)
        annotation (Placement(transformation(extent={{-12,-52},{8,-32}})));
      Modelica.Electrical.Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{14,-72},{34,-52}})));
      Modelica.Electrical.Analog.Sensors.VoltageSensor high annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={70,14})));
      Modelica.Electrical.Analog.Basic.Resistor resistor3(R=1.78)
        annotation (Placement(transformation(extent={{28,22},{48,42}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor4(R=1.78)
        annotation (Placement(transformation(extent={{28,-10},{48,10}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor5(R=1.78)
        annotation (Placement(transformation(extent={{28,-42},{48,-22}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor(R=1000) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-76,20})));
      Modelica.Electrical.Analog.Basic.Resistor resistor1(R=1000) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-76,0})));
      Modelica.Electrical.Analog.Basic.Resistor resistor2(R=1000) annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-76,-20})));
      Modelica.Electrical.Analog.Basic.Ground ground1
        annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
      Modelica.Electrical.Analog.Sensors.VoltageSensor low annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-32,14})));
    equation

      connect(transformer1.n2, transformer2.n2) annotation (Line(points={{8,12},
              {24,12},{24,-20},{8,-20}}, color={0,0,255}));
      connect(transformer3.n2, transformer2.n2) annotation (Line(points={{8,-52},
              {24,-52},{24,-20},{8,-20}}, color={0,0,255}));
      connect(transformer3.n2, ground.p)
        annotation (Line(points={{8,-52},{24,-52}}, color={0,0,255}));
      connect(high.n,gridWithFault.C)  annotation (Line(points={{70,24},{70,32},
              {90,32},{90,18},{100,18}}, color={0,0,255}));
      connect(high.p, gridWithFault.B)
        annotation (Line(points={{70,4},{70,0},{100,0}}, color={0,0,255}));
      connect(transformer1.p2, resistor3.p)
        annotation (Line(points={{8,32},{28,32}}, color={0,0,255}));
      connect(resistor3.n,gridWithFault.C)  annotation (Line(points={{48,32},{
              90,32},{90,18},{100,18}}, color={0,0,255}));
      connect(transformer2.p2, resistor4.p)
        annotation (Line(points={{8,0},{28,0}}, color={0,0,255}));
      connect(resistor4.n, gridWithFault.B)
        annotation (Line(points={{48,0},{100,0}}, color={0,0,255}));
      connect(transformer3.p2, resistor5.p)
        annotation (Line(points={{8,-32},{28,-32}}, color={0,0,255}));
      connect(resistor5.n, gridWithFault.A) annotation (Line(points={{48,-32},{
              90,-32},{90,-18},{100,-18}}, color={0,0,255}));
      connect(resistor.n, resistor1.n) annotation (Line(points={{-86,20},{-90,
              20},{-90,0},{-86,0}}, color={0,0,255}));
      connect(resistor2.n, resistor1.n) annotation (Line(points={{-86,-20},{-90,
              -20},{-90,0},{-86,0}}, color={0,0,255}));
      connect(resistor2.n, ground1.p)
        annotation (Line(points={{-86,-20},{-90,-20}}, color={0,0,255}));
      connect(transformer2.p1, transformer1.n1)
        annotation (Line(points={{-12,0},{-12,12}}, color={0,0,255}));
      connect(transformer3.p1, transformer2.n1)
        annotation (Line(points={{-12,-32},{-12,-20}}, color={0,0,255}));
      connect(transformer3.n1, transformer1.p1) annotation (Line(points={{-12,
              -52},{-16,-52},{-16,32},{-12,32}}, color={0,0,255}));
      connect(resistor.p, transformer1.p1) annotation (Line(points={{-66,20},{
              -42,20},{-42,32},{-12,32}}, color={0,0,255}));
      connect(resistor1.p, transformer2.p1)
        annotation (Line(points={{-66,0},{-12,0}}, color={0,0,255}));
      connect(resistor2.p, transformer3.p1) annotation (Line(points={{-66,-20},
              {-42,-20},{-42,-32},{-12,-32}}, color={0,0,255}));
      connect(low.n, transformer1.p1) annotation (Line(points={{-32,24},{-32,32},
              {-12,32}}, color={0,0,255}));
      connect(low.p, transformer2.p1)
        annotation (Line(points={{-32,4},{-32,0},{-12,0}}, color={0,0,255}));
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
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          Interval=1e-06,
          Tolerance=1e-08,
          __Dymola_Algorithm="Euler"));
    end Transformer_test;

    model GFM_Test_no_grid
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      Electrical.Controls.IEEE_CIGRE.GFM.tools.GFM_GFL_IBR_test
        gFM_GFL_IBR_test(
        r_damp=40.08173,
        Vbase=0,
        Sbase=0,
        VDC_base=0,
        w_type=0) annotation (Placement(transformation(rotation=0, extent={{-62,
                -30},{-2,30}})));

      Modelica.Blocks.Sources.Constant Qref(k=0)
        annotation (Placement(transformation(extent={{-92,-6},{-80,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-92,-24},{-80,-12}})));
      Modelica.Blocks.Sources.Step Pref(
        height=0.2,
        offset=0.5,
        startTime=5)
        annotation (Placement(transformation(extent={{-92,12},{-80,24}})));
    equation

      connect(Qref.y, gFM_GFL_IBR_test.Q_ref_pu)
        annotation (Line(points={{-79.4,0},{-62,0}}, color={0,0,127}));
      connect(Vref.y, gFM_GFL_IBR_test.V_ref_pu)
        annotation (Line(points={{-79.4,-18},{-62,-18}}, color={0,0,127}));
      connect(Pref.y, gFM_GFL_IBR_test.P_ref_pu)
        annotation (Line(points={{-79.4,18},{-62,18}}, color={0,0,127}));
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
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          StopTime=2,
          Interval=1e-05,
          Tolerance=1e-08,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"),
        __Dymola_experimentFlags(Advanced(
            InlineMethod=0,
            InlineOrder=2,
            InlineFixedStep=1e-05)));
    end GFM_Test_no_grid;

    model GFM_EMTPFault_Test
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.EMTPGrid
               eMTPGrid
        annotation (Placement(transformation(extent={{60,-20},{100,20}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.ShortFault
                 shortFault(line_capacitance=1e-6)
        annotation (Placement(transformation(extent={{0,-28},{40,20}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR          gFM_GFL_IBR(r_damp=
            40.08173)                                                     annotation (Placement(transformation(rotation=0,
              extent={{-56,-20},{-16,20}})));
      Modelica.Blocks.Sources.Constant Qref(k=0)
        annotation (Placement(transformation(extent={{-100,-6},{-88,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-82,-18},{-70,-6}})));
      Modelica.Blocks.Sources.Step Pref(
        height=0.2,
        offset=0.5,
        startTime=2)
        annotation (Placement(transformation(extent={{-82,6},{-70,18}})));
    equation

      connect(shortFault.C_n,eMTPGrid. C)
        annotation (Line(points={{40,12},{60,12}}, color={0,0,255}));
      connect(shortFault.B_n,eMTPGrid. B)
        annotation (Line(points={{40,0},{60,0}}, color={0,0,255}));
      connect(shortFault.A_n,eMTPGrid. A)
        annotation (Line(points={{40,-12},{60,-12}}, color={0,0,255}));
      connect(Qref.y,gFM_GFL_IBR. Q_ref_pu)
        annotation (Line(points={{-87.4,0},{-56,0}}, color={0,0,127}));
      connect(Vref.y,gFM_GFL_IBR. V_ref_pu)
        annotation (Line(points={{-69.4,-12},{-56,-12}}, color={0,0,127}));
      connect(Pref.y,gFM_GFL_IBR. P_ref_pu)
        annotation (Line(points={{-69.4,12},{-56,12}}, color={0,0,127}));
      connect(gFM_GFL_IBR.A, shortFault.A)
        annotation (Line(points={{-16,-12},{0,-12}}, color={0,0,255}));
      connect(gFM_GFL_IBR.B, shortFault.B)
        annotation (Line(points={{-16,0},{0,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.C, shortFault.C)
        annotation (Line(points={{-16,12},{0,12}}, color={0,0,255}));
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
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          StopTime=10,
          Interval=0.001,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end GFM_EMTPFault_Test;

    model GFM_EMTPFull_Test
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR          gFM_GFL_IBR(r_damp=
            40.08173)                                                     annotation (Placement(transformation(rotation=0,
              extent={{-80,-20},{-40,20}})));
      Modelica.Blocks.Sources.Constant Qref(k=0)
        annotation (Placement(transformation(extent={{-124,-6},{-112,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-106,-18},{-94,-6}})));
      Modelica.Blocks.Sources.Step Pref(
        height=0.2,
        offset=0.5,
        startTime=2)
        annotation (Placement(transformation(extent={{-106,6},{-94,18}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.EMTPGrid
               eMTPGrid(Vbase=230000)
        annotation (Placement(transformation(extent={{94,-20},{134,20}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.SmoothShortFault
                 smoothShortFault(R=5, line_capacitance=1e-6)
        annotation (Placement(transformation(extent={{76,-28},{36,20}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.EMTPtransformer
                      eMTPtransformer(f_cut=500, Rtf_delta=0.3)
        annotation (Placement(transformation(extent={{20,-20},{-20,20}})));
    equation

      connect(Qref.y,gFM_GFL_IBR. Q_ref_pu)
        annotation (Line(points={{-111.4,0},{-80,0}},color={0,0,127}));
      connect(Vref.y,gFM_GFL_IBR. V_ref_pu)
        annotation (Line(points={{-93.4,-12},{-80,-12}}, color={0,0,127}));
      connect(Pref.y,gFM_GFL_IBR. P_ref_pu)
        annotation (Line(points={{-93.4,12},{-80,12}}, color={0,0,127}));
      connect(smoothShortFault.C, eMTPGrid.C)
        annotation (Line(points={{76,12},{94,12}}, color={0,0,255}));
      connect(smoothShortFault.B, eMTPGrid.B)
        annotation (Line(points={{76,0},{94,0}}, color={0,0,255}));
      connect(smoothShortFault.A, eMTPGrid.A)
        annotation (Line(points={{76,-12},{94,-12}}, color={0,0,255}));
      connect(eMTPtransformer.Cy, smoothShortFault.C_n)
        annotation (Line(points={{19.6,12},{36,12}}, color={0,0,255}));
      connect(eMTPtransformer.By, smoothShortFault.B_n)
        annotation (Line(points={{20,0},{36,0}}, color={0,0,255}));
      connect(eMTPtransformer.Ay, smoothShortFault.A_n)
        annotation (Line(points={{20,-12},{36,-12}}, color={0,0,255}));
      connect(gFM_GFL_IBR.C, eMTPtransformer.Cd)
        annotation (Line(points={{-40,12},{-20,12}}, color={0,0,255}));
      connect(gFM_GFL_IBR.B, eMTPtransformer.Bd)
        annotation (Line(points={{-40,0},{-20,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.A, eMTPtransformer.Ad)
        annotation (Line(points={{-40,-12},{-20,-12}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -140,-100},{140,100}}),                             graphics={
            Ellipse(lineColor = {75,138,73},
                    fillColor={255,255,255},
                    fillPattern = FillPattern.Solid,
                    extent={{-100,-100},{100,100}}),
            Polygon(lineColor = {0,0,255},
                    fillColor = {75,138,73},
                    pattern = LinePattern.None,
                    fillPattern = FillPattern.Solid,
                    points={{-36,60},{64,0},{-36,-60},{-36,60}})}),  Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{
                140,100}})),
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          StopTime=10,
          Interval=0.001,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end GFM_EMTPFull_Test;

    model GFM_EMTPFull_Mod_TF_Test
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      Modelica.Blocks.Sources.Constant Qref(k=0)
        annotation (Placement(transformation(extent={{-114,-8},{-102,4}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-116,-48},{-104,-36}})));
      Modelica.Blocks.Sources.Step Pref(
        height=0.2,
        offset=0.2,
        startTime=2)
        annotation (Placement(transformation(extent={{-114,32},{-102,44}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.GridWithFault          gridWithFault(Vbase=650)
                                                                                                               annotation (Placement(
            transformation(rotation=0, extent={{78,-30},{136,28}})));
      Electrical.Controls.IEEE_CIGRE.GFM_PSCAD.GFM_GFL_IBR_PSCAD gFM_GFL_IBR
        annotation (Placement(transformation(extent={{-72,-30},{-14,28}})));
      Electrical.Controls.IEEE_CIGRE.GFM_PSCAD.GridComponents.Line_R line_R(
          Resistance=0.005)
        annotation (Placement(transformation(extent={{0,-30},{58,28}})));
    equation

      connect(Vref.y,gFM_GFL_IBR. V_ref_pu) annotation (Line(points={{-103.4,
              -42},{-82,-42},{-82,-18.4},{-72,-18.4}},
                                             color={0,0,127}));
      connect(Qref.y,gFM_GFL_IBR. Q_ref_pu)
        annotation (Line(points={{-101.4,-2},{-100,-1},{-72,-1}},
                                                             color={0,0,127}));
      connect(Pref.y,gFM_GFL_IBR. P_ref_pu) annotation (Line(points={{-101.4,38},
              {-82,38},{-82,16.4},{-72,16.4}},
                                          color={0,0,127}));
      connect(gFM_GFL_IBR.C, line_R.p2)
        annotation (Line(points={{-14,16.4},{0,16.4}}, color={0,0,255}));
      connect(gFM_GFL_IBR.B, line_R.p)
        annotation (Line(points={{-14,-1},{0,-1}}, color={0,0,255}));
      connect(gFM_GFL_IBR.A, line_R.p1)
        annotation (Line(points={{-14,-18.4},{0,-18.4}}, color={0,0,255}));
      connect(line_R.n2, gridWithFault.C)
        annotation (Line(points={{58,16.4},{78,16.4}}, color={0,0,255}));
      connect(line_R.n, gridWithFault.B)
        annotation (Line(points={{58,-1},{78,-1}}, color={0,0,255}));
      connect(line_R.n1, gridWithFault.A)
        annotation (Line(points={{58,-18.4},{78,-18.4}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -140,-100},{140,100}}),                             graphics={
            Ellipse(lineColor = {75,138,73},
                    fillColor={255,255,255},
                    fillPattern = FillPattern.Solid,
                    extent={{-100,-100},{100,100}}),
            Polygon(lineColor = {0,0,255},
                    fillColor = {75,138,73},
                    pattern = LinePattern.None,
                    fillPattern = FillPattern.Solid,
                    points={{-36,60},{64,0},{-36,-60},{-36,60}})}),  Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{
                140,100}})),
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          StopTime=10,
          Interval=0.001,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end GFM_EMTPFull_Mod_TF_Test;

    model DYMOLA_GFL_Fstep
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      Electrical.Controls.IEEE_CIGRE.GFM.GFM_GFL_IBR          gFM_GFL_IBR(r_damp=
            40.08173)                                                     annotation (Placement(transformation(rotation=0,
              extent={{-80,-20},{-40,20}})));
      Modelica.Blocks.Sources.Constant Qref(k=0)
        annotation (Placement(transformation(extent={{-124,-6},{-112,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-124,-24},{-112,-12}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.EMTPGrid
               eMTPGrid(Vbase=230000)
        annotation (Placement(transformation(extent={{94,-20},{134,20}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.SmoothShortFault
                 smoothShortFault(R=5, line_capacitance=1e-6)
        annotation (Placement(transformation(extent={{76,-28},{36,20}})));
      Electrical.Controls.IEEE_CIGRE.GFM.GridComponents.EMTPtransformerZeroSeq
                      eMTPtransformerZeroSeq(f_cut=500, Rtf_delta=0.3)
        annotation (Placement(transformation(extent={{26,-20},{-30,20}})));
      Modelica.Blocks.Sources.Constant Pref(k=0.5)
        annotation (Placement(transformation(extent={{-124,12},{-112,24}})));
    equation

      connect(Qref.y,gFM_GFL_IBR. Q_ref_pu)
        annotation (Line(points={{-111.4,0},{-80,0}},color={0,0,127}));
      connect(Vref.y,gFM_GFL_IBR. V_ref_pu)
        annotation (Line(points={{-111.4,-18},{-90,-18},{-90,-12},{-80,-12}},
                                                         color={0,0,127}));
      connect(smoothShortFault.C, eMTPGrid.C)
        annotation (Line(points={{76,12},{94,12}}, color={0,0,255}));
      connect(smoothShortFault.B, eMTPGrid.B)
        annotation (Line(points={{76,0},{94,0}}, color={0,0,255}));
      connect(smoothShortFault.A, eMTPGrid.A)
        annotation (Line(points={{76,-12},{94,-12}}, color={0,0,255}));
      connect(eMTPtransformerZeroSeq.Cy, smoothShortFault.C_n)
        annotation (Line(points={{25.6,12},{36,12}}, color={0,0,255}));
      connect(eMTPtransformerZeroSeq.By, smoothShortFault.B_n)
        annotation (Line(points={{26,0},{36,0}}, color={0,0,255}));
      connect(eMTPtransformerZeroSeq.Ay, smoothShortFault.A_n)
        annotation (Line(points={{26,-12},{36,-12}}, color={0,0,255}));
      connect(gFM_GFL_IBR.C, eMTPtransformerZeroSeq.Cd)
        annotation (Line(points={{-40,12},{-30,12}}, color={0,0,255}));
      connect(gFM_GFL_IBR.B, eMTPtransformerZeroSeq.Bd)
        annotation (Line(points={{-40,0},{-30,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.A, eMTPtransformerZeroSeq.Ad)
        annotation (Line(points={{-40,-12},{-30,-12}}, color={0,0,255}));
      connect(Pref.y, gFM_GFL_IBR.P_ref_pu) annotation (Line(points={{-111.4,18},
              {-90,18},{-90,12},{-80,12}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -140,-100},{140,100}}),                             graphics={
            Ellipse(lineColor = {75,138,73},
                    fillColor={255,255,255},
                    fillPattern = FillPattern.Solid,
                    extent={{-100,-100},{100,100}}),
            Polygon(lineColor = {0,0,255},
                    fillColor = {75,138,73},
                    pattern = LinePattern.None,
                    fillPattern = FillPattern.Solid,
                    points={{-36,60},{64,0},{-36,-60},{-36,60}})}),  Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{
                140,100}})),
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          StopTime=10,
          Interval=0.001,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end DYMOLA_GFL_Fstep;

    model GFM_PSCADFull
      constant Real line_inductance = 0;
      constant Real line_resistance = 0;

      Modelica.Blocks.Sources.Constant Qref(k=0)
        annotation (Placement(transformation(extent={{-92,-6},{-80,6}})));
      Modelica.Blocks.Sources.Constant Vref(k=1)
        annotation (Placement(transformation(extent={{-94,-46},{-82,-34}})));
      Modelica.Blocks.Sources.Step Pref(
        height=0.2,
        offset=0,
        startTime=2)
        annotation (Placement(transformation(extent={{-92,34},{-80,46}})));
      Electrical.Controls.IEEE_CIGRE.GFM_PSCAD.GFM_GFL_IBR_PSCAD gFM_GFL_IBR
        annotation (Placement(transformation(extent={{-54,-26},{-2,26}})));
      Electrical.Controls.IEEE_CIGRE.GFM_PSCAD.GridComponents.DeltaGrid
        deltaGrid(
        Vbase=650,
        GroundingResistance=1e6,
        Rtf_delta=1)
        annotation (Placement(transformation(extent={{82,-26},{134,26}})));
      Modelica.Electrical.Analog.Basic.Capacitor capacitor
        annotation (Placement(transformation(extent={{120,-100},{160,-60}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor
        annotation (Placement(transformation(extent={{180,-100},{220,-60}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor
        annotation (Placement(transformation(extent={{240,-100},{280,-60}})));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage
        annotation (Placement(transformation(extent={{64,-96},{96,-64}})));
    equation

      connect(Vref.y, gFM_GFL_IBR.V_ref_pu) annotation (Line(points={{-81.4,-40},
              {-60,-40},{-60,-15.6},{-54,-15.6}},
                                             color={0,0,127}));
      connect(Qref.y, gFM_GFL_IBR.Q_ref_pu)
        annotation (Line(points={{-79.4,0},{-54,0}},         color={0,0,127}));
      connect(Pref.y, gFM_GFL_IBR.P_ref_pu) annotation (Line(points={{-79.4,40},
              {-60,40},{-60,15.6},{-54,15.6}},
                                          color={0,0,127}));
      connect(gFM_GFL_IBR.C, deltaGrid.C)
        annotation (Line(points={{-2,15.6},{82,15.6}}, color={0,0,255}));
      connect(gFM_GFL_IBR.B, deltaGrid.B)
        annotation (Line(points={{-2,0},{82,0}}, color={0,0,255}));
      connect(gFM_GFL_IBR.A, deltaGrid.A)
        annotation (Line(points={{-2,-15.6},{82,-15.6}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-120},{340,100}}),                             graphics={
            Ellipse(lineColor = {75,138,73},
                    fillColor={255,255,255},
                    fillPattern = FillPattern.Solid,
                    extent={{-100,-100},{100,100}}),
            Polygon(lineColor = {0,0,255},
                    fillColor = {75,138,73},
                    pattern = LinePattern.None,
                    fillPattern = FillPattern.Solid,
                    points={{-36,60},{64,0},{-36,-60},{-36,60}})}),  Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-120},{
                340,100}})),
        Documentation(info="<html>
<p>This model tests the implemenation of &quot;IEEE CIGRE&quot; DLL modeling standard to test &quot;real code&quot; models for power system analysis <a href=\"https://www.researchgate.net/publication/381482867_Integrating_the_IEEECIGRE_DLL_Modeling_Standard_to_Use_Real_Code_Models_for_Power_System_Analysis_in_Modelica_Tools\">[link to paper]</a> </p>
<p><br><h4>To run this model, first set the solver to &quot;Euler&quot; and the fixed time step to &quot;0.005&quot;.</h4></p>
<h4>In Dymola the experiment annotation shoul result in the additional attributes.</h4>
<p><br>experiment(</p>
<p>StopTime=10,</p>
<p>Tolerance=1e-05,</p>
<p>__Dymola_fixedstepsize=0.005,</p>
<p>__Dymola_Algorithm=&quot;Euler&quot;)</p>
</html>"),
        experiment(
          StopTime=10,
          Interval=0.001,
          __Dymola_fixedstepsize=2e-05,
          __Dymola_Algorithm="Euler"));
    end GFM_PSCADFull;
  end GFM_PSCAD;
end IEEE_CIGRE;
