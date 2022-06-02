within OpenIPSL.Electrical.Controls.PSSE.ES.BaseClasses;
partial model BaseExciter "Base exciter model for PSSE excitation systems"
  Modelica.Blocks.Interfaces.RealInput VUEL annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-130,-200}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,-110})));
  Modelica.Blocks.Interfaces.RealInput VOEL annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-70,-200}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-110})));
  Modelica.Blocks.Interfaces.RealOutput EFD "Excitation Voltage [pu]"
    annotation (Placement(transformation(extent={{200,-10},{220,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput EFD0 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        origin={-200,-130}), iconTransformation(extent={{-10,-10},{10,10}},
          origin={-110,-40})));
  Modelica.Blocks.Interfaces.RealInput VOTHSG annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        origin={-200,90}), iconTransformation(extent={{-10,-10},{10,10}},
          origin={-110,40})));
  Modelica.Blocks.Interfaces.RealInput ECOMP annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        origin={-200,0}), iconTransformation(extent={{-10,-10},{10,10}}, origin={-110,0})));
  Modelica.Blocks.Sources.Constant VoltageReference(k=V_REF)
    annotation (Placement(transformation(extent={{-170,40},{-150,60}})));
  Modelica.Blocks.Math.Add DiffV(k2=-1)
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
protected
  parameter Real Efd0(fixed=false);
  parameter Real V_REF(fixed=false);
  parameter Real ECOMP0(fixed=false);
public
  Modelica.Blocks.Interfaces.RealInput XADIFD annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={80,-200}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,-110})));
initial equation
  Efd0 = EFD0;
  ECOMP0 = ECOMP;
equation
  connect(VoltageReference.y, DiffV.u1) annotation (Line(points={{-149,50},{-132,
          50},{-132,6},{-122,6}}, color={0,0,127}));
  annotation (
    Icon(
        graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255}), Text(
          extent={{-56,-80},{-24,-100}},
          lineColor={28,108,200},
          textString="VUEL"),Text(
          extent={{-14,-80},{14,-100}},
          lineColor={28,108,200},
          textString="VOEL"),Text(
          extent={{-90,10},{-20,-10}},
          lineColor={28,108,200},
          textString="ECOMP"),Text(
          extent={{-90,50},{-20,28}},
          lineColor={28,108,200},
          textString="VOTHSG"),Text(
          extent={{-90,-30},{-40,-52}},
          lineColor={28,108,200},
          textString="EFD0"),Text(
          extent={{50,10},{90,-10}},
          lineColor={28,108,200},
          textString="EFD"), Text(
          extent={{60,-80},{100,-100}},
          lineColor={28,108,200},
          textString="XADIFD")}),
    Diagram(coordinateSystem(extent={{-200,-200},{200,160}})));
end BaseExciter;
