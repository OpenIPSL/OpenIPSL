within OpenIPSL.Tests.BaseClasses;
partial model SMIBRenewable "SMIB - Single Machine Infinite Base system with one load for renewable source validation."
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=2.50000E-2,
    X=2.50000E-2,
    G=0,
    B=0.05000/2) annotation (Placement(transformation(extent={{34,10},{54,30}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=2.50000E-2,
    X=2.50000E-2,
    G=0,
    B=0.05000/2) annotation (Placement(transformation(extent={{34,-30},{54,-10}})));
  OpenIPSL.Electrical.Machines.PSSE.GENCLS gENCLS2_1(
    angle_0=-1.570655e-05,
    R_a=0,
    X_d=2.00000E-1,
    M_b=100000000,
    V_b=100000,
    P_0=-1498800,
    Q_0=-4334000,
    v_0=1.00000) annotation (Placement(transformation(extent={{98,-12},{86,12}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    G=0,
    B=0,
    R=2.50000E-3,
    X=2.50000E-3)
    annotation (Placement(transformation(extent={{-6,-10},{14,10}})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0.5,
    X=0.5,
    t1=2.00,
    t2=2.15)
            annotation (Placement(transformation(extent={{32,-60},{52,-40}})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=50, S_b=100000000) annotation (Placement(transformation(extent={{-100,80},
            {-60,100}})));
  OpenIPSL.Electrical.Buses.Bus GEN1
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  OpenIPSL.Electrical.Buses.Bus FAULT
    annotation (Placement(transformation(extent={{6,-10},{26,10}})));
  OpenIPSL.Electrical.Buses.Bus GEN2
    annotation (Placement(transformation(extent={{64,-10},{84,10}})));
  Modelica.Blocks.Sources.Constant freq(k=SysData.fn)
    annotation (Placement(transformation(extent={{-96,-10},{-76,10}})));
  Electrical.Sensors.PwCurrent pwCurrent
    annotation (Placement(transformation(extent={{-20,-6},{-8,6}})));
  Electrical.Sensors.PwVoltage pwVoltage annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={-30,30})));
equation
  connect(FAULT.p,pwLine. p)
    annotation (Line(points={{16,0},{24,0},{24,20},{35,20}}, color={0,0,255}));
  connect(pwLine1.p,pwLine. p) annotation (Line(points={{35,-20},{24,-20},{24,20},
          {35,20}},              color={0,0,255}));
  connect(pwFault.p,FAULT. p) annotation (Line(points={{30.3333,-50},{20,-50},{
          20,0},{16,0}}, color={0,0,255}));
  connect(pwLine.n,GEN2. p)
    annotation (Line(points={{53,20},{64,20},{64,0},{74,0}}, color={0,0,255}));
  connect(pwLine1.n,GEN2. p) annotation (Line(points={{53,-20},{64,-20},{64,0},{
          74,0}},  color={0,0,255}));
  connect(GEN2.p,gENCLS2_1. p)
    annotation (Line(points={{74,0},{86,0}},        color={0,0,255}));
  connect(pwLine2.n, FAULT.p)
    annotation (Line(points={{13,0},{16,0}}, color={0,0,255}));
  connect(pwCurrent.n, pwLine2.p)
    annotation (Line(points={{-8,0},{-5,0}}, color={0,0,255}));
  connect(pwCurrent.p, GEN1.p)
    annotation (Line(points={{-20,0},{-30,0}}, color={0,0,255}));
  connect(pwVoltage.p, GEN1.p) annotation (Line(points={{-24,30},{-22,30},{-22,
          0},{-30,0}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{120,100}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}})));
end SMIBRenewable;
