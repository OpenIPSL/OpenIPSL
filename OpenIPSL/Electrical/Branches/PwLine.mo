within OpenIPSL.Electrical.Branches;
model PwLine "Model for a transmission Line based on the pi-equivalent circuit"
  outer OpenIPSL.Electrical.SystemBase SysData;
  import Modelica.ComplexMath.conj;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.j;
  OpenIPSL.Interfaces.PwPin_p p annotation (Placement(transformation(extent={{-100,
            -10},{-80,10}}), iconTransformation(extent={{-100,-10},{-80,10}})));
  OpenIPSL.Interfaces.PwPin_n n annotation (Placement(transformation(extent={{80,
            -10},{100,10}}), iconTransformation(extent={{80,-10},{100,10}})));
  parameter Types.PerUnit R "Resistance"
    annotation (Dialog(group="Line parameters"));
  parameter Types.PerUnit X "Reactance"
    annotation (Dialog(group="Line parameters"));
  parameter Types.PerUnit G "Shunt half conductance"
    annotation (Dialog(group="Line parameters"));
  parameter Types.PerUnit B "Shunt half susceptance"
    annotation (Dialog(group="Line parameters"));
  parameter Types.ApparentPower S_b=SysData.S_b
    "System base power"
    annotation (Dialog(group="Line parameters", enable=false));
  parameter Types.Time t1=Modelica.Constants.inf
    annotation (Dialog(group="Perturbation parameters"));
  parameter Types.Time t2=Modelica.Constants.inf
    annotation (Dialog(group="Perturbation parameters"));
  parameter Integer opening=1 annotation (Dialog(group=
          "Perturbation parameters"), choices(
      choice=1 "Line opening at both ends",
      choice=2 "Line opening at sending end",
      choice=3 "Line opening at receiving end"));
  parameter Boolean displayPF=false "Display power flow results:" annotation (
      Dialog(
      group="Visualisation",
      __Dymola_compact=true,
      __Dymola_descriptionLabel=true), choices(checkBox=true));
  Types.ActivePower P12;
  Types.ActivePower P21;
  Types.ReactivePower Q12;
  Types.ReactivePower Q21;
  Complex vs(re=p.vr, im=p.vi);
  Complex is(re=p.ir, im=p.ii);
  Complex vr(re=n.vr, im=n.vi);
  Complex ir(re=n.ir, im=n.ii);
protected
  parameter Complex Y(re=G, im=B);
  parameter Complex Z(re=R, im=X);
equation
  //Calculations for the power flow display
  P12 = real(vs*conj(is))*S_b;
  P21 = -real(vr*conj(ir))*S_b;
  Q12 = imag(vs*conj(is))*S_b;
  Q21 = -imag(vr*conj(ir))*S_b;
  //PI model with different line openings
  if time >= t1 and time < t2 then
    if opening == 1 then
      is = Complex(0);
      ir = Complex(0);
    elseif opening == 2 then
      is = Complex(0);
      ir = (vr - ir*Z)*Y;
    else
      ir = Complex(0);
      is = (vs - is*Z)*Y;
    end if;
  else
    vs - vr = Z*(is - vs*Y);
    vr - vs = Z*(ir - vr*Y);
  end if;
  annotation (Icon(coordinateSystem(preserveAspectRatio=true),
        graphics={Rectangle(
          extent={{-80,40},{80,-40}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Rectangle(
          extent={{-60,20},{60,-20}},
          lineColor={0,0,255},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),Text(
          visible=displayPF,
          extent={{-200,160},{-20,40}},
          lineColor={255,0,0},
          textString=DynamicSelect("0.0 MW",
            OpenIPSL.NonElectrical.Functions.displayPower(P12, " MW"))),Polygon(
          visible=displayPF,
          points=DynamicSelect({{-120,70},{-120,50},{-80,60},{-120,70}}, if P12
             >= 0 then {{-120,70},{-120,50},{-80,60},{-120,70}} else {{-80,70},
            {-80,50},{-120,60},{-80,70}}),
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),Text(
          visible=displayPF,
          extent={{20,160},{200,40}},
          lineColor={255,0,0},
          textString=DynamicSelect("0.0 MW",
            OpenIPSL.NonElectrical.Functions.displayPower(P21, " MW"))),Polygon(
          visible=displayPF,
          points=DynamicSelect({{80,70},{80,50},{120,60},{80,70}}, if P21 >= 0
             then {{80,70},{80,50},{120,60},{80,70}} else {{120,70},{120,50},{
            80,60},{120,70}}),
          lineColor={255,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid),Text(
          visible=displayPF,
          extent={{-200,-40},{-20,-160}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0 Mvar",
            OpenIPSL.NonElectrical.Functions.displayPower(Q12, " Mvar"))),
          Polygon(
          visible=displayPF,
          points=DynamicSelect({{-120,-70},{-120,-50},{-80,-60},{-120,-70}},
            if Q12 >= 0 then {{-120,-70},{-120,-50},{-80,-60},{-120,-70}} else
            {{-80,-70},{-80,-50},{-120,-60},{-80,-70}}),
          lineColor={0,255,0},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid),Text(
          visible=displayPF,
          extent={{20,-40},{200,-160}},
          lineColor={0,255,0},
          textString=DynamicSelect("0.0 Mvar",
            OpenIPSL.NonElectrical.Functions.displayPower(Q21, " Mvar"))),
          Polygon(
          visible=displayPF,
          points=DynamicSelect({{80,-70},{80,-50},{120,-60},{80,-70}}, if Q21
             >= 0 then {{80,-70},{80,-50},{120,-60},{80,-70}} else {{120,-70},{
            120,-50},{80,-60},{120,-70}}),
          lineColor={0,255,0},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid),Text(
          extent={{-60,20},{60,-20}},
          lineColor={255,255,0},
          textString="%name")}));
end PwLine;
