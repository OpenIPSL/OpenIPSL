within OpenIPSL.Electrical.GFCs.GFMs.REGFMA1.BasicComponentsAndCntrlSchemes.Base;
partial model QVdrpCntrlSchemeBase
  "Partial/Base model of the Q-v droop control scheme without Qmax/Qmin limits"
  import Modelica;
  QVdrp qv_drp1(k=mq)
    annotation (Placement(transformation(extent={{-60,-40},{0,40}})));
  LPFilter Qfilt(Tr=Tr, y0val=Q0)
    annotation (Placement(transformation(extent={{-180,-170},{-160,-150}})));
  Modelica.Blocks.Interfaces.RealInput Qmeas
    "Value of the reactive power measurement"
    annotation (Placement(transformation(extent={{-240,-180},{-200,-140}})));
  parameter Real Tr=0.01 "Filter time constant. Range: [0.01 - 0.1 sec.]";

  Modelica.Blocks.Interfaces.RealInput Vref "Voltage mangitude reference"
    annotation (Placement(transformation(extent={{-240,80},{-200,120}})));
  Modelica.Blocks.Nonlinear.Limiter Elims(uMax=EMax, uMin=EMin)
    "Limiters for Edroop"
    annotation (Placement(transformation(extent={{40,-120},{60,-100}})));
  parameter Real EMax=1.15 "Max. Edroop";
  parameter Real EMin=0 "Min. Edroop";
  Modelica.Blocks.Sources.BooleanConstant QVFlag_val(k=QVFlag_val_k)
    "QVFlag = true/false switches the Qref input. QVFlag = 0 = false, Qref = Qfilt = Qinv. QVFlag = 1 = true, Qref = 0."
    annotation (Placement(transformation(extent={{-200,-10},{-180,10}})));
  Modelica.Blocks.Logical.Switch QVFlag_switch
    "QVFlag = true/false switches the Qref input. QVFlag = 0 = false, Qref = Qfilt = Qinv. QVFlag = 1 = true, Qref = 0."
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Sources.Constant Qref0(k=0)
    "Reactive power Qref set to zero when QVFlag = 1" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-190,50})));
  Modelica.Blocks.Logical.Switch VFlag_switch
    "VFlag is used to change the voltage control mode" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={160,0})));
  Modelica.Blocks.Sources.BooleanConstant VFlag_val(k=VFlag_val_k)
    "VFlag = true/false switches the voltage control mode"
    annotation (Placement(transformation(extent={{40,-20},{80,20}})));
  Modelica.Blocks.Interfaces.RealOutput Edroop(start=E0)
    "Internal voltage magnitude modulation specified by the droop controller"
    annotation (Placement(transformation(extent={{200,-10},{220,10}})));
  Modelica.Blocks.Nonlinear.Limiter ElimsPID(uMax=EMax, uMin=EMin,
    homotopyType=Modelica.Blocks.Types.LimiterHomotopy.Linear)
    "Limiters for Edroop used by the PID"
    annotation (Placement(transformation(extent={{160,140},{180,160}})));
  Modelica.Blocks.Math.Gain kpvGain(k=kpv)
    "Proportional gain of the voltage controller"
    annotation (Placement(transformation(extent={{80,146},{100,166}})));

  parameter Boolean QVFlag_val_k=true
    "QVFlag = true/false switches the Qref input. QVFlag = 0 = false, Qref = Qfilt = Qinv. QVFlag = 1 = true, Qref = 0.";
  parameter Boolean VFlag_val_k=true
    "VFlag = true/false switches the voltage control mode. VFlag = 0 = false, E limited. VFlag = 1 = true, PI with E limited.";
  Modelica.Blocks.Interfaces.RealInput Vmeas
    "Value of the terminal voltage measurement"
    annotation (Placement(transformation(extent={{-240,140},{-200,180}})));
  LPFilter Vfilt(Tr=Tr, y0val=V0) "Filtered voltage measurement"
    annotation (Placement(transformation(extent={{-160,150},{-140,170}})));

  Modelica.Blocks.Math.Feedback sum_Vcmd_Vinv "Vcmd-Vinv" annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={40,140})));
  parameter Real kpv=0.01 "Proportional gain of the voltage controller";
  Modelica.Blocks.Continuous.LimIntegrator kivInt(
    k=kiv,
    outMax=EMax,
    outMin=EMin,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    limitsAtInit=false,
    y_start=E0)
    annotation (Placement(transformation(extent={{80,100},{100,120}})));
  parameter Real kiv=5.86 "Integral grain of the voltage controller";
  Modelica.Blocks.Math.Add sum_PI "PI controller summing junction" annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={130,150})));

  Modelica.Blocks.Interfaces.RealInput Qout0
    "Initial value of the reactive power" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-80,-220})));
  Modelica.Blocks.Interfaces.RealInput Emag0
    "Initial value of the internal angle from the voltage source" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={80,-220})));

public
  Modelica.Blocks.Interfaces.RealInput Vt0
    "Initial value of the terminal voltage" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={0,220})));
  parameter Real mq=0.05 "Q-V droop gain. Range: [0-0.20] pu";

protected
  parameter Real Q0(fixed=false);
  parameter Real E0(fixed=false);
  parameter Real V0(fixed=false);

