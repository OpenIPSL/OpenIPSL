within OpenIPSL.Examples.MPC.GenerationUnits;
package PSAT_Units
  model G2 "Generation unit connected to bus B5"
    outer OpenIPSL.Electrical.SystemBase SysData;
    extends OpenIPSL.Electrical.Essentials.pfComponent;

    OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
              100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealInput EFD "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
    Modelica.Blocks.Interfaces.RealInput P "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
    Electrical.Machines.PSAT.Order2 order2_1(
      V_b=V_b,
      P_0=P_0,
      Q_0=Q_0,
      v_0=v_0,
      angle_0=angle_0,
      Sn=100000000,
      Vn=V_b,
      ra=0,
      x1d=0.41,
      M=4.28,
      D=0) annotation (Placement(transformation(extent={{32,-20},{72,20}})));
    Modelica.Blocks.Math.Add  add3_2
      annotation (Placement(transformation(extent={{-80,44},{-60,64}})));
    Modelica.Blocks.Math.Add  add3_1
      annotation (Placement(transformation(extent={{-80,-64},{-60,-44}})));
  equation
    connect(order2_1.p, conn)
      annotation (Line(points={{72,0},{110,0}}, color={0,0,255}));
    connect(EFD, add3_2.u1)
      annotation (Line(points={{-120,60},{-82,60}}, color={0,0,127}));
    connect(order2_1.vf0, add3_2.u2) annotation (Line(points={{36,22},{36,36},{
            -90,36},{-90,48},{-82,48}}, color={0,0,127}));
    connect(add3_2.y, order2_1.vf) annotation (Line(points={{-59,54},{-14,54},{
            -14,10},{28,10}}, color={0,0,127}));
    connect(P, add3_1.u2)
      annotation (Line(points={{-120,-60},{-82,-60}}, color={0,0,127}));
    connect(order2_1.pm0, add3_1.u1) annotation (Line(points={{36,-22},{36,-32},
            {-92,-32},{-92,-48},{-82,-48}}, color={0,0,127}));
    connect(add3_1.y, order2_1.pm) annotation (Line(points={{-59,-54},{12,-54},
            {12,-10},{28,-10}},                    color={0,0,127}));
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
  end G2;

  model G1 "Generation unit connected to bus BG1"
    outer OpenIPSL.Electrical.SystemBase SysData;
    extends OpenIPSL.Electrical.Essentials.pfComponent;

    OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
              100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
    Electrical.Machines.PSAT.Order2 order2_1(
      V_b=V_b,
      P_0=P_0,
      Q_0=Q_0,
      v_0=v_0,
      angle_0=angle_0,
      Sn=100000000,
      Vn=V_b,
      ra=0,
      x1d=0.41,
      M=4.28,
      D=0) annotation (Placement(transformation(extent={{40,-20},{80,20}})));
    Electrical.Controls.PSAT.AVR.AVRTypeII aVRTypeII
      annotation (Placement(transformation(extent={{-12,0},{8,20}})));
    Electrical.Controls.PSAT.TG.TGTypeII tGTypeII(
      R=20,
      pmax0=1.5,
      pmin0=0,
      Ts=0.5,
      T3=-0.5,
      Sn=P_0)
      annotation (Placement(transformation(extent={{-32,-40},{-12,-20}})));
    Modelica.Blocks.Sources.Constant const(k=0)    annotation (Placement(transformation(
          origin={-74,-20},
          extent={{-10,-10},{10,10}})));
  equation
    connect(aVRTypeII.vf, order2_1.vf)
      annotation (Line(points={{10,10},{36,10}}, color={0,0,127}));
    connect(order2_1.vf0, aVRTypeII.vf0) annotation (Line(points={{44,22},{44,
            30},{20,30},{20,-12},{-2,-12},{-2,-2}}, color={0,0,127}));
    connect(aVRTypeII.vref0, aVRTypeII.vref) annotation (Line(points={{-2,22},{
            -2,26},{-16,26},{-16,16},{-14,16}}, color={0,0,127}));
    connect(order2_1.w,tGTypeII. w) annotation (Line(points={{82,18},{86,18},{
            86,40},{-44,40},{-44,-30},{-34,-30}},   color={0,0,127}));
    connect(order2_1.pm0,tGTypeII. pm0) annotation (Line(points={{44,-22},{44,
            -30},{30,-30},{30,-18},{-8,-18},{-8,-10},{-22,-10},{-22,-18}},
                                                        color={0,0,127}));
    connect(order2_1.p, conn)
      annotation (Line(points={{80,0},{110,0}}, color={0,0,255}));
    connect(order2_1.v, aVRTypeII.v) annotation (Line(points={{82,6},{94,6},{94,
            34},{-22,34},{-22,4},{-14,4}}, color={0,0,127}));
    connect(tGTypeII.pm, order2_1.pm) annotation (Line(points={{-11,-30},{28,
            -30},{28,-10},{36,-10}}, color={0,0,127}));
    connect(const.y, tGTypeII.u1) annotation (Line(points={{-63,-20},{-42,-20},
            {-42,-26},{-34,-26}}, color={0,0,127}));
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

  model G2V2 "Generation unit connected to bus B5"
    outer OpenIPSL.Electrical.SystemBase SysData;
    extends OpenIPSL.Electrical.Essentials.pfComponent;

    OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
              100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealInput P "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
    Electrical.Machines.PSAT.Order2 order2_1(
      V_b=V_b,
      P_0=P_0,
      Q_0=Q_0,
      v_0=v_0,
      angle_0=angle_0,
      Sn=100000000,
      Vn=V_b,
      ra=0,
      x1d=0.41,
      M=4.28,
      D=0) annotation (Placement(transformation(extent={{32,-20},{72,20}})));
    Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeII
      annotation (Placement(transformation(extent={{-20,0},{0,20}})));
    OpenIPSL.Examples.MPC.PSAT.TGTypeIIMPC tGTypeII(
      R=1,
      pmax0=5,
      pmin0=0,
      Ts=0.1,
      T3=-0.1,
      Sn=P_0)
      annotation (Placement(transformation(extent={{-42,-38},{-22,-18}})));
    Modelica.Blocks.Interfaces.RealOutput w1         "Rotor speed [pu]"
      annotation (Placement(transformation(extent={{100,30},{120,50}})));
    Modelica.Blocks.Interfaces.RealOutput delta1 "Rotor angle"
      annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
  equation
    connect(aVRTypeII.vf, order2_1.vf)
      annotation (Line(points={{2,10},{28,10}}, color={0,0,127}));
    connect(order2_1.p, conn)
      annotation (Line(points={{72,0},{110,0}}, color={0,0,255}));
    connect(order2_1.w, w1) annotation (Line(points={{74,18},{82,18},{82,4},{94,
            4},{94,40},{110,40}}, color={0,0,127}));
    connect(order2_1.delta, delta1) annotation (Line(points={{74,12},{96,12},{
            96,-12},{92,-12},{92,-30},{110,-30}}, color={0,0,127}));
    connect(tGTypeII.pm, order2_1.pm) annotation (Line(points={{-21,-28},{20,
            -28},{20,-10},{28,-10}}, color={0,0,127}));
    connect(order2_1.pm0, tGTypeII.pm0) annotation (Line(points={{36,-22},{36,
            -34},{0,-34},{0,-10},{-32,-10},{-32,-16}},
                                                  color={0,0,127}));
    connect(P, tGTypeII.u1) annotation (Line(points={{-120,-60},{-52,-60},{-52,
            -24},{-44,-24}},
                        color={0,0,127}));
    connect(tGTypeII.w, w1) annotation (Line(points={{-44,-28},{-46,-28},{-46,
            -60},{82,-60},{82,4},{94,4},{94,40},{110,40}},
                                                      color={0,0,127}));
    connect(order2_1.vf0, aVRTypeII.vf0) annotation (Line(points={{36,22},{36,
            30},{16,30},{16,-6},{-10,-6},{-10,-2}}, color={0,0,127}));
    connect(aVRTypeII.vref0, aVRTypeII.vref) annotation (Line(points={{-10,22},
            {-10,30},{-32,30},{-32,16},{-22,16}}, color={0,0,127}));
    connect(order2_1.v, aVRTypeII.v) annotation (Line(points={{74,6},{82,6},{82,
            54},{-38,54},{-38,4},{-22,4}}, color={0,0,127}));
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
  end G2V2;

  model G2withPID "Generation unit connected to bus B5"
    outer OpenIPSL.Electrical.SystemBase SysData;
    extends OpenIPSL.Electrical.Essentials.pfComponent;

    OpenIPSL.Interfaces.PwPin conn annotation (Placement(transformation(extent={{
              100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealInput EFD "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
    Modelica.Blocks.Interfaces.RealInput P "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
    Electrical.Machines.PSAT.Order2 order2_1(
      V_b=V_b,
      P_0=P_0,
      Q_0=Q_0,
      v_0=v_0,
      angle_0=angle_0,
      Sn=100000000,
      Vn=V_b,
      ra=0,
      x1d=0.41,
      M=4.28,
      D=0) annotation (Placement(transformation(extent={{32,-20},{72,20}})));
    Modelica.Blocks.Math.Feedback feedback
      annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
    Modelica.Blocks.Continuous.Integrator integrator(y_start=0.1)
      annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
    Modelica.Blocks.Math.Gain gain(k=2)
      annotation (Placement(transformation(extent={{-40,-70},{-20,-50}})));
    Modelica.Blocks.Math.Add add
      annotation (Placement(transformation(extent={{-8,-54},{12,-34}})));
    Modelica.Blocks.Math.Feedback feedback1
      annotation (Placement(transformation(extent={{-80,70},{-60,50}})));
    Modelica.Blocks.Math.Gain gain1(k=1)
      annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
    Modelica.Blocks.Continuous.Integrator integrator1(y_start=0.13)
      annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
    Modelica.Blocks.Math.Add add1
      annotation (Placement(transformation(extent={{-4,46},{16,66}})));
  equation
    connect(order2_1.p, conn)
      annotation (Line(points={{72,0},{110,0}}, color={0,0,255}));
    connect(P, feedback.u1)
      annotation (Line(points={{-120,-60},{-78,-60}}, color={0,0,127}));
    connect(order2_1.P, feedback.u2) annotation (Line(points={{74,-6},{90,-6},{
            90,-78},{-70,-78},{-70,-68}}, color={0,0,127}));
    connect(feedback.y, integrator.u) annotation (Line(points={{-61,-60},{-52,
            -60},{-52,-30},{-42,-30}}, color={0,0,127}));
    connect(gain.u, integrator.u) annotation (Line(points={{-42,-60},{-52,-60},
            {-52,-30},{-42,-30}}, color={0,0,127}));
    connect(integrator.y, add.u1) annotation (Line(points={{-19,-30},{-12,-30},
            {-12,-38},{-10,-38}}, color={0,0,127}));
    connect(gain.y, add.u2) annotation (Line(points={{-19,-60},{-12,-60},{-12,
            -50},{-10,-50}}, color={0,0,127}));
    connect(add.y, order2_1.pm) annotation (Line(points={{13,-44},{20,-44},{20,
            -10},{28,-10}}, color={0,0,127}));
    connect(integrator1.y, add1.u1) annotation (Line(points={{-19,70},{-14,70},
            {-14,62},{-6,62}}, color={0,0,127}));
    connect(gain1.y, add1.u2) annotation (Line(points={{-19,40},{-14,40},{-14,
            50},{-6,50}}, color={0,0,127}));
    connect(feedback1.y, integrator1.u) annotation (Line(points={{-61,60},{-54,
            60},{-54,70},{-42,70}}, color={0,0,127}));
    connect(gain1.u, integrator1.u) annotation (Line(points={{-42,40},{-54,40},
            {-54,70},{-42,70}}, color={0,0,127}));
    connect(feedback1.u1, EFD)
      annotation (Line(points={{-78,60},{-120,60}}, color={0,0,127}));
    connect(order2_1.v, feedback1.u2) annotation (Line(points={{74,6},{92,6},{
            92,92},{-70,92},{-70,68}}, color={0,0,127}));
    connect(add1.y, order2_1.vf) annotation (Line(points={{17,56},{24,56},{24,
            34},{-2,34},{-2,10},{28,10}}, color={0,0,127}));
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
  end G2withPID;
end PSAT_Units;
