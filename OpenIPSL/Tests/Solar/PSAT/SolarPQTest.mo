within OpenIPSL.Tests.Solar.PSAT;
model SolarPQTest
  "Solar inverter test model of PQ variant from PSAT (controlled Active and Reactive Powers (P and Q))"
  extends OpenIPSL.Tests.BaseClasses.SMIB(constantLoad(P_0=1000000*(50/2), Q_0=
          1000000*(10/2)));
  OpenIPSL.Electrical.Solar.PSAT.ConstantPQPV.PQ1 SPQ(
    Q_0=0.05416582152,
    angle_0=0.14093849062925,
    v_0=1.0146961212,
    P_0=0.4,
    Td=0.15,
    Tq=0.15) annotation (Placement(transformation(
        origin={-60,0.1033},
        extent={{10,-10},{-10,10}},
        rotation=180)));
equation
  connect(GEN1.p, SPQ.p) annotation (Line(points={{-30,0},{-38,0},{-38,0.1033},{-49,0.1033}}, color={0,0,255}));
  annotation (experiment(StopTime=10));
end SolarPQTest;
