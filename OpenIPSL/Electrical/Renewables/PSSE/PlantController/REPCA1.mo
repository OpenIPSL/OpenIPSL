within OpenIPSL.Electrical.Renewables.PSSE.PlantController;
model REPCA1 "Renewable energy plant controller model A"

  parameter Modelica.Units.SI.Time Tfltr=0.02 "Voltage or reactive power measurement filter time constant";
  parameter Real Kp=18 "Reactive power PI control proportional gain";
  parameter Real Ki=5 "Reactive power PI control integral gain";
  parameter Modelica.Units.SI.Time Tft=0 "Lead time constant";
  parameter Modelica.Units.SI.Time Tfv=0.075 "Lag time constant";
  parameter OpenIPSL.Types.PerUnit Vfrz=0 "Voltage below which State s2 is frozen";
  parameter OpenIPSL.Types.PerUnit Rc=0.0025 "Line drop compensation resistance";
  parameter OpenIPSL.Types.PerUnit Xc=0.0025 "Line drop compensation reactance";
  parameter Real Kc=0.02 "Reactive current compensation gain";
  parameter OpenIPSL.Types.PerUnit emax=0.1 "Upper limit on deadband output";
  parameter OpenIPSL.Types.PerUnit emin=-0.1 "Lower limit on deadband output";
  parameter OpenIPSL.Types.PerUnit dbd1=0 "Lower threshold for reactive power control deadband (<=0)";
  parameter OpenIPSL.Types.PerUnit dbd2=0 "Upper threshold for reactive power control deadband (>=0)";
  parameter OpenIPSL.Types.PerUnit Qmax=0.4360 "Upper limit on output of V/Q control";
  parameter OpenIPSL.Types.PerUnit Qmin=-0.4360 "Lower limit on output of V/Q control";
  parameter Real Kpg=0.1 "Proportional gain for power control";
  parameter Real Kig=0.05 "Proportional gain for power control";
  parameter Modelica.Units.SI.Time Tp=0.25 "Real power measurement filter time constant";
  parameter OpenIPSL.Types.PerUnit fdbd1=0 "Deadband for frequency control, lower threshold (<=0)";
  parameter OpenIPSL.Types.PerUnit fdbd2=0 "Deadband for frequency control, upper threshold (>=0)";
  parameter OpenIPSL.Types.PerUnit femax=999 "Frequency error upper limit";
  parameter OpenIPSL.Types.PerUnit femin=-999 "Frequency error lower limit";
  parameter OpenIPSL.Types.PerUnit Pmax=999 "Upper limit on power reference";
  parameter OpenIPSL.Types.PerUnit Pmin=-999 "Lower limit on power reference";
  parameter Modelica.Units.SI.Time Tg=0.1 "Power Controller lag time constant";
  parameter OpenIPSL.Types.PerUnit Ddn=20 "Reciprocal of droop for over-frequency conditions";
  parameter OpenIPSL.Types.PerUnit Dup=0 "Reciprocal of droop for under-frequency conditions";
  parameter Real Vref=v_0 "Regulated bus initial voltage";

  extends BaseClasses.BaseREPC(Qext, Pref);

  OpenIPSL.Types.PerUnit voltage_diff;
  OpenIPSL.Types.PerUnit vreg;
  OpenIPSL.Types.PerUnit qbranch;
  OpenIPSL.Types.PerUnit pbranch;
  Boolean Voltage_dip;

  Modelica.Blocks.Math.Add add(k1=-1)
    annotation (Placement(transformation(extent={{-188,-154},{-168,-134}})));
  Modelica.Blocks.Math.Gain DDN(k=Ddn)
    annotation (Placement(transformation(extent={{-128,-134},{-108,-114}})));
  Modelica.Blocks.Math.Gain DUP(k=Dup)
    annotation (Placement(transformation(extent={{-128,-170},{-108,-150}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax=0, uMin=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-98,-134},{-78,-114}})));
  Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=Modelica.Constants.inf, uMin=0)
    annotation (Placement(transformation(extent={{-98,-170},{-78,-150}})));
  Modelica.Blocks.Math.Add add1(k1=+1)
    annotation (Placement(transformation(extent={{-68,-154},{-48,-134}})));
  Modelica.Blocks.Math.Add3 add3_1(k2=-1)
    annotation (Placement(transformation(extent={{-36,-146},{-16,-126}})));
  NonElectrical.Continuous.SimpleLag simpleLag(
    K=1,
    T=Tp,
    y_start=p00)
    annotation (Placement(transformation(extent={{-128,-106},{-108,-86}})));
  Modelica.Blocks.Nonlinear.Limiter limiter2(uMax=femax, uMin=femin)
    annotation (Placement(transformation(extent={{-4,-146},{16,-126}})));
  Modelica.Blocks.Math.Gain KPG(k=Kpg)
    annotation (Placement(transformation(extent={{24,-130},{44,-110}})));
  Modelica.Blocks.Continuous.Integrator KIG(k=Kig, y_start=p00)
    annotation (Placement(transformation(extent={{24,-162},{44,-142}})));
  Modelica.Blocks.Math.Add add2(k1=+1)
    annotation (Placement(transformation(extent={{54,-146},{74,-126}})));
  Modelica.Blocks.Nonlinear.Limiter limiter3(uMax=Pmax, uMin=Pmin)
    annotation (Placement(transformation(extent={{82,-146},{102,-126}})));
  NonElectrical.Continuous.SimpleLag simpleLag1(
    K=1,
    T=Tg,
    y_start=p00)
    annotation (Placement(transformation(extent={{118,-128},{138,-108}})));
  Modelica.Blocks.Logical.Switch FREQ_FLAG
    annotation (Placement(transformation(extent={{154,-136},{174,-116}})));
  Modelica.Blocks.Sources.BooleanConstant FREQ_FLAG_logic(k=fflag)
    annotation (Placement(transformation(extent={{82,-178},{102,-158}})));
  Modelica.Blocks.Sources.RealExpression Vreg(y=vreg)
    annotation (Placement(transformation(extent={{-180,74},{-160,94}})));
  Modelica.Blocks.Sources.RealExpression Qbranch(y=qbranch)
    annotation (Placement(transformation(extent={{-182,50},{-162,70}})));
  Modelica.Blocks.Sources.RealExpression Pbranch(y=pbranch)
    annotation (Placement(transformation(extent={{-162,-106},{-142,-86}})));
  Modelica.Blocks.Sources.RealExpression Voltage_diff(y=voltage_diff)
    annotation (Placement(transformation(extent={{-180,150},{-160,170}})));
  Modelica.Blocks.Logical.Switch VCFLAG
    annotation (Placement(transformation(extent={{-128,110},{-108,130}})));
  Modelica.Blocks.Math.Add add3(k1=+1)
    annotation (Placement(transformation(extent={{-120,60},{-100,80}})));
  Modelica.Blocks.Math.Gain KC(k=Kc)
    annotation (Placement(transformation(extent={{-150,50},{-130,70}})));
  Modelica.Blocks.Sources.BooleanConstant VCFLAG_logic(k=vcflag)
    annotation (Placement(transformation(extent={{-180,126},{-160,146}})));
  NonElectrical.Continuous.SimpleLag simpleLag2(
    K=1,
    T=Tfltr,
    y_start=q00)
    annotation (Placement(transformation(extent={{-144,12},{-124,32}})));
  Modelica.Blocks.Math.Add add4(k1=-1)
    annotation (Placement(transformation(extent={{-110,6},{-90,26}})));
  Modelica.Blocks.Logical.Switch REFFLAG
    annotation (Placement(transformation(extent={{-36,80},{-16,100}})));
  Modelica.Blocks.Sources.BooleanConstant REFFLAG_logic(k=refflag)
    annotation (Placement(transformation(extent={{-82,80},{-62,100}})));
  NonElectrical.Continuous.SimpleLag simpleLag3(
    K=1,
    T=Tfltr,
    y_start=Vref)
    annotation (Placement(transformation(extent={{-100,110},{-80,130}})));
  Modelica.Blocks.Math.Add add5(k1=+1, k2=-1)
    annotation (Placement(transformation(extent={{-70,116},{-50,136}})));
  Modelica.Blocks.Nonlinear.Limiter limiter4(uMax=emax, uMin=emin)
    annotation (Placement(transformation(extent={{24,80},{44,100}})));
  Modelica.Blocks.Sources.Constant VREF(k=Vref)
    annotation (Placement(transformation(extent={{-100,146},{-80,166}})));
  NonElectrical.Continuous.LeadLag leadLag(
    K=1,
    T1=Tft,
    T2=Tfv,
    y_start=q00,
    x_start=0)
    annotation (Placement(transformation(extent={{128,80},{148,100}})));
  Modelica.Blocks.Nonlinear.DeadZone deadZone(uMax=dbd2, uMin=dbd1)
    annotation (Placement(transformation(extent={{-8,80},{12,100}})));
  Modelica.Blocks.Nonlinear.DeadZone deadZone1(uMax=fdbd2, uMin=fdbd1)
    annotation (Placement(transformation(extent={{-158,-154},{-138,-134}})));

  ElectricalController.BaseClasses.PIwithNoVariableLimiter
    pI_No_Windup_notVariable(
    K_P=Kp,
    K_I=Ki,
    V_RMAX=Qmax,
    V_RMIN=Qmin,
    y_start=q00)
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
  Modelica.Blocks.Sources.BooleanExpression VLogic(y=Voltage_dip)
    annotation (Placement(transformation(extent={{20,120},{40,140}})));
