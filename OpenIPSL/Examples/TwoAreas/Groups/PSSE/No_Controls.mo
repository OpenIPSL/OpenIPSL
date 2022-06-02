within OpenIPSL.Examples.TwoAreas.Groups.PSSE;
package No_Controls "Set of generation units modeled with PSSE composed only of machines"
  model G1 "900MVA generation unit, composed only of a machine model, connected to bus 1"
    extends TwoAreas.Support.Generator;
    OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
      Tpd0=8,
      Tppd0=0.03,
      Tppq0=0.05,
      H=6.5,
      Xd=1.8,
      Xq=1.7,
      Xpd=0.3,
      Xppd=0.25,
      Xppq=0.25,
      Xl=0.2,
      R_a=0.0025,
      D=0.02,
      S12=0.802,
      S10=0.18600,
      M_b=900000000,
      V_b=V_b,
      v_0=v_0,
      angle_0=angle_0,
      P_0=P_0,
      Q_0=Q_0)
      annotation (Placement(transformation(extent={{32,-20},{72,20}})));
  equation
    connect(gENSAL.EFD0, gENSAL.EFD) annotation (Line(points={{74,-10},{80,-10},
            {80,-30},{20,-30},{20,-12},{28,-12}}, color={0,0,127}));
    connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{28,12},{20,
            12},{20,30},{80,30},{80,10},{74,10}}, color={0,0,127}));
    connect(gENSAL.p, pwPin)
      annotation (Line(points={{72,0},{100,0}}, color={0,0,255}));
    annotation (
      Documentation(info="<html>
<p>900MVA generation unit connected to bus 1, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENSAL, a salient pole synchronous generator model, from PSSE.</li>
</ul>
</html>"));
  end G1;

  model G2 "900MVA generation unit, composed only of a machine model, connected to bus 2"
    extends TwoAreas.Support.Generator;
    OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
      Tpd0=8,
      Tppd0=0.03,
      Tppq0=0.05,
      H=6.5,
      Xd=1.8,
      Xq=1.7,
      Xpd=0.3,
      Xppd=0.25,
      Xppq=0.25,
      Xl=0.2,
      R_a=0.0025,
      D=0.02,
      S12=0.802,
      S10=0.18600,
      M_b=900000000,
      V_b=V_b,
      v_0=v_0,
      angle_0=angle_0,
      P_0=P_0,
      Q_0=Q_0)
      annotation (Placement(transformation(extent={{32,-20},{72,20}})));
  equation
    connect(gENSAL.EFD, gENSAL.EFD0) annotation (Line(points={{28,-12},{20,-12},
            {20,-30},{80,-30},{80,-10},{74,-10}}, color={0,0,127}));
    connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{28,12},{20,
            12},{20,30},{80,30},{80,10},{74,10}}, color={0,0,127}));
    connect(gENSAL.p, pwPin)
      annotation (Line(points={{72,0},{100,0}}, color={0,0,255}));
    annotation (
      Documentation(info="<html>
<p>900MVA generation unit connected to bus 2, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENSAL, a salient pole synchronous generator model, from PSSE.</li>
</ul>
</html>"));
  end G2;

  model G3 "900MVA generation unit, composed only of a machine model, connected to bus 3"
    extends TwoAreas.Support.Generator;
    OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
      Tpd0=8,
      Tppd0=0.03,
      Tppq0=0.05,
      D=0,
      Xd=1.8,
      Xq=1.7,
      Xpd=0.3,
      Xppd=0.25,
      Xppq=0.25,
      Xl=0.2,
      H=6.175,
      R_a=0.0025,
      S12=0.802,
      S10=0.18600,
      M_b=900000000,
      V_b=V_b,
      v_0=v_0,
      P_0=P_0,
      Q_0=Q_0,
      angle_0=angle_0)
      annotation (Placement(transformation(extent={{32,-20},{72,20}})));
  equation
    connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{28,12},{20,
            12},{20,30},{80,30},{80,10},{74,10}}, color={0,0,127}));
    connect(gENSAL.EFD0, gENSAL.EFD) annotation (Line(points={{74,-10},{80,-10},
            {80,-30},{20,-30},{20,-12},{28,-12}}, color=
           {0,0,127}));
    connect(gENSAL.p, pwPin) annotation (Line(points={{72,0},{100,0}},
                     color={0,0,255}));
    annotation (
      Documentation(info="<html>
<p>900MVA generation unit connected to bus 3, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENSAL, a salient pole synchronous generator model, from PSSE.</li>
</ul>
</html>"));
  end G3;

  model G4 "900MVA generation unit, composed only of a machine model, connected to bus 4"
    extends TwoAreas.Support.Generator;
    OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
      Tpd0=8,
      Tppd0=0.03,
      Tppq0=0.05,
      H=6.175,
      Xd=1.8,
      Xq=1.7,
      Xpd=0.3,
      Xppd=0.25,
      Xppq=0.25,
      Xl=0.2,
      R_a=0.0025,
      D=0.02,
      S12=0.802,
      S10=0.18600,
      M_b=900000000,
      V_b=V_b,
      v_0=v_0,
      angle_0=angle_0,
      P_0=P_0,
      Q_0=Q_0)
      annotation (Placement(transformation(extent={{32,-20},{72,20}})));
  equation
    connect(gENSAL.p, pwPin)
      annotation (Line(points={{72,0},{100,0}}, color={0,0,255}));
    connect(gENSAL.EFD0, gENSAL.EFD) annotation (Line(points={{74,-10},{80,-10},
            {80,-30},{20,-30},{20,-12},{28,-12}}, color={0,0,127}));
    connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{28,12},{20,
            12},{20,30},{80,30},{80,10},{74,10}},
          color={0,0,127}));
    annotation (
      Documentation(info="<html>
<p>900MVA generation unit connected to bus 4, and composed of the following component models:</p>
<ul>
<li><strong>Machine</strong>: GENSAL, a salient pole synchronous generator model, from PSSE.</li>
</ul>
</html>"));
  end G4;
  annotation (Documentation(info="<html>
<p>This package contains four generation unit models composed solely of PSSE machine models, that are used in the <strong>Two_Areas_PSSE</strong> system.</p>
</html>"));
end No_Controls;
