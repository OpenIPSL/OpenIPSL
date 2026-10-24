within OpenIPSL.Tests.Controls.PSSE.ES;
model URST5T "SMIB system to test functionality of URST5T model"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    Xppd=0.2,
    Xppq=0.2,
    Xpp=0.2,
    Xl=0.12,
    angle_0=0.070620673811799,
    Tpd0=5,
    Tppd0=0.50000E-01,
    Tppq0=0.1,
    H=4.0000,
    D=0,
    Xd=1.41,
    Xq=1.3500,
    Xpd=0.3,
    S10=0.1,
    S12=0.5,
    Xpq=0.6,
    Tpq0=0.7,
    M_b=100000000,
    P_0=39999952.9123306,
    Q_0=5416571.34890556,
    v_0=1) annotation (Placement(transformation(extent={{-88,-20},{-48,20}})));
  Modelica.Blocks.Sources.Constant const2(k=0)
    annotation (Placement(transformation(extent={{-110,166},{-94,182}})));
  Modelica.Blocks.Sources.Constant VOEL(k=1000) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        origin={-86,-72})));
  OpenIPSL.Electrical.Controls.PSSE.ES.URST5T uRST5T
    annotation (Placement(transformation(extent={{-60,-60},{-80,-40}})));
  Modelica.Blocks.Sources.Constant VUEL(k=-1000) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        origin={-86,-90})));
  Modelica.Blocks.Sources.Constant VOTHSG(k=0) annotation (Placement(
        transformation(
        extent={{4,-4},{-4,4}},
        origin={-24,-46})));
equation
  connect(VUEL.y, uRST5T.VUEL) annotation (Line(
      points={{-79.4,-90},{-66.25,-90},{-66.25,-61},{-66,-61}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOEL.y, uRST5T.VOEL) annotation (Line(
      points={{-79.4,-72},{-70,-72},{-70,-61}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(VOTHSG.y, uRST5T.VOTHSG) annotation (Line(
      points={{-28.4,-46},{-59,-46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.XADIFD, uRST5T.XADIFD) annotation (Line(
      points={{-46,-18},{-42,-18},{-42,-66},{-78,-66},{-78,-61}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.EFD0, uRST5T.EFD0) annotation (Line(
      points={{-46,-10},{-38,-10},{-38,-54},{-59,-54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.PMECH0, gENROU.PMECH) annotation (Line(
      points={{-46,10},{-40,10},{-40,30},{-100,30},{-100,10},{-92,10}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(gENROU.ETERM, uRST5T.ECOMP) annotation (Line(
      points={{-46,-6},{-34,-6},{-34,-50},{-59,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(uRST5T.EFD, gENROU.EFD) annotation (Line(
      points={{-81,-50},{-100,-50},{-100,-10},{-92,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gENROU.p, GEN1.p) annotation (Line(points={{-48,0},{-30,0}},
                       color={0,0,255}));
  connect(uRST5T.VT, uRST5T.ECOMP) annotation (Line(points={{-59,-42},{-34,-42},{-34,-50},{-59,-50}},
                                                                        color={
          0,0,127}));
  annotation (
experiment(StopTime=10),
    Documentation(info="<html>
<p>A GENROU with the URST5T excitation system at <code>GEN1</code> of
<a href=\"modelica://OpenIPSL.Tests.BaseClasses.SMIB\">SMIB</a>, the fault from 2.0 to 2.15 s. The machine's terminal
voltage <code>ETERM</code> feeds the exciter's <code>ECOMP</code> and, through it, <code>VT</code>: in PSS/E's URST5T
both are the terminal voltage (the sensed voltage EC and the voltage VT that scales the limits VRMAX and VRMIN of the
final filter), and so in <a href=\"modelica://OpenIPSL.Tests.Controls.PSSE.ES.ST5B\">ST5B</a>'s test. Until 2026-10-24
this test fed the electrical power <code>PELEC</code> into <code>ECOMP</code>: the regulator then held the power, the
limits of the final filter were +-4 instead of +-10 and followed the power through the fault, clamping the field
voltage to 0.19 pu while PSS/E gives 1.0, and, with the machine angle still in degrees, were swapped at t = 0.
With <code>ETERM</code> the test agrees with a PSS/E 36.2 run of the same network and data within PSS/E's own step
spread (field voltage 1.9e-3 pu, speed 1.1e-5, angle 5.4e-4 rad).</p>
<p>Variables of interest: <code>uRST5T.EFD</code>, <code>uRST5T.simpleLagLimVar.outMax</code> and
<code>outMin</code> (the limits VRMAX*VT and VRMIN*VT), <code>gENROU.ETERM</code>, <code>gENROU.w</code>.</p>
</html>"));
end URST5T;
