within OpenIPSL.Electrical.FACTS.PSAT;
model TCSC "Thyristor Controlled Series Compensator"
  extends Essentials.pfComponent(
    final enabledisplayPF=false,
    final enableangle_0=false,
    final enablev_0=false,
    final enableQ_0=false,
    final enableP_0=false,
    final enablefn=false,
    final enableV_b=true,
    final enableS_b=true);
  import OpenIPSL.Types.Ctrl;
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(extent={{-120,-10},{-100,10}}), iconTransformation(extent={{-119,-10},{-99,10}})));
  OpenIPSL.Interfaces.PwPin n annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));

  parameter Types.PerUnit pref=0.080101913348342 "Reference power"
   annotation (Dialog(group="Power flow data"));
  parameter Types.ApparentPower Sn = S_b "Power rating"
   annotation (Dialog(group="Device parameters"));
  parameter Types.Voltage Vn = V_b "Voltage rating"
   annotation (Dialog(group="Device parameters"));
  parameter Ctrl ctrl=Ctrl.alpha "Type of control of the TCSC"
   annotation (Dialog(group="Device parameters"));
  parameter Types.Angle alpha_min=0.7 "Minimum firing angle"
   annotation (Dialog(enable=ctrl == Ctrl.alpha, group="Device parameters"));
  parameter Types.Angle alpha_max=0.85 " Maximum firing angle"
   annotation (Dialog(enable=ctrl == Ctrl.alpha, group="Device parameters"));
  parameter Types.PerUnit xTCSC_min=-0.05 "Minimum reactance"
   annotation (Dialog(enable=ctrl <> Ctrl.alpha, group="Device parameters"));
  parameter Types.PerUnit xTCSC_max=0.05 "Maximum reactance"
   annotation (Dialog(enable=ctrl <> Ctrl.alpha, group="Device parameters"));

  // parameter Real Cp=0.10 "Percentage of series compensation [%] (only for power flow calculation)";
  parameter Types.Time Tr=0.5 "Regulator time constant"
   annotation (Dialog(group="Device parameters"));
  parameter Real Kp=5 "Proportional gain of PI controller [pu/pu]"
  annotation (Dialog(group="Device parameters"));
  parameter Real Ki=1 "Integral gain of PI controller [pu/pu]"
   annotation (Dialog(group="Device parameters"));
  parameter Real Kr=10 "Gain of stabilizing signal [pu/pu]"
   annotation (Dialog(group="Device parameters"));
  parameter Types.PerUnit x_L=0.2 "Reactance (inductive)"
   annotation (Dialog(group="Device parameters"));
  parameter Types.PerUnit x_C=0.1 "Reactance (capacitive)"
   annotation (Dialog(group="Device parameters"));
  parameter Types.PerUnit XL=0.1 "Line reactance"
   annotation (Dialog(group="Device parameters"));
  parameter Types.PerUnit G=0 "Shunt half conductance"
  annotation (Dialog(group="Device parameters"));
  parameter Types.PerUnit B=0 "Shunt half susceptance"
  annotation (Dialog(group="Device parameters"));

  parameter Types.Angle alpha0=0.8 "Initial firing angle"
   annotation (Dialog(enable=ctrl == Ctrl.alpha, group="Initialization"));
  parameter Types.PerUnit xTCSC0=0 "Initial reactance"
   annotation (Dialog(enable=ctrl <> Ctrl.alpha, group="Initialization"));

  Types.PerUnit vk "Bus voltage of bus k";
  Types.PerUnit vm "Bus voltage of bus m";
  Types.PerUnit pkm(start=pref) "Active power flow from bus k to m (pu)";
  Types.PerUnit b "TCSC series susceptance";
  Real x1 "State representing alpha or xTCSC";

  Modelica.Blocks.Math.Feedback powerDiff annotation (Placement(transformation(extent={{-50,-50},{-30,-30}})));
  Modelica.Blocks.Continuous.TransferFunction PIcontroller(b={Kp,Ki}, a={1,0},
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=-x10) annotation (Placement(transformation(extent={{-20,-50},{0,-30}})));
  Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Blocks.Math.Gain stabilizer(k=Kr) annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  NonElectrical.Continuous.SimpleLagLim X1(
    K=1,
    T=Tr,
    y_start=x10,
    outMax=x1_max,
    outMin=x1_min) annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Sources.RealExpression Pref(y=pref) annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
  Modelica.Blocks.Sources.RealExpression Pkm(y=pkm) annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));

  Modelica.Blocks.Interfaces.RealInput Vs_pod annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,120})));
protected
  parameter Boolean alphaCtrl=ctrl == Ctrl.alpha annotation (Evaluate=true);
  parameter Types.PerUnit xL=x_L*(Vn^2/Sn)*(S_b/V_b^2) "Reactance (inductive)";
  parameter Types.PerUnit xC=x_C*(Vn^2/Sn)*(S_b/V_b^2) "Reactance (capacitive)";
  parameter Types.PerUnit X=XL*(Vn^2/Sn)*(S_b/V_b^2) "Line Reactance";
  parameter Types.PerUnit y=1/X "Line admittance";
  parameter Real kx=sqrt(xC/xL);
  // parameter Types.PerUnit XL2=(1 - Cp)*XL "Simplified line reactance for power flow calculation";
  parameter Real x1_min=if alphaCtrl then alpha_min else xTCSC_min annotation (Evaluate=true);
  parameter Real x1_max=if alphaCtrl then alpha_max else xTCSC_max annotation (Evaluate=true);
  parameter Real x10=if alphaCtrl then alpha0 else xTCSC0 annotation (Evaluate=true);
