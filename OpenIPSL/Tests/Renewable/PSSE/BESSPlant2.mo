within OpenIPSL.Tests.Renewable.PSSE;
model BESSPlant2
  "BESS source in a SMIB system to test functionality of REPCA plant controller model"
  extends BaseClasses.SMIBRenewable2;
  Electrical.Renewables.PSSE.InverterInterface.REGCA1 rEGCA1_1
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Examples.ModelPredictiveControl.GenerationUnits.REECCU1 rEECCU1_1(
    pfflag=false,
    vflag=false,
    qflag=false,
    pqflag=false,
    Kqv=0,
    Kqp=1,
    Kvp=1,
    T=0.01)
    annotation (Placement(transformation(extent={{-72,-60},{-52,-40}})));
  Modelica.Blocks.Sources.Constant PAUX(k=0)
    annotation (Placement(transformation(extent={{-98,-76},{-88,-66}})));
equation
  connect(rEECCU1_1.Ipcmd, rEGCA1_1.Ipcmd) annotation (Line(points={{-51.6667,
          -55.6667},{-46.5476,-55.6667},{-46.5476,-55.7143},{-41.4286,-55.7143}},
        color={0,0,127}));
  connect(rEECCU1_1.Iqcmd, rEGCA1_1.Iqcmd) annotation (Line(points={{-51.6667,
          -44.3333},{-46.5476,-44.3333},{-46.5476,-44.2857},{-41.4286,-44.2857}},
        color={0,0,127}));
  connect(rEGCA1_1.V_t, rEECCU1_1.Vt) annotation (Line(points={{-35.7143,
          -39.2857},{-35.7143,-36},{-76,-36},{-76,-42},{-72.6667,-42}}, color={
          0,0,127}));
  connect(rEGCA1_1.Pgen, rEECCU1_1.Pe) annotation (Line(points={{-30,-39.2857},
          {-30,-34},{-78,-34},{-78,-44.6667},{-72.6667,-44.6667}}, color={0,0,
          127}));
  connect(rEGCA1_1.Qgen, rEECCU1_1.Qgen) annotation (Line(points={{-24.2857,
          -39.2857},{-24.2857,-32},{-80,-32},{-80,-47.3333},{-72.6667,-47.3333}},
        color={0,0,127}));
  connect(rEGCA1_1.IQ0, rEECCU1_1.iq0) annotation (Line(points={{-38.5714,
          -60.7143},{-38.5714,-64},{-54,-64},{-54,-60.6667}}, color={0,0,127}));
  connect(rEGCA1_1.IP0, rEECCU1_1.ip0) annotation (Line(points={{-34.2857,
          -60.7143},{-34.2857,-66},{-58,-66},{-58,-60.6667}}, color={0,0,127}));
  connect(rEGCA1_1.V_0, rEECCU1_1.v0) annotation (Line(points={{-30,-60.7143},{
          -30,-68},{-62,-68},{-62,-60.6667}}, color={0,0,127}));
  connect(rEGCA1_1.q_0, rEECCU1_1.q0) annotation (Line(points={{-25.7143,
          -60.7143},{-25.7143,-70},{-66,-70},{-66,-60.6667}}, color={0,0,127}));
  connect(rEGCA1_1.p_0, rEECCU1_1.p0) annotation (Line(points={{-21.4286,
          -60.7143},{-21.4286,-72},{-70,-72},{-70,-60.6667}}, color={0,0,127}));
  connect(rEGCA1_1.p, GEN1.p) annotation (Line(points={{-20,-50},{-10,-50},{-10,
          -24},{-48,-24},{-48,0},{-30,0}}, color={0,0,255}));
  connect(PAUX.y, rEECCU1_1.Paux) annotation (Line(points={{-87.5,-71},{-80,-71},
          {-80,-55.3333},{-72.6667,-55.3333}}, color={0,0,127}));
  connect(rEECCU1_1.Pref, rEGCA1_1.p_0) annotation (Line(points={{-72.6667,
          -52.6667},{-76,-52.6667},{-76,-80},{-21.4286,-80},{-21.4286,-60.7143}},
        color={0,0,127}));
  connect(rEECCU1_1.Qext, rEGCA1_1.q_0) annotation (Line(points={{-72.6667,-50},
          {-78,-50},{-78,-84},{-25.7143,-84},{-25.7143,-60.7143}}, color={0,0,
          127}));
  annotation (experiment(
      StopTime=5,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"),                                Documentation(
        info="<html>
<p>
Simulate for 5 seconds.
</p>
<p>This test system aims to show how to use the renewable BESS plant component in all the possible control options. The model was developed following the
modeling template from the WECC BESS Power Plant Dynamic Modeling Guide and PSSE manuals.</p>
<p>There are a total of eight reactive power control options (Constant local PF control, Constant local Q control, Local V control, Local coordinated
 V/Q control, Plant level Q control, Plant level V control, Plant level Q control + local coordinated V/Q control, Plant level V control + local
coordinated V/Q control), 2 active power options (No governor response, Governor response with up and down regulation).</p>
<p>Variables of interest:</p>
<ul>
<li><code>bESS.RenewableGenerator.Pgen</code></li>
<li><code>bESS.RenewableGenerator.Qgen</code></li>
<li><code>GEN1.v</code></li>
<li><code>FAULT.v</code></li>
<li><code>GEN2.v</code></li>
</ul>
</html>"));
end BESSPlant2;
