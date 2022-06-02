within OpenIPSL.Electrical.Controls.PSSE.ES;
model EXAC1 "AC1 Excitation System [IEEE1981]"
  extends Icons.VerifiedModel;
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  import OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.invFEX;
  import OpenIPSL.NonElectrical.Functions.SE;
  OpenIPSL.NonElectrical.Continuous.SimpleLagLim imLimitedSimpleLag(
    K=K_A,
    T=T_A,
    outMin=V_RMIN,
    outMax=V_RMAX,
    y_start=VR0)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  parameter Types.Time T_R=0 "Regulator input filter time constant";
  parameter Types.Time T_B=0 "Regulator denominator (lag) time constant";
  parameter Types.Time T_C=0 "Regulator numerator (lead) time constant";
  parameter Types.PerUnit K_A=400 "Regulator output gain";
  parameter Types.Time T_A=0.02 "Regulator output time constant";
  parameter Types.PerUnit V_RMAX=9 "Maximum regulator output";
  parameter Types.PerUnit V_RMIN=-5.43 "Minimum regulator output";
  parameter Types.Time T_E=0.8 "Exciter field time constant";
  parameter Types.PerUnit K_F=0.03 "Rate feedback excitation system stabilizer gain";
  parameter Types.Time T_F=1 "Rate feedback time constant";
  parameter Types.PerUnit K_C=0.2 "Rectifier loading factor proportional to commutating reactance";
  parameter Types.PerUnit K_D=0.48 "Demagnetizing factor, function of exciter alternator reactances";
  parameter Types.PerUnit K_E=1 "Exciter field proportional constant";
  parameter Types.PerUnit E_1=5.25 "Exciter output voltage for saturation factor S_E(E_1)";
  parameter Types.PerUnit E_2=7 "Exciter output voltage for saturation factor S_E(E_2)";
  parameter Types.PerUnit S_EE_1=0.03 "Exciter saturation factor at exciter output voltage E1";
  parameter Types.PerUnit S_EE_2=0.1 "Exciter saturation factor at exciter output voltage E2";
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    k=K_F,
    T=T_F,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    x_start=VFE0)
    annotation (Placement(transformation(extent={{20,-60},{0,-40}})));
  NonElectrical.Continuous.LeadLag leadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    y_start=VR0/K_A,
    x_start=VR0/K_A)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Math.Add3 add3_1(k3=-1)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  BaseClasses.RectifierCommutationVoltageDrop rectifierCommutationVoltageDrop(
      K_C=K_C)
    annotation (Placement(transformation(extent={{140,-10},{160,10}})));
  BaseClasses.RotatingExciterWithDemagnetizationLimited
    rotatingExciterWithDemagnetizationLimited(
    T_E=T_E,
    K_E=K_E,
    E_1=E_1,
    E_2=E_2,
    S_EE_1=S_EE_1,
    S_EE_2=S_EE_2,
    K_D=K_D,
    Efd0=VE0)
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  NonElectrical.Continuous.SimpleLag TransducerDelay(
    K=1,
    T=T_R,
    y_start=ECOMP0)
    annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
  Modelica.Blocks.Math.Add3 add3_2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-100,-90})));
protected
  parameter Real VR0(fixed=false);
  parameter Real Ifd0(fixed=false);
  parameter Real VE0(fixed=false);
  parameter Real VFE0(fixed=false);
initial equation
  Ifd0 = XADIFD;
  // Finding initial value of excitation voltage, VE0, via going through conditions of FEX function
  VE0 = invFEX(
    K_C=K_C,
    Efd0=Efd0,
    Ifd0=Ifd0);
  // Case IN>0 not checked because it will be resolved in the next iteration
  VFE0 = VE0*(SE(
    VE0,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2) + K_E) + Ifd0*K_D;
  VR0 = VFE0;
  V_REF = VR0/K_A + ECOMP0;
equation
  connect(leadLag.y, imLimitedSimpleLag.u)
    annotation (Line(points={{21,0},{58,0}}, color={0,0,127}));
  connect(add3_1.y, leadLag.u)
    annotation (Line(points={{-39,0},{-22,0},{-2,0}}, color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.XADIFD, XADIFD)
    annotation (Line(points={{150,-11},{150,-106},{150,-200},{80,-200}},
                                                   color={0,0,127}));
  connect(rotatingExciterWithDemagnetizationLimited.EFD,
    rectifierCommutationVoltageDrop.V_EX)
    annotation (Line(points={{121.25,0},{139,0}}, color={0,0,127}));
  connect(imLimitedSimpleLag.y, rotatingExciterWithDemagnetizationLimited.I_C)
    annotation (Line(points={{81,0},{98.75,0}}, color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.EFD, EFD)
    annotation (Line(points={{161,0},{210,0}}, color={0,0,127}));
  connect(rotatingExciterWithDemagnetizationLimited.XADIFD, XADIFD) annotation (
     Line(points={{110,-11.25},{112,-11.25},{112,-36},{80,-36},{80,-200}},
        color={0,0,127}));
  connect(imDerivativeLag.u, rotatingExciterWithDemagnetizationLimited.V_FE)
    annotation (Line(points={{22,-50},{56,-50},{90,-50},{90,-6.25},{98.75,-6.25}},
        color={0,0,127}));
  connect(DiffV.y, add3_1.u2)
    annotation (Line(points={{-99,0},{-80,0},{-62,0}}, color={0,0,127}));
  connect(ECOMP, TransducerDelay.u)
    annotation (Line(points={{-200,0},{-172,0}}, color={0,0,127}));
  connect(TransducerDelay.y, DiffV.u2) annotation (Line(points={{-149,0},{-132,
          0},{-132,-6},{-122,-6}}, color={0,0,127}));
  connect(VOEL, add3_2.u3) annotation (Line(points={{-70,-200},{-70,-114},{-92,
          -114},{-92,-102}}, color={0,0,127}));
  connect(VUEL, add3_2.u2) annotation (Line(points={{-130,-200},{-130,-114},{-100,
          -114},{-100,-102}}, color={0,0,127}));
  connect(VOTHSG, add3_2.u1) annotation (Line(points={{-200,90},{-178,90},{-178,
          -110},{-108,-110},{-108,-102}}, color={0,0,127}));
  connect(add3_2.y, add3_1.u1) annotation (Line(points={{-100,-79},{-98,-79},{-98,
          -20},{-90,-20},{-90,8},{-62,8}}, color={0,0,127}));
  connect(imDerivativeLag.y, add3_1.u3) annotation (Line(points={{-1,-50},{-26,
          -50},{-70,-50},{-70,-8},{-62,-8}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-200,-200},{200,160}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}),
        graphics={ Text(
          extent={{-100,160},{100,100}},
          lineColor={28,108,200},
          textString="EXAC1")}),
    Documentation(info="<html>IEEE Type AC1 Excitation System Model.</html>",
    revisions="<html><table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS&reg;E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-09</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a></p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end EXAC1;
