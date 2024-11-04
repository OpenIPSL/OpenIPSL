within OpenIPSL.Tests.BaseClasses;
partial model SMIBAddOn
  "SMIB - Single Machine Infinite Base system with one load for renewable source validation."
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Branches.PwLine pwLine(
    R=2.50000E-2,
    X=2.50000E-2,
    G=0,
    B=0.05000/2) annotation (Placement(transformation(extent={{40,-4},{60,16}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine1(
    R=2.50000E-2,
    X=2.50000E-2,
    G=0,
    B=0.05000/2) annotation (Placement(transformation(extent={{40,-16},{60,4}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine2(
    G=0,
    B=0,
    R=2.50000E-3,
    X=2.50000E-3)
    annotation (Placement(transformation(extent={{4,-10},{24,10}})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0.5,
    X=0.5,
    t1=2.00,
    t2=2.15)
            annotation (Placement(transformation(extent={{42,-36},{58,-20}})));
  inner OpenIPSL.Electrical.SystemBase SysData(fn=50, S_b=100000000) annotation (Placement(transformation(extent={{-100,80},
            {-60,100}})));
  OpenIPSL.Electrical.Buses.Bus PV_BUS
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Buses.Bus FAULT
    annotation (Placement(transformation(extent={{18,-10},{38,10}})));
  OpenIPSL.Electrical.Buses.Bus GEN2
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Electrical.Sources.VoltageSourceReImInput voltageSourceReImInput
    annotation (Placement(transformation(extent={{96,-10},{76,10}})));
  Modelica.Blocks.Sources.RealExpression imagPart annotation (Placement(transformation(extent={{80,-30},{100,-10}})));
  Modelica.Blocks.Sources.RealExpression realPart(y=if time <= 50000 then 1 else 0.99) annotation (Placement(transformation(extent={{80,10},{100,30}})));
equation
  connect(FAULT.p,pwLine. p)
    annotation (Line(points={{28,0},{36,0},{36,6},{41,6}},   color={0,0,255}));
  connect(pwLine1.p,pwLine. p) annotation (Line(points={{41,-6},{36,-6},{36,6},
          {41,6}},               color={0,0,255}));
  connect(pwFault.p,FAULT. p) annotation (Line(points={{40.6667,-28},{32,-28},{32,0},{28,0}},
                         color={0,0,255}));
  connect(pwLine.n,GEN2. p)
    annotation (Line(points={{59,6},{64,6},{64,0},{70,0}},   color={0,0,255}));
  connect(pwLine1.n,GEN2. p) annotation (Line(points={{59,-6},{64,-6},{64,0},{
          70,0}},  color={0,0,255}));
  connect(pwLine2.n, FAULT.p)
    annotation (Line(points={{23,0},{28,0}}, color={0,0,255}));
  connect(PV_BUS.p, pwLine2.p)
    annotation (Line(points={{0,0},{5,0}}, color={0,0,255}));
  connect(voltageSourceReImInput.p, GEN2.p)
    annotation (Line(points={{75,0},{70,0}}, color={0,0,255}));
  connect(voltageSourceReImInput.vIm, imagPart.y) annotation (Line(points={{98,-4},{104,-4},{104,-20},{101,-20}}, color={0,0,127}));
  connect(realPart.y, voltageSourceReImInput.vRe) annotation (Line(points={{101,20},{104,20},{104,4},{98,4}}, color={0,0,127}));
end SMIBAddOn;
