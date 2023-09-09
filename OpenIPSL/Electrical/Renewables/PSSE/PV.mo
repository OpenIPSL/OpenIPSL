within OpenIPSL.Electrical.Renewables.PSSE;
model PV "Framework for a photovoltaic plant including controllers"
extends OpenIPSL.Electrical.Essentials.pfComponent(
    final enablefn=false,
    final enableV_b=false,
    final enableangle_0=true,
    final enablev_0=true,
    final enableQ_0=true,
    final enableP_0=true,
    final enabledisplayPF=true,
    final enableS_b=true);

  // Parameters for selection
  parameter Integer QFunctionality = 0 "BESS Reactive Power Control Options" annotation (Dialog(group= "Reactive Power Control Options"), choices(choice=0 "Constant local PF control", choice=1 "Constant local Q control", choice=2 "Local V control", choice=3 "Local coordinated V/Q control", choice=4 "Plant level Q control", choice=5 "Plant level V control", choice=6 "Plant level Q control + local coordinated V/Q control", choice=7 "Plant level V control + local coordinated V/Q control"));
  parameter Integer PFunctionality = 0 "BESS Real Power Control Options" annotation (Dialog(group= "Active Power Control Options", enable=(QFunctionality >=4)), choices(choice=0 "No governor response", choice=1 "Governor response with up and down regulation"));

  replaceable
    OpenIPSL.Electrical.Renewables.PSSE.InverterInterface.BaseClasses.BaseREGC
    RenewableGenerator(
    P_0=P_0,
    Q_0=Q_0,
    v_0=v_0,
    angle_0=angle_0) annotation (choicesAllMatching=true, Placement(
        transformation(extent={{30,-20},{70,20}})));
  replaceable
    OpenIPSL.Electrical.Renewables.PSSE.ElectricalController.BaseClasses.BaseREECB
    RenewableController(
    pfflag=pfflag,
    vflag=vflag,
    qflag=qflag,
    pqflag=false) annotation (choicesAllMatching=true, Placement(transformation(
          extent={{-20,-20},{20,20}})));
  Interfaces.PwPin pwPin
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  replaceable
    OpenIPSL.Electrical.Renewables.PSSE.PlantController.BaseClasses.BaseREPC
    PlantController(
    P_0=P_0,
    Q_0=Q_0,
    v_0=v_0,
    angle_0=angle_0,
    fflag=fflag,
    refflag=refflag) if QFunctionality >= 4 annotation (choicesAllMatching=true,
      Placement(transformation(extent={{-78,-20},{-38,20}})));
  Modelica.Blocks.Math.Gain gain(k=1)
                                 if QFunctionality < 4
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=180,
        origin={-6,-60})));
  Modelica.Blocks.Math.Gain gain1(k=1)
                                  if QFunctionality < 4
    annotation (Placement(transformation(
        extent={{-6,6},{6,-6}},
        rotation=180,
        origin={-6,-80})));
  Modelica.Blocks.Sources.Constant freq_ref(k=SysData.fn) if QFunctionality >= 4
    annotation (Placement(transformation(extent={{-70,-60},{-80,-50}})));
  Modelica.Blocks.Interfaces.RealInput FREQ if QFunctionality >= 4 "Connection Point Frequency"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));

  Modelica.Blocks.Interfaces.RealInput branch_ir if QFunctionality >= 4 "Measured Branch Real Current"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-80,120}),iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={60,-100})));
  Modelica.Blocks.Interfaces.RealInput branch_ii if QFunctionality >= 4 "Measured Branch Imaginary Current"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-40,120}),iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-60,-100})));
  Modelica.Blocks.Interfaces.RealInput regulate_vr if QFunctionality >= 4 "Regulated Branch Real Voltage"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={40,120}),iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-60,100})));
  Modelica.Blocks.Interfaces.RealInput regulate_vi if QFunctionality >= 4 "Regulated Branch Imaginary Voltage"
    annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={80,120}),iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,100})));
protected
      parameter Boolean pfflag = (if QFunctionality == 0 then true else false);
      parameter Boolean vflag = (if QFunctionality == 3 or QFunctionality == 6 or QFunctionality == 7 then true else false);
      parameter Boolean qflag = (if QFunctionality == 2 or QFunctionality == 3 or QFunctionality == 6 or QFunctionality == 7 then true else false);
      parameter Boolean refflag = (if QFunctionality == 5 or QFunctionality == 7 then true else false);
      parameter Boolean fflag = (if PFunctionality == 1 then true else false);
