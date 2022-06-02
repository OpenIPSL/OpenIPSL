within OpenIPSL.Examples.OpenCPS.Generators;
model G2 "Generation unit connected to bus B5"
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
  OpenIPSL.Electrical.Controls.PSSE.ES.SEXS sEXS(
    T_AT_B=0.2,
    K=50,
    E_MIN=0,
    E_MAX=5,
    T_E=0.01,
    T_B=10) annotation (Placement(transformation(extent={{-16,-22},{4,-2}})));
  Modelica.Blocks.Sources.Constant non_active_limits(k=0)
    annotation (Placement(transformation(extent={{80,-60},{60,-40}})));
  Modelica.Blocks.Interfaces.RealInput V_IB annotation (Placement(
        transformation(extent={{-110,50},{-90,70}}), iconTransformation(extent=
            {{-108,40},{-88,60}})));
  Modelica.Blocks.Interfaces.RealInput V_DN annotation (Placement(
        transformation(extent={{-110,30},{-90,50}}), iconTransformation(extent=
            {{-108,-60},{-88,-40}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.IEESGO iEESGO(P_MAX=1.5, P_MIN=0)
    annotation (Placement(transformation(extent={{4,2},{24,22}})));
  Modelica.Blocks.Interfaces.RealInput fi_IB annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        origin={-100,4}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-50,100})));
  Modelica.Blocks.Interfaces.RealInput fi_DN annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        origin={-100,20}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={50,100})));
  Controls.RESYNCH_UNIT central_Unit annotation (Placement(transformation(
          extent={{-60,30},{-40,50}})));
  Modelica.Blocks.Interfaces.BooleanOutput TRIGGER annotation (Placement(
        transformation(extent={{80,50},{100,70}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-110})));
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
  connect(V_IB, central_Unit.V_IB) annotation (Line(points={{-100,60},{-80,60},
          {-80,47},{-59,47}}, color={0,0,127}));
  connect(iEESGO.PMECH, gen.PMECH)
    annotation (Line(points={{25,12},{34,12}}, color={0,0,127}));
  connect(iEESGO.SPEED, gen.SPEED) annotation (Line(points={{6,18},{-28,18},{
          -28,32},{88,32},{88,14},{80,14}}, color={0,0,127}));
  connect(central_Unit.PMECH0, gen.PMECH0) annotation (Line(points={{-41,37},{
          94,37},{94,10},{80,10}}, color={0,0,127}));
  connect(V_DN, central_Unit.V_DN) annotation (Line(points={{-100,40},{-84,40},
          {-84,43},{-59,43}}, color={0,0,127}));
  connect(fi_DN, central_Unit.fi_DN) annotation (Line(points={{-100,20},{-80,20},
          {-80,37},{-59,37}}, color={0,0,127}));
  connect(fi_IB, central_Unit.fi_IB) annotation (Line(points={{-100,4},{-76,4},
          {-76,33},{-59,33}}, color={0,0,127}));
  connect(central_Unit.SPEED, gen.SPEED) annotation (Line(points={{-41,33},{-28,
          33},{-28,32},{88,32},{88,14},{80,14}}, color={0,0,127}));
  connect(TRIGGER, central_Unit.TRIGGER) annotation (Line(points={{90,60},{-30,
          60},{-30,40},{-39,40}}, color={255,0,255}));
  connect(central_Unit.P_CTRL, iEESGO.PMECH0) annotation (Line(points={{-39,43},
          {-32,43},{-32,6},{6,6}}, color={0,0,127}));
  connect(central_Unit.V_CTRL, sEXS.VOTHSG) annotation (Line(points={{-39,47},{
          -36,47},{-36,-8},{-17,-8}}, color={0,0,127}));
  connect(gen.XADIFD, sEXS.XADIFD) annotation (Line(points={{80,-18},{84,-18},{
          84,-34},{2,-34},{2,-23}}, color={0,0,127}));
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
