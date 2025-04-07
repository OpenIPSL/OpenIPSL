within OpenIPSL.Electrical.Controls.PSSE.ES;
model ESST2A "ST2A Excitation System [IEEE2005]"
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  import Modelica.ComplexMath.j;
  import 'abs' =
         Modelica.ComplexMath.abs;
  parameter OpenIPSL.Types.Time T_R=0.01 "Regulator input filter time constant";
  parameter OpenIPSL.Types.PerUnit V_RMAX=4.5 "Maximum regulator output";
  parameter OpenIPSL.Types.PerUnit V_RMIN=-4.5 "Minimum regulator output";
  parameter OpenIPSL.Types.PerUnit K_A=240 "Voltage regulator gain";
  parameter OpenIPSL.Types.Time T_A=0.01 "Voltage regulator time constant";
  parameter OpenIPSL.Types.PerUnit K_P=0.7
    "Potential circuit (voltage) gain coefficient";
  parameter OpenIPSL.Types.PerUnit K_I=1
    "Compound circuit (current) gain coefficient";
  parameter OpenIPSL.Types.PerUnit K_C=0.03
    "Rectifier loading factor proportional to commutating reactance";
  parameter OpenIPSL.Types.PerUnit K_F=0.05 "Rate feedback gain";
  parameter OpenIPSL.Types.Time T_F=0.7 "Rate feedback time constant";
  parameter Real K_E=1 "Excitation power source output gain";
  parameter Real T_E=0.5 "Excitation power source output time constant";
  parameter OpenIPSL.Types.PerUnit EFD_MAX=5 "Maximum exciter output";
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{54,-16},{74,4}})));
  OpenIPSL.Interfaces.PwPin Gen_terminal annotation (Placement(transformation(
          extent={{-180,120},{-160,140}}), iconTransformation(extent={{-100,70},{-80,90}})));
  OpenIPSL.Interfaces.PwPin Bus annotation (Placement(transformation(extent={{180,120},{200,140}}),
                                  iconTransformation(extent={{80,70},{100,90}})));
  Modelica.Blocks.Math.Add3 add3_1(k3=-1)
    annotation (Placement(transformation(extent={{-60,-8},{-40,12}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag TransducerDelay(
    K=1,
    T=T_R,
    y_start=ECOMP0)
    annotation (Placement(transformation(extent={{-170,-10},{-150,10}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.RectifierCommutationVoltageDrop
    rectifierCommutationVoltageDrop(K_C=K_C)
    annotation (Placement(transformation(extent={{-48,-142},{-28,-122}})));
  Modelica.Blocks.Continuous.Derivative imDerivativeLag(
    y_start=0,
    k=K_F,
    T=T_F,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    x_start=0)
    annotation (Placement(transformation(extent={{62,-62},{42,-42}})));
  OpenIPSL.NonElectrical.Logical.HV_GATE hV_GATE
    annotation (Placement(transformation(extent={{-20.7,-5.5},{2,6}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K_A,
    T=T_A,
    y_start=VA0,
    outMax=V_RMAX,
    outMin=V_RMIN)
    annotation (Placement(transformation(extent={{16,-10},{36,10}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{88,4},{108,-16}})));
  Modelica.Blocks.Math.Gain gain(k=K_E) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={136,60})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{-108,36},{-88,56}})));
  Modelica.Blocks.Sources.Constant vB_default(k=1)
    annotation (Placement(transformation(extent={{-54,-80},{-34,-60}})));
  Modelica.Blocks.Sources.BooleanConstant
                                  booleanConstant(k=bypass_vb)
    annotation (Placement(transformation(extent={{-80,-109},{-58,-86}})));
  Modelica.Blocks.Logical.Switch swith_vb
    annotation (Placement(transformation(extent={{-2,-107},{18,-88}})));
  OpenIPSL.NonElectrical.Continuous.IntegratorLimVar integratorLimVar(K=1/T_E,
      y_start=Efd0)
    annotation (Placement(transformation(extent={{128,-16},{148,4}})));
  Modelica.Blocks.Sources.Constant MaxOutput(k=EFD_MAX)
    annotation (Placement(transformation(extent={{108,18},{128,38}})));
  Modelica.Blocks.Sources.Constant MinOutput(k=0)
    annotation (Placement(transformation(extent={{92,-42},{112,-22}})));
protected
  Modelica.Blocks.Interfaces.RealOutput VE
    annotation (Placement(transformation(extent={{-76,-142},{-56,-122}})));
  Complex V_T;
  Complex I_T;
  parameter Real Ifd0(fixed=false);
  parameter Real IN0(fixed=false);
  parameter Real VB0(fixed=false);
  parameter Real VA0(fixed=false);
  parameter Real VE0(fixed=false);
  parameter Boolean bypass_vb(fixed=false);
initial equation
  Ifd0 = XADIFD;
  VE0 = VE;
  IN0 = K_C*Ifd0/VE0;
  if K_P == 0 and K_I == 0 then
    bypass_vb = true;
    VB0 = 1;
  else
    bypass_vb = false;
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
  end if;
//   VA0 = if abs(VB0) < Modelica.Constants.eps then 0 else Efd0*(K_E)/(VB0);
  VA0 = Efd0*(K_E)/(VB0);
  V_REF = ECOMP0 + VA0/K_A;

equation
  if K_P == 0 and K_I == 0 then
    VE = 1;
  else
    VE = 'abs'(K_P*V_T + j*K_I*I_T);
  end if;
  V_T = Gen_terminal.vr + j*Gen_terminal.vi;
  I_T = Gen_terminal.ir + j*Gen_terminal.ii;
  connect(ECOMP, TransducerDelay.u)
    annotation (Line(points={{-200,0},{-172,0},{-172,0}}, color={0,0,127}));
  connect(TransducerDelay.y, DiffV.u2) annotation (Line(points={{-149,0},{-132,
          0},{-132,-6},{-122,-6}}, color={0,0,127}));
  connect(DiffV.y, add3_1.u2)
    annotation (Line(points={{-99,0},{-96,0},{-96,2},{-62,2}},
                                                       color={0,0,127}));
  connect(VE, rectifierCommutationVoltageDrop.V_EX)
    annotation (Line(points={{-66,-132},{-49,-132}},
                                                   color={0,0,127}));
  connect(Gen_terminal, Bus) annotation (Line(points={{-170,130},{190,130}},
                 color={0,0,255}));
  connect(XADIFD, rectifierCommutationVoltageDrop.XADIFD) annotation (Line(points={{80,-200},
          {80,-160},{-38,-160},{-38,-143}},                                                                                  color={0,0,127}));
  connect(imDerivativeLag.y, add3_1.u3) annotation (Line(points={{41,-52},{-76,-52},
          {-76,-6},{-62,-6}},      color={0,0,127}));
  connect(simpleLagLim.y, product.u1)
    annotation (Line(points={{37,0},{52,0}}, color={0,0,127}));
  connect(feedback.u1, product.y)
    annotation (Line(points={{90,-6},{75,-6}}, color={0,0,127}));
  connect(gain.y, feedback.u2)
    annotation (Line(points={{125,60},{98,60},{98,2}},     color={0,0,127}));
  connect(gain.u, EFD) annotation (Line(points={{148,60},{188,60},{188,0},{
          210,0}}, color={0,0,127}));
  connect(imDerivativeLag.u, EFD) annotation (Line(points={{64,-52},{180,-52},{180,
          0},{210,0}},                          color={0,0,127}));
  connect(VOTHSG, add1.u1) annotation (Line(points={{-200,90},{-120,90},{-120,52},
          {-110,52},{-110,52}}, color={0,0,127}));
  connect(VOEL, add1.u2) annotation (Line(points={{-70,-200},{-70,-160},{-100,-160},
          {-100,-32},{-90,-32},{-90,24},{-120,24},{-120,40},{-110,40}}, color={0,
          0,127}));
  connect(add1.y, add3_1.u1) annotation (Line(points={{-87,46},{-74,46},{-74,10},
          {-62,10}}, color={0,0,127}));
  connect(booleanConstant.y, swith_vb.u2)
    annotation (Line(points={{-56.9,-97.5},{-4,-97.5}}, color={255,0,255}));
  connect(swith_vb.y, product.u2) annotation (Line(points={{19,-97.5},{34,-97.5},
          {34,-22},{44,-22},{44,-12},{52,-12}}, color={0,0,127}));
  connect(feedback.y, integratorLimVar.u)
    annotation (Line(points={{107,-6},{126,-6}}, color={0,0,127}));
  connect(integratorLimVar.y, EFD) annotation (Line(points={{149,-6},{162,-6},
          {162,0},{210,0}}, color={0,0,127}));
  connect(MaxOutput.y, integratorLimVar.outMax)
    annotation (Line(points={{129,28},{146,28},{146,8}}, color={0,0,127}));
  connect(MinOutput.y, integratorLimVar.outMin) annotation (Line(points={{113,
          -32},{130,-32},{130,-20}}, color={0,0,127}));
  connect(add3_1.y, hV_GATE.u1) annotation (Line(points={{-39,2},{-39,3.7},{-22.97,
          3.7}}, color={0,0,127}));
  connect(VUEL, hV_GATE.u2) annotation (Line(points={{-130,-200},{-130,-26},{-30,
          -26},{-30,-3.2},{-22.97,-3.2}}, color={0,0,127}));
  connect(hV_GATE.y, simpleLagLim.u) annotation (Line(points={{3.135,0.25},{8.5675,
          0.25},{8.5675,0},{14,0}}, color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.EFD, swith_vb.u3) annotation (Line(
        points={{-27,-132},{-12,-132},{-12,-105.1},{-4,-105.1}}, color={0,0,127}));
  connect(vB_default.y, swith_vb.u1)
    annotation (Line(points={{-33,-70},{-4,-70},{-4,-89.9}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-180,-180},{200,140}}),
        graphics={Text(
          extent={{4,-32},{28,-46}},
          lineColor={255,0,0},
          textString="VB"),
                  Text(
          extent={{42,56},{66,42}},
          lineColor={255,0,0},
          textString="VR"),
                  Text(
          extent={{-74,48},{-50,34}},
          lineColor={255,0,0},
          textString="VS")}),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}),
        graphics={Text(
          extent={{-80,90},{-20,70}},
          lineColor={0,0,255},
          textString="GenT"),  Text(
          extent={{-100,160},{100,100}},
          lineColor={28,108,200},
          textString="ESST2A"),
                  Text(
          extent={{40,90},{80,70}},
          lineColor={0,0,255},
          textString="Bus")}),
    Documentation(info="<html>
<p>IEEE Type ST2A Excitation System Model.</p>
</html>",
  revisions="<html><table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS&reg;E Manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2022-12</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>ALSETLab, Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end ESST2A;
