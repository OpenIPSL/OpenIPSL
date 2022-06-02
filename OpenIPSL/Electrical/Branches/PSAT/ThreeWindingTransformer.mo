within OpenIPSL.Electrical.Branches.PSAT;
model ThreeWindingTransformer "Three winding transformer model from PSAT"
  outer OpenIPSL.Electrical.SystemBase SysData;
  OpenIPSL.Interfaces.PwPin b1
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));
  OpenIPSL.Interfaces.PwPin b2
    annotation (Placement(transformation(extent={{100,20},{120,40}})));
  OpenIPSL.Interfaces.PwPin b3
    annotation (Placement(transformation(extent={{100,-40},{120,-20}})));
  parameter Types.ApparentPower S_b=SysData.S_b "System base power"
    annotation (Dialog(group="Power flow"));
  parameter Types.Voltage V_b=40e3 "Sending end bus voltage"
    annotation (Dialog(group="Power flow"));
  parameter Types.ApparentPower Sn=100e6 "Power rating"
    annotation (Dialog(group="Transformer parameters"));
  parameter Types.Voltage Vn=40e3 "Voltage rating for transformer"
    annotation (Dialog(group="Transformer parameters"));
  parameter Types.PerUnit r12=0.01 "Resistance of the branch 1-2 (transformer base)"
    annotation (Dialog(group="Transformer parameters"));
  parameter Types.PerUnit r13=0.01 "Resistance of the branch 1-3 (transformer base)"
    annotation (Dialog(group="Transformer parameters"));
  parameter Types.PerUnit r23=0.01 "Resistance of the branch 2-3 (transformer base)"
    annotation (Dialog(group="Transformer parameters"));
  parameter Types.PerUnit x12=0.1 "Reactance of the branch 1-2 (transformer base)"
    annotation (Dialog(group="Transformer parameters"));
  parameter Types.PerUnit x13=0.1 "Reactance of the branch 1-3 (transformer base)"
    annotation (Dialog(group="Transformer parameters"));
  parameter Types.PerUnit x23=0.1 "Reactance of the branch 2-3 (transformer base)"
    annotation (Dialog(group="Transformer parameters"));
  parameter Types.PerUnit m=0.98 "Fixed tap ratio"
    annotation (Dialog(group="Transformer parameters"));
  Types.Voltage v0 "Voltage of the fictitious bus";
  Types.Voltage v1;
  Types.Voltage v2;
  Types.Voltage v3;
  Types.Angle anglev0 "Angle of the fictitious bus";
  Types.Angle anglev1;
  Types.Angle anglev2;
  Types.Angle anglev3;
  TwoWindingTransformer branch1(
    V_b=V_b,
    Sn=Sn,
    Vn=Vn,
    rT=0.5*(r12 + r13 - r23),
    xT=0.5*(x12 + x13 - x23),
    m=m) annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
  TwoWindingTransformer branch2(
    V_b=V_b, Sn=Sn,
    Vn=Vn,
    rT=0.5*(r12 + r23 - r13),
    xT=0.5*(x12 + x23 - x13)) annotation (Placement(transformation(extent={{40,20},{60,40}})));
  TwoWindingTransformer branch3(
    V_b=V_b, Sn=Sn,
    Vn=Vn,
    rT=0.5*(r23 + r13 - r12),
    xT=0.5*(x23 + x13 - x12)) annotation (Placement(transformation(extent={{40,-40},{60,-20}})));
equation
  v0 = sqrt(branch1.n.vr^2 + branch1.n.vi^2);
  v1 = sqrt(b1.vr^2 + b1.vi^2);
  v2 = sqrt(b2.vr^2 + b2.vi^2);
  v3 = sqrt(b3.vr^2 + b3.vi^2);
  anglev0 = atan2(branch1.n.vi, branch1.n.vr);
  anglev1 = atan2(b1.vi, b1.vr);
  anglev2 = atan2(b2.vi, b2.vr);
  anglev3 = atan2(b3.vi, b3.vr);
  connect(branch1.p, b1) annotation (Line(
      points={{-59,0},{-110,0}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(branch1.n, branch2.p) annotation (Line(points={{-37,0},{0,0},{0,30},{39,30}}, color={0,0,255}));
  connect(branch2.n, b2) annotation (Line(points={{61,30},{110,30}}, color={0,0,255}));
  connect(branch1.n, branch3.p) annotation (Line(points={{-37,0},{0,0},{0,-30},{39,-30}}, color={0,0,255}));
  connect(branch3.n, b3) annotation (Line(points={{61,-30},{110,-30}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Ellipse(extent={{-52,34},{12,-28}}, lineColor={0,
          0,255}),Ellipse(extent={{-4,64},{60,2}}, lineColor={0,0,255}),Ellipse(
          extent={{-2,16},{62,-46}}, lineColor={0,0,255}),Line(
          points={{-54,-22},{10,42},{10,42}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{2,40},{10,42},{10,42}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{8,34},{10,42}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{60,32},{100,32},{100,32}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{58,-28},{102,-28},{100,-28}},
          color={0,0,255},
          smooth=Smooth.None),Line(
          points={{-100,0},{-52,0}},
          color={0,0,255},
          smooth=Smooth.None),Text(
          extent={{-60,-50},{60,-92}},
          lineColor={0,128,0},
          textString="TWT"),
        Text(
          extent={{-100,140},{100,80}},
          lineColor={0,0,255},
          textString="%name")}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>PSAT Manual 2.1.8</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2015-07-15</p></td>
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
end ThreeWindingTransformer;
