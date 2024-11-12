within OpenIPSL.Electrical.Controls.PSSE.ES;
model AC8B "AC8B Excitation System [IEEE2005]"
  import OpenIPSL.NonElectrical.Functions.SE;
  import OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.invFEX;
  extends OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.BaseExciter;
  parameter Types.Time T_R "Filter time constant ";
  parameter Types.PerUnit K_PR "Voltage regulator proportional gain";
  parameter Types.PerUnit K_IR "Voltage regulator integral gain";
  parameter Types.PerUnit K_DR "Voltage regulator derivative gain";
  parameter Types.Time T_DR "Regulator derivative block time constant ";
  parameter Types.PerUnit VPID_MAX "PID maximum limit";
  parameter Types.PerUnit VPID_MIN "PID minimum limit";
  parameter Types.PerUnit K_A "Voltage regulator gain";
  parameter Types.Time T_A "Voltage regulator time constant ";
  parameter Types.PerUnit V_RMAX "Maximum voltage regulator output";
  parameter Types.PerUnit V_RMIN "Minimum voltage regulator output";
  parameter Types.Time T_E "Exciter time constant, integration rate associated with exciter
  control ";
  parameter Types.PerUnit K_C "Rectifier loading factor proportional to commutating reactance";
  parameter Types.PerUnit K_D "Demagnetizing factor, a function of exciter alternator
  reactances";
  parameter Types.PerUnit K_E "Exciter constant related to self-excited field";
  parameter Types.PerUnit E_1 "Exciter alternator output voltages back of commutating reactance
  at which saturation is defined";
  parameter Types.PerUnit S_EE_1 "Exciter saturation function value at the corresponding exciter
  voltage, E1, back of commutating reactance";
  parameter Types.PerUnit E_2 "Exciter alternator output voltages back of commutating
  reactance at which saturation is defined";
  parameter Types.PerUnit S_EE_2 "Exciter saturation function value at the correspponding exciter
  voltage, E2, back of commutating reactance";
  parameter Types.PerUnit VFE_MAX "Exciter field current limit reference";
  parameter Types.PerUnit VE_MIN "Minimum exciter voltage output";

  OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.RotatingExciterWithDemagnetizationVarLim
    rotatingExciterWithDemagnetizationVarLim(
    T_E=T_E,
    K_E=K_E,
    E_1=E_1,
    E_2=E_2,
    S_EE_1=S_EE_1,
    S_EE_2=S_EE_2,
    Efd0=VE0,
    K_D=K_D)
    annotation (Placement(transformation(extent={{-8,-66},{36,-22}})));
  Modelica.Blocks.Sources.Constant lowLim(k=VE_MIN)
    annotation (Placement(transformation(extent={{100,-34},{80,-14}})));
  Modelica.Blocks.Sources.Constant FEMAX(k=VFE_MAX)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={100,50})));
  Modelica.Blocks.Math.Add DiffV2(k2=-K_D)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,50})));
  OpenIPSL.NonElectrical.Functions.ImSE
                               se1(
    SE1=S_EE_1,
    SE2=S_EE_2,
    E1=E_1,
    E2=E_2) annotation (Placement(transformation(
        extent={{-9,-6},{9,6}},
        rotation=180,
        origin={147,4})));
  Modelica.Blocks.Sources.Constant const(k=K_E)
    annotation (Placement(transformation(extent={{180,20},{160,40}})));
  Modelica.Blocks.Math.Add DiffV3
    annotation (Placement(transformation(extent={{120,0},{100,20}})));
  NonElectrical.Nonlinear.Div0block
                                div0block
                                         annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={10,10})));
  Modelica.Blocks.Interfaces.RealInput XADIFD "Field current" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={140,-184}),iconTransformation(extent={{-120,-80},{-100,-60}})));
  NonElectrical.Continuous.PID_No_Windup pID_No_Windup(
    K_P=K_PR,
    K_I=K_IR,
    K_D=K_DR,
    T_D=T_DR,
    V_RMAX=VPID_MAX,
    V_RMIN=VPID_MIN,
    y_start_int=y_start_int)
    annotation (Placement(transformation(extent={{-90,92},{-48,124}})));

  OpenIPSL.NonElectrical.Continuous.SimpleLag
                                     TransducerDelay(
    K=1,
    T=T_R,
    y_start=ECOMP0)
    annotation (Placement(transformation(extent={{-164,-10},{-144,10}})));
  Modelica.Blocks.Math.Add3 VS annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-138,-72})));
  Modelica.Blocks.Math.Add DiffV1(k2=+1)
    annotation (Placement(transformation(extent={{-120,-60},{-100,-40}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=K_A,
    T=T_A,
    y_start=VR0,
    outMax=V_RMAX,
    outMin=V_RMIN)
    annotation (Placement(transformation(extent={{-34,98},{-14,118}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses.RectifierCommutationVoltageDrop
    rectifierCommutationVoltageDrop(K_C=K_C)
    annotation (Placement(transformation(extent={{88,-86},{122,-52}})));

protected
  parameter Real VR0(fixed=false);
  parameter Real Ifd0(fixed=false);
  parameter Real VE0(fixed=false);
  parameter Real VFE0(fixed=false);
  parameter Real Efd0(fixed=false);
  parameter Real y_start_int(fixed=false);

initial equation
  // Finding initial value of excitation voltage, VE0, via going through conditions of FEX function
  VE0 = invFEX(
    K_C=K_C,
    Efd0=Efd0,
    Ifd0=Ifd0);
  // Case IN>0 not checked because it will be resolved in the next iteration
  VFE0 = VE0*(SE(
    VE0,
    S_EE_1,
    S_EE_2,
    E_1,
    E_2) + K_E) + Ifd0*K_D;
  VR0 = VFE0;
  V_REF = ECOMP;
  y_start_int = VR0/K_A;
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
          -69},{86.3,-70},{58,-70},{58,-44},{38.75,-44}}, color={0,0,
          127}));
  connect(FEMAX.y,DiffV2. u1) annotation (Line(points={{89,50},{76,50},{76,44},{
          62,44}}, color={0,0,127}));
  connect(DiffV3.u1,const. y) annotation (Line(points={{122,16},{144,16},{144,30},
          {159,30}}, color={0,0,127}));
  connect(DiffV3.u2,se1. VE_OUT) annotation (Line(points={{122,4},{137.46,4}},
                                  color={0,0,127}));
  connect(rotatingExciterWithDemagnetizationVarLim.I_C, simpleLagLim.y)
    annotation (Line(points={{-10.75,-44},{-48,-44},{-48,54},{-8,54},{-8,108},{-13,
          108}}, color={0,0,127}));
  connect(VUEL, VS.u2) annotation (Line(points={{-130,-200},{-130,-106},{-138,-106},
          {-138,-84}}, color={0,0,127}));
  connect(VOEL, VS.u3) annotation (Line(points={{-70,-200},{-70,-168},{-120,-168},
          {-120,-96},{-130,-96},{-130,-84}}, color={0,0,127}));
  connect(DiffV.y, DiffV1.u1) annotation (Line(points={{-99,0},{-94,0},{-94,-24},
          {-130,-24},{-130,-44},{-122,-44}}, color={0,0,127}));
  connect(VS.y, DiffV1.u2) annotation (Line(points={{-138,-61},{-138,-56},{-122,
          -56}}, color={0,0,127}));
  connect(div0block.y, rotatingExciterWithDemagnetizationVarLim.outMax)
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
  connect(DiffV1.y, pID_No_Windup.u) annotation (Line(points={{-99,-50},{-80,-50},
          {-80,40},{-108,40},{-108,108},{-94.2,108}}, color={0,0,127}));
  connect(pID_No_Windup.y, simpleLagLim.u)
    annotation (Line(points={{-45.9,108},{-36,108}}, color={0,0,127}));
  connect(DiffV2.y, div0block.u1) annotation (Line(points={{39,50},{32,50},{32,16},
          {22,16}}, color={0,0,127}));
  connect(DiffV3.y, div0block.u2)
    annotation (Line(points={{99,10},{30,10},{30,4},{22,4}}, color={0,0,127}));
  annotation ( Icon(
        graphics={Text(
          extent={{-42,152},{36,82}},
          lineColor={28,108,200},
          textString="AC8B")}),
        Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>IEEE 421.5 2005 AC8B Excitation System (PSS/E Manual)</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2024-10-05</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Giuseppe Laera, ALSETLab, RPI Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end AC8B;
