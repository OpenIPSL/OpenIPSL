within OpenIPSL.Examples.Tutorial.Example_4.BaseModels.GeneratingUnits;
model InfiniteBus "Infinite bus model"
  extends OpenIPSL.Interfaces.Generator;
  OpenIPSL.Electrical.Machines.PSSE.GENCLS gENCLS(P_0=P_0,
    Q_0=Q_0,
    v_0=v_0,
    angle_0=angle_0,
    M_b=100000000,
    H=5.0000,
    D=0.0000,
    R_a=0.0000,
    X_d=0.2000) annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
equation
  connect(gENCLS.p, pwPin)
    annotation (Line(points={{40,0},{110,0}}, color={0,0,255}));
end InfiniteBus;
