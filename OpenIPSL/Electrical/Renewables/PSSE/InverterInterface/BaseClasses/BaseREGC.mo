within OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.BaseClasses;
partial model BaseREGC "Base renewable generator/converter for PSSE models"
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

  // Set of Model Parameters
  parameter Modelica.Units.SI.Time Tg = 0.02 "Converter time constant" annotation (Dialog(group="Input Parameters"));
  parameter Modelica.Units.SI.TimeAging rrpwr = 10 "Low Voltage Power Logic (LVPL) ramp rate limit" annotation (Dialog(group="Input Parameters"));
  parameter OpenIPSL.Types.PerUnit Brkpt = 0.9 "LVPL characteristic voltage 2" annotation (Dialog(group="Input Parameters"));
  parameter OpenIPSL.Types.PerUnit Zerox = 0.5 "LVPL characteristic voltage 1" annotation (Dialog(group="Input Parameters"));
  parameter OpenIPSL.Types.PerUnit Lvpl1 = 1.22 "LVPL gain" annotation (Dialog(group="Input Parameters"));
  parameter OpenIPSL.Types.PerUnit Volim = 1.2 "Voltage limit for high voltage reactive current management" annotation (Dialog(group="Input Parameters"));
  parameter OpenIPSL.Types.PerUnit lvpnt1 = 0.8 "High voltage point for low voltage active current management" annotation (Dialog(group="Input Parameters"));
  parameter OpenIPSL.Types.PerUnit lvpnt0 = 0.4 "Low voltage point for low voltage active current management" annotation (Dialog(group="Input Parameters"));
  parameter OpenIPSL.Types.PerUnit Iolim = -1.3 "Current limit for high voltage reactive current management (specified as a negative value)" annotation (Dialog(group="Input Parameters"));
  parameter Modelica.Units.SI.Time Tfltr = 0.02 "Voltage filter time constant for low voltage active current management" annotation (Dialog(group="Input Parameters"));
  parameter Real Khv = 0.7 "Overvoltage compensation gain used in the high voltage reactive current management" annotation (Dialog(group="Input Parameters"));
  parameter Modelica.Units.SI.TimeAging Iqrmax = 9999 "Upper limit on rate of change for reactive current" annotation (Dialog(group="Input Parameters"));
  parameter Modelica.Units.SI.TimeAging Iqrmin = -9999 "Lower limit on rate of change for reactive current" annotation (Dialog(group="Input Parameters"));

  parameter Boolean Lvplsw=true "Enable (true) or disable (false) low voltage power logic." annotation (Dialog(tab="Controls"));

  OpenIPSL.Interfaces.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=-ir0*CoB),
    ii(start=-ii0*CoB)) annotation (Placement(transformation(extent={{130,-10},{150,10}})));
  Modelica.Blocks.Interfaces.RealInput Iqcmd "Imaginary Command Current"
                                                                        annotation (Placement(transformation(extent={{-180,60},{-140,100}})));
  Modelica.Blocks.Interfaces.RealInput Ipcmd "Real Command Current" annotation (Placement(transformation(extent={{-180,-100},{-140,-60}})));
  Modelica.Blocks.Interfaces.RealOutput IQ0 "Initial Reactive Power" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-120,-150})));
  Modelica.Blocks.Interfaces.RealOutput IP0 "Initial Active Power" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,-150})));
  Modelica.Blocks.Interfaces.RealOutput V_0 "Initial Terminal Voltage Magnitude" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-150})));
  Modelica.Blocks.Interfaces.RealOutput q_0 "Initial Reactive Power" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,-150})));
  Modelica.Blocks.Interfaces.RealOutput p_0 "Initial Active Power" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={120,-150})));
  Modelica.Blocks.Interfaces.RealOutput V_t "Terminal Voltage Magnitude" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,150})));
  Modelica.Blocks.Interfaces.RealOutput Pgen "Active Power injection"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,150})));
  Modelica.Blocks.Interfaces.RealOutput Qgen "Reactive Power injection"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,150})));
protected
  OpenIPSL.Types.Angle delta(start=angle_0);
  OpenIPSL.Types.PerUnit VT(start=v_0) "Bus voltage magnitude";
  OpenIPSL.Types.Angle anglev(start=angle_0) "Bus voltage angle";
  parameter OpenIPSL.Types.PerUnit p0=P_0/M_b "Initial active power (machine base)";
  parameter OpenIPSL.Types.PerUnit q0=Q_0/M_b "Initial reactive power (machine base)";
  parameter OpenIPSL.Types.PerUnit vr0=v_0*cos(angle_0);
  parameter OpenIPSL.Types.PerUnit vi0=v_0*sin(angle_0);
  parameter OpenIPSL.Types.PerUnit ir0=(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2);
  parameter OpenIPSL.Types.PerUnit ii0=(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2);
  parameter OpenIPSL.Types.PerUnit Isr0=ir0 "Source current re M_b";
  parameter OpenIPSL.Types.PerUnit Isi0=ii0 "Source current im M_b";
  parameter OpenIPSL.Types.PerUnit Ip0=Isr0*cos(-angle_0) - Isi0*sin(-angle_0);
  parameter OpenIPSL.Types.PerUnit Iq0=(Isr0*sin(-angle_0) + cos(-angle_0)*Isi0);
  parameter Real CoB=M_b/S_b "Change of base";

equation
  anglev = atan2(p.vi, p.vr);
  VT = sqrt(p.vr*p.vr + p.vi*p.vi);
  delta = anglev;

 annotation (Icon(coordinateSystem(extent={{-140,-140},
            {140,140}}), graphics={
        Rectangle(extent={{-140,140},{140,-140}}, lineColor={28,108,200}),
        Text(
          extent={{-126,90},{-66,50}},
          textColor={0,0,255},
          textString="IQCMD"),
        Text(
          extent={{-126,-50},{-66,-90}},
          textColor={0,0,255},
          textString="IPCMD"),
        Text(
          extent={{-136,-100},{-104,-140}},
          textColor={0,0,255},
          textString="IQ0"),
        Text(
          extent={{-76,-100},{-44,-140}},
          textColor={0,0,255},
          textString="IP0"),
        Text(
          extent={{-14,-104},{14,-136}},
          textColor={0,0,255},
          textString="V0"),
        Text(
          extent={{46,-104},{74,-136}},
          textColor={0,0,255},
          textString="Q0"),
        Text(
          extent={{-110,140},{-70,110}},
          textColor={0,0,255},
          textString="VT"),
        Text(
          extent={{-30,140},{30,110}},
          textColor={0,0,255},
          textString="PGEN"),
        Text(
          extent={{60,140},{120,110}},
          textColor={0,0,255},
          textString="QGEN"),
        Text(
          extent={{106,-104},{134,-136}},
          textColor={0,0,255},
          textString="P0"),  Text(
          extent={{-82,70},{98,-70}},
          textColor={0,0,255},
          textString="REGCA")}),
                              Diagram(
        coordinateSystem(extent={{-140,-140},{140,140}})),
    Documentation(info="<html>
<p>
This component is the base class for the inverter components from the InverterInterface sub-package.
</p>
<p>The modelling of such devices is based, mainly, on the following reference:</p>
<ul>
<li><p>Siemens: \"PSS&reg;E Model Library\"
<a href=\"modelica://OpenIPSL.UsersGuide.References\">[PSSE-MODELS]</a>.</p>
</li>
</ul>
</html>"));
end BaseREGC;
