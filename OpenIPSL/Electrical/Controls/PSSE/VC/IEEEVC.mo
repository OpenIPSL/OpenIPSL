within OpenIPSL.Electrical.Controls.PSSE.VC;
model IEEEVC
  import      Modelica.Units.SI;
  import Modelica.ComplexMath.j;
  import 'abs' =
         Modelica.ComplexMath.abs;
  parameter SI.PerUnit RC;
  parameter SI.PerUnit XC;
  OpenIPSL.Interfaces.PwPin Gen_terminal annotation (Placement(transformation(
          extent={{-90,50},{-70,70}}),     iconTransformation(extent={{-90,50},{
            -70,70}})));
  OpenIPSL.Interfaces.PwPin Bus annotation (Placement(transformation(extent={{50,50},
            {70,70}}),            iconTransformation(extent={{50,50},{70,70}})));
  Modelica.Blocks.Interfaces.RealOutput VCT annotation (Placement(
        transformation(extent={{80,-16},{112,16}}), iconTransformation(extent={{
            80,-16},{112,16}})));
protected
  Complex V_T;
  Complex I_T;
equation
  VCT = 'abs'(V_T + (RC + j*XC)*I_T);
  V_T = Gen_terminal.vr + j*Gen_terminal.vi;
  I_T = Gen_terminal.ir + j*Gen_terminal.ii;
  connect(Gen_terminal,Bus)  annotation (Line(points={{-80,60},{60,60}},
                 color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -60},{80,80}})),                                     Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-60},{80,80}})),
    experiment(
      Interval=0.0001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    conversion(noneFromVersion=""));
end IEEEVC;
