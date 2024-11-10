within OpenIPSL.Electrical.Controls.PSSE.TG.BaseClasses.WEHGOV;
model Turbine "WEHGOV turbine dynamics"
  parameter Types.ApparentPower S_b=100e6 "System base";
  parameter Types.ApparentPower M_b=100e6 "System base";
  parameter Types.PerUnit G1=0 "Gate position 1 ";
  parameter Types.PerUnit G2=0.25 "Gate position 2 ";
  parameter Types.PerUnit FLWG1=0 "Water flow rate 1 ";
  parameter Types.PerUnit FLWG2=0.25 "Water flow rate 2 ";
  parameter Types.Time TW=0.2 "Water time constant";
  parameter Types.PerUnit FLWP1=0 "Water flow rate 1 ";
  parameter Types.PerUnit FLWP2=0.2 "Water flow rate 2 ";
  parameter Types.PerUnit FLWP3=0.23 "Water flow rate 3 ";
  parameter Types.PerUnit FLWP4=0.4 "Water flow rate 4 ";
  parameter Types.PerUnit FLWP5=0.6 "Water flow rate 5 ";
  parameter Types.PerUnit FLWP6=0.8 "Water flow rate 6 ";
  parameter Types.PerUnit Pmech1=0 "Mechanical power 1 ";
  parameter Types.PerUnit Pmech2=0 "Water flow rate 2 ";
  parameter Types.PerUnit Pmech3=0.05 "Water flow rate 3 ";
  parameter Types.PerUnit Pmech4=0.35 "Water flow rate 4 ";
  parameter Types.PerUnit Pmech5=0.66 "Water flow rate 5 ";
  parameter Types.PerUnit Pmech6=0.82 "Water flow rate 6 ";
  parameter Types.PerUnit D_TURB=0 "Turbine damping";

  Modelica.Blocks.Interfaces.RealInput Gate_Position( start=sG)
    annotation (Placement(transformation(extent={{-140,50},{-100,90}}),
        iconTransformation(extent={{-140,60},{-100,100}})));
  Modelica.Blocks.Tables.CombiTable1Ds Lookup_Gate_Flow(table=[G1,FLWG1; G2,
        FLWG2], smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Math.Division division annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,50})));
  Modelica.Blocks.Math.Product product1 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,-22})));
  Modelica.Blocks.Math.Add add(k1=-1)
    annotation (Placement(transformation(extent={{-20,-70},{0,-50}})));
  Modelica.Blocks.Sources.Constant Turbine_Head_ref(k=1)
    annotation (Placement(transformation(extent={{-60,-76},{-40,-56}})));
  Modelica.Blocks.Continuous.Integrator integrator(k=1/TW,  initType=
        Modelica.Blocks.Types.Init.InitialOutput,
    y_start=f0)
    annotation (Placement(transformation(extent={{20,-70},{40,-50}})));
  Modelica.Blocks.Tables.CombiTable1Ds Lookup_Flow_Pmech(table=[FLWP1,Pmech1;
        FLWP2,Pmech2; FLWP3,Pmech3; FLWP4,Pmech4; FLWP5,Pmech5; FLWP6,Pmech6],
      smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments)
    annotation (Placement(transformation(extent={{80,-70},{100,-50}})));
  Modelica.Blocks.Math.Product product2
    annotation (Placement(transformation(extent={{120,-72},{140,-52}})));
  Modelica.Blocks.Math.Add add1(k1=-1)
    annotation (Placement(transformation(extent={{156,-72},{176,-52}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH
    annotation (Placement(transformation(extent={{200,-10},{220,10}}),
        iconTransformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealInput SPEED annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={150,120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={80,120})));
  Modelica.Blocks.Math.Gain gain1(k=D_TURB) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={150,70})));
  Modelica.Blocks.Math.Product product3 annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={150,18})));

  Modelica.Blocks.Interfaces.RealInput PMECH0
    annotation (Placement(transformation(extent={{-140,-100},{-100,-60}})));
protected
  parameter Types.PerUnit Pmech0(fixed = false);
  parameter Types.PerUnit f0(fixed=false);
  parameter Types.PerUnit p0(fixed=false);
  parameter Types.PerUnit sG(fixed=false);

initial equation
  Pmech0 = PMECH0;
  p0 = Pmech0;

  // Equations with 5 points
//   sG = (if f0 > FLWG4 then ((f0-FLWG4)*(1-G4)/(1-FLWG4) + G4)
//  elseif
//        f0 <= FLWG4 and f0 > FLWG3 then ((f0-FLWG3)*(G4-G3)/(FLWG4-FLWG3) + G3)
//  elseif
//        f0 <= FLWG2 then ((f0*G2)/FLWG2)
//  else
//      (f0-FLWG2)*(G3-G2)/(FLWG3-FLWG2) + G2);

  sG = (f0-FLWG1)*(G2-G1)/(FLWG2-FLWG1) + G1;

  // Equations with 10 points
