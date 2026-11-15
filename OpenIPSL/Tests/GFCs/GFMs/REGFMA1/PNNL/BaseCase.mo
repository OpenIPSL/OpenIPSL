within OpenIPSL.Tests.GFCs.GFMs.REGFMA1.PNNL;
partial model BaseCase
  "REGFM_A1 on PNNL's network with the data of its validation cases, and PSS/E's result to compare against"
  extends OpenIPSL.Tests.BaseClasses.PNNL.TwoBus;
  Electrical.GFCs.GFMs.REGFMA1.Variants.REGFMA1 GFC(
    M_b=0.1e6,
    R_a=0.03,
    X_d=0.15,
    Tr=0.01,
    qTr=0.01,
    Tvf=0.01,
    EMax=1.15,
    EMin=0,
    Pmax=0.9,
    Pmin=0,
    Qmax=0.44,
    Qmin=-0.44,
    mp=0.01,
    mq=0.05,
    kppmax=0.01,
    kipmax=0.1,
    kpqmax=3.0,
    kiqmax=20.0,
    kpv=0.0,
    kiv=5.86,
    P_0=0.06e6,
    Q_0=-0.025474035995024076*0.1e6,
    v_0=1.0,
    angle_0=0.015014355707126548,
    QVFlag_val_k=true,
    VFlag_val_k=true,
    Imax=2.0) "The converter of PNNL's cases, with its default current limiter, the clamp"
    annotation (Placement(transformation(extent={{-100,-30},{-40,30}})));
  Modelica.Blocks.Sources.CombiTimeTable reference(
    tableOnFile=true,
    tableName="PNNL",
    verboseRead=false,
    columns=2:6,
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint,
    timeEvents=Modelica.Blocks.Types.TimeEvents.AtDiscontinuities)
    "PSS/E's result of the case: y[1] P, y[2] Q, y[3] V, y[4] I, y[5] speed deviation"
    annotation (Placement(transformation(extent={{-60,50},{-40,70}})));
  Modelica.Blocks.Sources.RealExpression Imag(y=sqrt(GFC.p.ir^2 + GFC.p.ii^2)) "Current magnitude at the converter's terminal, to compare with reference.y[4]"
    annotation (Placement(transformation(extent={{-20,50},{0,70}})));
equation
  connect(GFC.p, B401.p) annotation (Line(points={{-37,0},{-20,0}}, color={0,0,255}));
  connect(GFC.Pref0, GFC.Pref) annotation (Line(points={{-58,-31.5},{-58,-50},{-120,-50},{-120,-18},{-103,-18}}, color={0,0,127}));
  connect(GFC.Vref0, GFC.Vref) annotation (Line(points={{-82,-31.5},{-82,-60},{-130,-60},{-130,18},{-103,18}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-140,-80},{240,80}}), graphics={Text(
          extent={{10,55},{130,65}},
          textColor={0,0,127},
          horizontalAlignment=TextAlignment.Left,
          textString="reference.y: P, Q, V, I and speed deviation in PSS/E")}), Documentation(info="<html>
<p>
<code>Variants.REGFMA1</code> with the data of PNNL's cases (machine base 0.1 MVA, <code>Imax</code> = 2 pu), and the table <code>reference</code> holding PSS/E's result.
The test that extends this model gives the case and the file of the table;
<a href=\"modelica://OpenIPSL.Tests.GFCs.GFMs.REGFMA1.PNNL.ValidationCases\">ValidationCases</a> and each test say what to plot against it.
</p>
</html>"));
end BaseCase;
