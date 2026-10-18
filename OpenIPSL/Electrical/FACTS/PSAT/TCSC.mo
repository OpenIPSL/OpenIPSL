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

  parameter Types.Angle alpha0=initialFiringAngle(
      b0=xTCSC0/X/(X*(1 - xTCSC0/X)),
      xL=xL,
      xC=xC,
      tol=alphaTol) "Initial firing angle: by default the angle at which the TCSC has the susceptance of the compensation xTCSC0, found as PSAT's TCclass/setx0.m finds it"
   annotation (Dialog(enable=ctrl == Ctrl.alpha, group="Initialization"));
  parameter Types.PerUnit xTCSC0=0 "Initial series compensation reactance (both models: the firing angle model starts at the angle that gives its susceptance)"
   annotation (Dialog(group="Initialization"));
  parameter Real alphaTol=1e-5 "Tolerance on the susceptance in the search for the initial firing angle (PSAT's power flow tolerance, Settings.lftol)"
   annotation (Dialog(enable=ctrl == Ctrl.alpha, group="Initialization"));

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

  function susceptance "Susceptance of the firing angle model and its derivative, PSAT's TCclass/balpha.m"
    extends Modelica.Icons.Function;
    input Real alpha "Firing angle";
    input Types.PerUnit xL "Reactance (inductive)";
    input Types.PerUnit xC "Reactance (capacitive)";
    output Real b "Susceptance at alpha (balpha.m, type 1)";
    output Real db "Derivative of the susceptance with respect to alpha (balpha.m, type 2)";
  protected
    Real kx1=sqrt(xC/xL);
    Real kx2=kx1*kx1;
    Real kx3=kx2*kx1;
    Real kx4=kx3*kx1;
    Real ckf;
    Real skf;
    Real ck2;
    Real c2a=cos(2*alpha);
    Real s2a=sin(2*alpha);
    Real caf=cos(alpha);
    Real saf=sin(alpha);
    Real ca2=caf*caf;
  algorithm
    ckf := cos(kx1*(C.pi - alpha));
    skf := sin(kx1*(C.pi - alpha));
    b := C.pi*(kx4 - 2*kx2 + 1)*ckf/(xC*((C.pi*kx4 - C.pi - 2*kx4*alpha + 2*alpha*kx2 - kx4*s2a + kx2*s2a - 4*kx2*caf*saf)*ckf - 4*kx3*caf*caf*skf));
    ckf := cos(kx1*(-C.pi + alpha));
    skf := sin(kx1*(-C.pi + alpha));
    ck2 := ckf*ckf;
    db := 2*C.pi*(-kx4 + 2*kx2 - 1)*(2*skf*skf*kx1*kx3*ca2 - ck2*kx4 + ck2*kx2 - ck2*kx4*c2a + ck2*kx2*c2a + 2*ck2*kx2*saf*saf - 2*ck2*kx2*ca2 - 4*ckf*kx3*caf*skf*saf + 2*kx3*ca2*ck2*kx1)/xC/(ckf*C.pi*kx4 - ckf*C.pi - 2*ckf*kx4*alpha + 2*ckf*alpha*kx2 - ckf*kx4*s2a + ckf*kx2*s2a - 4*ckf*kx2*caf*saf + 4*kx3*ca2*skf)^2;
    annotation (Documentation(info="<html>
<p>The susceptance of PSAT's firing angle TCSC model and its derivative, written as PSAT 2.1.11 writes them in
<code>@TCclass/balpha.m</code> (types 1 and 2).</p>
</html>"));
  end susceptance;

  function initialFiringAngle "Firing angle at which the TCSC has a given susceptance, found as PSAT's TCclass/setx0.m finds it"
    extends Modelica.Icons.Function;
    input Real b0 "Susceptance to reach";
    input Types.PerUnit xL "Reactance (inductive)";
    input Types.PerUnit xC "Reactance (capacitive)";
    input Real tol=1e-5 "Tolerance on the susceptance";
    output Real alpha "Firing angle";
  protected
    Real a;
    Real bk;
    Real dbk;
    Real b1;
    Real best=Modelica.Constants.inf;
    Integer iter=0;
  algorithm
    alpha := -C.pi/2;
    for i in 0:integer(floor(C.pi/0.025)) loop
      a := -C.pi/2 + 0.025*i;
      (bk, dbk) := susceptance(a, xL, xC);
      if abs(bk - b0) < best then
        best := abs(bk - b0);
        alpha := a;
        b1 := bk;
      end if;
    end for;
    while abs(b1 - b0) > tol loop
      if iter > 20 then
        break;
      end if;
      (b1, dbk) := susceptance(alpha, xL, xC);
      alpha := alpha - (b1 - b0)/dbk;
      iter := iter + 1;
    end while;
    assert(iter <= 20, "TCSC: the search for the initial firing angle did not converge in 20 Newton steps (PSAT warns the same)", AssertionLevel.warning);
    annotation (Documentation(info="<html>
<p>The search of PSAT 2.1.11's <code>@TCclass/setx0.m</code>, step by step, so that the model starts at the angle PSAT
starts at: the angle of a grid from -&pi;/2 in steps of 0.025 rad whose susceptance is closest to <code>b0</code>, then
Newton steps while the susceptance last computed differs from <code>b0</code> by more than <code>tol</code>, at most 21.
The susceptance has poles between the limits of the grid, so another search could find another angle.</p>
</html>"));
  end initialFiringAngle;
equation
  vk = sqrt(p.vr^2 + p.vi^2) "Voltage magnitude of sending bus";
  vm = sqrt(n.vr^2 + n.vi^2) "Voltage magnitude of receiving bus";
  pkm = p.vr*p.ir + p.vi*p.ii "Transferred active power from k to m";

  x1 = X1.y;
  b = if alphaCtrl then
      C.pi*(kx^4 - 2*kx^2 + 1)*cos(kx*(C.pi - x1))/
      (xC*(C.pi*kx^4*cos(kx*(C.pi - x1))
      - C.pi*cos(kx*(C.pi - x1))
      - 2*kx^4*x1*cos(kx*(C.pi - x1))
      + 2*x1*kx^2*cos(kx*(C.pi - x1))
      - kx^4*sin(2*x1)*cos(kx*(C.pi - x1))
      + kx^2*sin(2*x1)*cos(kx*(C.pi - x1))
      - 4*kx^3*cos(x1)^2*sin(kx*(C.pi - x1))
      - 4*kx^2*cos(x1)*sin(x1)*cos(kx*(C.pi - x1))))
      else
      x1/X/(X*(1 - x1/X))
    "Series susceptance the TCSC adds to the line: with the reactance x1 it is y^2*x1/(1 - y*x1), so that y + b = 1/(X - x1), as PSAT's TCclass/btcsc.m";

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
          textColor={0,0,255},
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
