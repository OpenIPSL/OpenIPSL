within OpenIPSL.Tests.Branches.PSAT;
model ThreeWindingTransformer_Test "Simple model for testing three-winding transformer model"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(transformation(
        origin={-2,-10},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(transformation(
        origin={-2,10},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Sources.Sine sine1(amplitude=0.001, f=0.2) annotation (Placement(transformation(origin={-91.783,9.4652}, extent={{-4.4802,-4.4802},{4.4802,4.4802}})));
  Modelica.Blocks.Math.Add add2(k2=-1) annotation (Placement(transformation(
        origin={-78,2},
        extent={{-4,-4},{4,4}})));
  Modelica.Blocks.Sources.Sine sine2(
    amplitude=0.001,
    f=0.2,
    startTime=5) annotation (Placement(transformation(origin={-91.382,-5.5198}, extent={{-4.4802,-4.4802},{4.4802,4.4802}})));
  OpenIPSL.Electrical.Machines.PSAT.Order2 Gen1(
    D=5,
    angle_0=0,
    ra=0.001,
    x1d=0.302,
    M=10,
    P_0=80124.48966387101,
    Q_0=59251.697676828,
    Sn=370000000,
    v_0=1,
    V_b=400000,
    Vn=400000) annotation (Placement(transformation(extent={{-52,-10},{-32,10}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-70,10},{-60,0}})));
  OpenIPSL.Electrical.Loads.PSAT.PQvar lOADPQ(
    t_start_1=5,
    t_end_1=8,
    t_start_2=8,
    t_end_2=12,
    dP1=0,
    dP2=0,
    dQ1=0.01,
    dQ2=-0.01,
    P_0=40000,
    Q_0=20000) annotation (Placement(transformation(extent={{80,-10},{100,10}})));
  OpenIPSL.Electrical.Loads.PSAT.PQvar lOADPQ1(
    t_start_1=0,
    t_end_1=0,
    t_start_2=0,
    t_end_2=0,
    dP1=0,
    dQ1=0,
    dP2=0,
    dQ2=0,
    P_0=40000,
    Q_0=40000) annotation (Placement(transformation(extent={{80,-50},{100,-30}})));
  Electrical.Branches.PSAT.ThreeWindingTransformer threeWindingTransformer annotation (Placement(transformation(extent={{28,-10},{48,10}})));
  OpenIPSL.Electrical.Buses.Bus Bus1
    annotation (Placement(transformation(extent={{-32,-10},{-12,10}})));
  OpenIPSL.Electrical.Buses.Bus Bus2
    annotation (Placement(transformation(extent={{8,-10},{28,10}})));
  OpenIPSL.Electrical.Buses.Bus Bus3
    annotation (Placement(transformation(extent={{60,10},{80,30}})));
  OpenIPSL.Electrical.Buses.Bus Bus4
    annotation (Placement(transformation(extent={{60,-30},{80,-10}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-100,80},{-60,100}})));
equation
  connect(add2.y, add.u1) annotation (Line(
      points={{-73.6,2},{-71,2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add.y, Gen1.vf) annotation (Line(
      points={{-59.5,5},{-54,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen1.vf0, add.u2) annotation (Line(
      points={{-50,11},{-50,16},{-74,16},{-74,8},{-71,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Gen1.pm0, Gen1.pm) annotation (Line(
      points={{-50,-11},{-50,-16},{-60,-16},{-60,-5},{-54,-5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwLine4.n, pwLine3.n) annotation (Line(
      points={{7,10},{13,10},{13,-10},{7,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(pwLine4.p, pwLine3.p) annotation (Line(
      points={{-11,10},{-17,10},{-17,-10},{-11,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Gen1.p, Bus1.p) annotation (Line(
      points={{-32,0},{-22,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Bus1.p, pwLine3.p) annotation (Line(
      points={{-22,0},{-17,0},{-17,-10},{-11,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Bus2.p, pwLine3.n) annotation (Line(
      points={{18,0},{13,0},{13,-10},{7,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Bus2.p, threeWindingTransformer.b1) annotation (Line(
      points={{18,0},{27,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(threeWindingTransformer.b2, Bus3.p) annotation (Line(
      points={{49,3},{63,3},{63,20},{70,20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(lOADPQ.p, Bus3.p) annotation (Line(
      points={{90,10},{90,20},{70,20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(threeWindingTransformer.b3, Bus4.p) annotation (Line(
      points={{49,-3},{63,-3},{63,-20},{70,-20}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(Bus4.p, lOADPQ1.p) annotation (Line(
      points={{70,-20},{90,-20},{90,-30}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sine1.y, add2.u1) annotation (Line(points={{-86.8548,9.4652},{-84,9.4652},{-84,4},{-82.8,4},{-82.8,4.4}}, color={0,0,127}));
  connect(sine2.y, add2.u2) annotation (Line(points={{-86.4538,-5.5198},{-84.2269,-5.5198},{-84.2269,-0.4},{-82.8,-0.4}}, color={0,0,127}));
  annotation (Documentation(revisions="<html>
<table cellspacing=\"2\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2015-09-29</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end ThreeWindingTransformer_Test;