protected
  parameter OpenIPSL.Types.PerUnit V0(fixed=false);
  parameter OpenIPSL.Types.PerUnit p00(fixed=false);
  parameter OpenIPSL.Types.PerUnit q00(fixed=false);
  parameter OpenIPSL.Types.PerUnit Vref0 = if Vref == 0 then V0 else Vref;

initial equation

  p00 = p0;
  q00 = q0;
  v0 = V0;

equation

  Voltage_dip = if vreg < Vfrz then true else false;
  voltage_diff = sqrt((regulate_vr - Rc*branch_ir/CoB + Xc*branch_ii/CoB)^2 + (regulate_vi - Xc*branch_ir/CoB - Rc*branch_ii/CoB)^2);
  vreg = sqrt(regulate_vr^2 + regulate_vi^2);
  qbranch = (1/CoB)*(regulate_vi*branch_ir - regulate_vr*branch_ii);
  pbranch = (1/CoB)*(regulate_vr*branch_ir + regulate_vi*branch_ii);

  connect(DDN.y,limiter. u)
    annotation (Line(points={{-107,-124},{-100,-124}},
                                               color={0,0,127}));
  connect(DUP.y,limiter1. u)
    annotation (Line(points={{-107,-160},{-100,-160}},
                                               color={0,0,127}));
  connect(limiter.y,add1. u1)
    annotation (Line(points={{-77,-124},{-70,-124},{-70,-138}},
                                                          color={0,0,127}));
  connect(limiter1.y,add1. u2)
    annotation (Line(points={{-77,-160},{-70,-160},{-70,-150}},
                                                          color={0,0,127}));
  connect(add1.y,add3_1. u3) annotation (Line(points={{-47,-144},{-38,-144}},
                                            color={0,0,127}));
  connect(simpleLag.y,add3_1. u2)
    annotation (Line(points={{-107,-96},{-44,-96},{-44,-136},{-38,-136}},
                                                  color={0,0,127}));
  connect(Plant_pref,add3_1. u1) annotation (Line(points={{-220,40},{-194,40},
          {-194,-20},{-38,-20},{-38,-128}}, color={0,0,127}));
  connect(add3_1.y,limiter2. u)
    annotation (Line(points={{-15,-136},{-6,-136}},
                                                 color={0,0,127}));
  connect(limiter2.y,KIG. u) annotation (Line(points={{17,-136},{18,-136},{18,-152},
          {22,-152}}, color={0,0,127}));
  connect(KPG.u,limiter2. y) annotation (Line(points={{22,-120},{18,-120},{18,-136},
          {17,-136}}, color={0,0,127}));
  connect(KIG.y,add2. u2) annotation (Line(points={{45,-152},{52,-152},{52,-142}},
                 color={0,0,127}));
  connect(KPG.y,add2. u1) annotation (Line(points={{45,-120},{52,-120},{52,-130}},
                     color={0,0,127}));
  connect(add2.y,limiter3. u)
    annotation (Line(points={{75,-136},{80,-136}}, color={0,0,127}));
  connect(limiter3.y,simpleLag1. u)
    annotation (Line(points={{103,-136},{108,-136},{108,-118},{116,-118}},
                                                   color={0,0,127}));
  connect(simpleLag1.y,FREQ_FLAG. u1)
    annotation (Line(points={{139,-118},{152,-118}},
                                                   color={0,0,127}));
  connect(FREQ_FLAG_logic.y,FREQ_FLAG. u2) annotation (Line(points={{103,-168},{
          114,-168},{114,-142},{142,-142},{142,-126},{152,-126}},
                                          color={255,0,255}));
  connect(FREQ_FLAG.y,Pref) annotation (Line(points={{175,-126},{198,-126},{198,
          -100},{210,-100}},
                      color={0,0,127}));
  connect(Pbranch.y,simpleLag. u)
    annotation (Line(points={{-141,-96},{-130,-96}},
                                                   color={0,0,127}));
  connect(Vreg.y,add3. u1) annotation (Line(points={{-159,84},{-142,84},{-142,76},
          {-122,76}},
                 color={0,0,127}));
  connect(Qbranch.y,KC. u)
    annotation (Line(points={{-161,60},{-152,60}}, color={0,0,127}));
  connect(KC.y,add3. u2)
    annotation (Line(points={{-129,60},{-126,60},{-126,64},{-122,64}},
                                                color={0,0,127}));
  connect(simpleLag2.u,KC. u) annotation (Line(points={{-146,22},{-156,22},{-156,
          60},{-152,60}},
                      color={0,0,127}));
  connect(simpleLag2.y,add4. u1)
    annotation (Line(points={{-123,22},{-112,22}}, color={0,0,127}));
  connect(add4.y,REFFLAG. u3)
    annotation (Line(points={{-89,16},{-60,16},{-60,72},{-42,72},{-42,82},{-38,82}},
                                                         color={0,0,127}));
  connect(REFFLAG_logic.y,REFFLAG. u2)
    annotation (Line(points={{-61,90},{-38,90}},color={255,0,255}));
  connect(VCFLAG.y,simpleLag3. u)
    annotation (Line(points={{-107,120},{-102,120}},
                                                 color={0,0,127}));
  connect(simpleLag3.y,add5. u2)
    annotation (Line(points={{-79,120},{-72,120}}, color={0,0,127}));
  connect(VREF.y,add5. u1)
    annotation (Line(points={{-79,156},{-72,156},{-72,132}}, color={0,0,127}));
  connect(add4.u2, Qref) annotation (Line(points={{-112,10},{-186,10},{-186,120},
          {-220,120}},
                 color={0,0,127}));
  connect(REFFLAG.y,deadZone. u)
    annotation (Line(points={{-15,90},{-10,90}}, color={0,0,127}));
  connect(add.y,deadZone1. u)
    annotation (Line(points={{-167,-144},{-160,-144}},
                                                   color={0,0,127}));
  connect(deadZone1.y,DDN. u) annotation (Line(points={{-137,-144},{-130,-144},{
          -130,-124}},
                     color={0,0,127}));
  connect(DUP.u,DDN. u)
    annotation (Line(points={{-130,-160},{-130,-124}},
                                                    color={0,0,127}));
  connect(Freq_ref, add.u2) annotation (Line(points={{-220,-120},{-198,-120},{-198,-150},{-190,-150}},
                                                      color={0,0,127}));
  connect(Freq, add.u1) annotation (Line(points={{-220,-40},{-194,-40},{-194,-138},{-190,-138}},
                        color={0,0,127}));
  connect(leadLag.y, Qext)
    annotation (Line(points={{149,90},{194,90},{194,100},{210,100}},
                                                   color={0,0,127}));
  connect(Voltage_diff.y, VCFLAG.u1) annotation (Line(points={{-159,160},{-136,160},
          {-136,128},{-130,128}}, color={0,0,127}));
  connect(VCFLAG_logic.y, VCFLAG.u2) annotation (Line(points={{-159,136},{-146,136},
          {-146,120},{-130,120}}, color={255,0,255}));
  connect(add3.y, VCFLAG.u3) annotation (Line(points={{-99,70},{-92,70},{-92,100},
          {-140,100},{-140,112},{-130,112}}, color={0,0,127}));
  connect(add5.y, REFFLAG.u1) annotation (Line(points={{-49,126},{-44,126},{-44,
          98},{-38,98}}, color={0,0,127}));
  connect(p0, FREQ_FLAG.u3) annotation (Line(points={{-120,-220},{-120,-188},{148,-188},{148,-134},{152,-134}},
                                        color={0,0,127}));
  connect(deadZone.y, limiter4.u)
    annotation (Line(points={{13,90},{22,90}}, color={0,0,127}));
  connect(limiter4.y, pI_No_Windup_notVariable.u)
    annotation (Line(points={{45,90},{70,90},{70,84},{78,84}},
                                               color={0,0,127}));
  connect(pI_No_Windup_notVariable.y, leadLag.u)
    annotation (Line(points={{101,90},{126,90}},color={0,0,127}));
  connect(VLogic.y, pI_No_Windup_notVariable.voltage_dip) annotation (Line(
        points={{41,130},{68,130},{68,96},{78,96}}, color={255,0,255}));
  annotation (Documentation(info="<html>
<p>
The REPCA1 module is used to represent the renewable energy plant controller. It takes as input voltage and
reactive power to then generate volt/var control at the plant level. It also generates
frequency and active power output to emulate active power control. TThe REPCA1 module
provides active reactive power command references to the electrical controller components (REECA1, REECB1, and REECCU1).
</p>
<p>The modelling of such devices is based, mainly, on the following reference:</p>
<ul>
<li>Siemens: \"PSS&reg;E Model Library\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a>,</li>
</ul>
</html>"));
end REPCA1;
