within OpenIPSL.Electrical.Controls.PSSE.ES;
model ESAC1A "AC1A Excitation System [IEEE2005]"
  import OpenIPSL.NonElectrical.Functions.SE;
  import OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.invFEX;
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  extends Icons.VerifiedModel;
  parameter Types.Time T_R=0 "Regulator input filter time constant";
  parameter Types.Time T_B=0 "Regulator denominator (lag) time constant";
  parameter Types.Time T_C=0 "Regulator numerator (lead) time constant";
  parameter Types.PerUnit K_A=400 "Regulator output gain";
  parameter Types.Time T_A=0.02 "Regulator output time constant";
  parameter Types.PerUnit V_AMAX=9 "Maximum regulator output";
  parameter Types.PerUnit V_AMIN=-5.43 "Minimum regulator output";
  parameter Types.Time T_E=0.8 "Exciter field time constant";
  parameter Types.PerUnit K_F=0.03 "Rate feedback excitation system gain";
  parameter Types.Time T_F=1 "Rate feedback time const";
  parameter Types.PerUnit K_C=0.2 "Rectifier loading factor proportional to commutating reactance";
  parameter Types.PerUnit K_D=0.48 "Demagnetizing factor, function of exciter alternator reactances";
  parameter Types.PerUnit K_E=1 "Exciter field proportional constant";
  parameter Types.PerUnit E_1=5.25 "Exciter output voltage for saturation factor S_E(E_1)";
  parameter Types.PerUnit E_2=7 "Exciter output voltage for saturation factor S_E(E_2)";
  parameter Types.PerUnit S_EE_1=0.03 "Exciter saturation factor at exciter output voltage E1";
  parameter Types.PerUnit S_EE_2=0.1 "Exciter saturation factor at exciter output voltage E2";
  parameter Types.PerUnit V_RMAX=6.03 "Maximum exciter field output";
  parameter Types.PerUnit V_RMIN=-5.43 "Minimum exciter field output";
  NonElectrical.Logical.HV_GATE hV_GATE
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  NonElectrical.Logical.LV_GATE lV_GATE
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  NonElectrical.Continuous.LeadLag imLeadLag(
    K=1,
    T1=T_C,
    T2=T_B,
    y_start=VR0/K_A,
    x_start=VR0/K_A)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  NonElectrical.Continuous.SimpleLag imSimpleLag(
    K=1,
    y_start=ECOMP0,
    T=T_R) annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=V_RMAX, uMin=V_RMIN)
    annotation (Placement(transformation(extent={{94,-10},{114,10}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K_A,
    T=T_A,
    y_start=VR0,
    outMax=V_AMAX,
    outMin=V_AMIN)
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Continuous.Derivative derivative(
    k=K_F,
    T=T_F,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=0,
    x_start=VFE0)
    annotation (Placement(transformation(extent={{40,-50},{20,-30}})));
  BaseClasses.RotatingExciterWithDemagnetizationLimited
    rotatingExciterWithDemagnetization(
    T_E=T_E,
    K_E=K_E,
    E_1=E_1,
    E_2=E_2,
    S_EE_1=S_EE_1,
    S_EE_2=S_EE_2,
    K_D=K_D,
    Efd0=VE0) annotation (Placement(transformation(extent={{130,-10},{150,10}})));
  Modelica.Blocks.Math.Add3 add3_1(k3=-1)
    annotation (Placement(transformation(extent={{-86,-10},{-66,10}})));
  BaseClasses.RectifierCommutationVoltageDrop rectifierCommutationVoltageDrop(
      K_C=K_C)
    annotation (Placement(transformation(extent={{160,-10},{180,10}})));
protected
  parameter Real VR0(fixed=false);
  parameter Real Efd0(fixed=false);
  parameter Real Ifd0(fixed=false);
  parameter Real VE0(fixed=false);
  parameter Real VFE0(fixed=false);
initial equation
  Ifd0 = XADIFD;
  VE0 = invFEX(
    K_C=K_C,
    Efd0=Efd0,
    Ifd0=Ifd0);
  VFE0 = VE0*(SE(
    VE0,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2) + K_E) + Ifd0*K_D;
  VR0 = VFE0;
  V_REF = VR0/K_A + ECOMP0;
equation
  connect(imLeadLag.y, simpleLagLim.u)
    annotation (Line(points={{-29,0},{-22,0}}, color={0,0,127}));
  connect(limiter1.y, rotatingExciterWithDemagnetization.I_C)
    annotation (Line(points={{115,0},{128.75,0}}, color={0,0,127}));
  connect(ECOMP, imSimpleLag.u)
    annotation (Line(points={{-200,0},{-172,0}}, color={0,0,127}));
  connect(simpleLagLim.y,hV_GATE.u1) annotation (Line(points={{1,0},{10,0},{10,6},{18,6}},
                             color={0,0,127}));
  connect(VUEL,hV_GATE.u2) annotation (Line(points={{-130,-200},{-130,-80},{10,-80},{10,-6},{18,-6}},
                                   color={0,0,127}));
  connect(imSimpleLag.y, DiffV.u2) annotation (Line(points={{-149,0},{-140,0},{-140,-6},{-122,-6}},
                               color={0,0,127}));
  connect(add3_1.y, imLeadLag.u)
    annotation (Line(points={{-65,0},{-52,0}}, color={0,0,127}));
  connect(DiffV.y, add3_1.u2) annotation (Line(points={{-99,0},{-88,0}},
                     color={0,0,127}));
  connect(VOTHSG, add3_1.u1) annotation (Line(points={{-200,90},{-96,90},{-96,8},{-88,8}},
                                  color={0,0,127}));
  connect(derivative.y, add3_1.u3) annotation (Line(points={{19,-40},{-94,-40},{-94,-8},{-88,-8}},
                         color={0,0,127}));
  connect(derivative.u, rotatingExciterWithDemagnetization.V_FE) annotation (
      Line(points={{42,-40},{120,-40},{120,-6.25},{128.75,-6.25}}, color={0,
          0,127}));
  connect(rotatingExciterWithDemagnetization.EFD,
    rectifierCommutationVoltageDrop.V_EX)
    annotation (Line(points={{151.25,0},{159,0}}, color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.EFD, EFD) annotation (Line(points={{181,0},{210,0}},
                                             color={0,0,127}));
  connect(lV_GATE.y, limiter1.u)
    annotation (Line(points={{81,0},{92,0}}, color={0,0,127}));
  connect(XADIFD, rotatingExciterWithDemagnetization.XADIFD) annotation (Line(points={{80,-200},{80,-160},{140,-160},{140,-11.25}},color={0,0,127}));
  connect(XADIFD, rectifierCommutationVoltageDrop.XADIFD) annotation (Line(points={{80,-200},{80,-160},{170,-160},{170,-11}},color={0,0,127}));
  connect(VOEL, lV_GATE.u2) annotation (Line(points={{-70,-200},{-70,-100},{50,-100},{50,-6},{58,-6}}, color={0,0,127}));
  connect(lV_GATE.u1, hV_GATE.y) annotation (Line(points={{58,6},{50,6},{50,0},{41,0}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-200,-200},{200,160}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}),
        graphics={ Text(
          extent={{-100,160},{100,100}},
          lineColor={28,108,200},
          textString="ESAC1A")}),
    Documentation(info="<html>IEEE Type AC1A Excitation System Model.</html>",
  revisions="<html><table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Manual</p></td>
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
end ESAC1A;
