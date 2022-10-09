within OpenIPSL.Electrical.Wind.PSSE.WT4G;
model WT4G1 "Wind Generator Model with Power Converter (Type 4)"
  extends Icons.VerifiedModel;
  // Extending the PF component
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  // Model parameters
  parameter Types.ApparentPower M_b "Machine base power";
  parameter Types.Time T_IQCmd "Converter time constant for I_Qcmd";
  parameter Types.Time T_IPCmd "Converter time constant for I_Pcmd";
  parameter Types.PerUnit V_LVPL1 "LVPL voltage 1 (Low voltage power logic)";
  parameter Types.PerUnit V_LVPL2 "LVPL voltage 2";
  parameter Real G_LVPL "LVPL gain";
  parameter Types.PerUnit V_HVRCR "HVRCR voltage (High voltage reactive current limiter)";
  parameter Types.PerUnit CUR_HVRCR "HVRCR current (Max. reactive current at VHVRCR)";
  parameter Types.PerUnit RIp_LVPL "Rate of LVACR active current change";
  parameter Types.Time T_LVPL "Voltage sensor for LVACR time constant";
  // Variables
  Complex Is "Equivalent internal current source";
  OpenIPSL.Interfaces.PwPin p(
    vr(start=vr0),
    vi(start=vi0),
    ir(start=ir1),
    ii(start=ii1)) annotation (Placement(transformation(extent={{100,-10},{120,
            10}}), iconTransformation(extent={{100,-10},{120,10}})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag K1(
    K=1,
    T=T_IQCmd,
    y_start=Iy0)
    annotation (Placement(transformation(extent={{-30,70},{-20,80}})));
  Modelica.Blocks.Continuous.Integrator K(
    y_start=Ix0,
    k=1/T_IPCmd,
    initType=Modelica.Blocks.Types.Init.InitialOutput)
    annotation (Placement(transformation(extent={{-30,35},{-20,45}})));
  Modelica.Blocks.Interfaces.RealOutput Iy(start=Iy0) annotation (Placement(
        transformation(extent={{100,80},{120,100}}), iconTransformation(extent=
            {{100,-70},{120,-50}})));
  Modelica.Blocks.Interfaces.RealOutput V=VT annotation (Placement(
        transformation(extent={{110,-60},{128,-42}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,0})));
  Modelica.Blocks.Interfaces.RealOutput P(start=p0) annotation (Placement(
        transformation(extent={{110,-78},{128,-60}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,-40})));
  Modelica.Blocks.Interfaces.RealOutput Q(start=q0) annotation (Placement(
        transformation(extent={{110,-100},{128,-82}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,-80})));
  Modelica.Blocks.Math.Feedback Iperr(y(start=0, fixed=false))
    annotation (Placement(transformation(extent={{-80,35},{-70,45}})));
  OpenIPSL.Electrical.Wind.PSSE.Submodels.LVACL lVACL
    annotation (Placement(transformation(extent={{68,30},{88,50}})));
  OpenIPSL.Electrical.Wind.PSSE.Submodels.HVRCL hVRCL(VHVRCR=V_HVRCR, CurHVRCR=
        CUR_HVRCR)
    annotation (Placement(transformation(extent={{50,65},{70,85}})));
  Modelica.Blocks.Interfaces.RealOutput IyL(start=Iy0) annotation (Placement(
        transformation(extent={{100,65},{120,85}}), iconTransformation(extent={
            {100,70},{120,90}})));
  Modelica.Blocks.Interfaces.RealOutput IxL(start=Ix0) annotation (Placement(
        transformation(extent={{96,34},{114,52}}), iconTransformation(extent={{
            100,30},{120,50}})));
  OpenIPSL.Electrical.Wind.PSSE.Submodels.LVPL lVPL(
    VLVPL1=V_LVPL1,
    VLVPL2=V_LVPL2,
    GLVPL=G_LVPL)
    annotation (Placement(transformation(extent={{20,-40},{0,-20}})));
  Modelica.Blocks.Nonlinear.Limiter imLimited_max(uMin=-Modelica.Constants.inf,
      uMax=RIp_LVPL)
    annotation (Placement(transformation(extent={{-50,35},{-40,45}})));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter(y(start=Ipcmd0))
    annotation (Placement(transformation(extent={{20,35},{30,45}})));
  Modelica.Blocks.Sources.Constant const(k=-Modelica.Constants.inf)
    annotation (Placement(transformation(extent={{-4,25},{6,35}})));
  //Initialization parameters
  Modelica.Blocks.Interfaces.RealInput I_qcmd(start=Iy0) annotation (Placement(
        transformation(extent={{-110,65},{-90,85}}), iconTransformation(extent=
            {{-100,70},{-80,90}})));
  Modelica.Blocks.Interfaces.RealInput I_pcmd(start=Ipcmd0) annotation (
      Placement(transformation(extent={{-110,30},{-90,50}}), iconTransformation(
          extent={{-100,30},{-80,50}})));
  Modelica.Blocks.Interfaces.RealOutput I_qcmd0 annotation (Placement(
        transformation(extent={{-50,85},{-30,105}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,110})));
  Modelica.Blocks.Interfaces.RealOutput I_pcmd0 annotation (Placement(
        transformation(extent={{-78,85},{-58,105}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-20,110})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag K2(
    K=1,
    T=T_LVPL,
    y_start=v_0)
    annotation (Placement(transformation(extent={{46,-36},{34,-24}})));
protected
  Types.Angle delta(start=angle_0);
  Types.PerUnit VT(start=v_0) "Bus voltage magnitude";
  Types.Angle anglev(start=angle_0) "Bus voltage angle";
  parameter Types.PerUnit p0=P_0/M_b
    "initial value of bus active power in p.u. machinebase";
  parameter Types.PerUnit q0=Q_0/M_b
    "initial value of bus reactive power in p.u. machinebase";
  parameter Types.PerUnit vr0=v_0*cos(angle_0)
    "Real component of initial terminal voltage";
  parameter Types.PerUnit vi0=v_0*sin(angle_0)
    "Imaginary component of initial terminal voltage";
  parameter Types.PerUnit ir0=(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2)
    "Real component of initial armature current, M_b";
  parameter Types.PerUnit ii0=(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2)
    "Imaginary component of initial armature current, M_b";
  parameter Types.PerUnit Isr0=ir0 "Source current re M_b";
  parameter Types.PerUnit Isi0=ii0 "Source current im M_b";
  parameter Real CoB=M_b/S_b;
  parameter Types.PerUnit ir1=-CoB*(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2)
    "Real component of initial armature current, S_b";
  parameter Types.PerUnit ii1=-CoB*(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2)
    "Imaginary component of initial armature current, S_b";
  parameter Types.PerUnit Ipcmd0=Ix0;
  parameter Types.PerUnit Ix0=Isr0*cos(-angle_0) - Isi0*sin(-angle_0);
  parameter Types.PerUnit Iy0=-(Isr0*sin(-angle_0) + cos(-angle_0)*Isi0);
  Modelica.Blocks.Interfaces.RealInput Vtt=VT annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,-100}), iconTransformation(extent={{-110,52},{-94,68}})));
