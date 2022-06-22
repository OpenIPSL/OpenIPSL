within OpenIPSL.Electrical.Controls.PSSE.ES;
model ESST4B "ST4B Excitation System [IEEE2005]"
  extends Icons.VerifiedModel;
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  import Modelica.ComplexMath.j;
  import Modelica.ComplexMath.abs;
  parameter Types.Time T_R=0.3 "Regulator input filter time constant";
  parameter Types.PerUnit K_PR=2.97 "Voltage regulator proportional gain";
  parameter Types.TimeAging K_IR=2.97 "Voltage regulator integral gain";
  parameter Types.PerUnit V_RMAX=1 "Maximum regulator output";
  parameter Types.PerUnit V_RMIN=-0.87 "Minimum regulator output";
  parameter Types.Time T_A=0.01 "Thyristor bridge firing control equivalent time constant";
  parameter Types.PerUnit K_PM=1 "Forward proportional gain of inner loop field regulator";
  parameter Types.TimeAging K_IM=0.2 "Forward integral gain of inner loop field regulator";
  parameter Types.PerUnit V_MMAX=1 "Maximum output of field current regulator";
  parameter Types.PerUnit V_MMIN=-0.87 "Minimum output of field current regulator";
  parameter Types.PerUnit K_G=0.1 "Feedback gain of field current regulator";
  parameter Types.PerUnit K_P=6.73 "Potential circuit (voltage) gain coefficient";
  parameter Types.PerUnit K_I=0.1 "Compound circuit (current) gain coefficient";
  parameter Types.PerUnit V_BMAX=8.41 "Maximum available exciter voltage";
  parameter Types.PerUnit K_C=0.1 "Rectifier loading factor proportional to commutating reactance";
  parameter Types.PerUnit X_L=0 "Reactance associated with potential source";
  parameter Types.Angle THETAP=0 "Potential circuit phase angle";
  NonElectrical.Logical.LV_GATE lV_Gate
    annotation (Placement(transformation(extent={{120,-74},{140,-54}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{160,-80},{180,-60}})));
  NonElectrical.Continuous.SimpleLag VA(
    K=1,
    T=T_A,
    y_start=VR0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={52,0})));
  Modelica.Blocks.Continuous.LimIntegrator VR1(
    outMax=V_RMAX/K_PR,
    outMin=V_RMIN/K_PR,
    k=K_IR,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=VR0)
    annotation (Placement(transformation(extent={{-48,-30},{-28,-10}})));
  Modelica.Blocks.Math.Gain Gain1(k=K_PR)
    annotation (Placement(transformation(extent={{-48,10},{-28,30}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN)
    annotation (Placement(transformation(extent={{12,-10},{32,10}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-18,-10},{2,10}})));
  Modelica.Blocks.Math.Add add1(k1=-1)
    annotation (Placement(transformation(extent={{72,-10},{92,10}})));
  Modelica.Blocks.Math.Gain gain(k=K_G) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={112,60})));
  Modelica.Blocks.Continuous.LimIntegrator VM1(
    outMax=V_MMAX/K_PM,
    outMin=V_MMIN/K_PM,
    k=K_IM,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=VA0)
    annotation (Placement(transformation(extent={{102,-30},{122,-10}})));
  Modelica.Blocks.Math.Gain Gain2(k=K_PM)
    annotation (Placement(transformation(extent={{102,10},{122,30}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=V_MMAX, uMin=V_MMIN)
    annotation (Placement(transformation(extent={{162,-10},{182,10}})));
  Modelica.Blocks.Math.Add add2
    annotation (Placement(transformation(extent={{132,-10},{152,10}})));
  Modelica.Blocks.Nonlinear.Limiter maxLimiter(uMin=-Modelica.Constants.inf,
      uMax=V_BMAX)
    annotation (Placement(transformation(extent={{100,-120},{120,-100}})));
  OpenIPSL.Interfaces.PwPin Gen_terminal annotation (Placement(transformation(
          extent={{-180,120},{-160,140}}), iconTransformation(extent={{-100,70},{-80,90}})));
  OpenIPSL.Interfaces.PwPin Bus annotation (Placement(transformation(extent={{180,120},{200,140}}),
                                  iconTransformation(extent={{80,70},{100,90}})));
  Modelica.Blocks.Math.Add3 add3_1
    annotation (Placement(transformation(extent={{-86,-10},{-66,10}})));
  NonElectrical.Continuous.SimpleLag TransducerDelay(
    K=1,
    T=T_R,
    y_start=ECOMP0)
    annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
  BaseClasses.RectifierCommutationVoltageDrop rectifierCommutationVoltageDrop(
      K_C=K_C)
    annotation (Placement(transformation(extent={{40,-120},{60,-100}})));
protected
  Modelica.Blocks.Interfaces.RealOutput VE
    annotation (Placement(transformation(extent={{10,-120},{30,-100}})));
  Complex V_T;
  Complex I_T;
  parameter Complex K_P_comp=K_P*cos(THETAP) + j*K_P*sin(THETAP);
  parameter Real Ifd0(fixed=false);
  parameter Real IN0(fixed=false);
  parameter Real VB0(fixed=false);
  parameter Real VA0(fixed=false);
  parameter Real VR0(fixed=false);
  parameter Real VE0(fixed=false);
initial equation
  Ifd0 = XADIFD;
  VE0 = VE;
  IN0 = K_C*Ifd0/VE0;
  if IN0 <= 0 then
    VB0 = VE0*1;
  elseif IN0 > 0 and IN0 <= 0.433 then
    VB0 = VE0*(1 - 0.577*IN0);
  elseif IN0 > 0.433 and IN0 < 0.75 then
    VB0 = VE0*sqrt(0.75 - IN0^2);
  elseif IN0 >= 0.75 and IN0 <= 1 then
    VB0 = VE0*1.732*(1 - IN0);
  else
    VB0 = VE0*0;
  end if;
  VA0 = Efd0/VB0;
  VR0 = Efd0*K_G;
  V_REF = ECOMP;
equation
  VE = abs(K_P_comp*V_T + j*(K_I + K_P_comp*X_L)*I_T);
  V_T = Gen_terminal.vr + j*Gen_terminal.vi;
  I_T = Gen_terminal.ir + j*Gen_terminal.ii;
  connect(add.y, limiter.u) annotation (Line(
      points={{3,0},{10,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(maxLimiter.y, product.u2) annotation (Line(
      points={{121,-110},{148,-110},{148,-76},{158,-76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lV_Gate.y, product.u1) annotation (Line(
      points={{141,-64},{158,-64}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3_1.y, Gain1.u) annotation (Line(points={{-65,0},{-60,0},{-60,20},{-50,20}},
                     color={0,0,127}));
  connect(VR1.u, Gain1.u) annotation (Line(points={{-50,-20},{-60,-20},{-60,20},{-50,20}},
                     color={0,0,127}));
  connect(ECOMP, TransducerDelay.u)
    annotation (Line(points={{-200,0},{-172,0},{-172,0}}, color={0,0,127}));
  connect(TransducerDelay.y, DiffV.u2) annotation (Line(points={{-149,0},{-132,
          0},{-132,-6},{-122,-6}}, color={0,0,127}));
  connect(DiffV.y, add3_1.u2)
    annotation (Line(points={{-99,0},{-88,0}}, color={0,0,127}));
  connect(VOTHSG, add3_1.u1) annotation (Line(points={{-200,90},{-94,90},{-94,8},{-88,8}},
                    color={0,0,127}));
  connect(VUEL, add3_1.u3) annotation (Line(points={{-130,-200},{-130,-20},{-94,-20},{-94,-8},{-88,-8}},
                                   color={0,0,127}));
  connect(VR1.y, add.u2) annotation (Line(points={{-27,-20},{-24,-20},{-24,-6},{-20,-6}},
                     color={0,0,127}));
  connect(Gain1.y, add.u1) annotation (Line(points={{-27,20},{-24,20},{-24,6},{-20,6}},
                   color={0,0,127}));
  connect(limiter.y, VA.u)
    annotation (Line(points={{33,0},{40,0}}, color={0,0,127}));
  connect(VA.y, add1.u2)
    annotation (Line(points={{63,0},{66,0},{66,-6},{70,-6}}, color={0,0,127}));
  connect(add1.y, Gain2.u) annotation (Line(points={{93,0},{96,0},{96,20},{100,20}},
                    color={0,0,127}));
  connect(VM1.u, Gain2.u) annotation (Line(points={{100,-20},{96,-20},{96,20},{100,20}},
                     color={0,0,127}));
  connect(Gain2.y, add2.u1) annotation (Line(points={{123,20},{126,20},{126,6},{130,6}},
                    color={0,0,127}));
  connect(VM1.y, add2.u2) annotation (Line(points={{123,-20},{126,-20},{126,-6},{130,-6}},
                     color={0,0,127}));
  connect(add2.y, limiter1.u)
    annotation (Line(points={{153,0},{160,0}}, color={0,0,127}));
  connect(product.y, EFD) annotation (Line(points={{181,-70},{196,-70},{196,0},{210,0}},
                    color={0,0,127}));
  connect(lV_Gate.u2, VOEL) annotation (Line(points={{118,-70},{0,-70},{0,-160},{-70,-160},{-70,-200}},
                                  color={0,0,127}));
  connect(limiter1.y,lV_Gate.u1) annotation (Line(points={{183,0},{188,0},{188,-40},{112,-40},{112,-58},{118,-58}},
                                                 color={0,0,127}));
  connect(gain.u, EFD) annotation (Line(points={{124,60},{196,60},{196,0},{210,0}},
               color={0,0,127}));
  connect(gain.y, add1.u1) annotation (Line(points={{101,60},{66,60},{66,6},{70,6}},
               color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.EFD, maxLimiter.u)
    annotation (Line(points={{61,-110},{98,-110}}, color={0,0,127}));
  connect(VE, rectifierCommutationVoltageDrop.V_EX)
    annotation (Line(points={{20,-110},{39,-110}}, color={0,0,127}));
  connect(Gen_terminal, Bus) annotation (Line(points={{-170,130},{190,130}},
                 color={0,0,255}));
  connect(XADIFD, rectifierCommutationVoltageDrop.XADIFD) annotation (Line(points={{80,-200},{80,-150},{50,-150},{50,-121}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-180},{200,140}}),
        graphics={Text(
          extent={{210,-4},{234,-18}},
          lineColor={255,0,0},
          textString="VB")}),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}),
        graphics={Text(
          extent={{-80,90},{-20,70}},
          lineColor={0,0,255},
          textString="GenT"), Text(
          extent={{-100,160},{100,100}},
          lineColor={28,108,200},
          textString="ESST4B"),
                  Text(
          extent={{40,90},{80,70}},
          lineColor={0,0,255},
          textString="Bus")}),
    Documentation(info="<html>IEEE Type ST4B Potential or Compound-Source Controlled-Rectifier Exciter Model.</html>",
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
end ESST4B;
