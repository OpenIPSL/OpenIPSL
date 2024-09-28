within OpenIPSL.Electrical.Controls.PSSE.ES;
model AC8B
  import OpenIPSL.NonElectrical.Functions.SE;
  import OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.invFEX;
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  import Modelica.Units.SI;
  parameter Real TR "Filter time constant (s)";
  parameter Real KPR "Voltage regulator proportional gain (pu)";
  parameter Real KIR "Voltage regulator integral gain (pu)";
  parameter Real KDR "Voltage regulator derivative gain (pu)";
  parameter Real TDR "Lag time constant (pu)";
  parameter Real VPIDMAX "PID maximum limit (pu)";
  parameter Real VPIDMIN "PID minimum limit (pu)";
  parameter Real KA "Voltage regulator gain (pu)";
  parameter Real TA "Voltage regulator time constant (s)";
  parameter Real VRMAX "Maximum voltage regulator output (pu)";
  parameter Real VRMIN "Minimum voltage regulator output (pu)";
  parameter Real TE "Exciter time constant, integration rate associated with exciter
  control (s)";
  parameter Real KC "Rectifier loading factor proportional to commutating reactance (pu)";
  parameter Real KD "Demagnetizing factor, a function of exciter alternator
  reactances (pu)";
  parameter Real KE "Exciter constant related to self-excited field (pu)";
  parameter Real E1 "Exciter alternator output voltages back of commutating reactance 
  at which saturation is defined (pu)";
  parameter Real SE1 "Exciter saturation function value at the corresponding exciter
  voltage, E1, back of commutating reactance (pu)";
  parameter Real E2 "Exciter alternator output voltages back of commutating
  reactance at which saturation is defined (pu)";
  parameter Real SE2 "Exciter saturation function value at the correspponding exciter
  voltage, E2, back of commutating reactance (pu)";
  parameter Real VFEMAX "Exciter field current limit reference (pu)";
  parameter Real VEMIN "Minimum exciter voltage output (pu)";

  OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.RotatingExciterWithDemagnetizationVarLim
    rotatingExciterWithDemagnetizationVarLim(
    T_E=TE,
    K_E=KE,
    E_1=E1,
    E_2=E2,
    S_EE_1=SE1,
    S_EE_2=SE2,
    Efd0=VE0,
    K_D=KD)
    annotation (Placement(transformation(extent={{-8,-66},{36,-22}})));
  Modelica.Blocks.Sources.Constant lowLim(k=VEMIN)
    annotation (Placement(transformation(extent={{100,-34},{80,-14}})));
  Modelica.Blocks.Sources.Constant FEMAX(k=VFEMAX)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={100,50})));
  Modelica.Blocks.Math.Add DiffV2(k2=-KD)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,50})));
  OpenIPSL.NonElectrical.Functions.ImSE
                               se1(
    SE1=SE1,
    SE2=SE2,
    E1=E1,
    E2=E2) annotation (Placement(transformation(
        extent={{-9,-6},{9,6}},
        rotation=180,
        origin={147,4})));
  Modelica.Blocks.Sources.Constant const(k=KE)
    annotation (Placement(transformation(extent={{180,20},{160,40}})));
  Modelica.Blocks.Math.Add DiffV3
    annotation (Placement(transformation(extent={{120,0},{100,20}})));
  Modelica.Blocks.Math.Division division annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={10,10})));
  Modelica.Blocks.Interfaces.RealInput XADIFD "Field current" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={140,-184}),iconTransformation(extent={{-120,-80},{-100,-60}})));
  NonElectrical.Continuous.PID_No_Windup_AC8B pID_No_Windup_AC8B(
    K_P=KPR,
    K_I=KIR,
    K_D=KDR,
    T_D=TDR,
    V_RMAX=VPIDMAX,
    V_RMIN=VPIDMIN,
    VPID0=VPID0)
    annotation (Placement(transformation(extent={{-80,98},{-58,114}})));