//   f0 = (if p0 > Pmech9 then ((p0-Pmech9)*(1-FLWP9)/(Pmech10-Pmech9) + FLWP9)
//  elseif
//        p0 <= Pmech9 and p0 > Pmech8 then ((p0-Pmech8)*(FLWP9-FLWP8)/(Pmech9-Pmech8) + FLWP8)
//  elseif
//        p0 <= Pmech8 and p0 > Pmech7 then ((p0-Pmech7)*(FLWP8-FLWP7)/(Pmech8-Pmech7) + FLWP7)
//  elseif
//        p0 <= Pmech7 and p0 > Pmech6 then ((p0-Pmech6)*(FLWP7-FLWP6)/(Pmech7-Pmech6) + FLWP6)
//  elseif
//        p0 <= Pmech6 and p0 > Pmech5 then ((p0-Pmech5)*(FLWP6-FLWP5)/(Pmech6-Pmech5) + FLWP5)
//  elseif
//        p0 <= Pmech5 and p0 > Pmech4 then ((p0-Pmech4)*(FLWP5-FLWP4)/(Pmech5-Pmech4) + FLWP4)
//  elseif
//        p0 <= Pmech4 and p0 > Pmech3 then ((p0-Pmech3)*(FLWP4-FLWP3)/(Pmech4-Pmech3) + FLWP3)
//  elseif
//        p0 <= Pmech2 then ((p0*FLWP2)/Pmech2)
//  else
//      (p0-Pmech2)*(FLWP3-FLWP2)/(Pmech3-Pmech2) + FLWP2);

  f0 = (if p0 <= Pmech6 and p0 > Pmech5 then ((p0-Pmech5)*(FLWP6-FLWP5)/(Pmech6-Pmech5) + FLWP5)
 elseif
       p0 <= Pmech5 and p0 > Pmech4 then ((p0-Pmech4)*(FLWP5-FLWP4)/(Pmech5-Pmech4) + FLWP4)
 elseif
       p0 <= Pmech4 and p0 > Pmech3 then ((p0-Pmech3)*(FLWP4-FLWP3)/(Pmech4-Pmech3) + FLWP3)
 elseif
       p0 <= Pmech2 then ((p0-Pmech1)*(FLWP2-FLWP1)/(Pmech2-Pmech1) + FLWP1)
 else
     (p0-Pmech2)*(FLWP3-FLWP2)/(Pmech3-Pmech2) + FLWP2);

equation
  connect(Gate_Position, Lookup_Gate_Flow.u)
    annotation (Line(points={{-120,70},{-82,70}}, color={0,0,127}));
  connect(product1.y, add.u1) annotation (Line(points={{-30,-33},{-30,-54},
          {-22,-54}}, color={0,0,127}));
  connect(Turbine_Head_ref.y, add.u2)
    annotation (Line(points={{-39,-66},{-22,-66}}, color={0,0,127}));
  connect(add.y, integrator.u)
    annotation (Line(points={{1,-60},{18,-60}}, color={0,0,127}));
  connect(Lookup_Flow_Pmech.y[1], product2.u1) annotation (Line(points={{101,-60},
          {110,-60},{110,-56},{118,-56}}, color={0,0,127}));
  connect(product2.u2, add.u1) annotation (Line(points={{118,-68},{110,-68},
          {110,-90},{-72,-90},{-72,-40},{-30,-40},{-30,-54},{-22,-54}},
        color={0,0,127}));
  connect(add1.y, PMECH) annotation (Line(points={{177,-62},{190,-62},{190,
          0},{210,0}}, color={0,0,127}));
  connect(product2.y, add1.u2) annotation (Line(points={{141,-62},{146,-62},
          {146,-68},{154,-68}}, color={0,0,127}));
  connect(SPEED, gain1.u)
    annotation (Line(points={{150,120},{150,82}}, color={0,0,127}));
  connect(gain1.y, product3.u1) annotation (Line(points={{150,59},{150,36},
          {156,36},{156,30}}, color={0,0,127}));
  connect(product3.u2, Lookup_Gate_Flow.u) annotation (Line(points={{144,30},{144,
          40},{88,40},{88,94},{-88,94},{-88,70},{-82,70}}, color={0,0,127}));
  connect(product3.y, add1.u1) annotation (Line(points={{150,7},{150,-50},{
          148,-50},{148,-56},{154,-56}}, color={0,0,127}));
  connect(division.y, product1.u2) annotation (Line(points={{-30,39},{-30,-2},{-36,
          -2},{-36,-10}}, color={0,0,127}));
  connect(product1.u1, product1.u2) annotation (Line(points={{-24,-10},{-24,-2},
          {-36,-2},{-36,-10}}, color={0,0,127}));
  connect(Lookup_Gate_Flow.y[1], division.u2)
    annotation (Line(points={{-59,70},{-36,70},{-36,62}}, color={0,0,127}));
  connect(integrator.y, Lookup_Flow_Pmech.u)
    annotation (Line(points={{41,-60},{78,-60}}, color={0,0,127}));
  connect(division.u1, Lookup_Flow_Pmech.u) annotation (Line(points={{-24,62},{-24,
          70},{60,70},{60,-60},{78,-60}}, color={0,0,127}));
  annotation (Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                      lineColor={28,108,200}), Text(
          extent={{-84,32},{90,-24}},
          textColor={28,108,200},
          textString="Turbine")}), Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>WEHGOV turbine dynamics (PSS/E Manual)</p></td>
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
end Turbine;
