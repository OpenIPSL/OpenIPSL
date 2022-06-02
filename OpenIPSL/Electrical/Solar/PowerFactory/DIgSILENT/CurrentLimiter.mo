within OpenIPSL.Electrical.Solar.PowerFactory.DIgSILENT;
model CurrentLimiter "Limiter of d- and q-axis currents"
  parameter Types.PerUnit maxAbsCur;
  parameter Types.PerUnit maxIq;
  parameter Types.PerUnit Deadband;
  parameter Boolean i_EEG;
  Modelica.Blocks.Interfaces.RealInput idin annotation (
    Placement(transformation(origin = {-200, 110}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-80, 60}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput iqin annotation (
    Placement(transformation(origin = {-200, -110}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-80, -60}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealInput duac annotation (
    Placement(transformation(origin = {-200, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}})));
  Modelica.Blocks.Interfaces.RealOutput idout annotation (
    Placement(transformation(origin = {210, 50}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput iqout annotation (
    Placement(transformation(origin = {210, -50}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Nonlinear.Limiter dlim_normal_op(limitsAtInit = true, uMax = maxAbsCur, uMin = -maxAbsCur) annotation (
    Placement(transformation(origin = {90, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Nonlinear.Limiter qlim_frt_op(limitsAtInit = true, uMax = maxAbsCur, uMin = -maxAbsCur) annotation (
    Placement(transformation(origin = {90, -70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Nonlinear.VariableLimiter qlim_normal_op annotation (
    Placement(transformation(origin = {90, -120}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Nonlinear.VariableLimiter dlim_frt_op annotation (
    Placement(transformation(origin = {90, 150}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant maximum_current(k = maxAbsCur) annotation (
    Placement(transformation(origin = {-30, 150}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Add add(k1 = -1, k2 = +1) annotation (
    Placement(transformation(origin = {10, 130}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Abs abs1 annotation (
    Placement(transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain gain(k = -1) annotation (
    Placement(transformation(origin = {40, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Min min annotation (
    Placement(transformation(origin = {20, -150}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const(k = maxIq) annotation (
    Placement(transformation(origin = {-20, -130}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Gain gain1(k = -1) annotation (
    Placement(transformation(origin = {50, -150}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Math.Pythagoras pythagoras(u1IsHypotenuse = true) annotation (
    Placement(transformation(origin = {-64, -170}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant const1(k = maxAbsCur) annotation (
    Placement(transformation(origin = {-110, -170}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Nonlinear.Limiter limiter(limitsAtInit = true, uMax = maxAbsCur, uMin = 0) annotation (
    Placement(transformation(origin = {-20, -170}, extent = {{-10, -10}, {10, 10}})));
  OpenIPSL.Electrical.Solar.PowerFactory.General.Picdro picdro(Tdrop = if i_EEG then 0 else 0.5, Tpick = 0) annotation (
    Placement(transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Nonlinear.DeadZone deadZone(deadZoneAtInit = true, uMax = Deadband, uMin = -Deadband) annotation (
    Placement(transformation(origin = {-130, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold = Deadband) annotation (
    Placement(transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Abs abs annotation (
    Placement(transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Logical.Switch switch_q_frt_normal annotation (
    Placement(transformation(origin = {150, -110}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (
    Placement(transformation(origin = {150, 110}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(abs1.u, duac) annotation (
    Line(points = {{-42, 90}, {-160, 90}, {-160, 0}, {-200, 0}}, color = {0, 0, 127}));
  connect(add.y, dlim_frt_op.limit2) annotation (
    Line(points = {{21, 130}, {72, 130}, {72, 142}, {78, 142}}, color = {0, 0, 127}));
  connect(gain.u, add.y) annotation (
    Line(points = {{40, 138}, {40, 130}, {21, 130}}, color = {0, 0, 127}));
  connect(const.y, min.u1) annotation (
    Line(points = {{-9, -130}, {-5, -130}, {-5, -144}, {8, -144}}, color = {0, 0, 127}));
  connect(gain1.u, min.y) annotation (
    Line(points = {{38, -150}, {31, -150}}, color = {0, 0, 127}));
  connect(qlim_normal_op.u, iqin) annotation (
    Line(points = {{78, -120}, {68, -120}, {68, -110}, {-200, -110}}, color = {0, 0, 127}));
  connect(pythagoras.y, limiter.u) annotation (
    Line(points = {{-53, -170}, {-32, -170}}, color = {0, 0, 127}));
  connect(limiter.y, min.u2) annotation (
    Line(points = {{-9, -170}, {-5, -170}, {-5, -156}, {8, -156}}, color = {0, 0, 127}));
  connect(deadZone.u, duac) annotation (
    Line(points = {{-142, 0}, {-188, 0}, {-188, 0}, {-200, 0}}, color = {0, 0, 127}));
  connect(deadZone.y, abs.u) annotation (
    Line(points={{-119,0},{-102,0}}, color = {0, 0, 127}));
  connect(abs.y, greaterEqualThreshold.u) annotation (
    Line(points = {{-79, 0}, {-62, 0}}, color = {0, 0, 127}));
  connect(greaterEqualThreshold.y, picdro.condition) annotation (
    Line(points = {{-39, 0}, {-18, 0}}, color = {255, 0, 255}));
  connect(switch_q_frt_normal.y, iqout) annotation (
    Line(points={{161,-110},{180,-110},{180,-50},{210,-50},{210,-50}}, color = {0, 0, 127}));
  connect(switch_q_frt_normal.u2, picdro.trip) annotation (
    Line(points={{138,-110},{120,-110},{120,0},{1,0},{1,0}}, color = {255, 0, 255}));
  connect(pythagoras.u2, iqin) annotation (
    Line(points = {{-76, -176}, {-88, -176}, {-88, -110}, {-200, -110}}, color = {0, 0, 127}));
  connect(const1.y, pythagoras.u1) annotation (
    Line(points={{-99,-170},{-94,-170},{-94,-164},{-76,-164},{-76,-164}}, color = {0, 0, 127}));
  connect(gain1.y, qlim_normal_op.limit2) annotation (
    Line(points={{61,-150},{68,-150},{68,-128},{78,-128}}, color = {0, 0, 127}));
  connect(qlim_normal_op.limit1, min.y) annotation (
    Line(points={{78,-112},{34,-112},{34,-150},{31,-150}}, color = {0, 0, 127}));
  connect(qlim_normal_op.y, switch_q_frt_normal.u3) annotation (
    Line(points={{101,-120},{120,-120},{120,-118},{138,-118},{138,-118}}, color = {0, 0, 127}));
  connect(qlim_frt_op.u, iqin) annotation (
    Line(points = {{78, -70}, {68, -70}, {68, -110}, {-200, -110}, {-200, -110}}, color = {0, 0, 127}));
  connect(qlim_frt_op.y, switch_q_frt_normal.u1) annotation (
    Line(points={{101,-70},{114,-70},{114,-102},{138,-102},{138,-102}}, color = {0, 0, 127}));
  connect(switch1.u2, picdro.trip) annotation (
    Line(points={{138,110},{120,110},{120,0},{1,0}}, color = {255, 0, 255}));
  connect(dlim_normal_op.y, switch1.u3) annotation (
    Line(points={{101,70},{128,70},{128,102},{138,102},{138,102}}, color = {0, 0, 127}));
  connect(dlim_frt_op.y, switch1.u1) annotation (
    Line(points={{101,150},{120,150},{120,118},{138,118},{138,118}}, color = {0, 0, 127}));
  connect(switch1.y, idout) annotation (
    Line(points={{161,110},{180,110},{180,50},{210,50},{210,50}}, color = {0, 0, 127}));
  connect(maximum_current.y, add.u1) annotation (
    Line(points = {{-19, 150}, {-10.5, 150}, {-10.5, 136}, {-2, 136}}, color = {0, 0, 127}));
  connect(dlim_normal_op.u, idin) annotation (
    Line(points = {{78, 70}, {20, 70}, {20, 108}, {-200, 108}, {-200, 110}}, color = {0, 0, 127}));
  connect(dlim_frt_op.u, idin) annotation (
    Line(points = {{78, 150}, {66, 150}, {66, 108}, {-200, 108}, {-200, 110}}, color = {0, 0, 127}));
  connect(abs1.y, add.u2) annotation (
    Line(points={{-19,90},{-10,90},{-10,124},{-2,124},{-2,124}}, color = {0, 0, 127}));
  connect(gain.y, dlim_frt_op.limit1) annotation (
    Line(points={{40,161},{40,161},{40,168},{66,168},{66,158},{78,158},{78,158}}, color = {0, 0, 127}));
  annotation (
    Icon(graphics={ Rectangle(
          lineColor={118,18,62},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,100},{100,-100}}), Text(origin = {-35, 62}, extent = {{-21, 10}, {21, -10}}, textString = "idin"), Text(origin = {-33, -60}, extent = {{-21, 10}, {21, -10}}, textString = "iqin"), Text(origin = {-33, 0}, extent = {{-21, 10}, {21, -10}}, textString = "duac"), Text(origin = {71, 52}, extent = {{-21, 10}, {21, -10}}, textString = "idout"), Text(origin = {71, -48}, extent = {{-21, 10}, {21, -10}}, textString = "iqout"), Text(origin={0,
              -10}, lineColor = {0, 0, 255}, extent = {{-100, 150}, {100, 110}}, textString = "%name")}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
     Documentation(revisions = "<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Model Name</p></td>
<td><p>Current Limiter</p></td>
</tr>
<tr>
<td><p>Reference</p></td>
<td><p>PowerFactory Implementation in Templates</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>January 2021</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/tinrabuzin\">@tinrabuzin</a></p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
<tr>
<td><p>Model Verification</p></td>
<td><p>This model has not been verified against PowerFactory.</p></td>
</tr>
</table>
</html>"));
end CurrentLimiter;
