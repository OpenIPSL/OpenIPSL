within OpenIPSL.Electrical.Controls.VariableSpeedDrive.ControllerLogic;
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
