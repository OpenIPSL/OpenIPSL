within OpenIPSL.NonElectrical.Continuous;
block DerivativeLag "Derivative lag transfer function block"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real K "Gain";
  parameter Types.Time T "Time constant";
  parameter Real y_start "Output start value"
    annotation (Dialog(group="Initialization"));
  parameter Real x_start=0 "Start value of state variable"
    annotation (Dialog(group="Initialization"));
  Modelica.Blocks.Sources.RealExpression par1(y=T)
    annotation (Placement(transformation(extent={{-80,54},{-60,74}})));
  Modelica.Blocks.Continuous.TransferFunction TF(
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    x_start={x_start},
    b={K_dummy,0},
    y_start=y_start,
    a={T_dummy,1})
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
protected
  parameter Types.Time T_dummy=if abs(T) < Modelica.Constants.eps
       then 1000 else T "Lead time constant";
  parameter Types.Time K_dummy=if abs(K) < Modelica.Constants.eps
       then 1 else K "Lead time constant";
equation
  if abs(par1.y) < Modelica.Constants.eps then
    y = u;
  else
    y = TF.y;
  end if;
  connect(TF.u, u)
    annotation (Line(points={{-10,0},{-120,0}}, color={0,0,127}));
  annotation (
Icon(graphics={Text(
          extent={{-60,82},{60,22}},
          textColor={0,0,255},
          textString="Ks"),Line(
          points={{-62,0},{66,0}},
          color={0,0,255},
          smooth=Smooth.Bezier,
          thickness=0.5),Text(
          extent={{-60,-20},{60,-80}},
          textColor={0,0,255},
          textString="1+sT")}));
end DerivativeLag;