protected
  parameter Real VPID0(fixed=false);
  parameter Real VR0(fixed=false);
  parameter Real Ifd0(fixed=false);
  parameter Real VE0(fixed=false);
  parameter Real VFE0(fixed=false);
  parameter Real Efd0(fixed=false);

  OpenIPSL.NonElectrical.Continuous.SimpleLag
                                     TransducerDelay(
    K=1,
    T=TR,
    y_start=ECOMP0)
    annotation (Placement(transformation(extent={{-164,-10},{-144,10}})));
  Modelica.Blocks.Math.Add3 VS annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-138,-72})));
  Modelica.Blocks.Math.Add DiffV1(k2=+1)
    annotation (Placement(transformation(extent={{-120,-60},{-100,-40}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=KA,
    T=TA,
    y_start=VR0,
    outMax=VRMAX,
    outMin=VRMIN)
    annotation (Placement(transformation(extent={{-38,98},{-18,118}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.RectifierCommutationVoltageDrop
    rectifierCommutationVoltageDrop(K_C=KC)
    annotation (Placement(transformation(extent={{88,-86},{122,-52}})));
initial equation
  // Finding initial value of excitation voltage, VE0, via going through conditions of FEX function
  VE0 = invFEX(
    K_C=KC,
    Efd0=Efd0,
    Ifd0=Ifd0);
  // Case IN>0 not checked because it will be resolved in the next iteration
  VFE0 = VE0*(SE(
    VE0,
    SE1,
    SE2,
    E1,
    E2) + KE) + Ifd0*KD;
  VR0 = VFE0;
  V_REF = ECOMP;
  VPID0 = VR0/KA;
  Ifd0 = XADIFD;
equation
  connect(TransducerDelay.u, ECOMP) annotation (Line(points={{-166,0},{-180,0},{
          -180,0},{-200,0}}, color={0,0,127}));
  connect(DiffV.u2, TransducerDelay.y) annotation (Line(points={{-122,-6},{-132,
          -6},{-132,0},{-143,0}}, color={0,0,127}));
  connect(VOTHSG, VS.u1) annotation (Line(points={{-200,90},{-176,90},{-176,-92},
          {-146,-92},{-146,-84}},
                       color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.EFD, EFD) annotation (Line(points={{123.7,
          -69},{198,-69},{198,0},{210,0}}, color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.V_EX,
    rotatingExciterWithDemagnetizationVarLim.EFD) annotation (Line(points={{86.3,
          -69},{86.3,-70},{58,-70},{58,-44},{38.75,-44}},     color={0,0,
          127}));
  connect(FEMAX.y,DiffV2. u1) annotation (Line(points={{89,50},{76,50},{76,44},{
          62,44}},        color={0,0,127}));
  connect(DiffV3.u1,const. y) annotation (Line(points={{122,16},{144,16},{144,30},
          {159,30}},       color={0,0,127}));
  connect(DiffV3.u2,se1. VE_OUT) annotation (Line(points={{122,4},{137.46,4}},
                                  color={0,0,127}));
  connect(rotatingExciterWithDemagnetizationVarLim.I_C, simpleLagLim.y)
    annotation (Line(points={{-10.75,-44},{-48,-44},{-48,54},{-8,54},{-8,108},{-17,
          108}},             color={0,0,127}));
  connect(VUEL, VS.u2) annotation (Line(points={{-130,-200},{-130,-106},{-138,-106},
          {-138,-84}}, color={0,0,127}));
  connect(VOEL, VS.u3) annotation (Line(points={{-70,-200},{-70,-168},{-120,-168},
          {-120,-96},{-130,-96},{-130,-84}}, color={0,0,127}));
  connect(DiffV.y, DiffV1.u1) annotation (Line(points={{-99,0},{-94,0},{-94,-24},
          {-130,-24},{-130,-44},{-122,-44}}, color={0,0,127}));
  connect(VS.y, DiffV1.u2) annotation (Line(points={{-138,-61},{-138,-56},{-122,
          -56}}, color={0,0,127}));
  connect(division.y, rotatingExciterWithDemagnetizationVarLim.outMax)
    annotation (Line(points={{-1,10},{-20,10},{-20,-27.5},{-10.75,-27.5}},
        color={0,0,127}));
  connect(rotatingExciterWithDemagnetizationVarLim.outMin, lowLim.y)
    annotation (Line(points={{38.75,-27.5},{58.375,-27.5},{58.375,-24},{79,-24}},
        color={0,0,127}));
  connect(XADIFD, DiffV2.u2) annotation (Line(points={{140,-184},{140,-140},{-34,
          -140},{-34,40},{20,40},{20,72},{70,72},{70,56},{62,56}}, color={0,0,127}));
  connect(rotatingExciterWithDemagnetizationVarLim.XADIFD, DiffV2.u2)
    annotation (Line(points={{14,-68.75},{14,-140},{-34,-140},{-34,40},{20,40},{
          20,72},{70,72},{70,56},{62,56}}, color={0,0,127}));
  connect(rectifierCommutationVoltageDrop.XADIFD, DiffV2.u2) annotation (Line(
        points={{105,-87.7},{104,-140},{-34,-140},{-34,40},{20,40},{20,72},{70,72},
          {70,56},{62,56}}, color={0,0,127}));
  connect(se1.VE_IN, rotatingExciterWithDemagnetizationVarLim.EFD) annotation (
      Line(points={{156.9,4},{168,4},{168,-44},{38.75,-44}}, color={0,0,127}));
  connect(DiffV1.y, pID_No_Windup_AC8B.u) annotation (Line(points={{-99,-50},{-88,
          -50},{-88,108},{-82,108}}, color={0,0,127}));
  connect(pID_No_Windup_AC8B.y, simpleLagLim.u)
    annotation (Line(points={{-57,108},{-40,108}}, color={0,0,127}));
  connect(DiffV2.y, division.u1) annotation (Line(points={{39,50},{32,50},{32,16},
          {22,16}}, color={0,0,127}));
  connect(DiffV3.y, division.u2)
    annotation (Line(points={{99,10},{30,10},{30,4},{22,4}}, color={0,0,127}));
  annotation (                                                                Icon(
        graphics={Text(
          extent={{-40,104},{38,34}},
          lineColor={28,108,200},
          textString="AC8B")}),
    conversion(noneFromVersion=""));
end AC8B;
