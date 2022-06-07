within OpenIPSL.Tests.Branches.PSAT;
model ULTC_Test "Simple model for testing a ULTC (under-load tap changing) transformer model"
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Branches.PwLine pwLine3(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(transformation(
        origin={20,-10},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  OpenIPSL.Electrical.Branches.PwLine pwLine4(
    B=0.001/2,
    G=0,
    R=0.01,
    X=0.1) annotation (Placement(transformation(
        origin={20,10},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Sources.Sine sine1(amplitude=0.001, f=0.2) annotation (Placement(transformation(origin={-92,10}, extent={{-4.4802,-4.4802},{4.4802,4.4802}})));
  Modelica.Blocks.Math.Add diff(k2=-1) annotation (Placement(transformation(
        origin={-72,0},
        extent={{-6.3229,-6.3229},{6.3229,6.3229}})));
  Modelica.Blocks.Sources.Sine sine2(
    amplitude=0.001,
    f=0.2,
    startTime=5) annotation (Placement(transformation(origin={-92,-10}, extent={{-4.4802,-4.4802},{4.4802,4.4802}})));
  OpenIPSL.Electrical.Machines.PSAT.Order2 order2_Inputs_Outputs(
    D=5,
    angle_0=0,
    ra=0.001,
    x1d=0.302,
    M=10,
    P_0=81032.877181982,
    Q_0=58523.044412627,
    Sn=370000000,
    v_0=1,
    V_b=400000,
    Vn=400000) annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-56,-6},{-44,6}})));
  OpenIPSL.Electrical.Loads.PSAT.PQvar lOADPQ_B3(
    t_start_1=5,
    t_end_1=8,
    t_start_2=8,
    t_end_2=12,
    dP1=0,
    dP2=0,
    dQ1=-0.05,
    dQ2=0.05,
    P_0=80000,
    Q_0=60000) annotation (Placement(transformation(extent={{80,-40},{100,-20}})));
  OpenIPSL.Electrical.Branches.PSAT.ULTC_VoltageControl uLTC_VoltageControl
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  OpenIPSL.Electrical.Buses.Bus B1
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  OpenIPSL.Electrical.Buses.Bus B2
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  OpenIPSL.Electrical.Buses.Bus B3
    annotation (Placement(transformation(extent={{70,-10},{90,10}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-100,80},{-40,100}})));
equation
  connect(add.y, order2_Inputs_Outputs.vf) annotation (Line(
      points={{-43.4,0},{-39,0},{-39,5},{-32,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(order2_Inputs_Outputs.pm0, order2_Inputs_Outputs.pm) annotation (Line(
      points={{-28,-11},{-28,-14},{-36,-14},{-36,-5},{-32,-5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine1.y,diff. u1) annotation (Line(
      points={{-87.0718,10},{-82,10},{-82,4},{-79.5875,4},{-79.5875,3.79374}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine2.y,diff. u2) annotation (Line(
      points={{-87.0718,-10},{-82,-10},{-82,-4},{-79.5875,-4},{-79.5875,-3.79374}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pwLine4.p, pwLine3.p) annotation (Line(
      points={{11,10},{6,10},{6,-10},{11,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(order2_Inputs_Outputs.p, B1.p) annotation (Line(
      points={{-10,0},{0,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B1.p, pwLine3.p) annotation (Line(
      points={{0,0},{6,0},{6,-10},{11,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B2.p, pwLine3.n) annotation (Line(
      points={{40,0},{34,0},{34,-10},{29,-10}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(uLTC_VoltageControl.n, B3.p) annotation (Line(
      points={{71,0},{80,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(lOADPQ_B3.p, B3.p) annotation (Line(
      points={{90,-20},{90,0},{80,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B2.p, uLTC_VoltageControl.p) annotation (Line(
      points={{40,0},{49,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(B2.p, pwLine4.n) annotation (Line(points={{40,0},{34,0},{34,10},{29,10}}, color={0,0,255}));
  connect(diff.y, add.u2) annotation (Line(points={{-65.0448,0},{-62,0},{-62,-3.6},{-57.2,-3.6}}, color={0,0,127}));
  connect(add.u1, order2_Inputs_Outputs.vf0) annotation (Line(points={{-57.2,3.6},{-62,3.6},{-62,18},{-28,18},{-28,11}}, color={0,0,127}));
  annotation (Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
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
end ULTC_Test;
