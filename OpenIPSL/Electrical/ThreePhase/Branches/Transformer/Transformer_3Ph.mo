within OpenIPSL.Electrical.ThreePhase.Branches.Transformer;
model Transformer_3Ph "Three Phase transformer modeled as a PI-equivalent device"
  extends ThreePhaseComponent;

  import OpenIPSL.Electrical.ThreePhase.Branches.Transformer.TransfConnection.Yg_Yg;
  import OpenIPSL.Electrical.ThreePhase.Branches.Transformer.TransfConnection.D_D;
  import OpenIPSL.Electrical.ThreePhase.Branches.Transformer.TransfConnection.Y_Y;
  import OpenIPSL.Electrical.ThreePhase.Branches.Transformer.TransfConnection.D_Yg;
  import OpenIPSL.Electrical.ThreePhase.Branches.Transformer.TransfConnection.Yg_D;
  import OpenIPSL.Electrical.ThreePhase.Branches.Transformer.TransfConnection.D_Y;
  import OpenIPSL.Electrical.ThreePhase.Branches.Transformer.TransfConnection.Y_D;
  import OpenIPSL.Electrical.ThreePhase.Branches.Transformer.TransfConnection.Y_Yg;
  import OpenIPSL.Electrical.ThreePhase.Branches.Transformer.TransfConnection.Yg_Y;

  OpenIPSL.Interfaces.PwPin Ain
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  OpenIPSL.Interfaces.PwPin Bin
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  OpenIPSL.Interfaces.PwPin Cin
    annotation (Placement(transformation(extent={{-100,-100},{-80,-80}})));
  OpenIPSL.Interfaces.PwPin Aout
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
  OpenIPSL.Interfaces.PwPin Bout
    annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  OpenIPSL.Interfaces.PwPin Cout
    annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  parameter Integer Connection=0
    "0 Yg-Yg; 1 D-D; 2 Y-Y; 3 D-Yg; 4 Yg-D; 5 D-Y; 6 Y-D; 7 Y-Yg; 8 Yg-Y;"
    annotation (choices(
      choice=0 "Yg-Yg",
      choice=1 "D-D",
      choice=2 "Y-Y",
      choice=3 "D-Yg",
      choice=4 "Yg-D",
      choice=5 "D-Y",
      choice=6 "Y-D",
      choice=7 "Y-Yg",
      choice=8 "Yg-Y"));
  parameter Real tap=1 "Nominal tap ratio (Vs/Vp)"
    annotation (Dialog(group="Transformer parameters"));
  parameter Types.PerUnit X=0.001 "Leakage reactance"
    annotation (Dialog(group="Transformer parameters"));
  parameter Types.PerUnit R=0.1 "Windings copper resistance"
    annotation (Dialog(group="Transformer parameters"));
protected
  function ConnectionType
    input Integer Connection;
    input Real X, R, tap;
    output Real[12, 12] PiEquations;
  algorithm
    if Connection == 0 then
      PiEquations := Yg_Yg(
          X,
          R,
          tap);
    elseif Connection == 1 then
      PiEquations := D_D(
          X,
          R,
          tap);
    elseif Connection == 2 then
      PiEquations := Y_Y(
          X,
          R,
          tap);
    elseif Connection == 3 then
      PiEquations := D_Yg(
          X,
          R,
          tap);
    elseif Connection == 4 then
      PiEquations := Yg_D(
          X,
          R,
          tap);
    elseif Connection == 5 then
      PiEquations := D_Y(
          X,
          R,
          tap);
    elseif Connection == 6 then
      PiEquations := Y_D(
          X,
          R,
          tap);
    elseif Connection == 7 then
      PiEquations := Y_Yg(
          X,
          R,
          tap);
    elseif Connection == 8 then
      PiEquations := Yg_Y(
          X,
          R,
          tap);
    end if;
  end ConnectionType;

  // Getting pi model matrix for Yg_Yg connection
  parameter Real[12, 12] OperPI=ConnectionType(
      Connection,
      X,
      R,
      tap);
  parameter Real[6, 6] Amat=OperPI[1:6, 1:6];
  parameter Real[6, 6] Bmat=OperPI[1:6, 7:12];
  parameter Real[6, 6] Cmat=OperPI[7:12, 1:6];
  parameter Real[6, 6] Dmat=OperPI[7:12, 7:12];

  // Writing matrix for voltages (in and out)
  Real[6, 1] Vin=[Ain.vr; Ain.vi; Bin.vr; Bin.vi; Cin.vr; Cin.vi];
  Real[6, 1] Vout=[Aout.vr; Aout.vi; Bout.vr; Bout.vi; Cout.vr; Cout.vi];
  // Writing matrix for currents (in and out)
  Real[6, 1] Iin=[Ain.ir; Ain.ii; Bin.ir; Bin.ii; Cin.ir; Cin.ii];
  Real[6, 1] Iout=[Aout.ir; Aout.ii; Bout.ir; Bout.ii; Cout.ir; Cout.ii];

equation
  // Equations according to pi model
  Iin = Amat*Vin + Bmat*Vout;
  Iout = Cmat*Vin + Dmat*Vout;

  annotation (
    Icon(graphics={Ellipse(
          lineColor={0,0,255},
          extent={{-46,30},{8,-30}},
          endAngle=360),Ellipse(
          lineColor={0,0,255},
          extent={{-8,30},{46,-30}},
          endAngle=360),Line(points={{100,0},{46,0}}, color={0,0,255}),Line(
          points={{-100,0},{-46,0}}, color={0,0,255}),Line(points={{-60,90},{-39,
          20}}, color={0,0,255}),Line(points={{-60,90},{-90,90}}, color={0,0,
          255}),Line(points={{60,90},{39,20}}, color={0,0,255}),Line(points={{
          60,90},{90,90}}, color={0,0,255}),Line(points={{-60,-90},{-39,-20}},
          color={0,0,255}),Line(points={{-60,-90},{-90,-90}}, color={0,0,255}),
          Line(points={{60,-90},{39,-20}}, color={0,0,255}),Line(points={{60,-90},
          {90,-90}}, color={0,0,255}),Text(
          textColor={28,108,200},
          extent={{-38,20},{-4,-20}},
          textString="K"),Text(
          origin={6,0},
          textColor={28,108,200},
          extent={{1,20},{35,-20}},
          textString="M"),Text(
          origin={-54,84},
          textColor={28,108,200},
          extent={{4,18},{104,-34}},
          textString="Three Phase Transformer")}, coordinateSystem),
    Documentation(info="<html>
<p>This model was design to represent three-phase two-winding transformer.</p>
<p>The user should input the copper resistance <strong>R</strong> and leakage reactance <strong>X</strong> in per unit values.
The user should also input the tap value, which is the relation between primary and secondary voltage levels, but in per unit.
Finally, the user should select the transformer three-phase connection.</p>
<p>Based on this set of parameters, the pi-equivalent impedance matrices are calculated and the transformer equation is assembled.
The transformer does not take into account excitation branch, since it is often neglected in transient-stability studies.</p>
<p>Primary side is represented by pins <strong><em>Ain</em></strong>, <strong><em>Bin</em></strong>, and <strong><em>Cin</em></strong>.
Secondary side is represented by pins <strong><em>Aout</em></strong>, <strong><em>Bout</em></strong>, and <strong><em>Cout</em></strong></p>
</html>"));
end Transformer_3Ph;
