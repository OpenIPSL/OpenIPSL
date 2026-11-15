within OpenIPSL.Tests.Machines.PSSE;
model GENCLS "SMIB system to test functionality of classical generator model, and its functionality as infinite bus"
  extends OpenIPSL.Tests.BaseClasses.SMIB(GEN1(v_0=gENCLS1.v_0, angle_0=gENCLS1.angle_0));
  OpenIPSL.Electrical.Machines.PSSE.GENCLS gENCLS1(
   H = 6.0,
   M_b=100000000,
   P_0=40000000,
   Q_0=5416582,
   v_0=1,
   angle_0=0.0706207995986839,
   omega(fixed=true)) annotation (Placement(transformation(extent={{-100,-20},{-60,20}})));
equation
 connect(gENCLS1.p, GEN1.p)
    annotation (Line(points={{-60,0},{-60,0},{-30,0}}, color={0,0,255}));
   annotation (experiment(StopTime=10));
end GENCLS;
