within OpenIPSL.Examples.MPC.GenerationUnits;
package PSSE
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
    OpenIPSL.Electrical.Controls.PSSE.ES.SEXS SEXS(T_E=0.1)
      annotation (Placement(transformation(extent={{-10,0},{10,20}})));
    OpenIPSL.Electrical.Controls.PSSE.TG.IEESGO IEESGO
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

  model G2_1INPUT_Pref "Generation unit connected to bus B5"
    outer OpenIPSL.Electrical.SystemBase SysData;
    extends OpenIPSL.Electrical.Essentials.pfComponent;

    OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
              100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
    Electrical.Machines.PSSE.GENSAL          gen(
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
      Q_0=Q_0) annotation (Placement(transformation(extent={{38,-20},{78,20}})));
    OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
      T_AT_B=0.2,
      K=50,
      E_MIN=0,
      E_MAX=1.26,
      T_E=0.01,
      T_B=10) annotation (Placement(transformation(extent={{-16,-22},{4,-2}})));
    Modelica.Blocks.Sources.Constant non_active_limits(k=0)
      annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
    Modelica.Blocks.Interfaces.RealInput P_ref
      "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
    Electrical.Controls.PSSE.TG.IEESGO          iEESGO(P_MAX=1.5, P_MIN=0)
      annotation (Placement(transformation(extent={{-20,20},{0,40}})));
    Modelica.Blocks.Math.Add add
      annotation (Placement(transformation(extent={{-72,50},{-52,30}})));
    Modelica.Blocks.Interfaces.RealOutput SPEED1
      "Machine speed deviation from nominal [pu]"
      annotation (Placement(transformation(extent={{100,50},{120,70}})));
  equation
    connect(gen.p, conn)
      annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
    connect(sEXS.EFD, gen.EFD)
      annotation (Line(points={{5,-12},{34,-12}}, color={0,0,127}));
    connect(sEXS.ECOMP, gen.ETERM) annotation (Line(points={{-17,-12},{-32,-12},{
            -32,-72},{92,-72},{92,-6},{80,-6}}, color={0,0,127}));
    connect(gen.EFD0, sEXS.EFD0) annotation (Line(points={{80,-10},{88,-10},{88,
            -68},{-28,-68},{-28,-16},{-17,-16}}, color={0,0,127}));
    connect(non_active_limits.y, sEXS.VOEL)
      annotation (Line(points={{59,-50},{-6,-50},{-6,-23}}, color={0,0,127}));
    connect(sEXS.VUEL, sEXS.VOEL) annotation (Line(points={{-10,-23},{-10,-32},{
            -6,-32},{-6,-23}}, color={0,0,127}));
    connect(gen.XADIFD, sEXS.XADIFD) annotation (Line(points={{80,-18},{84,-18},{
            84,-34},{2,-34},{2,-23}}, color={0,0,127}));
    connect(sEXS.VOTHSG, sEXS.VOEL) annotation (Line(points={{-17,-8},{-22,-8},{
            -22,-32},{-6,-32},{-6,-23}}, color={0,0,127}));
    connect(gen.SPEED, iEESGO.SPEED) annotation (Line(points={{80,14},{86,14},{
            86,54},{-28,54},{-28,36},{-18,36}}, color={0,0,127}));
    connect(iEESGO.PMECH, gen.PMECH) annotation (Line(points={{1,30},{24,30},{
            24,12},{34,12}}, color={0,0,127}));
    connect(add.u1, P_ref) annotation (Line(points={{-74,34},{-94,34},{-94,0},{
            -120,0}}, color={0,0,127}));
    connect(gen.PMECH0, add.u2) annotation (Line(points={{80,10},{90,10},{90,64},
            {-82,64},{-82,46},{-74,46}}, color={0,0,127}));
    connect(add.y, iEESGO.PMECH0) annotation (Line(points={{-51,40},{-40,40},{
            -40,24},{-18,24}}, color={0,0,127}));
    connect(gen.SPEED, SPEED1) annotation (Line(points={{80,14},{86,14},{86,66},
            {96,66},{96,60},{110,60}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Ellipse(
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
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
  end G2_1INPUT_Pref;

  model G2_for_PID "Generation unit connected to bus B5"
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
      Xpq=0.41,
      Tpq0=1)  annotation (Placement(transformation(extent={{38,-20},{78,20}})));
    Modelica.Blocks.Interfaces.RealInput Padd "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
    Modelica.Blocks.Interfaces.RealInput EfdAdd
      "Connector of Real input signal 1"
      annotation (Placement(transformation(extent={{-140,-100},{-100,-60}})));
    Modelica.Blocks.Interfaces.RealOutput PELEC1
                               "Machine electrical power (machine base)"
      annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={90,110})));
    Modelica.Blocks.Interfaces.RealOutput ETERM1
                                "Machine terminal voltage [pu]" annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={90,-110})));
  equation
    connect(gen.p, conn)
      annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
    connect(gen.PELEC, PELEC1) annotation (Line(points={{80,6},{92,6},{92,96},{90,
            96},{90,110}}, color={0,0,127}));
    connect(gen.ETERM, ETERM1) annotation (Line(points={{80,-6},{94,-6},{94,-96},
            {90,-96},{90,-110}}, color={0,0,127}));
    connect(Padd, gen.PMECH) annotation (Line(points={{-120,80},{24,80},{24,12},{
            34,12}}, color={0,0,127}));
    connect(EfdAdd, gen.EFD) annotation (Line(points={{-120,-80},{24,-80},{24,-12},
            {34,-12}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Ellipse(
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
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
  end G2_for_PID;

  model G2_no_controls "Generation unit connected to bus B5"
    outer OpenIPSL.Electrical.SystemBase SysData;
    extends OpenIPSL.Electrical.Essentials.pfComponent;

    OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
              100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
    OpenIPSL.Electrical.Machines.PSSE.GENSAL gen(
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
      Q_0=Q_0) annotation (Placement(transformation(extent={{38,-20},{78,20}})));
    Modelica.Blocks.Interfaces.RealInput Padd "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-140,4},{-100,44}})));
    Modelica.Blocks.Interfaces.RealInput EfdAdd
      "Connector of Real input signal 1"
      annotation (Placement(transformation(extent={{-140,-40},{-100,0}})));
  equation
    connect(gen.p, conn)
      annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
    connect(EfdAdd, gen.EFD) annotation (Line(points={{-120,-20},{24,-20},{24,-12},
            {34,-12}}, color={0,0,127}));
    connect(Padd, gen.PMECH) annotation (Line(points={{-120,24},{24,24},{24,12},{
            34,12}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Ellipse(
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
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
  end G2_no_controls;

  model G2_1INPUT_Pref_NO_TurbGov "Generation unit connected to bus B5"
    outer OpenIPSL.Electrical.SystemBase SysData;
    extends OpenIPSL.Electrical.Essentials.pfComponent;

    OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
              100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
    Electrical.Machines.PSSE.GENSAL          gen(
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
      Q_0=Q_0) annotation (Placement(transformation(extent={{38,-20},{78,20}})));
    OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
      T_AT_B=0.2,
      K=50,
      E_MIN=0,
      E_MAX=1.26,
      T_E=0.01,
      T_B=10) annotation (Placement(transformation(extent={{-16,-22},{4,-2}})));
    Modelica.Blocks.Sources.Constant non_active_limits(k=0)
      annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
    Modelica.Blocks.Interfaces.RealInput P_ref
      "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
    Modelica.Blocks.Interfaces.RealOutput SPEED1
      "Machine speed deviation from nominal [pu]"
      annotation (Placement(transformation(extent={{100,50},{120,70}})));
    Modelica.Blocks.Math.Add add
      annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  equation
    connect(gen.p, conn)
      annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
    connect(sEXS.EFD, gen.EFD)
      annotation (Line(points={{5,-12},{34,-12}}, color={0,0,127}));
    connect(sEXS.ECOMP, gen.ETERM) annotation (Line(points={{-17,-12},{-32,-12},{
            -32,-72},{92,-72},{92,-6},{80,-6}}, color={0,0,127}));
    connect(gen.EFD0, sEXS.EFD0) annotation (Line(points={{80,-10},{88,-10},{88,
            -68},{-28,-68},{-28,-16},{-17,-16}}, color={0,0,127}));
    connect(non_active_limits.y, sEXS.VOEL)
      annotation (Line(points={{59,-50},{-6,-50},{-6,-23}}, color={0,0,127}));
    connect(sEXS.VUEL, sEXS.VOEL) annotation (Line(points={{-10,-23},{-10,-32},{
            -6,-32},{-6,-23}}, color={0,0,127}));
    connect(gen.XADIFD, sEXS.XADIFD) annotation (Line(points={{80,-18},{84,-18},{
            84,-34},{2,-34},{2,-23}}, color={0,0,127}));
    connect(sEXS.VOTHSG, sEXS.VOEL) annotation (Line(points={{-17,-8},{-22,-8},{
            -22,-32},{-6,-32},{-6,-23}}, color={0,0,127}));
    connect(gen.SPEED, SPEED1) annotation (Line(points={{80,14},{86,14},{86,66},
            {96,66},{96,60},{110,60}}, color={0,0,127}));
    connect(P_ref, add.u2) annotation (Line(points={{-120,0},{-80,0},{-80,24},{
            -62,24}}, color={0,0,127}));
    connect(gen.PMECH0, add.u1) annotation (Line(points={{80,10},{92,10},{92,52},
            {-70,52},{-70,36},{-62,36}}, color={0,0,127}));
    connect(add.y, gen.PMECH) annotation (Line(points={{-39,30},{24,30},{24,12},
            {34,12}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Ellipse(
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
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
  end G2_1INPUT_Pref_NO_TurbGov;

  model G2_2INPUT_Pref_Efdref_NO_TurbGov_NO_Exci
    "Generation unit connected to bus B5"
    outer OpenIPSL.Electrical.SystemBase SysData;
    extends OpenIPSL.Electrical.Essentials.pfComponent;

    OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
              100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
    Electrical.Machines.PSSE.GENSAL          gen(
      M_b=100000000,
      Tpd0=5,
      Tppd0=0.07,
      Tppq0=0.09,
      H=2,
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
      Q_0=Q_0) annotation (Placement(transformation(extent={{38,-20},{78,20}})));
    Modelica.Blocks.Interfaces.RealInput P_ref
      "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
    Modelica.Blocks.Math.Add add
      annotation (Placement(transformation(extent={{-72,56},{-52,36}})));
    Modelica.Blocks.Interfaces.RealInput Efd_ref
      "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
    Modelica.Blocks.Math.Add add1
      annotation (Placement(transformation(extent={{-72,-36},{-52,-56}})));
  equation
    connect(gen.p, conn)
      annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
    connect(add.u1, P_ref) annotation (Line(points={{-74,40},{-120,40}},
                      color={0,0,127}));
    connect(gen.PMECH0, add.u2) annotation (Line(points={{80,10},{90,10},{90,64},
            {-82,64},{-82,52},{-74,52}}, color={0,0,127}));
    connect(add.y, gen.PMECH) annotation (Line(points={{-51,46},{24,46},{24,12},
            {34,12}}, color={0,0,127}));
    connect(Efd_ref, add1.u2)
      annotation (Line(points={{-120,-40},{-74,-40}}, color={0,0,127}));
    connect(gen.EFD0, add1.u1) annotation (Line(points={{80,-10},{96,-10},{96,
            -70},{-86,-70},{-86,-52},{-74,-52}}, color={0,0,127}));
    connect(add1.y, gen.EFD) annotation (Line(points={{-51,-46},{24,-46},{24,
            -12},{34,-12}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Ellipse(
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
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
  end G2_2INPUT_Pref_Efdref_NO_TurbGov_NO_Exci;

  model G2_1INPUT_Pref_WITH_TurbGov "Generation unit connected to bus B5"
    outer OpenIPSL.Electrical.SystemBase SysData;
    extends OpenIPSL.Electrical.Essentials.pfComponent;

    OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
              100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
    Electrical.Machines.PSSE.GENSAL          gen(
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
      Q_0=Q_0) annotation (Placement(transformation(extent={{38,-20},{78,20}})));
    OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
      T_AT_B=0.2,
      K=50,
      E_MIN=0,
      E_MAX=1.26,
      T_E=0.01,
      T_B=10) annotation (Placement(transformation(extent={{-16,-22},{4,-2}})));
    Modelica.Blocks.Sources.Constant non_active_limits(k=0)
      annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
    Modelica.Blocks.Interfaces.RealInput P_ref
      "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
    Modelica.Blocks.Interfaces.RealOutput SPEED1
      "Machine speed deviation from nominal [pu]"
      annotation (Placement(transformation(extent={{100,50},{120,70}})));
    GASTMPC gASTMPC(T_3=0.01, D_turb=0.1)
      annotation (Placement(transformation(extent={{-18,14},{2,34}})));
    Modelica.Blocks.Interfaces.RealOutput PMECH1
      annotation (Placement(transformation(extent={{100,30},{120,50}})));
    Modelica.Blocks.Interfaces.RealOutput EFD1
                                              "Excitation Voltage [pu]"
      annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
    Modelica.Blocks.Interfaces.RealOutput ETERM1
                                "Machine terminal voltage [pu]"
      annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
    Modelica.Blocks.Interfaces.RealOutput PELEC1
                               "Machine electrical power (machine base)"
      annotation (Placement(transformation(extent={{100,12},{120,32}})));
    Modelica.Blocks.Interfaces.RealOutput TF2_out1
      "Connector of Real output signal"
      annotation (Placement(transformation(extent={{100,76},{120,96}})));
  equation
    connect(gen.p, conn)
      annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
    connect(sEXS.EFD, gen.EFD)
      annotation (Line(points={{5,-12},{34,-12}}, color={0,0,127}));
    connect(sEXS.ECOMP, gen.ETERM) annotation (Line(points={{-17,-12},{-32,-12},{
            -32,-72},{92,-72},{92,-6},{80,-6}}, color={0,0,127}));
    connect(gen.EFD0, sEXS.EFD0) annotation (Line(points={{80,-10},{88,-10},{88,
            -68},{-28,-68},{-28,-16},{-17,-16}}, color={0,0,127}));
    connect(non_active_limits.y, sEXS.VOEL)
      annotation (Line(points={{59,-50},{-6,-50},{-6,-23}}, color={0,0,127}));
    connect(sEXS.VUEL, sEXS.VOEL) annotation (Line(points={{-10,-23},{-10,-32},{
            -6,-32},{-6,-23}}, color={0,0,127}));
    connect(gen.XADIFD, sEXS.XADIFD) annotation (Line(points={{80,-18},{84,-18},{
            84,-34},{2,-34},{2,-23}}, color={0,0,127}));
    connect(sEXS.VOTHSG, sEXS.VOEL) annotation (Line(points={{-17,-8},{-22,-8},{
            -22,-32},{-6,-32},{-6,-23}}, color={0,0,127}));
    connect(gen.SPEED, SPEED1) annotation (Line(points={{80,14},{86,14},{86,66},
            {96,66},{96,60},{110,60}}, color={0,0,127}));
    connect(gASTMPC.SPEED, SPEED1) annotation (Line(points={{-16,30},{-32,30},{
            -32,54},{86,54},{86,66},{96,66},{96,60},{110,60}}, color={0,0,127}));
    connect(gASTMPC.PMECH0, gen.PMECH0) annotation (Line(points={{-16,18},{-28,
            18},{-28,44},{92,44},{92,10},{80,10}}, color={0,0,127}));
    connect(P_ref, gASTMPC.PMECHControllable) annotation (Line(points={{-120,0},
            {-40,0},{-40,8},{-8,8},{-8,12}}, color={0,0,127}));
    connect(gASTMPC.PMECH, gen.PMECH) annotation (Line(points={{3,24},{22,24},{
            22,12},{34,12}}, color={0,0,127}));
    connect(gASTMPC.PMECH, PMECH1) annotation (Line(points={{3,24},{52,24},{52,
            40},{110,40}}, color={0,0,127}));
    connect(sEXS.EFD, EFD1) annotation (Line(points={{5,-12},{26,-12},{26,-36},
            {94,-36},{94,-30},{110,-30}}, color={0,0,127}));
    connect(gen.ETERM, ETERM1) annotation (Line(points={{80,-6},{92,-6},{92,-60},
            {110,-60}}, color={0,0,127}));
    connect(gen.PELEC, PELEC1) annotation (Line(points={{80,6},{94,6},{94,22},{
            110,22}}, color={0,0,127}));
    connect(gASTMPC.TF2_out, TF2_out1) annotation (Line(points={{1,35},{16,35},
            {16,86},{110,86}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Ellipse(
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
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
  end G2_1INPUT_Pref_WITH_TurbGov;

  model G2_2INPUTS "Generation unit connected to bus B5"
    outer OpenIPSL.Electrical.SystemBase SysData;
    extends OpenIPSL.Electrical.Essentials.pfComponent;

    OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
              100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
    Electrical.Machines.PSSE.GENSAL          gen(
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
      Q_0=Q_0) annotation (Placement(transformation(extent={{38,-20},{78,20}})));
    SEXSMPC                                   sEXSMPC(
      T_AT_B=0.2,
      K=50,
      E_MIN=0,
      E_MAX=10,
      T_E=0.01,
      T_B=10) annotation (Placement(transformation(extent={{-16,-22},{4,-2}})));
    Modelica.Blocks.Sources.Constant non_active_limits(k=0)
      annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
    Modelica.Blocks.Interfaces.RealInput P_ref
      "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
    Modelica.Blocks.Interfaces.RealOutput SPEED1
      "Machine speed deviation from nominal [pu]"
      annotation (Placement(transformation(extent={{100,50},{120,70}})));
    GASTMPC gASTMPC(T_3=0.01, D_turb=0.1)
      annotation (Placement(transformation(extent={{-18,14},{2,34}})));
    Modelica.Blocks.Interfaces.RealOutput PMECH1
      annotation (Placement(transformation(extent={{100,30},{120,50}})));
    Modelica.Blocks.Interfaces.RealOutput EFD1
                                              "Excitation Voltage [pu]"
      annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
    Modelica.Blocks.Interfaces.RealOutput ETERM1
                                "Machine terminal voltage [pu]"
      annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
    Modelica.Blocks.Interfaces.RealOutput PELEC1
                               "Machine electrical power (machine base)"
      annotation (Placement(transformation(extent={{100,12},{120,32}})));
    Modelica.Blocks.Interfaces.RealOutput TF2_out1
      "Connector of Real output signal"
      annotation (Placement(transformation(extent={{100,76},{120,96}})));
    Modelica.Blocks.Interfaces.RealInput Efd_ref
      "Connector of Real input signal 1"
      annotation (Placement(transformation(extent={{-140,-40},{-100,0}})));
  equation
    connect(gen.p, conn)
      annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
    connect(sEXSMPC.EFD, gen.EFD)
      annotation (Line(points={{5,-12},{34,-12}}, color={0,0,127}));
    connect(sEXSMPC.ECOMP, gen.ETERM) annotation (Line(points={{-17,-12},{-32,-12},
            {-32,-72},{92,-72},{92,-6},{80,-6}}, color={0,0,127}));
    connect(gen.EFD0, sEXSMPC.EFD0) annotation (Line(points={{80,-10},{88,-10},
            {88,-68},{-28,-68},{-28,-16},{-17,-16}}, color={0,0,127}));
    connect(non_active_limits.y, sEXSMPC.VOEL)
      annotation (Line(points={{59,-50},{-6,-50},{-6,-23}}, color={0,0,127}));
    connect(sEXSMPC.VUEL, sEXSMPC.VOEL) annotation (Line(points={{-10,-23},{-10,
            -32},{-6,-32},{-6,-23}}, color={0,0,127}));
    connect(gen.XADIFD, sEXSMPC.XADIFD) annotation (Line(points={{80,-18},{84,-18},
            {84,-34},{2,-34},{2,-23}}, color={0,0,127}));
    connect(sEXSMPC.VOTHSG, sEXSMPC.VOEL) annotation (Line(points={{-17,-8},{-22,
            -8},{-22,-32},{-6,-32},{-6,-23}}, color={0,0,127}));
    connect(gen.SPEED, SPEED1) annotation (Line(points={{80,14},{86,14},{86,66},
            {96,66},{96,60},{110,60}}, color={0,0,127}));
    connect(gASTMPC.SPEED, SPEED1) annotation (Line(points={{-16,30},{-32,30},{
            -32,54},{86,54},{86,66},{96,66},{96,60},{110,60}}, color={0,0,127}));
    connect(gASTMPC.PMECH0, gen.PMECH0) annotation (Line(points={{-16,18},{-28,
            18},{-28,44},{92,44},{92,10},{80,10}}, color={0,0,127}));
    connect(P_ref, gASTMPC.PMECHControllable) annotation (Line(points={{-120,40},
            {-34,40},{-34,8},{-8,8},{-8,12}},color={0,0,127}));
    connect(gASTMPC.PMECH, gen.PMECH) annotation (Line(points={{3,24},{22,24},{
            22,12},{34,12}}, color={0,0,127}));
    connect(gASTMPC.PMECH, PMECH1) annotation (Line(points={{3,24},{52,24},{52,
            40},{110,40}}, color={0,0,127}));
    connect(sEXSMPC.EFD, EFD1) annotation (Line(points={{5,-12},{26,-12},{26,-36},
            {94,-36},{94,-30},{110,-30}}, color={0,0,127}));
    connect(gen.ETERM, ETERM1) annotation (Line(points={{80,-6},{92,-6},{92,-60},
            {110,-60}}, color={0,0,127}));
    connect(gen.PELEC, PELEC1) annotation (Line(points={{80,6},{94,6},{94,22},{
            110,22}}, color={0,0,127}));
    connect(gASTMPC.TF2_out, TF2_out1) annotation (Line(points={{1,35},{16,35},
            {16,86},{110,86}}, color={0,0,127}));
    connect(sEXSMPC.EFd_input, Efd_ref) annotation (Line(points={{-17,-4},{-94,
            -4},{-94,-20},{-120,-20}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Ellipse(
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
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
  end G2_2INPUTS;

  model G2_3INPUTS "Generation unit connected to bus B5"
    outer OpenIPSL.Electrical.SystemBase SysData;
    extends OpenIPSL.Electrical.Essentials.pfComponent;

    OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
              100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
    Electrical.Machines.PSSE.GENSAL          gen(
      M_b=100000000,
      Tpd0=5,
      Tppd0=0.07,
      Tppq0=0.09,
      H=4.28,
      D=0.1,
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
      Q_0=Q_0) annotation (Placement(transformation(extent={{38,-20},{78,20}})));
    SEXSMPC                                   sEXSMPC(
      T_AT_B=0.2,
      K=50,
      E_MIN=0,
      E_MAX=5,
      T_E=0.01,
      T_B=10) annotation (Placement(transformation(extent={{-16,-22},{4,-2}})));
    Modelica.Blocks.Sources.Constant non_active_limits(k=0)
      annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
    Modelica.Blocks.Interfaces.RealInput P_ref1
      "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
    GASTMPC gASTMPC(T_3=0.01,
      V_MAX=1,                D_turb=0.1)
      annotation (Placement(transformation(extent={{-18,14},{2,34}})));
    Modelica.Blocks.Interfaces.RealInput Efd_ref
      "Connector of Real input signal 1"
      annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  equation
    connect(gen.p, conn)
      annotation (Line(points={{78,0},{110,0}}, color={0,0,255}));
    connect(sEXSMPC.EFD, gen.EFD)
      annotation (Line(points={{5,-12},{34,-12}}, color={0,0,127}));
    connect(sEXSMPC.ECOMP, gen.ETERM) annotation (Line(points={{-17,-12},{-32,-12},
            {-32,-72},{92,-72},{92,-6},{80,-6}}, color={0,0,127}));
    connect(gen.EFD0, sEXSMPC.EFD0) annotation (Line(points={{80,-10},{88,-10},
            {88,-68},{-28,-68},{-28,-16},{-17,-16}}, color={0,0,127}));
    connect(non_active_limits.y, sEXSMPC.VOEL)
      annotation (Line(points={{59,-50},{-6,-50},{-6,-23}}, color={0,0,127}));
    connect(sEXSMPC.VUEL, sEXSMPC.VOEL) annotation (Line(points={{-10,-23},{-10,
            -32},{-6,-32},{-6,-23}}, color={0,0,127}));
    connect(gen.XADIFD, sEXSMPC.XADIFD) annotation (Line(points={{80,-18},{84,-18},
            {84,-34},{2,-34},{2,-23}}, color={0,0,127}));
    connect(sEXSMPC.VOTHSG, sEXSMPC.VOEL) annotation (Line(points={{-17,-8},{-22,
            -8},{-22,-32},{-6,-32},{-6,-23}}, color={0,0,127}));
    connect(gASTMPC.PMECH0, gen.PMECH0) annotation (Line(points={{-16,18},{-28,
            18},{-28,44},{92,44},{92,10},{80,10}}, color={0,0,127}));
    connect(gASTMPC.PMECH, gen.PMECH) annotation (Line(points={{3,24},{22,24},{
            22,12},{34,12}}, color={0,0,127}));
    connect(sEXSMPC.EFd_input, Efd_ref) annotation (Line(points={{-17,-4},{-94,
            -4},{-94,-60},{-120,-60}}, color={0,0,127}));
    connect(P_ref1, gASTMPC.PMECHControllable) annotation (Line(points={{-120,
            60},{-60,60},{-60,8},{-8,8},{-8,12}}, color={0,0,127}));
    connect(gen.SPEED, gASTMPC.SPEED) annotation (Line(points={{80,14},{84,14},
            {84,40},{-24,40},{-24,30},{-16,30}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
              {100,100}}), graphics={Ellipse(
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
<li><strong>Turbine/Governor</strong>: IEESGO, a standard turbine/governor from PSSE.</li>
</ul>
<p>This generation unit is supposed to be disconnected in all experiments and, then, to be resynchronized to the whole system.</p>
</html>"));
  end G2_3INPUTS;
end PSSE;