equation
  vk = sqrt(p.vr^2 + p.vi^2) "Voltage magnitude of sending bus";
  vm = sqrt(n.vr^2 + n.vi^2) "Voltage magnitude of receiving bus";
  pkm = p.vr*p.ir + p.vi*p.ii "Transferred active power from k to m";

  x1 = X1.y;
  b = if alphaCtrl then
      C.pi*(kx^4 - 2*kx^2 + 1)*cos(kx*(C.pi - x1))/
      (xC*(C.pi*kx^4*cos(kx*(C.pi - x1)))
      - C.pi*cos(kx*(C.pi - x1))
      - 2*kx^4*x1*cos(kx*(C.pi - x1))
      + 2*x1*kx^2*cos(kx*(C.pi - x1))
      - kx^4*sin(2*x1)*cos(kx*(C.pi - x1))
      + kx^2*sin(2*x1)*cos(kx*(C.pi - x1))
      - 4*kx^3*cos(x1)^2*sin(kx*(C.pi - x1))
      - 4*kx^2*cos(x1)*sin(x1)*cos(kx*(C.pi - x1)))
      else
      -x1/X/(X*(1 - x1/X));

  n.ii - B*n.vr - G*n.vi = (y + b)*(p.vr - n.vr);
  n.ir - G*n.vr + B*n.vi = (y + b)*(n.vi - p.vi);
  p.ii - B*p.vr - G*p.vi = (y + b)*(n.vr - p.vr);
  p.ir - G*p.vr + B*p.vi = (y + b)*(p.vi - n.vi);
  connect(PIcontroller.y, feedback.u2) annotation (Line(points={{1,-40},{20,-40},{20,-8}}, color={0,0,127}));
  connect(powerDiff.y, PIcontroller.u) annotation (Line(points={{-31,-40},{-22,-40}}, color={0,0,127}));
  connect(Pkm.y, powerDiff.u1) annotation (Line(points={{-59,-40},{-48,-40}}, color={0,0,127}));
  connect(Pref.y, powerDiff.u2) annotation (Line(points={{-59,-60},{-40,-60},{-40,-48}}, color={0,0,127}));
  connect(feedback.y, X1.u) annotation (Line(points={{29,0},{38,0}}, color={0,0,127}));
  connect(stabilizer.y, feedback.u1) annotation (Line(points={{1,0},{12,0}}, color={0,0,127}));
  connect(Vs_pod, stabilizer.u) annotation (Line(points={{0,120},{0,40},{-40,40},
          {-40,0},{-22,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
        Line(
          points={{40,-60},{40,-64}},
          color={217,67,180}),
        Line(
          points={{42,-16},{42,-20}},
          color={217,67,180}),
        Polygon(
          points={{36,-16},{46,-20},{36,-24},{36,-24},{36,-16}},
          lineColor={217,67,180},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-7,4},{3,-4.89858e-16},{-7,-4},{-7,-4},{-7,4}},
          lineColor={217,67,180},
          origin={39,-60},
          rotation=180,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{46,-16},{46,-24}},
          color={217,67,180}),
        Line(
          points={{36,-56},{36,-64}},
          color={217,67,180}),
        Line(
          points={{4,40},{80,40},{80,-40},{60,-40}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-100,0},{-80,0}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{80,0},{100,0},{100,0}},
          color={0,0,255},
          smooth=Smooth.None),
        Text(
          extent={{-80,100},{80,60}},
          lineColor={0,0,255},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          textString="%name"),
        Line(
          points={{-80,-80},{-40,-80},{40,80},{80,80},{80,80}},
          color={0,140,72}),
        Line(points={{-4,54},{-4,26}}, color={0,0,255}),
        Line(points={{4,54},{4,26}}, color={0,0,255}),
        Rectangle(extent={{60,-20},{20,-60}}, lineColor={217,67,180}),
        Ellipse(
          extent={{-60,-50},{-40,-30}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.None,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Ellipse(
          extent={{-40,-50},{-20,-30}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.None,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Ellipse(
          extent={{-20,-50},{0,-30}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.None,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Line(points={{-4,40},{-60,40},{-80,40},{-80,-40},{-60,-40}}, color={0,0,255}),
        Line(points={{0,-40},{20,-40}}, color={0,0,255})}),
                                        Documentation(info="<html>
<p>
A TCSC Regulator according to
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[Milano2010], chapter 20.2</a>.
</p>
</html>", revisions="<html>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8 <a href=\"modelica://OpenIPSL.UsersGuide.References\">[Milano2013]</a></p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-11-04</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/dietmarw\">@dietmarw</a></p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end TCSC;
