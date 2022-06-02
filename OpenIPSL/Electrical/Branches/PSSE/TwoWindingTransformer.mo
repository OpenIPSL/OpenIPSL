within OpenIPSL.Electrical.Branches.PSSE;
model TwoWindingTransformer
  "Static Two-winding transformer according to PSS/E, without phase shift"
  outer OpenIPSL.Electrical.SystemBase SysData;
  import Modelica.ComplexMath.j;
  import Modelica.ComplexMath.conj;
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  OpenIPSL.Interfaces.PwPin n annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  parameter Types.ApparentPower S_b=SysData.S_b "System base power"
    annotation (Dialog(enable=false));
  parameter Integer CZ=1 "Impedance I/O code" annotation (Dialog(tab=
          "Transformer impedance data"), choices(
      choice=1 "Z pu (winding kV system MVA)",
      choice=2 "Z pu (winding kV winding MVA)",
      choice=3 "Load loss (W) & |Z| [pu]"));
  parameter Types.PerUnit R "Specified R"
    annotation (Dialog(tab="Transformer impedance data"));
  parameter Types.PerUnit X "Specified X"
    annotation (Dialog(tab="Transformer impedance data"));
  parameter Types.PerUnit G "Magnetizing G"
    annotation (Dialog(tab="Transformer impedance data"));
  parameter Types.PerUnit B "Magnetizing B"
    annotation (Dialog(tab="Transformer impedance data"));
  parameter Integer CW=1 "Winding I/O code" annotation (Dialog(tab=
          "Transformer Nominal Ratings Data"), choices(
      choice=1 "Turns ratio (pu on bus base)",
      choice=2 "Winding voltage",
      choice=3 "Turns ratio (pu on nom winding)"));
  parameter Types.PerUnit t1=1 "Ratio of winding 1"
    annotation (Dialog(tab="Transformer Nominal Ratings Data"));
  parameter Types.Voltage VNOM1=0 "Nominal voltage of winding 1"
    annotation (Dialog(tab="Transformer Nominal Ratings Data"));
  parameter Types.Voltage VB1=300e3 "Bus base voltage of winding 1"
    annotation (Dialog(tab="Transformer Nominal Ratings Data"));
  parameter Types.PerUnit t2=1 "Tap ratio of winding 2"
    annotation (Dialog(tab="Transformer Nominal Ratings Data"));
  parameter Types.Voltage VNOM2=0 "Nominal Voltage of winding 2"
    annotation (Dialog(tab="Transformer Nominal Ratings Data"));
  parameter Types.Voltage VB2=300e3 "Bus base voltage of winding 2"
    annotation (Dialog(tab="Transformer Nominal Ratings Data"));
  parameter Types.Angle ANG1=0 "Winding (1-2) Angle"
    annotation (Dialog(tab="Transformer Nominal Ratings Data"));
  parameter Types.ApparentPower S_n=S_b "Nominal power of the winding"
    annotation (Dialog(tab="Transformer Nominal Ratings Data"));
protected
  parameter Types.Voltage VNOM1_int=if abs(VNOM1) < Modelica.Constants.eps then VB1
       else VNOM1;
  parameter Types.Voltage VNOM2_int=if abs(VNOM2) < Modelica.Constants.eps then VB2
       else VNOM2;
  parameter Types.PerUnit r=if CZ == 1 then R else R*S_b/S_n;
  parameter Types.PerUnit x=if CZ == 1 then X else X*S_b/S_n;
  parameter Complex t=T1/T2*(cos(ANG1) + j*sin(ANG1));
  parameter Types.PerUnit T2=if CW == 1 then t2 elseif CW == 3 then t2*(VNOM2_int/VB2)
       else t2/VB2;
  parameter Types.PerUnit T1=if CW == 1 then t1 elseif CW == 3 then t1*(VNOM1_int/VB1)
       else t1/VB1;
  parameter Complex Ym(re=G, im=B);
  parameter Complex xeq(re=r*abs(T2)^2, im=x*abs(T2)^2);
  Complex ei(re=p.vr, im=p.vi);
  Complex ej(re=n.vr, im=n.vi);
  Complex ii(re=p.ir, im=p.ii);
  Complex ij(re=n.ir, im=n.ii);
equation
  ej = ei/t + xeq*ij;
  (ii - ei*Ym)*conj(t) = -ij;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false),
        graphics={ Ellipse(extent={{-70,40},{10,-40}},
          lineColor={28,108,200}),Ellipse(extent={{-10,40},{70,-40}}, lineColor=
           {28,108,200}),Line(points={{-100,0},{-70,0}}, color={28,108,200}),
                                           Line(points={{70,0},{100,0}},color={
          28,108,200}),Polygon(
          points={{-84,6},{-70,0},{-84,-8},{-84,6}},
          lineColor={28,108,200},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-80,100},{80,40}},
          lineColor={0,0,255},
          textString="%name")}));
end TwoWindingTransformer;