equation
  connect(RenewableController.Iqcmd, RenewableGenerator.Iqcmd)
    annotation (Line(points={{20.6667,11.3333},{23.9048,11.3333},{23.9048,
          11.4286},{27.1429,11.4286}},                   color={0,0,127}));
  connect(RenewableGenerator.IQ0, RenewableController.iq0) annotation (Line(
        points={{32.8571,-21.4286},{32.8571,-28},{16,-28},{16,-21.3333}},
        color={0,0,127}));
  connect(RenewableGenerator.IP0, RenewableController.ip0) annotation (Line(
        points={{41.4286,-21.4286},{41.4286,-32},{8,-32},{8,-21.3333}}, color=
         {0,0,127}));
  connect(RenewableGenerator.V_0, RenewableController.v0) annotation (Line(
        points={{50,-21.4286},{50,-36},{0,-36},{0,-21.3333}}, color={0,0,127}));
  connect(RenewableGenerator.q_0, RenewableController.q0) annotation (Line(
        points={{58.5714,-21.4286},{58.5714,-40},{-8,-40},{-8,-21.3333}},
                                                                        color={0,
          0,127}));
  connect(RenewableGenerator.p_0, RenewableController.p0) annotation (Line(
        points={{67.1429,-21.4286},{67.1429,-44},{-16,-44},{-16,-21.3333}},
        color={0,0,127}));
  connect(RenewableGenerator.V_t, RenewableController.Vt) annotation (Line(
        points={{38.5714,21.4286},{38.5714,26},{-26,26},{-26,10.6667},{-21.3333,
          10.6667}}, color={0,0,127}));
  connect(RenewableGenerator.Pgen, RenewableController.Pe) annotation (Line(
        points={{50,21.4286},{50,30},{-28,30},{-28,5.33333},{-21.3333,5.33333}},
        color={0,0,127}));
  connect(RenewableGenerator.Qgen, RenewableController.Qgen) annotation (Line(
        points={{61.4286,21.4286},{61.4286,34},{-30,34},{-30,0},{-21.3333,0}},
        color={0,0,127}));
  connect(PlantController.Qext, RenewableController.Qext) annotation (Line(
        points={{-37,10},{-32,10},{-32,-5.33333},{-21.3333,-5.33333}}, color={0,
          0,127}));
  connect(PlantController.Pref, RenewableController.Pref) annotation (Line(
        points={{-37,-10},{-38,-10},{-38,-10.6667},{-21.3333,-10.6667}}, color={
          0,0,127}));
  connect(PlantController.p0, RenewableController.p0) annotation (Line(points={{-70,-22},
          {-70,-44},{-16,-44},{-16,-21.3333}},                    color={0,0,127}));
  connect(PlantController.v0, RenewableController.v0) annotation (Line(points={{-58,-22},
          {-58,-36},{0,-36},{0,-21.3333}},          color={0,0,127}));
  connect(PlantController.q0, RenewableController.q0) annotation (Line(points={{-46,-22},
          {-46,-40},{-8,-40},{-8,-21.3333}},          color={0,0,127}));
  connect(gain.u, RenewableGenerator.p_0) annotation (Line(points={{1.2,-60},{
          67.1429,-60},{67.1429,-21.4286}},
                                    color={0,0,127}));
  connect(gain1.y, RenewableController.Qext) annotation (Line(points={{-12.6,
          -80},{-32,-80},{-32,-5.33333},{-21.3333,-5.33333}},
                                                         color={0,0,127}));
  connect(gain.y, RenewableController.Pref) annotation (Line(points={{-12.6,-60},
          {-30,-60},{-30,-10.6667},{-21.3333,-10.6667}}, color={0,0,127}));
  connect(gain1.u, RenewableGenerator.q_0) annotation (Line(points={{1.2,-80},{
          58.5714,-80},{58.5714,-21.4286}},
                                    color={0,0,127}));
  connect(freq_ref.y, PlantController.Freq_ref) annotation (Line(points={{-80.5,
          -55},{-88,-55},{-88,-12},{-80,-12}}, color={0,0,127}));
  connect(PlantController.Plant_pref, RenewableGenerator.p_0) annotation (Line(
        points={{-80,4},{-96,4},{-96,-92},{67.1429,-92},{67.1429,-21.4286}},
        color={0,0,127}));
  connect(PlantController.Qref, RenewableGenerator.q_0) annotation (Line(points={{-80,12},
          {-98,12},{-98,-98},{58.5714,-98},{58.5714,-21.4286}},          color={
          0,0,127}));
  connect(RenewableGenerator.p, pwPin)
    annotation (Line(points={{70,0},{100,0}}, color={0,0,255}));
  connect(PlantController.Freq, FREQ) annotation (Line(points={{-80,-4},{-92,-4},{-92,0},{-120,0}},
                             color={0,0,127}));
  connect(PlantController.branch_ii, branch_ii) annotation (Line(points={{-62,22},{-62,96},{-40,96},{-40,120}},
                                           color={0,0,127}));
  connect(PlantController.branch_ir, branch_ir) annotation (Line(points={{-72,22},{-72,96},{-80,96},{-80,120}},
                                           color={0,0,127}));
  connect(PlantController.regulate_vr, regulate_vr) annotation (Line(points={{-52,22},{-52,94},{40,94},{40,120}},
                                         color={0,0,127}));
  connect(PlantController.regulate_vi, regulate_vi) annotation (Line(points={{-44,22},{-44,92},{80,92},{80,120}},
                                         color={0,0,127}));
  connect(RenewableController.Ipcmd, RenewableGenerator.Ipcmd) annotation (Line(points={{20.6667,
          -11.3333},{23.9048,-11.3333},{23.9048,-11.4286},{27.1429,-11.4286}},                                                                                        color={0,0,127}));
  annotation (Icon(graphics={      Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid),
                         Text(
          extent={{-40,20},{40,-20}},
          lineColor={0,0,0},
          textString="%name"), Line(
          points={{-20,20},{-44,42},{-66,32},{-80,0}},
          color={0,0,0},
          smooth=Smooth.Bezier), Line(
          points={{20,-20},{44,-42},{66,-32},{80,0}},
          color={0,0,0},
          smooth=Smooth.Bezier)}),
    Documentation(info="<html>
   <p>
      This model is meant as a simple framework to create a photovoltaic power plant that consists of:
   </p>
   <ul>
      <li>Generator/Converter</li>
      <li>Electrical Controller</li>
      <li>Plant Controller</li>
   </ul>
   <p>
      The type of each can be selected via a drop down list where also
      a deactivation is provided (normally via feed through).
   </p>
   <p>
      The type of control configuration can also be selected via drop down list.
   </p>
</html>"));
end PV;
