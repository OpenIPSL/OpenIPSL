within OpenIPSL.Tests.Solar.PSAT;
model SolarPVTest
  "Solar inverter test model of PV variant from PSAT (controlled Active Power and Voltage (P and V))"
  extends OpenIPSL.Tests.BaseClasses.SMIB;
  OpenIPSL.Electrical.Solar.PSAT.ConstantPQPV.PV1 SPV(
    Q_0=5.416582/100,
    angle_0=0.070492225331847,
    v_0=1.0,
    vref=1.0,
    P_0=0.4) annotation (Placement(transformation(
        origin={-60,0.1033},
        extent={{10,-10},{-10,10}},
        rotation=180)));
equation
  connect(GEN1.p, SPV.p) annotation (Line(points={{-30,0},{-40,0},{-40,0.1033},{-49,0.1033}}, color={0,0,255}));
  annotation (experiment(StopTime=10));
end SolarPVTest;
