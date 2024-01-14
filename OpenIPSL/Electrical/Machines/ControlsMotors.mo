within OpenIPSL.Electrical.Machines;
package ControlsMotors "Control models"
  package VariableSpeedDrive "Variable speed drive control strategies and converter model"

    package PowerElectronics "Variable speed drive power electronics model"

      model AC2DCandDC2AC "Phasor based voltage source converter model."
         extends OpenIPSL.Electrical.Essentials.pfComponent(
          final enabledisplayPF=false,
          final enablefn=false,
          final enableV_b=false,
          final enableangle_0=true,
          final enableP_0 = false,
          final enableQ_0=false,
          final enablev_0=true,
          final enableS_b=true);

          import Modelica.Constants.eps;
          import Modelica.Constants.pi;
        OpenIPSL.Interfaces.PwPin p
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}}),
              iconTransformation(extent={{-110,-10},{-90,10}})));
        OpenIPSL.Interfaces.PwPin n annotation (Placement(transformation(extent={{110,-10},
                  {130,10}}), iconTransformation(extent={{110,-10},{130,10}})));
        Modelica.Electrical.Analog.Sources.SignalVoltage Voltage annotation (
            Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=270,
              origin={-46,-14})));
        Modelica.Blocks.Sources.RealExpression Vd0(y=3*sqrt(6)*Vs.y*(V_b)/Modelica.Constants.pi)
                                                   annotation (Placement(transformation(extent={{-84,-24},
                  {-64,-4}})));
        Modelica.Electrical.Analog.Basic.Resistor Resistor(R=Rdc)
          annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
        Modelica.Electrical.Analog.Basic.Inductor Inductor(i(start=Il0, fixed=true),
                                                           L=Ldc)
          annotation (Placement(transformation(extent={{-16,-10},{4,10}})));
        Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch switch(Ron=1e-5, Goff=1e-5)
          annotation (Placement(transformation(extent={{10,-10},{30,10}})));
        Modelica.Electrical.Analog.Basic.Capacitor Capacitor(v(start=Vc0, fixed
              =true),                                                      C=Cdc)
                                                                     annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={30,-14})));
        Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={50,-14})));
        Modelica.Blocks.Sources.RealExpression Ii(y=Pmotor.y*S_b/Capacitor.v)
                                                                     annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={78,-14})));
        Modelica.Blocks.Sources.RealExpression Vs(y=sqrt(p.vr^2 + p.vi^2))
          annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
        Modelica.Blocks.Sources.BooleanExpression open_circuit_condition(y=if
              Resistor.i <= 0 then true else false)
          annotation (Placement(transformation(extent={{52,6},{32,26}})));
        Modelica.Blocks.Sources.RealExpression Pmotor(y=-(n.vr*n.ir + n.vi*n.ii)
              *(nr_input/wb))
          annotation (Placement(transformation(extent={{24,70},{44,90}})));
        Modelica.Blocks.Sources.RealExpression Qmotor(y=(n.vr*n.ii - n.vi*n.ir)
              *(nr_input/wb))
          annotation (Placement(transformation(extent={{24,54},{44,74}})));
        OpenIPSL.Types.PerUnit P;
        OpenIPSL.Types.PerUnit Q;
        OpenIPSL.Types.PerUnit S;
        Modelica.Units.SI.AngularVelocity rotor_speed;

        Modelica.Blocks.Sources.RealExpression Vmotor(y=Capacitor.v*m_input/(2*sqrt(2)
              *V_b))
          annotation (Placement(transformation(extent={{24,38},{44,58}})));
        Modelica.Blocks.Interfaces.RealInput m_input annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={60,-120}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={60,-120})));
        Modelica.Blocks.Sources.RealExpression vr_m(y=Vmotor.y*cos(0))
          annotation (Placement(transformation(extent={{62,70},{82,90}})));
        Modelica.Blocks.Sources.RealExpression vi_m(y=Vmotor.y*sin(0))
          annotation (Placement(transformation(extent={{62,54},{82,74}})));
        Modelica.Electrical.Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-14,-50},{6,-30}})));

        Modelica.Blocks.Interfaces.RealOutput Vc "Value of Real output" annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-50,-110}), iconTransformation(
              extent={{-18.1811,-18.1819},{21.819,-58.1819}},
              rotation=270,
              origin={-1.8181,-118.181})));
        parameter Modelica.Units.SI.Resistance Rdc=0.1
          "DC Link Resistance"
          annotation (Dialog(group="DC Link Parameters"));
        parameter Modelica.Units.SI.Inductance Ldc=0.001
          "DC Link Inductance"
          annotation (Dialog(group="DC Link Parameters"));
        parameter Modelica.Units.SI.Capacitance Cdc=0.02
          "DC Link Capacitance"
          annotation (Dialog(group="DC Link Parameters"));
        parameter Real m0= 0.1 "Initial PWM Modulation Value" annotation (Dialog(group="DC Link Parameters"));
        parameter Real N=1;

        parameter Modelica.Units.SI.AngularVelocity wb = 2*pi*fn/N;
        Modelica.Blocks.Sources.RealExpression Smotor(y=sqrt(Pmotor.y^2 + Qmotor.y^2))
          annotation (Placement(transformation(extent={{62,38},{82,58}})));
        Modelica.Blocks.Interfaces.RealInput nr_input annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=180,
              origin={120,-70}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={130,-70})));
      protected
        parameter OpenIPSL.Types.Voltage Vd00 = 3*sqrt(6)*v_0*V_b/Modelica.Constants.pi;
        parameter OpenIPSL.Types.Voltage Vc0 = 2*sqrt(2)*Vmotor0*V_b/m0;
        parameter OpenIPSL.Types.Current Il0 = 0;
        parameter OpenIPSL.Types.PerUnit Vmotor0 = (3*sqrt(3)/(2*pi))*m0;

        Modelica.Blocks.Sources.RealExpression Capacitor_Voltage(y=Capacitor.v)
          annotation (Placement(transformation(extent={{-84,-84},{-64,-64}})));
      //initial equation
        //der(Resistor.i) = 0;
        //der(Capacitor.v) = 0;

      equation
        connect(Vd0.y, Voltage.v)
          annotation (Line(points={{-63,-14},{-58,-14}}, color={0,0,127}));
        connect(Voltage.p, Resistor.p)
          annotation (Line(points={{-46,-4},{-46,0},{-42,0}},      color={0,0,255}));
        connect(Resistor.n, Inductor.p)
          annotation (Line(points={{-22,0},{-16,0}},     color={0,0,255}));
        connect(Inductor.n, switch.p)
          annotation (Line(points={{4,0},{10,0}},     color={0,0,255}));
        connect(switch.n, Capacitor.p)
          annotation (Line(points={{30,0},{30,-4}},    color={0,0,255}));
        connect(Voltage.n, Capacitor.n) annotation (Line(points={{-46,-24},{-46,-28},{
                30,-28},{30,-24}}, color={0,0,255}));
        connect(switch.n, signalCurrent.p) annotation (Line(points={{30,0},{50,0},{50,
                -4}},                                                                            color={0,0,255}));
        connect(signalCurrent.n, Capacitor.n) annotation (Line(points={{50,-24},{50,-28},
                {30,-28},{30,-24}}, color={0,0,255}));
        connect(signalCurrent.i, Ii.y) annotation (Line(points={{62,-14},{67,-14}}, color={0,0,127}));
        connect(open_circuit_condition.y, switch.control)
          annotation (Line(points={{31,16},{20,16},{20,12}},    color={255,0,255}));
          P =  (p.vr*p.ir + p.vi*p.ii)*(rotor_speed/wb);
          Q =  ((-p.vr*p.ii) + p.vi*p.ir)*(rotor_speed/wb);
          Q = 0;
          S = sqrt(P^2 + Q^2);
          Resistor.i = smooth(0,(P*S_b)/Vd0.y);

          rotor_speed = nr_input;

          n.vr = vr_m.y;
          n.vi = vi_m.y;
        connect(ground.p, Capacitor.n) annotation (Line(points={{-4,-30},{-4,-28},{30,
                -28},{30,-24}},
                           color={0,0,255}));
        connect(Capacitor_Voltage.y, Vc) annotation (Line(points={{-63,-74},{-50,-74},
                {-50,-110}}, color={0,0,127}));
        annotation (preferredView = "info",Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {120,100}}),
              graphics={Rectangle(
                extent={{-100,100},{120,-100}},
                lineColor={28,108,200}),
              Line(points={{-100,-100},{120,100}}, color={28,108,200}),
              Text(
                extent={{-80,80},{40,20}},
                textColor={28,108,200},
                textString="AC/DC"),
              Text(
                extent={{-20,-20},{100,-80}},
                textColor={28,108,200},
                textString="DC/AC")}),                                                                 Diagram(
              coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(
                extent={{14,90},{94,40}},
                lineColor={0,0,255},
                pattern=LinePattern.Dash), Text(
                extent={{24,98},{84,92}},
                lineColor={0,0,255},
                pattern=LinePattern.Dash,
                textString="Motor Variables"),                                                       Rectangle(
                extent={{-80,80},{-40,40}},
                lineColor={0,0,255},
                pattern=LinePattern.Dash), Text(
                extent={{-92,88},{-30,82}},
                lineColor={0,0,255},
                pattern=LinePattern.Dash,
                textString="Grid Variables"),                                                        Rectangle(
                extent={{-94,-54},{-54,-94}},
                lineColor={0,0,255},
                pattern=LinePattern.Dash), Text(
                extent={{-106,-46},{-44,-52}},
                lineColor={0,0,255},
                pattern=LinePattern.Dash,
                textString="DC Link Variables")}));
      end AC2DCandDC2AC;

      model AC2DCandDC2AC_MPC
        "Phasor based voltage source converter model."
         extends OpenIPSL.Electrical.Essentials.pfComponent(
          final enabledisplayPF=false,
          final enablefn=false,
          final enableV_b=false,
          final enableangle_0=true,
          final enableP_0 = false,
          final enableQ_0=false,
          final enablev_0=true,
          final enableS_b=true);

          import Modelica.Constants.eps;
          import Modelica.Constants.pi;
        OpenIPSL.Interfaces.PwPin p
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}}),
              iconTransformation(extent={{-110,-10},{-90,10}})));
        OpenIPSL.Interfaces.PwPin n annotation (Placement(transformation(extent={{110,-10},
                  {130,10}}), iconTransformation(extent={{110,-10},{130,10}})));
        Modelica.Blocks.Sources.RealExpression Vd0(y=(3*sqrt(6)*Vs.y*(V_b)/Modelica.Constants.pi))
                                                   annotation (Placement(transformation(extent={{-84,-24},
                  {-64,-4}})));
        Modelica.Electrical.Analog.Basic.Resistor Resistor(R=Rdc)
          annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
        Modelica.Electrical.Analog.Basic.Inductor Inductor(i(start=Il0, fixed=
                false),                                    L=Ldc)
          annotation (Placement(transformation(extent={{-16,-10},{4,10}})));
        Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch switch(Ron=1e-5, Goff=1e-5)
          annotation (Placement(transformation(extent={{10,-10},{30,10}})));
        Modelica.Electrical.Analog.Basic.Capacitor Capacitor(v(start=Vc0, fixed
              =false),                                                     C=Cdc)
                                                                     annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={30,-14})));
        Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={50,-14})));
        Modelica.Blocks.Sources.RealExpression Ii(y=Pmotor.y*S_b/Capacitor.v)
                                                                     annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={78,-14})));
        Modelica.Blocks.Sources.RealExpression Vs(y=sqrt(p.vr^2 + p.vi^2))
          annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
        Modelica.Blocks.Sources.BooleanExpression open_circuit_condition(y=if
              Resistor.i <= 0 then true else false)
          annotation (Placement(transformation(extent={{52,6},{32,26}})));
        Modelica.Blocks.Sources.RealExpression Pmotor(y=-(n.vr*n.ir + n.vi*n.ii)
              *(nr_input/wb))
          annotation (Placement(transformation(extent={{24,70},{44,90}})));
        Modelica.Blocks.Sources.RealExpression Qmotor(y=(n.vr*n.ii - n.vi*n.ir)
              *(nr_input/wb))
          annotation (Placement(transformation(extent={{24,54},{44,74}})));
        OpenIPSL.Types.PerUnit P;
        Modelica.Units.SI.ActivePower Pdc;
        OpenIPSL.Types.PerUnit Q;
        OpenIPSL.Types.PerUnit S;
        Modelica.Units.SI.AngularVelocity rotor_speed;

        Modelica.Blocks.Sources.RealExpression Vmotor(y=Capacitor.v*m_input/(2*sqrt(2)
              *V_b))
          annotation (Placement(transformation(extent={{24,38},{44,58}})));
        Modelica.Blocks.Interfaces.RealInput m_input annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={60,-120}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={60,-120})));
        Modelica.Blocks.Sources.RealExpression vr_m(y=Vmotor.y*cos(0))
          annotation (Placement(transformation(extent={{62,70},{82,90}})));
        Modelica.Blocks.Sources.RealExpression vi_m(y=Vmotor.y*sin(0))
          annotation (Placement(transformation(extent={{62,54},{82,74}})));
        Modelica.Electrical.Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-14,-50},{6,-30}})));

        Modelica.Blocks.Interfaces.RealOutput Vc "Value of Real output" annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-50,-110}), iconTransformation(
              extent={{-18.1811,-18.1819},{21.819,-58.1819}},
              rotation=270,
              origin={-1.8181,-118.181})));
        parameter Modelica.Units.SI.Resistance Rdc=0.1
          "DC Link Resistance"
          annotation (Dialog(group="DC Link Parameters"));
        parameter Modelica.Units.SI.Inductance Ldc=0.001
          "DC Link Inductance"
          annotation (Dialog(group="DC Link Parameters"));
        parameter Modelica.Units.SI.Capacitance Cdc=0.02
          "DC Link Capacitance"
          annotation (Dialog(group="DC Link Parameters"));
        parameter Real m0= 0.1 "Initial PWM Modulation Value" annotation (Dialog(group="DC Link Parameters"));
        parameter Real N=1;

        parameter Modelica.Units.SI.AngularVelocity wb = 2*pi*fn/N;
        Modelica.Blocks.Sources.RealExpression Smotor(y=sqrt(Pmotor.y^2 + Qmotor.y^2))
          annotation (Placement(transformation(extent={{62,38},{82,58}})));
        Modelica.Blocks.Interfaces.RealInput nr_input annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=180,
              origin={120,-70}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={130,-70})));
        Modelica.Electrical.Analog.Sources.SignalVoltage voltage annotation (
            Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=270,
              origin={-46,-14})));
      protected
        parameter OpenIPSL.Types.Voltage Vd00 = 3*sqrt(6)*v_0*V_b/Modelica.Constants.pi;
        parameter OpenIPSL.Types.Voltage Vc0 = 2*sqrt(2)*Vmotor0*V_b/m0;
        parameter OpenIPSL.Types.Current Il0 = 0;
        parameter OpenIPSL.Types.PerUnit Vmotor0 = (3*sqrt(3)/(2*pi))*m0;

        Modelica.Blocks.Sources.RealExpression Capacitor_Voltage(y=Capacitor.v)
          annotation (Placement(transformation(extent={{-84,-84},{-64,-64}})));
      //initial equation
        //der(Resistor.i) = 0;
        //der(Capacitor.v) = 0;

      equation
        connect(Resistor.n, Inductor.p)
          annotation (Line(points={{-22,0},{-16,0}},     color={0,0,255}));
        connect(Inductor.n, switch.p)
          annotation (Line(points={{4,0},{10,0}},     color={0,0,255}));
        connect(switch.n, Capacitor.p)
          annotation (Line(points={{30,0},{30,-4}},    color={0,0,255}));
        connect(switch.n, signalCurrent.p) annotation (Line(points={{30,0},{50,0},{50,
                -4}},                                                                            color={0,0,255}));
        connect(signalCurrent.n, Capacitor.n) annotation (Line(points={{50,-24},{50,-28},
                {30,-28},{30,-24}}, color={0,0,255}));
        connect(signalCurrent.i, Ii.y) annotation (Line(points={{62,-14},{67,-14}}, color={0,0,127}));
        connect(open_circuit_condition.y, switch.control)
          annotation (Line(points={{31,16},{20,16},{20,12}},    color={255,0,255}));
          P =  (p.vr*p.ir + p.vi*p.ii);
          Q =  ((-p.vr*p.ii) + p.vi*p.ir);
          Q = 0;
          S = sqrt(P^2 + Q^2);
          Pdc = Vd0.y*Resistor.i;
          P*S_b = Pdc;


          rotor_speed = nr_input;

          n.vr = vr_m.y;
          n.vi = vi_m.y;
        connect(ground.p, Capacitor.n) annotation (Line(points={{-4,-30},{-4,-28},{30,
                -28},{30,-24}},
                           color={0,0,255}));
        connect(Capacitor_Voltage.y, Vc) annotation (Line(points={{-63,-74},{-50,-74},
                {-50,-110}}, color={0,0,127}));
        connect(Vd0.y, voltage.v)
          annotation (Line(points={{-63,-14},{-58,-14}}, color={0,0,127}));
        connect(voltage.p, Resistor.p) annotation (Line(points={{-46,-4},{-46,0},
                {-42,0}}, color={0,0,255}));
        connect(voltage.n, ground.p) annotation (Line(points={{-46,-24},{-46,
                -28},{-4,-28},{-4,-30}}, color={0,0,255}));
        annotation (preferredView = "info",Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {120,100}}),
              graphics={Rectangle(
                extent={{-100,100},{120,-100}},
                lineColor={28,108,200}),
              Line(points={{-100,-100},{120,100}}, color={28,108,200}),
              Text(
                extent={{-80,80},{40,20}},
                textColor={28,108,200},
                textString="AC/DC"),
              Text(
                extent={{-20,-20},{100,-80}},
                textColor={28,108,200},
                textString="DC/AC")}),                                                                 Diagram(
              coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(
                extent={{14,90},{94,40}},
                lineColor={0,0,255},
                pattern=LinePattern.Dash), Text(
                extent={{24,98},{84,92}},
                lineColor={0,0,255},
                pattern=LinePattern.Dash,
                textString="Motor Variables"),                                                       Rectangle(
                extent={{-80,80},{-40,40}},
                lineColor={0,0,255},
                pattern=LinePattern.Dash), Text(
                extent={{-92,88},{-30,82}},
                lineColor={0,0,255},
                pattern=LinePattern.Dash,
                textString="Grid Variables"),                                                        Rectangle(
                extent={{-94,-54},{-54,-94}},
                lineColor={0,0,255},
                pattern=LinePattern.Dash), Text(
                extent={{-106,-46},{-44,-52}},
                lineColor={0,0,255},
                pattern=LinePattern.Dash,
                textString="DC Link Variables")}));
      end AC2DCandDC2AC_MPC;
      annotation (preferredView = "info", Icon(graphics={
            Rectangle(
              lineColor={200,200,200},
              fillColor={248,248,248},
              fillPattern=FillPattern.HorizontalCylinder,
              extent={{-100,-100},{100,100}},
              radius=25.0,
              lineThickness=0.5),
            Polygon(points={{36,0},{-34,50},{-34,-50},{36,0}},
              fillColor={238,46,47},
              fillPattern=FillPattern.Solid,
              lineThickness=1,
              pattern=LinePattern.None,
              lineColor={238,46,47}),
            Line(
              points={{-78,0},{-34,0}},
              color={238,46,47},
              thickness=1),
            Line(
              points={{36,50},{36,-52}},
              color={238,46,47},
              thickness=1),
            Line(
              points={{36,0},{80,0}},
              color={238,46,47},
              thickness=1),
            Line(
              points={{36,-16},{64,-38}},
              color={238,46,47},
              thickness=1),
            Line(
              points={{64,-38},{64,-56}},
              color={238,46,47},
              thickness=1)}));
    end PowerElectronics;

    package ControllerLogic "Controller logic for variable speed drive"

      model VoltsHertzController "Volts/Hertz controller model"
        extends OpenIPSL.Electrical.Essentials.pfComponent(
          final enabledisplayPF=false,
          final enablefn=false,
          final enableV_b=false,
          final enableangle_0=false,
          final enablev_0=false,
          final enableQ_0=false,
          final enableS_b=true);

          import Modelica.Constants.pi;

         parameter Real f_max = 80 "Maximum input voltage frequency" annotation (Dialog(group="VSD project specifics"));
         parameter Real f_min = 40 "Minimum input voltage frequency" annotation (Dialog(group="VSD project specifics"));
         parameter Real m0= 0.1 "Initial PWM Modulation Value" annotation (Dialog(group="VSD project specifics"));

        Modelica.Blocks.Interfaces.RealInput motor_speed annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-110,-20}),
                                iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=180,
              origin={120,40})));
        OpenIPSL.NonElectrical.Continuous.SimpleLag Speed_Sensor(K=1, T=Tr,
          y_start=rotor_speed_initial)
          annotation (Placement(transformation(extent={{-88,-30},{-68,-10}})));
        parameter OpenIPSL.Types.Time Tr=0.01 "Lag time constant"
          annotation (Dialog(group="Control Parameters"));
        Modelica.Blocks.Math.Add add(k1=-1)
          annotation (Placement(transformation(extent={{-88,-68},{-68,-48}})));
        Modelica.Blocks.Nonlinear.Limiter limiter(uMax=we_max, uMin=we_min)
          annotation (Placement(transformation(extent={{44,-36},{64,-16}})));
        Modelica.Blocks.Math.Gain gain(k=Kp)
          annotation (Placement(transformation(extent={{-48,-52},{-28,-32}})));
        Modelica.Blocks.Continuous.Integrator integrator(k=Ki,
          initType=Modelica.Blocks.Types.Init.InitialOutput,
          y_start=0)
          annotation (Placement(transformation(extent={{-48,-84},{-28,-64}})));
        Modelica.Blocks.Math.Add add1(k1=+1)
          annotation (Placement(transformation(extent={{-18,-68},{2,-48}})));
        Modelica.Blocks.Math.Add add2(k1=+1)
          annotation (Placement(transformation(extent={{16,-36},{36,-16}})));
        Modelica.Blocks.Interfaces.RealOutput we(start=0.01*2*Modelica.Constants.pi*
              SysData.fn)
                     "Connector of Real output signal"
          annotation (Placement(transformation(extent={{100,-60},{140,-20}}),
              iconTransformation(extent={{100,-60},{140,-20}})));
        Modelica.Blocks.Math.Gain gain1(k=1)
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=0,
              origin={30,10})));
        Modelica.Blocks.Interfaces.RealOutput m "Output signal connector"
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
              rotation=90,
              origin={46,120}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={46,120})));
          Real Kf= 1/(2*pi*fn) "Gain value multiplied with input signal"
          annotation (Dialog(group="Control Parameters"));
        parameter Real Kp=5 "Gain value multiplied with input signal"
          annotation (Dialog(group="Control Parameters"));
        parameter Real Ki=0.1 "Integrator gain"
          annotation (Dialog(group="Control Parameters"));
        parameter Real we_max=2*pi*f_max "Maximum Synchronous Speed"
          annotation (Dialog(group="Control Parameters"));
        parameter Real we_min=2*pi*f_min "Minimum Synchronous Speed"
          annotation (Dialog(group="Control Parameters"));
        Modelica.Blocks.Interfaces.RealInput Vc annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-46,120}), iconTransformation(
              extent={{-20,-20},{20,20}},
              origin={-46,120},
              rotation=270)));
        Modelica.Blocks.Interfaces.RealInput W_ref "Connector of Real input signal 2"
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}}),
              iconTransformation(extent={{-140,-20},{-100,20}})));
        Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=1, uMin=0) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={24,52})));
        Modelica.Blocks.Math.Gain gain2(k=1/V_b)
          annotation (Placement(transformation(extent={{-52,48},{-32,68}})));
        Modelica.Blocks.Sources.RealExpression realExpression(y=Kf)
          annotation (Placement(transformation(extent={{-88,20},{-68,40}})));
        Modelica.Blocks.Math.Product product1
          annotation (Placement(transformation(extent={{-52,14},{-32,34}})));
        Modelica.Blocks.Continuous.FirstOrder firstOrder(
          T=0.01,
          initType=Modelica.Blocks.Types.Init.InitialState,
          y_start=m0)
          annotation (Placement(transformation(extent={{48,42},{68,62}})));
        parameter Real rotor_speed_initial=1.9*Modelica.Constants.pi*SysData.fn
          "Output start value";
      equation
        connect(motor_speed, Speed_Sensor.u) annotation (Line(points={{-110,-20},{-90,
                -20}},               color={0,0,127}));
        connect(Speed_Sensor.y, add.u1) annotation (Line(points={{-67,-20},{-62,-20},{
                -62,-38},{-96,-38},{-96,-52},{-90,-52}},
                                 color={0,0,127}));
        connect(add.y, gain.u) annotation (Line(points={{-67,-58},{-56,-58},{-56,-42},
                {-50,-42}},
                     color={0,0,127}));
        connect(integrator.u, gain.u) annotation (Line(points={{-50,-74},{-56,
                -74},{-56,-42},{-50,-42}},
                             color={0,0,127}));
        connect(gain.y, add1.u1) annotation (Line(points={{-27,-42},{-22,-42},{-22,-52},
                {-20,-52}},
                       color={0,0,127}));
        connect(integrator.y, add1.u2) annotation (Line(points={{-27,-74},{
                -22,-74},{-22,-64},{-20,-64}},
                                color={0,0,127}));
        connect(add2.u1, Speed_Sensor.y)
          annotation (Line(points={{14,-20},{-67,-20}},
                                                      color={0,0,127}));
        connect(add.u2, W_ref) annotation (Line(points={{-90,-64},{-100,-64},{-100,0},
                {-120,0}},   color={0,0,127}));
        connect(Vc, gain2.u) annotation (Line(points={{-46,120},{-46,74},{-66,74},{-66,
                58},{-54,58}},          color={0,0,127}));
        connect(gain1.u, we) annotation (Line(points={{42,10},{72,10},{72,-40},{120,-40}},
                                                                 color={0,0,
                127}));
        connect(add1.y, add2.u2) annotation (Line(points={{3,-58},{8,-58},{8,-32},{14,
                -32}},             color={0,0,127}));
        connect(add2.y, limiter.u)
          annotation (Line(points={{37,-26},{42,-26}}, color={0,0,127}));
        connect(limiter.y, we) annotation (Line(points={{65,-26},{88,-26},{88,-40},{120,
                -40}},       color={0,0,127}));
        connect(integrator.u, add.y) annotation (Line(points={{-50,-74},{-56,
                -74},{-56,-58},{-67,-58}},
                                 color={0,0,127}));
        connect(realExpression.y, product1.u1)
          annotation (Line(points={{-67,30},{-54,30}}, color={0,0,127}));
        connect(gain1.y, product1.u2) annotation (Line(points={{19,10},{-66,10},{-66,18},
                {-54,18}}, color={0,0,127}));
        connect(limiter1.y, firstOrder.u) annotation (Line(points={{35,52},{46,52}},
                                 color={0,0,127}));
        connect(firstOrder.y, m) annotation (Line(points={{69,52},{72,52},{72,78},{46,
                78},{46,120}}, color={0,0,127}));
        connect(product1.y, limiter1.u) annotation (Line(points={{-31,24},{-4,24},{-4,
                52},{12,52}}, color={0,0,127}));
        annotation (preferredView = "info", Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {80,100}}),                                         graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={28,108,200}),        Text(
                extent={{-80,82},{80,-78}},
                lineColor={28,108,200},
                textString=" V/f
Control")}),                                                           Diagram(
              coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{80,100}})));
      end VoltsHertzController;

      model PIcontroller4pumpexample "PI controller for pump example"
        Modelica.Blocks.Interfaces.RealInput m_flow_ref annotation (Placement(
              transformation(extent={{-120,50},{-100,70}}), iconTransformation(extent=
                 {{-120,50},{-100,70}})));
        Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(
              transformation(extent={{-54,-10},{-34,10}})));
        Modelica.Blocks.Continuous.Integrator integrator(k=ki, y_start=1)
          annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
        Modelica.Blocks.Math.Gain gain(k=kp)
          annotation (Placement(transformation(extent={{-8,20},{12,40}})));
        Modelica.Blocks.Math.Add add1(k2=+1)
          annotation (Placement(transformation(extent={{26,-10},{46,10}})));
        Modelica.Blocks.Math.Gain PI_convert(k=mflow_2_speed)
          annotation (Placement(transformation(extent={{56,-10},{76,10}})));
        Modelica.Blocks.Interfaces.RealInput m_flow annotation (Placement(
              transformation(extent={{-120,-70},{-100,-50}}), iconTransformation(
                extent={{-120,-70},{-100,-50}})));
        Modelica.Blocks.Interfaces.RealOutput Wref "Output signal connector"
          annotation (Placement(transformation(extent={{100,-10},{120,10}})));
        parameter Real kp=1 "Proportional Gain in the PI Controller."
          annotation (Dialog(group="Pump Control Setting"));
        parameter Real ki=0.1 "Integrator gain in the PI Controller."
          annotation (Dialog(group="Pump Control Setting"));
        parameter Real mflow_2_speed=188.495/585.18
          "Linear gain converter from mass flow rate to motor reference speed."
          annotation (Dialog(group="Pump Control Setting"));
      equation
        connect(gain.u,add. y) annotation (Line(points={{-10,30},{-28,30},{-28,0},{-33,
                0}},        color={0,0,127}));
        connect(integrator.u,add. y) annotation (Line(points={{-12,-30},{-28,-30},{-28,
                0},{-33,0}},      color={0,0,127}));
        connect(integrator.y,add1. u2) annotation (Line(points={{11,-30},{22,-30},{22,
                -6},{24,-6}},    color={0,0,127}));
        connect(gain.y,add1. u1) annotation (Line(points={{13,30},{22,30},{22,6},{24,6}},
                           color={0,0,127}));
        connect(add1.y,PI_convert. u)
          annotation (Line(points={{47,0},{54,0}},       color={0,0,127}));
        connect(m_flow_ref, add.u1) annotation (Line(points={{-110,60},{-62,60},{-62,6},
                {-56,6}}, color={0,0,127}));
        connect(m_flow, add.u2) annotation (Line(points={{-110,-60},{-62,-60},{-62,-6},
                {-56,-6}}, color={0,0,127}));
        connect(PI_convert.y, Wref)
          annotation (Line(points={{77,0},{110,0}}, color={0,0,127}));
        annotation (preferredView = "info",Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
                Text(
                extent={{-78,30},{80,-20}},
                lineColor={0,0,0},
                textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=false)));
      end PIcontroller4pumpexample;

      model VoltsHertzController_MPC "Volts/Hertz controller model"
        extends OpenIPSL.Electrical.Essentials.pfComponent(
          final enabledisplayPF=false,
          final enablefn=false,
          final enableV_b=false,
          final enableangle_0=false,
          final enablev_0=false,
          final enableQ_0=false,
          final enableS_b=true);

          import Modelica.Constants.pi;

         parameter Real f_max = 80 "Maximum input voltage frequency" annotation (Dialog(group="VSD project specifics"));
         parameter Real f_min = 40 "Minimum input voltage frequency" annotation (Dialog(group="VSD project specifics"));
         parameter Real m0= 0.1 "Initial PWM Modulation Value" annotation (Dialog(group="VSD project specifics"));

        Modelica.Blocks.Interfaces.RealInput motor_speed annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-110,-20}),
                                iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=180,
              origin={120,40})));
        OpenIPSL.NonElectrical.Continuous.SimpleLag Speed_Sensor(K=1, T=Tr,
          y_start=rotor_speed_initial)
          annotation (Placement(transformation(extent={{-18,-30},{2,-10}})));
        parameter OpenIPSL.Types.Time Tr=0.01 "Lag time constant"
          annotation (Dialog(group="Control Parameters"));
        Modelica.Blocks.Math.Add add(k1=-1)
          annotation (Placement(transformation(extent={{-22,-84},{-2,-64}})));
        Modelica.Blocks.Nonlinear.Limiter limiter(uMax=we_max, uMin=we_min)
          annotation (Placement(transformation(extent={{44,-36},{64,-16}})));
        Modelica.Blocks.Math.Gain gain(k=Kp)
          annotation (Placement(transformation(extent={{20,-70},{40,-50}})));
        Modelica.Blocks.Continuous.Integrator integrator(k=Ki,
          initType=Modelica.Blocks.Types.Init.InitialOutput,
          y_start=0)
          annotation (Placement(transformation(extent={{22,-98},{42,-78}})));
        Modelica.Blocks.Math.Add add1(k1=+1)
          annotation (Placement(transformation(extent={{52,-80},{72,-60}})));
        Modelica.Blocks.Math.Add add2(k1=+1)
          annotation (Placement(transformation(extent={{16,-36},{36,-16}})));
        Modelica.Blocks.Interfaces.RealOutput we(start=0.01*2*Modelica.Constants.pi*
              SysData.fn)
                     "Connector of Real output signal"
          annotation (Placement(transformation(extent={{100,-60},{140,-20}}),
              iconTransformation(extent={{100,-60},{140,-20}})));
        Modelica.Blocks.Math.Gain gain1(k=1)
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=0,
              origin={30,10})));
        Modelica.Blocks.Interfaces.RealOutput m "Output signal connector"
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
              rotation=90,
              origin={46,120}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={46,120})));
          Real Kf= 1/(2*pi*fn) "Gain value multiplied with input signal"
          annotation (Dialog(group="Control Parameters"));
        parameter Real Kp=5 "Gain value multiplied with input signal"
          annotation (Dialog(group="Control Parameters"));
        parameter Real Ki=0.1 "Integrator gain"
          annotation (Dialog(group="Control Parameters"));
        parameter Real we_max=2*pi*f_max "Maximum Synchronous Speed"
          annotation (Dialog(group="Control Parameters"));
        parameter Real we_min=2*pi*f_min "Minimum Synchronous Speed"
          annotation (Dialog(group="Control Parameters"));
        Modelica.Blocks.Interfaces.RealInput Vc annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-46,120}), iconTransformation(
              extent={{-20,-20},{20,20}},
              origin={-46,120},
              rotation=270)));
        Modelica.Blocks.Interfaces.RealInput W_ref "Connector of Real input signal 2"
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}}),
              iconTransformation(extent={{-140,-20},{-100,20}})));
        Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=1, uMin=0) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={24,52})));
        Modelica.Blocks.Math.Gain gain2(k=1/V_b)
          annotation (Placement(transformation(extent={{-52,48},{-32,68}})));
        Modelica.Blocks.Sources.RealExpression realExpression(y=Kf)
          annotation (Placement(transformation(extent={{-88,20},{-68,40}})));
        Modelica.Blocks.Math.Product product1
          annotation (Placement(transformation(extent={{-52,14},{-32,34}})));
        Modelica.Blocks.Continuous.FirstOrder firstOrder(
          T=0.01,
          initType=Modelica.Blocks.Types.Init.InitialState,
          y_start=m0)
          annotation (Placement(transformation(extent={{48,42},{68,62}})));
        parameter Real rotor_speed_initial=1.9*Modelica.Constants.pi*SysData.fn
          "Output start value";
        Modelica.Blocks.Continuous.FirstOrder firstOrder1(
          k=1,
          T=0.001,
          initType=Modelica.Blocks.Types.Init.SteadyState,
          y_start=1*(1.9*Modelica.Constants.pi*SysData.fn))
          annotation (Placement(transformation(extent={{-54,-90},{-34,-70}})));
        Modelica.Blocks.Math.Gain gain3(k=1.9*Modelica.Constants.pi*SysData.fn)
          annotation (Placement(transformation(extent={{-70,-84},{-62,-76}})));
        Modelica.Blocks.Sources.Constant
                                     Sync_Speed(k=1)
          annotation (Placement(transformation(extent={{-94,-66},{-74,-46}})));
        Modelica.Blocks.Math.Add add3
          annotation (Placement(transformation(extent={{-64,-58},{-56,-50}})));
      equation
        connect(motor_speed, Speed_Sensor.u) annotation (Line(points={{-110,-20},
                {-20,-20}},          color={0,0,127}));
        connect(Speed_Sensor.y, add.u1) annotation (Line(points={{3,-20},{6,-20},
                {6,-58},{-24,-58},{-24,-68}},
                                 color={0,0,127}));
        connect(add.y, gain.u) annotation (Line(points={{-1,-74},{10,-74},{10,
                -60},{18,-60}},
                     color={0,0,127}));
        connect(gain.y, add1.u1) annotation (Line(points={{41,-60},{44,-60},{44,
                -64},{50,-64}},
                       color={0,0,127}));
        connect(integrator.y, add1.u2) annotation (Line(points={{43,-88},{50,
                -88},{50,-76}}, color={0,0,127}));
        connect(add2.u1, Speed_Sensor.y)
          annotation (Line(points={{14,-20},{3,-20}}, color={0,0,127}));
        connect(Vc, gain2.u) annotation (Line(points={{-46,120},{-46,74},{-66,74},{-66,
                58},{-54,58}},          color={0,0,127}));
        connect(gain1.u, we) annotation (Line(points={{42,10},{72,10},{72,-40},{120,-40}},
                                                                 color={0,0,
                127}));
        connect(add1.y, add2.u2) annotation (Line(points={{73,-70},{78,-70},{78,
                -42},{14,-42},{14,-32}},
                                   color={0,0,127}));
        connect(add2.y, limiter.u)
          annotation (Line(points={{37,-26},{42,-26}}, color={0,0,127}));
        connect(limiter.y, we) annotation (Line(points={{65,-26},{88,-26},{88,-40},{120,
                -40}},       color={0,0,127}));
        connect(integrator.u, add.y) annotation (Line(points={{20,-88},{6,-88},
                {6,-74},{-1,-74}},
                                 color={0,0,127}));
        connect(realExpression.y, product1.u1)
          annotation (Line(points={{-67,30},{-54,30}}, color={0,0,127}));
        connect(gain1.y, product1.u2) annotation (Line(points={{19,10},{-66,10},{-66,18},
                {-54,18}}, color={0,0,127}));
        connect(limiter1.y, firstOrder.u) annotation (Line(points={{35,52},{46,52}},
                                 color={0,0,127}));
        connect(firstOrder.y, m) annotation (Line(points={{69,52},{72,52},{72,78},{46,
                78},{46,120}}, color={0,0,127}));
        connect(product1.y, limiter1.u) annotation (Line(points={{-31,24},{-4,24},{-4,
                52},{12,52}}, color={0,0,127}));
        connect(firstOrder1.y, add.u2)
          annotation (Line(points={{-33,-80},{-24,-80}}, color={0,0,127}));
        connect(gain3.y, firstOrder1.u)
          annotation (Line(points={{-61.6,-80},{-56,-80}}, color={0,0,127}));
        connect(Sync_Speed.y, add3.u2) annotation (Line(points={{-73,-56},{-72,
                -56.4},{-64.8,-56.4}}, color={0,0,127}));
        connect(add3.y, gain3.u) annotation (Line(points={{-55.6,-54},{-46,-54},
                {-46,-62},{-72,-62},{-72,-80},{-70.8,-80}}, color={0,0,127}));
        connect(W_ref, add3.u1) annotation (Line(points={{-120,0},{-64.8,0},{
                -64.8,-51.6}}, color={0,0,127}));
        annotation (preferredView = "info", Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                  {80,100}}),                                         graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={28,108,200}),        Text(
                extent={{-80,82},{80,-78}},
                lineColor={28,108,200},
                textString=" V/f
Control")}),                                                           Diagram(
              coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{80,100}})));
      end VoltsHertzController_MPC;
      annotation (preferredView = "info", Icon(graphics={
            Rectangle(
              lineColor={200,200,200},
              fillColor={248,248,248},
              fillPattern=FillPattern.HorizontalCylinder,
              extent={{-100,-100},{100,100}},
              radius=25.0,
              lineThickness=0.5),
                            Line(
              origin={0.061,4.184},
              points={{81.939,36.056},{65.362,36.056},{14.39,-26.199},{-29.966,
                  113.485},{-65.374,-61.217},{-78.061,-78.184}},
              color={238,46,47},
              smooth=Smooth.Bezier,
              thickness=1)}));
    end ControllerLogic;
    annotation (preferredView = "info",Icon(graphics={
          Rectangle(
            lineColor={200,200,200},
            fillColor={248,248,248},
            fillPattern=FillPattern.HorizontalCylinder,
            extent={{-100,-100},{100,100}},
            radius=25.0,
            lineThickness=0.5), Text(
            extent={{-86,46},{82,-46}},
            textColor={238,46,47},
            textStyle={TextStyle.Bold,TextStyle.Italic},
            textString="VSD")}));
  end VariableSpeedDrive;
  annotation (preferredView = "info", Icon(graphics={
        Rectangle(
          lineColor={200,200,200},
          fillColor={248,248,248},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-100,-100},{100,100}},
          radius=25.0,
          lineThickness=0.5),
        Rectangle(
          lineColor={128,128,128},
          extent={{-100,-100},{100,100}},
          radius=25.0),
      Rectangle(
        origin={0,35.149},
        fillColor={255,255,255},
        extent={{-30.0,-20.1488},{30.0,20.1488}},
          lineColor={238,46,47},
          lineThickness=1),
      Rectangle(
        origin={0,-34.851},
        fillColor={255,255,255},
        extent={{-30.0,-20.1488},{30.0,20.1488}},
          lineColor={238,46,47},
          lineThickness=1),
      Line(
        origin={-51.25,0},
        points={{21.25,-35.0},{-13.75,-35.0},{-13.75,35.0},{6.25,35.0}},
          color={238,46,47},
          thickness=1),
      Polygon(
        origin={-40,35},
        pattern=LinePattern.None,
        points={{10.0,0.0},{-5.0,5.0},{-5.0,-5.0}},
          lineColor={0,0,0},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid),
      Line(
        origin={51.25,0},
        points={{-21.25,35.0},{13.75,35.0},{13.75,-35.0},{-6.25,-35.0}},
          color={238,46,47},
          thickness=1),
      Polygon(
        origin={40,-35},
        pattern=LinePattern.None,
        points={{-10.0,0.0},{5.0,5.0},{5.0,-5.0}},
          lineColor={255,255,255},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid)}));
end ControlsMotors;
