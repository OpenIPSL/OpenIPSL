within OpenIPSL.Electrical.Controls.PSSE.COMP;
model IEEEVC "Voltage Regulator Current Compensating Model"
  import Modelica.ComplexMath.j;
  import 'abs' =
         Modelica.ComplexMath.abs;
  parameter Types.PerUnit RC;
  parameter Types.PerUnit XC;
  OpenIPSL.Interfaces.PwPin Gen_terminal annotation (Placement(transformation(
          extent={{-80,60},{-60,80}}),     iconTransformation(extent={{-80,60},{
            -60,80}})));
  OpenIPSL.Interfaces.PwPin Bus annotation (Placement(transformation(extent={{60,60},
            {80,80}}),            iconTransformation(extent={{60,60},{80,80}})));
  Modelica.Blocks.Interfaces.RealOutput VCT annotation (Placement(
        transformation(extent={{100,-16},{132,16}}),iconTransformation(extent={{100,-16},
            {132,16}})));
protected
  Complex V_T;
  Complex I_T;
equation
  VCT = 'abs'(V_T + (RC + j*XC)*I_T);
  V_T = Gen_terminal.vr + j*Gen_terminal.vi;
  I_T = Gen_terminal.ir + j*Gen_terminal.ii;
  connect(Gen_terminal,Bus)  annotation (Line(points={{-70,70},{70,70}},
                 color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),    graphics={Rectangle(extent={{-100,100},{100,-100}},
            lineColor={28,108,200}), Text(
          extent={{-54,36},{68,-36}},
          textColor={28,108,200},
          textString="IEEEVC")}),                                Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
        Documentation(info="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>Voltage Regulator Current Compensating Model (PSS/E Manual)</p></td>
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
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"),
    conversion(noneFromVersion=""));
end IEEEVC;
