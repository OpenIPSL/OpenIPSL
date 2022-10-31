within OpenIPSL.Electrical.Renewables.PSSE.PlantController.BaseClasses;
partial model basePlantController "Base class for the plant controller of the WECC generic renewable models"

  import Complex;
  import Modelica.ComplexMath.arg;
  import Modelica.ComplexMath.real;
  import Modelica.ComplexMath.imag;
  import Modelica.ComplexMath.conj;
  import Modelica.Blocks.Interfaces.*;
  parameter OpenIPSL.Types.ApparentPower M_b=SysData.S_b "Machine base power" annotation (Dialog(group="Power flow data"));
  extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enabledisplayPF=false,
    final enablefn=false,
    final enableV_b=false,
    final enableangle_0=false,
    final enablev_0=false,
    final enableQ_0=false,
    final enableP_0=false,
    final enableS_b=false);

  Interfaces.PwPin          REGULATE
    annotation (Placement(transformation(extent={{110,190},{130,210}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={120,200})));
  Interfaces.PwPin          BRANCH_n
    annotation (Placement(transformation(extent={{-10,190},{10,210}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,200})));
  Interfaces.PwPin          BRANCH_p
    annotation (Placement(transformation(extent={{-130,190},{-110,210}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-120,200})));
  Modelica.Blocks.Interfaces.RealInput Qref annotation (Placement(
        transformation(extent={{-240,90},{-200,130}}),  iconTransformation(
          extent={{-240,90},{-200,130}})));
  Modelica.Blocks.Interfaces.RealInput Plant_pref annotation (Placement(
        transformation(extent={{-240,20},{-200,60}}), iconTransformation(
          extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-220,40})));
  Modelica.Blocks.Interfaces.RealInput Freq annotation (Placement(
        transformation(extent={{-240,-60},{-200,-20}}), iconTransformation(
          extent={{-240,-60},{-200,-20}})));
  Modelica.Blocks.Interfaces.RealInput Freq_ref
    "Connector of Real input signal 2" annotation (Placement(
        transformation(extent={{-240,-130},{-200,-90}}),
        iconTransformation(extent={{-240,-130},{-200,-90}})));
  Modelica.Blocks.Interfaces.RealOutput Qext(start=q0) "Connector of Real output signal"
    annotation (Placement(transformation(extent={{200,90},{220,110}})));
  Modelica.Blocks.Interfaces.RealOutput Pref(start=p0) "Connector of Real output signal"
    annotation (Placement(transformation(extent={{200,-110},{220,-90}})));

  Modelica.Blocks.Interfaces.RealInput p0 annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-120,-220}), iconTransformation(extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-120,-220})));
  Modelica.Blocks.Interfaces.RealInput q0 annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={120,-220}), iconTransformation(extent={{-20,-20},{20,20}},
        rotation=90,
        origin={120,-220})));
  Modelica.Blocks.Interfaces.RealInput v0 annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-220}), iconTransformation(extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-220})));
protected
  parameter Real CoB=M_b/S_b;

equation


  connect(BRANCH_n, BRANCH_p) annotation (Line(points={{0,200},{0,180},{-120,
          180},{-120,200}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},
            {200,200}}), graphics={
        Rectangle(
          extent={{-200,200},{200,-200}},
          lineColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.None),
        Text(
          extent={{-188,118},{-132,98}},
          textColor={0,0,255},
          textString="QREF"),
        Text(
          extent={{-184,84},{-86,-8}},
          textColor={0,0,255},
          textString="PLANT PREF"),
        Text(
          extent={{-184,-32},{-138,-52}},
          textColor={0,0,255},
          textString="FREQ"),
        Text(
          extent={{-184,-92},{-106,-134}},
          textColor={0,0,255},
          textString="REF FREQ"),
        Text(
          extent={{-38,212},{38,136}},
          textColor={0,0,255},
          textString="REGC PIN"),
        Text(
          extent={{-168,214},{-68,134}},
          textColor={0,0,255},
          textString="SENSOR BUS"),
        Text(
          extent={{84,200},{156,148}},
          textColor={0,0,255},
          textString="REG BUS"),
        Text(
          extent={{136,-92},{192,-112}},
          textColor={0,0,255},
          textString="PREF"),
        Text(
          extent={{136,108},{192,88}},
          textColor={0,0,255},
          textString="QEXT"),
        Text(
          extent={{-80,60},{118,-60}},
          textColor={0,0,255},
          textString="REPCA1"),
        Text(
          extent={{-150,-164},{-90,-190}},
          textColor={0,0,255},
          textString="P0"),
        Text(
          extent={{-30,-164},{30,-190}},
          textColor={0,0,255},
          textString="V0"),
        Text(
          extent={{90,-164},{150,-190}},
          textColor={0,0,255},
          textString="Q0")}),           Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-200,-200},{200,200}})));
end basePlantController;
