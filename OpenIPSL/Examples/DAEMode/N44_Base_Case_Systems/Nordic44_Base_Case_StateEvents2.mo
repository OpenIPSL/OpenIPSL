within OpenIPSL.Examples.DAEMode.N44_Base_Case_Systems;
model Nordic44_Base_Case_StateEvents2
    "Modified version of the original Nordic 44 model, used to simulate with DAE mode"
  extends Modelica.Icons.Example;
    OpenIPSL.Electrical.Buses.BusExt bus_7020(
      nn=1,
      np=1,
      v_0=PF_results.voltages.V7020,
      angle_0=PF_results.voltages.A7020,
      V_b=420000)
      annotation (Placement(transformation(extent={{-282,-20},{-280,-10}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus7020(
      V_b=420000,
      v_0=PF_results.voltages.V7020,
      angle_0=PF_results.voltages.A7020,
      P_0=PF_results.loads.PL7020_1,
      Q_0=PF_results.loads.QL7020_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-288.25,-15.75})));
    OpenIPSL.Electrical.Buses.BusExt bus_7000(
      nn=16,
      np=4,
      v_0=PF_results.voltages.V7000,
      angle_0=PF_results.voltages.A7000,
      V_b=420000)
      annotation (Placement(transformation(extent={{-272,-108},{-270,-36}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus7000(
      V_b=420000,
      v_0=PF_results.voltages.V7000,
      angle_0=PF_results.voltages.A7000,
      P_0=PF_results.loads.PL7000_1,
      Q_0=PF_results.loads.QL7000_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2,-2},{2,2}},
          rotation=270,
          origin={-286,-36})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus7000(
      V_b=420000,
      v_0=PF_results.voltages.V7000,
      angle_0=PF_results.voltages.A7000,
      P_0=PF_results.loads.PL7000_2,
      Q_0=PF_results.loads.QL7000_2,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2,-2},{2,2}},
          rotation=270,
          origin={-286,-42})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load3_bus7000(
      V_b=420000,
      v_0=PF_results.voltages.V7000,
      angle_0=PF_results.voltages.A7000,
      P_0=PF_results.loads.PL7000_3,
      Q_0=PF_results.loads.QL7000_3,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2,-2},{2,2}},
          rotation=270,
          origin={-286,-48})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load4_bus7000(
      V_b=420000,
      v_0=PF_results.voltages.V7000,
      angle_0=PF_results.voltages.A7000,
      P_0=PF_results.loads.PL7000_4,
      Q_0=PF_results.loads.QL7000_4,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2,-2},{2,2}},
          rotation=270,
          origin={-286,-54})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load5_bus7000(
      V_b=420000,
      v_0=PF_results.voltages.V7000,
      angle_0=PF_results.voltages.A7000,
      P_0=PF_results.loads.PL7000_5,
      Q_0=PF_results.loads.QL7000_5,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2,-2},{2,2}},
          rotation=270,
          origin={-288,-60})));
    N44.Base_Case.Generators.Gen1_bus_7000 G1_bus7000(
      P_0=PF_results.machines.P7000_1,
      Q_0=PF_results.machines.Q7000_1,
      V_b=420000,
      v_0=PF_results.voltages.V7000,
      angle_0=PF_results.voltages.A7000)
      annotation (Placement(transformation(extent={{-292,-82},{-286,-76}})));
    N44.Base_Case.Generators.Gen1_bus_7000 G2_bus7000(
      P_0=PF_results.machines.P7000_2,
      Q_0=PF_results.machines.Q7000_2,
      V_b=420000,
      v_0=PF_results.voltages.V7000,
      angle_0=PF_results.voltages.A7000)
      annotation (Placement(transformation(extent={{-292,-90},{-286,-84}})));
    N44.Base_Case.Generators.Gen1_bus_7000 G3_bus7000(
      P_0=PF_results.machines.P7000_3,
      Q_0=PF_results.machines.Q7000_3,
      V_b=420000,
      v_0=PF_results.voltages.V7000,
      angle_0=PF_results.voltages.A7000)
      annotation (Placement(transformation(extent={{-292,-98},{-286,-92}})));
    N44.Base_Case.Generators.Gen1_bus_7000 G4_bus7000(
      P_0=PF_results.machines.P7000_4,
      Q_0=PF_results.machines.Q7000_4,
      V_b=420000,
      v_0=PF_results.voltages.V7000,
      angle_0=PF_results.voltages.A7000)
      annotation (Placement(transformation(extent={{-292,-106},{-286,-100}})));
    N44.Base_Case.Generators.Gen1_bus_7000 G5_bus7000(
      P_0=PF_results.machines.P7000_5,
      Q_0=PF_results.machines.Q7000_5,
      V_b=420000,
      v_0=PF_results.voltages.V7000,
      angle_0=PF_results.voltages.A7000)
      annotation (Placement(transformation(extent={{-292,-114},{-286,-108}})));
    N44.Base_Case.Generators.Gen1_bus_7000 G6_bus7000(
      P_0=PF_results.machines.P7000_6,
      Q_0=PF_results.machines.Q7000_6,
      V_b=420000,
      v_0=PF_results.voltages.V7000,
      angle_0=PF_results.voltages.A7000)
      annotation (Placement(transformation(extent={{-292,-122},{-286,-116}})));
    N44.Base_Case.Generators.Gen1_bus_7000 G7_bus7000(
      P_0=PF_results.machines.P7000_7,
      Q_0=PF_results.machines.Q7000_7,
      V_b=420000,
      v_0=PF_results.voltages.V7000,
      angle_0=PF_results.voltages.A7000)
      annotation (Placement(transformation(extent={{-292,-130},{-286,-124}})));
    N44.Base_Case.Generators.Gen1_bus_7000 G8_bus7000(
      P_0=PF_results.machines.P7000_8,
      Q_0=PF_results.machines.Q7000_8,
      V_b=420000,
      v_0=PF_results.voltages.V7000,
      angle_0=PF_results.voltages.A7000)
      annotation (Placement(transformation(extent={{-292,-138},{-286,-132}})));
    N44.Base_Case.Generators.Gen1_bus_7000 G9_bus7000(
      P_0=PF_results.machines.P7000_9,
      Q_0=PF_results.machines.Q7000_9,
      V_b=420000,
      v_0=PF_results.voltages.V7000,
      angle_0=PF_results.voltages.A7000)
      annotation (Placement(transformation(extent={{-292,-146},{-286,-140}})));
    OpenIPSL.Electrical.Buses.BusExt bus_7010(
      nn=1,
      np=1,
      v_0=PF_results.voltages.V7010,
      angle_0=PF_results.voltages.A7010,
      V_b=420000) annotation (Placement(transformation(extent={{-282,0},{-280,10}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus7010(
      V_b=420000,
      v_0=PF_results.voltages.V7010,
      angle_0=PF_results.voltages.A7010,
      P_0=PF_results.loads.PL7010_1,
      Q_0=PF_results.loads.QL7010_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-288.25,4.25})));
    N44.Base_Case.Generators.Gen3_bus_7100 G1_bus7100(
      V_b=420000,
      v_0=PF_results.voltages.V7100,
      angle_0=PF_results.voltages.A7100,
      P_0=PF_results.machines.P7100_1,
      Q_0=PF_results.machines.Q7100_1)
      annotation (Placement(transformation(extent={{-266,-14},{-260,-8}})));
    N44.Base_Case.Generators.Gen3_bus_7100 G2_bus7100(
      V_b=420000,
      v_0=PF_results.voltages.V7100,
      angle_0=PF_results.voltages.A7100,
      P_0=PF_results.machines.P7100_2,
      Q_0=PF_results.machines.Q7100_2)
      annotation (Placement(transformation(extent={{-266,-20},{-260,-14}})));
    N44.Base_Case.Generators.Gen3_bus_7100 G3_bus7100(
      V_b=420000,
      v_0=PF_results.voltages.V7100,
      angle_0=PF_results.voltages.A7100,
      P_0=PF_results.machines.P7100_3,
      Q_0=PF_results.machines.Q7100_3)
      annotation (Placement(transformation(extent={{-266,-26},{-260,-20}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus7100(
      V_b=420000,
      v_0=PF_results.voltages.V7100,
      angle_0=PF_results.voltages.A7100,
      P_0=PF_results.loads.PL7100_1,
      Q_0=PF_results.loads.QL7100_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2,-2},{2,2}},
          rotation=270,
          origin={-264,-30})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus7100(
      V_b=420000,
      v_0=PF_results.voltages.V7100,
      angle_0=PF_results.voltages.A7100,
      P_0=PF_results.loads.PL7100_2,
      Q_0=PF_results.loads.QL7100_2,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2,-2},{2,2}},
          rotation=270,
          origin={-264,-35})));
    OpenIPSL.Electrical.Buses.BusExt bus_7100(
      nn=8,
      np=3,
      v_0=PF_results.voltages.V7100,
      angle_0=PF_results.voltages.A7100,
      V_b=420000)
      annotation (Placement(transformation(extent={{-252,-52},{-250,-14}})));
    OpenIPSL.Electrical.Branches.PwLine line_7000_7010(
      R=0.000000,
      X=0.010000,
      G=0,
      B=0.000000) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-275,-1})));
    OpenIPSL.Electrical.Branches.PwLine line_7000_7020(
      R=0.000000,
      X=0.010000,
      G=0,
      B=0.000000) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-278,-29})));
    OpenIPSL.Electrical.Branches.PwLine line_7000_7100_1(
      R=0.040000,
      X=0.120000,
      G=0,
      B=0.130000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-260,-47})));
    OpenIPSL.Electrical.Branches.PwLine line_7000_7100_2(
      R=0.040000,
      X=0.120000,
      G=0,
      B=0.130000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-257,-57})));
    OpenIPSL.Electrical.Branches.PwLine line_7000_7100_3(
      R=0.040000,
      X=0.140000,
      G=0,
      B=0.130000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-254,-69})));
    OpenIPSL.Electrical.Buses.BusExt bus_3115(
      np=4,
      v_0=PF_results.voltages.V3115,
      angle_0=PF_results.voltages.A3115,
      V_b=420000,
      nn=8) annotation (Placement(transformation(extent={{-228,-20},{-226,34}})));
    N44.Base_Case.Generators.Gen3_bus_3115 G1_bus3115(
      V_b=420000,
      v_0=PF_results.voltages.V3115,
      angle_0=PF_results.voltages.A3115,
      P_0=PF_results.machines.P3115_1,
      Q_0=PF_results.machines.Q3115_1)
      annotation (Placement(transformation(extent={{-248,12},{-242,18}})));
    N44.Base_Case.Generators.Gen3_bus_3115 G2_bus3115(
      V_b=420000,
      v_0=PF_results.voltages.V3115,
      angle_0=PF_results.voltages.A3115,
      P_0=PF_results.machines.P3115_2,
      Q_0=PF_results.machines.Q3115_2)
      annotation (Placement(transformation(extent={{-248,4},{-242,10}})));
    N44.Base_Case.Generators.Gen3_bus_3115 G3_bus3115(
      V_b=420000,
      v_0=PF_results.voltages.V3115,
      angle_0=PF_results.voltages.A3115,
      P_0=PF_results.machines.P3115_3,
      Q_0=PF_results.machines.Q3115_3)
      annotation (Placement(transformation(extent={{-248,-4},{-242,2}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus3115(
      V_b=420000,
      v_0=PF_results.voltages.V3115,
      angle_0=PF_results.voltages.A3115,
      P_0=PF_results.loads.PL3115_1,
      Q_0=PF_results.loads.QL3115_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-3,-2.5},{3,2.5}},
          rotation=270,
          origin={-239,-8.5})));
    OpenIPSL.Electrical.Branches.PwLine line_3115_7100(
      R=0.040000,
      X=0.130000,
      G=0,
      B=0.130000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          origin={-239,-26})));
    OpenIPSL.Electrical.Branches.PwLine line_3000_3115(
      R=0.075000,
      X=0.900000,
      G=0,
      B=0.500000*0.5) annotation (Placement(transformation(
          extent={{5,-3},{-5,3}},
          rotation=180,
          origin={-243,21})));
    OpenIPSL.Electrical.Branches.PwLine line_3100_3115(
      G=0,
      R=0.0150000,
      X=0.200000,
      B=0.20000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-202,34})));
    OpenIPSL.Electrical.Branches.PwLine line_3115_3249(
      R=0.015000,
      X=0.200000,
      G=0,
      B=0.080000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-207,11})));
    OpenIPSL.Electrical.Branches.PwLine line_3115_6701(
      R=0.040000,
      X=0.400000,
      G=0,
      B=0.100000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-204,-36})));
    OpenIPSL.Electrical.Branches.PwLine line_3115_3245(
      R=0.045000,
      X=0.500000,
      G=0,
      B=0.140000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-212,-19})));
    OpenIPSL.Electrical.Branches.PwLine line_3249_7100(
      R=0.020000,
      X=0.075000,
      G=0,
      B=0.078000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-231,-45})));
    OpenIPSL.Electrical.Buses.BusExt bus_3000(
      nn=7,
      np=5,
      v_0=PF_results.voltages.V3000,
      angle_0=PF_results.voltages.A3000,
      V_b=420000)
      annotation (Placement(transformation(extent={{-258,46},{-256,66}})));
    N44.Base_Case.Generators.Gen1_bus_3000 G1_bus3000(
      V_b=420000,
      v_0=PF_results.voltages.V3000,
      angle_0=PF_results.voltages.A3000,
      P_0=PF_results.machines.P3000_1,
      Q_0=PF_results.machines.Q3000_1)
      annotation (Placement(transformation(extent={{-280,64},{-274,70}})));
    N44.Base_Case.Generators.Gen1_bus_3000 G2_bus3000(
      V_b=420000,
      v_0=PF_results.voltages.V3000,
      angle_0=PF_results.voltages.A3000,
      P_0=PF_results.machines.P3000_2,
      Q_0=PF_results.machines.Q3000_2)
      annotation (Placement(transformation(extent={{-280,56},{-274,62}})));
    N44.Base_Case.Generators.Gen1_bus_3000 G3_bus3000(
      V_b=420000,
      v_0=PF_results.voltages.V3000,
      angle_0=PF_results.voltages.A3000,
      P_0=PF_results.machines.P3000_3,
      Q_0=PF_results.machines.Q3000_3)
      annotation (Placement(transformation(extent={{-280,48},{-274,54}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus3000(
      V_b=420000,
      v_0=PF_results.voltages.V3000,
      angle_0=PF_results.voltages.A3000,
      P_0=PF_results.loads.PL3000_1,
      Q_0=PF_results.loads.QL3000_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-1.75},{2.75,1.75}},
          rotation=270,
          origin={-272.25,45.25})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus3000(
      V_b=420000,
      v_0=PF_results.voltages.V3000,
      angle_0=PF_results.voltages.A3000,
      P_0=PF_results.loads.PL3000_2,
      Q_0=PF_results.loads.QL3000_2,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-1.75},{2.75,1.75}},
          rotation=270,
          origin={-272.25,39.25})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load3_bus3000(
      V_b=420000,
      v_0=PF_results.voltages.V3000,
      angle_0=PF_results.voltages.A3000,
      P_0=PF_results.loads.PL3000_3,
      Q_0=PF_results.loads.QL3000_3,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-1.75},{2.75,1.75}},
          rotation=270,
          origin={-272.25,32.25})));
    OpenIPSL.Electrical.Branches.PwLine line_3000_3020(
      R=0.000000,
      X=0.010000,
      G=0,
      B=0) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          origin={-269,79})));
    OpenIPSL.Electrical.Branches.PwLine line_3000_3300_1(
      R=0.006000,
      X=0.080000,
      G=0,
      B=0.030000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-245,71})));
    OpenIPSL.Electrical.Branches.PwLine line_3000_3300_2(
      R=0.009000,
      X=0.100000,
      G=0,
      B=0.025000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-237,65})));
    OpenIPSL.Electrical.Branches.PwLine line_3000_3245_1(
      R=0.008000,
      X=0.120000,
      G=0,
      B=0.050000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          origin={-234,56})));
    OpenIPSL.Electrical.Branches.PwLine line_3000_3245_2(
      R=0.018000,
      X=0.200000,
      G=0,
      B=0.050000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-252,15})));
    OpenIPSL.Electrical.Buses.BusExt bus_3020(
      nn=1,
      np=1,
      v_0=PF_results.voltages.V3020,
      angle_0=PF_results.voltages.A3020,
      V_b=420000)
      annotation (Placement(transformation(extent={{-282,70},{-280,90}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus3020(
      V_b=420000,
      v_0=PF_results.voltages.V3020,
      angle_0=PF_results.voltages.A3020,
      P_0=PF_results.loads.PL3020_1,
      Q_0=PF_results.loads.QL3020_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-1.75},{2.75,1.75}},
          rotation=270,
          origin={-288.25,77.25})));
    OpenIPSL.Electrical.Buses.BusExt bus_3300(
      nn=8,
      np=5,
      v_0=PF_results.voltages.V3300,
      angle_0=PF_results.voltages.A3300,
      V_b=420000)
      annotation (Placement(transformation(extent={{-220,88},{-218,108}})));
    N44.Base_Case.Generators.Gen4_bus_3300 G2_bus3300(
      V_b=420000,
      v_0=PF_results.voltages.V3300,
      angle_0=PF_results.voltages.A3300,
      P_0=PF_results.machines.P3300_2,
      Q_0=PF_results.machines.Q3300_2) annotation (Placement(transformation(
          extent={{-3,-3},{3,3}},
          rotation=180,
          origin={-205,97})));
    N44.Base_Case.Generators.Gen4_bus_3300 G3_bus3300(
      V_b=420000,
      v_0=PF_results.voltages.V3300,
      angle_0=PF_results.voltages.A3300,
      P_0=PF_results.machines.P3300_3,
      Q_0=PF_results.machines.Q3300_3)
      annotation (Placement(transformation(extent={{-202,92},{-208,86}})));
    N44.Base_Case.Generators.Gen4_bus_3300 G1_bus3300(
      V_b=420000,
      v_0=PF_results.voltages.V3300,
      angle_0=PF_results.voltages.A3300,
      P_0=PF_results.machines.P3300_1,
      Q_0=PF_results.machines.Q3300_1)
      annotation (Placement(transformation(extent={{-236,89},{-230,95}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus3300(
      V_b=420000,
      v_0=PF_results.voltages.V3300,
      angle_0=PF_results.voltages.A3300,
      P_0=PF_results.loads.PL3300_1,
      Q_0=PF_results.loads.QL3300_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-240.25,100.25})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus3300(
      V_b=420000,
      v_0=PF_results.voltages.V3300,
      angle_0=PF_results.voltages.A3300,
      P_0=PF_results.loads.PL3300_2,
      Q_0=PF_results.loads.QL3300_2,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.25,-1.75},{2.25,1.75}},
          rotation=270,
          origin={-240.25,95.75})));
    OpenIPSL.Electrical.Buses.BusExt bus_3200(
      nn=5,
      np=1,
      v_0=PF_results.voltages.V3200,
      angle_0=PF_results.voltages.A3200,
      V_b=420000)
      annotation (Placement(transformation(extent={{-178,88},{-176,108}})));
    OpenIPSL.Electrical.Branches.PwLine line_3200_3300(
      R=0.020000,
      X=0.200000,
      G=0,
      B=0.060000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          origin={-197,103})));
    OpenIPSL.Electrical.Branches.PwLine line_3100_3200_3(
      R=0.040000,
      X=0.240000,
      G=0,
      B=0.200000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-193,77})));
    OpenIPSL.Electrical.Branches.PwLine line_3100_3200_2(
      R=0.040000,
      X=0.240000,
      G=0,
      B=0.200000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-187,77})));
    OpenIPSL.Electrical.Branches.PwLine line_3100_3200_1(
      R=0.040000,
      X=0.240000,
      G=0,
      B=0.200000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-181,77})));
    OpenIPSL.Electrical.Buses.BusExt bus_3100(
      nn=6,
      np=2,
      v_0=PF_results.voltages.V3100,
      angle_0=PF_results.voltages.A3100,
      V_b=420000)
      annotation (Placement(transformation(extent={{-178,36},{-176,56}})));
    OpenIPSL.Electrical.Branches.PwLine line_3300_8500_1(
      R=0.020000,
      X=0.230000,
      G=0,
      B=0.060000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-211,119})));
    OpenIPSL.Electrical.Branches.PwLine line_3300_8500_2(
      R=0.012000,
      X=0.270000,
      G=0,
      B=0.100000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-207,119})));
    OpenIPSL.Electrical.Buses.BusExt bus_8500(
      nn=9,
      np=8,
      v_0=PF_results.voltages.V8500,
      angle_0=PF_results.voltages.A8500,
      V_b=420000)
      annotation (Placement(transformation(extent={{-198,124},{-196,166}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus8500(
      V_b=420000,
      v_0=PF_results.voltages.V8500,
      angle_0=PF_results.voltages.A8500,
      P_0=PF_results.loads.PL8500_1,
      Q_0=PF_results.loads.QL8500_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-212.25,162.25})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus8500(
      V_b=420000,
      v_0=PF_results.voltages.V8500,
      angle_0=PF_results.voltages.A8500,
      P_0=PF_results.loads.PL8500_2,
      Q_0=PF_results.loads.QL8500_2,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-212.25,156.25})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load3_bus8500(
      V_b=420000,
      v_0=PF_results.voltages.V8500,
      angle_0=PF_results.voltages.A8500,
      P_0=PF_results.loads.PL8500_3,
      Q_0=PF_results.loads.QL8500_3,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2,-2},{2,2}},
          rotation=270,
          origin={-214,148})));
    N44.Base_Case.Generators.Gen4_bus_8500 G1_bus8500(
      V_b=420000,
      v_0=PF_results.voltages.V8500,
      angle_0=PF_results.voltages.A8500,
      P_0=PF_results.machines.P8500_1,
      Q_0=PF_results.machines.Q8500_1)
      annotation (Placement(transformation(extent={{-218,138},{-212,144}})));
    N44.Base_Case.Generators.Gen4_bus_8500 G2_bus8500(
      V_b=420000,
      v_0=PF_results.voltages.V8500,
      angle_0=PF_results.voltages.A8500,
      P_0=PF_results.machines.P8500_2,
      Q_0=PF_results.machines.Q8500_2)
      annotation (Placement(transformation(extent={{-218,130},{-212,136}})));
    OpenIPSL.Electrical.Branches.PwLine line_8500_8700(
      R=0.000000,
      X=0.010000,
      G=0,
      B=0.000000) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          origin={-215,167})));
    N44.Base_Case.Generators.Gen4_bus_8500 G3_bus8500(
      V_b=420000,
      v_0=PF_results.voltages.V8500,
      angle_0=PF_results.voltages.A8500,
      P_0=PF_results.machines.P8500_3,
      Q_0=PF_results.machines.Q8500_3)
      annotation (Placement(transformation(extent={{-176,166},{-182,160}})));
    OpenIPSL.Electrical.Branches.PwLine line_8500_8600(
      R=0.000000,
      X=0.010000,
      G=0,
      B=0.000000) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-179,169})));
    OpenIPSL.Electrical.Branches.PwLine line_3200_8500(
      R=0.010000,
      X=0.170000,
      G=0,
      B=0.060000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-189,121})));
    OpenIPSL.Electrical.Branches.PwLine line_3359_8500_2(
      R=0.025000,
      X=0.320000,
      G=0,
      B=0.090000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          origin={-161,133})));
    OpenIPSL.Electrical.Branches.PwLine line_3359_8500_1(
      R=0.012000,
      X=0.270000,
      G=0,
      B=0.100000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          origin={-161,129})));
    N44.Base_Case.Generators.Gen4_bus_8500 G4_bus8500(
      V_b=420000,
      v_0=PF_results.voltages.V8500,
      angle_0=PF_results.voltages.A8500,
      P_0=PF_results.machines.P8500_4,
      Q_0=PF_results.machines.Q8500_4)
      annotation (Placement(transformation(extent={{-178,158},{-184,152}})));
    N44.Base_Case.Generators.Gen4_bus_8500 G5_bus8500(
      V_b=420000,
      v_0=PF_results.voltages.V8500,
      angle_0=PF_results.voltages.A8500,
      P_0=PF_results.machines.P8500_5,
      Q_0=PF_results.machines.Q8500_5)
      annotation (Placement(transformation(extent={{-178,150},{-184,144}})));
    N44.Base_Case.Generators.Gen4_bus_8500 G6_bus8500(
      V_b=420000,
      v_0=PF_results.voltages.V8500,
      angle_0=PF_results.voltages.A8500,
      P_0=PF_results.machines.P8500_6,
      Q_0=PF_results.machines.Q8500_6)
      annotation (Placement(transformation(extent={{-178,142},{-184,136}})));
    OpenIPSL.Electrical.Buses.BusExt bus_8700(
      nn=1,
      np=1,
      v_0=PF_results.voltages.V8700,
      angle_0=PF_results.voltages.A8700,
      V_b=420000)
      annotation (Placement(transformation(extent={{-238,156},{-236,176}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus8700(
      v_0=PF_results.voltages.V8700,
      angle_0=PF_results.voltages.A8700,
      V_b=420000,
      P_0=PF_results.loads.PL8700_1,
      Q_0=PF_results.loads.QL8700_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-246.25,166.25})));
    OpenIPSL.Electrical.Buses.BusExt bus_8600(
      nn=1,
      np=1,
      v_0=PF_results.voltages.V8600,
      angle_0=PF_results.voltages.A8600,
      V_b=420000)
      annotation (Placement(transformation(extent={{-162,156},{-160,176}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus8600(
      V_b=420000,
      v_0=PF_results.voltages.V8600,
      angle_0=PF_results.voltages.A8600,
      P_0=PF_results.loads.PL8600_1,
      Q_0=PF_results.loads.QL8600_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{2,-1.5},{-2,1.5}},
          rotation=90,
          origin={-152,166.5})));
    OpenIPSL.Electrical.Buses.BusExt bus_3359(
      nn=9,
      np=9,
      v_0=PF_results.voltages.V3359,
      angle_0=PF_results.voltages.A3359,
      V_b=420000)
      annotation (Placement(transformation(extent={{-124,54},{-122,112}})));
    OpenIPSL.Electrical.Branches.PwLine line_3200_3359(
      R=0.010000,
      X=0.200000,
      G=0,
      B=0.070000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          origin={-153,99})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus3359(
      V_b=420000,
      v_0=PF_results.voltages.V3359,
      angle_0=PF_results.voltages.A3359,
      P_0=PF_results.loads.PL3359_1,
      Q_0=PF_results.loads.QL3359_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.25,-1.75},{1.25,1.75}},
          rotation=270,
          origin={-132.25,86.75})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus3359(
      V_b=420000,
      v_0=PF_results.voltages.V3359,
      angle_0=PF_results.voltages.A3359,
      P_0=PF_results.loads.PL3359_2,
      Q_0=PF_results.loads.QL3359_2,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-134.25,82.25})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load3_bus3359(
      V_b=420000,
      v_0=PF_results.voltages.V3359,
      angle_0=PF_results.voltages.A3359,
      P_0=PF_results.loads.PL3359_3,
      Q_0=PF_results.loads.QL3359_3,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-136.25,78.25})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load4_bus3359(
      V_b=420000,
      v_0=PF_results.voltages.V3359,
      angle_0=PF_results.voltages.A3359,
      P_0=PF_results.loads.PL3359_4,
      Q_0=PF_results.loads.QL3359_4,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-138.25,74.25})));
    OpenIPSL.Electrical.Branches.PwLine line_3100_3359_1(
      R=0.080000,
      X=0.500000,
      G=0,
      B=0.250000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          origin={-155,57})));
    OpenIPSL.Electrical.Branches.PwLine line_3100_3359_2(
      R=0.040000,
      X=0.230000,
      G=0,
      B=0.240000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          origin={-155,51})));
    OpenIPSL.Electrical.Buses.BusExt bus_3360(
      np=1,
      v_0=PF_results.voltages.V3360,
      angle_0=PF_results.voltages.A3360,
      V_b=135,
      nn=1) annotation (Placement(transformation(extent={{-96,130},{-94,150}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus3360(
      V_b=135,
      v_0=PF_results.voltages.V3360,
      angle_0=PF_results.voltages.A3360,
      P_0=PF_results.loads.PL3360_1,
      Q_0=PF_results.loads.QL3360_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{1.75,-1.75},{-1.75,1.75}},
          rotation=90,
          origin={-83.75,140.25})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus3100(
      V_b=420000,
      v_0=PF_results.voltages.V3100,
      angle_0=PF_results.voltages.A3100,
      P_0=PF_results.loads.PL3100_1,
      Q_0=PF_results.loads.QL3100_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-1.75},{2.75,1.75}},
          rotation=270,
          origin={-196.25,47.25})));
    OpenIPSL.Electrical.Branches.PwLine line_3100_3249(
      G=0,
      R=0.0150000,
      X=0.2150000,
      B=0.20000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=-90,
          origin={-189,15})));
    OpenIPSL.Electrical.Buses.BusExt bus_3249(
      np=6,
      nn=7,
      v_0=PF_results.voltages.V3249,
      angle_0=PF_results.voltages.A3249,
      V_b=420000)
      annotation (Placement(transformation(extent={{-176,-52},{-174,6}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus3249(
      V_b=420000,
      v_0=PF_results.voltages.V3249,
      angle_0=PF_results.voltages.A3249,
      P_0=PF_results.loads.PL3249_1,
      Q_0=PF_results.loads.QL3249_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-190.25,-9.75})));
    N44.Base_Case.Generators.Gen2_bus_3249 G1_bus3249(
      V_b=420000,
      v_0=PF_results.voltages.V3249,
      angle_0=PF_results.voltages.A3249,
      P_0=PF_results.machines.P3249_1,
      Q_0=PF_results.machines.Q3249_1)
      annotation (Placement(transformation(extent={{-198,-20},{-192,-14}})));
    N44.Base_Case.Generators.Gen2_bus_3249 G2_bus3249(
      V_b=420000,
      v_0=PF_results.voltages.V3249,
      angle_0=PF_results.voltages.A3249,
      P_0=PF_results.machines.P3249_2,
      Q_0=PF_results.machines.Q3249_2)
      annotation (Placement(transformation(extent={{-198,-28},{-192,-22}})));
    N44.Base_Case.Generators.Gen2_bus_3249 G3_bus3249(
      V_b=420000,
      v_0=PF_results.voltages.V3249,
      angle_0=PF_results.voltages.A3249,
      P_0=PF_results.machines.P3249_3,
      Q_0=PF_results.machines.Q3249_3)
      annotation (Placement(transformation(extent={{-198,-36},{-192,-30}})));
    N44.Base_Case.Generators.Gen2_bus_3249 G4_bus3249(
      V_b=420000,
      v_0=PF_results.voltages.V3249,
      angle_0=PF_results.voltages.A3249,
      P_0=PF_results.machines.P3249_4,
      Q_0=PF_results.machines.Q3249_4)
      annotation (Placement(transformation(extent={{-158,-16},{-164,-22}})));
    N44.Base_Case.Generators.Gen2_bus_3249 G5_bus3249(
      V_b=420000,
      v_0=PF_results.voltages.V3249,
      angle_0=PF_results.voltages.A3249,
      P_0=PF_results.machines.P3249_5,
      Q_0=PF_results.machines.Q3249_5)
      annotation (Placement(transformation(extent={{-158,-24},{-164,-30}})));
    N44.Base_Case.Generators.Gen2_bus_3249 G6_bus3249(
      V_b=420000,
      v_0=PF_results.voltages.V3249,
      angle_0=PF_results.voltages.A3249,
      P_0=PF_results.machines.P3249_6,
      Q_0=PF_results.machines.Q3249_6)
      annotation (Placement(transformation(extent={{-158,-32},{-164,-38}})));
    N44.Base_Case.Generators.Gen2_bus_3249 G7_bus3249(
      V_b=420000,
      v_0=PF_results.voltages.V3249,
      angle_0=PF_results.voltages.A3249,
      P_0=PF_results.machines.P3249_7,
      Q_0=PF_results.machines.Q3249_7)
      annotation (Placement(transformation(extent={{-158,-42},{-164,-48}})));
    OpenIPSL.Electrical.Buses.BusExt bus_3701(
      np=1,
      v_0=PF_results.voltages.V3701,
      angle_0=PF_results.voltages.A3701,
      V_b=300000,
      nn=1) annotation (Placement(transformation(extent={{-118,-70},{-116,-50}})));
    OpenIPSL.Electrical.Buses.BusExt bus_3245(
      nn=3,
      np=2,
      v_0=PF_results.voltages.V3245,
      angle_0=PF_results.voltages.A3245,
      V_b=420000)
      annotation (Placement(transformation(extent={{-208,-82},{-206,-62}})));
    N44.Base_Case.Generators.Gen2_bus_3245 G1_bus3245(
      V_b=420000,
      v_0=PF_results.voltages.V3245,
      angle_0=PF_results.voltages.A3245,
      P_0=PF_results.machines.P3245_1,
      Q_0=PF_results.machines.Q3245_1)
      annotation (Placement(transformation(extent={{-194,-62},{-200,-68}})));
    OpenIPSL.Electrical.Buses.BusExt bus_3244(
      np=1,
      v_0=PF_results.voltages.V3244,
      angle_0=PF_results.voltages.A3244,
      V_b=300000,
      nn=1)
      annotation (Placement(transformation(extent={{-178,-106},{-176,-86}})));
    OpenIPSL.Electrical.Buses.BusExt bus_6701(
      nn=2,
      np=2,
      v_0=PF_results.voltages.V6701,
      angle_0=PF_results.voltages.A6701,
      V_b=420000)
      annotation (Placement(transformation(extent={{-146,-94},{-144,-74}})));
    OpenIPSL.Electrical.Buses.BusExt bus_6700(
      np=5,
      nn=4,
      v_0=PF_results.voltages.V6700,
      angle_0=PF_results.voltages.A6700,
      V_b=300000)
      annotation (Placement(transformation(extent={{-78,-94},{-76,-74}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus6700(
      V_b=300000,
      v_0=PF_results.voltages.V6700,
      angle_0=PF_results.voltages.A6700,
      P_0=PF_results.loads.PL6700_1,
      Q_0=PF_results.loads.QL6700_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-92.25,-85.75})));
    N44.Base_Case.Generators.Gen3_bus_6700 G1_bus6700(
      V_b=300000,
      v_0=PF_results.voltages.V6700,
      angle_0=PF_results.voltages.A6700,
      P_0=PF_results.machines.P6700_1,
      Q_0=PF_results.machines.Q6700_1)
      annotation (Placement(transformation(extent={{-98,-98},{-92,-92}})));
    N44.Base_Case.Generators.Gen3_bus_6700 G2_bus6700(
      V_b=300000,
      v_0=PF_results.voltages.V6700,
      angle_0=PF_results.voltages.A6700,
      P_0=PF_results.machines.P6700_2,
      Q_0=PF_results.machines.Q6700_2)
      annotation (Placement(transformation(extent={{-58,-78},{-64,-84}})));
    OpenIPSL.Electrical.Branches.PwLine line_3701_6700(
      R=0.250000,
      X=2.000000,
      G=0,
      B=0.030000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-95,-69})));
    OpenIPSL.Electrical.Branches.PwLine line_3244_6500(
      R=0.010000,
      X=0.200000,
      G=0,
      B=0.060000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-111,-111})));
    OpenIPSL.Electrical.Buses.BusExt bus_6500(
      nn=6,
      np=5,
      v_0=PF_results.voltages.V6500,
      angle_0=PF_results.voltages.A6500,
      V_b=300000)
      annotation (Placement(transformation(extent={{-20,-122},{-18,-78}})));
    OpenIPSL.Electrical.Branches.PwLine line_6500_6700_1(
      R=0.170000,
      X=1.800000,
      G=0,
      B=0.100000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-51,-85})));
    OpenIPSL.Electrical.Branches.PwLine line_6500_6700_2(
      R=0.100000,
      X=1.300000,
      G=0,
      B=0.120000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-51,-91})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus6500(
      V_b=300000,
      v_0=PF_results.voltages.V6500,
      angle_0=PF_results.voltages.A6500,
      P_0=PF_results.loads.PL6500_1,
      Q_0=PF_results.loads.QL6500_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-32.25,-97.75})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus6500(
      V_b=300000,
      v_0=PF_results.voltages.V6500,
      angle_0=PF_results.voltages.A6500,
      P_0=PF_results.loads.PL6500_2,
      Q_0=PF_results.loads.QL6500_2,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-32.25,-103.75})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load3_bus6500(
      V_b=300000,
      v_0=PF_results.voltages.V6500,
      angle_0=PF_results.voltages.A6500,
      P_0=PF_results.loads.PL6500_3,
      Q_0=PF_results.loads.QL6500_3,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-32.25,-111.75})));
    N44.Base_Case.Generators.Gen5_bus_6500 G1_bus6500(
      V_b=300000,
      v_0=PF_results.voltages.V6500,
      angle_0=PF_results.voltages.A6500,
      P_0=PF_results.machines.P6500_1,
      Q_0=PF_results.machines.Q6500_1)
      annotation (Placement(transformation(extent={{2,-90},{-4,-96}})));
    N44.Base_Case.Generators.Gen5_bus_6500 G2_bus6500(
      V_b=300000,
      v_0=PF_results.voltages.V6500,
      angle_0=PF_results.voltages.A6500,
      P_0=PF_results.machines.P6500_2,
      Q_0=PF_results.machines.Q6500_2)
      annotation (Placement(transformation(extent={{2,-98},{-4,-104}})));
    N44.Base_Case.Generators.Gen5_bus_6500 G3_bus6500(
      V_b=300000,
      v_0=PF_results.voltages.V6500,
      angle_0=PF_results.voltages.A6500,
      P_0=PF_results.machines.P6500_3,
      Q_0=PF_results.machines.Q6500_3)
      annotation (Placement(transformation(extent={{2,-106},{-4,-112}})));
    N44.Base_Case.Generators.Gen5_bus_6500 G4_bus6500(
      V_b=300000,
      v_0=PF_results.voltages.V6500,
      angle_0=PF_results.voltages.A6500,
      P_0=PF_results.machines.P6500_4,
      Q_0=PF_results.machines.Q6500_4)
      annotation (Placement(transformation(extent={{2,-114},{-4,-120}})));
    OpenIPSL.Electrical.Buses.BusExt bus_5100(
      np=2,
      nn=4,
      v_0=PF_results.voltages.V5100,
      angle_0=PF_results.voltages.A5100,
      V_b=300000) annotation (Placement(transformation(extent={{22,-74},{24,-54}})));
    OpenIPSL.Electrical.Branches.PwLine line_5100_6500(
      R=0.080000,
      X=0.900000,
      G=0,
      B=0.060000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={3,-79})));
    N44.Base_Case.Generators.Gen5_bus_5100 G1_bus5100(
      V_b=300000,
      v_0=PF_results.voltages.V5100,
      angle_0=PF_results.voltages.A5100,
      P_0=PF_results.machines.P5100_1,
      Q_0=PF_results.machines.Q5100_1)
      annotation (Placement(transformation(extent={{2,-68},{8,-62}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus5100(
      V_b=300000,
      v_0=PF_results.voltages.V5100,
      angle_0=PF_results.voltages.A5100,
      P_0=PF_results.loads.PL5100_1,
      Q_0=PF_results.loads.QL5100_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={7.75,-59.75})));
    OpenIPSL.Electrical.Branches.PwLine line_5100_5500(
      R=0.027000,
      X=0.260000,
      G=0,
      B=0.044000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={41,-65})));
    OpenIPSL.Electrical.Buses.BusExt bus_5101(
      nn=2,
      np=4,
      v_0=PF_results.voltages.V5101,
      angle_0=PF_results.voltages.A5101,
      V_b=420000) annotation (Placement(transformation(extent={{22,-2},{24,18}})));
    OpenIPSL.Electrical.Branches.PwLine line_3359_5101_2(
      R=0.020000,
      X=0.220000,
      G=0,
      B=0.060000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-65,11})));
    OpenIPSL.Electrical.Branches.PwLine line_3359_5101_1(
      R=0.016000,
      X=0.260000,
      G=0,
      B=0.090000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={-65,17})));
    N44.Base_Case.Generators.Gen4_bus_3359 G1_bus3359(
      V_b=420000,
      v_0=PF_results.voltages.V3359,
      angle_0=PF_results.voltages.A3359,
      P_0=PF_results.machines.P3359_1,
      Q_0=PF_results.machines.Q3359_1)
      annotation (Placement(transformation(extent={{-92,110},{-98,104}})));
    N44.Base_Case.Generators.Gen4_bus_3359 G2_bus3359(
      V_b=420000,
      v_0=PF_results.voltages.V3359,
      angle_0=PF_results.voltages.A3359,
      P_0=PF_results.machines.P3359_2,
      Q_0=PF_results.machines.Q3359_2)
      annotation (Placement(transformation(extent={{-92,102},{-98,96}})));
    N44.Base_Case.Generators.Gen4_bus_3359 G3_bus3359(
      V_b=420000,
      v_0=PF_results.voltages.V3359,
      angle_0=PF_results.voltages.A3359,
      P_0=PF_results.machines.P3359_3,
      Q_0=PF_results.machines.Q3359_3)
      annotation (Placement(transformation(extent={{-92,94},{-98,88}})));
    N44.Base_Case.Generators.Gen4_bus_3359 G4_bus3359(
      V_b=420000,
      v_0=PF_results.voltages.V3359,
      angle_0=PF_results.voltages.A3359,
      P_0=PF_results.machines.P3359_4,
      Q_0=PF_results.machines.Q3359_4)
      annotation (Placement(transformation(extent={{-92,86},{-98,80}})));
    N44.Base_Case.Generators.Gen4_bus_3359 G5_bus3359(
      V_b=420000,
      v_0=PF_results.voltages.V3359,
      angle_0=PF_results.voltages.A3359,
      P_0=PF_results.machines.P3359_5,
      Q_0=PF_results.machines.Q3359_5)
      annotation (Placement(transformation(extent={{-92,78},{-98,72}})));
    N44.Base_Case.Generators.Gen4_bus_3359 G6_bus3359(
      V_b=420000,
      v_0=PF_results.voltages.V3359,
      angle_0=PF_results.voltages.A3359,
      P_0=PF_results.machines.P3359_6,
      Q_0=PF_results.machines.Q3359_6)
      annotation (Placement(transformation(extent={{-92,70},{-98,64}})));
    OpenIPSL.Electrical.Branches.PwLine line_5101_5103(
      R=0.010000,
      X=0.140000,
      G=0,
      B=0.040000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={43,15})));
    OpenIPSL.Electrical.Branches.PwLine line_5101_5102(
      R=0.008000,
      X=0.100000,
      G=0,
      B=0.090000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={43,9})));
    OpenIPSL.Electrical.Branches.PwLine line_5101_5501(
      R=0.010000,
      X=0.150000,
      G=0,
      B=0.550000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={43,3})));
    OpenIPSL.Electrical.Buses.BusExt bus_5103(
      nn=1,
      np=3,
      v_0=PF_results.voltages.V5103,
      angle_0=PF_results.voltages.A5103,
      V_b=420000) annotation (Placement(transformation(extent={{80,38},{82,58}})));
    OpenIPSL.Electrical.Branches.PwLine line_5103_5304_2(
      R=0.013000,
      X=0.200000,
      G=0,
      B=0.060000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={97,47})));
    OpenIPSL.Electrical.Branches.PwLine line_5103_5304_1(
      R=0.020000,
      X=0.250000,
      G=0,
      B=0.070000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={97,53})));
    OpenIPSL.Electrical.Branches.PwLine line_5102_5103(
      R=0.004000,
      X=0.070000,
      G=0,
      B=0.030000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={97,41})));
    OpenIPSL.Electrical.Buses.BusExt bus_5304(
      np=3,
      nn=3,
      v_0=PF_results.voltages.V5304,
      angle_0=PF_results.voltages.A5304,
      V_b=420000) annotation (Placement(transformation(extent={{122,70},{124,90}})));
    OpenIPSL.Electrical.Buses.BusExt bus_5102(
      nn=3,
      np=1,
      v_0=PF_results.voltages.V5102,
      angle_0=PF_results.voltages.A5102,
      V_b=420000) annotation (Placement(transformation(extent={{122,4},{124,24}})));
    OpenIPSL.Electrical.Branches.PwLine line_5102_5304(
      R=0.017000,
      X=0.240000,
      G=0,
      B=0.070000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=270,
          origin={116,49})));
    OpenIPSL.Electrical.Branches.PwLine line_5102_6001(
      R=0.030000,
      X=0.460000,
      G=0,
      B=0.130000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={136,14})));
    OpenIPSL.Electrical.Buses.BusExt bus_5305(
      np=1,
      nn=2,
      v_0=PF_results.voltages.V5305,
      angle_0=PF_results.voltages.A5305,
      V_b=420000)
      annotation (Placement(transformation(extent={{162,110},{164,130}})));
    OpenIPSL.Electrical.Branches.PwLine line_5304_5305_1(
      R=0.010000,
      X=0.150000,
      G=0,
      B=0.050000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=270,
          origin={135,97})));
    OpenIPSL.Electrical.Branches.PwLine line_5304_5305_2(
      R=0.013000,
      X=0.017000,
      G=0,
      B=0.040000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=270,
          origin={141,97})));
    OpenIPSL.Electrical.Branches.PwLine line_5301_5304(
      R=0.010000,
      X=0.200000,
      G=0,
      B=0.060000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={159,75})));
    OpenIPSL.Electrical.Buses.BusExt bus_5301(
      nn=3,
      v_0=PF_results.voltages.V5301,
      angle_0=PF_results.voltages.A5301,
      V_b=420000,
      np=1) annotation (Placement(transformation(extent={{200,70},{202,90}})));
    OpenIPSL.Electrical.Branches.PwLine line_5301_5305(
      R=0.007000,
      X=0.120000,
      G=0,
      B=0.031000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=270,
          origin={183,97})));
    OpenIPSL.Electrical.Branches.PwLine line_5301_6001(
      R=0.013000,
      X=0.200000,
      G=0,
      B=0.050000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=270,
          origin={172,53})));
    OpenIPSL.Electrical.Buses.BusExt bus_5300(
      np=6,
      nn=3,
      v_0=PF_results.voltages.V5300,
      angle_0=PF_results.voltages.A5300,
      V_b=300000) annotation (Placement(transformation(extent={{240,70},{242,90}})));
    N44.Base_Case.Generators.Gen3_bus_5300 G1_bus5300(
      V_b=300000,
      v_0=PF_results.voltages.V5300,
      angle_0=PF_results.voltages.A5300,
      P_0=PF_results.machines.P5300_1,
      Q_0=PF_results.machines.Q5300_1)
      annotation (Placement(transformation(extent={{220,64},{226,70}})));
    N44.Base_Case.Generators.Gen3_bus_5300 G2_bus5300(
      V_b=300000,
      v_0=PF_results.voltages.V5300,
      angle_0=PF_results.voltages.A5300,
      P_0=PF_results.machines.P5300_2,
      Q_0=PF_results.machines.Q5300_2)
      annotation (Placement(transformation(extent={{262,84},{256,78}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus5300(
      V_b=300000,
      v_0=PF_results.voltages.V5300,
      angle_0=PF_results.voltages.A5300,
      P_0=PF_results.loads.PL5300_2,
      Q_0=PF_results.loads.QL5300_2,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-2.75},{2.75,2.75}},
          rotation=270,
          origin={222.75,77.25})));
    OpenIPSL.Electrical.Buses.BusExt bus_6100(
      np=4,
      nn=5,
      v_0=PF_results.voltages.V6100,
      angle_0=PF_results.voltages.A6100,
      V_b=300000) annotation (Placement(transformation(extent={{280,38},{282,58}})));
    OpenIPSL.Electrical.Branches.PwLine line_5300_6100(
      R=0.021000,
      X=0.220000,
      G=0,
      B=0.010000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          origin={259,75})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus6100(
      V_b=300000,
      v_0=PF_results.voltages.V6100,
      angle_0=PF_results.voltages.A6100,
      P_0=PF_results.loads.PL6100_1,
      Q_0=PF_results.loads.QL6100_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-2.75},{2.75,2.75}},
          rotation=270,
          origin={266.75,63.25})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus6100(
      V_b=300000,
      v_0=PF_results.voltages.V6100,
      angle_0=PF_results.voltages.A6100,
      P_0=PF_results.loads.PL6100_2,
      Q_0=PF_results.loads.QL6100_2,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-2.75},{2.75,2.75}},
          rotation=270,
          origin={266.75,53.25})));
    N44.Base_Case.Generators.Gen3_bus_6100 G1_bus6100(
      V_b=300000,
      v_0=PF_results.voltages.V6100,
      angle_0=PF_results.voltages.A6100,
      P_0=PF_results.machines.P6100_1,
      Q_0=PF_results.machines.Q6100_1)
      annotation (Placement(transformation(extent={{262,42},{268,48}})));
    N44.Base_Case.Generators.Gen3_bus_6100 G2_bus6100(
      V_b=300000,
      v_0=PF_results.voltages.V6100,
      angle_0=PF_results.voltages.A6100,
      P_0=PF_results.machines.P6100_2,
      Q_0=PF_results.machines.Q6100_2)
      annotation (Placement(transformation(extent={{296,64},{290,58}})));
    N44.Base_Case.Generators.Gen3_bus_6100 G4_bus6100(
      V_b=300000,
      v_0=PF_results.voltages.V6100,
      angle_0=PF_results.voltages.A6100,
      P_0=PF_results.machines.P6100_4,
      Q_0=PF_results.machines.Q6100_4)
      annotation (Placement(transformation(extent={{296,48},{290,42}})));
    N44.Base_Case.Generators.Gen3_bus_6100 G5_bus6100(
      V_b=300000,
      v_0=PF_results.voltages.V6100,
      angle_0=PF_results.voltages.A6100,
      P_0=PF_results.machines.P6100_5,
      Q_0=PF_results.machines.Q6100_5)
      annotation (Placement(transformation(extent={{296,40},{290,34}})));
    N44.Base_Case.Generators.Gen3_bus_6100 G3_bus6100(
      V_b=300000,
      v_0=PF_results.voltages.V6100,
      angle_0=PF_results.voltages.A6100,
      P_0=PF_results.machines.P6100_3,
      Q_0=PF_results.machines.Q6100_3)
      annotation (Placement(transformation(extent={{296,56},{290,50}})));
    OpenIPSL.Electrical.Branches.PwLine line_6000_6100(
      R=0.034000,
      X=0.420000,
      G=0,
      B=0.030000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=270,
          origin={274,29})));
    OpenIPSL.Electrical.Buses.BusExt bus_6000(
      np=5,
      nn=3,
      v_0=PF_results.voltages.V6000,
      angle_0=PF_results.voltages.A6000,
      V_b=300000) annotation (Placement(transformation(extent={{240,-8},{242,12}})));
    N44.Base_Case.Generators.Gen5_bus_6000 G1_bus6000(
      V_b=300000,
      v_0=PF_results.voltages.V6000,
      angle_0=PF_results.voltages.A6000,
      P_0=PF_results.machines.P6000_1,
      Q_0=PF_results.machines.Q6000_1)
      annotation (Placement(transformation(extent={{219,-2},{227,6}})));
    OpenIPSL.Electrical.Branches.PwLine line_5400_6000(
      R=0.033000,
      X=0.360000,
      G=0,
      B=0.025000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={222,-23})));
    OpenIPSL.Electrical.Buses.BusExt bus_6001(
      nn=3,
      np=3,
      v_0=PF_results.voltages.V6001,
      angle_0=PF_results.voltages.A6001,
      V_b=420000) annotation (Placement(transformation(extent={{182,12},{184,32}})));
    OpenIPSL.Electrical.Buses.BusExt bus_5601(
      np=1,
      v_0=PF_results.voltages.V5601,
      angle_0=PF_results.voltages.A5601,
      V_b=300000,
      nn=1) annotation (Placement(transformation(extent={{280,-2},{282,18}})));
    OpenIPSL.Electrical.Buses.BusExt bus_5600(
      nn=4,
      np=6,
      v_0=PF_results.voltages.V5600,
      angle_0=PF_results.voltages.A5600,
      V_b=300000)
      annotation (Placement(transformation(extent={{280,-54},{282,-34}})));
    OpenIPSL.Electrical.Branches.PwLine line_5600_5601(
      R=0.030000,
      X=0.340000,
      G=0,
      B=0.020000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=270,
          origin={285,-15})));
    OpenIPSL.Electrical.Branches.PwLine line_5600_6000(
      R=0.020000,
      X=0.200000,
      G=0,
      B=0.070000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          origin={265,-15})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus5600(
      V_b=300000,
      v_0=PF_results.voltages.V5600,
      angle_0=PF_results.voltages.A5600,
      P_0=PF_results.loads.PL5600_1,
      Q_0=PF_results.loads.QL5600_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-2.75},{2.75,2.75}},
          rotation=270,
          origin={266.75,-34.75})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus5600(
      V_b=300000,
      v_0=PF_results.voltages.V5600,
      angle_0=PF_results.voltages.A5600,
      P_0=PF_results.loads.PL5600_2,
      Q_0=PF_results.loads.QL5600_2,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-2.75},{2.75,2.75}},
          rotation=270,
          origin={266.75,-44.75})));
    OpenIPSL.Electrical.Branches.PwLine line_5600_5603(
      R=0.020000,
      X=0.220000,
      G=0,
      B=0.020000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          origin={255,-53})));
    OpenIPSL.Electrical.Buses.BusExt bus_5620(
      np=1,
      nn=1,
      v_0=PF_results.voltages.V5620,
      angle_0=PF_results.voltages.A5620,
      V_b=300000)
      annotation (Placement(transformation(extent={{280,-104},{282,-84}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load_bus5620(
      V_b=300000,
      v_0=PF_results.voltages.V5620,
      angle_0=PF_results.voltages.A5620,
      P_0=PF_results.loads.PL5620_1,
      Q_0=PF_results.loads.QL5620_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-2.75,-2.75},{2.75,2.75}},
          rotation=270,
          origin={266.75,-94.75})));
    OpenIPSL.Electrical.Branches.PwLine line_5600_5620(
      R=0.000000,
      X=0.010000,
      G=0,
      B=0.000000) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=270,
          origin={288,-71})));
    N44.Base_Case.Generators.Gen2_bus_5600 G1_bus5600(
      V_b=300000,
      v_0=PF_results.voltages.V5600,
      angle_0=PF_results.voltages.A5600,
      P_0=PF_results.machines.P5600_1,
      Q_0=PF_results.machines.Q5600_1)
      annotation (Placement(transformation(extent={{298,-48},{292,-54}})));
    N44.Base_Case.Generators.Gen2_bus_5600 G2_bus5600(
      V_b=300000,
      v_0=PF_results.voltages.V5600,
      angle_0=PF_results.voltages.A5600,
      P_0=PF_results.machines.P5600_2,
      Q_0=PF_results.machines.Q5600_2)
      annotation (Placement(transformation(extent={{298,-56},{292,-62}})));
    OpenIPSL.Electrical.Buses.BusExt bus_5603(
      np=2,
      nn=3,
      v_0=PF_results.voltages.V5603,
      angle_0=PF_results.voltages.A5603,
      V_b=300000)
      annotation (Placement(transformation(extent={{220,-86},{222,-66}})));
    OpenIPSL.Electrical.Buses.BusExt bus_5610(
      np=1,
      nn=2,
      v_0=PF_results.voltages.V5610,
      angle_0=PF_results.voltages.A5610,
      V_b=300000)
      annotation (Placement(transformation(extent={{242,-116},{244,-96}})));
    OpenIPSL.Electrical.Branches.PwLine line_5603_5610(
      R=0.000000,
      X=0.010000,
      G=0,
      B=0.000000) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=270,
          origin={233,-91})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus5610(
    V_b=300000,
    Q_0=374292007,
      v_0=PF_results.voltages.V5610,
      angle_0=PF_results.voltages.A5610,
    P_0=-84000000,
      characteristic=2) annotation (Placement(transformation(
          extent={{3.25,-2.75},{-3.25,2.75}},
          rotation=90,
          origin={254.75,-104.75})));
    OpenIPSL.Electrical.Buses.BusExt bus_5602(
      nn=1,
      v_0=PF_results.voltages.V5602,
      angle_0=PF_results.voltages.A5602,
      V_b=420000,
      np=1) annotation (Placement(transformation(extent={{182,-86},{184,-66}})));
    OpenIPSL.Electrical.Buses.BusExt bus_5500(
      nn=4,
      np=4,
      v_0=PF_results.voltages.V5500,
      angle_0=PF_results.voltages.A5500,
      V_b=300000) annotation (Placement(transformation(extent={{76,-90},{78,-58}})));
    OpenIPSL.Electrical.Branches.PwLine line_5500_5603(
      R=0.050000,
      X=0.600000,
      G=0,
      B=0.050000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={114,-89})));
    N44.Base_Case.Generators.Gen5_bus_5500 G1_bus5500(
      V_b=300000,
      v_0=PF_results.voltages.V5500,
      angle_0=PF_results.voltages.A5500,
      P_0=PF_results.machines.P5500_1,
      Q_0=PF_results.machines.Q5500_1)
      annotation (Placement(transformation(extent={{96,-71},{90,-77}})));
    OpenIPSL.Electrical.Branches.PwLine line_5400_5500(
      R=0.009000,
      G=0,
      B=0.050000*0.5,
      X=0.0940000) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={125,-63})));
    OpenIPSL.Electrical.Buses.BusExt bus_5401(
      nn=1,
      np=3,
      v_0=PF_results.voltages.V5401,
      angle_0=PF_results.voltages.A5401,
      V_b=420000)
      annotation (Placement(transformation(extent={{122,-44},{124,-24}})));
    OpenIPSL.Electrical.Buses.BusExt bus_5501(
      np=1,
      nn=2,
      v_0=PF_results.voltages.V5501,
      angle_0=PF_results.voltages.A5501,
      V_b=420000) annotation (Placement(transformation(extent={{80,-26},{82,-6}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus5500(
      V_b=300000,
      v_0=PF_results.voltages.V5500,
      angle_0=PF_results.voltages.A5500,
      P_0=PF_results.loads.PL5500_1,
      Q_0=PF_results.loads.QL5500_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={63.75,-75.75})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load2_bus5500(
      V_b=300000,
      v_0=PF_results.voltages.V5500,
      angle_0=PF_results.voltages.A5500,
      P_0=PF_results.loads.PL5500_2,
      Q_0=PF_results.loads.QL5500_2,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={63.75,-83.75})));
    OpenIPSL.Electrical.Branches.PwLine line_5401_5501(
      R=0.017500,
      X=0.270000,
      G=0,
      B=0.080000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={106,-16})));
    OpenIPSL.Electrical.Buses.BusExt bus_5400(
      np=3,
      nn=4,
      v_0=PF_results.voltages.V5400,
      angle_0=PF_results.voltages.A5400,
      V_b=300000)
      annotation (Placement(transformation(extent={{180,-56},{182,-36}})));
    OpenIPSL.Electrical.Buses.BusExt bus_5402(
      nn=1,
      v_0=PF_results.voltages.V5402,
      angle_0=PF_results.voltages.A5402,
      V_b=420000,
      np=1) annotation (Placement(transformation(extent={{194,-18},{196,2}})));
    OpenIPSL.Electrical.Branches.PwLine line_5401_6001(
      R=0.006400,
      X=0.100000,
      G=0,
      B=0.028000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=180,
          origin={135,-10})));
    OpenIPSL.Electrical.Branches.PwLine line_5401_5602(
      R=0.016000,
      X=0.255000,
      G=0,
      B=0.090000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=90,
          origin={135,-50})));
    N44.Base_Case.Generators.Gen5_bus_5400 G1_bus5400(
      V_b=300000,
      v_0=PF_results.voltages.V5400,
      angle_0=PF_results.voltages.A5400,
      P_0=PF_results.machines.P5400_1,
      Q_0=PF_results.machines.Q5400_1)
      annotation (Placement(transformation(extent={{162,-60},{168,-54}})));
    N44.Base_Case.Generators.Gen5_bus_5400 G2_bus5400(
      V_b=300000,
      v_0=PF_results.voltages.V5400,
      angle_0=PF_results.voltages.A5400,
      P_0=PF_results.machines.P5400_2,
      Q_0=PF_results.machines.Q5400_2)
      annotation (Placement(transformation(extent={{202,-50},{196,-56}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Load1_bus5400(
      V_b=300000,
      v_0=PF_results.voltages.V5400,
      angle_0=PF_results.voltages.A5400,
      P_0=PF_results.loads.PL5400_1,
      Q_0=PF_results.loads.QL5400_1,
      characteristic=2) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={165.75,-45.75})));
    OpenIPSL.Electrical.Branches.PwLine line_5402_6001(
      R=0.000700,
      X=0.010000,
      G=0,
      B=0.003000*0.5) annotation (Placement(transformation(
          extent={{-5,-3},{5,3}},
          rotation=90,
          origin={188,3})));
    OpenIPSL.Electrical.Banks.PSSE.Shunt shunt_5101_5501(G=0.02230, B=-0.97440)
      annotation (Placement(transformation(extent={{36,-6},{40,0}})));
    OpenIPSL.Electrical.Banks.PSSE.Shunt shunt_5501_5101(G=-0.02160, B=0.97440)
      annotation (Placement(transformation(extent={{46,-6},{50,0}})));
    OpenIPSL.Electrical.Banks.PSSE.Shunt shunt_5102_6001(G=0.00020, B=0.00010)
      annotation (Placement(transformation(extent={{128,6},{132,12}})));
    OpenIPSL.Electrical.Banks.PSSE.Shunt shunt_6001_5102(G=0.00020, B=-0.00010)
      annotation (Placement(transformation(extent={{140,6},{144,12}})));
    OpenIPSL.Electrical.Banks.PSSE.Shunt shunt_6001_5401(G=0.00020, B=0.00050)
      annotation (Placement(transformation(extent={{141,-20},{145,-14}})));
    OpenIPSL.Electrical.Banks.PSSE.Shunt shunt_5401_6001(G=-0.00020, B=-0.00050)
      annotation (Placement(transformation(extent={{126,-20},{130,-14}})));
    OpenIPSL.Electrical.Banks.PSSE.Shunt shunt_5500_5603(G=0.00030, B=0.00130)
      annotation (Placement(transformation(extent={{104,-98},{108,-92}})));
    OpenIPSL.Electrical.Banks.PSSE.Shunt shunt_5603_5500(G=-0.00030, B=-0.00130)
      annotation (Placement(transformation(extent={{120,-98},{124,-92}})));
    inner OpenIPSL.Electrical.SystemBase SysData(S_b=1000000000)
      annotation (Placement(transformation(extent={{176,172},{278,208}})));
    OpenIPSL.Electrical.Loads.PSSE.Load Exch_bus8500(
      V_b=420000,
      v_0=PF_results.voltages.V8500,
      angle_0=PF_results.voltages.A8500,
      characteristic=2,
      P_0=PF_results.loads.PL8500_4,
      Q_0=PF_results.loads.QL8500_4) annotation (Placement(transformation(
          extent={{-2,-2},{2,2}},
          rotation=270,
          origin={-212,176})));
    OpenIPSL.Electrical.Loads.PSSE.Load Exch_bus7000(
      V_b=420000,
      v_0=PF_results.voltages.V7000,
      angle_0=PF_results.voltages.A7000,
      characteristic=2,
      P_0=PF_results.loads.PL7000_6,
      Q_0=PF_results.loads.QL7000_6) annotation (Placement(transformation(
          extent={{-2,2},{2,-2}},
          origin={-266,-46})));
    OpenIPSL.Electrical.Loads.PSSE.Load Exch_bus7100(
      V_b=420000,
      v_0=PF_results.voltages.V7100,
      angle_0=PF_results.voltages.A7100,
      characteristic=2,
      P_0=PF_results.loads.PL7100_3,
      Q_0=PF_results.loads.QL7100_3) annotation (Placement(transformation(
          extent={{-2,-2},{2,2}},
          rotation=180,
          origin={-246,-13})));
    OpenIPSL.Electrical.Loads.PSSE.Load Exch1_bus6701(
      V_b=420000,
      characteristic=2,
      v_0=PF_results.voltages.V6701,
      angle_0=PF_results.voltages.A6701,
      P_0=PF_results.loads.PL6701_3,
      Q_0=PF_results.loads.QL6701_3) annotation (Placement(transformation(
          extent={{-1.75,-1.75},{1.75,1.75}},
          rotation=270,
          origin={-156.25,-75.75})));
    OpenIPSL.Electrical.Loads.PSSE.Load Exch2_bus6701(
      V_b=420000,
      characteristic=2,
      v_0=PF_results.voltages.V6701,
      angle_0=PF_results.voltages.A6701,
      P_0=PF_results.loads.PL6701_1,
      Q_0=PF_results.loads.QL6701_1) annotation (Placement(transformation(
          extent={{-1.75,1.75},{1.75,-1.75}},
          rotation=270,
          origin={-134.25,-75.75})));
    N44.Base_Case.Generators.Gen3_bus_3115 G4_add_bus3115(
      V_b=420000,
      v_0=PF_results.voltages.V3115,
      angle_0=PF_results.voltages.A3115,
      P_0=PF_results.machines.P3115_4,
      Q_0=PF_results.machines.Q3115_4)
      annotation (Placement(transformation(extent={{-246,34},{-240,40}})));
    N44.Base_Case.Generators.Gen3_bus_3115 G5_add_bus3115(
      V_b=420000,
      v_0=PF_results.voltages.V3115,
      angle_0=PF_results.voltages.A3115,
      P_0=PF_results.machines.P3115_5,
      Q_0=PF_results.machines.Q3115_5)
      annotation (Placement(transformation(extent={{-246,26},{-240,32}})));
    N44.Base_Case.Generators.Gen2_bus_3249 G8_add_bus3249(
      v_0=PF_results.voltages.V3249,
      angle_0=PF_results.voltages.A3249,
      V_b=420000,
      P_0=PF_results.machines.P3249_8,
      Q_0=PF_results.machines.Q3249_8)
      annotation (Placement(transformation(extent={{-158,0},{-164,-6}})));
    N44.Base_Case.Generators.Gen4_bus_3300 G4_add_bus3300(
      V_b=420000,
      v_0=PF_results.voltages.V3300,
      angle_0=PF_results.voltages.A3300,
      P_0=PF_results.machines.P3300_4,
      Q_0=PF_results.machines.Q3300_4)
      annotation (Placement(transformation(extent={{-236,118},{-230,124}})));
    N44.Base_Case.Generators.Gen4_bus_3300 G5_add_bus3300(
      V_b=420000,
      v_0=PF_results.voltages.V3300,
      angle_0=PF_results.voltages.A3300,
      P_0=PF_results.machines.P3300_5,
      Q_0=PF_results.machines.Q3300_5)
      annotation (Placement(transformation(extent={{-236,110},{-230,116}})));
    N44.Base_Case.Generators.Gen4_bus_3300 G6_add_bus3300(
      V_b=420000,
      v_0=PF_results.voltages.V3300,
      angle_0=PF_results.voltages.A3300,
      P_0=PF_results.machines.P3300_6,
      Q_0=PF_results.machines.Q3300_6)
      annotation (Placement(transformation(extent={{-236,102},{-230,108}})));
    N44.Base_Case.Generators.Gen5_bus_5100 G2_add_bus5100(
      V_b=300000,
      v_0=PF_results.voltages.V5100,
      angle_0=PF_results.voltages.A5100,
      P_0=PF_results.machines.P5100_2,
      Q_0=PF_results.machines.Q5100_2)
      annotation (Placement(transformation(extent={{2,-58},{8,-52}})));
    N44.Base_Case.Generators.Gen3_bus_5300 G3_add_bus5300(
      V_b=300000,
      v_0=PF_results.voltages.V5300,
      angle_0=PF_results.voltages.A5300,
      P_0=PF_results.machines.P5300_3,
      Q_0=PF_results.machines.Q5300_3)
      annotation (Placement(transformation(extent={{262,92},{256,86}})));
    N44.Base_Case.Generators.Gen3_bus_5300 G4_add_bus5300(
      V_b=300000,
      v_0=PF_results.voltages.V5300,
      angle_0=PF_results.voltages.A5300,
      P_0=PF_results.machines.P5300_4,
      Q_0=PF_results.machines.Q5300_4)
      annotation (Placement(transformation(extent={{262,100},{256,94}})));
    N44.Base_Case.Generators.Gen3_bus_5300 G5_add_bus5300(
      V_b=300000,
      v_0=PF_results.voltages.V5300,
      angle_0=PF_results.voltages.A5300,
      P_0=PF_results.machines.P5300_5,
      Q_0=PF_results.machines.Q5300_5)
      annotation (Placement(transformation(extent={{262,108},{256,102}})));
    N44.Base_Case.Generators.Gen3_bus_5300 G6_add_bus5300(
      V_b=300000,
      v_0=PF_results.voltages.V5300,
      angle_0=PF_results.voltages.A5300,
      P_0=PF_results.machines.P5300_6,
      Q_0=PF_results.machines.Q5300_6)
      annotation (Placement(transformation(extent={{262,116},{256,110}})));
    N44.Base_Case.Generators.Gen5_bus_5500 G2_add_bus5500(
      V_b=300000,
      v_0=PF_results.voltages.V5500,
      angle_0=PF_results.voltages.A5500,
      P_0=PF_results.machines.P5500_2,
      Q_0=PF_results.machines.Q5500_2)
      annotation (Placement(transformation(extent={{96,-53},{90,-59}})));
    N44.Base_Case.Generators.Gen2_bus_5600 G3_add_bus5600(
      V_b=300000,
      v_0=PF_results.voltages.V5600,
      angle_0=PF_results.voltages.A5600,
      P_0=PF_results.machines.P5600_3,
      Q_0=PF_results.machines.Q5600_3)
      annotation (Placement(transformation(extent={{298,-40},{292,-46}})));
    N44.Base_Case.Generators.Gen2_bus_5600 G4_add_bus5600(
      V_b=300000,
      v_0=PF_results.voltages.V5600,
      angle_0=PF_results.voltages.A5600,
      P_0=PF_results.machines.P5600_4,
      Q_0=PF_results.machines.Q5600_4)
      annotation (Placement(transformation(extent={{298,-32},{292,-38}})));
    N44.Base_Case.Generators.Gen5_bus_6000 G2_add_bus6000(
      V_b=300000,
      v_0=PF_results.voltages.V6000,
      angle_0=PF_results.voltages.A6000,
      P_0=PF_results.machines.P6000_2,
      Q_0=PF_results.machines.Q6000_2)
      annotation (Placement(transformation(extent={{265,32},{257,24}})));
    N44.Base_Case.Generators.Gen5_bus_6000 G3_add_bus6000(
      V_b=300000,
      v_0=PF_results.voltages.V6000,
      angle_0=PF_results.voltages.A6000,
      P_0=PF_results.machines.P6000_3,
      Q_0=PF_results.machines.Q6000_3)
      annotation (Placement(transformation(extent={{265,22},{257,14}})));
    N44.Base_Case.Generators.Gen5_bus_6000 G4_add_bus6000(
      V_b=300000,
      v_0=PF_results.voltages.V6000,
      angle_0=PF_results.voltages.A6000,
      P_0=PF_results.machines.P6000_4,
      Q_0=PF_results.machines.Q6000_4)
      annotation (Placement(transformation(extent={{265,12},{257,4}})));
    N44.Base_Case.Generators.Gen3_bus_6700 G4_add_bus6700(
      V_b=300000,
      v_0=PF_results.voltages.V6700,
      angle_0=PF_results.voltages.A6700,
      P_0=PF_results.machines.P6700_4,
      Q_0=PF_results.machines.Q6700_4)
      annotation (Placement(transformation(extent={{-58,-62},{-64,-68}})));
    N44.Base_Case.Generators.Gen3_bus_6700 G3_add_bus6700(
      V_b=300000,
      v_0=PF_results.voltages.V6700,
      angle_0=PF_results.voltages.A6700,
      P_0=PF_results.machines.P6700_3,
      Q_0=PF_results.machines.Q6700_3)
      annotation (Placement(transformation(extent={{-58,-70},{-64,-76}})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer(
      R=0.005,
      X=0.02,
      G=0,
      B=0,
      t1=PF_results.trafos.t1_3359_3360,
      t2=PF_results.trafos.t2_3359_3360)
      annotation (Placement(transformation(extent={{-114,136},{-102,144}})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer
      twoWindingTransformer1(
      G=0,
      B=0,
      R=0.02,
      X=0.5,
      t1=PF_results.trafos.t1_3249_3701,
      t2=PF_results.trafos.t2_3249_3701)
      annotation (Placement(transformation(extent={{-134,-16},{-146,-8}})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer
      twoWindingTransformer2(
      G=0,
      B=0,
      R=0.005,
      X=0.02,
      t1=PF_results.trafos.t1_3244_3245,
      t2=PF_results.trafos.t2_3244_3245)
      annotation (Placement(transformation(extent={{-184,-84},{-196,-76}})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer
      twoWindingTransformer3(
      G=0,
      B=0,
      R=0.005,
      X=0.02,
      t1=PF_results.trafos.t1_6700_6701,
      t2=PF_results.trafos.t2_6700_6701)
      annotation (Placement(transformation(extent={{-112,-92},{-124,-84}})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer
      twoWindingTransformer4(
      G=0,
      B=0,
      R=0.0008,
      X=0.0305,
      t1=PF_results.trafos.t1_5100_5101,
      t2=PF_results.trafos.t2_5100_5101) annotation (Placement(transformation(
          extent={{6,-4},{-6,4}},
          rotation=90,
          origin={28,-28})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer
      twoWindingTransformer5(
      G=0,
      B=0,
      X=0.015,
      R=0.0004,
      t1=PF_results.trafos.t1_5500_5501,
      t2=PF_results.trafos.t2_5500_5501) annotation (Placement(transformation(
          extent={{-6,-4},{6,4}},
          rotation=90,
          origin={66,-40})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer
      twoWindingTransformer6(
      G=0,
      B=0,
      R=0.0032,
      X=0.12,
      t1=PF_results.trafos.t1_5400_5401,
      t2=PF_results.trafos.t2_5400_5401)
      annotation (Placement(transformation(extent={{156,-38},{144,-30}})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer
      twoWindingTransformer7(
      G=0,
      B=0,
      R=0.0004,
      X=0.015,
      t1=PF_results.trafos.t1_5400_5402,
      t2=PF_results.trafos.t2_5400_5402) annotation (Placement(transformation(
          extent={{6,-4},{-6,4}},
          rotation=-90,
          origin={200,-30})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer
      twoWindingTransformer8(
      G=0,
      B=0,
      R=0.0008,
      X=0.0305,
      t1=PF_results.trafos.t1_5602_5603,
      t2=PF_results.trafos.t2_5602_5603) annotation (Placement(transformation(
          extent={{6,-4},{-6,4}},
          origin={200,-72})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer
      twoWindingTransformer9(
      G=0,
      B=0,
      R=0.0016,
      X=0.061,
      t1=PF_results.trafos.t1_5300_5301,
      t2=PF_results.trafos.t2_5300_5301) annotation (Placement(transformation(
          extent={{6,-4},{-6,4}},
          origin={222,84})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer
      twoWindingTransformer10(
      G=0,
      B=0,
      R=0.0002,
      X=0.0076,
      t1=PF_results.trafos.t1_5601_6001,
      t2=PF_results.trafos.t2_5601_6001) annotation (Placement(transformation(
          extent={{6,-4},{-6,4}},
          origin={230,32})));
    OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer
      twoWindingTransformer11(
      G=0,
      B=0,
      X=0.015,
      R=0.0004,
      t1=PF_results.trafos.t1_6000_6001,
      t2=PF_results.trafos.t2_6000_6001) annotation (Placement(transformation(
          extent={{6,-4},{-6,4}},
          origin={212,14})));
    inner N44.Base_Case.Data.PF_results PF_results
      annotation (Placement(transformation(extent={{-254,192},{-234,212}})));
    OpenIPSL.Examples.DAEMode.N44_Base_Case_Systems.Generators.GenEventTest genEventTest(
      V_b=300000,
      v_0=PF_results.voltages.V5610,
      angle_0=PF_results.voltages.A5610,
      P_0=1500000000,
      Q_0=600000000,
      eXST1_1(K_C=1.5))
      annotation (Placement(transformation(extent={{208,-116},{218,-106}})));
    Electrical.Events.PwFault pwFault(
    R=0,
    X=0.001,
    t1=1.050,
    t2=1.15)
      annotation (Placement(transformation(extent={{208,-156},{220,-144}})));
equation
    connect(G9_bus7000.pwPin, bus_7000.n[1]) annotation (Line(
        points={{-285.7,-143},{-274.075,-143},{-274.075,-92.25},{-272,-92.25}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G8_bus7000.pwPin, bus_7000.n[2]) annotation (Line(
        points={{-285.7,-135},{-275.075,-135},{-275.075,-89.55},{-272,-89.55}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G7_bus7000.pwPin, bus_7000.n[3]) annotation (Line(
        points={{-285.7,-127},{-276.075,-127},{-276.075,-86.85},{-272,-86.85}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G6_bus7000.pwPin, bus_7000.n[4]) annotation (Line(
        points={{-285.7,-119},{-277.075,-119},{-277.075,-84.15},{-272,-84.15}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G5_bus7000.pwPin, bus_7000.n[5]) annotation (Line(
        points={{-285.7,-111},{-278.075,-111},{-278.075,-81.45},{-272,-81.45}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G4_bus7000.pwPin, bus_7000.n[6]) annotation (Line(
        points={{-285.7,-103},{-279.075,-103},{-279.075,-78.75},{-272,-78.75}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G3_bus7000.pwPin, bus_7000.n[7]) annotation (Line(
        points={{-285.7,-95},{-280.075,-95},{-280.075,-76.05},{-272,-76.05}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G2_bus7000.pwPin, bus_7000.n[8]) annotation (Line(
        points={{-285.7,-87},{-281.075,-87},{-281.075,-73.35},{-272,-73.35}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G1_bus7000.pwPin, bus_7000.n[9]) annotation (Line(
        points={{-285.7,-79},{-281.075,-79},{-281.075,-70.65},{-272,-70.65}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(Load5_bus7000.p, bus_7000.n[10]) annotation (Line(
        points={{-286,-60},{-283.9,-60},{-283.9,-67.95},{-272,-67.95}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load4_bus7000.p, bus_7000.n[11]) annotation (Line(
        points={{-284,-54},{-282.9,-54},{-282.9,-65.25},{-272,-65.25}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load3_bus7000.p, bus_7000.n[12]) annotation (Line(
        points={{-284,-48},{-281.9,-48},{-281.9,-62.55},{-272,-62.55}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load2_bus7000.p, bus_7000.n[13]) annotation (Line(
        points={{-284,-42},{-280.9,-42},{-280.9,-59.85},{-272,-59.85}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus7000.p, bus_7000.n[14]) annotation (Line(
        points={{-284,-36},{-279.9,-36},{-279.9,-57.15},{-272,-57.15}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus7020.p, bus_7020.n[1]) annotation (Line(
        points={{-286.5,-15.75},{-283.9,-15.75},{-283.9,-15},{-282,-15}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus7010.p, bus_7010.n[1]) annotation (Line(
        points={{-286.5,4.25},{-283.9,4.25},{-283.9,5},{-282,5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_7010.p[1], line_7000_7010.p) annotation (Line(
        points={{-280,5},{-278,5},{-278,3.5},{-275,3.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_7020.p[1], line_7000_7020.p) annotation (Line(
        points={{-280,-15},{-278,-15},{-278,-24.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_7000_7020.n, bus_7000.n[15]) annotation (Line(
        points={{-278,-33.5},{-278,-54.25},{-272,-54.25},{-272,-54.45}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_7000_7010.n, bus_7000.n[16]) annotation (Line(
        points={{-275,-5.5},{-275,-26},{-274,-26},{-274,-52},{-272,-52},{-272,-51.75}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_7000_7100_3.n, bus_7000.p[1]) annotation (Line(
        points={{-254,-73.5},{-254,-87.25},{-270,-87.25},{-270,-88.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_7000_7100_2.n, bus_7000.p[2]) annotation (Line(
        points={{-257,-61.5},{-257.5,-61.5},{-257.5,-77.4},{-270,-77.4}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_7000_7100_1.n, bus_7000.p[3]) annotation (Line(
        points={{-260,-51.5},{-260,-54},{-262,-54},{-262,-58},{-270,-58},{-270,-66.6}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_7000_7100_3.p, bus_7100.n[1]) annotation (Line(
        points={{-254,-64.5},{-254,-42.975},{-252,-42.975}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_7000_7100_2.p, bus_7100.n[2]) annotation (Line(
        points={{-257,-52.5},{-257,-40.125},{-252,-40.125}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_7000_7100_1.p, bus_7100.n[3]) annotation (Line(
        points={{-260,-42.5},{-260,-37.275},{-252,-37.275}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load2_bus7100.p, bus_7100.n[4]) annotation (Line(
        points={{-262,-35},{-254.9,-35},{-254.9,-34.425},{-252,-34.425}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus7100.p, bus_7100.n[5]) annotation (Line(
        points={{-262,-30},{-257.9,-30},{-257.9,-31.575},{-252,-31.575}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_7100.p[1], line_3249_7100.n) annotation (Line(
        points={{-250,-40.6},{-244,-40.6},{-244,-45},{-235.5,-45}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load3_bus3000.p, bus_3000.n[1]) annotation (Line(
        points={{-270.5,32.25},{-264,32.25},{-264,50.8571},{-258,50.8571}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(Load2_bus3000.p, bus_3000.n[2]) annotation (Line(
        points={{-270.5,39.25},{-266,39.25},{-266,52.5714},{-258,52.5714}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(Load1_bus3000.p, bus_3000.n[3]) annotation (Line(
        points={{-270.5,45.25},{-268,45.25},{-268,54.2857},{-258,54.2857}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G3_bus3000.pwPin, bus_3000.n[4]) annotation (Line(
        points={{-273.7,51},{-270,51},{-270,56},{-258,56}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus3000.pwPin, bus_3000.n[5]) annotation (Line(
        points={{-273.7,59},{-273.7,57.7143},{-258,57.7143}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus3000.pwPin, bus_3000.n[6]) annotation (Line(
        points={{-273.7,67},{-265.075,67},{-265.075,59.4286},{-258,59.4286}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3000_3020.n, bus_3000.n[7]) annotation (Line(
        points={{-264.5,79},{-262,79},{-262,61.1429},{-258,61.1429}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3000_3115.p, bus_3000.p[1]) annotation (Line(
        points={{-247.5,21},{-254,21},{-254,51.2},{-256,51.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3000_3245_2.p, bus_3000.p[2]) annotation (Line(
        points={{-252,19.5},{-252,53.6},{-256,53.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3000_3245_1.p, bus_3000.p[3]) annotation (Line(
        points={{-238.5,56},{-256,56}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3000_3300_2.n, bus_3000.p[4]) annotation (Line(
        points={{-237,60.5},{-252.5,60.5},{-252.5,58.4},{-256,58.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3000_3300_1.n, bus_3000.p[5]) annotation (Line(
        points={{-245,66.5},{-254,66.5},{-254,60.8},{-256,60.8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load_bus3020.p, bus_3020.n[1]) annotation (Line(
        points={{-286.5,77.25},{-283.9,77.25},{-283.9,80},{-282,80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3000_3300_2.p, bus_3300.n[1]) annotation (Line(
        points={{-237,69.5},{-222,69.5},{-222,92.75},{-220,92.75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3000_3300_1.p, bus_3300.n[2]) annotation (Line(
        points={{-245,75.5},{-224,75.5},{-224,94.25},{-220,94.25}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus3300.pwPin, bus_3300.n[3]) annotation (Line(
        points={{-229.7,92},{-225,92},{-225,95.75},{-220,95.75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load2_bus3300.p, bus_3300.n[4]) annotation (Line(
        points={{-238.5,95.75},{-228,95.75},{-228,97.25},{-220,97.25}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus3300.p, bus_3300.n[5]) annotation (Line(
        points={{-238.5,100.25},{-234,100.25},{-234,98.75},{-220,98.75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G3_bus3300.pwPin, bus_3300.p[1]) annotation (Line(
        points={{-208.3,89},{-212.94,89},{-212.94,93.2},{-218,93.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus3300.pwPin, bus_3300.p[2]) annotation (Line(
        points={{-208.3,97},{-212.94,97},{-212.94,95.6},{-218,95.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3200_3300.p, bus_3300.p[3]) annotation (Line(
        points={{-201.5,103},{-209.25,103},{-209.25,98},{-218,98}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3200_1.p, bus_3200.n[1]) annotation (Line(
        points={{-181,81.5},{-181,86.25},{-178,86.25},{-178,93.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3200_2.p, bus_3200.n[2]) annotation (Line(
        points={{-187,81.5},{-187,86},{-182,86},{-182,95.6},{-178,95.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3200_3.p, bus_3200.n[3]) annotation (Line(
        points={{-193,81.5},{-193,90},{-184,90},{-184,98},{-178,98}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3200_3300.n, bus_3200.n[4]) annotation (Line(
        points={{-192.5,103},{-185.75,103},{-185.75,100.4},{-178,100.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3300_8500_2.n, bus_3300.p[4]) annotation (Line(
        points={{-207,114.5},{-207,108},{-211,108},{-211,100.4},{-218,100.4}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3300_8500_1.n, bus_3300.p[5]) annotation (Line(
        points={{-211,114.5},{-211,110},{-214,110},{-214,102.8},{-218,102.8}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3300_8500_2.p, bus_8500.n[1]) annotation (Line(
        points={{-207,123.5},{-207,126},{-202,126},{-202,133.8},{-198,133.8}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3300_8500_1.p, bus_8500.n[2]) annotation (Line(
        points={{-211,123.5},{-211,128},{-204,128},{-204,136.6},{-198,136.6}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G2_bus8500.pwPin, bus_8500.n[3]) annotation (Line(
        points={{-211.7,133},{-206,133},{-206,139.4},{-198,139.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus8500.pwPin, bus_8500.n[4]) annotation (Line(
        points={{-211.7,141},{-208,141},{-208,142.2},{-198,142.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load3_bus8500.p, bus_8500.n[5]) annotation (Line(
        points={{-212,148},{-208,148},{-208,145},{-198,145}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load2_bus8500.p, bus_8500.n[6]) annotation (Line(
        points={{-210.5,156.25},{-210,156.25},{-210,147.8},{-198,147.8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus8500.p, bus_8500.n[7]) annotation (Line(
        points={{-210.5,162.25},{-206,162.25},{-206,150.6},{-198,150.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_8500_8700.n, bus_8500.n[8]) annotation (Line(
        points={{-210.5,167},{-204,167},{-204,153.4},{-198,153.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3200_8500.p, bus_8500.p[1]) annotation (Line(
        points={{-189,125.5},{-189,126},{-194,126},{-194,133.975},{-196,133.975}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3359_8500_1.p, bus_8500.p[2]) annotation (Line(
        points={{-165.5,129},{-192,129},{-192,137.125},{-196,137.125}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3359_8500_2.p, bus_8500.p[3]) annotation (Line(
        points={{-165.5,133},{-190,133},{-190,140.275},{-196,140.275}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G6_bus8500.pwPin, bus_8500.p[4]) annotation (Line(
        points={{-184.3,139},{-188,139},{-188,143.425},{-196,143.425}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G5_bus8500.pwPin, bus_8500.p[5]) annotation (Line(
        points={{-184.3,147},{-186,147},{-186,146.575},{-196,146.575}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G4_bus8500.pwPin, bus_8500.p[6]) annotation (Line(
        points={{-184.3,155},{-186,155},{-186,149.725},{-196,149.725}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G3_bus8500.pwPin, bus_8500.p[7]) annotation (Line(
        points={{-182.3,163},{-188,163},{-188,152.875},{-196,152.875}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_8500_8700.p, bus_8700.p[1]) annotation (Line(
        points={{-219.5,167},{-227.25,167},{-227.25,166},{-236,166}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load_bus8700.p, bus_8700.n[1]) annotation (Line(
        points={{-244.5,166.25},{-241.9,166.25},{-241.9,166},{-238,166}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_8500_8600.n, bus_8500.p[8]) annotation (Line(
        points={{-183.5,169},{-190,169},{-190,156.025},{-196,156.025}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_8500_8600.p, bus_8600.n[1]) annotation (Line(
        points={{-174.5,169},{-168.75,169},{-168.75,166},{-162,166}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load_bus8600.p, bus_8600.p[1]) annotation (Line(
        points={{-153.5,166.5},{-157.1,166.5},{-157.1,166},{-160,166}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3200_8500.n, bus_3200.n[5]) annotation (Line(
        points={{-189,116.5},{-189,106},{-180,106},{-180,102.8},{-178,102.8}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3200_3359.p, bus_3200.p[1]) annotation (Line(
        points={{-157.5,99},{-166.25,99},{-166.25,98},{-176,98}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_3100.p[1], line_3100_3359_2.p) annotation (Line(
        points={{-176,43},{-163,43},{-163,51},{-159.5,51}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_3100.p[2], line_3100_3359_1.p) annotation (Line(
        points={{-176,49},{-168,49},{-168,57},{-159.5,57}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3359_2.n, bus_3359.n[1]) annotation (Line(
        points={{-150.5,51},{-128,51},{-128,67.5333},{-124,67.5333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3359_1.n, bus_3359.n[2]) annotation (Line(
        points={{-150.5,57},{-132,57},{-132,71.4},{-124,71.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load4_bus3359.p, bus_3359.n[3]) annotation (Line(
        points={{-136.5,74.25},{-133.9,74.25},{-133.9,75.2667},{-124,75.2667}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(Load3_bus3359.p, bus_3359.n[4]) annotation (Line(
        points={{-134.5,78.25},{-129.9,78.25},{-129.9,79.1333},{-124,79.1333}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(Load2_bus3359.p, bus_3359.n[5]) annotation (Line(
        points={{-132.5,82.25},{-130.9,82.25},{-130.9,83},{-124,83}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus3359.p, bus_3359.n[6]) annotation (Line(
        points={{-130.5,86.75},{-129.9,86.75},{-129.9,86.8667},{-124,86.8667}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3200_3359.n, bus_3359.n[7]) annotation (Line(
        points={{-148.5,99},{-129,99},{-129,92},{-125,92},{-125,90.7333},{-124,
          90.7333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3359_8500_1.n, bus_3359.n[8]) annotation (Line(
        points={{-156.5,129},{-137,129},{-137,106},{-127,106},{-127,94.6},{-124,
            94.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3359_8500_2.n, bus_3359.n[9]) annotation (Line(
        points={{-156.5,133},{-127,133},{-127,108},{-125,108},{-125,98.4667},{
          -124,98.4667}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load_bus3360.p, bus_3360.p[1]) annotation (Line(
        points={{-85.5,140.25},{-89.1,140.25},{-89.1,140},{-94,140}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3249.p, bus_3100.n[1]) annotation (Line(
        points={{-189,19.5},{-189,38},{-182,38},{-182,41},{-178,41}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3115.p, bus_3100.n[2]) annotation (Line(
        points={{-197.5,34},{-196,34},{-196,40},{-184,40},{-184,43},{-178,43}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(Load_bus3100.p, bus_3100.n[3]) annotation (Line(
        points={{-194.5,47.25},{-186.9,47.25},{-186.9,45},{-178,45}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3200_3.n, bus_3100.n[4]) annotation (Line(
        points={{-193,72.5},{-193,52},{-184,52},{-184,47},{-178,47}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3200_2.n, bus_3100.n[5]) annotation (Line(
        points={{-187,72.5},{-187,58},{-182,58},{-182,48},{-180,48},{-180,49},{-178,
            49}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3200_1.n, bus_3100.n[6]) annotation (Line(
        points={{-181,72.5},{-181,62},{-180,62},{-180,50},{-178,50},{-178,51}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3115_6701.n, bus_6701.n[1]) annotation (Line(
        points={{-204,-40.5},{-204,-60},{-172,-60},{-172,-87},{-146,-87}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(bus_3701.p[1], line_3701_6700.n) annotation (Line(
        points={{-116,-60},{-108,-60},{-108,-69},{-99.5,-69}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_3244.p[1], line_3244_6500.n) annotation (Line(
        points={{-176,-96},{-160,-96},{-160,-111},{-115.5,-111}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_6700.p[1], line_6500_6700_2.n) annotation (Line(
        points={{-76,-88.8},{-70,-88.8},{-70,-91},{-55.5,-91}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_6500_6700_1.n, bus_6700.p[2]) annotation (Line(
        points={{-55.5,-85},{-70.25,-85},{-70.25,-86.4},{-76,-86.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3244_6500.p, bus_6500.n[1]) annotation (Line(
        points={{-106.5,-111},{-46,-111},{-46,-119},{-24,-119},{-24,-111},{-20,-111}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(Load3_bus6500.p, bus_6500.n[2]) annotation (Line(
        points={{-30.5,-111.75},{-25.9,-111.75},{-25.9,-106.6},{-20,-106.6}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(Load2_bus6500.p, bus_6500.n[3]) annotation (Line(
        points={{-30.5,-103.75},{-25.9,-103.75},{-25.9,-102.2},{-20,-102.2}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(Load1_bus6500.p, bus_6500.n[4]) annotation (Line(
        points={{-30.5,-97.75},{-25.9,-97.75},{-25.9,-97.8},{-20,-97.8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_6500_6700_2.p, bus_6500.n[5]) annotation (Line(
        points={{-46.5,-91},{-38.75,-91},{-38.75,-93.4},{-20,-93.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_6500_6700_1.p, bus_6500.n[6]) annotation (Line(
        points={{-46.5,-85},{-38.75,-85},{-38.75,-89},{-20,-89}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5100.p[1], line_5100_5500.n) annotation (Line(
        points={{24,-67},{32,-67},{32,-65},{36.5,-65}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3359_5101_2.n, bus_3359.p[1]) annotation (Line(
        points={{-69.5,11},{-118,11},{-118,67.5333},{-122,67.5333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3359_5101_1.n, bus_3359.p[2]) annotation (Line(
        points={{-69.5,17},{-114,17},{-114,71.4},{-122,71.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G6_bus3359.pwPin, bus_3359.p[3]) annotation (Line(
        points={{-98.3,67},{-111.94,67},{-111.94,75.2667},{-122,75.2667}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G5_bus3359.pwPin, bus_3359.p[4]) annotation (Line(
        points={{-98.3,75},{-109.94,75},{-109.94,79.1333},{-122,79.1333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G4_bus3359.pwPin, bus_3359.p[5]) annotation (Line(
        points={{-98.3,83},{-122,83}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G3_bus3359.pwPin, bus_3359.p[6]) annotation (Line(
        points={{-98.3,91},{-110.94,91},{-110.94,86.8667},{-122,86.8667}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus3359.pwPin, bus_3359.p[7]) annotation (Line(
        points={{-98.3,99},{-111.94,99},{-111.94,90.7333},{-122,90.7333}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus3359.pwPin, bus_3359.p[8]) annotation (Line(
        points={{-98.3,107},{-112.94,107},{-112.94,94.6},{-122,94.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3359_5101_2.p, bus_5101.n[1]) annotation (Line(
        points={{-60.5,11},{15.25,11},{15.25,5},{22,5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3359_5101_1.p, bus_5101.n[2]) annotation (Line(
        points={{-60.5,17},{15.25,17},{15.25,11},{22,11}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5101.p[1], line_5101_5501.n) annotation (Line(
        points={{24,3.5},{32,3.5},{32,3},{38.5,3}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5101.p[2], line_5101_5102.n) annotation (Line(
        points={{24,6.5},{32,6.5},{32,9},{38.5,9}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5101.p[3], line_5101_5103.n) annotation (Line(
        points={{24,9.5},{32,9.5},{32,15},{38.5,15}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5101_5103.p, bus_5103.n[1]) annotation (Line(
        points={{47.5,15},{63.25,15},{63.25,48},{80,48}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5102_5103.n, bus_5103.p[1]) annotation (Line(
        points={{92.5,41},{87.75,41},{87.75,44},{82,44}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5103_5304_2.n, bus_5103.p[2]) annotation (Line(
        points={{92.5,47},{87.75,47},{87.75,48},{82,48}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5103_5304_1.n, bus_5103.p[3]) annotation (Line(
        points={{92.5,53},{87.75,53},{87.75,52},{82,52}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5102_5304.p, bus_5304.n[1]) annotation (Line(
        points={{116,53.5},{116,76},{122,76}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5103_5304_2.p, bus_5304.n[2]) annotation (Line(
        points={{101.5,47},{108,47},{108,80},{122,80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5103_5304_1.p, bus_5304.n[3]) annotation (Line(
        points={{101.5,53},{104,53},{104,84},{122,84}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5101_5102.p, bus_5102.n[1]) annotation (Line(
        points={{47.5,9},{84.25,9},{84.25,10},{122,10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5102.n[2], line_5102_5103.p) annotation (Line(
        points={{122,14},{112,14},{112,24},{104,24},{104,41},{101.5,41}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5102_5304.n, bus_5102.n[3]) annotation (Line(
        points={{116,44.5},{116,18},{122,18}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5102.p[1], line_5102_6001.n) annotation (Line(
        points={{124,14},{131.5,14}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5301_5304.n, bus_5304.p[1]) annotation (Line(
        points={{154.5,75},{139.75,75},{139.75,76},{124,76}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5304_5305_2.n, bus_5304.p[2]) annotation (Line(
        points={{141,92.5},{141,80},{124,80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5304_5305_1.n, bus_5304.p[3]) annotation (Line(
        points={{135,92.5},{135,84},{124,84}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5304_5305_2.p, bus_5305.n[1]) annotation (Line(
        points={{141,101.5},{141,117},{162,117}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5304_5305_1.p, bus_5305.n[2]) annotation (Line(
        points={{135,101.5},{135,123},{162,123}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5305.p[1], line_5301_5305.p) annotation (Line(
        points={{164,120},{183,120},{183,101.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5301_6001.p, bus_5301.n[1]) annotation (Line(
        points={{172,57.5},{172,64},{186,64},{186,76},{200,76}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5301_5304.p, bus_5301.n[2]) annotation (Line(
        points={{163.5,75},{181.25,75},{181.25,80},{200,80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5301_5305.n, bus_5301.n[3]) annotation (Line(
        points={{183,92.5},{183,84},{200,84}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5300_6100.p, bus_5300.p[1]) annotation (Line(
        points={{254.5,75},{242,75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_6000_6100.p, bus_6100.n[1]) annotation (Line(
        points={{274,33.5},{274,40},{278,40},{278,43.2},{280,43.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5600_5603.n, bus_5600.n[1]) annotation (Line(
        points={{259.5,-53},{272,-53},{272,-48.5},{280,-48.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load2_bus5600.p, bus_5600.n[2]) annotation (Line(
        points={{269.5,-44.75},{272.1,-44.75},{272.1,-45.5},{280,-45.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus5600.p, bus_5600.n[3]) annotation (Line(
        points={{269.5,-34.75},{272.1,-34.75},{272.1,-42.5},{280,-42.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5600_6000.n, bus_5600.n[4]) annotation (Line(
        points={{269.5,-15},{274,-15},{274,-39.5},{280,-39.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5601.p[1], line_5600_5601.p) annotation (Line(
        points={{282,8},{285,8},{285,-10.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5620.p[1], line_5600_5620.n) annotation (Line(
        points={{282,-94},{288,-94},{288,-75.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5603_5610.n, bus_5610.n[1]) annotation (Line(
        points={{233,-95.5},{233,-109},{242,-109}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5603.p[1], line_5603_5610.p) annotation (Line(
        points={{222,-79},{233,-79},{233,-86.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5610.p[1], Load1_bus5610.p) annotation (Line(
        points={{244,-106},{245.9,-106},{245.9,-104.75},{252,-104.75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5500_5603.p, bus_5603.n[1]) annotation (Line(
        points={{118.5,-89},{168,-89},{168,-100},{196,-100},{196,-80},{220,-80}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(Load2_bus5500.p, bus_5500.n[1]) annotation (Line(
        points={{65.5,-83.75},{71.1,-83.75},{71.1,-81.2},{76,-81.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus5500.p, bus_5500.n[2]) annotation (Line(
        points={{65.5,-75.75},{70.1,-75.75},{70.1,-76.4},{76,-76.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5100_5500.p, bus_5500.n[3]) annotation (Line(
        points={{45.5,-65},{60.25,-65},{60.25,-71.6},{76,-71.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5101_5501.p, bus_5501.n[1]) annotation (Line(
        points={{47.5,3},{72,3},{72,-19},{80,-19}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5501.p[1], line_5401_5501.n) annotation (Line(
        points={{82,-16},{101.5,-16}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5401_5501.p, bus_5401.n[1]) annotation (Line(
        points={{110.5,-16},{111.25,-16},{111.25,-34},{122,-34}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5401_6001.p, bus_6001.n[1]) annotation (Line(
        points={{139.5,-10},{139.5,2},{150,2},{150,18},{182,18}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5401_5602.n, bus_5401.p[1]) annotation (Line(
        points={{135,-45.5},{135,-38},{124,-38}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5401_5602.p, bus_5602.n[1]) annotation (Line(
        points={{135,-54.5},{135,-76},{182,-76}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5402_6001.p, bus_5402.n[1]) annotation (Line(
        points={{188,-1.5},{188,-8},{194,-8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5102_6001.p, bus_6001.n[2]) annotation (Line(
        points={{140.5,14},{146,14},{146,22},{182,22}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_6001.n[3], line_5301_6001.n) annotation (Line(
        points={{182,26},{172,26},{172,48.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5600_6000.p, bus_6000.p[1]) annotation (Line(
        points={{260.5,-15},{252,-15},{252,-2.8},{242,-2.8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_6000.p[2], line_6000_6100.n) annotation (Line(
        points={{242,-0.4},{274,-0.4},{274,24.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5101_5501.n, shunt_5101_5501.p) annotation (Line(
        points={{38.5,3},{38.5,1.5},{38,1.5},{38,0}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5101_5501.p, shunt_5501_5101.p) annotation (Line(
        points={{47.5,3},{47.5,0.5},{48,0.5},{48,0}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5102_6001.n, shunt_5102_6001.p) annotation (Line(
        points={{131.5,14},{133,14},{133,12},{130,12}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5102_6001.p, shunt_6001_5102.p) annotation (Line(
        points={{140.5,14},{139,14},{139,12},{142,12}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(shunt_5401_6001.p, line_5401_6001.n) annotation (Line(
        points={{128,-14},{128,-10},{130.5,-10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5401_6001.p, shunt_6001_5401.p) annotation (Line(
        points={{139.5,-10},{143,-10},{143,-14}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(shunt_5500_5603.p, line_5500_5603.n) annotation (Line(
        points={{106,-92},{109.5,-92},{109.5,-89}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5500_5603.p, shunt_5603_5500.p) annotation (Line(
        points={{118.5,-89},{118.5,-92},{122,-92}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5600_5603.p, bus_5603.p[2]) annotation (Line(
        points={{250.5,-53},{241.75,-53},{241.75,-73},{222,-73}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G3_bus7100.p, bus_7100.n[6]) annotation (Line(
        points={{-259.7,-23},{-257,-23},{-257,-28.725},{-252,-28.725}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus7100.p, bus_7100.n[7]) annotation (Line(
        points={{-259.7,-17},{-255,-17},{-255,-25.875},{-252,-25.875}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus7100.p, bus_7100.n[8]) annotation (Line(
        points={{-259.7,-11},{-254,-11},{-254,-24},{-252,-24},{-252,-23.025}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G7_bus3249.p, bus_3249.p[1]) annotation (Line(
        points={{-164.3,-45},{-169.15,-45},{-169.15,-37.5},{-174,-37.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G6_bus3249.p, bus_3249.p[2]) annotation (Line(
        points={{-164.3,-35},{-169.15,-35},{-169.15,-31.7},{-174,-31.7}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G5_bus3249.p, bus_3249.p[3]) annotation (Line(
        points={{-164.3,-27},{-170,-27},{-170,-25.9},{-174,-25.9}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G4_bus3249.p, bus_3249.p[4]) annotation (Line(
        points={{-164.3,-19},{-169.15,-19},{-169.15,-20.1},{-174,-20.1}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus6700.p, bus_6700.n[1]) annotation (Line(
        points={{-91.7,-95},{-82,-95},{-82,-88.5},{-78,-88.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus6700.p, bus_6700.n[2]) annotation (Line(
        points={{-90.5,-85.75},{-84,-85.75},{-84,-85.5},{-78,-85.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3701_6700.p, bus_6700.n[3]) annotation (Line(
        points={{-90.5,-69},{-82,-69},{-82,-82.5},{-78,-82.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus6700.p, bus_6700.p[3]) annotation (Line(
        points={{-64.3,-81},{-66,-81},{-66,-84},{-76,-84}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(bus_5401.p[2], line_5401_6001.n) annotation (Line(
        points={{124,-34},{132,-34},{132,-28},{130.5,-28},{130.5,-10}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus5400.p, bus_5400.p[1]) annotation (Line(
        points={{195.7,-53},{188.85,-53},{188.85,-50},{182,-50}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5400_6000.n, bus_5400.p[2]) annotation (Line(
        points={{217.5,-23},{206,-23},{206,-46},{182,-46}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus5300.p, bus_5300.p[2]) annotation (Line(
        points={{255.7,81},{254.85,81},{254.85,77},{242,77}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus6100.p, bus_6100.n[2]) annotation (Line(
        points={{268.3,45},{276,45},{276,45.6},{280,45.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load2_bus6100.p, bus_6100.n[3]) annotation (Line(
        points={{269.5,53.25},{271.1,53.25},{271.1,48},{280,48}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus6100.p, bus_6100.n[4]) annotation (Line(
        points={{269.5,63.25},{274,63.25},{274,50.4},{280,50.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5300_6100.n, bus_6100.n[5]) annotation (Line(
        points={{263.5,75},{276,75},{276,52.8},{280,52.8}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G5_bus6100.p, bus_6100.p[1]) annotation (Line(
        points={{289.7,37},{286,37},{286,43.5},{282,43.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G4_bus6100.p, bus_6100.p[2]) annotation (Line(
        points={{289.7,45},{287.85,45},{287.85,46.5},{282,46.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G3_bus6100.p, bus_6100.p[3]) annotation (Line(
        points={{289.7,53},{287.85,53},{287.85,49.5},{282,49.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus6100.p, bus_6100.p[4]) annotation (Line(
        points={{289.7,61},{286,61},{286,52.5},{282,52.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load_bus5620.p, bus_5620.n[1]) annotation (Line(
        points={{269.5,-94.75},{271.9,-94.75},{271.9,-94},{280,-94}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3115_7100.p, bus_7100.p[2]) annotation (Line(
        points={{-243.5,-26},{-243.5,-26.5},{-250,-26.5},{-250,-33}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G4_bus6500.p, bus_6500.p[1]) annotation (Line(
        points={{-4.3,-117},{-12,-117},{-12,-110.56},{-18,-110.56}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G3_bus6500.p, bus_6500.p[2]) annotation (Line(
        points={{-4.3,-109},{-11.15,-109},{-11.15,-105.28},{-18,-105.28}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus6500.p, bus_6500.p[3]) annotation (Line(
        points={{-4.3,-101},{-11.15,-101},{-11.15,-100},{-18,-100}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus6500.p, bus_6500.p[4]) annotation (Line(
        points={{-4.3,-93},{-11.15,-93},{-11.15,-94.72},{-18,-94.72}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5100_6500.n, bus_6500.p[5]) annotation (Line(
        points={{-1.5,-79},{-6,-79},{-6,-89.44},{-18,-89.44}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3115_3245.p, bus_3115.p[1]) annotation (Line(
        points={{-212,-14.5},{-220,-14.5},{-220,-5.15},{-226,-5.15}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3115_6701.p, bus_3115.p[2]) annotation (Line(
        points={{-204,-31.5},{-204.5,-31.5},{-204.5,2.95},{-226,2.95}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3115_3249.n, bus_3115.p[3]) annotation (Line(
        points={{-211.5,11},{-218.25,11},{-218.25,11.05},{-226,11.05}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3100_3115.n, bus_3115.p[4]) annotation (Line(
        points={{-206.5,34},{-206.5,19.15},{-226,19.15}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5400_6000.p, bus_6000.n[1]) annotation (Line(
        points={{226.5,-23},{236,-23},{236,-2},{240,-2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus6000.p, bus_6000.n[2]) annotation (Line(
        points={{227.4,2},{240,2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5100_6500.p, bus_5100.n[1]) annotation (Line(
        points={{7.5,-79},{16,-79},{16,-68.5},{22,-68.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus5100.p, bus_5100.n[2]) annotation (Line(
        points={{8.3,-65},{15.15,-65},{15.15,-65.5},{22,-65.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load_bus5100.p, bus_5100.n[3]) annotation (Line(
        points={{9.5,-59.75},{16,-59.75},{16,-62.5},{22,-62.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3000_3020.p, bus_3020.p[1]) annotation (Line(
        points={{-273.5,79},{-276.25,79},{-276.25,80},{-280,80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5400_5500.p, bus_5400.n[1]) annotation (Line(
        points={{129.5,-63},{176,-63},{176,-50.5},{180,-50.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus5400.p, bus_5400.n[2]) annotation (Line(
        points={{168.3,-57},{174,-57},{174,-47.5},{180,-47.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load1_bus5400.p, bus_5400.n[3]) annotation (Line(
        points={{167.5,-45.75},{171.1,-45.75},{171.1,-44.5},{180,-44.5}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus5300.p, bus_5300.n[1]) annotation (Line(
        points={{226.3,67},{234,67},{234,76},{240,76}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load_bus5300.p, bus_5300.n[2]) annotation (Line(
        points={{225.5,77.25},{232.1,77.25},{232.1,80},{240,80}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3249_7100.p, bus_3249.n[1]) annotation (Line(
        points={{-226.5,-45},{-184,-45},{-184,-37.9143},{-176,-37.9143}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G3_bus3249.p, bus_3249.n[2]) annotation (Line(
        points={{-191.7,-33},{-183.85,-33},{-183.85,-32.9429},{-176,-32.9429}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G2_bus3249.p, bus_3249.n[3]) annotation (Line(
        points={{-191.7,-25},{-183.85,-25},{-183.85,-27.9714},{-176,-27.9714}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G1_bus3249.p, bus_3249.n[4]) annotation (Line(
        points={{-191.7,-17},{-183.85,-17},{-183.85,-23},{-176,-23}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Load_bus3249.p, bus_3249.n[5]) annotation (Line(
        points={{-188.5,-9.75},{-186,-9.75},{-186,-10},{-184,-10},{-184,-14},{
          -180,-14},{-180,-18.0286},{-176,-18.0286}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3115_3249.p, bus_3249.n[6]) annotation (Line(
        points={{-202.5,11},{-194,11},{-194,-4},{-182,-4},{-182,-13.0571},{-176,
          -13.0571}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3100_3249.n, bus_3249.n[7]) annotation (Line(
        points={{-189,10.5},{-189,0},{-180,0},{-180,-8.08571},{-176,-8.08571}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3000_3245_2.n, bus_3245.n[1]) annotation (Line(
        points={{-252,10.5},{-252,-8},{-242,-8},{-242,-22},{-230,-22},{-230,-40},
            {-218,-40},{-218,-76},{-208,-76}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_3000_3245_1.n, bus_3245.n[2]) annotation (Line(
        points={{-229.5,56},{-218,56},{-218,-34},{-214,-34},{-214,-72},{-208,-72}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_3115_3245.n, bus_3245.n[3]) annotation (Line(
        points={{-212,-23.5},{-212,-30},{-210,-30},{-210,-68},{-208,-68}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_5600_5620.p, bus_5600.p[1]) annotation (Line(
        points={{288,-66.5},{288,-56},{285,-56},{285,-49},{282,-49}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G2_bus5600.p, bus_5600.p[2]) annotation (Line(
        points={{291.7,-59},{290,-59},{290,-54},{288,-54},{288,-47},{282,-47}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(G1_bus5600.p, bus_5600.p[3]) annotation (Line(
        points={{291.7,-51},{290,-51},{290,-46},{286,-46},{286,-45},{282,-45}},
        color={0,0,255},
        smooth=Smooth.None));

    connect(line_5500_5603.n, bus_5500.p[1]) annotation (Line(
        points={{109.5,-89},{86,-89},{86,-81.2},{78,-81.2}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus5500.p, bus_5500.p[2]) annotation (Line(
        points={{89.7,-74},{84,-74},{84,-76.4},{78,-76.4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5400_5500.n, bus_5500.p[3]) annotation (Line(
        points={{120.5,-63},{88,-63},{88,-71.6},{78,-71.6}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(G1_bus3245.p, bus_3245.p[1]) annotation (Line(
        points={{-200.3,-65},{-202,-65},{-202,-75},{-206,-75}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(line_5402_6001.n, bus_6001.p[1]) annotation (Line(
        points={{188,7.5},{188,18},{184,18}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(Exch_bus8500.p, bus_8500.n[9]) annotation (Line(points={{-210,176},{-202,
            176},{-202,156.2},{-198,156.2}}, color={0,0,255}));
    connect(Exch_bus7000.p, bus_7000.p[4]) annotation (Line(points={{-266,-48},{-266,
            -48},{-266,-56},{-268,-56},{-268,-55.8},{-270,-55.8}}, color={0,0,255}));
    connect(Exch_bus7100.p, bus_7100.p[3]) annotation (Line(points={{-246,-15},{-246,
            -25.4},{-250,-25.4}}, color={0,0,255}));
    connect(Exch1_bus6701.p, bus_6701.n[2]) annotation (Line(points={{-154.5,-75.75},
            {-150,-75.75},{-150,-81},{-146,-81}}, color={0,0,255}));
    connect(Exch2_bus6701.p, bus_6701.p[1]) annotation (Line(points={{-136,-75.75},
            {-140,-75.75},{-140,-87},{-144,-87}}, color={0,0,255}));
    connect(line_3115_7100.n, bus_3115.n[1]) annotation (Line(points={{-234.5,-26},
            {-232,-26},{-232,-7.175},{-228,-7.175}}, color={0,0,255}));
    connect(Load_bus3115.p, bus_3115.n[2]) annotation (Line(points={{-236.5,-8.5},
            {-234,-8.5},{-234,-3.125},{-228,-3.125}}, color={0,0,255}));
    connect(G3_bus3115.p, bus_3115.n[3]) annotation (Line(points={{-241.7,-1},{-234.85,
            -1},{-234.85,0.925},{-228,0.925}}, color={0,0,255}));
    connect(G2_bus3115.p, bus_3115.n[4]) annotation (Line(points={{-241.7,7},{-234.85,
            7},{-234.85,4.975},{-228,4.975}}, color={0,0,255}));
    connect(G1_bus3115.p, bus_3115.n[5]) annotation (Line(points={{-241.7,15},{-234.85,
            15},{-234.85,9.025},{-228,9.025}}, color={0,0,255}));
    connect(line_3000_3115.n, bus_3115.n[6]) annotation (Line(points={{-238.5,21},
            {-233.75,21},{-233.75,13.075},{-228,13.075}}, color={0,0,255}));
    connect(G5_add_bus3115.p, bus_3115.n[7]) annotation (Line(points={{-239.7,29},
            {-232,29},{-232,17.125},{-228,17.125}}, color={0,0,255}));
    connect(G4_add_bus3115.p, bus_3115.n[8]) annotation (Line(points={{-239.7,37},
            {-230,37},{-230,21.175},{-228,21.175}}, color={0,0,255}));
    connect(G8_add_bus3249.p, bus_3249.p[5]) annotation (Line(points={{-164.3,-3},
            {-168,-3},{-168,-14.3},{-174,-14.3}}, color={0,0,255}));
    connect(G6_add_bus3300.pwPin, bus_3300.n[6]) annotation (Line(points={{-229.7,
            105},{-228,105},{-228,100.25},{-220,100.25}}, color={0,0,255}));
    connect(G5_add_bus3300.pwPin, bus_3300.n[7]) annotation (Line(points={{-229.7,
            113},{-226,113},{-226,101.75},{-220,101.75}}, color={0,0,255}));
    connect(G4_add_bus3300.pwPin, bus_3300.n[8]) annotation (Line(points={{-229.7,
            121},{-224,121},{-224,103.25},{-220,103.25}}, color={0,0,255}));
    connect(G2_add_bus5100.p, bus_5100.n[4]) annotation (Line(points={{8.3,-55},{
            18,-55},{18,-59.5},{22,-59.5}}, color={0,0,255}));
    connect(G3_add_bus5300.p, bus_5300.p[3]) annotation (Line(points={{255.7,89},
            {254,89},{254,79},{242,79}}, color={0,0,255}));
    connect(G4_add_bus5300.p, bus_5300.p[4]) annotation (Line(points={{255.7,97},
            {252,97},{252,81},{242,81}}, color={0,0,255}));
    connect(G5_add_bus5300.p, bus_5300.p[5]) annotation (Line(points={{255.7,105},
            {250,105},{250,83},{242,83}}, color={0,0,255}));
    connect(G6_add_bus5300.p, bus_5300.p[6]) annotation (Line(points={{255.7,113},
            {248,113},{248,85},{242,85}}, color={0,0,255}));
    connect(G2_add_bus5500.p, bus_5500.p[4]) annotation (Line(points={{89.7,-56},
            {84,-56},{84,-66.8},{78,-66.8}}, color={0,0,255}));
    connect(G3_add_bus5600.p, bus_5600.p[4]) annotation (Line(points={{291.7,-43},
            {286.85,-43},{282,-43}}, color={0,0,255}));
    connect(G4_add_bus5600.p, bus_5600.p[5]) annotation (Line(points={{291.7,-35},
            {288,-35},{288,-41},{282,-41}}, color={0,0,255}));
    connect(line_5600_5601.n, bus_5600.p[6]) annotation (Line(points={{285,-19.5},
            {285,-39},{282,-39}}, color={0,0,255}));
    connect(G4_add_bus6000.p, bus_6000.p[3]) annotation (Line(points={{256.6,8},{
            254,8},{254,2},{242,2}}, color={0,0,255}));
    connect(G3_add_bus6000.p, bus_6000.p[4]) annotation (Line(points={{256.6,18},
            {252,18},{252,4.4},{242,4.4}}, color={0,0,255}));
    connect(G2_add_bus6000.p, bus_6000.p[5]) annotation (Line(points={{256.6,28},
            {248,28},{248,6.8},{242,6.8}}, color={0,0,255}));
    connect(G3_add_bus6700.p, bus_6700.p[4]) annotation (Line(points={{-64.3,-73},
            {-66,-73},{-68,-73},{-68,-74},{-68,-81.6},{-76,-81.6}}, color={0,0,
            255}));
    connect(G4_add_bus6700.p, bus_6700.p[5]) annotation (Line(points={{-64.3,-65},
            {-68,-65},{-70,-65},{-70,-66},{-70,-79.2},{-76,-79.2}}, color={0,0,
            255}));
    connect(twoWindingTransformer.n, bus_3360.n[1]) annotation (Line(points={{-101.4,
          140},{-101.4,140},{-96,140}}, color={0,0,255}));
    connect(twoWindingTransformer.p, bus_3359.p[9]) annotation (Line(points={{-114.6,
          140},{-118,140},{-118,98.4667},{-122,98.4667}}, color={0,0,255}));
    connect(twoWindingTransformer1.n, bus_3249.p[6]) annotation (Line(points={{-146.6,
          -12},{-174,-12},{-174,-8.5}}, color={0,0,255}));
    connect(twoWindingTransformer1.p, bus_3701.n[1]) annotation (Line(points={{-133.4,
          -12},{-126,-12},{-126,-60},{-118,-60}}, color={0,0,255}));
    connect(twoWindingTransformer2.n, bus_3245.p[2]) annotation (Line(points={{-196.6,
          -80},{-202,-80},{-202,-69},{-206,-69}}, color={0,0,255}));
    connect(twoWindingTransformer2.p, bus_3244.n[1]) annotation (Line(points={{-183.4,
          -80},{-180,-80},{-180,-96},{-178,-96}}, color={0,0,255}));
    connect(twoWindingTransformer3.n, bus_6701.p[2]) annotation (Line(points={{-124.6,
          -88},{-144,-88},{-144,-81}}, color={0,0,255}));
    connect(twoWindingTransformer3.p, bus_6700.n[4]) annotation (Line(points={{-111.4,
          -88},{-78,-88},{-78,-79.5}}, color={0,0,255}));
    connect(twoWindingTransformer4.p, bus_5101.p[4]) annotation (Line(points={{28,
          -21.4},{26,-21.4},{26,12.5},{24,12.5}},
                                                color={0,0,255}));
    connect(twoWindingTransformer4.n, bus_5100.p[2])
      annotation (Line(points={{28,-34.6},{28,-61},{24,-61}},
                                                            color={0,0,255}));
    connect(twoWindingTransformer5.n, bus_5501.n[2])
      annotation (Line(points={{66,-33.4},{66,-13},{80,-13}},
                                                            color={0,0,255}));
    connect(twoWindingTransformer5.p, bus_5500.n[4]) annotation (Line(points={{66,
          -46.6},{66,-46.6},{66,-62},{66,-66.8},{76,-66.8}},
                                                           color={0,0,255}));
    connect(twoWindingTransformer6.n, bus_5401.p[3])
      annotation (Line(points={{143.4,-34},{124,-34},{124,-30}},
                                                               color={0,0,255}));
    connect(twoWindingTransformer6.p, bus_5400.n[4]) annotation (Line(points={{156.6,
          -34},{172,-34},{172,-41.5},{180,-41.5}}, color={0,0,255}));
    connect(twoWindingTransformer7.n, bus_5402.p[1])
      annotation (Line(points={{200,-23.4},{200,-8},{196,-8}},
                                                             color={0,0,255}));
    connect(twoWindingTransformer7.p, bus_5400.p[3])
      annotation (Line(points={{200,-36.6},{200,-42},{182,-42}},
                                                               color={0,0,255}));
    connect(twoWindingTransformer8.p, bus_5603.n[2])
      annotation (Line(points={{206.6,-72},{220,-72},{220,-76}},
                                                               color={0,0,255}));
    connect(twoWindingTransformer8.n, bus_5602.p[1])
      annotation (Line(points={{193.4,-72},{184,-72},{184,-76}},
                                                               color={0,0,255}));
    connect(twoWindingTransformer9.p, bus_5300.n[3])
      annotation (Line(points={{228.6,84},{228.6,84},{240,84}},
                                                              color={0,0,255}));
    connect(twoWindingTransformer9.n, bus_5301.p[1])
      annotation (Line(points={{215.4,84},{202,84},{202,80}},
                                                            color={0,0,255}));
    connect(twoWindingTransformer10.p, bus_5601.n[1]) annotation (Line(points={{236.6,
          32},{236.6,32},{270,32},{270,8},{280,8}}, color={0,0,255}));
    connect(twoWindingTransformer10.n, bus_6001.p[2]) annotation (Line(points={{223.4,
          32},{190,32},{190,22},{184,22}}, color={0,0,255}));
    connect(twoWindingTransformer11.n, bus_6001.p[3]) annotation (Line(points={{205.4,
          14},{198,14},{198,26},{184,26}}, color={0,0,255}));
    connect(twoWindingTransformer11.p, bus_6000.n[3]) annotation (Line(points={{218.6,
          14},{234,14},{234,6},{240,6}}, color={0,0,255}));
    connect(genEventTest.p, bus_5610.n[2]) annotation (Line(points={{218.5,-111},
            {230.25,-111},{230.25,-103},{242,-103}}, color={0,0,255}));
    connect(pwFault.p, bus_5603.n[3]) annotation (Line(points={{207,-150},{176,-150},
          {176,-104},{216,-104},{216,-72},{220,-72}}, color={0,0,255}));
    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-300,-220},{
              300,220}}), graphics={Text(
            extent={{-278,12},{-290,16}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
7010"), Text(
            extent={{-266,-110},{-254,-114}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
7000"), Text(
            extent={{-280,-10},{-292,-6}},
            lineColor={0,128,0},
            textString="bus 7020",
            textStyle={TextStyle.Bold}),Text(
            extent={{-256,-54},{-244,-58}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
7100"), Text(
            extent={{-232,42},{-220,38}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
3115"), Text(
            extent={{-264,44},{-252,40}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
3000"), Text(
            extent={{-288,98},{-276,94}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
3020"), Text(
            extent={{-224,84},{-212,80}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
3300"), Text(
            extent={{-184,114},{-172,110}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
3200"), Text(
            extent={{-182,34},{-170,30}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
3100"), Text(
            extent={{-202,172},{-190,168}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
8500"), Text(
            extent={{-242,154},{-230,150}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
8700"), Text(
            extent={{-166,154},{-154,150}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
8600"), Text(
            extent={{-128,118},{-116,114}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
3359"), Text(
            extent={{-100,156},{-88,152}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
3360"), Text(
            extent={{-182,-54},{-170,-58}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
3249"), Text(
            extent={{-124,-42},{-112,-46}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
3701"), Text(
            extent={{-212,-84},{-200,-88}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
3245"), Text(
            extent={{-182,-112},{-170,-116}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
3244"), Text(
            extent={{-150,-96},{-138,-100}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
6701"), Text(
            extent={{-82,-96},{-70,-100}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
6700"), Text(
            extent={{-24,-124},{-12,-128}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
6500"), Text(
            extent={{18,-76},{30,-80}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
5100"), Text(
            extent={{18,26},{30,22}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
5101"), Text(
            extent={{74,66},{86,62}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
5103"), Text(
            extent={{116,98},{128,94}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
5304"), Text(
            extent={{118,0},{130,-4}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
5102"), Text(
            extent={{158,138},{170,134}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
5305"), Text(
            extent={{196,98},{208,94}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
5301"), Text(
            extent={{236,98},{248,94}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
5300"), Text(
            extent={{276,66},{288,62}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
6100"), Text(
            extent={{234,18},{246,14}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
6000"), Text(
            extent={{178,38},{190,34}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
6001"), Text(
            extent={{274,26},{286,22}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
5601"), Text(
            extent={{276,-58},{288,-62}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
5600"), Text(
            extent={{276,-108},{288,-112}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
5620"), Text(
            extent={{238,-120},{250,-124}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
5610"), Text(
            extent={{214,-88},{226,-92}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
5603"), Text(
            extent={{178,-88},{190,-92}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
5602"), Text(
            extent={{72,-92},{84,-96}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
5500"), Text(
            extent={{76,-28},{88,-32}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
5501"), Text(
            extent={{118,-46},{130,-50}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
5401"), Text(
            extent={{176,-30},{188,-34}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
5400"), Text(
            extent={{190,8},{202,4}},
            lineColor={0,128,0},
            textStyle={TextStyle.Bold},
            textString="bus
5402")}), experiment(
      StopTime=5,
      Interval=0.001,
      Tolerance=5e-05),
        __Dymola_experimentFlags(
        Advanced(Define(DAEsolver=true))),
      Documentation(info="<html>
<p>Simulation of the Nordic 44 test system, in its base case scenario, with a fault occurring at bus , triggering several events. Try simulating the system in DAE mode when in Dymola.</p>
<p>Simulate the system for 5 seconds. Variables of interest are:</p>
<ul>
<li><code>genEventTest.eXST1_1.EFD</code></li>
<li><code>genEventTest.gENSAL.SPEED</code></li>
</ul>
<p>Simulate Compare with the results obtained in <strong>Nordic44_Base_Case_Bus_StateEvents</strong>. Note that it takes significantly less time to simulate this system.</p>
</html>"));
end Nordic44_Base_Case_StateEvents2;
