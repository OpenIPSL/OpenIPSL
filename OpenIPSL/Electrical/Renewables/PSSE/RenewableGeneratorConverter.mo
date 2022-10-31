within OpenIPSL.Electrical.Renewables.PSSE;
package RenewableGeneratorConverter

  model REGC_A "Renewable energy generator/converter model A"
    extends BaseClasses.baseRenewableGenerator;
    Modelica.Blocks.Sources.RealExpression Vt(y=VT)
      annotation (Placement(transformation(extent={{-130,40},{-110,60}})));
    Modelica.Blocks.Math.Add add(k2=-1)
      annotation (Placement(transformation(extent={{-90,20},{-70,40}})));
    Modelica.Blocks.Sources.Constant Vo_limit(k=Volim)
      annotation (Placement(transformation(extent={{-130,14},{-110,34}})));
    Modelica.Blocks.Nonlinear.Limiter min_limiter(uMax=Modelica.Constants.inf,
        uMin=0) annotation (Placement(transformation(extent={{-30,20},{-10,40}})));
    Modelica.Blocks.Math.Add add1(k2=-1)
      annotation (Placement(transformation(extent={{78,78},{98,98}})));
    Modelica.Blocks.Nonlinear.Limiter IOLIM(uMax=Modelica.Constants.inf,
                                                      uMin=Iolim)
      annotation (Placement(transformation(extent={{112,78},{132,98}})));
    OpenIPSL.Electrical.Renewables.PSSE.RenewableGeneratorConverter.BaseClasses.LVACM
      LVACM(lvpnt0=lvpnt0, lvpnt1=lvpnt1)
      annotation (Placement(transformation(extent={{62,-80},{82,-60}})));
    OpenIPSL.NonElectrical.Continuous.SimpleLag simpleLag(
      K=1,
      T=Tfltr,
      y_start=v_0)
      annotation (Placement(transformation(extent={{44,-80},{24,-60}})));
    OpenIPSL.Electrical.Renewables.PSSE.RenewableGeneratorConverter.BaseClasses.LVPL
      LVPL(
      Brkpt=Brkpt,
      Lvpl1=Lvpl1,
      Zerox=Zerox)
      annotation (Placement(transformation(extent={{10,-80},{-10,-60}})));
    Modelica.Blocks.Math.Product IP
      annotation (Placement(transformation(extent={{100,-20},{120,0}})));
  public
    Modelica.Blocks.Math.Gain KHV(k=Khv)
      annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
    Modelica.Blocks.Logical.Switch switch1 annotation (Placement(
          transformation(
          extent={{10,-10},{-10,10}},
          rotation=0,
          origin={-80,-90})));
    Modelica.Blocks.Sources.BooleanConstant Lvplsw_logic(k=Lvplsw)
      annotation (Placement(transformation(extent={{-30,-100},{-50,-80}})));
    Modelica.Blocks.Nonlinear.Limiter limiter4(uMax=rrpwr, uMin=-Modelica.Constants.inf)
      annotation (Placement(transformation(extent={{-82,-40},{-62,-20}})));
    Modelica.Blocks.Math.Add add2(k2=-1)
      annotation (Placement(transformation(extent={{-110,-40},{-90,-20}})));
    Modelica.Blocks.Sources.RealExpression Terminal_Voltage1(y=Vt.y) annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=0,
          origin={34,-100})));
    Modelica.Blocks.Sources.RealExpression LowerLimit(y=-Modelica.Constants.inf)
      annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
    Modelica.Blocks.Math.Add add3(k2=-1)
      annotation (Placement(transformation(extent={{-86,64},{-66,84}})));
    Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=Iqrmax, uMin=Iqrmin)
      annotation (Placement(transformation(extent={{-58,64},{-38,84}})));
    Modelica.Blocks.Continuous.Integrator integrator(
      k=1/Tg,
      initType=Modelica.Blocks.Types.Init.InitialState,
      y_start=Iq0)
      annotation (Placement(transformation(extent={{-18,64},{2,84}})));
    Modelica.Blocks.Math.Gain gain(k=-1)
      annotation (Placement(transformation(extent={{-120,70},{-100,90}})));
    Modelica.Blocks.Sources.RealExpression Constant(y=Modelica.Constants.inf)
      annotation (Placement(transformation(extent={{-30,-124},{-50,-104}})));
    Modelica.Blocks.Continuous.Integrator integrator1(
      k=1/Tg,
      initType=Modelica.Blocks.Types.Init.InitialState,
      y_start=Ip0)
      annotation (Placement(transformation(extent={{-52,-40},{-32,-20}})));
    Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter
      annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
  equation
    [IP.y;  IOLIM.y] = -[cos(delta), sin(delta); -sin(delta), cos(delta)]*[p.ir/CoB; p.ii/CoB];
    V_t = VT;
    Pgen = -(1/CoB)*(p.vr*p.ir + p.vi*p.ii);
    Qgen = -(1/CoB)*(p.vi*p.ir - p.vr*p.ii);
    IQ0 = Iq0;
    IP0 = Ip0;
    V_0 = v_0;
    p_0 = p0;
    q_0 = q0;

    connect(add.y,KHV. u)
      annotation (Line(points={{-69,30},{-62,30}},
                                                color={0,0,127}));
    connect(LVPL.V,simpleLag. y)
      annotation (Line(points={{11,-70},{23,-70}}, color={0,0,127}));
    connect(LVACM.y,IP. u2) annotation (Line(points={{83,-70},{92,-70},{92,-16},
            {98,-16}},         color={0,0,127}));
    connect(switch1.u1,LVPL. y)
      annotation (Line(points={{-68,-82},{-56,-82},{-56,-70},{-11,-70}},
                                                             color={0,0,127}));
    connect(Lvplsw_logic.y,switch1. u2) annotation (Line(points={{-51,-90},{-68,-90}},
                                  color={255,0,255}));
    connect(KHV.y,min_limiter. u)
      annotation (Line(points={{-39,30},{-32,30}},
                                                 color={0,0,127}));
    connect(Vt.y,add. u1) annotation (Line(points={{-109,50},{-94,50},{-94,36},{-92,
            36}},      color={0,0,127}));
    connect(simpleLag.u,LVACM. Vt) annotation (Line(points={{46,-70},{61,-70}},
                                                             color={0,0,127}));
    connect(Vo_limit.y,add. u2)
      annotation (Line(points={{-109,24},{-92,24}},color={0,0,127}));
    connect(add2.y,limiter4. u)
      annotation (Line(points={{-89,-30},{-84,-30}}, color={0,0,127}));
    connect(Terminal_Voltage1.y,LVACM. Vt) annotation (Line(points={{45,-100},{54,
            -100},{54,-70},{61,-70}},  color={0,0,127}));
    connect(add3.y,limiter1. u)
      annotation (Line(points={{-65,74},{-60,74}},color={0,0,127}));
    connect(limiter1.y,integrator. u)
      annotation (Line(points={{-37,74},{-20,74}},
                                                 color={0,0,127}));
    connect(integrator.y,add3. u2) annotation (Line(points={{3,74},{8,74},{8,56},
            {-92,56},{-92,68},{-88,68}},     color={0,0,127}));
    connect(gain.y,add3. u1) annotation (Line(points={{-99,80},{-88,80}},
                                 color={0,0,127}));
    connect(gain.u, Iqcmd) annotation (Line(points={{-122,80},{-160,80}},
                        color={0,0,127}));
    connect(Ipcmd,add2. u1) annotation (Line(points={{-160,-60},{-130,-60},{-130,-24},
            {-112,-24}},          color={0,0,127}));
    connect(Constant.y, switch1.u3) annotation (Line(points={{-51,-114},{-62,-114},
            {-62,-98},{-68,-98}}, color={0,0,127}));
    connect(limiter4.y, integrator1.u)
      annotation (Line(points={{-61,-30},{-54,-30}}, color={0,0,127}));
    connect(LowerLimit.y, variableLimiter.limit2) annotation (Line(points={{-59,
            -60},{-28,-60},{-28,-38},{-22,-38}}, color={0,0,127}));
    connect(integrator1.y, variableLimiter.u)
      annotation (Line(points={{-31,-30},{-22,-30}}, color={0,0,127}));
    connect(variableLimiter.limit1, switch1.y) annotation (Line(points={{-22,-22},
            {-26,-22},{-26,-4},{-124,-4},{-124,-90},{-91,-90}}, color={0,0,127}));
    connect(variableLimiter.y, add2.u2) annotation (Line(points={{1,-30},{26,-30},
            {26,-10},{-118,-10},{-118,-36},{-112,-36}}, color={0,0,127}));
    connect(IP.u1, add2.u2) annotation (Line(points={{98,-4},{-24,-4},{-24,-10},
            {-118,-10},{-118,-36},{-112,-36}},
                              color={0,0,127}));
    connect(add1.y, IOLIM.u)
      annotation (Line(points={{99,88},{110,88}}, color={0,0,127}));
    connect(add1.u1, integrator.y) annotation (Line(points={{76,94},{8,94},{8,
            74},{3,74}}, color={0,0,127}));
    connect(min_limiter.y, add1.u2) annotation (Line(points={{-9,30},{68,30},{
            68,82},{76,82}}, color={0,0,127}));
    annotation (Icon(graphics={Text(
            extent={{-90,70},{90,-70}},
            textColor={0,0,255},
            textString="REGCA")}));
  end REGC_A;

  package BaseClasses "Base classes for renewable energy generator/converter models from PSSE"
    extends Modelica.Icons.BasesPackage;
    partial model baseRenewableGenerator
      "Base renewable generator/converter for PSSE models"
      import Complex;
      import Modelica.ComplexMath.arg;
      import Modelica.ComplexMath.real;
      import Modelica.ComplexMath.imag;
      import Modelica.ComplexMath.conj;
      import Modelica.Blocks.Interfaces.*;
      parameter OpenIPSL.Types.ApparentPower M_b=SysData.S_b "Machine base power" annotation (Dialog(group="Power flow data"));
      extends OpenIPSL.Electrical.Essentials.pfComponent(
        final enabledisplayPF=false,
        final enablefn=false,
        final enableV_b=false,
        final enableangle_0=true,
        final enablev_0=true,
        final enableQ_0=true,
        final enableP_0=true,
        final enableS_b=true);

      // Set of Model Parameters
      parameter Modelica.Units.SI.Time Tg = 0.02 "Converter time constant (s)" annotation (Dialog(group="Input Parameters"));
      parameter OpenIPSL.Types.PerUnit rrpwr = 10 "Low Voltage Power Logic (LVPL) ramp rate limit (pu/s)" annotation (Dialog(group="Input Parameters"));
      parameter OpenIPSL.Types.PerUnit Brkpt = 0.9 "LVPL characteristic voltage 2 (pu)" annotation (Dialog(group="Input Parameters"));
      parameter OpenIPSL.Types.PerUnit Zerox = 0.5 "LVPL characteristic voltage 1 (pu)" annotation (Dialog(group="Input Parameters"));
      parameter OpenIPSL.Types.PerUnit Lvpl1 = 1.22 "LVPL gain (pu)" annotation (Dialog(group="Input Parameters"));
      parameter OpenIPSL.Types.PerUnit Volim = 1.2 "Voltage limit (pu) for high voltage reactive current management" annotation (Dialog(group="Input Parameters"));
      parameter OpenIPSL.Types.PerUnit lvpnt1 = 0.8 "High voltage point for low voltage active current management (pu)" annotation (Dialog(group="Input Parameters"));
      parameter OpenIPSL.Types.PerUnit lvpnt0 = 0.4 "Low voltage point for low voltage active current management (pu)" annotation (Dialog(group="Input Parameters"));
      parameter OpenIPSL.Types.PerUnit Iolim = -1.3 "Current limit (pu) for high voltage reactive current management (specified as a negative value)" annotation (Dialog(group="Input Parameters"));
      parameter Modelica.Units.SI.Time Tfltr = 0.02 "Voltage filter time constant for low voltage active current management (s)" annotation (Dialog(group="Input Parameters"));
      parameter Real Khv = 0.7 "Overvoltage compensation gain used in the high voltage reactive current management" annotation (Dialog(group="Input Parameters"));
      parameter OpenIPSL.Types.PerUnit Iqrmax = 9999 "Upper limit on rate of change for reactive current (pu/s)" annotation (Dialog(group="Input Parameters"));
      parameter OpenIPSL.Types.PerUnit Iqrmin = -9999 "Lower limit on rate of change for reactive current (pu/s)" annotation (Dialog(group="Input Parameters"));

      parameter Boolean Lvplsw=true "Enable (True) or disable (False) low voltage power logic." annotation (Dialog(tab="Controls"));

      OpenIPSL.Interfaces.PwPin p(
        vr(start=vr0),
        vi(start=vi0),
        ir(start=-ir0*CoB),
        ii(start=-ii0*CoB)) annotation (Placement(transformation(extent={{130,-10},{150,10}}),
                              iconTransformation(extent={{130,-10},{150,10}})));
      Modelica.Blocks.Interfaces.RealInput Iqcmd(start=-Iq0)
        annotation (Placement(transformation(extent={{-180,60},{-140,100}}),
            iconTransformation(extent={{-180,50},{-140,90}})));
      Modelica.Blocks.Interfaces.RealInput Ipcmd(start=Ip0)
        annotation (Placement(transformation(extent={{-180,-80},{-140,-40}}),
            iconTransformation(extent={{-180,-90},{-140,-50}})));
      Modelica.Blocks.Interfaces.RealOutput IQ0 annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-120,-150}),iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-120,-150})));
      Modelica.Blocks.Interfaces.RealOutput IP0 annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,-150}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,-150})));
      Modelica.Blocks.Interfaces.RealOutput V_0 annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-150})));
      Modelica.Blocks.Interfaces.RealOutput q_0 annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={60,-150})));
      Modelica.Blocks.Interfaces.RealOutput p_0 annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={120,-150})));
      Modelica.Blocks.Interfaces.RealOutput V_t annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-90,150}), iconTransformation(extent={{-10,-10},{10,10}},
              origin={-90,150},
            rotation=90)));
      Modelica.Blocks.Interfaces.RealOutput Pgen "Value of Real output"
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={0,150}),   iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={0,150})));
      Modelica.Blocks.Interfaces.RealOutput Qgen "Value of Real output"
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={90,150}),  iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={90,150})));
    protected
      OpenIPSL.Types.Angle delta(start=angle_0);
      OpenIPSL.Types.PerUnit VT(start=v_0) "Bus voltage magnitude";
      OpenIPSL.Types.Angle anglev(start=angle_0) "Bus voltage angle";
      parameter OpenIPSL.Types.PerUnit p0=P_0/M_b "Initial active power (machine base)";
      parameter OpenIPSL.Types.PerUnit q0=Q_0/M_b "Initial reactive power (machine base)";
      parameter OpenIPSL.Types.PerUnit vr0=v_0*cos(angle_0);
      parameter OpenIPSL.Types.PerUnit vi0=v_0*sin(angle_0);
      parameter OpenIPSL.Types.PerUnit ir0=(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2);
      parameter OpenIPSL.Types.PerUnit ii0=(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2);
      parameter OpenIPSL.Types.PerUnit Isr0=ir0 "Source current re M_b";
      parameter OpenIPSL.Types.PerUnit Isi0=ii0 "Source current im M_b";
      parameter OpenIPSL.Types.PerUnit Ip0=Isr0*cos(-angle_0) - Isi0*sin(-angle_0);
      parameter OpenIPSL.Types.PerUnit Iq0=(Isr0*sin(-angle_0) + cos(-angle_0)*Isi0);
      parameter Real CoB=M_b/S_b "Change of base";

    equation
      anglev = atan2(p.vi, p.vr);
      VT = sqrt(p.vr*p.vr + p.vi*p.vi);
      delta = anglev;

     annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-140},
                {140,140}}), graphics={
            Rectangle(extent={{-140,140},{140,-140}}, lineColor={28,108,200}),
            Text(
              extent={{-126,90},{-66,50}},
              textColor={0,0,255},
              textString="IQCMD"),
            Text(
              extent={{-126,-50},{-66,-90}},
              textColor={0,0,255},
              textString="IPCMD"),
            Text(
              extent={{-136,-100},{-104,-140}},
              textColor={0,0,255},
              textString="IQ0"),
            Text(
              extent={{-76,-100},{-44,-140}},
              textColor={0,0,255},
              textString="IP0"),
            Text(
              extent={{-14,-104},{14,-136}},
              textColor={0,0,255},
              textString="V0"),
            Text(
              extent={{46,-104},{74,-136}},
              textColor={0,0,255},
              textString="Q0"),
            Text(
              extent={{-110,140},{-70,110}},
              textColor={0,0,255},
              textString="VT"),
            Text(
              extent={{-30,140},{30,110}},
              textColor={0,0,255},
              textString="PGEN"),
            Text(
              extent={{60,140},{120,110}},
              textColor={0,0,255},
              textString="QGEN"),
            Text(
              extent={{106,-104},{134,-136}},
              textColor={0,0,255},
              textString="P0")}),                                   Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-140,-140},{140,140}})));
    end baseRenewableGenerator;

    model LVACM
      //Modelica.Blocks.Interfaces.RealInput Ivpnt0
      //Modelica.Blocks.Interfaces.RealInput Ivpnt1
            parameter Real lvpnt0;
            parameter Real lvpnt1;
      Modelica.Blocks.Interfaces.RealOutput y
        annotation (Placement(transformation(extent={{100,-20},{140,20}}),
            iconTransformation(extent={{100,-10},{120,10}})));
      Modelica.Blocks.Interfaces.RealInput Vt
        annotation (Placement(transformation(extent={{-120,-10},{-100,10}}),
            iconTransformation(extent={{-120,-10},{-100,10}})));

    equation
      y = smooth(1,noEvent(if Vt <= lvpnt0 then 0 elseif Vt >= lvpnt1 then 1 else (1/(lvpnt1-lvpnt0))*(Vt-lvpnt0)));
        annotation (Placement(transformation(extent={{-100,-20},{-60,20}}),
            iconTransformation(extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-28,-102})),
                    Placement(transformation(extent={{-100,-80},{-60,-40}}),
            iconTransformation(extent={{-20,-20},{20,20}},
            rotation=90,
            origin={66,-102})),
                  Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                             graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0}),
            Text(
              extent={{-80,40},{80,-40}},
              lineColor={28,108,200},
              textStyle={TextStyle.Bold},
              textString="%name"),
            Line(points={{-32,66}}, color={28,108,200})}),           Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}})));
    end LVACM;

    model LVPL
      Modelica.Blocks.Interfaces.RealOutput y
        annotation (Placement(transformation(extent={{100,-20},{140,20}}),
            iconTransformation(extent={{100,-10},{120,10}})));
      Modelica.Blocks.Interfaces.RealInput V
        annotation (Placement(transformation(extent={{-120,-10},{-100,10}}),
            iconTransformation(extent={{-120,-10},{-100,10}})));
      //Modelica.Blocks.Interfaces.RealInput Brkpt
     // Modelica.Blocks.Interfaces.RealInput Zerox
      //Modelica.Blocks.Interfaces.RealInput Lvpl1
            parameter Real Brkpt;
            parameter Real Lvpl1;
            parameter Real Zerox;
    equation

      y = noEvent(if V < Zerox then 0 else if V > Brkpt then Lvpl1 else (V-Zerox)*(Lvpl1/(Brkpt-Zerox)));

      //y = smooth(1,noEvent(if V < Zerox then 0 else if V > Brkpt then 10e6 else (V-Zerox)*(Lvpl1/(Brkpt-Zerox))));

      //y = if ((ipcmd/(V-Zerox)) <= (Lvpl1/(Brkpt-Zerox)) and ipcmd > Lvpl1) then Lvpl1;

        annotation (Placement(transformation(extent={{-140,0},{-100,40}})),
                    Placement(transformation(extent={{-140,-40},{-100,0}})),
                    Placement(transformation(extent={{-140,-80},{-100,-40}})),
                  Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),                                  graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0}),
            Text(
              extent={{-80,40},{80,-40}},
              lineColor={28,108,200},
              textStyle={TextStyle.Bold},
              textString="%name")}),                                 Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}})));
    end LVPL;
  end BaseClasses;

end RenewableGeneratorConverter;
