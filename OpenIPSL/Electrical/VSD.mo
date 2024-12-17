within OpenIPSL.Electrical;
package VSD "Models that represent generic variable speed drives with their power electronics and controller modules"

  package Generic
    "Generic variable speed drive control and converter model"

    package PowerElectronics "Variable speed drive power electronics model"
        extends Modelica.Icons.Package;

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
        OpenIPSL.Interfaces.PwPin p "Grid side pin"
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}}),
              iconTransformation(extent={{-110,-10},{-90,10}})));
        OpenIPSL.Interfaces.PwPin n "Motor side pin" annotation (Placement(transformation(extent={{90,-10},
                  {110,10}}), iconTransformation(extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Sources.SignalVoltage Voltage "DC voltage source" annotation (
            Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=270,
              origin={-46,-14})));
        Modelica.Blocks.Sources.RealExpression Vd0(y=3*sqrt(6)*Vs.y*(V_b)/Modelica.Constants.pi) "DC voltage after converter stage"
                                                   annotation (Placement(transformation(extent={{-84,-24},
                  {-64,-4}})));
        Modelica.Electrical.Analog.Basic.Resistor Resistor(R=Rdc) "DC link resistor"
          annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
        Modelica.Electrical.Analog.Basic.Inductor Inductor(i(start=Il0, fixed=false),
                                                           L=Ldc) "DC link inductor"
          annotation (Placement(transformation(extent={{-16,-10},{4,10}})));
        Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch switch(Ron=1e-5, Goff=1e-5) "Switch enforcing no inverse current flow in DC link"
          annotation (Placement(transformation(extent={{10,-10},{30,10}})));
        Modelica.Electrical.Analog.Basic.Capacitor Capacitor(v(start=Vc0, fixed=true),
                                                                           C=Cdc) "DC link capacitor"
                                                                     annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={30,-14})));
        Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent "Current drawn source" annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={50,-14})));
        Modelica.Blocks.Sources.RealExpression Ii(y=Pmotor.y*S_b/Capacitor.v) "Current drawn expression"
                                                                     annotation (Placement(transformation(
              extent={{-10,10},{10,-10}},
              rotation=180,
              origin={78,-14})));
        Modelica.Blocks.Sources.RealExpression Vs(y=sqrt(p.vr^2 + p.vi^2)) "Inverter side voltage magnitude"
          annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
        Modelica.Blocks.Sources.BooleanExpression open_circuit_condition(y=if
              Resistor.i < 0 then true else false) "Boolean expression for boolean switch to block current from flowing the opposite direction "
          annotation (Placement(transformation(extent={{52,6},{32,26}})));
        Modelica.Blocks.Sources.RealExpression Pmotor(y=-(n.vr*n.ir + n.vi*n.ii)) "Active power for drawn motor current"
          annotation (Placement(transformation(extent={{24,70},{44,90}})));
        Modelica.Blocks.Sources.RealExpression Qmotor(y=n.vr*n.ii - n.vi*n.ir) "Reactive power for drawn motor current"
          annotation (Placement(transformation(extent={{24,54},{44,74}})));
        OpenIPSL.Types.PerUnit P "Active Power";
        Modelica.Units.SI.ActivePower Pdc "DC Circuit Active Power";
        OpenIPSL.Types.PerUnit Q "Reactive Power";
        OpenIPSL.Types.PerUnit S "Apparent Power";

        Modelica.Blocks.Sources.RealExpression Vmotor(y=Capacitor.v*m_input/(2*sqrt(2)
              *V_b)) "Motor terminal voltage"
          annotation (Placement(transformation(extent={{24,38},{44,58}})));
        Modelica.Blocks.Interfaces.RealInput m_input "PWM modulation index input" annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={60,-120}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={60,-120})));
        Modelica.Blocks.Sources.RealExpression vr_m(y=Vmotor.y*cos(0)) "Motor real current"
          annotation (Placement(transformation(extent={{62,70},{82,90}})));
        Modelica.Blocks.Sources.RealExpression vi_m(y=Vmotor.y*sin(0)) "Motor imaginary current"
          annotation (Placement(transformation(extent={{62,54},{82,74}})));
        Modelica.Electrical.Analog.Basic.Ground ground "Electrical ground"
          annotation (Placement(transformation(extent={{-14,-50},{6,-30}})));

        Modelica.Blocks.Interfaces.RealOutput Vc "Value of Real output" annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-50,-110}), iconTransformation(
              extent={{-18.1811,-18.1819},{21.819,-58.1819}},
              rotation=270,
              origin={-21.8181,-118.181})));
        parameter Modelica.Units.SI.Resistance Rdc=0.1
          "DC link resistance"
          annotation (Dialog(group="DC Link Parameters"));
        parameter Modelica.Units.SI.Inductance Ldc=0.001
          "DC link inductance"
          annotation (Dialog(group="DC Link Parameters"));
        parameter Modelica.Units.SI.Capacitance Cdc=0.02
          "DC link capacitance"
          annotation (Dialog(group="DC Link Parameters"));
        parameter Real m0= 0.1 "Initial PWM modulation value" annotation (Dialog(group="DC Link Parameters"));
        Modelica.Blocks.Sources.RealExpression Smotor(y=sqrt(Pmotor.y^2 + Qmotor.y^2)) "Motor apparent power"
          annotation (Placement(transformation(extent={{62,38},{82,58}})));

      protected
        parameter OpenIPSL.Types.Voltage Vc0 = 2*sqrt(2)*Vmotor0*V_b/m0 "Initial capacitor voltage";
        parameter OpenIPSL.Types.Current Il0 = 0 "Initial inductor current";
        parameter OpenIPSL.Types.PerUnit Vmotor0 = (3*sqrt(3)/(2*pi))*m0 "Initial terminal voltage";

        Modelica.Blocks.Sources.RealExpression Capacitor_Voltage(y=Capacitor.v) "Capacitor voltage"
          annotation (Placement(transformation(extent={{-84,-84},{-64,-64}})));

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
          P =  p.vr*p.ir + p.vi*p.ii;
          Q = (-p.vr*p.ii) + p.vi*p.ir;
          Q = 0;
          S = sqrt(P^2 + Q^2);
          Pdc = Vd0.y*Resistor.i;
          P*S_b = Pdc;

          n.vr = vr_m.y;
          n.vi = vi_m.y;
        connect(ground.p, Capacitor.n) annotation (Line(points={{-4,-30},{-4,-28},{30,
                -28},{30,-24}},
                           color={0,0,255}));
        connect(Capacitor_Voltage.y, Vc) annotation (Line(points={{-63,-74},{-50,-74},
                {-50,-110}}, color={0,0,127}));
        annotation (preferredView = "info",Icon(
              graphics={Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={28,108,200}),
              Line(points={{-100,-100},{100,100}}, color={28,108,200}),
              Text(
                extent={{-90,80},{30,20}},
                textColor={28,108,200},
                textString="AC/DC"),
              Text(
                extent={{-30,-20},{90,-80}},
                textColor={28,108,200},
                textString="DC/AC")}),                                                                 Diagram( graphics={Rectangle(
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
                textString="DC Link Variables")}),
          Documentation(info="<html>
<p>The AC2DCandDC2AC component represents the power electronics component of the variable speed drive.
The model provides an interface between two terminals. Terminal pin p is related to the grid bus side and terminal pin n is related to the 
motor terminal bus. The model is an average representation of the switching components of a real variable speed drive, thus being ideal for long simulation durations on phasor dynamic simulations.</p>
<p>The model has one input and one output connectors. The m_input input connector represents the pwn modulation index, while the Vc output connector represents the capacitor voltage value used in the controller logic block.</p>
<p>The modelling of such devices is based, mainly, on the following reference:</p>
<ul>
<li>Panasetsky: Variable Speed Drive Modeling\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[Panasetsky2016]</a>,</li>
</ul>
</html>"));
      end AC2DCandDC2AC;
      annotation (Documentation(info="<html>
<p>This package contains the power electronics component of the variable speed drive model.</p>
</html>"));
    end PowerElectronics;

    package ControllerLogic "Controller logic for variable speed drive"
      extends Modelica.Icons.Package;
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

         parameter Modelica.Units.SI.Frequency f_max = 80 "Maximum input voltage frequency" annotation (Dialog(group="VSD project specifics"));
         parameter Modelica.Units.SI.Frequency f_min = 40 "Minimum input voltage frequency" annotation (Dialog(group="VSD project specifics"));
         parameter Real m0= 0.1 "Initial PWM Modulation Value" annotation (Dialog(group="VSD project specifics"));

        Modelica.Blocks.Interfaces.RealInput motor_speed "Motor speed from motor model" annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={-120,70}),iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=180,
              origin={120,40})));
        OpenIPSL.NonElectrical.Continuous.SimpleLag Speed_Sensor(K=1, T=Tr,
          y_start=0.1*1.9*Modelica.Constants.pi*SysData.fn)
          annotation (Placement(transformation(extent={{-38,-22},{-18,-2}})));
        parameter OpenIPSL.Types.Time Tr=0.01 "Time constant for speed sensor filter"
          annotation (Dialog(group="Control Parameters"));
        Modelica.Blocks.Math.Add add(k1=-1)
          annotation (Placement(transformation(extent={{-82,-78},{-62,-58}})));
        Modelica.Blocks.Nonlinear.Limiter limiter(uMax=we_max, uMin=we_min)
          annotation (Placement(transformation(extent={{60,-50},{80,-30}})));
        Modelica.Blocks.Math.Gain gain(k=Kp)
          annotation (Placement(transformation(extent={{-48,-60},{-28,-40}})));
        Modelica.Blocks.Continuous.Integrator integrator(k=Ki,
          initType=Modelica.Blocks.Types.Init.InitialState,
          y_start=0)
          annotation (Placement(transformation(extent={{-48,-92},{-28,-72}})));
        Modelica.Blocks.Math.Add add1(k1=+1)
          annotation (Placement(transformation(extent={{-14,-76},{6,-56}})));
        Modelica.Blocks.Math.Add add2(k1=+1)
          annotation (Placement(transformation(extent={{18,-50},{38,-30}})));
        Modelica.Blocks.Interfaces.RealOutput we(start=0.01*2*Modelica.Constants.pi*
              SysData.fn)
                     "Synchronous speed"
          annotation (Placement(transformation(extent={{100,-60},{140,-20}}),
              iconTransformation(extent={{100,-60},{140,-20}})));
        Modelica.Blocks.Math.Gain gain1(k=1)
          annotation (Placement(transformation(extent={{10,-10},{-10,10}},
              rotation=0,
              origin={70,10})));
        Modelica.Blocks.Interfaces.RealOutput m "PWM modulation index"
          annotation (Placement(transformation(extent={{-20,-20},{20,20}},
              rotation=90,
              origin={60,120}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=90,
              origin={60,120})));
          Real Kf= 1/(2*pi*fn) "Gain value multiplied with input signal"
          annotation (Dialog(group="Control Parameters"));
        parameter Real Kp=5 "PI proportional gain"
          annotation (Dialog(group="Control Parameters"));
        parameter Real Ki=0.1 "PI integrator gain"
          annotation (Dialog(group="Control Parameters"));
        parameter Real we_max=2*pi*f_max "Maximum Synchronous Speed"
          annotation (Dialog(group="Control Parameters"));
        parameter Real we_min=2*pi*f_min "Minimum Synchronous Speed"
          annotation (Dialog(group="Control Parameters"));
        Modelica.Blocks.Interfaces.RealInput Vc "Capacitor voltage value" annotation (Placement(transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={-60,120}), iconTransformation(
              extent={{-20,-20},{20,20}},
              origin={-60,120},
              rotation=270)));
        Modelica.Blocks.Interfaces.RealInput W_ref "Synchronous speed reference"
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}}),
              iconTransformation(extent={{-140,-20},{-100,20}})));
        Modelica.Blocks.Nonlinear.Limiter limiter1(uMax=1, uMin=0) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={18,40})));
        Modelica.Blocks.Math.Gain gain2(k=1/V_b)
          annotation (Placement(transformation(extent={{-32,70},{-12,90}})));
        Modelica.Blocks.Sources.RealExpression realExpression(y=Kf)
          annotation (Placement(transformation(extent={{-72,36},{-52,56}})));
        Modelica.Blocks.Math.Product product1
          annotation (Placement(transformation(extent={{-30,30},{-10,50}})));
        Modelica.Blocks.Continuous.FirstOrder firstOrder(
          T=0.01,
          initType=Modelica.Blocks.Types.Init.InitialState,
          y_start=m0)
          annotation (Placement(transformation(extent={{46,30},{66,50}})));
      equation
        connect(motor_speed, Speed_Sensor.u) annotation (Line(points={{-120,70},{-84,70},
                {-84,-12},{-40,-12}},color={0,0,127}));
        connect(Speed_Sensor.y, add.u1) annotation (Line(points={{-17,-12},{-12,-12},{
                -12,-34},{-88,-34},{-88,-62},{-84,-62}},
                                 color={0,0,127}));
        connect(add.y, gain.u) annotation (Line(points={{-61,-68},{-56,-68},{-56,-50},
                {-50,-50}},
                     color={0,0,127}));
        connect(integrator.u, gain.u) annotation (Line(points={{-50,-82},{-56,-82},{-56,
                -50},{-50,-50}},
                             color={0,0,127}));
        connect(gain.y, add1.u1) annotation (Line(points={{-27,-50},{-24,-50},{-24,-60},
                {-16,-60}},
                       color={0,0,127}));
        connect(integrator.y, add1.u2) annotation (Line(points={{-27,-82},{-24,-82},{-24,
                -72},{-16,-72}},color={0,0,127}));
        connect(add2.u1, Speed_Sensor.y)
          annotation (Line(points={{16,-34},{-12,-34},{-12,-12},{-17,-12}},
                                                      color={0,0,127}));
        connect(add.u2, W_ref) annotation (Line(points={{-84,-74},{-94,-74},{-94,0},{-120,
                0}},         color={0,0,127}));
        connect(Vc, gain2.u) annotation (Line(points={{-60,120},{-60,80},{-34,80}},
                                        color={0,0,127}));
        connect(gain1.u, we) annotation (Line(points={{82,10},{94,10},{94,-40},{120,-40}},
                                                                 color={0,0,
                127}));
        connect(add1.y, add2.u2) annotation (Line(points={{7,-66},{16,-66},{16,-46}},
                                   color={0,0,127}));
        connect(add2.y, limiter.u)
          annotation (Line(points={{39,-40},{58,-40}}, color={0,0,127}));
        connect(limiter.y, we) annotation (Line(points={{81,-40},{120,-40}},
                             color={0,0,127}));
        connect(integrator.u, add.y) annotation (Line(points={{-50,-82},{-56,-82},{-56,
                -68},{-61,-68}}, color={0,0,127}));
        connect(realExpression.y, product1.u1)
          annotation (Line(points={{-51,46},{-32,46}}, color={0,0,127}));
        connect(gain1.y, product1.u2) annotation (Line(points={{59,10},{-32,10},{-32,34}},
                           color={0,0,127}));
        connect(limiter1.y, firstOrder.u) annotation (Line(points={{29,40},{44,40}},
                                 color={0,0,127}));
        connect(firstOrder.y, m) annotation (Line(points={{67,40},{72,40},{72,96},{60,
                96},{60,120}}, color={0,0,127}));
        connect(product1.y, limiter1.u) annotation (Line(points={{-9,40},{6,40}},
                              color={0,0,127}));
        annotation (preferredView = "info", Icon(                                         graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={28,108,200}),        Text(
                extent={{-80,80},{80,-80}},
                lineColor={28,108,200},
                textString="V/f
Control")}),
          Documentation(info="<html>
<p>The VoltsHertzController component represents the controller logic for the variable speed drive. The volts hertz control is a simple and widely used method for controlling the speed of an AC induction motor by adjusting the voltage and frequency supplied to the motor at a constant ratio.</p>
<p>The model has three inputs and two output connectors. The W_ref input connector represents the reference synchronous speed that is user defined,
motor_speed input is the motor speed that is generated by the motor model, and the Vc input is the capacitor voltage value from the AC2DCandDC2AC component.
The m output is the PWM modulation index, and the we output is the synchronous speed that is used in the controllable motor model.</p>
<p>The modelling of such devices is based, mainly, on the following reference:</p>
<ul>
<li>Panasetsky: Variable Speed Drive Modeling\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[Panasetsky2016]</a>,</li>
</ul>
</html>"));
      end VoltsHertzController;
      annotation (Documentation(info="<html>
<p>This package contains the controlling logic of the variable speed drive model.</p>
</html>"));
    end ControllerLogic;
    annotation (Documentation(info="<html>
<p>
This package contains components that model a variable speed drive.
</p>
<p>The modelling of such devices is based, mainly, on the following reference:</p>
<ul>
<li>Panasetsky: Variable Speed Drive Modeling\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[Panasetsky2016]</a>,</li>
</ul>
</html>"));
  end Generic;
end VSD;
