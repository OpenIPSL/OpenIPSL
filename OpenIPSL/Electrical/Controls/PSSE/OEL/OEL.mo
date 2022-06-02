within OpenIPSL.Electrical.Controls.PSSE.OEL;
model OEL "Over excitation limiter system from PSSE"
  Modelica.Blocks.Interfaces.RealInput IFD "Field current" annotation (
      Placement(transformation(extent={{-140,-20},{-100,20}}),
                                                             iconTransformation(
        extent={{5,-6},{-5,6}},
        rotation=180,
        origin={-105,0})));
  Modelica.Blocks.Sources.Constant IFDSetpoint(k=IFDdes)
    annotation (Placement(transformation(extent={{-90,30},{-70,50}})));
  Modelica.Blocks.Continuous.LimIntegrator imLimitedIntegrator(
    outMin=Vmin,
    outMax=Vmax,
    k=KMX,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{10,50},{30,70}})));
  Modelica.Blocks.Interfaces.RealOutput VOEL "OEL output" annotation (Placement(
        transformation(extent={{100,-10},{120,10}}),
                                                  iconTransformation(extent={{
            100,-6},{110,6}})));
  parameter Types.PerUnit IFD1=1.1 "Low OEL limit";
  parameter Types.PerUnit IFD2=1.2 "Medium OEL limit";
  parameter Types.PerUnit IFD3=1.5 "High OEL limit";
  parameter Types.Time TIME1=60 "Timing for low OEL";
  parameter Types.Time TIME2=30 "Timimg for medium OEL";
  parameter Types.Time TIME3=15 "Timing for high OEL";
  parameter Types.PerUnit IFDdes=1 "IFD setpoint";
  parameter Types.PerUnit Vmax=0 "Max. OEL output";
  parameter Types.PerUnit Vmin=-0.05 "Min. OEL output";
  parameter Types.PerUnit KMX=1 "Control constant";
  IF_comparisor comparisor(
    HighCurrentLimit=IFD3,
    MediumCurrentLimit=IFD2,
    LowCurrentLimit=IFD1)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  Modelica.Blocks.Continuous.LimIntegrator imLimitedIntegrator1(
    outMin=Vmin,
    outMax=Vmax,
    k=KMX,
    y_start=6,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{10,10},{30,30}})));
  Modelica.Blocks.Continuous.LimIntegrator imLimitedIntegrator2(
    outMin=Vmin,
    outMax=Vmax,
    k=KMX,
    y_start=6,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{10,-30},{30,-10}})));
  Modelica.Blocks.Continuous.LimIntegrator imLimitedIntegrator3(
    outMin=Vmin,
    outMax=Vmax,
    k=KMX,
    y_start=7.5,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{10,-70},{30,-50}})));
  Modelica.Blocks.Math.Add add(k1=-1)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Math.MultiSum multiSum(nu=4)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
equation
  connect(comparisor.n1, imLimitedIntegrator.u) annotation (Line(points={{-9,6},{-3.84,6},{-3.84,60},{8,60}},
                                                color={0,0,127}));
  connect(comparisor.n2, imLimitedIntegrator1.u) annotation (Line(points={{-9,2},{0.16,2},{0.16,20},{8,20}},
                                            color={0,0,127}));
  connect(comparisor.n3, imLimitedIntegrator2.u) annotation (Line(points={{-9,-2},{0.16,-2},{0.16,-20},{8,-20}},
                                                color={0,0,127}));
  connect(comparisor.n4, imLimitedIntegrator3.u) annotation (Line(points={{-9,-6},{-3.84,-6},{-3.84,-60},{8,-60}},
                                                color={0,0,127}));
  connect(add.y,comparisor. p) annotation (Line(points={{-39,0},{-32,0}},
                                color={0,0,127}));
  connect(add.u2, IFD) annotation (Line(points={{-62,-6},{-80.5,-6},{-80.5,0},{-120,0}},
                         color={0,0,127}));
  connect(IFDSetpoint.y, add.u1) annotation (Line(points={{-69,40},{-65.6,40},{-65.6,6},{-62,6}},
                                   color={0,0,127}));
  connect(multiSum.y, VOEL)
    annotation (Line(points={{81.7,0},{110,0}}, color={0,0,127}));
  connect(imLimitedIntegrator.y, multiSum.u[1]) annotation (Line(points={{31,60},{48.6,60},{48.6,5.25},{60,5.25}},
                                              color={0,0,127}));
  connect(imLimitedIntegrator1.y, multiSum.u[2]) annotation (Line(points={{31,20},{40.6,20},{40.6,1.75},{60,1.75}},
                                              color={0,0,127}));
  connect(imLimitedIntegrator2.y, multiSum.u[3]) annotation (Line(points={{31,-20},{44.6,-20},{44.6,-1.75},{60,-1.75}},
                                              color={0,0,127}));
  connect(imLimitedIntegrator3.y, multiSum.u[4]) annotation (Line(points={{31,-60},{48.6,-60},{48.6,-5.25},{60,-5.25}},
                                              color={0,0,127}));
  annotation (
    Icon(
        graphics={Rectangle(extent={{-100,100},{100,-100}},
                                                          lineColor={0,0,255}),
          Text(
          extent={{-40,-40},{40,-80}},
          lineColor={0,0,255},
          textString="OEL"),Text(
          extent={{-96,4},{-72,-6}},
          lineColor={0,0,255},
          textString="IFD/EFD"),Text(
          extent={{82,4},{100,-4}},
          lineColor={0,0,255},
          textString="VOEL"),
        Text(
          extent={{-100,100},{100,40}},
          lineColor={0,0,255},
          textString="%name")}),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td>PSS&reg;E manual</td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>2015-10-02</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Le Qi, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end OEL;