equation
  I_qcmd0 = Iy0;
  I_pcmd0 = Ix0;
  anglev = atan2(p.vi, p.vr);
  VT = sqrt(p.vr*p.vr + p.vi*p.vi);
  delta = anglev;
  Is.re = p.ir/CoB;
  Is.im = p.ii/CoB;
  [IxL; -IyL] = -[cos(delta), sin(delta); -sin(delta), cos(delta)]*[Is.re; Is.im];
  -P = p.vr*p.ir + p.vi*p.ii;
  -Q = p.vi*p.ir - p.vr*p.ii;
  connect(Iperr.u1, I_pcmd) annotation (Line(
      points={{-79,40},{-100,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(lVACL.Ip_LVACL, IxL) annotation (Line(
      points={{89,40},{93.745,40},{93.745,43},{105,43}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hVRCL.Iq_HVRCL, IyL) annotation (Line(
      points={{72.5,75},{110,75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(I_qcmd, K1.u)
    annotation (Line(points={{-100,75},{-67,75},{-31,75}}, color={0,0,127}));
  connect(Iperr.y, imLimited_max.u)
    annotation (Line(points={{-70.5,40},{-51,40}}, color={0,0,127}));
  connect(imLimited_max.y, K.u)
    annotation (Line(points={{-39.5,40},{-31,40}}, color={0,0,127}));
  connect(K.y, variableLimiter.u)
    annotation (Line(points={{-19.5,40},{-19.5,40},{19,40}}, color={0,0,127}));
  connect(variableLimiter.y, lVACL.Ip_LVPL)
    annotation (Line(points={{30.5,40},{69,40}}, color={0,0,127}));
  connect(Iperr.u2, lVACL.Ip_LVPL) annotation (Line(points={{-75,36},{-75,20},{
          46,20},{46,40},{69,40}}, color={0,0,127}));
  connect(const.y, variableLimiter.limit2) annotation (Line(points={{6.5,30},{
          10,30},{10,36},{19,36}}, color={0,0,127}));
  connect(K1.y, hVRCL.Iq)
    annotation (Line(points={{-19.5,75},{51.25,75}}, color={0,0,127}));
  connect(Iy, hVRCL.Iq) annotation (Line(points={{110,90},{0,90},{0,75},{51.25,
          75}}, color={0,0,127}));
  connect(lVPL.LVPL, variableLimiter.limit1) annotation (Line(points={{-1,-30},
          {-12,-30},{-12,44},{19,44}},
                                     color={0,0,127}));
  connect(Vtt, hVRCL.Vt) annotation (Line(points={{60,-100},{60,66.25},{60,
          66.25}}, color={0,0,127}));
  connect(lVACL.Vt, hVRCL.Vt) annotation (Line(points={{78,31},{78,-30},{60,-30},
          {60,66.25}}, color={0,0,127}));
  connect(lVPL.Vt, K2.y)
    annotation (Line(points={{19,-30},{33.4,-30}}, color={0,0,127}));
  connect(K2.u, hVRCL.Vt) annotation (Line(points={{47.2,-30},{60,-30},{60,
          66.25}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={Text(
          extent={{-55,51},{-36,48}},
          textColor={0,0,127},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="RIp_LVPL"),Text(
          extent={{12,62},{36,56}},
          textColor={0,0,127},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid,
          textString="LVPL"),Text(
          extent={{-98,-78},{0,-100}},
          textColor={255,0,0},
          textStyle={TextStyle.Bold},
          horizontalAlignment=TextAlignment.Left,
          textString="Source impedance is not used for WT4G1.
But some value other than zero should be
specified at PSSE model dialog")}),
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Text(
          extent={{-34,18},{42,-14}},
          textColor={28,108,200},
          textString="WT4G1"),Text(
          extent={{-76,86},{-42,74}},
          textColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="I_qcmd"),Text(
          extent={{-76,46},{-42,34}},
          textColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="I_pcmd"),Text(
          extent={{-94,6},{-80,-6}},
          textColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="V"),Text(
          extent={{-94,-34},{-80,-46}},
          textColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="P"),Text(
          extent={{-96,-74},{-82,-86}},
          textColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Q"),Text(
          extent={{-80,100},{-40,88}},
          textColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="I_qcmd0"),Text(
          extent={{-36,100},{4,88}},
          textColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="I_pcmd0"),Text(
          extent={{74,86},{98,74}},
          textColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="I_yL"),Text(
          extent={{74,46},{98,34}},
          textColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="I_xL"),Text(
          extent={{76,-54},{100,-66}},
          textColor={28,108,200},
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="I_y")}),
    Documentation(info="<html>Wind Generator Model with Power Converter WT4G1.</html>",
    revisions="<html><table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
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
end WT4G1;
