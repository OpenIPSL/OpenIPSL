within OpenIPSL.Examples.KundurSMIB;
partial model SMIB_Partial "Partial model containing the network elements"
  OpenIPSL.Electrical.Buses.Bus B1
    annotation (Placement(transformation(extent={{-64,-12},{-40,12}})));
  OpenIPSL.Electrical.Buses.Bus B2
    annotation (Placement(transformation(extent={{-24,-12},{0,12}})));
  OpenIPSL.Electrical.Buses.Bus B3
    annotation (Placement(transformation(extent={{56,-12},{80,12}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(
    Sn=2220000000,
    xT=0.15,
    rT=0,
    V_b=400000,
    Vn=400000) annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
  OpenIPSL.Electrical.Branches.PwLine line_1(
    R=0,
    G=0,
    B=0,
    X=0.5) annotation (Placement(transformation(extent={{18,14},{36,26}})));
  OpenIPSL.Electrical.Buses.InfiniteBus infinite_bus(angle_0=0, v_0=
        0.900810000000000) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={90,0})));
  OpenIPSL.Electrical.Events.PwFault fault(
    R=0,
    t1=0.5,
    t2=0.57,
    X=1e-5) annotation (Placement(transformation(extent={{8,-60},{28,-40}})));
  OpenIPSL.Electrical.Branches.PwLine line_2(
    R=0,
    G=0,
    B=0,
    X=0.93,
    t1=0.57,
    t2=100,
    opening=1)
    annotation (Placement(transformation(extent={{18,-26},{36,-14}})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=2220000000,
                                                         fn=60)
    annotation (Placement(transformation(extent={{-80,80},{-26,100}})));
protected
  parameter Real S_b=SysData.S_b;
equation
  connect(B1.p, transformer.p)
    annotation (Line(points={{-52,0},{-43,0}}, color={0,0,255}));
  connect(transformer.n, B2.p)
    annotation (Line(points={{-21,0},{-12,0}}, color={0,0,255}));
  connect(B2.p, line_1.p) annotation (Line(points={{-12,0},{-2,0},{-2,20},{18.9,
          20}}, color={0,0,255}));
  connect(line_1.n, B3.p) annotation (Line(points={{35.1,20},{58,20},{58,0},{68,
          0}}, color={0,0,255}));
  connect(B3.p, infinite_bus.p)
    annotation (Line(points={{68,0},{80,0}}, color={0,0,255}));
  connect(fault.p, line_1.p) annotation (Line(points={{6.33333,-50},{-6,-50},{-6,
          0},{-2,0},{-2,20},{18.9,20}}, color={0,0,255}));
  connect(line_2.n, B3.p) annotation (Line(points={{35.1,-20},{58,-20},{58,0},{68,
          0}}, color={0,0,255}));
  connect(line_2.p, line_1.p) annotation (Line(points={{18.9,-20},{-2,-20},{-2,20},
          {18.9,20}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
          preserveAspectRatio=false), graphics={Text(
          extent={{-110,80},{110,60}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="Example 1: Single-machine infinite bus model*"),Text(
          extent={{-138,-88},{80,-106}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=12,
          textString=
            "*P. Kundur, \"Power System Stability and Control\", Example 13.2")}),
    experiment(
      StopTime=10,
      Interval=0.0001,
      Tolerance=1e-006,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Rkfix2"),
Documentation(info="<html>
<p>Partial network model used in the SMIB systems, composed of three buses and an infinite bus.</p>
</html>"));
end SMIB_Partial;
