within OpenIPSL.Tests.Renewable.PSSE;
model PVPlant2
  "PV source in a SMIB system to test functionality of REPCA plant controller model"
  extends BaseClasses.SMIBRenewable2(SysData(fn=60), freq(k=SysData.fn));
  Electrical.Renewables.PSSE.InverterInterface.REGCA1 rEGCA1_1
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Electrical.Renewables.PSSE.ElectricalController.REECB1 rEECB1_1(
    pfflag=false,
    vflag=true,
    qflag=true)
    annotation (Placement(transformation(extent={{-76,-60},{-56,-40}})));
equation
  connect(rEGCA1_1.p, GEN1.p) annotation (Line(points={{-20,-50},{-10,-50},{-10,
          -24},{-48,-24},{-48,0},{-30,0}}, color={0,0,255}));
  connect(rEECB1_1.Iqcmd, rEGCA1_1.Iqcmd) annotation (Line(points={{-55.6667,
          -44.3333},{-48.5476,-44.3333},{-48.5476,-44.2857},{-41.4286,-44.2857}},
        color={0,0,127}));
  connect(rEECB1_1.Ipcmd, rEGCA1_1.Ipcmd) annotation (Line(points={{-55.6667,
          -55.6667},{-48.5476,-55.6667},{-48.5476,-55.7143},{-41.4286,-55.7143}},
        color={0,0,127}));
  connect(rEECB1_1.iq0, rEGCA1_1.IQ0) annotation (Line(points={{-58,-60.6667},{
          -58,-66},{-38.5714,-66},{-38.5714,-60.7143}}, color={0,0,127}));
  connect(rEECB1_1.ip0, rEGCA1_1.IP0) annotation (Line(points={{-62,-60.6667},{
          -62,-70},{-34.2857,-70},{-34.2857,-60.7143}}, color={0,0,127}));
  connect(rEECB1_1.v0, rEGCA1_1.V_0) annotation (Line(points={{-66,-60.6667},{
          -66,-74},{-30,-74},{-30,-60.7143}}, color={0,0,127}));
  connect(rEECB1_1.q0, rEGCA1_1.q_0) annotation (Line(points={{-70,-60.6667},{
          -70,-78},{-25.7143,-78},{-25.7143,-60.7143}}, color={0,0,127}));
  connect(rEECB1_1.p0, rEGCA1_1.p_0) annotation (Line(points={{-74,-60.6667},{
          -74,-82},{-21.4286,-82},{-21.4286,-60.7143}}, color={0,0,127}));
  connect(rEECB1_1.Pref, rEGCA1_1.p_0) annotation (Line(points={{-76.6667,
          -55.3333},{-80,-55.3333},{-80,-90},{-21.4286,-90},{-21.4286,-60.7143}},
        color={0,0,127}));
  connect(rEECB1_1.Qext, rEGCA1_1.q_0) annotation (Line(points={{-76.6667,
          -52.6667},{-84,-52.6667},{-84,-94},{-25.7143,-94},{-25.7143,-60.7143}},
        color={0,0,127}));
  connect(rEGCA1_1.V_t, rEECB1_1.Vt) annotation (Line(points={{-35.7143,
          -39.2857},{-35.7143,-34},{-80,-34},{-80,-44.6667},{-76.6667,-44.6667}},
        color={0,0,127}));
  connect(rEGCA1_1.Pgen, rEECB1_1.Pe) annotation (Line(points={{-30,-39.2857},{
          -30,-30},{-84,-30},{-84,-47.3333},{-76.6667,-47.3333}}, color={0,0,
          127}));
  connect(rEGCA1_1.Qgen, rEECB1_1.Qgen) annotation (Line(points={{-24.2857,
          -39.2857},{-24.2857,-26},{-88,-26},{-88,-50},{-76.6667,-50}}, color={
          0,0,127}));
  annotation (experiment(
      StopTime=5,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
Simulate for 5 seconds.
</p>
<p>This test system aims to show how to use the renewable PV plant component in all the possible control options. The model was developed following the
modeling template from the WECC PV Power Plant Dynamic Modeling Guide and PSSE manuals.</p>
<p>There are a total of eight reactive power control options (Constant local PF control, Constant local Q control, Local V control, Local coordinated
 V/Q control, Plant level Q control, Plant level V control, Plant level Q control + local coordinated V/Q control, Plant level V control + local
coordinated V/Q control), 2 active power options (No governor response, Governor response with up and down regulation).</p>
<p>Variables of interest:</p>
<ul>
<li><code>pV.RenewableGenerator.Pgen</code></li>
<li><code>pV.RenewableGenerator.Qgen</code></li>
<li><code>GEN1.v</code></li>
<li><code>FAULT.v</code></li>
<li><code>GEN2.v</code></li>
</ul>
</html>"));
end PVPlant2;
