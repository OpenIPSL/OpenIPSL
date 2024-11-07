within OpenIPSL.Electrical.Controls.PSSE.TG;
model WSIEG1 "WECC Modified IEEE Type 1 Speed-Governing Model"
  parameter Real K=30.32 "Regulation gain [1/pu]";
  parameter Types.Time T_1=0.5 "Control time constant";
  parameter Types.Time T_2=1e-8 "Control time constant";
  parameter Types.Time T_3=0.1 "Control time constant";
  parameter Types.TimeAging U_o=0.4 "Max. rate if valve opening";
  parameter Types.TimeAging U_c=-0.4 "Max. rate if valve closing";
  parameter Types.PerUnit P_MAX=1.5 "Max. valve position";
  parameter Types.PerUnit P_MIN=0 "Min. valve position";
  parameter Types.Time T_4=0.25 "HP section time constant";
  parameter Types.PerUnit K_1=0.307
    "Fraction of power from high pressure turbine (upper branch)";
  parameter Types.PerUnit K_2=0
    "Fraction of power from high pressure turbine (lower branch)";
  parameter Types.Time T_5=10
    "Reheat plus intermediate pressure turbine time constant";
  parameter Types.PerUnit K_3=0
    "Fraction of power from intermediate pressure turbine (upper branch)";
  parameter Types.PerUnit K_4=0.23
    "Fraction of power from intermediate pressure turbine (lower branch)";
  parameter Types.Time T_6=0.588
    "Reheater plus intermediate pressure turbine time constant (second)";
  parameter Types.PerUnit K_5=0.2315
    "Fraction of power from low pressure turbine (first LP, upper branch)";
  parameter Types.PerUnit K_6=0.2315
    "Fraction of power from low pressure turbine (first LP, lower branch)";
  parameter Types.Time T_7=1e-8 "Low pressure turbine time constant";
  parameter Types.PerUnit K_7=0
    "Fraction of power from low pressure turbine (second LP, upper branch)";
  parameter Types.PerUnit K_8=0
    "Fraction of power from low pressure turbine (second LP, lower branch)";
  parameter Types.PerUnit db1=0.0006 "Speed deadband";
  parameter Types.PerUnit err=0 "Error deadband";
  parameter Types.PerUnit db2=0 "Gate valve deadband";
  parameter Types.PerUnit GV1=0 "Gate valve position 1 [pu]";
  parameter Types.PerUnit GV2=0.25 "Gate valve position 2 [pu]";
  parameter Types.PerUnit GV3=0.5 "Gate valve position 3 [pu]";
  parameter Types.PerUnit GV4=0.75 "Gate valve position 4 [pu]";
  parameter Types.PerUnit GV5=2 "Gate valve position 5 [pu]";
  parameter Types.PerUnit PGV1=0 "Mechanical power 1 [pu]";
  parameter Types.PerUnit PGV2=0.25 "Mechanical power 2 [pu]";
  parameter Types.PerUnit PGV3=0.5 "Mechanical power 3 [pu]";
  parameter Types.PerUnit PGV4=0.75 "Mechanical power 4 [pu]";
  parameter Types.PerUnit PGV5=2 "Mechanical power 5 [pu]";
  parameter Integer Iblock=0;
  parameter Integer HP_LP = 1 "Turbine Output Power Selector [1(HP) or 2(LP) or 3(HP+LP)]";
  Modelica.Blocks.Interfaces.RealInput SPEED_HP "Machine speed deviation from nominal [pu]"
    annotation (Placement(transformation(extent={{-120,44},{-100,64}}),iconTransformation(extent={{-100,40},
            {-60,80}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag LeadLag(
    K=K,
    T1=T_2,
    T2=T_1,
    y_start=0)
    annotation (Placement(transformation(extent={{-68,46},{-52,62}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag Steam(
    K=1,
    T=T_4,
    y_start=p0)
    annotation (Placement(transformation(extent={{-80,-46},{-64,-30}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag Reheater1(
    K=1,
    T=T_5,
    y_start=p0)
    annotation (Placement(transformation(extent={{-38,-46},{-22,-30}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag Reheater2(
    K=1,
    T=T_6,
    y_start=p0)
    annotation (Placement(transformation(extent={{2,-46},{18,-30}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag Crossover(
    K=1,
    T=T_7,
    y_start=p0)
    annotation (Placement(transformation(extent={{42,-46},{58,-30}})));
  Modelica.Blocks.Math.Gain Gain1_HP(k=K_1) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-50,-14})));
  Modelica.Blocks.Math.Gain Gain1_LP(k=K_2) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-50,-62})));
  Modelica.Blocks.Math.Gain Gain2_HP(k=K_3) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-10,-14})));
  Modelica.Blocks.Math.Gain Gain2_LP(k=K_4) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-10,-62})));
  Modelica.Blocks.Math.Gain Gain3_HP(k=K_5) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={30,-14})));
  Modelica.Blocks.Math.Gain Gain3_LP(k=K_6) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={30,-62})));
  Modelica.Blocks.Math.Gain Gain4_HP(k=K_7) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={70,-14})));
  Modelica.Blocks.Math.Gain Gain4_LP(k=K_8) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={70,-62})));
  Modelica.Blocks.Interfaces.RealOutput PMECH_HP
    "Turbine mechanical power [pu]" annotation (Placement(transformation(extent={{100,2},
            {120,22}}),          iconTransformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH_LP
    "Turbine mechanical power [pu]" annotation (Placement(transformation(extent={{100,-98},
            {120,-78}}),           iconTransformation(extent={{100,-50},{120,-30}})));

  Modelica.Blocks.Math.Add3 add_ref(k2=-1, k3=-1)
    annotation (Placement(transformation(extent={{-42,46},{-26,62}})));
  Modelica.Blocks.Math.Gain Gov_gain(k=1/T_3)
    annotation (Placement(transformation(extent={{-18,46},{-2,62}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=U_o, uMin=U_c)
    annotation (Placement(transformation(extent={{6,46},{22,62}})));
  Modelica.Blocks.Continuous.LimIntegrator Gov_Integrator(
    k=1,
    outMax=P_MAX,
    outMin=P_MIN,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=GV0)
                annotation (Placement(transformation(extent={{38,46},{54,62}})));
  Modelica.Blocks.Math.Add add_12_HP
    annotation (Placement(transformation(extent={{-2,6},{10,18}})));
  Modelica.Blocks.Math.Add add12_LP
    annotation (Placement(transformation(extent={{-2,-94},{10,-82}})));
  Modelica.Blocks.Math.Add add123_LP
    annotation (Placement(transformation(extent={{38,-94},{50,-82}})));
  Modelica.Blocks.Math.Add add_123_HP
    annotation (Placement(transformation(extent={{38,6},{50,18}})));
  Modelica.Blocks.Math.Add add1234_LP
    annotation (Placement(transformation(extent={{78,-94},{90,-82}})));
  Modelica.Blocks.Math.Add add1234_HP
    annotation (Placement(transformation(extent={{78,6},{90,18}})));
  NonElectrical.Nonlinear.Deadband1 deadband1(db=db1, err=err)
    annotation (Placement(transformation(extent={{-94,46},{-78,62}})));
  Modelica.Blocks.Tables.CombiTable1Ds Lookup_GateValve_Pmech(table=[GV1,PGV1;
        GV2,PGV2; GV3,PGV3; GV4,PGV4; GV5,PGV5], smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments)
    annotation (Placement(transformation(extent={{78,46},{94,62}})));

  Modelica.Blocks.Sources.Constant Pref(k=GV0)
    annotation (Placement(transformation(extent={{-68,74},{-52,90}})));
  Modelica.Blocks.Interfaces.RealInput PMECH0 annotation (Placement(
        transformation(extent={{-100,-90},{-60,-50}}), iconTransformation(
          extent={{-100,-90},{-60,-50}})));
  NonElectrical.Nonlinear.Deadband2 deadband2(y(start=GV0), db=db2)
    annotation (Placement(transformation(extent={{60,74},{76,90}})));
protected
  parameter Types.PerUnit p0(fixed=false);
  parameter Types.PerUnit GV0(fixed=false);
  parameter Types.PerUnit Pp_max(fixed=false);
  parameter Types.PerUnit Pp_min(fixed=false);

initial equation

  p0 = (if HP_LP == 1 then PMECH0/(K_1 + K_3 + K_5 + K_7)
 elseif
       HP_LP == 2 then PMECH0/(K_2 + K_4 + K_6 + K_8)
 else
     PMECH0);

    GV0 = (if p0 > PGV4 then ((p0-PGV4)*(GV5-GV4)/(PGV5-PGV4) + GV4)
 elseif
       p0 <= PGV4 and p0 > PGV3 then ((p0-PGV3)*(GV4-GV3)/(PGV4-PGV3) + GV3)
 elseif
       p0 <= PGV2 then ((p0-PGV1)*(GV2-GV1)/(PGV2-PGV1) + GV1)
 else
     (p0-PGV2)*(GV3-GV2)/(PGV3-PGV2) + GV2);

  if Iblock == 0 then
    Pp_max = P_MAX;
    Pp_min = P_MIN;

  elseif Iblock == 1 then
    if P_MIN < Modelica.Constants.eps then
      Pp_min = p0;
      Pp_max = P_MAX;
    else
      Pp_max = P_MAX;
      Pp_min = P_MIN;
    end if;

  elseif Iblock == 2 then
    if P_MAX < Modelica.Constants.eps then
      Pp_max = p0;
      Pp_min = P_MIN;
    else
      Pp_max = P_MAX;
      Pp_min = P_MIN;
    end if;

  else
    if (P_MAX < Modelica.Constants.eps and P_MIN < Modelica.Constants.eps) then
      Pp_max = p0;
      Pp_min = p0;
    else
      Pp_max = P_MAX;
      Pp_min = P_MIN;
    end if;

  end if;

  Gov_Integrator.outMax=Pp_max;
  Gov_Integrator.outMin=Pp_min;

equation
  connect(add_ref.u2, LeadLag.y)
    annotation (Line(points={{-43.6,54},{-51.2,54}}, color={0,0,127}));
  connect(add_ref.y, Gov_gain.u)
    annotation (Line(points={{-25.2,54},{-19.6,54}}, color={0,0,127}));
  connect(Gov_gain.y, limiter.u)
    annotation (Line(points={{-1.2,54},{4.4,54}}, color={0,0,127}));
  connect(limiter.y, Gov_Integrator.u)
    annotation (Line(points={{22.8,54},{36.4,54}}, color={0,0,127}));
  connect(Reheater1.u, Steam.y)
    annotation (Line(points={{-39.6,-38},{-63.2,-38}}, color={0,0,127}));
  connect(Gain1_HP.u, Steam.y) annotation (Line(points={{-50,-21.2},{-50,-38},{-63.2,
          -38}}, color={0,0,127}));
  connect(Gain1_LP.u, Steam.y) annotation (Line(points={{-50,-54.8},{-50,-38},{-63.2,
          -38}}, color={0,0,127}));
  connect(Reheater1.y, Reheater2.u)
    annotation (Line(points={{-21.2,-38},{0.4,-38}}, color={0,0,127}));
  connect(Gain2_HP.u, Reheater2.u) annotation (Line(points={{-10,-21.2},{-10,-38},
          {0.4,-38}}, color={0,0,127}));
  connect(Gain2_LP.u, Reheater2.u) annotation (Line(points={{-10,-54.8},{-10,-38},
          {0.4,-38}}, color={0,0,127}));
  connect(add_12_HP.u2, Gain2_HP.y) annotation (Line(points={{-3.2,8.4},{-10,8.4},
          {-10,-7.4}}, color={0,0,127}));
  connect(Gain1_HP.y, add_12_HP.u1) annotation (Line(points={{-50,-7.4},{-50,15.6},
          {-3.2,15.6}}, color={0,0,127}));
  connect(add12_LP.u1, Gain2_LP.y) annotation (Line(points={{-3.2,-84.4},{-10,-84.4},
          {-10,-68.6}}, color={0,0,127}));
  connect(Gain1_LP.y, add12_LP.u2) annotation (Line(points={{-50,-68.6},{-50,-91.6},
          {-3.2,-91.6}}, color={0,0,127}));
  connect(Reheater2.y, Crossover.u)
    annotation (Line(points={{18.8,-38},{40.4,-38}}, color={0,0,127}));
  connect(Gain3_HP.u, Crossover.u) annotation (Line(points={{30,-21.2},{30,-38},
          {40.4,-38}}, color={0,0,127}));
  connect(Gain3_LP.u, Crossover.u) annotation (Line(points={{30,-54.8},{30,-38},
          {40.4,-38}}, color={0,0,127}));
  connect(Gain3_LP.y, add123_LP.u1) annotation (Line(points={{30,-68.6},{30,-84.4},
          {36.8,-84.4}}, color={0,0,127}));
  connect(add12_LP.y, add123_LP.u2) annotation (Line(points={{10.6,-88},{30,-88},
          {30,-91.6},{36.8,-91.6}}, color={0,0,127}));
  connect(add_12_HP.y, add_123_HP.u1) annotation (Line(points={{10.6,12},{30,12},
          {30,15.6},{36.8,15.6}}, color={0,0,127}));
  connect(Gain3_HP.y, add_123_HP.u2)
    annotation (Line(points={{30,-7.4},{30,8.4},{36.8,8.4}}, color={0,0,127}));
  connect(Crossover.y, Gain4_HP.u) annotation (Line(points={{58.8,-38},{70,-38},
          {70,-21.2}}, color={0,0,127}));
  connect(Gain4_LP.u, Gain4_HP.u)
    annotation (Line(points={{70,-54.8},{70,-21.2}}, color={0,0,127}));
  connect(add1234_LP.y, PMECH_LP)
    annotation (Line(points={{90.6,-88},{110,-88}}, color={0,0,127}));
  connect(Gain4_LP.y, add1234_LP.u1) annotation (Line(points={{70,-68.6},{70,-84.4},
          {76.8,-84.4}}, color={0,0,127}));
  connect(add123_LP.y, add1234_LP.u2) annotation (Line(points={{50.6,-88},{70,-88},
          {70,-91.6},{76.8,-91.6}}, color={0,0,127}));
  connect(add_123_HP.y, add1234_HP.u1) annotation (Line(points={{50.6,12},{70,12},
          {70,15.6},{76.8,15.6}}, color={0,0,127}));
  connect(Gain4_HP.y, add1234_HP.u2)
    annotation (Line(points={{70,-7.4},{70,8.4},{76.8,8.4}}, color={0,0,127}));
  connect(add1234_HP.y, PMECH_HP)
    annotation (Line(points={{90.6,12},{110,12}}, color={0,0,127}));
  connect(SPEED_HP, deadband1.u)
    annotation (Line(points={{-110,54},{-95.6,54}}, color={0,0,127}));
  connect(deadband1.y, LeadLag.u)
    annotation (Line(points={{-77.2,54},{-69.6,54}}, color={0,0,127}));
  connect(add_ref.u3, Lookup_GateValve_Pmech.u) annotation (Line(points={{-43.6,
          47.6},{-48,47.6},{-48,36},{72,36},{72,54},{76.4,54}}, color={0,0,127}));
  connect(Lookup_GateValve_Pmech.y[1], Steam.u) annotation (Line(points={{94.8,54},
          {98,54},{98,26},{-90,26},{-90,-38},{-81.6,-38}}, color={0,0,127}));
  connect(Pref.y, add_ref.u1) annotation (Line(points={{-51.2,82},{-48,82},{-48,
          60},{-43.6,60},{-43.6,60.4}}, color={0,0,127}));
  connect(Gov_Integrator.y, deadband2.u) annotation (Line(points={{54.8,54},{58,
          54},{58,72},{48,72},{48,82},{58.4,82}}, color={0,0,127}));
  connect(deadband2.y, Lookup_GateValve_Pmech.u) annotation (Line(points={{76.8,
          82},{84,82},{84,68},{72,68},{72,54},{76.4,54}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
                                                           preserveAspectRatio=
            false)),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}},
                                                        preserveAspectRatio=
            true), graphics={Rectangle(extent={{-100,100},{100,-100}},
                                                                     lineColor={28,108,200}),
                     Text(
          extent={{-54,80},{6,40}},
          lineColor={28,108,200},
          textString="SPEED_HP"),Text(
          extent={{30,60},{90,20}},
          lineColor={28,108,200},
          textString="PMECH_HP"),Text(
          extent={{30,-20},{88,-60}},
          lineColor={28,108,200},
          textString="PMECH_LP"),Text(
          extent={{-100,160},{100,100}},
          lineColor={28,108,200},
          textString="WSIEG1"),
                     Text(
          extent={{-56,-56},{-10,-84}},
          lineColor={28,108,200},
          textString="PMECH0")}),
                Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>WECC Modified IEEE Type 1 Speed-Governing Model (PSS/E Manual)</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2024-10-05</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Giuseppe Laera, ALSETLab, RPI Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end WSIEG1;
