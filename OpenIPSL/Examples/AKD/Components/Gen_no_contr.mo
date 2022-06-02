within OpenIPSL.Examples.AKD.Components;
model Gen_no_contr "Generation unit with only a machine model"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  parameter Types.ApparentPower M_b "Machine base power"
    annotation (Dialog(group="Power flow data"));
  parameter Types.Time Tpd0 "d-axis transient open-circuit time constant"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.Time Tppd0 "d-axis sub-transient open-circuit time constant"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.Time Tppq0 "q-axis transient open-circuit time constant"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.Time H "Inertia constant"
    annotation (Dialog(group="Machine parameters"));
  parameter Real D "Speed damping"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Xd "d-axis reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Xq "q-axis reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Xpd "d-axis transient reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Xppd "d-axis sub-transient reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit Xl "leakage reactance"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit S10 "Saturation factor at 1.0 pu"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit S12 "Saturation factor at 1.2 pu"
    annotation (Dialog(group="Machine parameters"));
  parameter Types.PerUnit R_a=0 "Armature resistance"
    annotation (Dialog(group="Machine parameters"));
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    V_b=V_b,
    v_0=v_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    M_b=M_b,
    Tpd0=Tpd0,
    Tppd0=Tppd0,
    Tppq0=Tppq0,
    H=H,
    D=D,
    Xd=Xd,
    Xq=Xq,
    Xpd=Xpd,
    Xppd=Xppd,
    Xppq=Xppd,
    Xl=Xl,
    S10=S10,
    S12=S12,
    R_a=R_a) annotation (Placement(transformation(extent={{14,-20},{53,20}})));
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={
            {80,-10},{100,10}}), iconTransformation(extent={{60,-10},{80,10}})));
equation
  connect(gENSAL.PMECH0, gENSAL.PMECH) annotation (Line(points={{54.95,10},{60,10},
          {60,30},{0,30},{0,12},{10.1,12}}, color={0,0,127}));
  connect(gENSAL.EFD0, gENSAL.EFD) annotation (Line(points={{54.95,-10},{60,-10},
          {60,-30},{0,-30},{0,-12},{10.1,-12}}, color={0,0,127}));
  connect(gENSAL.p, pwPin)
    annotation (Line(points={{53,0},{90,0}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics={Ellipse(extent={{-60,60},{60,-60}}, lineColor={0,
          0,255}),Text(
          extent={{-34,24},{32,-28}},
          lineColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="GEN")}),
    Documentation(info="<html>
<p>This generation unit model allows for instantiantions with different parameter sets. The model is composed by:</p>
<ul>
<li><strong>Machine model</strong>: GENSAL, a salient pole synchronous generator model.</li>
</ul>
</html>"));
end Gen_no_contr;
