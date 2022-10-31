within OpenIPSL.Electrical.Controls.CGMES.ES;
model ExcSEXS "CGMES Simplified Excitation System Model"
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  parameter Real T_AT_B=0.1 "Ta/Tb - gain reduction ratio of lag-lead element";
  parameter Types.Time T_B=10 "Denominator time constant of lag-lead block";
  parameter Types.PerUnit K=100 "Gain (K) (>0)";
  parameter Types.Time T_E=0.05 "Time constant of gain block";
  parameter Types.PerUnit K_C=0.08 "PI controller gain";
  parameter Types.Time T_C=0 "PI controller phase lead time constant";
  parameter Types.PerUnit E_MIN=-5 "Minimum field voltage output";
  parameter Types.PerUnit E_MAX=5 "Maximum field voltage output";
  parameter Types.PerUnit EFD_MAX=5 "Field voltage clipping maximum limit";
  parameter Types.PerUnit EFD_MIN=-5 "Field voltage clipping minimum limit";
  Modelica.Blocks.Math.Add3 V_erro(
    k3=1,
    k1=1,
    k2=1) annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K,
    T=T_E,
    y_start=Efd0,
    outMax=E_MAX,
    outMin=E_MIN)
    annotation (Placement(transformation(extent={{120,-10},{140,10}})));
  Modelica.Blocks.Math.Add DiffV1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,-50})));
  NonElectrical.Continuous.LeadLag leadLag(
    K=1,
    T1=T_AT_B*T_B,
    T2=T_B,
    y_start=0,
    x_start=0) annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=EFD_MAX, uMin=EFD_MIN)
    annotation (Placement(transformation(extent={{160,-10},{180,10}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction(
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=Efd0/K,
    b={K_C*T_C,K_C},
    a={T_C,0}) annotation (Placement(transformation(extent={{58,-10},{78,10}})));
initial equation
  V_REF = ECOMP0;
equation
  connect(DiffV1.u1, VUEL) annotation (Line(points={{-106,-62},{-106,-80},{-130,
          -80},{-130,-200}}, color={0,0,127}));
  connect(DiffV1.u2, VOEL) annotation (Line(points={{-94,-62},{-94,-80},{-70,-80},
          {-70,-200}}, color={0,0,127}));
  connect(DiffV1.y, V_erro.u3) annotation (Line(points={{-100,-39},{-100,-20},{
          -52,-20},{-52,-8},{-42,-8}}, color={0,0,127}));
  connect(DiffV.y, V_erro.u2)
    annotation (Line(points={{-99,0},{-42,0}}, color={0,0,127}));
  connect(V_erro.u1, VOTHSG) annotation (Line(points={{-42,8},{-52,8},{-52,90},
          {-200,90}}, color={0,0,127}));
  connect(ECOMP, DiffV.u2) annotation (Line(points={{-200,0},{-166,0},{-132,0},
          {-132,-6},{-122,-6}}, color={0,0,127}));
  connect(leadLag.u, V_erro.y)
    annotation (Line(points={{8,0},{0,0},{-19,0}}, color={0,0,127}));
  connect(simpleLagLim.y, limiter.u)
    annotation (Line(points={{141,0},{149.5,0},{158,0}}, color={0,0,127}));
  connect(limiter.y, EFD)
    annotation (Line(points={{181,0},{210,0}}, color={0,0,127}));
  connect(leadLag.y, transferFunction.u)
    annotation (Line(points={{31,0},{56,0}}, color={0,0,127}));
  connect(transferFunction.y, simpleLagLim.u)
    annotation (Line(points={{79,0},{98.5,0},{118,0}}, color={0,0,127}));
  annotation (
    Icon(
        graphics={Text(
          extent={{-100,160},{100,100}},
          lineColor={28,108,200},
          textString="ExcSEXS")}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>CGMES 2.5</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2016-11-06</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Francisco Gómez, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end ExcSEXS;
