within OpenIPSL.Electrical.Controls.PSSE.ES;
model SEXS "SEXS - Simplified excitation system model (AC4 from [IEEE1981])"
  extends Icons.VerifiedModel;
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  parameter Real T_AT_B=0.1 "Ratio between regulator numerator (lead) and denominator (lag) time constants";
  parameter Real T_B=1 "Regulator denominator (lag) time constant";
  parameter Real K=100 "Excitation power source output gain";
  parameter Real T_E=0.1 "Excitation power source output time constant";
  parameter Real E_MIN=-10 "Minimum exciter output";
  parameter Real E_MAX=10 "Maximum exciter output";
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
    y_start=Efd0/K,
    x_start=Efd0/K)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
initial equation
  V_REF = Efd0/K + ECOMP0;
equation
  connect(simpleLagLim.y, EFD)
    annotation (Line(points={{141,0},{210,0}}, color={0,0,127}));
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
  connect(leadLag.y, simpleLagLim.u)
    annotation (Line(points={{61,0},{118,0}}, color={0,0,127}));
  connect(leadLag.u, V_erro.y)
    annotation (Line(points={{38,0},{-19,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-200,-200},{200,160}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}),
        graphics={Text(
          extent={{-100,160},{100,100}},
          textColor={28,108,200},
          textString="SEXS")}),
    Documentation(info="<html>Simplified Excitation System Model.</html>",
    revisions = "<html><table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSS/E Manual</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-09</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Mengjia Zhang, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end SEXS;
