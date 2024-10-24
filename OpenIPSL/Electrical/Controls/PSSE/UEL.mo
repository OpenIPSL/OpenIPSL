within OpenIPSL.Electrical.Controls.PSSE;
package UEL
  model MNLEX2 "Minimum Excitation Limiter"
    parameter OpenIPSL.Types.PerUnit K_F2=0.1 "Rate feedback gain";
    parameter OpenIPSL.Types.Time T_F2=1 "Rate feedback time constant (>0)";
    parameter OpenIPSL.Types.PerUnit K_M=0.3 "MEL gain";
    parameter OpenIPSL.Types.Time T_M=0.5 "MEL time constant";
    parameter OpenIPSL.Types.PerUnit MEL_MAX=0.1 "Maximum limiter output";
    parameter OpenIPSL.Types.PerUnit Q_0=2.5 "Reactive power circle center in PQ plane (pu on machine base)";
    parameter OpenIPSL.Types.PerUnit Radius=3 "Reactive power circle radius in PQ plane (pu on machine base)";
    Modelica.Blocks.Interfaces.RealInput QELEC
      annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
    Modelica.Blocks.Interfaces.RealInput Eterm
      annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
    Modelica.Blocks.Interfaces.RealInput PELEC
      annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
    Modelica.Blocks.Math.Add add(k1=-1)
      annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
    Modelica.Blocks.Math.Product product1
      annotation (Placement(transformation(extent={{-80,50},{-60,70}})));
    Modelica.Blocks.Math.Gain gain(k=Q_0)
      annotation (Placement(transformation(extent={{-46,50},{-26,70}})));
    Modelica.Blocks.Math.Product product2
      annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
    Modelica.Blocks.Math.Add3 add3_1(k1=-1)
      annotation (Placement(transformation(extent={{20,-10},{40,10}})));
    Modelica.Blocks.Math.Gain gain1(k=Radius)
      annotation (Placement(transformation(extent={{-16,80},{4,100}})));
    Modelica.Blocks.Math.Product product3
      annotation (Placement(transformation(extent={{20,80},{40,100}})));
    Modelica.Blocks.Math.Product product4
      annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
    Modelica.Blocks.Math.Feedback feedback
      annotation (Placement(transformation(extent={{50,-10},{70,10}})));
    NonElectrical.Continuous.First_Order_Lag_Non_Windup_MNLEX2
                               first_Order_Lag_Non_Windup_MNLEX2_1(
                                                          K_I=K_M, T_I=T_M)
      annotation (Placement(transformation(extent={{102,-10},{122,10}})));
    Modelica.Blocks.Sources.Constant const(k=MEL_MAX)
      annotation (Placement(transformation(extent={{144,20},{124,40}})));
    Modelica.Blocks.Sources.Constant const1(k=0)
      annotation (Placement(transformation(extent={{80,-40},{100,-20}})));
    Modelica.Blocks.Interfaces.RealOutput VUEL
      annotation (Placement(transformation(extent={{160,-10},{180,10}})));
    NonElectrical.Continuous.Washout      washout(K_I=K_F2, T_I=T_F2)
      annotation (Placement(transformation(extent={{120,-80},{100,-60}})));
  equation
    connect(Eterm, product1.u1)
      annotation (Line(points={{-120,60},{-88,60},{-88,66},{-82,66}}, color={0,0,127}));
    connect(Eterm, product1.u2)
      annotation (Line(points={{-120,60},{-88,60},{-88,54},{-82,54}}, color={0,0,127}));
    connect(QELEC, add.u2)
      annotation (Line(points={{-120,0},{-70,0},{-70,-6},{-62,-6}}, color={0,0,127}));
    connect(product1.y, gain.u) annotation (Line(points={{-59,60},{-48,60}}, color={0,0,127}));
    connect(gain.y, add.u1) annotation (Line(points={{-25,60},{-20,60},{-20,28},{-68,28},{-68,6},{-62,
            6}}, color={0,0,127}));
    connect(add.y, product2.u1)
      annotation (Line(points={{-39,0},{-28,0},{-28,6},{-22,6}}, color={0,0,127}));
    connect(product2.u2, add.y)
      annotation (Line(points={{-22,-6},{-28,-6},{-28,0},{-39,0}}, color={0,0,127}));
    connect(product2.y, add3_1.u2)
      annotation (Line(points={{1,0},{12,0},{12,0},{18,0}}, color={0,0,127}));
    connect(gain1.u, product1.y)
      annotation (Line(points={{-18,90},{-54,90},{-54,60},{-59,60}}, color={0,0,127}));
    connect(gain1.y, product3.u1)
      annotation (Line(points={{5,90},{10,90},{10,96},{18,96}}, color={0,0,127}));
    connect(product3.u2, product3.u1)
      annotation (Line(points={{18,84},{10,84},{10,96},{18,96}}, color={0,0,127}));
    connect(product3.y, add3_1.u1)
      annotation (Line(points={{41,90},{44,90},{44,60},{12,60},{12,8},{18,8}}, color={0,0,127}));
    connect(product4.y, add3_1.u3)
      annotation (Line(points={{-59,-60},{12,-60},{12,-8},{18,-8}}, color={0,0,127}));
    connect(PELEC, product4.u1)
      annotation (Line(points={{-120,-60},{-88,-60},{-88,-54},{-82,-54}}, color={0,0,127}));
    connect(PELEC, product4.u2)
      annotation (Line(points={{-120,-60},{-88,-60},{-88,-66},{-82,-66}}, color={0,0,127}));
    connect(add3_1.y, feedback.u1) annotation (Line(points={{41,0},{52,0}}, color={0,0,127}));
    connect(const.y, first_Order_Lag_Non_Windup_MNLEX2_1.V_RMAX)
      annotation (Line(points={{123,30},{120,30},{120,12}}, color={0,0,127}));
    connect(const1.y, first_Order_Lag_Non_Windup_MNLEX2_1.V_RMIN) annotation (
        Line(points={{101,-30},{104,-30},{104,-12}}, color={0,0,127}));
    connect(feedback.y, first_Order_Lag_Non_Windup_MNLEX2_1.u)
      annotation (Line(points={{69,0},{100,0}}, color={0,0,127}));
    connect(first_Order_Lag_Non_Windup_MNLEX2_1.y, VUEL)
      annotation (Line(points={{123,0},{170,0}}, color={0,0,127}));
    connect(washout.u, VUEL) annotation (Line(points={{122,-70},{140,-70},{140,
            0},{170,0}}, color={0,0,127}));
    connect(washout.y, feedback.u2)
      annotation (Line(points={{99,-70},{60,-70},{60,-8}}, color={0,0,127}));
    annotation (
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-120},{160,120}}), graphics={
            Rectangle(extent={{-100,120},{160,-120}}, lineColor={28,108,200}), Text(
            extent={{-40,28},{96,-30}},
            textColor={28,108,200},
            textString="MNLEX2")}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-120},{160,120}})));
  end MNLEX2;
end UEL;
