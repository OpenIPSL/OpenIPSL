within OpenIPSL.Electrical.Renewables.PSSE.RenewableElectricalController;
package BaseClasses "Base classes for renewable energy electrica control models from PSSE"
  extends Modelica.Icons.BasesPackage;
  partial model BaseREECA "Base renewable energy electrical controller model A"

    parameter Boolean pfflag=true "Constant output value" annotation (Dialog(tab="Control"));
    parameter Boolean vflag=true "Constant output value" annotation (Dialog(tab="Control"));
    parameter Boolean qflag=true "Constant output value" annotation (Dialog(tab="Control"));
    parameter Boolean pqflag=true "Constant output value" annotation (Dialog(tab="Control"));
    parameter Boolean pflag=true "Constant output value" annotation (Dialog(tab="Control"));

    Modelica.Blocks.Interfaces.RealInput Vt
      annotation (Placement(transformation(extent={{-340,180},{-300,220}}),
          iconTransformation(extent={{-340,180},{-300,220}})));
    Modelica.Blocks.Interfaces.RealInput Pe
      annotation (Placement(transformation(extent={{-340,100},{-300,140}}),
          iconTransformation(extent={{-340,100},{-300,140}})));
    Modelica.Blocks.Interfaces.RealInput Qext
      "Connector of second Real input signal"
      annotation (Placement(transformation(extent={{-340,-60},{-300,-20}}),
          iconTransformation(extent={{-340,-60},{-300,-20}})));
    Modelica.Blocks.Interfaces.RealInput Qgen "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-340,20},{-300,60}}),
          iconTransformation(extent={{-340,20},{-300,60}})));
    Modelica.Blocks.Interfaces.RealInput Pref annotation (Placement(
          transformation(extent={{-340,-140},{-300,-100}}),
          iconTransformation(extent={{-340,-140},{-300,-100}})));
    Modelica.Blocks.Interfaces.RealInput ip0 annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={120,-320}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={120,-320})));
    Modelica.Blocks.Interfaces.RealInput iq0 annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={230,-320}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={230,-320})));
    Modelica.Blocks.Interfaces.RealOutput Iqcmd
      annotation (Placement(transformation(extent={{300,140},{320,160}}),
          iconTransformation(extent={{300,140},{320,160}})));
    Modelica.Blocks.Interfaces.RealOutput Ipcmd
      annotation (Placement(transformation(extent={{300,-160},{320,-140}}),
          iconTransformation(extent={{300,-160},{320,-140}})));
    Modelica.Blocks.Interfaces.RealInput Wg annotation (Placement(
          transformation(extent={{-340,-220},{-300,-180}}), iconTransformation(
            extent={{-340,-220},{-300,-180}})));

    Modelica.Blocks.Interfaces.RealInput v0 annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={0,-320}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={0,-320})));
    Modelica.Blocks.Interfaces.RealInput p0 annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={-230,-320}),iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={-230,-320})));
    Modelica.Blocks.Interfaces.RealInput q0 annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={-120,-320}),iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={-120,-320})));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-300,-300},
              {300,300}}), graphics={Rectangle(extent={{-300,300},{300,-300}},
              lineColor={0,0,255}),
          Text(
            extent={{-280,220},{-220,180}},
            textColor={0,0,255},
            textString="VT"),
          Text(
            extent={{-280,140},{-168,100}},
            textColor={0,0,255},
            textString="PGEN"),
          Text(
            extent={{-280,60},{-168,20}},
            textColor={0,0,255},
            textString="QGEN"),
          Text(
            extent={{-280,-20},{-168,-60}},
            textColor={0,0,255},
            textString="QEXT"),
          Text(
            extent={{-280,-100},{-168,-140}},
            textColor={0,0,255},
            textString="PREF"),
          Text(
            extent={{-270,-180},{-210,-220}},
            textColor={0,0,255},
            textString="WG"),
          Text(
            extent={{-260,-254},{-200,-294}},
            textColor={0,0,255},
            textString="P0"),
          Text(
            extent={{-150,-254},{-90,-294}},
            textColor={0,0,255},
            textString="Q0"),
          Text(
            extent={{-30,-254},{30,-294}},
            textColor={0,0,255},
            textString="V0"),
          Text(
            extent={{90,-254},{150,-294}},
            textColor={0,0,255},
            textString="IP0"),
          Text(
            extent={{204,-254},{264,-294}},
            textColor={0,0,255},
            textString="IQ0"),
          Text(
            extent={{-140,98},{160,-100}},
            textColor={0,0,255},
            textString="REECA1"),
          Text(
            extent={{178,168},{290,128}},
            textColor={0,0,255},
            textString="IQCMD"),
          Text(
            extent={{178,-132},{290,-172}},
            textColor={0,0,255},
            textString="IPCMD")}),       Diagram(coordinateSystem(
            preserveAspectRatio=false, extent={{-300,-300},{300,300}})));

  end BaseREECA;

  partial model BaseREECB "Base renewable energy electrical controller model B"

    parameter Boolean pfflag=true "Constant output value" annotation (Dialog(tab="Control"));
    parameter Boolean vflag=true "Constant output value" annotation (Dialog(tab="Control"));
    parameter Boolean qflag=true "Constant output value" annotation (Dialog(tab="Control"));
    parameter Boolean pqflag=true "Constant output value" annotation (Dialog(tab="Control"));

    Modelica.Blocks.Interfaces.RealInput Vt
      annotation (Placement(transformation(extent={{-340,140},{-300,180}}),
          iconTransformation(extent={{-340,140},{-300,180}})));
    Modelica.Blocks.Interfaces.RealInput Pe
      annotation (Placement(transformation(extent={{-340,60},{-300,100}}),
          iconTransformation(extent={{-340,60},{-300,100}})));
    Modelica.Blocks.Interfaces.RealInput Qext
      "Connector of second Real input signal"
      annotation (Placement(transformation(extent={{-340,-100},{-300,-60}}),
          iconTransformation(extent={{-340,-100},{-300,-60}})));
    Modelica.Blocks.Interfaces.RealInput Qgen "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-340,-20},{-300,20}}),
          iconTransformation(extent={{-340,-20},{-300,20}})));
    Modelica.Blocks.Interfaces.RealInput Pref annotation (Placement(
          transformation(extent={{-340,-180},{-300,-140}}),
          iconTransformation(extent={{-340,-180},{-300,-140}})));
    Modelica.Blocks.Interfaces.RealInput ip0 annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={120,-320}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={120,-320})));
    Modelica.Blocks.Interfaces.RealInput iq0 annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={230,-320}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={230,-320})));
    Modelica.Blocks.Interfaces.RealOutput Iqcmd
      annotation (Placement(transformation(extent={{300,140},{320,160}}),
          iconTransformation(extent={{300,140},{320,160}})));
    Modelica.Blocks.Interfaces.RealOutput Ipcmd
      annotation (Placement(transformation(extent={{300,-160},{320,-140}}),
          iconTransformation(extent={{300,-160},{320,-140}})));

    Modelica.Blocks.Interfaces.RealInput v0 annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={0,-320}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={0,-320})));
    Modelica.Blocks.Interfaces.RealInput p0 annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={-230,-320}),iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={-230,-320})));
    Modelica.Blocks.Interfaces.RealInput q0 annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={-120,-320}),iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={-120,-320})));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-300,-300},
              {300,300}}), graphics={Rectangle(extent={{-300,300},{300,-300}},
              lineColor={0,0,255}),
          Text(
            extent={{-140,98},{160,-100}},
            textColor={0,0,255},
            textString="REECB1"),
          Text(
            extent={{-280,180},{-220,140}},
            textColor={0,0,255},
            textString="VT"),
          Text(
            extent={{-280,100},{-168,60}},
            textColor={0,0,255},
            textString="PGEN"),
          Text(
            extent={{-280,20},{-168,-20}},
            textColor={0,0,255},
            textString="QGEN"),
          Text(
            extent={{-280,-60},{-168,-100}},
            textColor={0,0,255},
            textString="QEXT"),
          Text(
            extent={{-280,-140},{-168,-180}},
            textColor={0,0,255},
            textString="PREF"),
          Text(
            extent={{-260,-256},{-200,-296}},
            textColor={0,0,255},
            textString="P0"),
          Text(
            extent={{-150,-256},{-90,-296}},
            textColor={0,0,255},
            textString="Q0"),
          Text(
            extent={{-30,-256},{30,-296}},
            textColor={0,0,255},
            textString="V0"),
          Text(
            extent={{90,-256},{150,-296}},
            textColor={0,0,255},
            textString="IP0"),
          Text(
            extent={{204,-256},{264,-296}},
            textColor={0,0,255},
            textString="IQ0"),
          Text(
            extent={{178,168},{290,128}},
            textColor={0,0,255},
            textString="IQCMD"),
          Text(
            extent={{178,-132},{290,-172}},
            textColor={0,0,255},
            textString="IPCMD")}),       Diagram(coordinateSystem(
            preserveAspectRatio=false, extent={{-300,-300},{300,300}})));

  end BaseREECB;

  partial model BaseREECC "Base renewable energy electrical controller model C"

    parameter Boolean pfflag=true "Constant output value" annotation (Dialog(tab="Control"));
    parameter Boolean vflag=true "Constant output value" annotation (Dialog(tab="Control"));
    parameter Boolean qflag=true "Constant output value" annotation (Dialog(tab="Control"));
    parameter Boolean pqflag=true "Constant output value" annotation (Dialog(tab="Control"));

    Modelica.Blocks.Interfaces.RealInput ip0 annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={120,-320}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={120,-320})));
    Modelica.Blocks.Interfaces.RealInput iq0 annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={230,-320}),  iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={230,-320})));
    Modelica.Blocks.Interfaces.RealOutput Iqcmd
      annotation (Placement(transformation(extent={{300,70},{320,90}}),
          iconTransformation(extent={{300,140},{320,160}})));
    Modelica.Blocks.Interfaces.RealOutput Ipcmd
      annotation (Placement(transformation(extent={{300,-90},{320,-70}}),
          iconTransformation(extent={{300,-160},{320,-140}})));

    Modelica.Blocks.Interfaces.RealInput v0 annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={0,-320}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={0,-320})));
    Modelica.Blocks.Interfaces.RealInput p0 annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={-230,-320}),iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={-230,-320})));
    Modelica.Blocks.Interfaces.RealInput q0 annotation (Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={-120,-320}),iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={-120,-320})));
    Modelica.Blocks.Interfaces.RealInput Vt
      annotation (Placement(transformation(extent={{-340,220},{-300,260}}),
          iconTransformation(extent={{-340,220},{-300,260}})));
    Modelica.Blocks.Interfaces.RealInput Pe
      annotation (Placement(transformation(extent={{-340,140},{-300,180}}),
          iconTransformation(extent={{-340,140},{-300,180}})));
    Modelica.Blocks.Interfaces.RealInput Qext
      "Connector of second Real input signal"
      annotation (Placement(transformation(extent={{-340,-20},{-300,20}}),
          iconTransformation(extent={{-340,-20},{-300,20}})));
    Modelica.Blocks.Interfaces.RealInput Qgen "Connector of Real input signal 2"
      annotation (Placement(transformation(extent={{-340,60},{-300,100}}),
          iconTransformation(extent={{-340,60},{-300,100}})));
    Modelica.Blocks.Interfaces.RealInput Pref annotation (Placement(
          transformation(extent={{-340,-100},{-300,-60}}),
          iconTransformation(extent={{-340,-100},{-300,-60}})));
    Modelica.Blocks.Interfaces.RealInput Paux annotation (Placement(
          transformation(extent={{-340,-180},{-300,-140}}), iconTransformation(
            extent={{-340,-180},{-300,-140}})));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-300,-300},
              {300,300}}), graphics={Rectangle(extent={{-300,300},{300,-300}},
              lineColor={0,0,255}),
          Text(
            extent={{-140,100},{160,-98}},
            textColor={0,0,255},
            textString="REECCU1"),
          Text(
            extent={{-280,258},{-220,218}},
            textColor={0,0,255},
            textString="VT"),
          Text(
            extent={{-280,178},{-168,138}},
            textColor={0,0,255},
            textString="PGEN"),
          Text(
            extent={{-280,98},{-168,58}},
            textColor={0,0,255},
            textString="QGEN"),
          Text(
            extent={{-280,18},{-168,-22}},
            textColor={0,0,255},
            textString="QEXT"),
          Text(
            extent={{-280,-62},{-168,-102}},
            textColor={0,0,255},
            textString="PREF"),
          Text(
            extent={{-260,-256},{-200,-296}},
            textColor={0,0,255},
            textString="P0"),
          Text(
            extent={{-150,-256},{-90,-296}},
            textColor={0,0,255},
            textString="Q0"),
          Text(
            extent={{-30,-256},{30,-296}},
            textColor={0,0,255},
            textString="V0"),
          Text(
            extent={{90,-256},{150,-296}},
            textColor={0,0,255},
            textString="IP0"),
          Text(
            extent={{204,-256},{264,-296}},
            textColor={0,0,255},
            textString="IQ0"),
          Text(
            extent={{178,168},{290,128}},
            textColor={0,0,255},
            textString="IQCMD"),
          Text(
            extent={{178,-132},{290,-172}},
            textColor={0,0,255},
            textString="IPCMD"),
          Text(
            extent={{-280,-142},{-168,-182}},
            textColor={0,0,255},
            textString="PAUX")}),        Diagram(coordinateSystem(
            preserveAspectRatio=false, extent={{-300,-300},{300,300}})));

  end BaseREECC;

  model CLL_REECB "Current Limit Logic for REECB"

    parameter OpenIPSL.Types.PerUnit start_ii;
    parameter OpenIPSL.Types.PerUnit start_ir;
    parameter OpenIPSL.Types.PerUnit Imax;

    Modelica.Blocks.Interfaces.RealInput Iqcmd(start = -start_ii) annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={70,120}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={120,50})));
    Modelica.Blocks.Interfaces.RealInput Ipcmd(start = start_ir) annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={70,-120}), iconTransformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={120,-50})));
    Modelica.Blocks.Interfaces.RealOutput Iqmin annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-70,110}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-60,110})));
    Modelica.Blocks.Interfaces.RealOutput Iqmax annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-30,110}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={60,110})));
    Modelica.Blocks.Interfaces.RealOutput Ipmin annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-70,-110}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-60,-110})));
    Modelica.Blocks.Interfaces.RealOutput Ipmax annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-30,-110}), iconTransformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={60,-110})));
    Modelica.Blocks.Interfaces.BooleanInput Pqflag "Priority to reactive current (false) or active current (true)." annotation (Placement(transformation(extent={{-140,
              -20},{-100,20}})));

  equation

    Ipmax = if Pqflag == true then Imax else sqrt(Imax^2 - Iqcmd^2);
    Ipmin = 0;
    Iqmax = if Pqflag == true then sqrt(Imax^2 - Ipcmd^2) else Imax;
    Iqmin = -Iqmax;

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={28,108,200}),        Text(
            extent={{-60,40},{60,-40}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="CLL REECB"),        Text(
            extent={{-80,106},{-40,66}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="IQMIN"),            Text(
            extent={{40,106},{80,66}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="IQMAX"),            Text(
            extent={{-78,-68},{-38,-108}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="IPMIN"),            Text(
            extent={{40,-68},{80,-108}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="IPMAX"),            Text(
            extent={{52,70},{92,30}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="IQCMD"),            Text(
            extent={{50,-30},{90,-70}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="IPCMD")}),                                 Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end CLL_REECB;

  model CCL_REECA "Current limit logic for REECA"

    parameter OpenIPSL.Types.PerUnit start_ii;
    parameter OpenIPSL.Types.PerUnit start_ir;
    parameter Real Imax;

    OpenIPSL.Types.PerUnit post_local_I;
    OpenIPSL.Types.PerUnit local_I;

    Modelica.Blocks.Interfaces.RealInput VDL1_out annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-120,60}), iconTransformation(extent={{-140,80},{-100,40}})));
    Modelica.Blocks.Interfaces.BooleanInput pqflag annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={120,0}), iconTransformation(
          extent={{0,0},{40,40}},
          rotation=180,
          origin={140,20})));
    Modelica.Blocks.Interfaces.RealInput VDL2_out annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-120,-60}), iconTransformation(extent={{-140,-40},{-100,-80}})));
    Modelica.Blocks.Interfaces.RealInput Iqcmd annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={120,60}), iconTransformation(
          extent={{-13.3335,-13.3336},{26.6673,26.6664}},
          rotation=180,
          origin={126.667,66.6664})));
    Modelica.Blocks.Interfaces.RealInput Ipcmd annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={120,-60}), iconTransformation(
          extent={{-3.63659,79.9998},{36.3659,39.9999}},
          rotation=180,
          origin={136.363,-0.0002})));
    Modelica.Blocks.Interfaces.RealOutput Iqmax annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-60,110})));
    Modelica.Blocks.Interfaces.RealOutput Iqmin annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={60,110})));
    Modelica.Blocks.Interfaces.RealOutput Ipmax annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-60,-110})));
    Modelica.Blocks.Interfaces.RealOutput Ipmin annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={60,-110})));
  equation

      local_I = if pqflag == false then sqrt(Imax) - sqrt(abs(Iqcmd)) else sqrt(Imax) - sqrt(abs(Ipcmd));
      post_local_I = if local_I < 0 then 0 else sqrt(local_I);

      Iqmax = if pqflag == false then min(VDL1_out, Imax) else min(post_local_I, VDL1_out);
      //Iqmax = if pqflag == false then VDL1_out else min(VDL1_out, sqrt((Imax^2) - (Ipcmd^2)));
      //Iqmax = if pqflag == false then min(VDL1_out, Imax) else min(VDL1_out, sqrt(Imax^2 - Ipcmd^2));
      //Iqmax = if pqflag == false then (if post_local_I < VDL1_out then post_local_I else VDL1_out) else (if post_local_I < VDL1_out then post_local_I else VDL1_out);

      Iqmin = -Iqmax;
      Ipmax = if pqflag == false then min(post_local_I, VDL2_out) else min(VDL2_out, Imax);
      //Ipmax = if pqflag == false then min(VDL2_out, sqrt(Imax^2 - Iqcmd^2)) else min(VDL2_out, Imax);
      Ipmin = 0;

    annotation (Icon(graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={28,108,200},
            fillColor={255,255,255},
            fillPattern=FillPattern.None),  Text(
            extent={{-60,40},{60,-40}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="CLL REECA(C)"),     Text(
            extent={{52,80},{92,40}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="IQCMD"),            Text(
            extent={{52,-40},{92,-80}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="IPCMD"),            Text(
            extent={{-90,80},{-50,40}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="VDL1"),             Text(
            extent={{-90,-40},{-50,-80}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="VDL2"),             Text(
            extent={{-68,98},{-28,58}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="IQMIN"),            Text(
            extent={{52,98},{92,58}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="IQMAX")}));
  end CCL_REECA;

  model SOC_logic "State of charge logic for REECC"
    Modelica.Blocks.Interfaces.RealInput SOC
      annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
    Modelica.Blocks.Interfaces.RealOutput ipmax_SOC
      annotation (Placement(transformation(extent={{100,-60},{120,-40}}),
          iconTransformation(extent={{100,-60},{120,-40}})));
    Modelica.Blocks.Interfaces.RealOutput ipmin_SOC
      annotation (Placement(transformation(extent={{100,40},{120,60}}),
          iconTransformation(extent={{100,40},{120,60}})));
          parameter Real SOCmin;
          parameter Real SOCmax;
  equation
    ipmax_SOC = if SOC <= SOCmin then 0 else 1;
    ipmin_SOC = if SOC >= SOCmax then 0 else 1;

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={28,108,200},
            fillColor={255,255,255},
            fillPattern=FillPattern.None),
          Text(
            extent={{-50,156},{48,74}},
            textColor={28,108,200},
            textString="SOC Logic"),
          Text(
            extent={{-90,12},{-60,-14}},
            textColor={28,108,200},
            textString="SOC"),
          Text(
            extent={{14,90},{94,10}},
            textColor={28,108,200},
            textString="IPMIN SOC"),
          Text(
            extent={{14,-10},{94,-90}},
            textColor={28,108,200},
            textString="IPMAX SOC")}),                             Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end SOC_logic;

  model CCL_REECC "Current limit logic for REECC"

    parameter OpenIPSL.Types.PerUnit start_ii;
    parameter OpenIPSL.Types.PerUnit start_ir;
    parameter Real Imax;

    Modelica.Blocks.Interfaces.RealInput VDL1_out annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-120,60}), iconTransformation(extent={{-140,80},{-100,40}})));
    Modelica.Blocks.Interfaces.BooleanInput pqflag annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={120,0}), iconTransformation(
          extent={{0,0},{40,40}},
          rotation=180,
          origin={140,20})));
    Modelica.Blocks.Interfaces.RealInput VDL2_out annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=0,
          origin={-120,-60}), iconTransformation(extent={{-140,-40},{-100,-80}})));
    Modelica.Blocks.Interfaces.RealInput Iqcmd(start = -start_ii) annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={120,60}), iconTransformation(
          extent={{-13.3335,-13.3336},{26.6673,26.6664}},
          rotation=180,
          origin={126.667,66.6664})));
    Modelica.Blocks.Interfaces.RealInput Ipcmd(start =  start_ir) annotation (Placement(
          transformation(
          extent={{-20,-20},{20,20}},
          rotation=180,
          origin={120,-60}), iconTransformation(
          extent={{-3.63659,79.9998},{36.3659,39.9999}},
          rotation=180,
          origin={136.363,-0.0002})));
    Modelica.Blocks.Interfaces.RealOutput Iqmax annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={-60,110})));
    Modelica.Blocks.Interfaces.RealOutput Iqmin annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={60,110})));
    Modelica.Blocks.Interfaces.RealOutput Ipmax annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={-60,-110})));
    Modelica.Blocks.Interfaces.RealOutput Ipmin annotation (Placement(
          transformation(
          extent={{-10,-10},{10,10}},
          rotation=270,
          origin={60,-110})));
  equation

      Iqmax = if pqflag == false then min(VDL1_out, Imax) else min(VDL1_out, sqrt(Imax^2 - Ipcmd^2));
      Iqmin = -Iqmax;
      Ipmax = if pqflag == false then min(VDL2_out, sqrt(Imax^2-Iqcmd^2)) else min(VDL2_out, Imax);
      Ipmin = -Ipmax;

    annotation (Icon(graphics={Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={28,108,200},
            fillColor={255,255,255},
            fillPattern=FillPattern.None),  Text(
            extent={{-60,40},{60,-40}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="CLL REECA(C)"),     Text(
            extent={{52,80},{92,40}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="IQCMD"),            Text(
            extent={{52,-40},{92,-80}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="IPCMD"),            Text(
            extent={{-90,80},{-50,40}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="VDL1"),             Text(
            extent={{-90,-40},{-50,-80}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="VDL2"),             Text(
            extent={{-68,98},{-28,58}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="IQMIN"),            Text(
            extent={{52,98},{92,58}},
            lineColor={28,108,200},
            lineThickness=0.5,
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid,
            textString="IQMAX")}));
  end CCL_REECC;

  model PI_WECC_VariableLimiter
    import Modelica.Units.SI;
    parameter SI.PerUnit K_P "Voltage regulator proportional gain (pu)";
    parameter SI.TimeAging K_I "Voltage regulator integral gain (pu)";
    parameter Real y_start;
    Modelica.Blocks.Continuous.Integrator    integral(
      k=K_I,
      use_reset=false,
      initType=Modelica.Blocks.Types.Init.InitialOutput,
      y_start=y_start)
      annotation (Placement(transformation(extent={{4,30},{24,50}})));
    Modelica.Blocks.Math.Gain proportional(k=K_P)
      annotation (Placement(transformation(extent={{-26,-50},{-6,-30}})));
    Modelica.Blocks.Math.Add PI_add
      annotation (Placement(transformation(extent={{38,-10},{58,10}})));
    Modelica.Blocks.Logical.Switch reset_switch
      annotation (Placement(transformation(extent={{-56,30},{-36,50}})));
    Modelica.Blocks.Sources.RealExpression realExpression
      annotation (Placement(transformation(extent={{-88,70},{-68,90}})));
    Modelica.Blocks.Interfaces.RealInput u
      annotation (Placement(transformation(extent={{-140,-80},{-100,-40}}),
          iconTransformation(extent={{-140,-80},{-100,-40}})));
    Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter1
      annotation (Placement(transformation(extent={{70,-10},{90,10}})));
    Modelica.Blocks.Interfaces.RealInput limit1
      "Connector of Real input signal used as maximum of input u" annotation (
        Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=270,
          origin={68,120})));
    Modelica.Blocks.Interfaces.RealInput limit2
      "Connector of Real input signal used as minimum of input u" annotation (
        Placement(transformation(
          extent={{-20,-20},{20,20}},
          rotation=90,
          origin={68,-120})));
    Modelica.Blocks.Logical.Or or1
      annotation (Placement(transformation(extent={{-92,30},{-72,50}})));
    Modelica.Blocks.Interfaces.BooleanInput voltage_dip
      "Connector of first Boolean input signal"
      annotation (Placement(transformation(extent={{-140,40},{-100,80}}),
          iconTransformation(extent={{-140,40},{-100,80}})));
  equation
    or1.u2 =
    if (abs(variableLimiter1.limit1 - y) <= Modelica.Constants.eps and der(integral.y)>0) then true
    else if (abs(variableLimiter1.limit2 - y) <= Modelica.Constants.eps and der(integral.y)<0) then true
    else false;
    connect(proportional.y, PI_add.u2) annotation (Line(points={{-5,-40},{30,-40},
            {30,-6},{36,-6}}, color={0,0,127}));
    connect(reset_switch.u1,realExpression. y)
      annotation (Line(points={{-58,48},{-58,80},{-67,80}},
                                                   color={0,0,127}));
    connect(reset_switch.u3,u)  annotation (Line(points={{-58,32},{-70,32},{-70,
            -60},{-120,-60}},
                       color={0,0,127}));
    connect(reset_switch.y,integral. u)
      annotation (Line(points={{-35,40},{2,40}},   color={0,0,127}));
    connect(proportional.u,u)
      annotation (Line(points={{-28,-40},{-70,-40},{-70,-60},{-120,-60}},
                                                  color={0,0,127}));
    connect(PI_add.y, variableLimiter1.u)
      annotation (Line(points={{59,0},{68,0}}, color={0,0,127}));
    connect(variableLimiter1.y, y)
      annotation (Line(points={{91,0},{110,0}}, color={0,0,127}));
    connect(variableLimiter1.limit1, limit1)
      annotation (Line(points={{68,8},{68,120}}, color={0,0,127}));
    connect(variableLimiter1.limit2, limit2)
      annotation (Line(points={{68,-8},{68,-120}}, color={0,0,127}));
    connect(integral.y, PI_add.u1)
      annotation (Line(points={{25,40},{30,40},{30,6},{36,6}}, color={0,0,127}));
    connect(or1.y, reset_switch.u2)
      annotation (Line(points={{-71,40},{-58,40}}, color={255,0,255}));
    connect(or1.u1, voltage_dip)
      annotation (Line(points={{-94,40},{-108,40},{-108,60},{-120,60}},
                                                    color={255,0,255}));
    annotation (
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}), Text(
            extent={{-80,40},{80,-40}},
            textColor={0,0,255},
            textString="PI WECC Renewables")}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}})));
  end PI_WECC_VariableLimiter;

  model PI_WECC_NoVariableLimiter
    import Modelica.Units.SI;
    parameter SI.PerUnit K_P "Voltage regulator proportional gain (pu)";
    parameter SI.TimeAging K_I "Voltage regulator integral gain (pu)";
    parameter SI.PerUnit V_RMAX "Maximum regulator output (pu)";
    parameter SI.PerUnit V_RMIN "Minimum regulator output (pu)";
    parameter Real y_start;
    Modelica.Blocks.Continuous.Integrator    integral(
      k=K_I,
      use_reset=false,
      initType=Modelica.Blocks.Types.Init.InitialOutput,
      y_start=y_start)
      annotation (Placement(transformation(extent={{-18,30},{2,50}})));
    Modelica.Blocks.Math.Gain proportional(k=K_P)
      annotation (Placement(transformation(extent={{-26,-50},{-6,-30}})));
    Modelica.Blocks.Math.Add PI_add
      annotation (Placement(transformation(extent={{38,-10},{58,10}})));
    Modelica.Blocks.Logical.Switch reset_switch
      annotation (Placement(transformation(extent={{-56,30},{-36,50}})));
    Modelica.Blocks.Sources.RealExpression realExpression
      annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
    Modelica.Blocks.Interfaces.RealInput u
      annotation (Placement(transformation(extent={{-140,-80},{-100,-40}}),
          iconTransformation(extent={{-140,-80},{-100,-40}})));
    Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Nonlinear.Limiter limiter(uMax=V_RMAX, uMin=V_RMIN)
      annotation (Placement(transformation(extent={{70,-10},{90,10}})));
    Modelica.Blocks.Logical.Or or1
      annotation (Placement(transformation(extent={{-92,30},{-72,50}})));
    Modelica.Blocks.Interfaces.BooleanInput voltage_dip
      "Connector of first Boolean input signal"
      annotation (Placement(transformation(extent={{-140,40},{-100,80}}),
          iconTransformation(extent={{-140,40},{-100,80}})));
  equation
    or1.u2 =
    if (abs(V_RMAX - y) <= Modelica.Constants.eps and der(integral.y)>0) then true
    else if (abs(V_RMIN - y) <= Modelica.Constants.eps and der(integral.y)<0) then true
    else false;
    connect(proportional.y, PI_add.u2) annotation (Line(points={{-5,-40},{30,-40},
            {30,-6},{36,-6}}, color={0,0,127}));
    connect(reset_switch.u1,realExpression. y)
      annotation (Line(points={{-58,48},{-60,48},{-60,80},{-69,80}},
                                                   color={0,0,127}));
    connect(reset_switch.u3,u)  annotation (Line(points={{-58,32},{-70,32},{-70,
            -60},{-120,-60}},
                       color={0,0,127}));
    connect(reset_switch.y,integral. u)
      annotation (Line(points={{-35,40},{-20,40}}, color={0,0,127}));
    connect(proportional.u,u)
      annotation (Line(points={{-28,-40},{-70,-40},{-70,-60},{-120,-60}},
                                                  color={0,0,127}));
    connect(PI_add.y, limiter.u)
      annotation (Line(points={{59,0},{68,0}}, color={0,0,127}));
    connect(limiter.y, y)
      annotation (Line(points={{91,0},{110,0}}, color={0,0,127}));
    connect(integral.y, PI_add.u1)
      annotation (Line(points={{3,40},{30,40},{30,6},{36,6}}, color={0,0,127}));
    connect(or1.u1,voltage_dip)
      annotation (Line(points={{-94,40},{-108,40},{-108,60},{-120,60}},
                                                    color={255,0,255}));
    connect(or1.y, reset_switch.u2)
      annotation (Line(points={{-71,40},{-58,40}}, color={255,0,255}));
    annotation (
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}), Text(
            extent={{-80,40},{80,-40}},
            textColor={0,0,255},
            textString="PI WECC Renewables")}),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
              100}})));
  end PI_WECC_NoVariableLimiter;
end BaseClasses;
