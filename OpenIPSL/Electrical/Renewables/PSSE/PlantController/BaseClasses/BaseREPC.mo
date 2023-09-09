within OpenIPSL.Electrical.Renewables.PSSE.PlantController.BaseClasses;
partial model BaseREPC
  "Base class for the plant controller of the WECC generic renewable models"

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
    final enableangle_0=true,
    final enablev_0=true,
    final enableQ_0=true,
    final enableP_0=true,
    final enableS_b=true);

  parameter Boolean vcflag=true "Reactive droop (false) or line drop compensation (true)" annotation (Dialog(tab="Control"));
  parameter Boolean refflag=true "Plant-level reactive power (false) or voltage control (true)" annotation (Dialog(tab="Control"));
  parameter Boolean fflag=true "Governor response disable (false) or enable (true)" annotation (Dialog(tab="Control"));

  Modelica.Blocks.Interfaces.RealInput Qref "Reactive Power Reference" annotation (Placement(
        transformation(extent={{-240,100},{-200,140}})));
  Modelica.Blocks.Interfaces.RealInput Plant_pref "Active Power Reference" annotation (Placement(
        transformation(extent={{-240,20},{-200,60}})));
  Modelica.Blocks.Interfaces.RealInput Freq "Connection Point Frequency" annotation (Placement(
        transformation(extent={{-240,-60},{-200,-20}})));
  Modelica.Blocks.Interfaces.RealInput Freq_ref "Plant Controller Frequency Reference"
                                       annotation (Placement(
        transformation(extent={{-240,-140},{-200,-100}})));
  Modelica.Blocks.Interfaces.RealOutput Qext "Reactive Power output signal"
    annotation (Placement(transformation(extent={{200,90},{220,110}})));
  Modelica.Blocks.Interfaces.RealOutput Pref "Real Power output signal"
    annotation (Placement(transformation(extent={{200,-110},{220,-90}})));

  Modelica.Blocks.Interfaces.RealInput p0 "Initial Active Power" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-120,-220})));
  Modelica.Blocks.Interfaces.RealInput q0 "Initial Reactive Power" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={120,-220})));
  Modelica.Blocks.Interfaces.RealInput v0 "Initial Terminal Voltage Magnitude" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-220})));
  Modelica.Blocks.Interfaces.RealInput branch_ir "Measured Branch Real Current" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-140,220})));
  Modelica.Blocks.Interfaces.RealInput branch_ii "Measured Branch Imaginary Current" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-40,220})));
  Modelica.Blocks.Interfaces.RealInput regulate_vr "Regulated Branch Real Voltage" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,220})));
  Modelica.Blocks.Interfaces.RealInput regulate_vi "Regulated Branch Imaginary Voltage" annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={140,220})));
protected
  parameter Real CoB=M_b/S_b;

equation

  annotation (Icon(coordinateSystem(extent={{-200,-200},
            {200,200}}), graphics={
        Rectangle(
          extent={{-200,200},{200,-200}},
          lineColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.None),
        Text(
          extent={{-180,152},{-80,72}},
          textColor={0,0,255},
          textString="PLANT QREF"),
        Text(
          extent={{-180,86},{-82,-6}},
          textColor={0,0,255},
          textString="PLANT PREF"),
        Text(
          extent={{-184,-32},{-134,-56}},
          textColor={0,0,255},
          textString="FREQ"),
        Text(
          extent={{-184,-92},{-106,-134}},
          textColor={0,0,255},
          textString="REF FREQ"),
        Text(
          extent={{-168,212},{-110,148}},
          textColor={0,0,255},
          textString="BRANCH Ir"),
        Text(
          extent={{22,204},{96,156}},
          textColor={0,0,255},
          textString="REG BUS VR"),
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
          textString="Q0"),
        Text(
          extent={{-70,206},{-12,152}},
          textColor={0,0,255},
          textString="BRANCH Ii"),
        Text(
          extent={{110,206},{182,154}},
          textColor={0,0,255},
          textString="REG BUS VR")}), Diagram(coordinateSystem(
          extent={{-200,-200},{200,200}})),
    Documentation(info="<html>
<p>
The BaseREPC model is the base class that is extended to create the <a href=\"modelica://OpenIPSL.Electrical.Renewables.PSSE.PlantController.REPCA1\">REPCA1</a> component.
</p>
</html>"));
end BaseREPC;