initial equation
    Q0 = Qout0 "Assign the value coming from the voltage source to the inital value of PQ0 used by the filter block";
    E0 = Emag0 "Assign the value of the internal voltage magnitude of the voltage source";
    V0 = Vt0 "Assign the value coming from the voltage source to the initial value of V0 used by the filter block";
equation
  connect(Qfilt.y, qv_drp1.Qfilt) annotation (Line(points={{-159,-160},{-152,-160},
          {-152,-100},{-80,-100},{-80,-24},{-66,-24}},
                               color={0,0,127}));
  connect(Qfilt.u, Qmeas) annotation (Line(points={{-182,-160},{-220,-160}},
                       color={0,0,127}));
  connect(qv_drp1.Vref, Vref) annotation (Line(points={{-66,24},{-94,24},{-94,100},
          {-220,100}},color={0,0,127}));
  connect(QVFlag_val.y, QVFlag_switch.u2)
    annotation (Line(points={{-179,0},{-144,0}}, color={255,0,255}));
  connect(QVFlag_switch.u1, Qref0.y) annotation (Line(points={{-144,16},{-174,16},
          {-174,50},{-179,50}}, color={0,0,127}));
  connect(QVFlag_switch.y, qv_drp1.Qref)
    annotation (Line(points={{-98,0},{-66,0}}, color={0,0,127}));
  connect(QVFlag_switch.u3, Qfilt.y) annotation (Line(points={{-144,-16},{-152,-16},
          {-152,-160},{-159,-160}}, color={0,0,127}));
  connect(VFlag_switch.y, Edroop) annotation (Line(points={{182,0},{186,0},{186,
          0},{210,0}}, color={0,0,127}));
  connect(qv_drp1.Vout_qv_droop, Elims.u) annotation (Line(points={{3,0},{20,0},
          {20,-110},{38,-110}}, color={0,0,127}));
  connect(Elims.y, VFlag_switch.u3) annotation (Line(points={{61,-110},{100,-110},
          {100,-16},{136,-16}}, color={0,0,127}));
  connect(VFlag_val.y, VFlag_switch.u2) annotation (Line(points={{82,0},{136,0}},
                            color={255,0,255}));
  connect(ElimsPID.y, VFlag_switch.u1) annotation (Line(points={{181,150},{192,150},
          {192,80},{100,80},{100,16},{136,16}}, color={0,0,127}));
  connect(Vmeas, Vfilt.u)
    annotation (Line(points={{-220,160},{-162,160}}, color={0,0,127}));
  connect(sum_Vcmd_Vinv.u1, qv_drp1.Vout_qv_droop) annotation (Line(points={{32,140},
          {20,140},{20,0},{3,0}},      color={0,0,127}));
  connect(Vfilt.y, sum_Vcmd_Vinv.u2) annotation (Line(points={{-139,160},{40,160},
          {40,148}},                   color={0,0,127}));
  connect(sum_Vcmd_Vinv.y, kpvGain.u)
    annotation (Line(points={{49,140},{60,140},{60,156},{78,156}},
                                                 color={0,0,127}));
  connect(kpvGain.y, sum_PI.u2) annotation (Line(points={{101,156},{118,156}},
                           color={0,0,127}));
  connect(ElimsPID.u, sum_PI.y)
    annotation (Line(points={{158,150},{141,150}}, color={0,0,127}));
  connect(kivInt.y, sum_PI.u1) annotation (Line(points={{101,110},{108,110},{108,
          144},{118,144}}, color={0,0,127}));
  connect(kivInt.u, sum_Vcmd_Vinv.y) annotation (Line(points={{78,110},{60,110},
          {60,140},{49,140}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false,
        extent={{-200,-200},{200,200}},
        initialScale=0.5), graphics={
                            Text(
          extent={{-98,98},{102,-4}},
          textColor={28,108,200},
          textString="Q-v Drp"),
        Rectangle(
          extent={{-200,200},{200,-200}},
          lineColor={28,108,200},
          lineThickness=0.5)}),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false,
        extent={{-200,-200},{200,200}},
        initialScale=0.5), graphics={
        Text(
          extent={{-162,62},{-82,36}},
          textColor={28,108,200},
          textString="u2 = true
QVFlag = 1 
Set --> Qref = 0"),
        Text(
          extent={{-160,-26},{-70,-54}},
          textColor={28,108,200},
          textString="u2 = false
QVFlag = 0 
Set --> Qref = Qinv"),
        Text(
          extent={{116,66},{196,40}},
          textColor={28,108,200},
          textString="u2 = true
VFlag = 1 
Set --> PI with Limiter"),
        Text(
          extent={{114,-34},{194,-60}},
          textColor={28,108,200},
          textString="u2 = false
VFlag = 0 
Set --> E Limited"),
        Polygon(
          points={{-30,-57},{-35,-77},{-25,-77},{-30,-57}},
          lineColor={238,46,47},
          fillColor={255,49,52},
          fillPattern=FillPattern.Solid,
          lineThickness=1)}),
    Documentation(info="<html>
This is a partial model (or base model) that is extended to implement the Q-f droop scheme variants.
It contains the basic droop function and the reactive power measurement filter. 
A red triangle indicates the input for the signal of the reactive power limiter.

</html>"));
end QVdrpCntrlSchemeBase;
