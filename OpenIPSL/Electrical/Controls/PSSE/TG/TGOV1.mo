within OpenIPSL.Electrical.Controls.PSSE.TG;
model TGOV1 "TGOV1 - Steam Turbine-Governor"
  extends Icons.VerifiedModel;
  extends BaseClasses.BaseGovernor;
  OpenIPSL.NonElectrical.Continuous.LeadLag imLeadLag(
    T1=T_2,
    T2=T_3,
    K=1,
    y_start=P0) annotation (Placement(transformation(extent={{80,-11},{100,10}})));
  parameter Types.PerUnit R=0.04 "Inverse of governor gain (the actual gain is 1/R)";
  parameter Types.PerUnit D_t=0 "Turbine damping factor (on Machine Base)";
  parameter Types.Time T_1=0.4 "Regulator time constant. It must be greater than 0";
  parameter Types.Time T_2=2 "High-pressure reheater time constant";
  parameter Types.Time T_3=6 "Reheater time constant. It must be greater than 0";
  parameter Types.PerUnit V_MAX=0.86 "Maximum valve position (on Machine Base)";
  parameter Types.PerUnit V_MIN=0.3 "Minimum valve position (on Machine Base)";
  Modelica.Blocks.Math.Gain imGain9(k=1/R) annotation (Placement(transformation(extent={{0,-10},
            {20,10}})));
  Modelica.Blocks.Math.Gain imGain1(k=D_t) annotation (Placement(transformation(extent={{40,-69},
            {60,-50}})));
  Modelica.Blocks.Math.Add add(k2=-1) annotation (Placement(transformation(extent={{-40,-11},
            {-20,10}})));
  Modelica.Blocks.Math.Add add1(k2=-1) annotation (Placement(transformation(extent={{180,-10},
            {200,10}})));
  Modelica.Blocks.Sources.Constant REF(k=P_REF) annotation (Placement(transformation(extent={{-140,40},
            {-120,60}})));
  NonElectrical.Continuous.SimpleLagLim simpleLagLim(
    K=1,
    T=T_1,
    y_start=P0,
    outMax=V_MAX,
    outMin=V_MIN) annotation (Placement(transformation(extent={{40,-9},{60,10}})));
protected
  parameter Types.PerUnit P0(fixed=false) "Power reference of the governor";
  parameter Types.PerUnit P_REF(fixed=false);
initial equation
  P0 = PMECH0;
  P_REF = P0*R;

equation
  connect(REF.y, add.u1) annotation (Line(points={{-119,50},{-60,50},{-60,5.8},{
          -42,5.8}}, color={0,0,127}));
  connect(simpleLagLim.u, imGain9.y) annotation (Line(points={{38,0.5},{21,0.5},
          {21,0}}, color={0,0,127}));
  connect(add1.y, PMECH)
    annotation (Line(points={{201,0},{250,0},{250,0}}, color={0,0,127}));
  connect(simpleLagLim.y, imLeadLag.u) annotation (Line(points={{61,0.5},{69.5,0.5},
          {69.5,-0.5},{78,-0.5}}, color={0,0,127}));
  connect(add.y, imGain9.u) annotation (Line(points={{-19,-0.5},{-10.5,-0.5},{-10.5,
          0},{-2,0}}, color={0,0,127}));
  connect(imLeadLag.y, add1.u1) annotation (Line(points={{101,-0.5},{160,-0.5},{
          160,6},{178,6}}, color={0,0,127}));
  connect(imGain1.y, add1.u2) annotation (Line(points={{61,-59.5},{160,-59.5},{160,
          -6},{178,-6}}, color={0,0,127}));
  connect(SPEED, add.u2) annotation (Line(points={{-240,-120},{-150,-120},{-60,-120},
          {-60,-6.8},{-42,-6.8}}, color={0,0,127}));
  connect(imGain1.u, add.u2) annotation (Line(points={{38,-59.5},{-12,-59.5},{-12,
          -60},{-60,-60},{-60,-6.8},{-42,-6.8}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-240,-200},{240,180}},
        preserveAspectRatio=false,
        grid={2,2})),
    Icon(coordinateSystem(
        extent={{-100,-100},{100,100}},
        preserveAspectRatio=false,
        grid={2,2}),
        graphics={Text(
          extent={{-100,160},{100,100}},
          lineColor={28,108,200},
          textString="TGOV1")}),
    Documentation(info="<html>Steam Turbine-Governor Model TGOV1.</html>",
    revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>PSS&reg;E Manual</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2020-09</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>ALSETLab, Rensselaer Polytechnic Institute</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end TGOV1;
