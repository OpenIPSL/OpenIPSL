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
  OpenIPSL.Electrical.Machines.PSAT.Order2 order2_Inputs_Outputs(
    D=5,
    angle_0=0,
    ra=0.001,
    x1d=0.302,
    M=10,
    P_0=8103287.7181982,
    Q_0=5852304.4412627,
    Sn=370000000,
    v_0=1,
    V_b=400000,
    Vn=400000) annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  OpenIPSL.Electrical.Loads.PSAT.PQvar lOADPQ_B3(
    t_start_1=5,
    t_end_1=8,
    t_start_2=8,
    t_end_2=12,
    dP1=0,
    dP2=0,
    dQ1=-5000000,
    dQ2=5000000,
    P_0=8000000,
    Q_0=6000000)
               annotation (Placement(transformation(extent={{80,-40},{100,-20}})));
  OpenIPSL.Electrical.Branches.PSAT.ULTC_VoltageControl uLTC_VoltageControl(m0=0.9785)
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
  connect(order2_Inputs_Outputs.pm0, order2_Inputs_Outputs.pm) annotation (Line(
      points={{-28,-11},{-28,-14},{-36,-14},{-36,-5},{-32,-5}},
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
  connect(order2_Inputs_Outputs.vf0, order2_Inputs_Outputs.vf) annotation (Line(
        points={{-28,11},{-28,14},{-38,14},{-38,5},{-32,5}}, color={0,0,127}));
  annotation (Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2025-10-18</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>MAA Murad, KTH Royal Institute of Technology</p></td>
<td><p>L. Vanfretti, RPI</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>", info="<html>
<p>
This model needs to be simulated for 10 seconds.
</p>
<p>Variables of interest:</p>
<ul>
<li><code>uLTC_VoltageControl.m</code></li>
<li><code>uLTC_VoltageControl.der(m)</code></li>
<li><code>B3.v</code></li>
</ul>
</html>"));
end ULTC_Test;
