within OpenIPSL.Examples.MPC.GenerationUnits;
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
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Modelica.Blocks.Interfaces.RealInput Padd "Connector of Real input signal 2"
    annotation (Placement(transformation(extent={{-140,4},{-100,44}})));
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
  connect(gen.PMECH0, add.u1) annotation (Line(points={{80,10},{86,10},{86,48},
          {-8,48},{-8,36},{-2,36}}, color={0,0,127}));
  connect(add.y, gen.PMECH) annotation (Line(points={{21,30},{24,30},{24,12},{
          34,12}}, color={0,0,127}));
  connect(add.u2, Padd)
    annotation (Line(points={{-2,24},{-120,24}}, color={0,0,127}));
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
