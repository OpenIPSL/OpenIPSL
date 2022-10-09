within OpenIPSL.Electrical.Controls.Simulink.ES;
model ExcitationSystemKp0 "Excitation system without PSS included"
  parameter Real V0=1 "Reference value of terminal voltage";
  parameter Real L2=4 "Exciter parameter";
  parameter Real G=70 "Exciter parameter";
  parameter Real Ta=10 "Exciter parameter";
  parameter Real Tb=20 "Exciter parameter";
  parameter Real vfd0 "Initial Filed voltage";
  parameter Real r "OEL parameter";
  parameter Real f "OEL parameter";
  parameter Real L1 "OEL parameter";
  parameter Real ifd_lim "OEL parameter";
  OpenIPSL.Electrical.Controls.Simulink.OEL.OEL oEL(
    init_OEL_Timer=0,
    ifd_lim=ifd_lim,
    r=r,
    f=f,
    L1=L1) annotation (Placement(transformation(extent={{-28,40},{20,76}})));
  Modelica.Blocks.Sources.Constant V_0(k=V0) "Reference terminal voltage "
    annotation (Placement(transformation(extent={{-88,34},{-70,52}})));
  Modelica.Blocks.Interfaces.RealInput ifd "Field current"
    annotation (Placement(transformation(extent={{-96,62},{-84,74}})));
  Modelica.Blocks.Interfaces.RealInput V "Terminal voltage "
    annotation (Placement(transformation(extent={{-96,22},{-84,34}})));
  Modelica.Blocks.Interfaces.RealOutput vfd "Field voltage"
    annotation (Placement(transformation(extent={{128,22},{140,34}})));
  Modelica.Blocks.Math.Gain Ka(k=10)
    annotation (Placement(transformation(extent={{92,48},{104,60}})));
  Modelica.Blocks.Continuous.LimIntegrator imLimitedIntegrator(
    outMin=0,
    outMax=L2,
    k=1,
    y_start=vfd0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{110,46},{126,62}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag tgr(
    K=G,
    T1=Ta,
    T2=Tb,
    y_start=vfd0) "Transient gain rudection"
    annotation (Placement(transformation(extent={{32,44},{52,64}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{62,44},{82,64}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{-58,26},{-38,46}})));
equation
  connect(oEL.ifd, ifd) annotation (Line(
      points={{-24.4,59.08},{-77.44,59.08},{-77.44,68},{-90,68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(imLimitedIntegrator.y, vfd)
    annotation (Line(points={{126.8,54},{134,54},{134,28}}, color={0,0,127}));
  connect(imLimitedIntegrator.u, Ka.y) annotation (Line(points={{108.4,54},{106,
          54},{104.6,54}}, color={0,0,127}));
  connect(oEL.OEL_output, tgr.u) annotation (Line(points={{16.16,54.4},{23.08,
          54.4},{23.08,54},{30,54}}, color={0,0,127}));
  connect(feedback.y, Ka.u)
    annotation (Line(points={{81,54},{90.8,54},{90.8,54}}, color={0,0,127}));
  connect(feedback.u2, vfd) annotation (Line(points={{72,46},{72,40},{134,40},{
          134,28}}, color={0,0,127}));
  connect(tgr.y, feedback.u1)
    annotation (Line(points={{53,54},{58.5,54},{64,54}}, color={0,0,127}));
  connect(V_0.y, add.u1) annotation (Line(points={{-69.1,43},{-64.55,43},{-64.55,
          42},{-60,42}}, color={0,0,127}));
  connect(V, add.u2) annotation (Line(points={{-90,28},{-76,28},{-76,30},{-60,
          30}}, color={0,0,127}));
  connect(add.y, oEL.VolContinput) annotation (Line(points={{-37,36},{-34,36},{
          -34,40},{-34,51.16},{-24.4,51.16}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            140,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{140,100}}, preserveAspectRatio=
            false), graphics={Rectangle(extent={{-84,78},{128,-20}}, lineColor=
          {0,0,255}),Text(
          extent={{-80,72},{-62,60}},
          textColor={0,0,255},
          textString="ifd"),Text(
          extent={{-80,34},{-62,22}},
          textColor={0,0,255},
          textString="V "),Text(
          extent={{106,36},{130,22}},
          textColor={0,0,255},
          textString="vfd"),Text(
          extent={{-34,58},{88,0}},
          textColor={0,0,255},
          textString="Exciter AVR OEL PSS")}));
end ExcitationSystemKp0;
