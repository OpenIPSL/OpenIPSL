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
    Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeI
      annotation (Placement(transformation(extent={{-20,0},{0,20}})));
    Electrical.Controls.PSAT.TG.TGTypeII tGTypeII(
      R=20,
      pmax0=1.5,
      pmin0=0,
      Ts=0.5,
      T3=0,
      Sn=P_0)
      annotation (Placement(transformation(extent={{-40,-38},{-20,-18}})));
    Modelica.Blocks.Math.Add add
      annotation (Placement(transformation(extent={{-68,44},{-48,64}})));
    Modelica.Blocks.Math.Add add1
      annotation (Placement(transformation(extent={{-2,-46},{18,-26}})));
    Modelica.Blocks.Interfaces.RealOutput w1         "Rotor speed [pu]"
      annotation (Placement(transformation(extent={{100,30},{120,50}})));
    Modelica.Blocks.Interfaces.RealOutput delta1 "Rotor angle"
      annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
  equation
    connect(aVRTypeI.vf, order2_1.vf)
      annotation (Line(points={{2,10},{28,10}}, color={0,0,127}));
    connect(order2_1.w, tGTypeII.w) annotation (Line(points={{74,18},{82,18},{
            82,-90},{-48,-90},{-48,-28},{-42,-28}}, color={0,0,127}));
    connect(order2_1.v, add.u2) annotation (Line(points={{74,6},{88,6},{88,34},
            {-78,34},{-78,48},{-70,48}}, color={0,0,127}));
    connect(EFD, add.u1)
      annotation (Line(points={{-120,60},{-70,60}}, color={0,0,127}));
    connect(add.y, aVRTypeI.v) annotation (Line(points={{-47,54},{-36,54},{-36,
            4},{-22,4}}, color={0,0,127}));
    connect(P, add1.u2) annotation (Line(points={{-120,-60},{-12,-60},{-12,-42},
            {-4,-42}}, color={0,0,127}));
    connect(add1.u1, tGTypeII.pm)
      annotation (Line(points={{-4,-30},{-12,-30},{-12,-28},{-19,-28}},
                                                    color={0,0,127}));
    connect(add1.y, order2_1.pm) annotation (Line(points={{19,-36},{22,-36},{22,
            -10},{28,-10}}, color={0,0,127}));
    connect(order2_1.p, conn)
      annotation (Line(points={{72,0},{110,0}}, color={0,0,255}));
    connect(order2_1.pm0, tGTypeII.pm0) annotation (Line(points={{36,-22},{38,
            -22},{38,-24},{12,-24},{12,-16},{-30,-16}}, color={0,0,127}));
    connect(order2_1.w, w1) annotation (Line(points={{74,18},{82,18},{82,4},{94,
            4},{94,40},{110,40}}, color={0,0,127}));
    connect(order2_1.delta, delta1) annotation (Line(points={{74,12},{96,12},{
            96,-12},{92,-12},{92,-30},{110,-30}}, color={0,0,127}));
    connect(aVRTypeI.vf0, order2_1.vf0) annotation (Line(points={{-10,-2},{-10,
            -8},{14,-8},{14,28},{36,28},{36,22}}, color={0,0,127}));
    connect(aVRTypeI.vref0, aVRTypeI.vref) annotation (Line(points={{-10,22},{
            -12,22},{-12,26},{-30,26},{-30,16},{-22,16}}, color={0,0,127}));
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
    Electrical.Controls.PSAT.AVR.AVRTypeI aVRTypeI
      annotation (Placement(transformation(extent={{-12,0},{8,20}})));
    Electrical.Controls.PSAT.TG.TGTypeII tGTypeII(
      R=20,
      pmax0=1.5,
      pmin0=0,
      Ts=0.5,
      T3=0.5,
      Sn=P_0)
      annotation (Placement(transformation(extent={{-32,-40},{-12,-20}})));
  equation
    connect(aVRTypeI.vf,order2_1. vf)
      annotation (Line(points={{10,10},{36,10}},color={0,0,127}));
    connect(order2_1.vf0,aVRTypeI. vf0) annotation (Line(points={{44,22},{44,30},
            {20,30},{20,-12},{-2,-12},{-2,-2}},   color={0,0,127}));
    connect(aVRTypeI.vref0,aVRTypeI. vref) annotation (Line(points={{-2,22},{-2,
            26},{-16,26},{-16,16},{-14,16}},     color={0,0,127}));
    connect(order2_1.w,tGTypeII. w) annotation (Line(points={{82,18},{86,18},{
            86,40},{-44,40},{-44,-30},{-34,-30}},   color={0,0,127}));
    connect(order2_1.pm0,tGTypeII. pm0) annotation (Line(points={{44,-22},{44,
            -30},{30,-30},{30,-18},{-8,-18},{-8,-10},{-22,-10},{-22,-18}},
                                                        color={0,0,127}));
    connect(order2_1.p, conn)
      annotation (Line(points={{80,0},{110,0}}, color={0,0,255}));
    connect(order2_1.v, aVRTypeI.v) annotation (Line(points={{82,6},{94,6},{94,
            34},{-22,34},{-22,4},{-14,4}}, color={0,0,127}));
    connect(tGTypeII.pm, order2_1.pm) annotation (Line(points={{-11,-30},{28,
            -30},{28,-10},{36,-10}}, color={0,0,127}));
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
end PSAT_Units;
