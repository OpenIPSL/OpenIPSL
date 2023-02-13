within OpenIPSL.Electrical.Controls.PSSE.ES;
model SCRX "SCRX - Bus Fed or Solid Fed Static Exciter (AC4A from [IEEE1992] / AC4C from [IEEE2016])"
  extends Icons.VerifiedModel;
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  parameter Real T_AT_B=0.1 "Ratio between regulator numerator (lead) and denominator (lag) time constants";
  parameter Types.Time T_B=1 "Regulator denominator (lag) time constant";
  parameter Types.PerUnit K=100 "Excitation power source output gain";
  parameter Types.Time T_E=0.005 "Excitation power source output time constant";
  parameter Types.PerUnit E_MIN=-10 "Minimum exciter output";
  parameter Types.PerUnit E_MAX=10 "Maximum exciter output";
  parameter Boolean C_SWITCH=false "Feeding selection. False for bus fed, and True for solid fed";
  parameter Real r_cr_fd=10 "Ratio between crowbar circuit resistance and field circuit resistance";
  Modelica.Blocks.Math.Add3 V_erro
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  OpenIPSL.NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    y_start=VR0/K,
    T1=T_AT_B*T_B,
    T2=T_B) annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  OpenIPSL.NonElectrical.Logical.NegCurLogic negCurLogic(nstartvalue=Efd0,
      RC_rfd=r_cr_fd)
    annotation (Placement(transformation(extent={{150,-10},{180,10}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K,
    T=T_E,
    y_start=VR0,
    outMax=E_MAX,
    outMin=E_MIN)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{72,18},{84,30}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant(k=C_SWITCH)
    annotation (Placement(transformation(extent={{40,46},{52,58}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{42,14},{54,26}})));
  Modelica.Blocks.Math.Add DiffV1(k2=-1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,-150})));
protected
  parameter Types.PerUnit VR0(fixed=false);
initial equation
  if not C_SWITCH then
    VR0 = Efd0/ECOMP0;
    V_REF = VR0/K + ECOMP0;
  else
    VR0 = Efd0;
    V_REF = VR0/K + ECOMP0;
  end if;
equation
  connect(V_erro.y, imLeadLag.u)
    annotation (Line(points={{-39,0},{-39,0},{-22,0}}, color={0,0,127}));
  connect(imLeadLag.y, simpleLagLim.u)
    annotation (Line(points={{1,0},{8,0}}, color={0,0,127}));
  connect(booleanConstant.y, switch1.u2) annotation (Line(points={{52.6,52},{66,
          52},{66,24},{70.8,24}}, color={255,0,255}));
  connect(product.u2, simpleLagLim.y) annotation (Line(points={{40.8,16.4},{36,
          16.4},{36,0},{31,0}}, color={0,0,127}));
  connect(product.y, switch1.u3) annotation (Line(points={{54.6,20},{70.8,20},{
          70.8,19.2}}, color={0,0,127}));
  connect(switch1.u1, simpleLagLim.y) annotation (Line(points={{70.8,28.8},{62,
          28.8},{62,0},{31,0}}, color={0,0,127}));
  connect(ECOMP, DiffV.u2) annotation (Line(points={{-200,0},{-132,0},{-132,-6},
          {-122,-6}}, color={0,0,127}));
  connect(DiffV.y, V_erro.u2)
    annotation (Line(points={{-99,0},{-62,0}}, color={0,0,127}));
  connect(VOTHSG, V_erro.u1) annotation (Line(points={{-200,90},{-140,90},{-80,
          90},{-80,8},{-62,8}}, color={0,0,127}));
  connect(DiffV1.u2, VOEL) annotation (Line(points={{-94,-162},{-94,-170},{-70,
          -170},{-70,-200}}, color={0,0,127}));
  connect(DiffV1.u1, VUEL) annotation (Line(points={{-106,-162},{-106,-170},{-130,
          -170},{-130,-200}}, color={0,0,127}));
  connect(DiffV1.y, V_erro.u3) annotation (Line(points={{-100,-139},{-100,-139},
          {-100,-20},{-80,-20},{-80,-8},{-62,-8}}, color={0,0,127}));
  connect(negCurLogic.Efd, EFD)
    annotation (Line(points={{182.5,0},{210,0},{210,0}}, color={0,0,127}));
  connect(product.u1, DiffV.u2) annotation (Line(points={{40.8,23.6},{-160,23.6},
          {-160,0},{-132,0},{-132,-6},{-122,-6}}, color={0,0,127}));
  connect(switch1.y, negCurLogic.Vd) annotation (Line(points={{84.6,24},{120,24},
          {120,5},{147.5,5}}, color={0,0,127}));
  connect(XADIFD, negCurLogic.XadIfd) annotation (Line(points={{80,-200},{80,-5},{147.5,-5}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-200,-200},{200,160}})),
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
                               Text(
          extent={{-100,160},{100,100}},
          lineColor={28,108,200},
          textString="SCRX")}),
    Documentation(info="<html>Bus Fed or Solid Fed Static Excitation System Model.</html>",
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
<td><p>Mengjia Zhang, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end SCRX;
