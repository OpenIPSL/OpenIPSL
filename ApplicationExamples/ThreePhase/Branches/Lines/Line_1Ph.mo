within ThreePhase.Branches.Lines;
model Line_1Ph "Modeled as a PI element"

  outer OpenIPSL.Electrical.SystemBase SysData;

  OpenIPSL.Interfaces.PwPin Ain
    annotation (Placement(transformation(extent={{-140,-10},{-120,10}})));

  OpenIPSL.Interfaces.PwPin Aout
    annotation (Placement(transformation(extent={{120,-10},{140,10}})));

  parameter Real S = SysData.S_b "Nominal Power (MVA)" annotation (Dialog(group="Power flow data"));
  parameter Real f = SysData.fn "System Frequency" annotation (Dialog(group="Power flow data"));

  parameter Real Gser = 0 "in p.u."
                                     annotation (Dialog(group="Power flow data"));
  parameter Real Bser = -10 "in p.u."
                                       annotation (Dialog(group="Power flow data"));
  parameter Real Bsht = 0 "in p.u."
                                     annotation (Dialog(group="Power flow data"));

protected
    parameter Real zero = 1e-6;

    //Writing the Y_ser matrix for the pi model  
    parameter Real[2,2] Y_ser=[Gser,-Bser; Bser,Gser];

    //Writing the Y_sht matrix for the pi model
    parameter Real[2,2] Y_sht=[zero,-Bsht; Bsht,zero];

    //Calculating the parameters for the Transformer
    //Writing the matrix A (Yser1+Yshtk)
    parameter Real[2,2] A = Y_ser+Y_sht;

    //Writing the matrix B (-Yser1)
    parameter Real[2,2] B = -Y_ser;

  // Writing matrix for voltages (in and out)
  Real [2,1]Vin = [Ain.vr;Ain.vi];
  Real [2,1]Vout = [Aout.vr;Aout.vi]; 
  // Writing matrix for currents (in and out)
  Real [2,1]Iin = [Ain.ir;Ain.ii]; 
  Real [2,1]Iout = [Aout.ir;Aout.ii]; 

equation
  // Equations according to pi model
  Iin =  A*Vin+B*Vout;  
  Iout =  B*Vin+A*Vout;
  
  annotation (
    Icon(coordinateSystem(
        extent={{-140,-100},{140,100}},
        preserveAspectRatio=true,
        initialScale=0.1), graphics={Rectangle(
          extent={{-140,-100},{140,100}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
          Line(points = {{-90,0}, {-30, 0}}, color = {0, 0, 255}),
          Line(points = {{-30,0}, {-30, 20}, {30, 20}, {30, -20}, {-30, -20}, {-30, 0}}, color = {0, 0, 255}),
          Line(points = {{90,0}, {30, 0}}, color = {0, 0, 255}),
          Line(points = {{-60,0}, {-60, -20}}, color = {0, 0, 255}),
          Line(points = {{-80,-20},{-40,-20},{-40,-55},{-80,-55},{-80,-20}}, color = {0, 0, 255}),
          Line(points = {{60,0}, {60, -20}}, color = {0, 0, 255}), 
          Line(points = {{80,-20},{40,-20},{40,-55},{80,-55},{80,-20}}, color = {0, 0, 255}),
          Line(points = {{-60,-55}, {-60, -70}}, color = {0, 0, 255}), 
          Line(points = {{-45,-70}, {-75, -70}}, color = {0, 0, 255}),
          Line(points = {{-50,-72.5}, {-70, -72.5}}, color = {0, 0, 255}),
          Line(points = {{-55,-75}, {-65, -75}}, color = {0, 0, 255}),                     
          Line(points = {{60,-55}, {60, -70}}, color = {0, 0, 255}),
          Line(points = {{45,-70}, {75, -70}}, color = {0, 0, 255}),
          Line(points = {{50,-72.5}, {70, -72.5}}, color = {0, 0, 255}),
          Line(points = {{55,-75}, {65, -75}}, color = {0, 0, 255}),          
          Line(points = {{-90,0}, {-130, 0}}, color = {0, 0, 255}),        
          Line(points = {{90,0}, {130, 0}}, color = {0, 0, 255}),
          Text(lineColor = {28, 108, 200}, extent = {{-29, -18}, {20,18}}, textString = "G +jB  "), 
          Text(lineColor = {28, 108, 200}, extent = {{-15, 5}, {-5,13}}, textString = "ser"),
          Text(lineColor = {28, 108, 200}, extent = {{19, 5}, {29,13}}, textString = "ser"),
          Text(lineColor = {28, 108, 200}, extent = {{-75, -28}, {-55,-47}}, textString = "jB"), 
          Text(lineColor = {28, 108, 200}, extent = {{-56, -25}, {-46,-33}}, textString = "sht"),
          Text(lineColor = {28, 108, 200}, extent = {{65, -28}, {45, -47}}, textString = "jB"), 
          Text(lineColor = {28, 108, 200}, extent = {{64, -25}, {74, -33}}, textString = "sht"), 
          Text(lineColor = {28, 108, 200}, extent = {{-65, 55}, {65, 85}}, textString = "PI MODEL")                  
          }),
    Diagram(coordinateSystem(
        extent={{-140,-100},{140,100}},
        preserveAspectRatio=true,
        initialScale=0.1)),
    uses(Modelica(version="3.2.1")),
    Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>"));
end Line_1Ph;