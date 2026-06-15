within OpenIPSL.Electrical.Controls;
package IEEE_CIGRE "This"
  package GFM "gfm_dll"
    class GFM_DLL
    extends ExternalObject;

    function constructor
      input Real c_filt;
      input Real r_filt;
      input Real l_filt;
      input Real r_l;
      input Real Vbase;
      input Real Sbase;
      input Real VDC_base;
      input Real w_type;
      output GFM_DLL gfm_dll;
      external "C" gfm_dll = init_gfm_model(c_filt,r_filt,l_filt,r_l,Vbase,Sbase,
                                            VDC_base,w_type) annotation (Library="GFM_GFL_IBR",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    end constructor;

    function destructor
      input GFM_DLL gfm_dll;
      external "C" deinit_gfm_model(gfm_dll) annotation (Library="GFM_GFL_IBR",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    end destructor;

      annotation (Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                lineColor={255,0,0}), Text(
              extent={{-100,44},{98,-104}},
              textColor={238,46,47},
              textString="Class
")}));
    end GFM_DLL;

    model GFM_GFL_IBR

      Real out[12];
      //Real get_time_result;
      parameter Modelica.Units.SI.Capacitance c_filter = 0.0000627830 "Filter Capacitance";
      parameter Modelica.Units.SI.Resistance r_damp = 40.08173 "Damping Resistance";
      parameter Modelica.Units.SI.Inductance l_filter = 0.0008965728461 "Filter Inductance";
      parameter Modelica.Units.SI.Resistance r_l = 0.021125 "Inductor Resistance";
      parameter Real Vbase = 6.5 "kV";
      parameter Real Sbase = 10 "MVA";
      parameter Real VDC_base = 13 "kV";
      parameter Real w_type = 1 "0 - PLL, 1 - Droop";
      GFM_DLL gfm_struct = GFM_DLL(c_filter,r_damp,l_filter,r_l,Vbase,Sbase,VDC_base,w_type);

      Modelica.Electrical.Analog.Basic.Resistor resistor(R=r_l)
        annotation (Placement(transformation(extent={{-30,4},{-18,16}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor(i(start=0, fixed=true), L=
            l_filter) annotation (Placement(transformation(extent={{-10,4},{2,16}})));
      Modelica.Electrical.Analog.Basic.Capacitor c_b(v(start=0, fixed=false), C=
            c_filter) annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={20,-26})));
      Modelica.Electrical.Analog.Basic.Resistor r_b(R=r_damp) annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={52,-26})));
      Modelica.Electrical.Analog.Basic.Capacitor c_c(v(start=0, fixed=false), C=
            c_filter) annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={30,-26})));
      Modelica.Electrical.Analog.Basic.Resistor r_c(R=r_damp) annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={62,-26})));
      Modelica.Electrical.Analog.Basic.Capacitor c_a(v(start=0, fixed=false), C=
            c_filter) annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={10,-26})));
      Modelica.Electrical.Analog.Basic.Resistor r_a(R=r_damp) annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={42,-26})));
      Modelica.Electrical.Analog.Basic.Resistor resistor4(R=r_l)
        annotation (Placement(transformation(extent={{-26,-6},{-14,6}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start=0, fixed=true), L
          =l_filter) annotation (Placement(transformation(extent={{-6,-6},{6,6}})));
      Modelica.Electrical.Analog.Basic.Resistor resistor5(R=r_l)
        annotation (Placement(transformation(extent={{-24,-16},{-12,-4}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start=0, fixed=true), L
          =l_filter)
        annotation (Placement(transformation(extent={{-2,-16},{10,-4}})));
      tools.votlage_current_sensor bridge_sensor_c
        annotation (Placement(transformation(extent={{-42,8},{-38,12}})));
      tools.votlage_current_sensor bridge_sensor_b
        annotation (Placement(transformation(extent={{-42,-2},{-38,2}})));
      tools.votlage_current_sensor bridge_sensor_a
        annotation (Placement(transformation(extent={{-42,-12},{-38,-8}})));
      tools.votlage_current_sensor grid_sensor_c
        annotation (Placement(transformation(extent={{68,8},{78,12}})));
      tools.votlage_current_sensor grid_sensor_b
        annotation (Placement(transformation(extent={{68,-2},{78,2}})));
      tools.votlage_current_sensor grid_sensor_a
        annotation (Placement(transformation(extent={{68,-12},{78,-8}})));
      Modelica.Electrical.Analog.Sources.SignalVoltage phase_c annotation (
          Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={-78,-22})));
      Modelica.Electrical.Analog.Sources.SignalVoltage phase_b annotation (
          Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={-66,-22})));
      Modelica.Electrical.Analog.Sources.SignalVoltage phase_a annotation (
          Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={-54,-22})));
      Modelica.Electrical.Analog.Basic.Ground ground2
        annotation (Placement(transformation(extent={{-72,-56},{-60,-44}})));
      Modelica.Electrical.Analog.Basic.Ground ground1
        annotation (Placement(transformation(extent={{30,-62},{42,-50}})));

      Modelica.Electrical.Analog.Interfaces.NegativePin A annotation (Placement(
            transformation(rotation=0, extent={{90,-70},{110,-50}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin B annotation (Placement(
            transformation(rotation=0, extent={{90,-10},{110,10}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin C annotation (Placement(
            transformation(rotation=0, extent={{90,50},{110,70}})));
      Modelica.Blocks.Interfaces.RealInput P_ref_pu
        annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
      Modelica.Blocks.Interfaces.RealInput Q_ref_pu
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
      Modelica.Blocks.Interfaces.RealInput V_ref_pu
        annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
      Modelica.Blocks.Math.Gain p_ref_mw(k=Sbase)
        annotation (Placement(transformation(extent={{-68,54},{-56,66}})));
      Modelica.Blocks.Math.Gain q_ref_mw(k=Sbase)
        annotation (Placement(transformation(extent={{-68,34},{-56,46}})));
    algorithm

      Functions.update(
        gfm_struct,
        time,
        grid_sensor_a.voltage,
        grid_sensor_b.voltage,
        grid_sensor_c.voltage,
        grid_sensor_a.current,
        grid_sensor_b.current,
        grid_sensor_c.current,
        bridge_sensor_a.current,
        bridge_sensor_b.current,
        bridge_sensor_c.current,
        p_ref_mw.y,
        q_ref_mw.y,
        V_ref_pu);

      out :=Functions.model_output(gfm_struct);
      phase_a.v :=out[1]*1000;
      phase_b.v :=out[2]*1000;
      phase_c.v :=out[3]*1000;
      when terminal() then
        Functions.save_ss_state(gfm_struct);
        Modelica.Utilities.Streams.print("Saved states in list.dat");
        Modelica.Utilities.Streams.print("C_A "+String(c_a.v));
        Modelica.Utilities.Streams.print("C_B "+String(c_b.v));
        Modelica.Utilities.Streams.print("C_C "+String(c_c.v));
        Modelica.Utilities.Streams.print("inductor "+String(inductor.i));
        Modelica.Utilities.Streams.print("inductor1 "+String(inductor1.i));
        Modelica.Utilities.Streams.print("inductor2 "+String(inductor2.i));
      end when;
    equation
      connect(resistor.n,inductor. p)
        annotation (Line(points={{-18,10},{-10,10}},
                                                  color={0,0,255}));
      connect(resistor4.n,inductor1. p)
        annotation (Line(points={{-14,0},{-6,0}},
                                                color={0,0,255}));
      connect(resistor5.n,inductor2. p)
        annotation (Line(points={{-12,-10},{-2,-10}},
                                                    color={0,0,255}));
      connect(c_a.p,inductor2. n)
        annotation (Line(points={{10,-20},{10,-10}}, color={0,0,255}));
      connect(resistor.p,bridge_sensor_c. n)
        annotation (Line(points={{-30,10},{-38,10}}, color={0,0,255}));
      connect(bridge_sensor_b.n,resistor4. p)
        annotation (Line(points={{-38,0},{-26,0}}, color={0,0,255}));
      connect(resistor5.p,bridge_sensor_a. n)
        annotation (Line(points={{-24,-10},{-38,-10}}, color={0,0,255}));
      connect(inductor.n,grid_sensor_c. p)
        annotation (Line(points={{2,10},{68,10}},  color={0,0,255}));
      connect(inductor1.n,grid_sensor_b. p)
        annotation (Line(points={{6,0},{68,0}},  color={0,0,255}));
      connect(inductor2.n,grid_sensor_a. p)
        annotation (Line(points={{10,-10},{68,-10}}, color={0,0,255}));
      connect(c_b.p,grid_sensor_b. p)
        annotation (Line(points={{20,-20},{20,0},{68,0}}, color={0,0,255}));
      connect(c_c.p,grid_sensor_c. p)
        annotation (Line(points={{30,-20},{30,10},{68,10}}, color={0,0,255}));
      connect(phase_b.n,ground2. p)
        annotation (Line(points={{-66,-28},{-66,-44}}, color={0,0,255}));
      connect(phase_c.n,ground2. p) annotation (Line(points={{-78,-28},{-78,-40},{-66,
              -40},{-66,-44}}, color={0,0,255}));
      connect(phase_a.n,ground2. p) annotation (Line(points={{-54,-28},{-54,-40},{-66,
              -40},{-66,-44}}, color={0,0,255}));
      connect(phase_a.p,bridge_sensor_a. p)
        annotation (Line(points={{-54,-16},{-54,-10},{-42,-10}}, color={0,0,255}));
      connect(phase_b.p,bridge_sensor_b. p)
        annotation (Line(points={{-66,-16},{-66,0},{-42,0}}, color={0,0,255}));
      connect(phase_c.p,bridge_sensor_c. p)
        annotation (Line(points={{-78,-16},{-78,10},{-42,10}}, color={0,0,255}));
      connect(r_c.p,grid_sensor_c. p)
        annotation (Line(points={{62,-20},{62,10},{68,10}}, color={0,0,255}));
      connect(r_b.p,grid_sensor_b. p)
        annotation (Line(points={{52,-20},{52,0},{68,0}}, color={0,0,255}));
      connect(r_a.p,grid_sensor_a. p)
        annotation (Line(points={{42,-20},{42,-10},{68,-10}}, color={0,0,255}));
      connect(c_a.n,r_c. n) annotation (Line(points={{10,-32},{10,-36},{62,-36},{62,
              -32}}, color={0,0,255}));
      connect(c_b.n,r_c. n) annotation (Line(points={{20,-32},{20,-36},{62,-36},{62,
              -32}}, color={0,0,255}));
      connect(c_c.n,r_c. n) annotation (Line(points={{30,-32},{30,-36},{62,-36},{62,
              -32}}, color={0,0,255}));
      connect(r_a.n,r_c. n) annotation (Line(points={{42,-32},{42,-36},{62,-36},{62,
              -32}}, color={0,0,255}));
      connect(r_b.n,r_c. n) annotation (Line(points={{52,-32},{52,-36},{62,-36},{62,
              -32}}, color={0,0,255}));
      connect(ground1.p,r_c. n) annotation (Line(points={{36,-50},{36,-36},{62,-36},
              {62,-32}}, color={0,0,255}));
      connect(A, grid_sensor_a.n)
        annotation (Line(points={{100,-60},{84,-60},{84,-10},{78,-10}},
                                                                color={0,0,255}));
      connect(B, grid_sensor_b.n)
        annotation (Line(points={{100,0},{78,0}}, color={0,0,255}));
      connect(C, grid_sensor_c.n) annotation (Line(points={{100,60},{84,60},{84,
              10},{78,10}}, color={0,0,255}));
      connect(P_ref_pu, p_ref_mw.u)
        annotation (Line(points={{-100,60},{-69.2,60}}, color={0,0,127}));
      connect(q_ref_mw.u, Q_ref_pu) annotation (Line(points={{-69.2,40},{-90,40},{-90,
              0},{-100,0}}, color={0,0,127}));
      annotation (Icon(graphics={
            Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
            Line(points={{-100,100},{100,-100}}, color={28,108,200}),
            Text(
              extent={{-30,92},{62,26}},
              textColor={28,108,200},
              textString="AC"),
            Text(
              extent={{-70,-8},{22,-74}},
              textColor={28,108,200},
              textString="DC"),
            Text(
              extent={{64,76},{92,46}},
              textColor={28,108,200},
              textString="C"),
            Text(
              extent={{64,14},{92,-16}},
              textColor={28,108,200},
              textString="B"),
            Text(
              extent={{64,-44},{92,-74}},
              textColor={28,108,200},
              textString="A")}),  experiment(
          StopTime=10,
          Interval=1e-05,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end GFM_GFL_IBR;

    package Functions
    function my_add_c
      input Real a;
      input Real b;
      output Real sum;
      external "C" sum = my_add(a,b) annotation (Library="GFM_GFL_IBR",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    end my_add_c;

    function save_ss_state
      input GFM_DLL gfm_dll;
      external "C" save_states(gfm_dll) annotation (Library="GFM_GFL_IBR",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    end save_ss_state;

    function load_ss_state
      input GFM_DLL gfm_dll;
      output Real x;
      external "C" x = load_states(gfm_dll) annotation (Library="GFM_GFL_IBR",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    end load_ss_state;

      function update
        input GFM_DLL gfm_dll;
        input Real t;
        input Real va;
        input Real vb;
        input Real vc;
        input Real ia;
        input Real ib;
        input Real ic;
        input Real ial;
        input Real ibl;
        input Real icl;
        input Real pref;
        input Real qref;
        input Real vref;
        external "C" update_gfm_input(gfm_dll,t,va,vb,vc,ia,ib,ic,ial,ibl,icl,pref,qref,vref) annotation (Library="GFM_GFL_IBR",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
      end update;

      function model_output
        input GFM_DLL gfm_dll;
        output Real out[12];
        external "C" model_calculate(gfm_dll, out) annotation (Library="GFM_GFL_IBR",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
      end model_output;

      function get_time
        output Real out;
        external "C" out = get_sim_time() annotation (Library="GFM_GFL_IBR",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
      end get_time;
    end Functions;

    package tools
    model dq0_tf
      constant Real pi = Modelica.Constants.pi;
      Modelica.Blocks.Interfaces.RealInput a
        annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
      Modelica.Blocks.Interfaces.RealInput b
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
      Modelica.Blocks.Interfaces.RealInput c
        annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
      Modelica.Blocks.Interfaces.RealOutput d
        annotation (Placement(transformation(extent={{100,50},{120,70}})));
      Modelica.Blocks.Interfaces.RealOutput q
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      Modelica.Blocks.Interfaces.RealOutput zero
        annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
      Modelica.Blocks.Interfaces.RealInput theta annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-100})));
    equation
      d = (2/3)*(a*sin(theta)+b*sin(theta-(2*pi)/(3))+c*sin(theta+(2*pi)/(3)));
      q = (2/3)*(a*cos(theta)+b*cos(theta-(2*pi)/(3))+c*cos(theta+(2*pi)/(3)));
      zero = (a+b+c)/3;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
            Line(points={{-100,-100},{100,100}}, color={28,108,200}),
            Text(
              extent={{-76,94},{28,22}},
              textColor={28,108,200},
              textString="ABC"),
            Text(
              extent={{-8,-6},{96,-78}},
              textColor={28,108,200},
              textString="dq0")}),                                   Diagram(
            coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(
                extent={{-100,100},{100,-100}}, lineColor={28,108,200})}));
    end dq0_tf;

    model Vabc_source
      OpenIPSL.Interfaces.PwPin p
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.Blocks.Interfaces.RealInput ref
        annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
      Modelica.Blocks.Interfaces.RealInput vin
        annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
    equation
      [p.vr; p.vi]=[0;0];
                          annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(
                extent={{-100,100},{100,-100}}, lineColor={28,108,200})}));
    end Vabc_source;

    model votlage_current_sensor
      Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={20,-18})));
      Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-20,0})));
      Modelica.Electrical.Analog.Interfaces.PositivePin p
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin n
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.Electrical.Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{10,-80},{30,-60}})));
      Modelica.Blocks.Interfaces.RealOutput current( start = 0) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-40,110})));
      Modelica.Blocks.Interfaces.RealOutput voltage( start = 0)   annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={40,110})));
    equation
      connect(currentSensor.p, p)
        annotation (Line(points={{-30,0},{-100,0}}, color={0,0,255}));
      connect(currentSensor.n, voltageSensor.p)
        annotation (Line(points={{-10,0},{20,0},{20,-8}}, color={0,0,255}));
      connect(n, voltageSensor.p)
        annotation (Line(points={{100,0},{20,0},{20,-8}}, color={0,0,255}));
      connect(ground.p, voltageSensor.n)
        annotation (Line(points={{20,-60},{20,-28}}, color={0,0,255}));
      connect(currentSensor.i, current) annotation (Line(points={{-20,-11},{-20,
              -14},{-40,-14},{-40,110}}, color={0,0,127}));
      connect(voltageSensor.v, voltage) annotation (Line(points={{9,-18},{0,-18},
              {0,40},{40,40},{40,110}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
            Text(
              extent={{-68,98},{-12,66}},
              textColor={28,108,200},
              textString="Current"),
            Text(
              extent={{12,98},{68,66}},
              textColor={28,108,200},
              textString="Voltage")}), Diagram(coordinateSystem(
              preserveAspectRatio=false)));
    end votlage_current_sensor;

    model votlage_current_sensor_no_init
      Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={20,-18})));
      Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-20,0})));
      Modelica.Electrical.Analog.Interfaces.PositivePin p
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin n
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.Electrical.Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{10,-80},{30,-60}})));
      Modelica.Blocks.Interfaces.RealOutput current annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-40,110})));
      Modelica.Blocks.Interfaces.RealOutput voltage   annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={40,110})));
    equation
      connect(currentSensor.p, p)
        annotation (Line(points={{-30,0},{-100,0}}, color={0,0,255}));
      connect(currentSensor.n, voltageSensor.p)
        annotation (Line(points={{-10,0},{20,0},{20,-8}}, color={0,0,255}));
      connect(n, voltageSensor.p)
        annotation (Line(points={{100,0},{20,0},{20,-8}}, color={0,0,255}));
      connect(ground.p, voltageSensor.n)
        annotation (Line(points={{20,-60},{20,-28}}, color={0,0,255}));
      connect(currentSensor.i, current) annotation (Line(points={{-20,-11},{-20,
              -14},{-40,-14},{-40,110}}, color={0,0,127}));
      connect(voltageSensor.v, voltage) annotation (Line(points={{9,-18},{0,-18},
              {0,40},{40,40},{40,110}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
            Text(
              extent={{-68,98},{-12,66}},
              textColor={28,108,200},
              textString="Current"),
            Text(
              extent={{12,98},{68,66}},
              textColor={28,108,200},
              textString="Voltage")}), Diagram(coordinateSystem(
              preserveAspectRatio=false)));
    end votlage_current_sensor_no_init;

      model GFM_GFL_IBR_test

        Real out[12];
        //Real get_time_result;
        parameter Modelica.Units.SI.Capacitance c_filter = 0.0000627830 "Filter Capacitance";
        parameter Modelica.Units.SI.Resistance r_damp = 40.08173 "Damping Resistance";
        parameter Modelica.Units.SI.Inductance l_filter = 0.0008965728461 "Filter Inductance";
        parameter Modelica.Units.SI.Resistance r_l = 0.021125 "Inductor Resistance";
        parameter Real Vbase = 6.5 "kV";
        parameter Real Sbase = 10 "MVA";
        parameter Real VDC_base = 13 "kV";
        parameter Real w_type = 1 "0 - PLL, 1 - Droop";
        GFM_DLL gfm_struct = GFM_DLL(c_filter,r_damp,l_filter,r_l,Vbase,Sbase,VDC_base,w_type);

        Modelica.Electrical.Analog.Basic.Resistor resistor(R=r_l)
          annotation (Placement(transformation(extent={{-30,4},{-18,16}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor(i(start=0, fixed=true), L=
              l_filter) annotation (Placement(transformation(extent={{-10,4},{2,16}})));
        Modelica.Electrical.Analog.Basic.Capacitor c_b(v(start=0, fixed=false), C=
              c_filter) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={20,-26})));
        Modelica.Electrical.Analog.Basic.Resistor r_b(R=r_damp) annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={52,-26})));
        Modelica.Electrical.Analog.Basic.Capacitor c_c(v(start=0, fixed=false), C=
              c_filter) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={30,-26})));
        Modelica.Electrical.Analog.Basic.Resistor r_c(R=r_damp) annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={62,-26})));
        Modelica.Electrical.Analog.Basic.Capacitor c_a(v(start=0, fixed=false), C=
              c_filter) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={10,-26})));
        Modelica.Electrical.Analog.Basic.Resistor r_a(R=r_damp) annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={42,-26})));
        Modelica.Electrical.Analog.Basic.Resistor resistor4(R=r_l)
          annotation (Placement(transformation(extent={{-26,-6},{-14,6}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start=0, fixed=true), L
            =l_filter) annotation (Placement(transformation(extent={{-6,-6},{6,6}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor5(R=r_l)
          annotation (Placement(transformation(extent={{-22,-16},{-10,-4}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start=0, fixed=true), L
            =l_filter)
          annotation (Placement(transformation(extent={{-2,-16},{10,-4}})));
        tools.votlage_current_sensor bridge_sensor_c
          annotation (Placement(transformation(extent={{-48,8},{-38,12}})));
        tools.votlage_current_sensor bridge_sensor_b
          annotation (Placement(transformation(extent={{-48,-2},{-38,2}})));
        tools.votlage_current_sensor bridge_sensor_a
          annotation (Placement(transformation(extent={{-48,-12},{-38,-8}})));
        tools.votlage_current_sensor grid_sensor_c
          annotation (Placement(transformation(extent={{68,8},{78,12}})));
        tools.votlage_current_sensor grid_sensor_b
          annotation (Placement(transformation(extent={{68,-2},{78,2}})));
        tools.votlage_current_sensor grid_sensor_a
          annotation (Placement(transformation(extent={{68,-12},{78,-8}})));
        Modelica.Electrical.Analog.Sources.SignalVoltage phase_c annotation (
            Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-78,-22})));
        Modelica.Electrical.Analog.Sources.SignalVoltage phase_b annotation (
            Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-66,-22})));
        Modelica.Electrical.Analog.Sources.SignalVoltage phase_a annotation (
            Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-54,-22})));
        Modelica.Electrical.Analog.Basic.Ground ground2
          annotation (Placement(transformation(extent={{-72,-56},{-60,-44}})));
        Modelica.Electrical.Analog.Basic.Ground ground1
          annotation (Placement(transformation(extent={{30,-62},{42,-50}})));

        Modelica.Electrical.Analog.Interfaces.NegativePin n annotation (Placement(
              transformation(rotation=0, extent={{90,-70},{110,-50}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n1 annotation (Placement(
              transformation(rotation=0, extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n2 annotation (Placement(
              transformation(rotation=0, extent={{90,50},{110,70}})));
        Modelica.Blocks.Interfaces.RealInput P_ref_pu
          annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
        Modelica.Blocks.Interfaces.RealInput Q_ref_pu
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
        Modelica.Blocks.Interfaces.RealInput V_ref_pu
          annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
        Modelica.Blocks.Math.Gain p_ref_mw(k=Sbase)
          annotation (Placement(transformation(extent={{-62,54},{-50,66}})));
        Modelica.Blocks.Math.Gain q_ref_mw(k=Sbase)
          annotation (Placement(transformation(extent={{-62,34},{-50,46}})));
      algorithm

        Functions.update(
          gfm_struct,
          time,
          grid_sensor_a.voltage,
          grid_sensor_b.voltage,
          grid_sensor_c.voltage,
          grid_sensor_a.current,
          grid_sensor_b.current,
          grid_sensor_c.current,
          bridge_sensor_a.current,
          bridge_sensor_b.current,
          bridge_sensor_c.current,
          p_ref_mw.y,
          q_ref_mw.y,
          V_ref_pu);

        out :=Functions.model_output(gfm_struct);
        phase_a.v :=out[1]*1000;
        phase_b.v :=out[2]*1000;
        phase_c.v :=out[3]*1000;
        when terminal() then
          Functions.save_ss_state(gfm_struct);
          Modelica.Utilities.Streams.print("Saved states in list.dat");
          Modelica.Utilities.Streams.print("C_A "+String(c_a.v));
          Modelica.Utilities.Streams.print("C_B "+String(c_b.v));
          Modelica.Utilities.Streams.print("C_C "+String(c_c.v));
          Modelica.Utilities.Streams.print("inductor "+String(inductor.i));
          Modelica.Utilities.Streams.print("inductor1 "+String(inductor1.i));
          Modelica.Utilities.Streams.print("inductor2 "+String(inductor2.i));
        end when;
      equation
        connect(resistor.n,inductor. p)
          annotation (Line(points={{-18,10},{-10,10}},
                                                    color={0,0,255}));
        connect(resistor4.n,inductor1. p)
          annotation (Line(points={{-14,0},{-6,0}},
                                                  color={0,0,255}));
        connect(resistor5.n,inductor2. p)
          annotation (Line(points={{-10,-10},{-2,-10}},
                                                      color={0,0,255}));
        connect(c_a.p,inductor2. n)
          annotation (Line(points={{10,-20},{10,-10}}, color={0,0,255}));
        connect(resistor.p,bridge_sensor_c. n)
          annotation (Line(points={{-30,10},{-38,10}}, color={0,0,255}));
        connect(bridge_sensor_b.n,resistor4. p)
          annotation (Line(points={{-38,0},{-26,0}}, color={0,0,255}));
        connect(resistor5.p,bridge_sensor_a. n)
          annotation (Line(points={{-22,-10},{-38,-10}}, color={0,0,255}));
        connect(inductor.n,grid_sensor_c. p)
          annotation (Line(points={{2,10},{68,10}},  color={0,0,255}));
        connect(inductor1.n,grid_sensor_b. p)
          annotation (Line(points={{6,0},{68,0}},  color={0,0,255}));
        connect(inductor2.n,grid_sensor_a. p)
          annotation (Line(points={{10,-10},{68,-10}}, color={0,0,255}));
        connect(c_b.p,grid_sensor_b. p)
          annotation (Line(points={{20,-20},{20,0},{68,0}}, color={0,0,255}));
        connect(c_c.p,grid_sensor_c. p)
          annotation (Line(points={{30,-20},{30,10},{68,10}}, color={0,0,255}));
        connect(phase_b.n,ground2. p)
          annotation (Line(points={{-66,-28},{-66,-44}}, color={0,0,255}));
        connect(phase_c.n,ground2. p) annotation (Line(points={{-78,-28},{-78,-40},{-66,
                -40},{-66,-44}}, color={0,0,255}));
        connect(phase_a.n,ground2. p) annotation (Line(points={{-54,-28},{-54,-40},{-66,
                -40},{-66,-44}}, color={0,0,255}));
        connect(r_c.p,grid_sensor_c. p)
          annotation (Line(points={{62,-20},{62,10},{68,10}}, color={0,0,255}));
        connect(r_b.p,grid_sensor_b. p)
          annotation (Line(points={{52,-20},{52,0},{68,0}}, color={0,0,255}));
        connect(r_a.p,grid_sensor_a. p)
          annotation (Line(points={{42,-20},{42,-10},{68,-10}}, color={0,0,255}));
        connect(c_a.n,r_c. n) annotation (Line(points={{10,-32},{10,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(c_b.n,r_c. n) annotation (Line(points={{20,-32},{20,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(c_c.n,r_c. n) annotation (Line(points={{30,-32},{30,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(r_a.n,r_c. n) annotation (Line(points={{42,-32},{42,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(r_b.n,r_c. n) annotation (Line(points={{52,-32},{52,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(ground1.p,r_c. n) annotation (Line(points={{36,-50},{36,-36},{62,-36},
                {62,-32}}, color={0,0,255}));
        connect(n, grid_sensor_a.n)
          annotation (Line(points={{100,-60},{84,-60},{84,-10},{78,-10}},
                                                                  color={0,0,255}));
        connect(n1, grid_sensor_b.n)
          annotation (Line(points={{100,0},{78,0}},           color={0,0,255}));
        connect(n2, grid_sensor_c.n)
          annotation (Line(points={{100,60},{84,60},{84,10},{78,10}},
                                                                 color={0,0,255}));
        connect(bridge_sensor_c.p, phase_c.p)
          annotation (Line(points={{-48,10},{-78,10},{-78,-16}}, color={0,0,255}));
        connect(bridge_sensor_b.p, phase_b.p)
          annotation (Line(points={{-48,0},{-66,0},{-66,-16}}, color={0,0,255}));
        connect(bridge_sensor_a.p, phase_a.p)
          annotation (Line(points={{-48,-10},{-54,-10},{-54,-16}}, color={0,0,255}));
        connect(P_ref_pu, p_ref_mw.u)
          annotation (Line(points={{-100,60},{-63.2,60}}, color={0,0,127}));
        connect(Q_ref_pu, q_ref_mw.u) annotation (Line(points={{-100,0},{-92,0},{-92,40},
                {-63.2,40}}, color={0,0,127}));
        annotation (Icon(graphics={
              Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
              Line(points={{-100,100},{100,-100}}, color={28,108,200}),
              Text(
                extent={{-14,82},{78,16}},
                textColor={28,108,200},
                textString="AC"),
              Text(
                extent={{-74,-14},{18,-80}},
                textColor={28,108,200},
                textString="DC")}), experiment(
            StopTime=10,
            Interval=1e-05,
            __Dymola_fixedstepsize=1e-05,
            __Dymola_Algorithm="Euler"));
      end GFM_GFL_IBR_test;

      model zeroXdetect
        Modelica.Blocks.MathBoolean.RisingEdge rising1
          annotation (Placement(transformation(extent={{-60,24},{-52,32}})));
        Modelica.Blocks.MathBoolean.FallingEdge falling1
          annotation (Placement(transformation(extent={{-60,-4},{-52,4}})));
        Modelica.Blocks.Logical.RSFlipFlop rSFlipFlop2
          annotation (Placement(transformation(extent={{-40,-16},{-20,4}})));
        Modelica.Blocks.Logical.ZeroCrossing zeroCrossing annotation (Placement(
              transformation(extent={{-10,-10},{10,10}}, rotation=270)));
        Modelica.Blocks.Logical.RSFlipFlop rSFlipFlop1
          annotation (Placement(transformation(extent={{54,12},{74,32}})));
        Modelica.Blocks.Interfaces.BooleanInput u
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
        Modelica.Blocks.Interfaces.BooleanOutput y
          annotation (Placement(transformation(extent={{100,-10},{120,10}})));
        Modelica.Blocks.Interfaces.RealInput u1 annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,100})));
      equation
        connect(falling1.u, rising1.u) annotation (Line(points={{-61.6,0},{-66,
                0},{-66,28},{-61.6,28}}, color={255,0,255}));
        connect(rising1.y, rSFlipFlop1.S)
          annotation (Line(points={{-51.2,28},{52,28}}, color={255,0,255}));
        connect(falling1.y, rSFlipFlop2.S)
          annotation (Line(points={{-51.2,0},{-42,0}}, color={255,0,255}));
        connect(rSFlipFlop2.R, rSFlipFlop1.QI) annotation (Line(points={{-42,
                -12},{-42,-38},{82,-38},{82,16},{75,16}}, color={255,0,255}));
        connect(rSFlipFlop2.Q, zeroCrossing.enable)
          annotation (Line(points={{-19,0},{-12,0}}, color={255,0,255}));
        connect(zeroCrossing.y, rSFlipFlop1.R) annotation (Line(points={{0,-11},
                {0,-16},{44,-16},{44,16},{52,16}}, color={255,0,255}));
        connect(rSFlipFlop1.Q, y) annotation (Line(points={{75,28},{96,28},{96,
                0},{110,0}}, color={255,0,255}));
        connect(u, rising1.u) annotation (Line(points={{-100,0},{-66,0},{-66,28},
                {-61.6,28}}, color={255,0,255}));
        connect(zeroCrossing.u, u1)
          annotation (Line(points={{0,12},{0,100}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={28,108,200},
                lineThickness=0.5), Text(
                extent={{-94,76},{98,-110}},
                textColor={28,108,200},
                textString="Zero Current
Detect
")}),                                 Diagram(coordinateSystem(
                preserveAspectRatio=false)));
      end zeroXdetect;

      model SmoothSwitch
        parameter SI.Resistance Ron = 1e-5
          "Closed switch resistance";
        parameter SI.Conductance Goff = 1e-5
          "Opened switch conductance";
        Modelica.Electrical.Analog.Interfaces.Pin pin
          annotation (Placement(transformation(extent={{-10,90},{10,110}})));
        Modelica.Electrical.Analog.Interfaces.Pin pin1
          annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
        Modelica.Blocks.Interfaces.BooleanInput u
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
        Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue=Ron, realFalse=1/
              Goff)
          annotation (Placement(transformation(extent={{-72,-10},{-52,10}})));
        Modelica.Blocks.Continuous.Filter filter(
          analogFilter=Modelica.Blocks.Types.AnalogFilter.CriticalDamping,
          filterType=Modelica.Blocks.Types.FilterType.LowPass,
          order=2,
          f_cut=f_cut,
          gain=1,
          normalized=true)
          annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
        Modelica.Electrical.Analog.Basic.VariableResistor resistor annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90)));
        parameter SI.Frequency f_cut=1e3 "Cut-off frequency";
      equation
        connect(u, booleanToReal.u)
          annotation (Line(points={{-100,0},{-74,0}}, color={255,0,255}));
        connect(resistor.n, pin) annotation (Line(points={{0,10},{0,100}},
              color={0,0,255}));
        connect(resistor.p, pin1) annotation (Line(points={{0,-10},{0,-100}},
                          color={0,0,255}));
        connect(filter.y, resistor.R)
          annotation (Line(points={{-19,0},{-12,0}},color={0,0,127}));
        connect(booleanToReal.y, filter.u)
          annotation (Line(points={{-51,0},{-42,0}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Ellipse(extent={{-4,4},{4,-4}},    lineColor={0,0,255},
                origin={0,-40},
                rotation=90),
              Line(points={{-22,-1},{30,-1}},color={0,0,255},
                origin={-1,72},
                rotation=90),
              Line(points={{-27,-38.5},{43,21.5}},
                                             color={0,0,255},
                origin={21.5,7},
                rotation=90),
              Line(points={{-34,25},{22,25}},
                                           color={0,0,255},
                origin={25,-66},
                rotation=90),
              Line(
                points={{24,-14},{24,-36},{40,-48}},
                color={28,108,200},
                smooth=Smooth.Bezier),
              Line(
                points={{18,-24},{18,-38},{26,-46}},
                color={28,108,200},
                smooth=Smooth.Bezier),
              Line(
                points={{12,-32},{12,-42},{18,-48}},
                color={28,108,200},
                smooth=Smooth.Bezier)}),                               Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(
            Interval=1e-05,
            __Dymola_fixedstepsize=1e-05,
            __Dymola_Algorithm="Euler"));
      end SmoothSwitch;

      model NearZeroX
        Modelica.Blocks.Interfaces.RealInput u annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,100})));
        Modelica.Blocks.Interfaces.BooleanInput enable
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
        Modelica.Blocks.Interfaces.BooleanOutput y annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-110})));
        Modelica.Blocks.Logical.LessEqualThreshold lessEqualThreshold(threshold
            =threshold) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,28})));
        Modelica.Blocks.Logical.And and1 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-50})));
        Modelica.Blocks.Math.Abs abs1 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,62})));
        parameter Real threshold=0.01 "Comparison with respect to threshold";
      equation
        connect(and1.y, y)
          annotation (Line(points={{0,-61},{0,-110}}, color={255,0,255}));
        connect(and1.u1, lessEqualThreshold.y)
          annotation (Line(points={{0,-38},{0,17}}, color={255,0,255}));
        connect(enable, and1.u2) annotation (Line(points={{-100,0},{-8,0},{-8,
                -38}}, color={255,0,255}));
        connect(abs1.u, u)
          annotation (Line(points={{0,74},{0,100}}, color={0,0,127}));
        connect(abs1.y, lessEqualThreshold.u)
          annotation (Line(points={{0,51},{0,40}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255})}),
            Diagram(coordinateSystem(preserveAspectRatio=false)));
      end NearZeroX;

      model NearZeroXdetect
        Modelica.Blocks.MathBoolean.RisingEdge rising1
          annotation (Placement(transformation(extent={{-60,24},{-52,32}})));
        Modelica.Blocks.MathBoolean.FallingEdge falling1
          annotation (Placement(transformation(extent={{-60,-4},{-52,4}})));
        Modelica.Blocks.Logical.RSFlipFlop rSFlipFlop2
          annotation (Placement(transformation(extent={{-40,-16},{-20,4}})));
        Modelica.Blocks.Logical.RSFlipFlop rSFlipFlop1
          annotation (Placement(transformation(extent={{54,12},{74,32}})));
        Modelica.Blocks.Interfaces.BooleanInput u
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
        Modelica.Blocks.Interfaces.BooleanOutput y
          annotation (Placement(transformation(extent={{100,-10},{120,10}})));
        Modelica.Blocks.Interfaces.RealInput u1 annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,100})));
        NearZeroX nearZeroX(threshold=threshold)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        parameter Real threshold=0.01 "Comparison with respect to threshold";
      equation
        connect(falling1.u, rising1.u) annotation (Line(points={{-61.6,0},{-66,
                0},{-66,28},{-61.6,28}}, color={255,0,255}));
        connect(rising1.y, rSFlipFlop1.S)
          annotation (Line(points={{-51.2,28},{52,28}}, color={255,0,255}));
        connect(falling1.y, rSFlipFlop2.S)
          annotation (Line(points={{-51.2,0},{-42,0}}, color={255,0,255}));
        connect(rSFlipFlop2.R, rSFlipFlop1.QI) annotation (Line(points={{-42,
                -12},{-42,-38},{82,-38},{82,16},{75,16}}, color={255,0,255}));
        connect(rSFlipFlop1.Q, y) annotation (Line(points={{75,28},{96,28},{96,
                0},{110,0}}, color={255,0,255}));
        connect(u, rising1.u) annotation (Line(points={{-100,0},{-66,0},{-66,28},
                {-61.6,28}}, color={255,0,255}));
        connect(nearZeroX.u, u1)
          annotation (Line(points={{0,10},{0,100}}, color={0,0,127}));
        connect(rSFlipFlop2.Q, nearZeroX.enable)
          annotation (Line(points={{-19,0},{-10,0}}, color={255,0,255}));
        connect(nearZeroX.y, rSFlipFlop1.R) annotation (Line(points={{0,-11},{0,
                -22},{40,-22},{40,16},{52,16}}, color={255,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={28,108,200},
                lineThickness=0.5)}), Diagram(coordinateSystem(
                preserveAspectRatio=false)));
      end NearZeroXdetect;

      model NoneIdealTransformer
        parameter Real n(start=1) "Turns ratio primary:secondary voltage";
        parameter Boolean considerMagnetization=false
          "Choice of considering magnetization";
        parameter SI.Inductance Lm1(start=1)
          "Magnetization inductance w.r.t. primary side"
          annotation (Dialog(enable=considerMagnetization));
        SI.Voltage v1 "Voltage drop of port 1 (= p1.v - n1.v)";
        SI.Voltage v2 "Voltage drop of port 2 (= p2.v - n2.v)";
        SI.Current i1 "Current flowing from pos. to neg. pin of port 1";
        SI.Current i2 "Current flowing from pos. to neg. pin of port 2";
        Modelica.Electrical.Analog.Interfaces.PositivePin p1
          annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n1
          annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p2
          annotation (Placement(transformation(extent={{90,90},{110,110}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n2
          annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
        Modelica.Blocks.Continuous.Filter filter(f_cut=f_cut)
          annotation (Placement(transformation(extent={{-44,-10},{-24,10}})));
        parameter SI.Frequency f_cut=1000 "Cut-off frequency";
      equation
        v1 = p1.v - n1.v;
        v2 = p2.v - n2.v;
        i1 = p1.i;
        i2 = p2.i;
        0 = p1.i + n1.i;
        0 = p2.i + n2.i;

        i1 = -i2/n;
        filter.y = n*v2;
        v1=filter.u;
      end NoneIdealTransformer;

      model NoneIdealTransformer_Emulation
        parameter Real n(start=1) "Turns ratio primary:secondary voltage";
        parameter Boolean considerMagnetization=false
          "Choice of considering magnetization";
        parameter SI.Inductance Lm1(start=1)
          "Magnetization inductance w.r.t. primary side"
          annotation (Dialog(enable=considerMagnetization));
        SI.Voltage v1 "Voltage drop of port 1 (= p1.v - n1.v)";
        SI.Voltage v2 "Voltage drop of port 2 (= p2.v - n2.v)";
        SI.Current i1 "Current flowing from pos. to neg. pin of port 1";
        SI.Current i2 "Current flowing from pos. to neg. pin of port 2";
        Modelica.Electrical.Analog.Interfaces.PositivePin p1
          annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n1
          annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p2
          annotation (Placement(transformation(extent={{90,90},{110,110}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n2
          annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
        parameter SI.Frequency f_cut=1000 "Cut-off frequency";
        Modelica.Blocks.Interfaces.RealInput PhaseVin annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,100})));
      equation
        v1 = p1.v - n1.v;
        v2 = p2.v - n2.v;
        i1 = p1.i;
        i2 = p2.i;
        0 = p1.i + n1.i;
        0 = p2.i + n2.i;

        i1 = -i2/n;
        v1=-PhaseVin/3;

        //v1=n*v2;
      end NoneIdealTransformer_Emulation;

      model IdealTransformer
        parameter Real n(start=1) "Turns ratio primary:secondary voltage";
        parameter Boolean considerMagnetization=false
          "Choice of considering magnetization";
        parameter SI.Inductance Lm1(start=1)
          "Magnetization inductance w.r.t. primary side"
          annotation (Dialog(enable=considerMagnetization));
        SI.Voltage v1 "Voltage drop of port 1 (= p1.v - n1.v)";
        SI.Voltage v2 "Voltage drop of port 2 (= p2.v - n2.v)";
        SI.Current i1 "Current flowing from pos. to neg. pin of port 1";
        SI.Current i2 "Current flowing from pos. to neg. pin of port 2";
        Modelica.Electrical.Analog.Interfaces.PositivePin p1
          annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n1
          annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p2
          annotation (Placement(transformation(extent={{90,90},{110,110}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n2
          annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
      equation
        v1 = p1.v - n1.v;
        v2 = p2.v - n2.v;
        i1 = p1.i;
        i2 = p2.i;
        0 = p1.i + n1.i;
        0 = p2.i + n2.i;

        i1 = -i2/n;

        v1 = n*v2;
        annotation (defaultComponentName="transformer",
          Documentation(info="<html>
<p>
The ideal transformer is a two-port circuit element;
in case of Boolean parameter <code>considerMagnetization = false</code> it is characterized by the following equations:
</p>
<blockquote><pre>
i2 = -i1*n;
v2 =  v1/n;
</pre></blockquote>
<p>
where <code>n</code> is a real number called the turns ratio.
Due to this equations, also DC voltages and currents are transformed - which is not the case for technical transformers.
</p>
<p>
In case of Boolean parameter <code>considerMagnetization = true</code> it is characterized by the following equations:
</p>
<blockquote><pre>
im1  = i1 + i2/n \"Magnetizing current w.r.t. primary side\";
psim1= Lm1*im1   \"Magnetic flux w.r.t. primary side\";
v1 = der(psim1)  \"Primary voltage\";
v2 = v1/n        \"Secondary voltage\";
</pre></blockquote>
<p>
where <code>Lm</code> denotes the magnetizing inductance.
Due to this equations, the DC offset of secondary voltages and currents decrement according to the time constant defined by the connected circuit.
</p>
<p>
Taking primary <code>L1sigma</code> and secondary <code>L2ssigma</code> leakage inductances into account,
compared with the <a href=\"modelica://Modelica.Electrical.Analog.Basic.Transformer\">basic transformer</a>
the following parameter conversion can be applied (which leads to identical results):
</p>
<blockquote><pre>
L1 = L1sigma + M*n \"Primary inductance at secondary no-load\";
L2 = L2sigma + M/n \"Secondary inductance at primary no-load\";
M  = Lm1/n         \"Mutual inductance\";
</pre></blockquote>
<p>
For the backward conversion, one has to decide about the partitioning of the leakage to primary and secondary side.
</p>
</html>",     revisions="<html>
<ul>
<li><em>June 3, 2009   </em>
       magnetisation current added by Anton Haumer<br>
       </li>
<li><em>1998   </em>
       initially implemented by Christoph Clauss<br>
       </li>
</ul>
</html>"),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                  100}}), graphics={
              Text(extent={{-150,-110},{150,-150}},textString="n=%n"),
              Text(
                extent={{-100,20},{-60,-20}},
                textColor={0,0,255},
                textString="1"),
              Text(
                extent={{60,20},{100,-20}},
                textColor={0,0,255},
                textString="2"),
              Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                textColor={0,0,255}),
              Line(points={{-40,60},{-40,100},{-90,100}}, color={0,0,255}),
              Line(points={{40,60},{40,100},{90,100}}, color={0,0,255}),
              Line(points={{-40,-60},{-40,-100},{-90,-100}}, color={0,0,255}),
              Line(points={{40,-60},{40,-100},{90,-100}}, color={0,0,255}),
              Line(
                points={{-15,-7},{-14,-1},{-7,7},{7,7},{14,-1},{15,-7}},
                color={0,0,255},
                smooth=Smooth.Bezier,
                origin={-33,45},
                rotation=270),
              Line(
                points={{-15,-7},{-14,-1},{-7,7},{7,7},{14,-1},{15,-7}},
                color={0,0,255},
                smooth=Smooth.Bezier,
                origin={-33,15},
                rotation=270),
              Line(
                points={{-15,-7},{-14,-1},{-7,7},{7,7},{14,-1},{15,-7}},
                color={0,0,255},
                smooth=Smooth.Bezier,
                origin={-33,-15},
                rotation=270),
              Line(
                points={{-15,-7},{-14,-1},{-7,7},{7,7},{14,-1},{15,-7}},
                color={0,0,255},
                smooth=Smooth.Bezier,
                origin={-33,-45},
                rotation=270),
              Line(
                points={{-15,-7},{-14,-1},{-7,7},{7,7},{14,-1},{15,-7}},
                color={0,0,255},
                smooth=Smooth.Bezier,
                origin={33,45},
                rotation=90),
              Line(
                points={{-15,-7},{-14,-1},{-7,7},{7,7},{14,-1},{15,-7}},
                color={0,0,255},
                smooth=Smooth.Bezier,
                origin={33,15},
                rotation=90),
              Line(
                points={{-15,-7},{-14,-1},{-7,7},{7,7},{14,-1},{15,-7}},
                color={0,0,255},
                smooth=Smooth.Bezier,
                origin={33,-15},
                rotation=90),
              Line(
                points={{-15,-7},{-14,-1},{-7,7},{7,7},{14,-1},{15,-7}},
                color={0,0,255},
                smooth=Smooth.Bezier,
                origin={33,-45},
                rotation=90)}));
      end IdealTransformer;
    end tools;

    package GridComponents

      model Line_R
        parameter Real Time = 1
                               "start";
        parameter Real Resistance = 0
                                     "line resistance";
        Modelica.Electrical.Analog.Interfaces.PositivePin p annotation (Placement(
              transformation(rotation=0, extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p1 annotation (Placement(
              transformation(rotation=0, extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p2 annotation (Placement(
              transformation(rotation=0, extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n annotation (Placement(
              transformation(rotation=0, extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n1 annotation (Placement(
              transformation(rotation=0, extent={{90,-70},{110,-50}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n2 annotation (Placement(
              transformation(rotation=0, extent={{90,50},{110,70}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor(R=Resistance)
          annotation (Placement(transformation(extent={{-10,50},{10,70}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor1(R=Resistance)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor2(R=Resistance)
          annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
      equation
        connect(resistor.p, p2)
          annotation (Line(points={{-10,60},{-100,60}}, color={0,0,255}));
        connect(p, resistor1.p)
          annotation (Line(points={{-100,0},{-10,0}}, color={0,0,255}));
        connect(resistor2.p, p1)
          annotation (Line(points={{-10,-60},{-100,-60}}, color={0,0,255}));
        connect(resistor2.n, n1)
          annotation (Line(points={{10,-60},{100,-60}}, color={0,0,255}));
        connect(n, resistor1.n)
          annotation (Line(points={{100,0},{10,0}}, color={0,0,255}));
        connect(resistor.n, n2)
          annotation (Line(points={{10,60},{100,60}}, color={0,0,255}));
      end Line_R;

      model Line_L
        parameter Real Time = 1
                               "start";
        parameter Real Inductance = 0
                                     "line inductance";
        parameter Real Resistance = 0
                                     "line resistance";
        Modelica.Electrical.Analog.Interfaces.PositivePin p annotation (Placement(
              transformation(rotation=0, extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p1 annotation (Placement(
              transformation(rotation=0, extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p2 annotation (Placement(
              transformation(rotation=0, extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n annotation (Placement(
              transformation(rotation=0, extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n1 annotation (Placement(
              transformation(rotation=0, extent={{90,-70},{110,-50}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n2 annotation (Placement(
              transformation(rotation=0, extent={{90,50},{110,70}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor(L=Inductance)
          annotation (Placement(transformation(extent={{-12,10},{8,30}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor1(L=Inductance)
          annotation (Placement(transformation(extent={{-10,-34},{10,-14}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor2(L=Inductance)
          annotation (Placement(transformation(extent={{-10,-92},{10,-72}})));
      equation
        connect(p2, inductor.p) annotation (Line(points={{-100,60},{-18,60},{-18,
                20},{-12,20}}, color={0,0,255}));
        connect(p, inductor1.p) annotation (Line(points={{-100,0},{-16,0},{-16,
                -24},{-10,-24}}, color={0,0,255}));
        connect(p1, inductor2.p) annotation (Line(points={{-100,-60},{-16,-60},{
                -16,-82},{-10,-82}}, color={0,0,255}));
        connect(inductor.n, n2) annotation (Line(points={{8,20},{86,20},{86,60},{
                100,60}}, color={0,0,255}));
        connect(n, inductor1.n) annotation (Line(points={{100,0},{16,0},{16,-24},
                {10,-24}}, color={0,0,255}));
        connect(n1, inductor2.n) annotation (Line(points={{100,-60},{16,-60},{16,
                -82},{10,-82}}, color={0,0,255}));
      end Line_L;

      model GridWithFault_Init
        parameter Modelica.Units.SI.Voltage Vbase=6500 "base voltage L-L RMS";
        parameter Real Vgrid = 1 "p.u.";
        parameter Real FaultVoltage = 0.7 "p.u.";
        parameter Modelica.Units.SI.Time FaultTime =5 "When fault happen";
        parameter Modelica.Units.SI.Time FaultDuration = 0.1 "for how long";
        parameter Modelica.Units.SI.Time StartTime = 0
                                                      "when to initialize model";
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-64,-78})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-30,-48})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage2 annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-14,-18})));
        Modelica.Blocks.Sources.Sine sine(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=60,
          phase=2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-24})));
        Modelica.Blocks.Sources.Sine sine1(amplitude=sqrt(2)*Vbase/sqrt(3),f=60)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-54})));
        Modelica.Blocks.Sources.Sine sine2(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=60,
          phase=-2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-84})));
        Modelica.Electrical.Analog.Basic.Ground ground4
          annotation (Placement(transformation(extent={{-70,-106},{-58,-94}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin C annotation (Placement(
              transformation(rotation=0, extent={{-110,50},{-90,70}}),
              iconTransformation(extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin B annotation (
            Placement(transformation(rotation=0, extent={{-110,-10},{-90,10}}),
              iconTransformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin A annotation (
            Placement(transformation(rotation=0, extent={{-110,-70},{-90,-50}}),
              iconTransformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-76,-78})));
        Modelica.Electrical.Analog.Basic.Resistor resistor1(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-46,-48})));
        Modelica.Electrical.Analog.Basic.Resistor resistor2(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-24,-18})));
      equation
        connect(C, signalVoltage.p)
          annotation (Line(points={{-100,60},{-64,60},{-64,-68}}, color={0,0,255}));
        connect(B, signalVoltage1.p) annotation (Line(points={{-100,0},{-30,0},
                {-30,-38}}, color={0,0,255}));
        connect(A, signalVoltage2.p) annotation (Line(points={{-100,-60},{-78,-60},
                {-78,-4},{-14,-4},{-14,-8}}, color={0,0,255}));
        connect(signalVoltage2.n, ground4.p)
          annotation (Line(points={{-14,-28},{-14,-94},{-64,-94}}, color={0,0,255}));
        connect(signalVoltage1.n, ground4.p)
          annotation (Line(points={{-30,-58},{-30,-94},{-64,-94}}, color={0,0,255}));
        connect(signalVoltage.n, ground4.p)
          annotation (Line(points={{-64,-88},{-64,-94}}, color={0,0,255}));
        connect(resistor.n, signalVoltage.n)
          annotation (Line(points={{-76,-88},{-64,-88}}, color={0,0,255}));
        connect(resistor.p, signalVoltage.p)
          annotation (Line(points={{-76,-68},{-64,-68}}, color={0,0,255}));
        connect(resistor1.p, signalVoltage1.p)
          annotation (Line(points={{-46,-38},{-30,-38}}, color={0,0,255}));
        connect(resistor1.n, signalVoltage1.n)
          annotation (Line(points={{-46,-58},{-30,-58}}, color={0,0,255}));
        connect(resistor2.n, signalVoltage2.n)
          annotation (Line(points={{-24,-28},{-14,-28}}, color={0,0,255}));
        connect(resistor2.p, signalVoltage2.p)
          annotation (Line(points={{-24,-8},{-14,-8}}, color={0,0,255}));
        connect(signalVoltage2.v, sine.y) annotation (Line(points={{-2,-18},{68,
                -18},{68,-24},{73,-24}}, color={0,0,127}));
        connect(signalVoltage1.v, sine1.y) annotation (Line(points={{-18,-48},{68,
                -48},{68,-54},{73,-54}}, color={0,0,127}));
        connect(signalVoltage.v, sine2.y) annotation (Line(points={{-52,-78},{68,
                -78},{68,-84},{73,-84}}, color={0,0,127}));
        annotation (Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                  lineColor={0,0,255}), Text(
                extent={{-60,56},{104,-54}},
                textColor={0,0,255},
                textString="Grid"),
              Text(
                extent={{-92,74},{-64,44}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{-92,14},{-64,-16}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{-92,-46},{-64,-76}},
                textColor={28,108,200},
                textString="A")}));
      end GridWithFault_Init;

      model GFM_GFL_IBR_Init_SS

        Real out[12];
        //Real get_time_result;
        parameter Modelica.Units.SI.Capacitance c_filter = 0.0000627830 "Filter Capacitance";
        parameter Modelica.Units.SI.Resistance r_damp = 845 "Damping Resistance";
        parameter Modelica.Units.SI.Inductance l_filter = 0.0008965728461 "Filter Inductance";
        parameter Modelica.Units.SI.Resistance r_l = 0.021125 "Inductor Resistance";
        parameter Real Vbase = 6.5 "kV";
        parameter Real Sbase = 10 "MVA";
        parameter Real VDC_base = 13 "kV";
        parameter Real w_type = 1 "0 - PLL, 1 - Droop";
        GFM_DLL gfm_struct = GFM_DLL(c_filter,r_damp,l_filter,r_l,Vbase,Sbase,VDC_base,w_type);

        Modelica.Electrical.Analog.Basic.Resistor resistor(R=r_l)
          annotation (Placement(transformation(extent={{-30,4},{-18,16}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor(i(start=-122.771,
              fixed=true),                                                         L=
              l_filter) annotation (Placement(transformation(extent={{-10,4},{2,16}})));
        Modelica.Electrical.Analog.Basic.Capacitor c_b(v(start=0, fixed=false), C=
              c_filter) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={20,-26})));
        Modelica.Electrical.Analog.Basic.Resistor r_b(R=r_damp) annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={52,-26})));
        Modelica.Electrical.Analog.Basic.Capacitor c_c(v(start=-4596.194, fixed=false),
                                                                                C=
              c_filter) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={30,-26})));
        Modelica.Electrical.Analog.Basic.Resistor r_c(R=r_damp) annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={62,-26})));
        Modelica.Electrical.Analog.Basic.Capacitor c_a(v(start=4596.194, fixed=false),
                                                                                C=
              c_filter) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={10,-26})));
        Modelica.Electrical.Analog.Basic.Resistor r_a(R=r_damp) annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={42,-26})));
        Modelica.Electrical.Analog.Basic.Resistor resistor4(R=r_l)
          annotation (Placement(transformation(extent={{-26,-6},{-14,6}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start=125.846,
              fixed=true),                                                          L
            =l_filter) annotation (Placement(transformation(extent={{-6,-6},{6,6}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor5(R=r_l)
          annotation (Placement(transformation(extent={{-22,-16},{-10,-4}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start=-3.07474,
              fixed=true),                                                          L
            =l_filter)
          annotation (Placement(transformation(extent={{-2,-16},{10,-4}})));
        tools.votlage_current_sensor_no_init
                                     bridge_sensor_c
          annotation (Placement(transformation(extent={{-48,8},{-38,12}})));
        tools.votlage_current_sensor_no_init
                                     bridge_sensor_b
          annotation (Placement(transformation(extent={{-48,-2},{-38,2}})));
        tools.votlage_current_sensor_no_init
                                     bridge_sensor_a
          annotation (Placement(transformation(extent={{-48,-12},{-38,-8}})));
        tools.votlage_current_sensor_no_init
                                     grid_sensor_c
          annotation (Placement(transformation(extent={{68,8},{78,12}})));
        tools.votlage_current_sensor_no_init
                                     grid_sensor_b
          annotation (Placement(transformation(extent={{68,-2},{78,2}})));
        tools.votlage_current_sensor_no_init
                                     grid_sensor_a
          annotation (Placement(transformation(extent={{68,-12},{78,-8}})));
        Modelica.Electrical.Analog.Sources.SignalVoltage phase_c annotation (
            Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-78,-22})));
        Modelica.Electrical.Analog.Sources.SignalVoltage phase_b annotation (
            Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-66,-22})));
        Modelica.Electrical.Analog.Sources.SignalVoltage phase_a annotation (
            Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-54,-22})));
        Modelica.Electrical.Analog.Basic.Ground ground2
          annotation (Placement(transformation(extent={{-72,-56},{-60,-44}})));
        Modelica.Electrical.Analog.Basic.Ground ground1
          annotation (Placement(transformation(extent={{30,-62},{42,-50}})));

        Modelica.Electrical.Analog.Interfaces.NegativePin A annotation (Placement(
              transformation(rotation=0, extent={{90,-70},{110,-50}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin B annotation (
            Placement(transformation(rotation=0, extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin C annotation (
            Placement(transformation(rotation=0, extent={{90,50},{110,70}})));
        Modelica.Blocks.Interfaces.RealInput P_ref_pu
          annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
        Modelica.Blocks.Interfaces.RealInput Q_ref_pu
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
        Modelica.Blocks.Interfaces.RealInput V_ref_pu
          annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
      initial equation
        OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM.Functions.load_ss_state(gfm_struct);
      algorithm
        Functions.update(
          gfm_struct,
          time,
          grid_sensor_a.voltage,
          grid_sensor_b.voltage,
          grid_sensor_c.voltage,
          grid_sensor_a.current,
          grid_sensor_b.current,
          grid_sensor_c.current,
          bridge_sensor_a.current,
          bridge_sensor_b.current,
          bridge_sensor_c.current,
          P_ref_pu,
          Q_ref_pu,
          V_ref_pu);

        out :=Functions.model_output(gfm_struct);
        phase_a.v :=out[1]*1000;
        phase_b.v :=out[2]*1000;
        phase_c.v :=out[3]*1000;
        //Modelica.Utilities.Streams.print(String(time));
      equation
        connect(resistor.n,inductor. p)
          annotation (Line(points={{-18,10},{-10,10}},
                                                    color={0,0,255}));
        connect(resistor4.n,inductor1. p)
          annotation (Line(points={{-14,0},{-6,0}},
                                                  color={0,0,255}));
        connect(resistor5.n,inductor2. p)
          annotation (Line(points={{-10,-10},{-2,-10}},
                                                      color={0,0,255}));
        connect(c_a.p,inductor2. n)
          annotation (Line(points={{10,-20},{10,-10}}, color={0,0,255}));
        connect(resistor.p,bridge_sensor_c. n)
          annotation (Line(points={{-30,10},{-38,10}}, color={0,0,255}));
        connect(bridge_sensor_b.n,resistor4. p)
          annotation (Line(points={{-38,0},{-26,0}}, color={0,0,255}));
        connect(resistor5.p,bridge_sensor_a. n)
          annotation (Line(points={{-22,-10},{-38,-10}}, color={0,0,255}));
        connect(inductor.n,grid_sensor_c. p)
          annotation (Line(points={{2,10},{68,10}},  color={0,0,255}));
        connect(inductor1.n,grid_sensor_b. p)
          annotation (Line(points={{6,0},{68,0}},  color={0,0,255}));
        connect(inductor2.n,grid_sensor_a. p)
          annotation (Line(points={{10,-10},{68,-10}}, color={0,0,255}));
        connect(c_b.p,grid_sensor_b. p)
          annotation (Line(points={{20,-20},{20,0},{68,0}}, color={0,0,255}));
        connect(c_c.p,grid_sensor_c. p)
          annotation (Line(points={{30,-20},{30,10},{68,10}}, color={0,0,255}));
        connect(phase_b.n,ground2. p)
          annotation (Line(points={{-66,-28},{-66,-44}}, color={0,0,255}));
        connect(phase_c.n,ground2. p) annotation (Line(points={{-78,-28},{-78,-40},{-66,
                -40},{-66,-44}}, color={0,0,255}));
        connect(phase_a.n,ground2. p) annotation (Line(points={{-54,-28},{-54,-40},{-66,
                -40},{-66,-44}}, color={0,0,255}));
        connect(phase_a.p,bridge_sensor_a. p)
          annotation (Line(points={{-54,-16},{-48,-16},{-48,-10}}, color={0,0,255}));
        connect(phase_b.p,bridge_sensor_b. p)
          annotation (Line(points={{-66,-16},{-66,0},{-48,0}}, color={0,0,255}));
        connect(phase_c.p,bridge_sensor_c. p)
          annotation (Line(points={{-78,-16},{-78,10},{-48,10}}, color={0,0,255}));
        connect(r_c.p,grid_sensor_c. p)
          annotation (Line(points={{62,-20},{62,10},{68,10}}, color={0,0,255}));
        connect(r_b.p,grid_sensor_b. p)
          annotation (Line(points={{52,-20},{52,0},{68,0}}, color={0,0,255}));
        connect(r_a.p,grid_sensor_a. p)
          annotation (Line(points={{42,-20},{42,-10},{68,-10}}, color={0,0,255}));
        connect(c_a.n,r_c. n) annotation (Line(points={{10,-32},{10,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(c_b.n,r_c. n) annotation (Line(points={{20,-32},{20,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(c_c.n,r_c. n) annotation (Line(points={{30,-32},{30,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(r_a.n,r_c. n) annotation (Line(points={{42,-32},{42,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(r_b.n,r_c. n) annotation (Line(points={{52,-32},{52,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(ground1.p,r_c. n) annotation (Line(points={{36,-50},{36,-36},{62,-36},
                {62,-32}}, color={0,0,255}));
        connect(A, grid_sensor_a.n)
          annotation (Line(points={{100,-60},{84,-60},{84,-10},{78,-10}},
                                                                  color={0,0,255}));
        connect(B, grid_sensor_b.n)
          annotation (Line(points={{100,0},{78,0}}, color={0,0,255}));
        connect(C, grid_sensor_c.n) annotation (Line(points={{100,60},{84,60},{
                84,10},{78,10}}, color={0,0,255}));
        annotation (Icon(graphics={
              Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
              Line(points={{-100,100},{100,-100}}, color={28,108,200}),
              Text(
                extent={{-44,106},{48,40}},
                textColor={28,108,200},
                textString="AC"),
              Text(
                extent={{-46,-40},{46,-106}},
                textColor={28,108,200},
                textString="DC"),
              Text(
                extent={{64,74},{92,44}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{64,14},{92,-16}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{64,-46},{92,-76}},
                textColor={28,108,200},
                textString="A")}));
      end GFM_GFL_IBR_Init_SS;

      model GridWithFault
        parameter Modelica.Units.SI.Voltage Vbase=6500 "base voltage L-L RMS";
        parameter Real Vgrid = 1 "p.u.";
        parameter Real FaultVoltage = 0.7 "p.u.";
        parameter Modelica.Units.SI.Time FaultTime =5 "When fault happen";
        parameter Modelica.Units.SI.Time FaultDuration = 0.1 "for how long";
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-64,-78})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-30,-48})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage2 annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-14,-18})));
        Modelica.Blocks.Sources.Sine sine(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=60,
          phase=2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-24})));
        Modelica.Blocks.Sources.Sine sine1(amplitude=sqrt(2)*Vbase/sqrt(3),f=60)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-54})));
        Modelica.Blocks.Sources.Sine sine2(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=60,
          phase=-2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-84})));
        Modelica.Electrical.Analog.Basic.Ground ground4
          annotation (Placement(transformation(extent={{-70,-106},{-58,-94}})));
        Modelica.Blocks.Sources.Step step1(
          height=FaultVoltage - Vgrid,
          offset=Vgrid,
          startTime=FaultTime)
                       annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={28,82})));
        Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={18,-18})));
        Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={18,-48})));
        Modelica.Blocks.Math.Product product3 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={18,-78})));
        Modelica.Blocks.Continuous.FirstOrder firstOrder(
          k=1,
          T=0.0001,
          initType=Modelica.Blocks.Types.Init.InitialState,
          y_start=1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={44,18})));
        Modelica.Blocks.Sources.Step step2(
          height=Vgrid - FaultVoltage,
          offset=0,
          startTime=FaultTime + FaultDuration)
                         annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={60,82})));
        Modelica.Blocks.Math.Add add annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={44,46})));
        Modelica.Electrical.Analog.Interfaces.PositivePin C annotation (Placement(
              transformation(rotation=0, extent={{-110,50},{-90,70}}),
              iconTransformation(extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin B annotation (
            Placement(transformation(rotation=0, extent={{-110,-10},{-90,10}}),
              iconTransformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin A annotation (
            Placement(transformation(rotation=0, extent={{-110,-70},{-90,-50}}),
              iconTransformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-76,-78})));
        Modelica.Electrical.Analog.Basic.Resistor resistor1(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-46,-48})));
        Modelica.Electrical.Analog.Basic.Resistor resistor2(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-24,-18})));
      equation
        connect(product1.u1,sine. y)
          annotation (Line(points={{30,-24},{73,-24}},     color={0,0,127}));
        connect(product2.u1,sine1. y)
          annotation (Line(points={{30,-54},{73,-54}},     color={0,0,127}));
        connect(product3.u1,sine2. y)
          annotation (Line(points={{30,-84},{73,-84}},     color={0,0,127}));
        connect(product1.y,signalVoltage2. v) annotation (Line(points={{7,-18},{-2,-18}},
                                            color={0,0,127}));
        connect(product2.y,signalVoltage1. v) annotation (Line(points={{7,-48},{-18,-48}},
                                  color={0,0,127}));
        connect(product3.y,signalVoltage. v) annotation (Line(points={{7,-78},{-52,-78}},
                                  color={0,0,127}));
        connect(firstOrder.y,product1. u2)
          annotation (Line(points={{44,7},{44,-12},{30,-12}},      color={0,0,127}));
        connect(product2.u2,firstOrder. y) annotation (Line(points={{30,-42},{44,-42},
                {44,7}},    color={0,0,127}));
        connect(product3.u2,firstOrder. y) annotation (Line(points={{30,-72},{44,-72},
                {44,7}},    color={0,0,127}));
        connect(firstOrder.u,add. y)
          annotation (Line(points={{44,30},{44,35}},     color={0,0,127}));
        connect(step1.y,add. u2) annotation (Line(points={{28,71},{28,68},{38,68},{38,
                58}},                           color={0,0,127}));
        connect(step2.y,add. u1) annotation (Line(points={{60,71},{60,68},{50,68},{50,
                58}},                           color={0,0,127}));
        connect(C, signalVoltage.p)
          annotation (Line(points={{-100,60},{-64,60},{-64,-68}}, color={0,0,255}));
        connect(B, signalVoltage1.p) annotation (Line(points={{-100,0},{-30,0},
                {-30,-38}}, color={0,0,255}));
        connect(A, signalVoltage2.p) annotation (Line(points={{-100,-60},{-78,-60},
                {-78,-4},{-14,-4},{-14,-8}}, color={0,0,255}));
        connect(signalVoltage2.n, ground4.p)
          annotation (Line(points={{-14,-28},{-14,-94},{-64,-94}}, color={0,0,255}));
        connect(signalVoltage1.n, ground4.p)
          annotation (Line(points={{-30,-58},{-30,-94},{-64,-94}}, color={0,0,255}));
        connect(signalVoltage.n, ground4.p)
          annotation (Line(points={{-64,-88},{-64,-94}}, color={0,0,255}));
        connect(resistor.n, signalVoltage.n)
          annotation (Line(points={{-76,-88},{-64,-88}}, color={0,0,255}));
        connect(resistor.p, signalVoltage.p)
          annotation (Line(points={{-76,-68},{-64,-68}}, color={0,0,255}));
        connect(resistor1.p, signalVoltage1.p)
          annotation (Line(points={{-46,-38},{-30,-38}}, color={0,0,255}));
        connect(resistor1.n, signalVoltage1.n)
          annotation (Line(points={{-46,-58},{-30,-58}}, color={0,0,255}));
        connect(resistor2.n, signalVoltage2.n)
          annotation (Line(points={{-24,-28},{-14,-28}}, color={0,0,255}));
        connect(resistor2.p, signalVoltage2.p)
          annotation (Line(points={{-24,-8},{-14,-8}}, color={0,0,255}));
        annotation (Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                  lineColor={0,0,255}), Text(
                extent={{-64,58},{100,-52}},
                textColor={0,0,255},
                textString="Grid"),
              Text(
                extent={{-94,74},{-66,44}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{-94,14},{-66,-16}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{-94,-46},{-66,-76}},
                textColor={28,108,200},
                textString="A")}));
      end GridWithFault;

      model GridFStep
        parameter Modelica.Units.SI.Voltage Vbase=6500 "base voltage L-L RMS";
        parameter Real Vgrid = 1 "p.u.";
        parameter Real FaultVoltage = 0.7 "p.u.";
        parameter Modelica.Units.SI.Time FaultTime =5 "When fault happen";
        parameter Modelica.Units.SI.Time FaultDuration = 0.1 "for how long";
        parameter Modelica.Units.SI.Time FstepTime =6 "When fault happen";
        parameter Modelica.Units.SI.Frequency fnorm = 60 "for how long";
        parameter Modelica.Units.SI.Frequency deltaF = -0.5 "for how long";
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-64,-78})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-30,-48})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage2 annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-14,-18})));
        Modelica.Electrical.Analog.Basic.Ground ground4
          annotation (Placement(transformation(extent={{-70,-106},{-58,-94}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin C annotation (Placement(
              transformation(rotation=0, extent={{-110,50},{-90,70}}),
              iconTransformation(extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin B annotation (
            Placement(transformation(rotation=0, extent={{-110,-10},{-90,10}}),
              iconTransformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin A annotation (
            Placement(transformation(rotation=0, extent={{-110,-70},{-90,-50}}),
              iconTransformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-76,-78})));
        Modelica.Electrical.Analog.Basic.Resistor resistor1(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-46,-48})));
        Modelica.Electrical.Analog.Basic.Resistor resistor2(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-24,-18})));
        Modelica.Blocks.Sources.SineVariableFrequencyAndAmplitude sineA(
          useConstantAmplitude=true,
          constantAmplitude=sqrt(2)*Vbase/sqrt(3),
          phi(fixed=true, start=2.0943951023932)) annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={26,-18})));
        Modelica.Blocks.Sources.Step f(
          height=deltaF,
          offset=fnorm,
          startTime=FstepTime)
          annotation (Placement(transformation(extent={{74,-22},{54,-2}})));
        Modelica.Blocks.Sources.SineVariableFrequencyAndAmplitude sineA1(
          useConstantAmplitude=true,
          constantAmplitude=sqrt(2)*Vbase/sqrt(3),
          phi(fixed=true, start=0)) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={26,-48})));
        Modelica.Blocks.Sources.Step f1(
          height=deltaF,
          offset=fnorm,
          startTime=FstepTime)
          annotation (Placement(transformation(extent={{74,-52},{54,-32}})));
        Modelica.Blocks.Sources.SineVariableFrequencyAndAmplitude sineA2(
          useConstantAmplitude=true,
          constantAmplitude=sqrt(2)*Vbase/sqrt(3),
          phi(fixed=true, start=-2.0943951023932)) annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={26,-78})));
        Modelica.Blocks.Sources.Step f2(
          height=deltaF,
          offset=fnorm,
          startTime=FstepTime)
          annotation (Placement(transformation(extent={{74,-82},{54,-62}})));
      equation
        connect(C, signalVoltage.p)
          annotation (Line(points={{-100,60},{-64,60},{-64,-68}}, color={0,0,255}));
        connect(B, signalVoltage1.p) annotation (Line(points={{-100,0},{-30,0},
                {-30,-38}}, color={0,0,255}));
        connect(A, signalVoltage2.p) annotation (Line(points={{-100,-60},{-78,-60},
                {-78,-4},{-14,-4},{-14,-8}}, color={0,0,255}));
        connect(signalVoltage2.n, ground4.p)
          annotation (Line(points={{-14,-28},{-14,-94},{-64,-94}}, color={0,0,255}));
        connect(signalVoltage1.n, ground4.p)
          annotation (Line(points={{-30,-58},{-30,-94},{-64,-94}}, color={0,0,255}));
        connect(signalVoltage.n, ground4.p)
          annotation (Line(points={{-64,-88},{-64,-94}}, color={0,0,255}));
        connect(resistor.n, signalVoltage.n)
          annotation (Line(points={{-76,-88},{-64,-88}}, color={0,0,255}));
        connect(resistor.p, signalVoltage.p)
          annotation (Line(points={{-76,-68},{-64,-68}}, color={0,0,255}));
        connect(resistor1.p, signalVoltage1.p)
          annotation (Line(points={{-46,-38},{-30,-38}}, color={0,0,255}));
        connect(resistor1.n, signalVoltage1.n)
          annotation (Line(points={{-46,-58},{-30,-58}}, color={0,0,255}));
        connect(resistor2.n, signalVoltage2.n)
          annotation (Line(points={{-24,-28},{-14,-28}}, color={0,0,255}));
        connect(resistor2.p, signalVoltage2.p)
          annotation (Line(points={{-24,-8},{-14,-8}}, color={0,0,255}));
        connect(sineA.f, f.y)
          annotation (Line(points={{38,-12},{53,-12}},  color={0,0,127}));
        connect(sineA1.f, f1.y)
          annotation (Line(points={{38,-42},{53,-42}},  color={0,0,127}));
        connect(sineA2.f, f2.y)
          annotation (Line(points={{38,-72},{53,-72}},  color={0,0,127}));
        connect(signalVoltage.v, sineA2.y)
          annotation (Line(points={{-52,-78},{15,-78}}, color={0,0,127}));
        connect(signalVoltage1.v, sineA1.y)
          annotation (Line(points={{-18,-48},{15,-48}}, color={0,0,127}));
        connect(signalVoltage2.v, sineA.y)
          annotation (Line(points={{-2,-18},{15,-18}}, color={0,0,127}));
        annotation (Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                  lineColor={0,0,255}), Text(
                extent={{-64,58},{100,-52}},
                textColor={0,0,255},
                textString="Grid"),
              Text(
                extent={{-94,74},{-66,44}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{-94,14},{-66,-16}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{-94,-46},{-66,-76}},
                textColor={28,108,200},
                textString="A")}));
      end GridFStep;

      model EMTPGrid
        parameter Modelica.Units.SI.Voltage Vbase=6500 "base voltage L-L RMS";
        parameter Modelica.Units.SI.Frequency f = 60 "Grid frequency(Hz)";
        parameter Modelica.Units.SI.Resistance Rpos=0.1953 "Source positive sequence resistance";
        parameter Modelica.Units.SI.Inductance Xpos=3.3200 "Source positive sequence reactance";

        Modelica.Blocks.Sources.Sine sine(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=f,
          phase=2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-80})));
        Modelica.Blocks.Sources.Sine sine1(amplitude=sqrt(2)*Vbase/sqrt(3), f=f)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-20})));
        Modelica.Blocks.Sources.Sine sine2(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=f,
          phase=-2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={80,40})));
        Modelica.Electrical.Analog.Basic.Ground ground4
          annotation (Placement(transformation(extent={{54,-112},{66,-100}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin C annotation (Placement(
              transformation(rotation=0, extent={{-110,50},{-90,70}}),
              iconTransformation(extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin B annotation (
            Placement(transformation(rotation=0, extent={{-110,-10},{-90,10}}),
              iconTransformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin A annotation (
            Placement(transformation(rotation=0, extent={{-110,-70},{-90,-50}}),
              iconTransformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor(i(start=0),
                                                           L=Xpos/(2*Modelica.Constants.pi
              *f))
          annotation (Placement(transformation(extent={{-80,50},{-60,70}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor3(R=Rpos)
          annotation (Placement(transformation(extent={{-56,50},{-36,70}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start=0),
                                                            L=Xpos/(2*Modelica.Constants.pi
              *f))
          annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor4(R=Rpos)
          annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start=0),
                                                            L=Xpos/(2*Modelica.Constants.pi
              *f))
          annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor5(R=Rpos)
          annotation (Placement(transformation(extent={{-56,-70},{-36,-50}})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,40})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage2
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,-20})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage3
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,-80})));
        Modelica.Blocks.Continuous.FirstOrder firstOrder(
          k=1,
          T=0.0001,
          initType=Modelica.Blocks.Types.Init.InitialState,
          y_start=1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={16,40})));
        Modelica.Blocks.Continuous.FirstOrder firstOrder1(
          k=1,
          T=0.0001,
          initType=Modelica.Blocks.Types.Init.InitialState,
          y_start=1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={18,-20})));
        Modelica.Blocks.Continuous.FirstOrder firstOrder2(
          k=1,
          T=0.0001,
          initType=Modelica.Blocks.Types.Init.InitialState,
          y_start=1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={18,-80})));
      equation
        connect(C, inductor.p)
          annotation (Line(points={{-100,60},{-80,60}}, color={0,0,255}));
        connect(inductor.n, resistor3.p)
          annotation (Line(points={{-60,60},{-56,60}}, color={0,0,255}));
        connect(inductor1.n, resistor4.p)
          annotation (Line(points={{-60,0},{-56,0}}, color={0,0,255}));
        connect(A, inductor2.p)
          annotation (Line(points={{-100,-60},{-80,-60}}, color={0,0,255}));
        connect(inductor2.n, resistor5.p)
          annotation (Line(points={{-60,-60},{-56,-60}}, color={0,0,255}));
        connect(signalVoltage3.n, ground4.p) annotation (Line(points={{-20,-90},
                {-20,-100},{60,-100}}, color={0,0,255}));
        connect(ground4.p, signalVoltage2.n) annotation (Line(points={{60,-100},
                {60,-40},{-20,-40},{-20,-30}}, color={0,0,255}));
        connect(signalVoltage1.n, signalVoltage2.n) annotation (Line(points={{
                -20,30},{60,30},{60,-40},{-20,-40},{-20,-30}}, color={0,0,255}));
        connect(B, inductor1.p)
          annotation (Line(points={{-100,0},{-80,0}}, color={0,0,255}));
        connect(signalVoltage1.v, firstOrder.y)
          annotation (Line(points={{-8,40},{5,40}}, color={0,0,127}));
        connect(firstOrder.u, sine2.y)
          annotation (Line(points={{28,40},{69,40}}, color={0,0,127}));
        connect(firstOrder1.y, signalVoltage2.v)
          annotation (Line(points={{7,-20},{-8,-20}}, color={0,0,127}));
        connect(firstOrder1.u, sine1.y)
          annotation (Line(points={{30,-20},{73,-20}}, color={0,0,127}));
        connect(signalVoltage3.v, firstOrder2.y)
          annotation (Line(points={{-8,-80},{7,-80}}, color={0,0,127}));
        connect(firstOrder2.u, sine.y)
          annotation (Line(points={{30,-80},{73,-80}}, color={0,0,127}));
        connect(resistor5.n, signalVoltage3.p) annotation (Line(points={{-36,
                -60},{-20,-60},{-20,-70}}, color={0,0,255}));
        connect(resistor4.n, signalVoltage2.p) annotation (Line(points={{-36,0},
                {-20,0},{-20,-10}}, color={0,0,255}));
        connect(resistor3.n, signalVoltage1.p) annotation (Line(points={{-36,60},
                {-20,60},{-20,50}}, color={0,0,255}));
        connect(B, B)
          annotation (Line(points={{-100,0},{-100,0}}, color={0,0,255}));
        annotation (Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                  lineColor={28,108,200},
                lineThickness=0.5),
              Text(
                extent={{-92,74},{-64,44}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{-92,14},{-64,-16}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{-92,-46},{-64,-76}},
                textColor={28,108,200},
                textString="A"),
              Line(
                points={{-70,0},{-52,0}},
                color={28,108,200},
                thickness=0.5),
              Rectangle(
                extent={{-52,8},{0,-8}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{0,0},{10,0}},
                color={28,108,200},
                thickness=0.5),
              Ellipse(
                extent={{20,30},{80,-30}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{30,0},{42,10},{58,-10},{70,0}},
                color={28,108,200},
                thickness=1,
                smooth=Smooth.Bezier),
              Line(
                points={{-70,-60},{-52,-60}},
                color={238,46,47},
                thickness=0.5),
              Rectangle(
                extent={{-52,-52},{0,-68}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{0,-60},{10,-60}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{-70,60},{-52,60}},
                color={0,140,72},
                thickness=0.5),
              Rectangle(
                extent={{-52,68},{0,52}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{10,60},{10,-60}},
                color={0,0,0},
                thickness=1),
              Line(
                points={{0,60},{10,60}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{10,0},{20,0}},
                color={0,0,0},
                thickness=1)}));
      end EMTPGrid;

      model EMTPGrid_forfigure
        parameter Modelica.Units.SI.Voltage Vbase=6500 "base voltage L-L RMS";
        parameter Modelica.Units.SI.Frequency f = 60 "Grid frequency(Hz)";
        parameter Modelica.Units.SI.Resistance Rpos=0.1953 "Source positive sequence resistance";
        parameter Modelica.Units.SI.Inductance Xpos=3.3200 "Source positive sequence reactance";

        Modelica.Blocks.Sources.Sine sine(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=f,
          phase=2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={10,-80})));
        Modelica.Blocks.Sources.Sine sine1(amplitude=sqrt(2)*Vbase/sqrt(3), f=f)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={10,-20})));
        Modelica.Blocks.Sources.Sine sine2(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=f,
          phase=-2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={10,40})));
        Modelica.Electrical.Analog.Basic.Ground GND
          annotation (Placement(transformation(extent={{-26,-102},{-14,-90}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin C annotation (Placement(
              transformation(rotation=0, extent={{-110,50},{-90,70}}),
              iconTransformation(extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin B annotation (
            Placement(transformation(rotation=0, extent={{-110,-10},{-90,10}}),
              iconTransformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin A annotation (
            Placement(transformation(rotation=0, extent={{-110,-70},{-90,-50}}),
              iconTransformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Basic.Inductor Lc(i(start=0), L=Xpos/(2*
              Modelica.Constants.pi*f))
          annotation (Placement(transformation(extent={{-80,50},{-60,70}})));
        Modelica.Electrical.Analog.Basic.Resistor RposC(R=Rpos)
          annotation (Placement(transformation(extent={{-56,50},{-36,70}})));
        Modelica.Electrical.Analog.Basic.Inductor Lb(i(start=0), L=Xpos/(2*
              Modelica.Constants.pi*f))
          annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
        Modelica.Electrical.Analog.Basic.Resistor RposB(R=Rpos)
          annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
        Modelica.Electrical.Analog.Basic.Inductor La(i(start=0), L=Xpos/(2*
              Modelica.Constants.pi*f))
          annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
        Modelica.Electrical.Analog.Basic.Resistor RposA(R=Rpos)
          annotation (Placement(transformation(extent={{-56,-70},{-36,-50}})));
        Modelica.Electrical.Analog.Sources.SignalVoltage Vc annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,40})));
        Modelica.Electrical.Analog.Sources.SignalVoltage Vb annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,-20})));
        Modelica.Electrical.Analog.Sources.SignalVoltage Va annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,-80})));
        Modelica.Electrical.Analog.Basic.Ground GND1
          annotation (Placement(transformation(extent={{-26,-42},{-14,-30}})));
        Modelica.Electrical.Analog.Basic.Ground GND2
          annotation (Placement(transformation(extent={{-26,18},{-14,30}})));
      equation
        connect(C, Lc.p)
          annotation (Line(points={{-100,60},{-80,60}}, color={0,0,255}));
        connect(Lc.n, RposC.p)
          annotation (Line(points={{-60,60},{-56,60}}, color={0,0,255}));
        connect(Lb.n, RposB.p)
          annotation (Line(points={{-60,0},{-56,0}}, color={0,0,255}));
        connect(A, La.p)
          annotation (Line(points={{-100,-60},{-80,-60}}, color={0,0,255}));
        connect(La.n, RposA.p)
          annotation (Line(points={{-60,-60},{-56,-60}}, color={0,0,255}));
        connect(B, Lb.p)
          annotation (Line(points={{-100,0},{-80,0}}, color={0,0,255}));
        connect(RposA.n, Va.p) annotation (Line(points={{-36,-60},{-20,-60},{-20,
                -70}}, color={0,0,255}));
        connect(RposB.n, Vb.p) annotation (Line(points={{-36,0},{-20,0},{-20,-10}},
              color={0,0,255}));
        connect(RposC.n, Vc.p) annotation (Line(points={{-36,60},{-20,60},{-20,
                50}}, color={0,0,255}));
        connect(B, B)
          annotation (Line(points={{-100,0},{-100,0}}, color={0,0,255}));
        connect(Vc.v, sine2.y)
          annotation (Line(points={{-8,40},{-1,40}}, color={0,0,127}));
        connect(Vb.v, sine1.y)
          annotation (Line(points={{-8,-20},{-1,-20}}, color={0,0,127}));
        connect(Va.v, sine.y)
          annotation (Line(points={{-8,-80},{-1,-80}}, color={0,0,127}));
        connect(Va.n, GND.p)
          annotation (Line(points={{-20,-90},{-20,-90}}, color={0,0,255}));
        connect(Vb.n, GND1.p)
          annotation (Line(points={{-20,-30},{-20,-30}}, color={0,0,255}));
        connect(Vc.n, GND2.p)
          annotation (Line(points={{-20,30},{-20,30}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(extent={{-100,-100},{100,100}},
                preserveAspectRatio=false),
                         graphics={Rectangle(extent={{-100,100},{100,-100}},
                  lineColor={28,108,200},
                lineThickness=0.5),
              Text(
                extent={{-92,74},{-64,44}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{-92,14},{-64,-16}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{-92,-46},{-64,-76}},
                textColor={28,108,200},
                textString="A"),
              Line(
                points={{-70,0},{-52,0}},
                color={28,108,200},
                thickness=0.5),
              Rectangle(
                extent={{-52,8},{0,-8}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{0,0},{10,0}},
                color={28,108,200},
                thickness=0.5),
              Ellipse(
                extent={{20,30},{80,-30}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{30,0},{42,10},{58,-10},{70,0}},
                color={28,108,200},
                thickness=1,
                smooth=Smooth.Bezier),
              Line(
                points={{-70,-60},{-52,-60}},
                color={238,46,47},
                thickness=0.5),
              Rectangle(
                extent={{-52,-52},{0,-68}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{0,-60},{10,-60}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{-70,60},{-52,60}},
                color={0,140,72},
                thickness=0.5),
              Rectangle(
                extent={{-52,68},{0,52}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{10,60},{10,-60}},
                color={0,0,0},
                thickness=1),
              Line(
                points={{0,60},{10,60}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{10,0},{20,0}},
                color={0,0,0},
                thickness=1)}), Diagram(coordinateSystem(extent={{-100,-100},{
                  100,100}}, preserveAspectRatio=false)));
      end EMTPGrid_forfigure;

      model ShortFault
        parameter Modelica.Units.SI.Resistance R = 5 "Short resistance to ground";
        parameter Modelica.Units.SI.Time faultTime = 5;
        parameter Modelica.Units.SI.Time faultDuration = 0.1;
        parameter Real Ron=1e-5 "Switch on resistance";
        parameter Real Goff=0.0006 "Switch on resistance";
        parameter Real line_capacitance = 1e-6
                                              "line to ground capacitance";
        Modelica.Electrical.Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-10,-168},{10,-148}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor(R=R) annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,-132})));
        Modelica.Electrical.Analog.Interfaces.Pin C
          annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin B
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin A
          annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin C_n
          annotation (Placement(transformation(extent={{90,50},{110,70}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin B_n
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin A_n
          annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor1(R=R) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-132})));
        Modelica.Electrical.Analog.Basic.Resistor resistor2(R=R) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={20,-132})));
        Modelica.Electrical.Analog.Ideal.IdealClosingSwitch           switch(
          Ron=Ron,
          Goff=Goff) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-20,16})));
        Modelica.Electrical.Analog.Ideal.IdealClosingSwitch           switch1(
          Ron=Ron,
          Goff=Goff) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={0,-42})));
        Modelica.Electrical.Analog.Ideal.IdealClosingSwitch           switch2(
          Ron=Ron,
          Goff=Goff) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={20,-100})));
        Modelica.Blocks.Sources.BooleanTable booleanTable(
          table={faultTime,faultDuration + faultTime},
          startValue=false,
          extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
          annotation (Placement(transformation(extent={{-146,-52},{-126,-32}})));
        tools.zeroXdetect zeroXdetectC
          annotation (Placement(transformation(extent={{-60,6},{-40,26}})));
        tools.zeroXdetect zeroXdetectB
          annotation (Placement(transformation(extent={{-62,-52},{-42,-32}})));
        tools.zeroXdetect zeroXdetectA
          annotation (Placement(transformation(extent={{-60,-110},{-40,-90}})));
        Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
          annotation (Placement(transformation(extent={{48,50},{28,70}})));
        Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1
          annotation (Placement(transformation(extent={{50,-10},{30,10}})));
        Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor2
          annotation (Placement(transformation(extent={{50,-70},{30,-50}})));
      equation
        connect(C, C)
          annotation (Line(points={{-100,60},{-100,60}}, color={0,0,255}));
        connect(resistor.n, ground.p)
          annotation (Line(points={{-20,-142},{-20,-148},{0,-148}},
                                                           color={0,0,255}));
        connect(resistor1.n, ground.p)
          annotation (Line(points={{0,-142},{0,-148}},            color={0,0,255}));
        connect(resistor2.n, resistor1.n) annotation (Line(points={{20,-142},{20,-148},
                {0,-148},{0,-142}}, color={0,0,255}));
        connect(resistor.p, switch.p)
          annotation (Line(points={{-20,-122},{-20,6}},   color={0,0,255}));
        connect(resistor1.p, switch1.p)
          annotation (Line(points={{0,-122},{0,-52}}, color={0,0,255}));
        connect(switch2.p, resistor2.p)
          annotation (Line(points={{20,-110},{20,-122}},color={0,0,255}));
        connect(resistor2.n, ground.p)
          annotation (Line(points={{20,-142},{20,-148},{0,-148}}, color={0,0,255}));
        connect(zeroXdetectC.y, switch.control)
          annotation (Line(points={{-39,16},{-32,16}}, color={255,0,255}));
        connect(zeroXdetectB.y, switch1.control)
          annotation (Line(points={{-41,-42},{-12,-42}}, color={255,0,255}));
        connect(zeroXdetectA.y, switch2.control)
          annotation (Line(points={{-39,-100},{8,-100}}, color={255,0,255}));
        connect(booleanTable.y, zeroXdetectC.u) annotation (Line(points={{-125,-42},{-114,
                -42},{-114,16},{-60,16}}, color={255,0,255}));
        connect(zeroXdetectB.u, booleanTable.y)
          annotation (Line(points={{-62,-42},{-125,-42}}, color={255,0,255}));
        connect(zeroXdetectA.u, booleanTable.y) annotation (Line(points={{-60,-100},{-114,
                -100},{-114,-42},{-125,-42}}, color={255,0,255}));

        connect(currentSensor.p, C_n)
          annotation (Line(points={{48,60},{100,60}}, color={0,0,255}));
        connect(currentSensor.n, C)
          annotation (Line(points={{28,60},{-100,60}}, color={0,0,255}));
        connect(currentSensor.i, zeroXdetectC.u1) annotation (Line(points={{38,49},{38,
                36},{-50,36},{-50,26}}, color={0,0,127}));
        connect(switch.n, C)
          annotation (Line(points={{-20,26},{-20,60},{-100,60}}, color={0,0,255}));
        connect(currentSensor1.p, B_n)
          annotation (Line(points={{50,0},{100,0}}, color={0,0,255}));
        connect(currentSensor1.n, B)
          annotation (Line(points={{30,0},{-100,0}}, color={0,0,255}));
        connect(zeroXdetectB.u1, currentSensor1.i) annotation (Line(points={{-52,-32},
                {-52,-24},{40,-24},{40,-11}}, color={0,0,127}));
        connect(currentSensor2.p, A_n)
          annotation (Line(points={{50,-60},{100,-60}}, color={0,0,255}));
        connect(currentSensor2.n, A)
          annotation (Line(points={{30,-60},{-100,-60}}, color={0,0,255}));
        connect(zeroXdetectA.u1, currentSensor2.i) annotation (Line(points={{-50,-90},
                {-50,-80},{40,-80},{40,-71}}, color={0,0,127}));
        connect(switch1.n, B)
          annotation (Line(points={{0,-32},{0,0},{-100,0}}, color={0,0,255}));
        connect(switch2.n, A)
          annotation (Line(points={{20,-90},{20,-60},{-100,-60}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -180},{100,100}}),      graphics={
              Rectangle(
                extent={{-100,100},{100,-140}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
                                     Rectangle(
                extent={{-72,46},{-48,6}},
                lineColor={0,0,0},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Line(
                points={{-60,6},{-60,6},{-60,-6}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-72,-6},{-48,-6}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-70,-10},{-50,-10}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-66,-14},{-52,-14}},
                color={0,0,255},
                smooth=Smooth.None),Rectangle(
                extent={{-64,50},{-56,46}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Line(
                points={{-62,48},{-54,30},{-68,30},{-56,8}},
                color={255,0,0},
                smooth=Smooth.None,
                thickness=0.5),Line(
                points={{-62,10},{-56,8},{-56,14}},
                color={255,0,0},
                smooth=Smooth.None), Rectangle(
                extent={{-12,-12},{12,-52}},
                lineColor={0,0,0},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Line(
                points={{0,-52},{0,-52},{0,-64}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-12,-64},{12,-64}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-10,-68},{10,-68}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-6,-72},{8,-72}},
                color={0,0,255},
                smooth=Smooth.None),Rectangle(
                extent={{-4,-8},{4,-12}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Line(
                points={{-2,-10},{6,-28},{-8,-28},{4,-50}},
                color={255,0,0},
                smooth=Smooth.None,
                thickness=0.5),Line(
                points={{-2,-48},{4,-50},{4,-44}},
                color={255,0,0},
                smooth=Smooth.None), Rectangle(
                extent={{48,-72},{72,-112}},
                lineColor={0,0,0},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Line(
                points={{60,-112},{60,-112},{60,-124}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{48,-124},{72,-124}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{50,-128},{70,-128}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{54,-132},{68,-132}},
                color={0,0,255},
                smooth=Smooth.None),Rectangle(
                extent={{56,-68},{64,-72}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Line(
                points={{58,-70},{66,-88},{52,-88},{64,-110}},
                color={255,0,0},
                smooth=Smooth.None,
                thickness=0.5),Line(
                points={{58,-108},{64,-110},{64,-104}},
                color={255,0,0},
                smooth=Smooth.None),
              Line(
                points={{-100,60},{100,60}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{8,60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-102,-60},{102,-60}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{-100,0},{-76,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-76,0},{0,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{0,0},{76,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{76,0},{102,0}},
                color={28,108,200},
                thickness=0.5),
              Text(
                extent={{-102,98},{-74,68}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{-102,38},{-74,8}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{-102,-22},{-74,-52}},
                textColor={28,108,200},
                textString="A"),
              Text(
                extent={{70,98},{98,68}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{70,38},{98,8}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{70,-22},{98,-52}},
                textColor={28,108,200},
                textString="A"),
              Line(
                points={{-60,50},{-60,60}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{0,-8},{0,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{60,-68},{60,-60}},
                color={238,46,47},
                thickness=0.5)}),                                      Diagram(
              coordinateSystem(preserveAspectRatio=false, extent={{-100,-180},{
                  100,100}})));
      end ShortFault;

      model SmoothShortFault
        parameter Modelica.Units.SI.Resistance R = 5 "Short resistance to ground";
        parameter Modelica.Units.SI.Time faultTime = 5;
        parameter Modelica.Units.SI.Time faultDuration = 0.1;
        parameter Real Ron=1e-5 "Switch on resistance";
        parameter Real Goff=0.0006 "Switch on resistance";
        parameter Real line_capacitance = 1e-6
                                              "line to ground capacitance";
        Modelica.Electrical.Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-10,-168},{10,-148}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor(R=R) annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,-132})));
        Modelica.Electrical.Analog.Interfaces.Pin C
          annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin B
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin A
          annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin C_n
          annotation (Placement(transformation(extent={{90,50},{110,70}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin B_n
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin A_n
          annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor1(R=R) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-132})));
        Modelica.Electrical.Analog.Basic.Resistor resistor2(R=R) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={20,-132})));
        Modelica.Blocks.Sources.BooleanTable FaultTime(
          table={faultTime,faultDuration + faultTime},
          startValue=false,
          extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
          annotation (Placement(transformation(extent={{-150,-48},{-130,-28}})));
        tools.zeroXdetect zeroXdetect
          annotation (Placement(transformation(extent={{-80,4},{-40,40}})));
        tools.zeroXdetect zeroXdetect2
          annotation (Placement(transformation(extent={{-80,-56},{-40,-20}})));
        tools.zeroXdetect zeroXdetect1
          annotation (Placement(transformation(extent={{-80,-120},{-40,-80}})));
        Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
          annotation (Placement(transformation(extent={{48,50},{28,70}})));
        Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1
          annotation (Placement(transformation(extent={{50,-10},{30,10}})));
        Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor2
          annotation (Placement(transformation(extent={{50,-70},{30,-50}})));
        tools.SmoothSwitch smoothSwitch(
          Ron=Ron,
          Goff=Goff,
          f_cut=f_cut)
          annotation (Placement(transformation(extent={{-30,6},{-10,26}})));
        tools.SmoothSwitch smoothSwitch1(
          Ron=Ron,
          Goff=Goff,
          f_cut=f_cut)
          annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
        tools.SmoothSwitch smoothSwitch2(
          Ron=Ron,
          Goff=Goff,
          f_cut=f_cut)
          annotation (Placement(transformation(extent={{10,-110},{30,-90}})));
        parameter SI.Frequency f_cut=1e3 "Cut-off frequency";
        parameter Real threshold=0.01 "Comparison with respect to threshold";
      equation
        connect(C, C)
          annotation (Line(points={{-100,60},{-100,60}}, color={0,0,255}));
        connect(resistor.n, ground.p)
          annotation (Line(points={{-20,-142},{-20,-148},{0,-148}},
                                                           color={0,0,255}));
        connect(resistor1.n, ground.p)
          annotation (Line(points={{0,-142},{0,-148}},            color={0,0,255}));
        connect(resistor2.n, resistor1.n) annotation (Line(points={{20,-142},{20,-148},
                {0,-148},{0,-142}}, color={0,0,255}));
        connect(resistor2.n, ground.p)
          annotation (Line(points={{20,-142},{20,-148},{0,-148}}, color={0,0,255}));
        connect(FaultTime.y, zeroXdetect.u) annotation (Line(points={{-129,-38},
                {-116,-38},{-116,22},{-80,22}}, color={255,0,255}));
        connect(zeroXdetect2.u, FaultTime.y)
          annotation (Line(points={{-80,-38},{-129,-38}}, color={255,0,255}));
        connect(zeroXdetect1.u, FaultTime.y) annotation (Line(points={{-80,-100},
                {-116,-100},{-116,-38},{-129,-38}}, color={255,0,255}));

        connect(currentSensor.p, C_n)
          annotation (Line(points={{48,60},{100,60}}, color={0,0,255}));
        connect(currentSensor.n, C)
          annotation (Line(points={{28,60},{-100,60}}, color={0,0,255}));
        connect(currentSensor.i, zeroXdetect.u1) annotation (Line(points={{38,49},
                {38,48},{-60,48},{-60,40}},     color={0,0,127}));
        connect(currentSensor1.p, B_n)
          annotation (Line(points={{50,0},{100,0}}, color={0,0,255}));
        connect(currentSensor1.n, B)
          annotation (Line(points={{30,0},{-100,0}}, color={0,0,255}));
        connect(zeroXdetect2.u1, currentSensor1.i) annotation (Line(points={{
                -60,-20},{-60,-14},{40,-14},{40,-11}}, color={0,0,127}));
        connect(currentSensor2.p, A_n)
          annotation (Line(points={{50,-60},{100,-60}}, color={0,0,255}));
        connect(currentSensor2.n, A)
          annotation (Line(points={{30,-60},{-100,-60}}, color={0,0,255}));
        connect(zeroXdetect1.u1, currentSensor2.i) annotation (Line(points={{-60,-80},
                {-60,-72},{40,-72},{40,-71}},          color={0,0,127}));
        connect(zeroXdetect.y, smoothSwitch.u) annotation (Line(
            points={{-38,22},{-38,16},{-30,16}},
            color={255,0,255},
            smooth=Smooth.Bezier));
        connect(smoothSwitch.pin, C) annotation (Line(points={{-20,26},{-20,60},
                {-100,60}}, color={0,0,255}));
        connect(smoothSwitch.pin1, resistor.p) annotation (Line(
            points={{-20,6},{-20,-122}},
            color={0,0,255},
            smooth=Smooth.Bezier));
        connect(smoothSwitch1.pin, B)
          annotation (Line(points={{0,-30},{0,0},{-100,0}}, color={0,0,255}));
        connect(smoothSwitch1.pin1, resistor1.p) annotation (Line(
            points={{0,-50},{0,-122}},
            color={0,0,255},
            smooth=Smooth.Bezier));
        connect(zeroXdetect1.y, smoothSwitch2.u) annotation (Line(
            points={{-38,-100},{-38,-100},{10,-100}},
            color={255,0,255},
            smooth=Smooth.Bezier));
        connect(smoothSwitch2.pin, A) annotation (Line(points={{20,-90},{20,-60},
                {-100,-60}}, color={0,0,255}));
        connect(smoothSwitch2.pin1, resistor2.p) annotation (Line(
            points={{20,-110},{20,-122}},
            color={0,0,255},
            smooth=Smooth.Bezier));
        connect(zeroXdetect2.y, smoothSwitch1.u) annotation (Line(
            points={{-38,-38},{-38,-40},{-10,-40}},
            color={255,0,255},
            smooth=Smooth.Bezier));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                  -100,-140},{100,100}}), graphics={
              Rectangle(
                extent={{-100,100},{100,-140}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
                                     Rectangle(
                extent={{-72,46},{-48,6}},
                lineColor={0,0,0},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Line(
                points={{-60,6},{-60,6},{-60,-6}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-72,-6},{-48,-6}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-70,-10},{-50,-10}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-66,-14},{-52,-14}},
                color={0,0,255},
                smooth=Smooth.None),Rectangle(
                extent={{-64,50},{-56,46}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Line(
                points={{-62,48},{-54,30},{-68,30},{-56,8}},
                color={255,0,0},
                smooth=Smooth.None,
                thickness=0.5),Line(
                points={{-62,10},{-56,8},{-56,14}},
                color={255,0,0},
                smooth=Smooth.None), Rectangle(
                extent={{-12,-12},{12,-52}},
                lineColor={0,0,0},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Line(
                points={{0,-52},{0,-52},{0,-64}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-12,-64},{12,-64}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-10,-68},{10,-68}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-6,-72},{8,-72}},
                color={0,0,255},
                smooth=Smooth.None),Rectangle(
                extent={{-4,-8},{4,-12}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Line(
                points={{-2,-10},{6,-28},{-8,-28},{4,-50}},
                color={255,0,0},
                smooth=Smooth.None,
                thickness=0.5),Line(
                points={{-2,-48},{4,-50},{4,-44}},
                color={255,0,0},
                smooth=Smooth.None), Rectangle(
                extent={{48,-72},{72,-112}},
                lineColor={0,0,0},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Line(
                points={{60,-112},{60,-112},{60,-124}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{48,-124},{72,-124}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{50,-128},{70,-128}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{54,-132},{68,-132}},
                color={0,0,255},
                smooth=Smooth.None),Rectangle(
                extent={{56,-68},{64,-72}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Line(
                points={{58,-70},{66,-88},{52,-88},{64,-110}},
                color={255,0,0},
                smooth=Smooth.None,
                thickness=0.5),Line(
                points={{58,-108},{64,-110},{64,-104}},
                color={255,0,0},
                smooth=Smooth.None),
              Line(
                points={{-100,60},{100,60}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{8,60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-102,-60},{102,-60}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{-100,0},{-76,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-76,0},{0,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{0,0},{76,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{76,0},{102,0}},
                color={28,108,200},
                thickness=0.5),
              Text(
                extent={{-102,98},{-74,68}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{-102,38},{-74,8}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{-102,-22},{-74,-52}},
                textColor={28,108,200},
                textString="A"),
              Text(
                extent={{70,98},{98,68}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{70,38},{98,8}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{70,-22},{98,-52}},
                textColor={28,108,200},
                textString="A"),
              Line(
                points={{-60,50},{-60,60}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{0,-8},{0,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{60,-68},{60,-60}},
                color={238,46,47},
                thickness=0.5)}),                                      Diagram(
              coordinateSystem(preserveAspectRatio=false, extent={{-100,-140},{
                  100,100}})));
      end SmoothShortFault;

      model EMTPtransformer
        parameter Modelica.Units.SI.ApparentPower Sbase = 1e8;
        parameter Modelica.Units.SI.Frequency f = 60 "Grid nominal frequency";
        parameter Modelica.Units.SI.Frequency f_cut = 1000 "Transformer cutoff frequency";
        parameter Modelica.Units.SI.Voltage Winding1Voltage = 230e3 "Winding 1 voltage";
        parameter Modelica.Units.SI.Voltage Winding2Voltage = 6.5e3 "Winding 2 voltage";
        parameter Real WindingR_pu=0.00375 "Winding resisrance in pu";
        parameter Real WindingX_pu=0.15 "Winding reactance in pu";
        parameter Real D = 0.9 "Winding impedance on winding 1";

        parameter Real Zbase1 = Winding1Voltage^2/Sbase;
        parameter Real Zbase2 = Winding2Voltage^2/Sbase;
        parameter Real Ratio =  sqrt(3)*Winding2Voltage/(Winding1Voltage);

        parameter Modelica.Units.SI.Resistance Rp = D*WindingR_pu*Zbase1;
        parameter Modelica.Units.SI.Inductance Lp = D*WindingX_pu*Zbase1/(2*Modelica.Constants.pi*f);

        parameter Modelica.Units.SI.Resistance Rs = 2*(1-D)*WindingR_pu*Zbase2;
        parameter Modelica.Units.SI.Inductance Ls = 2*(1-D)*WindingX_pu*Zbase2/(2*Modelica.Constants.pi*f);
        Modelica.Electrical.Analog.Interfaces.Pin Cy
          annotation (Placement(transformation(extent={{-108,50},{-88,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin By
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin Ay
          annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Interfaces.Pin Cd
          annotation (Placement(transformation(extent={{90,50},{110,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin Bd
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin Ad
          annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
        TFsubcircuitZeroZsec
                     tFsubcircuitZeroZsec(
          n=Ratio,
          Lp=Lp,
          Rp=Rp,
          Ls=Ls,
          Rs=Rs,
          f_cut=f_cut)
                 annotation (Placement(transformation(extent={{-10,40},{10,60}})));
        TFsubcircuitZeroZsec
                     tFsubcircuitZeroZsec1(
          n=Ratio,
          Lp=Lp,
          Rp=Rp,
          Ls=Ls,
          Rs=Rs,
          f_cut=f_cut)
                 annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
        TFsubcircuitZeroZsec
                     tFsubcircuitZeroZsec2(
          n=Ratio,
          Lp=Lp,
          Rp=Rp,
          Ls=Ls,
          Rs=Rs,
          f_cut=f_cut)
                 annotation (Placement(transformation(extent={{-10,-80},{10,-60}})));
        Modelica.Electrical.Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-46,-100},{-26,-80}})));
        parameter SI.Resistance GroundingResistance=1e9
          "Resistance at temperature T_ref";
        Modelica.Electrical.Analog.Sensors.VoltageSensor VPrimABLL annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-70,-30})));
        Modelica.Electrical.Analog.Sensors.VoltageSensor VSecABLL annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={52,-34})));
        Modelica.Electrical.Analog.Basic.Resistor resistor(R=Rtf_delta)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={20,22})));
        Modelica.Electrical.Analog.Basic.Resistor resistor1(R=Rtf_delta)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={20,-38})));
        Modelica.Electrical.Analog.Basic.Resistor resistor2(R=Rtf_delta)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={68,20})));
        parameter SI.Resistance Rtf_delta=0.5 "Resistance at temperature T_ref";
        Modelica.Electrical.Analog.Basic.Ground ground1
          annotation (Placement(transformation(extent={{94,16},{106,28}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor3(R=
              GroundingResistance) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={100,42})));
        Modelica.Electrical.Analog.Basic.Ground ground2
          annotation (Placement(transformation(extent={{94,-44},{106,-32}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor4(R=
              GroundingResistance) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={100,-18})));
        Modelica.Electrical.Analog.Basic.Ground ground3
          annotation (Placement(transformation(extent={{94,-102},{106,-90}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor5(R=
              GroundingResistance) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={100,-76})));
      equation
        connect(Cy, tFsubcircuitZeroZsec.pin_p)
          annotation (Line(points={{-98,60},{-10,60}}, color={0,0,255}));
        connect(By, tFsubcircuitZeroZsec1.pin_p)
          annotation (Line(points={{-100,0},{-10,0}}, color={0,0,255}));
        connect(Ay, tFsubcircuitZeroZsec2.pin_p)
          annotation (Line(points={{-100,-60},{-10,-60}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec1.pin_n, tFsubcircuitZeroZsec2.pin_n)
          annotation (Line(points={{-10,-20},{-36,-20},{-36,-80},{-10,-80}},
              color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_n, tFsubcircuitZeroZsec1.pin_n)
          annotation (Line(points={{-10,40},{-36,40},{-36,-20},{-10,-20}},
              color={0,0,255}));
        connect(tFsubcircuitZeroZsec1.pin_n, ground.p) annotation (Line(points=
                {{-10,-20},{-36,-20},{-36,-80}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_p1, Cd)
          annotation (Line(points={{10,60},{100,60}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec1.pin_p1, Bd)
          annotation (Line(points={{10,0},{100,0}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec2.pin_p1, Ad)
          annotation (Line(points={{10,-60},{100,-60}}, color={0,0,255}));
        connect(Bd, Bd) annotation (Line(points={{100,0},{100,0}}, color={0,0,255}));
        connect(VPrimABLL.p, tFsubcircuitZeroZsec2.pin_p) annotation (Line(
              points={{-70,-40},{-70,-60},{-10,-60}}, color={0,0,255}));
        connect(VPrimABLL.n, tFsubcircuitZeroZsec1.pin_p) annotation (Line(
              points={{-70,-20},{-70,0},{-10,0}}, color={0,0,255}));
        connect(VSecABLL.p, Ad)
          annotation (Line(points={{52,-44},{52,-60},{100,-60}}, color={0,0,255}));
        connect(VSecABLL.n, Bd)
          annotation (Line(points={{52,-24},{52,0},{100,0}}, color={0,0,255}));
        connect(resistor.p, tFsubcircuitZeroZsec.pin_n1)
          annotation (Line(points={{20,32},{20,40},{10,40}}, color={0,0,255}));
        connect(resistor.n, Bd)
          annotation (Line(points={{20,12},{20,0},{100,0}}, color={0,0,255}));
        connect(resistor1.p, tFsubcircuitZeroZsec1.pin_n1) annotation (Line(
              points={{20,-28},{20,-20},{10,-20}}, color={0,0,255}));
        connect(resistor1.n, Ad) annotation (Line(points={{20,-48},{20,-60},{
                100,-60}}, color={0,0,255}));
        connect(resistor2.p, Cd) annotation (Line(points={{68,30},{68,60},{100,
                60}}, color={0,0,255}));
        connect(resistor2.n, tFsubcircuitZeroZsec2.pin_n1) annotation (Line(
              points={{68,10},{68,-80},{10,-80}}, color={0,0,255}));
        connect(ground1.p, resistor3.n)
          annotation (Line(points={{100,28},{100,36}}, color={0,0,255}));
        connect(resistor3.p, Cd)
          annotation (Line(points={{100,48},{100,60}}, color={0,0,255}));
        connect(ground2.p, resistor4.n)
          annotation (Line(points={{100,-32},{100,-24}}, color={0,0,255}));
        connect(resistor4.p, Bd)
          annotation (Line(points={{100,-12},{100,0}}, color={0,0,255}));
        connect(ground3.p, resistor5.n)
          annotation (Line(points={{100,-90},{100,-82}}, color={0,0,255}));
        connect(resistor5.p, Ad)
          annotation (Line(points={{100,-70},{100,-60}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Ellipse(
                extent={{-80,46},{10,-44}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Ellipse(
                extent={{-10,46},{80,-44}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Line(
                points={{-40,12}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{34,-12},{54,0}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{34,-12},{34,12}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{34,12},{54,0}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-40,0},{-40,24}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-40,0},{-20,-12}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-60,-12},{-40,0}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{-40,0},{-28,0}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-28,0},{-28,-18}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-38,-18},{-20,-18},{-22,-18}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-34,-22},{-22,-22}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-32,-26},{-24,-26}},
                color={0,0,0},
                thickness=0.5),
              Text(
                extent={{-50,44},{-24,20}},
                textColor={0,0,0},
                textString="1"),
              Text(
                extent={{22,44},{48,20}},
                textColor={0,0,0},
                textString="2"),
              Line(
                points={{-98,60}},
                color={28,108,200},
                thickness=0.5),
              Line(points={{-98,62}}, color={0,140,72}),
              Line(
                points={{-96,60},{-80,60},{-60,38}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{98,60},{80,60},{60,38}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-88,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,0},{-80,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{88,0},{80,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,-60},{-80,-60},{-58,-38}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{88,-60},{80,-60},{58,-38}},
                color={238,46,47},
                thickness=0.5)}), Diagram(coordinateSystem(preserveAspectRatio=false)));
      end EMTPtransformer;

      model EMTPtransformerMod
        parameter Modelica.Units.SI.ApparentPower Sbase = 1e8;
        parameter Modelica.Units.SI.Frequency f = 60 "Grid nominal frequency";
        parameter Modelica.Units.SI.Frequency f_cut = 1000 "Transformer cutoff frequency";
        parameter Modelica.Units.SI.Voltage Winding1Voltage = 230e3 "Winding 1 voltage";
        parameter Modelica.Units.SI.Voltage Winding2Voltage = 6.5e3 "Winding 2 voltage";
        parameter Real WindingR_pu=0.00375 "Winding resisrance in pu";
        parameter Real WindingX_pu=0.15 "Winding reactance in pu";
        parameter Real D = 0.9 "Winding impedance on winding 1";

        parameter Real Zbase1 = Winding1Voltage^2/Sbase;
        parameter Real Zbase2 = Winding2Voltage^2/Sbase;
        parameter Real Ratio =  Winding2Voltage/(Winding1Voltage);

        parameter Modelica.Units.SI.Resistance Rp = D*WindingR_pu*Zbase1;
        parameter Modelica.Units.SI.Inductance Lp = D*WindingX_pu*Zbase1/(2*Modelica.Constants.pi*f);

        parameter Modelica.Units.SI.Resistance Rs = 2*(1-D)*WindingR_pu*Zbase2;
        parameter Modelica.Units.SI.Inductance Ls = 2*(1-D)*WindingX_pu*Zbase2/(2*Modelica.Constants.pi*f);
        Modelica.Electrical.Analog.Interfaces.Pin Cy
          annotation (Placement(transformation(extent={{-108,50},{-88,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin By
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin Ay
          annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Interfaces.Pin Cd
          annotation (Placement(transformation(extent={{90,50},{110,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin Bd
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin Ad
          annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
        parameter SI.Resistance GroundingResistance=1e9
          "Resistance at temperature T_ref";
        parameter SI.Resistance Rtf_delta=0.5 "Resistance at temperature T_ref";
        TFsubcircuitZeroZsec tFsubcircuitZeroZsec(
          n=35.38,
          Lp=0.19,
          Rp=1.8)
          annotation (Placement(transformation(extent={{-10,40},{10,60}})));
        TFsubcircuitZeroZsec tFsubcircuitZeroZsec1(
          n=35.38,
          Lp=0.19,
          Rp=1.8)
          annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
        TFsubcircuitZeroZsec tFsubcircuitZeroZsec2(
          n=35.38,
          Lp=0.19,
          Rp=1.8)
          annotation (Placement(transformation(extent={{-10,-80},{10,-60}})));
        Modelica.Electrical.Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-24,-108},{-4,-88}})));
        Modelica.Electrical.Analog.Sensors.VoltageSensor VSecABLL annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={70,32})));
        Modelica.Electrical.Analog.Sensors.VoltageSensor VPrimABLL annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-54,32})));
      equation
        connect(Bd, Bd) annotation (Line(points={{100,0},{100,0}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_p1, Cd)
          annotation (Line(points={{10,60},{100,60}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_p, Cy)
          annotation (Line(points={{-10,60},{-98,60}}, color={0,0,255}));
        connect(By, tFsubcircuitZeroZsec1.pin_p)
          annotation (Line(points={{-100,0},{-10,0}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec1.pin_p1, Bd)
          annotation (Line(points={{10,0},{100,0}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec2.pin_p1, Ad)
          annotation (Line(points={{10,-60},{100,-60}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec2.pin_p, Ay)
          annotation (Line(points={{-10,-60},{-100,-60}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_n, tFsubcircuitZeroZsec1.pin_n)
          annotation (Line(points={{-10,40},{-14,40},{-14,-20},{-10,-20}},
              color={0,0,255}));
        connect(tFsubcircuitZeroZsec2.pin_n, tFsubcircuitZeroZsec1.pin_n)
          annotation (Line(points={{-10,-80},{-14,-80},{-14,-20},{-10,-20}},
              color={0,0,255}));
        connect(tFsubcircuitZeroZsec2.pin_n, ground.p) annotation (Line(points=
                {{-10,-80},{-14,-80},{-14,-88}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_n1, Bd) annotation (Line(points={{10,
                40},{20,40},{20,0},{100,0}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec1.pin_n1, Ad) annotation (Line(points={{10,
                -20},{20,-20},{20,-60},{100,-60}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec2.pin_n1, Cd) annotation (Line(points={{10,
                -80},{40,-80},{40,60},{100,60}}, color={0,0,255}));
        connect(VSecABLL.p, Cd) annotation (Line(points={{70,42},{70,60},{100,
                60}}, color={0,0,255}));
        connect(VSecABLL.n, Bd)
          annotation (Line(points={{70,22},{70,0},{100,0}}, color={0,0,255}));
        connect(VPrimABLL.p, Cy) annotation (Line(points={{-54,42},{-54,60},{
                -98,60}}, color={0,0,255}));
        connect(VPrimABLL.n, tFsubcircuitZeroZsec1.pin_p) annotation (Line(
              points={{-54,22},{-54,0},{-10,0}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Ellipse(
                extent={{-80,46},{10,-44}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Ellipse(
                extent={{-10,46},{80,-44}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Line(
                points={{-40,12}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{34,-12},{54,0}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{34,-12},{34,12}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{34,12},{54,0}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-40,0},{-40,24}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-40,0},{-20,-12}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-60,-12},{-40,0}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{-40,0},{-28,0}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-28,0},{-28,-18}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-38,-18},{-20,-18},{-22,-18}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-34,-22},{-22,-22}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-32,-26},{-24,-26}},
                color={0,0,0},
                thickness=0.5),
              Text(
                extent={{-50,44},{-24,20}},
                textColor={0,0,0},
                textString="1"),
              Text(
                extent={{22,44},{48,20}},
                textColor={0,0,0},
                textString="2"),
              Line(
                points={{-98,60}},
                color={28,108,200},
                thickness=0.5),
              Line(points={{-98,62}}, color={0,140,72}),
              Line(
                points={{-96,60},{-80,60},{-60,38}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{98,60},{80,60},{60,38}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-88,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,0},{-80,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{88,0},{80,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,-60},{-80,-60},{-58,-38}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{88,-60},{80,-60},{58,-38}},
                color={238,46,47},
                thickness=0.5)}), Diagram(coordinateSystem(preserveAspectRatio=false)));
      end EMTPtransformerMod;

      model EMTPtransformerZeroSeq
        parameter Modelica.Units.SI.ApparentPower Sbase = 1e8;
        parameter Modelica.Units.SI.Frequency f = 60 "Grid nominal frequency";
        parameter Modelica.Units.SI.Frequency f_cut = 1000 "Transformer cutoff frequency";
        parameter Modelica.Units.SI.Voltage Winding1Voltage = 230e3 "Winding 1 voltage";
        parameter Modelica.Units.SI.Voltage Winding2Voltage = 6.5e3 "Winding 2 voltage";
        parameter Real WindingR_pu=0.00375 "Winding resisrance in pu";
        parameter Real WindingX_pu=0.15 "Winding reactance in pu";
        parameter Real D = 0.9 "Winding impedance on winding 1";

        parameter Real Zbase1 = Winding1Voltage^2/Sbase;
        parameter Real Zbase2 = Winding2Voltage^2/Sbase;
        parameter Real Ratio =  sqrt(3)*Winding2Voltage/(Winding1Voltage);

        parameter Modelica.Units.SI.Resistance Rp = D*WindingR_pu*Zbase1;
        parameter Modelica.Units.SI.Inductance Lp = D*WindingX_pu*Zbase1/(2*Modelica.Constants.pi*f);

        parameter Modelica.Units.SI.Resistance Rs = 2*(1-D)*WindingR_pu*Zbase2;
        parameter Modelica.Units.SI.Inductance Ls = 2*(1-D)*WindingX_pu*Zbase2/(2*Modelica.Constants.pi*f);
        Modelica.Electrical.Analog.Interfaces.Pin Cy
          annotation (Placement(transformation(extent={{-108,50},{-88,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin By
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin Ay
          annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Interfaces.Pin Cd
          annotation (Placement(transformation(extent={{170,50},{190,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin Bd
          annotation (Placement(transformation(extent={{170,-10},{190,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin Ad
          annotation (Placement(transformation(extent={{170,-70},{190,-50}})));
        TFsubcircuitZeroZsec
                     tFsubcircuitZeroZsec(
          n=Ratio,
          Lp=Lp,
          Rp=Rp,
          Ls=Ls,
          Rs=Rs,
          f_cut=f_cut)
                 annotation (Placement(transformation(extent={{-10,40},{10,60}})));
        TFsubcircuitZeroZsec
                     tFsubcircuitZeroZsec1(
          n=Ratio,
          Lp=Lp,
          Rp=Rp,
          Ls=Ls,
          Rs=Rs,
          f_cut=f_cut)
                 annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
        TFsubcircuitZeroZsec
                     tFsubcircuitZeroZsec2(
          n=Ratio,
          Lp=Lp,
          Rp=Rp,
          Ls=Ls,
          Rs=Rs,
          f_cut=f_cut)
                 annotation (Placement(transformation(extent={{-10,-80},{10,-60}})));
        Modelica.Electrical.Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-46,-100},{-26,-80}})));
        parameter SI.Resistance GroundingResistance=1e9
          "Resistance at temperature T_ref";
        Modelica.Electrical.Analog.Sensors.VoltageSensor VPrimABLL annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-70,-30})));
        parameter SI.Resistance Rtf_delta=0.5 "Resistance at temperature T_ref";
        Modelica.Electrical.Analog.Basic.Resistor Rcb(R=Rtf_delta) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={16,20})));
        Modelica.Electrical.Analog.Basic.Resistor Rba(R=Rtf_delta) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={16,-38})));
        Modelica.Electrical.Analog.Basic.Resistor Rac(R=Rtf_delta) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={32,-38})));
        Modelica.Electrical.Analog.Sensors.VoltageSensor VSecABLL annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={56,-38})));
        Modelica.Electrical.Analog.Sensors.VoltageSensor VSecBCLL1
                                                                  annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={56,32})));
        Modelica.Electrical.Analog.Sensors.VoltageSensor VSecABLL1
                                                                  annotation (
            Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={74,-14})));
        Modelica.Blocks.Math.Add3 VabcSum
          annotation (Placement(transformation(extent={{102,14},{122,34}})));
        Modelica.Electrical.Analog.Sensors.CurrentSensor Bcurrent
          annotation (Placement(transformation(extent={{132,-10},{152,10}})));
      equation
        connect(Cy, tFsubcircuitZeroZsec.pin_p)
          annotation (Line(points={{-98,60},{-10,60}}, color={0,0,255}));
        connect(By, tFsubcircuitZeroZsec1.pin_p)
          annotation (Line(points={{-100,0},{-10,0}}, color={0,0,255}));
        connect(Ay, tFsubcircuitZeroZsec2.pin_p)
          annotation (Line(points={{-100,-60},{-10,-60}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec1.pin_n, tFsubcircuitZeroZsec2.pin_n)
          annotation (Line(points={{-10,-20},{-36,-20},{-36,-80},{-10,-80}},
              color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_n, tFsubcircuitZeroZsec1.pin_n)
          annotation (Line(points={{-10,40},{-36,40},{-36,-20},{-10,-20}},
              color={0,0,255}));
        connect(tFsubcircuitZeroZsec1.pin_n, ground.p) annotation (Line(points=
                {{-10,-20},{-36,-20},{-36,-80}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_p1, Cd)
          annotation (Line(points={{10,60},{180,60}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec2.pin_p1, Ad)
          annotation (Line(points={{10,-60},{180,-60}}, color={0,0,255}));
        connect(Bd, Bd) annotation (Line(points={{180,0},{180,0}}, color={0,0,255}));
        connect(VPrimABLL.p, tFsubcircuitZeroZsec2.pin_p) annotation (Line(
              points={{-70,-40},{-70,-60},{-10,-60}}, color={0,0,255}));
        connect(VPrimABLL.n, tFsubcircuitZeroZsec1.pin_p) annotation (Line(
              points={{-70,-20},{-70,0},{-10,0}}, color={0,0,255}));
        connect(VSecABLL.p, Ad) annotation (Line(points={{56,-48},{56,-60},{180,
                -60}}, color={0,0,255}));
        connect(VSecBCLL1.n, Cd) annotation (Line(points={{56,42},{56,60},{180,
                60}}, color={0,0,255}));
        connect(VSecABLL1.p, Cd) annotation (Line(points={{74,-4},{74,60},{180,
                60}}, color={0,0,255}));
        connect(VSecABLL1.n, Ad) annotation (Line(points={{74,-24},{74,-60},{
                180,-60}}, color={0,0,255}));
        connect(VSecBCLL1.v, VabcSum.u1)
          annotation (Line(points={{67,32},{100,32}}, color={0,0,127}));
        connect(VSecABLL1.v, VabcSum.u2) annotation (Line(points={{85,-14},{86,
                -14},{86,24},{100,24}}, color={0,0,127}));
        connect(VSecABLL.v, VabcSum.u3) annotation (Line(points={{67,-38},{92,
                -38},{92,16},{100,16}}, color={0,0,127}));
        connect(tFsubcircuitZeroZsec1.pin_n1, Rba.n) annotation (Line(points={{
                10,-20},{16,-20},{16,-28}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_n1, Rcb.n)
          annotation (Line(points={{10,40},{16,40},{16,30}}, color={0,0,255}));
        connect(Rba.p, Ad) annotation (Line(points={{16,-48},{16,-60},{180,-60}},
              color={0,0,255}));
        connect(Rac.p, tFsubcircuitZeroZsec2.pin_n1) annotation (Line(points={{
                32,-48},{32,-80},{10,-80}}, color={0,0,255}));
        connect(Rac.n, Cd) annotation (Line(points={{32,-28},{34,-28},{34,60},{
                180,60}}, color={0,0,255}));
        connect(Bcurrent.p, tFsubcircuitZeroZsec1.pin_p1)
          annotation (Line(points={{132,0},{10,0}}, color={0,0,255}));
        connect(Bcurrent.n, Bd)
          annotation (Line(points={{152,0},{180,0}}, color={0,0,255}));
        connect(Rcb.p, tFsubcircuitZeroZsec1.pin_p1)
          annotation (Line(points={{16,10},{16,0},{10,0}}, color={0,0,255}));
        connect(VSecBCLL1.p, tFsubcircuitZeroZsec1.pin_p1)
          annotation (Line(points={{56,22},{56,0},{10,0}}, color={0,0,255}));
        connect(VSecABLL.n, tFsubcircuitZeroZsec1.pin_p1)
          annotation (Line(points={{56,-28},{56,0},{10,0}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                  -100,-100},{180,100}}),                             graphics={
              Ellipse(
                extent={{-80,46},{10,-44}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Ellipse(
                extent={{-10,46},{80,-44}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Line(
                points={{-40,12}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{34,-12},{54,0}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{34,-12},{34,12}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{34,12},{54,0}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-40,0},{-40,24}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-40,0},{-20,-12}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-60,-12},{-40,0}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{-40,0},{-28,0}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-28,0},{-28,-18}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-38,-18},{-20,-18},{-22,-18}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-34,-22},{-22,-22}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-32,-26},{-24,-26}},
                color={0,0,0},
                thickness=0.5),
              Text(
                extent={{-50,44},{-24,20}},
                textColor={0,0,0},
                textString="1"),
              Text(
                extent={{22,44},{48,20}},
                textColor={0,0,0},
                textString="2"),
              Line(
                points={{-98,60}},
                color={28,108,200},
                thickness=0.5),
              Line(points={{-98,62}}, color={0,140,72}),
              Line(
                points={{-96,60},{-80,60},{-60,38}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{184,60},{80,60},{60,38}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-88,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,0},{-80,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{180,0},{80,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,-60},{-80,-60},{-58,-38}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{182,-60},{80,-60},{58,-38}},
                color={238,46,47},
                thickness=0.5)}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={
                  {-100,-100},{180,100}})));
      end EMTPtransformerZeroSeq;

      model TFsubcircuit
        tools.NoneIdealTransformer                        noneIdealTransformer(
                                                                      n=1/n, f_cut=
              f_cut)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
          annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_p1
          annotation (Placement(transformation(extent={{90,90},{110,110}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
          annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_n1
          annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
        Modelica.Electrical.Analog.Basic.Inductor L1(L=Lp)
          annotation (Placement(transformation(extent={{-72,50},{-52,70}})));
        Modelica.Electrical.Analog.Basic.Inductor L2(L=Ls)
          annotation (Placement(transformation(extent={{28,50},{48,70}})));
        Modelica.Electrical.Analog.Basic.Resistor R1(R=Rp)
          annotation (Placement(transformation(extent={{-46,50},{-26,70}})));
        Modelica.Electrical.Analog.Basic.Resistor R2(R=Rs)
          annotation (Placement(transformation(extent={{54,50},{74,70}})));
        parameter Real n =1 "Turns ratio primary:secondary voltage";
        parameter SI.Inductance Lp =1 "Inductance on winding 1";
        parameter SI.Resistance Rp =1 "Resistance at temperature T_ref on winding 1";
        parameter SI.Inductance Ls =1 "Inductance on winding 2";
        parameter SI.Resistance Rs =1 "Resistance at temperature T_ref on winding 2";

        parameter SI.Frequency f_cut=1000 "Cut-off frequency";
      equation
        connect(L1.n, R1.p)
          annotation (Line(points={{-52,60},{-46,60}}, color={0,0,255}));
        connect(L2.n, R2.p)
          annotation (Line(points={{48,60},{54,60}}, color={0,0,255}));
        connect(L2.p, noneIdealTransformer.p2)
          annotation (Line(points={{28,60},{10,60},{10,10}}, color={0,0,255}));
        connect(R1.n, noneIdealTransformer.p1)
          annotation (Line(points={{-26,60},{-10,60},{-10,10}}, color={0,0,255}));
        connect(L1.p, pin_p) annotation (Line(points={{-72,60},{-86,60},{-86,100},{-100,
                100}}, color={0,0,255}));
        connect(R2.n, pin_p1) annotation (Line(points={{74,60},{88,60},{88,100},{100,100}},
              color={0,0,255}));
        connect(noneIdealTransformer.n1, pin_n) annotation (Line(points={{-10,-10},{-54,
                -10},{-54,-100},{-100,-100}}, color={0,0,255}));
        connect(noneIdealTransformer.n2, pin_n1) annotation (Line(points={{10,-10},{56,
                -10},{56,-100},{100,-100}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Line(
                points={{-100,100},{-80,100}},
                color={28,108,200},
                thickness=0.5),
              Rectangle(
                extent={{-80,106},{-52,94}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Rectangle(
                extent={{52,106},{80,94}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Line(
                points={{80,100},{100,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-52,100},{-20,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,100},{52,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-2,100},{-2,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{2,100},{2,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,-100},{-20,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-100},{90,-100}},
                color={28,108,200},
                thickness=0.5),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,90},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,70},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,50},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,30},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,10},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-10},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-30},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-50},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-70},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-90},
                rotation=90),
              Line(
                points={{-20,80},{-26,80}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,60},{-26,60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,40},{-26,40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,20},{-26,20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,0},{-26,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-20},{-26,-20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-40},{-26,-40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-60},{-26,-60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-80},{-26,-80}},
                color={28,108,200},
                thickness=0.5),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,90},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,70},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,50},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,30},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,10},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-10},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-30},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-50},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-70},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-90},
                rotation=90),
              Line(
                points={{20,80},{26,80}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,60},{26,60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,40},{26,40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,20},{26,20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,0},{26,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-20},{26,-20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-40},{26,-40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-60},{26,-60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-80},{26,-80}},
                color={28,108,200},
                thickness=0.5),
              Text(
                extent={{-76,22},{-48,-22}},
                textColor={28,108,200},
                textString="1"),
              Text(
                extent={{44,22},{72,-22}},
                textColor={28,108,200},
                textString="2"),
              Text(
                extent={{-82,104},{-40,46}},
                textColor={28,108,200},
                textString="Zp"),
              Text(
                extent={{52,104},{92,48}},
                textColor={28,108,200},
                textString="Zs")}),                                    Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end TFsubcircuit;

      model TFsubcircuitZeroZsec
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
          annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_p1
          annotation (Placement(transformation(extent={{90,90},{110,110}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
          annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_n1
          annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
        Modelica.Electrical.Analog.Basic.Inductor L1(L=Lp)
          annotation (Placement(transformation(extent={{-72,50},{-52,70}})));
        Modelica.Electrical.Analog.Basic.Resistor R1(R=Rp)
          annotation (Placement(transformation(extent={{-46,50},{-26,70}})));
        parameter Real n =1 "Turns ratio primary:secondary voltage";
        parameter SI.Inductance Lp =1 "Inductance on winding 1";
        parameter SI.Resistance Rp =1 "Resistance at temperature T_ref on winding 1";
        parameter SI.Inductance Ls =1 "Inductance on winding 2";
        parameter SI.Resistance Rs =1 "Resistance at temperature T_ref on winding 2";

        parameter SI.Frequency f_cut=1000 "Cut-off frequency";
        tools.NoneIdealTransformer noneIdealTransformer(n=1/n, f_cut=f_cut)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
      equation
        connect(L1.n, R1.p)
          annotation (Line(points={{-52,60},{-46,60}}, color={0,0,255}));
        connect(L1.p, pin_p) annotation (Line(points={{-72,60},{-86,60},{-86,100},{-100,
                100}}, color={0,0,255}));
        connect(noneIdealTransformer.p1, R1.n) annotation (Line(points={{-10,10},
                {-14,10},{-14,60},{-26,60}}, color={0,0,255}));
        connect(noneIdealTransformer.n1, pin_n) annotation (Line(points={{-10,
                -10},{-56,-10},{-56,-100},{-100,-100}}, color={0,0,255}));
        connect(noneIdealTransformer.n2, pin_n1) annotation (Line(points={{10,
                -10},{56,-10},{56,-100},{100,-100}}, color={0,0,255}));
        connect(noneIdealTransformer.p2, pin_p1) annotation (Line(points={{10,
                10},{56,10},{56,100},{100,100}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Line(
                points={{-100,100},{-80,100}},
                color={28,108,200},
                thickness=0.5),
              Rectangle(
                extent={{-80,106},{-52,94}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Line(
                points={{80,100},{100,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-52,100},{-20,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,100},{80,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-2,100},{-2,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{2,100},{2,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,-100},{-20,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-100},{90,-100}},
                color={28,108,200},
                thickness=0.5),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,90},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,70},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,50},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,30},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,10},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-10},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-30},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-50},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-70},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-90},
                rotation=90),
              Line(
                points={{-20,80},{-26,80}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,60},{-26,60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,40},{-26,40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,20},{-26,20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,0},{-26,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-20},{-26,-20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-40},{-26,-40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-60},{-26,-60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-80},{-26,-80}},
                color={28,108,200},
                thickness=0.5),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,90},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,70},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,50},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,30},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,10},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-10},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-30},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-50},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-70},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-90},
                rotation=90),
              Line(
                points={{20,80},{26,80}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,60},{26,60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,40},{26,40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,20},{26,20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,0},{26,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-20},{26,-20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-40},{26,-40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-60},{26,-60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-80},{26,-80}},
                color={28,108,200},
                thickness=0.5),
              Text(
                extent={{-76,22},{-48,-22}},
                textColor={28,108,200},
                textString="1"),
              Text(
                extent={{44,22},{72,-22}},
                textColor={28,108,200},
                textString="2"),
              Text(
                extent={{-82,104},{-40,46}},
                textColor={28,108,200},
                textString="Zp"),
              Text(
                extent={{52,104},{92,48}},
                textColor={28,108,200},
                textString="Zs")}),                                    Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end TFsubcircuitZeroZsec;

      model TFsubcircuitEmulation
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
          annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_p1
          annotation (Placement(transformation(extent={{90,90},{110,110}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
          annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_n1
          annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
        Modelica.Electrical.Analog.Basic.Inductor L1(L=Lp)
          annotation (Placement(transformation(extent={{-72,50},{-52,70}})));
        Modelica.Electrical.Analog.Basic.Resistor R1(R=Rp)
          annotation (Placement(transformation(extent={{-46,50},{-26,70}})));
        parameter Real n =1 "Turns ratio primary:secondary voltage";
        parameter SI.Inductance Lp =1 "Inductance on winding 1";
        parameter SI.Resistance Rp =1 "Resistance at temperature T_ref on winding 1";
        parameter SI.Inductance Ls =1 "Inductance on winding 2";
        parameter SI.Resistance Rs =1 "Resistance at temperature T_ref on winding 2";

        parameter SI.Frequency f_cut=1000 "Cut-off frequency";
        tools.NoneIdealTransformer_Emulation noneIdealTransformer_Emulation(n=1
              /n, f_cut=f_cut)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Modelica.Blocks.Interfaces.RealInput PhaseVin annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,100})));
      equation
        connect(L1.n, R1.p)
          annotation (Line(points={{-52,60},{-46,60}}, color={0,0,255}));
        connect(L1.p, pin_p) annotation (Line(points={{-72,60},{-86,60},{-86,100},{-100,
                100}}, color={0,0,255}));
        connect(noneIdealTransformer_Emulation.p1, R1.n) annotation (Line(
              points={{-10,10},{-14,10},{-14,60},{-26,60}}, color={0,0,255}));
        connect(noneIdealTransformer_Emulation.n1, pin_n) annotation (Line(
              points={{-10,-10},{-56,-10},{-56,-100},{-100,-100}}, color={0,0,
                255}));
        connect(noneIdealTransformer_Emulation.n2, pin_n1) annotation (Line(
              points={{10,-10},{56,-10},{56,-100},{100,-100}}, color={0,0,255}));
        connect(noneIdealTransformer_Emulation.p2, pin_p1) annotation (Line(
              points={{10,10},{56,10},{56,100},{100,100}}, color={0,0,255}));
        connect(PhaseVin, noneIdealTransformer_Emulation.PhaseVin)
          annotation (Line(points={{0,100},{0,10}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Line(
                points={{-100,100},{-80,100}},
                color={28,108,200},
                thickness=0.5),
              Rectangle(
                extent={{-80,106},{-52,94}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Line(
                points={{80,100},{100,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-52,100},{-20,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,100},{80,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-2,100},{-2,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{2,100},{2,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,-100},{-20,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-100},{90,-100}},
                color={28,108,200},
                thickness=0.5),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,90},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,70},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,50},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,30},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,10},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-10},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-30},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-50},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-70},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-90},
                rotation=90),
              Line(
                points={{-20,80},{-26,80}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,60},{-26,60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,40},{-26,40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,20},{-26,20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,0},{-26,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-20},{-26,-20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-40},{-26,-40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-60},{-26,-60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-80},{-26,-80}},
                color={28,108,200},
                thickness=0.5),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,90},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,70},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,50},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,30},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,10},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-10},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-30},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-50},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-70},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-90},
                rotation=90),
              Line(
                points={{20,80},{26,80}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,60},{26,60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,40},{26,40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,20},{26,20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,0},{26,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-20},{26,-20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-40},{26,-40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-60},{26,-60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-80},{26,-80}},
                color={28,108,200},
                thickness=0.5),
              Text(
                extent={{-76,22},{-48,-22}},
                textColor={28,108,200},
                textString="1"),
              Text(
                extent={{44,22},{72,-22}},
                textColor={28,108,200},
                textString="2"),
              Text(
                extent={{-82,104},{-40,46}},
                textColor={28,108,200},
                textString="Zp"),
              Text(
                extent={{52,104},{92,48}},
                textColor={28,108,200},
                textString="Zs")}),                                    Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end TFsubcircuitEmulation;

      package GridComponentsTest

        model EMTPGridTest
          EMTPGrid eMTPGrid
            annotation (Placement(transformation(extent={{12,-20},{52,20}})));
          ShortFault shortFault(line_capacitance=1e-6)
            annotation (Placement(transformation(extent={{-48,-28},{-8,20}})));
        equation
          connect(shortFault.C_n, eMTPGrid.C)
            annotation (Line(points={{-8,13.1429},{2,13.1429},{2,12},{12,12}},
                                                       color={0,0,255}));
          connect(shortFault.B_n, eMTPGrid.B)
            annotation (Line(points={{-8,2.85714},{2,2.85714},{2,0},{12,0}},
                                                     color={0,0,255}));
          connect(shortFault.A_n, eMTPGrid.A)
            annotation (Line(points={{-8,-7.42857},{2,-7.42857},{2,-12},{12,-12}},
                                                         color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false)),
            Diagram(coordinateSystem(preserveAspectRatio=false)),
            experiment(
              StopTime=10,
              Interval=1e-05,
              __Dymola_fixedstepsize=1e-05,
              __Dymola_Algorithm="Euler"));
        end EMTPGridTest;

        model EMTPTransTest
          EMTPGrid eMTPGrid(Vbase=230000)
            annotation (Placement(transformation(extent={{60,-18},{100,22}})));
          ShortFault shortFault(line_capacitance=1e-6)
            annotation (Placement(transformation(extent={{40,-26},{0,22}})));
          EMTPtransformer eMTPtransformer(f_cut=300)
            annotation (Placement(transformation(extent={{-14,-18},{-54,22}})));
          Line_R line_R(Resistance=1000) annotation (Placement(transformation(
                  extent={{-112,-18},{-72,22}})));
          Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(
                transformation(extent={{-130,-30},{-110,-10}})));
        equation
          connect(line_R.n, eMTPtransformer.Bd)
            annotation (Line(points={{-72,2},{-54,2}},  color={0,0,255}));
          connect(eMTPtransformer.Ad, line_R.n1)
            annotation (Line(points={{-54,-10},{-72,-10}},  color={0,0,255}));
          connect(eMTPtransformer.Cd, line_R.n2)
            annotation (Line(points={{-54,14},{-72,14}},  color={0,0,255}));
          connect(line_R.p1, line_R.p2) annotation (Line(points={{-112,-10},{
                  -120,-10},{-120,14},{-112,14}}, color={0,0,255}));
          connect(line_R.p, line_R.p2) annotation (Line(points={{-112,2},{-120,
                  2},{-120,14},{-112,14}}, color={0,0,255}));
          connect(line_R.p1, ground.p)
            annotation (Line(points={{-112,-10},{-120,-10}}, color={0,0,255}));
          connect(shortFault.C, eMTPGrid.C)
            annotation (Line(points={{40,15.1429},{50,15.1429},{50,14},{60,14}},
                                                       color={0,0,255}));
          connect(shortFault.B, eMTPGrid.B)
            annotation (Line(points={{40,4.85714},{50,4.85714},{50,2},{60,2}},
                                                     color={0,0,255}));
          connect(shortFault.A, eMTPGrid.A)
            annotation (Line(points={{40,-5.42857},{50,-5.42857},{50,-10},{60,
                  -10}},                                 color={0,0,255}));
          connect(eMTPtransformer.Cy, shortFault.C_n)
            annotation (Line(points={{-14.4,14},{-8,14},{-8,15.1429},{0,15.1429}},
                                                         color={0,0,255}));
          connect(eMTPtransformer.By, shortFault.B_n)
            annotation (Line(points={{-14,2},{-8,2},{-8,4.85714},{0,4.85714}},
                                                     color={0,0,255}));
          connect(eMTPtransformer.Ay, shortFault.A_n)
            annotation (Line(points={{-14,-10},{-8,-10},{-8,-5.42857},{0,
                  -5.42857}},                            color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},
                    {140,100}})),
            Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,
                    -100},{140,100}})),
            experiment(
              StopTime=10,
              Interval=1e-05,
              __Dymola_fixedstepsize=1e-05,
              __Dymola_Algorithm="Euler"));
        end EMTPTransTest;

        model SmoothSwitchTest
          tools.SmoothSwitch smoothSwitch
            annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
          Modelica.Blocks.Sources.BooleanPulse booleanPulse(period=1)
            annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
          Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V=10, f=60)
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={48,-10})));
          Modelica.Electrical.Analog.Basic.Resistor resistor(R=10) annotation (
              Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={0,-30})));
          Modelica.Electrical.Analog.Basic.Ground ground
            annotation (Placement(transformation(extent={{-10,-64},{10,-44}})));
          Modelica.Electrical.Analog.Basic.Inductor inductor(L=1)
            annotation (Placement(transformation(extent={{14,10},{34,30}})));
        equation
          connect(booleanPulse.y, smoothSwitch.u)
            annotation (Line(points={{-59,0},{-10,0}}, color={255,0,255}));
          connect(resistor.p, smoothSwitch.pin1)
            annotation (Line(points={{0,-20},{0,-10}}, color={0,0,255}));
          connect(resistor.n, sineVoltage.n) annotation (Line(points={{0,-40},{
                  0,-44},{48,-44},{48,-20}}, color={0,0,255}));
          connect(resistor.n, ground.p)
            annotation (Line(points={{0,-40},{0,-44}}, color={0,0,255}));
          connect(smoothSwitch.pin, inductor.p)
            annotation (Line(points={{0,10},{0,20},{14,20}}, color={0,0,255}));
          connect(inductor.n, sineVoltage.p) annotation (Line(points={{34,20},{
                  48,20},{48,0}}, color={0,0,255}));
          annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
              Diagram(coordinateSystem(preserveAspectRatio=false)));
        end SmoothSwitchTest;

        model SmoothEMTPTransTest
          EMTPGrid eMTPGrid(Vbase=230000)
            annotation (Placement(transformation(extent={{60,-18},{100,22}})));
          EMTPtransformer eMTPtransformer(
            f_cut=300,
            GroundingResistance=1e3,
            Rtf_delta=100)
            annotation (Placement(transformation(extent={{-14,-18},{-54,22}})));
          Line_R line_R(Resistance=100)  annotation (Placement(transformation(
                  extent={{-112,-18},{-72,22}})));
          Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(
                transformation(extent={{-130,-30},{-110,-10}})));
          SmoothShortFault smoothShortFault(f_cut=100)
            annotation (Placement(transformation(extent={{46,-26},{2,22}})));
        equation
          connect(line_R.n, eMTPtransformer.Bd)
            annotation (Line(points={{-72,2},{-54,2}},  color={0,0,255}));
          connect(eMTPtransformer.Ad, line_R.n1)
            annotation (Line(points={{-54,-10},{-72,-10}},  color={0,0,255}));
          connect(eMTPtransformer.Cd, line_R.n2)
            annotation (Line(points={{-54,14},{-72,14}},  color={0,0,255}));
          connect(line_R.p1, line_R.p2) annotation (Line(points={{-112,-10},{
                  -120,-10},{-120,14},{-112,14}}, color={0,0,255}));
          connect(line_R.p, line_R.p2) annotation (Line(points={{-112,2},{-120,
                  2},{-120,14},{-112,14}}, color={0,0,255}));
          connect(line_R.p1, ground.p)
            annotation (Line(points={{-112,-10},{-120,-10}}, color={0,0,255}));
          connect(smoothShortFault.C, eMTPGrid.C)
            annotation (Line(points={{46,14},{60,14}}, color={0,0,255}));
          connect(smoothShortFault.B, eMTPGrid.B)
            annotation (Line(points={{46,2},{60,2}}, color={0,0,255}));
          connect(smoothShortFault.A, eMTPGrid.A)
            annotation (Line(points={{46,-10},{60,-10}}, color={0,0,255}));
          connect(eMTPtransformer.Cy, smoothShortFault.C_n)
            annotation (Line(points={{-14.4,14},{2,14}}, color={0,0,255}));
          connect(smoothShortFault.B_n, eMTPtransformer.By)
            annotation (Line(points={{2,2},{-14,2}}, color={0,0,255}));
          connect(eMTPtransformer.Ay, smoothShortFault.A_n)
            annotation (Line(points={{-14,-10},{2,-10}}, color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},
                    {140,100}})),
            Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,
                    -100},{140,100}})),
            experiment(
              StopTime=0.003,
              __Dymola_NumberOfIntervals=100000,
              __Dymola_fixedstepsize=1e-05,
              __Dymola_Algorithm="Euler"));
        end SmoothEMTPTransTest;

        model SmoothEMTPGridTest
          EMTPGrid eMTPGrid(Vbase=230000)
            annotation (Placement(transformation(extent={{12,-20},{52,20}})));
          SmoothShortFault smoothShortFault(
            faultDuration=0.03,             f_cut=100, threshold=0.5)
            annotation (Placement(transformation(extent={{-40,-28},{0,20}})));
        equation
          connect(smoothShortFault.C_n, eMTPGrid.C)
            annotation (Line(points={{0,12},{12,12}}, color={0,0,255}));
          connect(smoothShortFault.B_n, eMTPGrid.B)
            annotation (Line(points={{0,0},{12,0}}, color={0,0,255}));
          connect(smoothShortFault.A_n, eMTPGrid.A)
            annotation (Line(points={{0,-12},{12,-12}}, color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false)),
            Diagram(coordinateSystem(preserveAspectRatio=false)),
            experiment(
              StopTime=10,
              Interval=0.0001,
              __Dymola_fixedstepsize=1e-05,
              __Dymola_Algorithm="Euler"));
        end SmoothEMTPGridTest;

        model TFsubCircuitTest
          TFsubcircuitZeroZsec tFsubcircuitZeroZsec(
            n=10,
            Lp=0.19,
            Rp=1.8,
            Ls=0,
            Rs=0,
            f_cut=1000) annotation (Placement(transformation(extent={{-34,-30},
                    {-14,-10}})));
          Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(
                transformation(extent={{-54,-70},{-34,-50}})));
          Modelica.Electrical.Analog.Basic.Resistor resistor(R=100) annotation (
             Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={6,-22})));
          EMTPGrid eMTPGrid(Vbase=23)
            annotation (Placement(transformation(extent={{-102,-32},{-142,8}})));
        equation
          connect(tFsubcircuitZeroZsec.pin_n1, tFsubcircuitZeroZsec.pin_n)
            annotation (Line(points={{-14,-30},{-14,-42},{-34,-42},{-34,-30}},
                color={0,0,255}));
          connect(resistor.p, tFsubcircuitZeroZsec.pin_p1) annotation (Line(
                points={{6,-12},{6,-4},{-14,-4},{-14,-10}}, color={0,0,255}));
          connect(resistor.n, tFsubcircuitZeroZsec.pin_n) annotation (Line(
                points={{6,-32},{6,-42},{-34,-42},{-34,-30}}, color={0,0,255}));
          connect(eMTPGrid.A, tFsubcircuitZeroZsec.pin_p) annotation (Line(
                points={{-102,-24},{-40,-24},{-40,-10},{-34,-10}}, color={0,0,
                  255}));
          connect(eMTPGrid.B, ground.p) annotation (Line(points={{-102,-12},{
                  -86,-12},{-86,-36},{-44,-36},{-44,-50}}, color={0,0,255}));
          connect(eMTPGrid.C, ground.p) annotation (Line(points={{-102,0},{-72,
                  0},{-72,-44},{-64,-44},{-64,-50},{-44,-50}}, color={0,0,255}));
          connect(ground.p, tFsubcircuitZeroZsec.pin_n) annotation (Line(points
                ={{-44,-50},{-40,-50},{-40,-42},{-34,-42},{-34,-30}}, color={0,
                  0,255}));
          annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
              Diagram(coordinateSystem(preserveAspectRatio=false)));
        end TFsubCircuitTest;

        model EMTPTransModTest
          EMTPGrid eMTPGrid(Vbase=230000)
            annotation (Placement(transformation(extent={{16,-20},{56,20}})));
          Line_R line_R(Resistance=100)  annotation (Placement(transformation(
                  extent={{-114,-20},{-74,20}})));
          Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(
                transformation(extent={{-130,-32},{-110,-12}})));
          EMTPtransformerZeroSeq
                             eMTPtransformerZeroSeq(Winding2Voltage=110000,
              Rtf_delta=1)
            annotation (Placement(transformation(extent={{-10,-20},{-50,20}})));
        equation
          connect(line_R.p1, line_R.p2) annotation (Line(points={{-114,-12},{
                  -120,-12},{-120,12},{-114,12}}, color={0,0,255}));
          connect(line_R.p, line_R.p2) annotation (Line(points={{-114,0},{-120,
                  0},{-120,12},{-114,12}}, color={0,0,255}));
          connect(line_R.p1, ground.p)
            annotation (Line(points={{-114,-12},{-120,-12}}, color={0,0,255}));
          connect(eMTPtransformerZeroSeq.Cd, line_R.n2)
            annotation (Line(points={{-50,12},{-74,12}}, color={0,0,255}));
          connect(line_R.n, eMTPtransformerZeroSeq.Bd)
            annotation (Line(points={{-74,0},{-50,0}}, color={0,0,255}));
          connect(eMTPtransformerZeroSeq.Ad, line_R.n1)
            annotation (Line(points={{-50,-12},{-74,-12}}, color={0,0,255}));
          connect(eMTPtransformerZeroSeq.Cy, eMTPGrid.C)
            annotation (Line(points={{-10.2857,12},{16,12}}, color={0,0,255}));
          connect(eMTPGrid.B, eMTPtransformerZeroSeq.By)
            annotation (Line(points={{16,0},{-10,0}}, color={0,0,255}));
          connect(eMTPtransformerZeroSeq.Ay, eMTPGrid.A)
            annotation (Line(points={{-10,-12},{16,-12}}, color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},
                    {140,100}})),
            Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,
                    -100},{140,100}})),
            experiment(
              StopTime=0.003,
              __Dymola_NumberOfIntervals=100000,
              __Dymola_fixedstepsize=1e-05,
              __Dymola_Algorithm="Euler"));
        end EMTPTransModTest;

        model EMTPTransZeroSeqTest
          EMTPGrid eMTPGrid(Vbase=230000)
            annotation (Placement(transformation(extent={{34,-20},{74,20}})));
          Line_R line_R(Resistance=100)  annotation (Placement(transformation(
                  extent={{-114,-20},{-74,20}})));
          Modelica.Electrical.Analog.Basic.Ground ground
            annotation (Placement(transformation(extent={{-130,-32},{-110,-12}})));
          EMTPtransformerZeroSeq eMTPtransformerZeroSeq(
            Winding1Voltage=20000,
            Winding2Voltage=6000,
            Rtf_delta=2)
            annotation (Placement(transformation(extent={{4,-20},{-50,20}})));
        equation
          connect(line_R.p1, line_R.p2) annotation (Line(points={{-114,-12},{-120,-12},{
                  -120,12},{-114,12}},            color={0,0,255}));
          connect(line_R.p, line_R.p2) annotation (Line(points={{-114,0},{-120,0},{-120,
                  12},{-114,12}},          color={0,0,255}));
          connect(line_R.p1, ground.p)
            annotation (Line(points={{-114,-12},{-120,-12}}, color={0,0,255}));
          connect(eMTPtransformerZeroSeq.Cd, line_R.n2)
            annotation (Line(points={{-50,12},{-74,12}}, color={0,0,255}));
          connect(line_R.n, eMTPtransformerZeroSeq.Bd)
            annotation (Line(points={{-74,0},{-50,0}}, color={0,0,255}));
          connect(eMTPtransformerZeroSeq.Ad, line_R.n1)
            annotation (Line(points={{-50,-12},{-74,-12}}, color={0,0,255}));
          connect(eMTPtransformerZeroSeq.Cy, eMTPGrid.C)
            annotation (Line(points={{3.61429,12},{34,12}},
                                                          color={0,0,255}));
          connect(eMTPGrid.B, eMTPtransformerZeroSeq.By)
            annotation (Line(points={{34,0},{4,0}},   color={0,0,255}));
          connect(eMTPtransformerZeroSeq.Ay, eMTPGrid.A)
            annotation (Line(points={{4,-12},{34,-12}},   color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,100}})),
            Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,
                    100}})),
            experiment(
              StopTime=3,
              __Dymola_NumberOfIntervals=100000,
              __Dymola_fixedstepsize=1e-05,
              __Dymola_Algorithm="Euler"));
        end EMTPTransZeroSeqTest;

        model GridFStepTest
          GridFStep gridFStep
            annotation (Placement(transformation(extent={{0,-26},{54,28}})));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false)),
            Diagram(coordinateSystem(preserveAspectRatio=false)),
            experiment(
              StopTime=10,
              Interval=1e-05,
              __Dymola_fixedstepsize=1e-05,
              __Dymola_Algorithm="Euler"));
        end GridFStepTest;

        model GridTest
          EMTPGrid eMTPGrid(Vbase=230e3)
            annotation (Placement(transformation(extent={{-20,-20},{80,80}})));
          Modelica.Electrical.Analog.Sensors.VoltageSensor ab annotation (
              Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-48,14})));
          Modelica.Electrical.Analog.Sensors.VoltageSensor bc annotation (
              Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-48,46})));
          Modelica.Electrical.Analog.Sensors.VoltageSensor ca annotation (
              Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-72,30})));
        equation
          connect(ab.p, eMTPGrid.A) annotation (Line(points={{-48,4},{-48,0},{
                  -20,0}}, color={0,0,255}));
          connect(ab.n, eMTPGrid.B) annotation (Line(points={{-48,24},{-48,30},
                  {-20,30}}, color={0,0,255}));
          connect(bc.p, ab.n)
            annotation (Line(points={{-48,36},{-48,24}}, color={0,0,255}));
          connect(bc.n, eMTPGrid.C) annotation (Line(points={{-48,56},{-48,60},
                  {-20,60}}, color={0,0,255}));
          connect(ca.p, eMTPGrid.C) annotation (Line(points={{-72,40},{-72,60},
                  {-20,60}}, color={0,0,255}));
          connect(ca.n, eMTPGrid.A) annotation (Line(points={{-72,20},{-72,0},{
                  -20,0}}, color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false)),
            Diagram(coordinateSystem(preserveAspectRatio=false)),
            experiment(
              StopTime=10,
              Interval=1e-05,
              __Dymola_fixedstepsize=1e-05,
              __Dymola_Algorithm="Euler"));
        end GridTest;
      end GridComponentsTest;

      model EMTPtransformerZeroSeq_fig
        parameter Modelica.Units.SI.ApparentPower Sbase = 1e8;
        parameter Modelica.Units.SI.Frequency f = 60 "Grid nominal frequency";
        parameter Modelica.Units.SI.Frequency f_cut = 1000 "Transformer cutoff frequency";
        parameter Modelica.Units.SI.Voltage Winding1Voltage = 230e3 "Winding 1 voltage";
        parameter Modelica.Units.SI.Voltage Winding2Voltage = 6.5e3 "Winding 2 voltage";
        parameter Real WindingR_pu=0.00375 "Winding resisrance in pu";
        parameter Real WindingX_pu=0.15 "Winding reactance in pu";
        parameter Real D = 0.9 "Winding impedance on winding 1";

        parameter Real Zbase1 = Winding1Voltage^2/Sbase;
        parameter Real Zbase2 = Winding2Voltage^2/Sbase;
        parameter Real Ratio =  sqrt(3)*Winding2Voltage/(Winding1Voltage);

        parameter Modelica.Units.SI.Resistance Rp = D*WindingR_pu*Zbase1;
        parameter Modelica.Units.SI.Inductance Lp = D*WindingX_pu*Zbase1/(2*Modelica.Constants.pi*f);

        parameter Modelica.Units.SI.Resistance Rs = 2*(1-D)*WindingR_pu*Zbase2;
        parameter Modelica.Units.SI.Inductance Ls = 2*(1-D)*WindingX_pu*Zbase2/(2*Modelica.Constants.pi*f);
        Modelica.Electrical.Analog.Interfaces.Pin Cy
          annotation (Placement(transformation(extent={{-108,50},{-88,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin By
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin Ay
          annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Interfaces.Pin Cd
          annotation (Placement(transformation(extent={{90,50},{110,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin Bd
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin Ad
          annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
        TFsubcircuitZeroZsec
                     tFsubcircuitZeroZsec(
          n=Ratio,
          Lp=Lp,
          Rp=Rp,
          Ls=Ls,
          Rs=Rs,
          f_cut=f_cut)
                 annotation (Placement(transformation(extent={{-10,40},{10,60}})));
        TFsubcircuitZeroZsec
                     tFsubcircuitZeroZsec1(
          n=Ratio,
          Lp=Lp,
          Rp=Rp,
          Ls=Ls,
          Rs=Rs,
          f_cut=f_cut)
                 annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
        TFsubcircuitZeroZsec
                     tFsubcircuitZeroZsec2(
          n=Ratio,
          Lp=Lp,
          Rp=Rp,
          Ls=Ls,
          Rs=Rs,
          f_cut=f_cut)
                 annotation (Placement(transformation(extent={{-10,-80},{10,-60}})));
        Modelica.Electrical.Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-46,-100},{-26,-80}})));
        parameter SI.Resistance GroundingResistance=1e9
          "Resistance at temperature T_ref";
        parameter SI.Resistance Rtf_delta=0.5 "Resistance at temperature T_ref";
        Modelica.Electrical.Analog.Basic.Resistor Rcb(R=Rtf_delta) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={16,20})));
        Modelica.Electrical.Analog.Basic.Resistor Rba(R=Rtf_delta) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={16,-38})));
        Modelica.Electrical.Analog.Basic.Resistor Rac(R=Rtf_delta) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={44,-38})));
      equation
        connect(Cy, tFsubcircuitZeroZsec.pin_p)
          annotation (Line(points={{-98,60},{-10,60}}, color={0,0,255}));
        connect(By, tFsubcircuitZeroZsec1.pin_p)
          annotation (Line(points={{-100,0},{-10,0}}, color={0,0,255}));
        connect(Ay, tFsubcircuitZeroZsec2.pin_p)
          annotation (Line(points={{-100,-60},{-10,-60}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec1.pin_n, tFsubcircuitZeroZsec2.pin_n)
          annotation (Line(points={{-10,-20},{-36,-20},{-36,-80},{-10,-80}},
              color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_n, tFsubcircuitZeroZsec1.pin_n)
          annotation (Line(points={{-10,40},{-36,40},{-36,-20},{-10,-20}},
              color={0,0,255}));
        connect(tFsubcircuitZeroZsec1.pin_n, ground.p) annotation (Line(points=
                {{-10,-20},{-36,-20},{-36,-80}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_p1, Cd)
          annotation (Line(points={{10,60},{100,60}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec2.pin_p1, Ad)
          annotation (Line(points={{10,-60},{100,-60}}, color={0,0,255}));
        connect(Bd, Bd) annotation (Line(points={{100,0},{100,0}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec1.pin_n1, Rba.n) annotation (Line(points={{
                10,-20},{16,-20},{16,-28}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_n1, Rcb.n)
          annotation (Line(points={{10,40},{16,40},{16,30}}, color={0,0,255}));
        connect(Rba.p, Ad) annotation (Line(points={{16,-48},{16,-60},{100,-60}},
              color={0,0,255}));
        connect(Rac.p, tFsubcircuitZeroZsec2.pin_n1) annotation (Line(points={{44,-48},
                {44,-80},{10,-80}},         color={0,0,255}));
        connect(Rac.n, Cd) annotation (Line(points={{44,-28},{44,60},{100,60}},
                          color={0,0,255}));
        connect(Rcb.p, tFsubcircuitZeroZsec1.pin_p1)
          annotation (Line(points={{16,10},{16,0},{10,0}}, color={0,0,255}));
        connect(Bd, tFsubcircuitZeroZsec1.pin_p1)
          annotation (Line(points={{100,0},{10,0}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),                                  graphics={
              Ellipse(
                extent={{-80,46},{10,-44}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Ellipse(
                extent={{-10,46},{80,-44}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Line(
                points={{-40,12}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{34,-12},{54,0}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{34,-12},{34,12}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{34,12},{54,0}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-40,0},{-40,24}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-40,0},{-20,-12}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-60,-12},{-40,0}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{-40,0},{-28,0}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-28,0},{-28,-18}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-38,-18},{-20,-18},{-22,-18}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-34,-22},{-22,-22}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-32,-26},{-24,-26}},
                color={0,0,0},
                thickness=0.5),
              Text(
                extent={{-50,44},{-24,20}},
                textColor={0,0,0},
                textString="1"),
              Text(
                extent={{22,44},{48,20}},
                textColor={0,0,0},
                textString="2"),
              Line(
                points={{-98,60}},
                color={28,108,200},
                thickness=0.5),
              Line(points={{-98,62}}, color={0,140,72}),
              Line(
                points={{-96,60},{-80,60},{-60,38}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{100,60},{80,60},{60,38}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-88,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,0},{-80,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{100,0},{80,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,-60},{-80,-60},{-58,-38}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{100,-60},{80,-60},{58,-38}},
                color={238,46,47},
                thickness=0.5)}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}})));
      end EMTPtransformerZeroSeq_fig;
    end GridComponents;

  end GFM;

  package GFM_PSCAD "gfm_dll"
    class GFM_DLL
    extends ExternalObject;

    function constructor
      input Real c_filt;
      input Real r_filt;
      input Real l_filt;
      input Real r_l;
      input Real Vbase;
      input Real Sbase;
      input Real VDC_base;
      input Real w_type;
      output GFM_DLL gfm_dll;
      external "C" gfm_dll = init_gfm_model(c_filt,r_filt,l_filt,r_l,Vbase,Sbase,
                                            VDC_base,w_type) annotation (Library="GFM_GFL_IBR_PSCAD",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    end constructor;

    function destructor
      input GFM_DLL gfm_dll;
      external "C" deinit_gfm_model(gfm_dll) annotation (Library="GFM_GFL_IBR_PSCAD",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    end destructor;

      annotation (Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                lineColor={255,0,0}), Text(
              extent={{-100,44},{98,-104}},
              textColor={238,46,47},
              textString="Class
")}));
    end GFM_DLL;

    model GFM_GFL_IBR_PSCAD

      Real out[12];
      //Real get_time_result;
      parameter Modelica.Units.SI.Capacitance c_filter = 0.0105 "Filter Capacitance";
      parameter Modelica.Units.SI.Resistance r_damp = 0.0401 "Damping Resistance";
      parameter Modelica.Units.SI.Inductance l_filter = 1.1207e-06 "Filter Inductance";
      parameter Modelica.Units.SI.Resistance r_l = 0 "Inductor Resistance";
      parameter Real Vbase = 0.65 "kV";
      parameter Real Sbase = 100 "MVA";
      parameter Real VDC_base = 1.5 "kV";
      parameter Real w_type = 1 "0 - PLL, 1 - Droop";
      GFM_DLL gfm_struct = GFM_DLL(c_filter,r_damp,l_filter,r_l,Vbase,Sbase,VDC_base,w_type);

      Modelica.Electrical.Analog.Basic.Inductor inductor(i(start=0, fixed=true), L=
            l_filter) annotation (Placement(transformation(extent={{-10,4},{2,16}})));
      Modelica.Electrical.Analog.Basic.Capacitor c_b(v(start=0, fixed=false), C=
            c_filter) annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={20,-26})));
      Modelica.Electrical.Analog.Basic.Resistor r_b(R=r_damp) annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={52,-26})));
      Modelica.Electrical.Analog.Basic.Capacitor c_c(v(start=0, fixed=false), C=
            c_filter) annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={30,-26})));
      Modelica.Electrical.Analog.Basic.Resistor r_c(R=r_damp) annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={62,-26})));
      Modelica.Electrical.Analog.Basic.Capacitor c_a(v(start=0, fixed=false), C=
            c_filter) annotation (Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={10,-26})));
      Modelica.Electrical.Analog.Basic.Resistor r_a(R=r_damp) annotation (Placement(
            transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={42,-26})));
      Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start=0, fixed=true), L
          =l_filter) annotation (Placement(transformation(extent={{-6,-6},{6,6}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start=0, fixed=true), L
          =l_filter)
        annotation (Placement(transformation(extent={{-2,-16},{10,-4}})));
      tools.votlage_current_sensor bridge_sensor_c
        annotation (Placement(transformation(extent={{-48,8},{-38,12}})));
      tools.votlage_current_sensor bridge_sensor_b
        annotation (Placement(transformation(extent={{-48,-2},{-38,2}})));
      tools.votlage_current_sensor bridge_sensor_a
        annotation (Placement(transformation(extent={{-48,-12},{-38,-8}})));
      tools.votlage_current_sensor grid_sensor_c
        annotation (Placement(transformation(extent={{68,8},{78,12}})));
      tools.votlage_current_sensor grid_sensor_b
        annotation (Placement(transformation(extent={{68,-2},{78,2}})));
      tools.votlage_current_sensor grid_sensor_a
        annotation (Placement(transformation(extent={{68,-12},{78,-8}})));
      Modelica.Electrical.Analog.Sources.SignalVoltage phase_c annotation (
          Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={-78,-22})));
      Modelica.Electrical.Analog.Sources.SignalVoltage phase_b annotation (
          Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={-66,-22})));
      Modelica.Electrical.Analog.Sources.SignalVoltage phase_a annotation (
          Placement(transformation(
            extent={{-6,-6},{6,6}},
            rotation=270,
            origin={-54,-22})));
      Modelica.Electrical.Analog.Basic.Ground ground2
        annotation (Placement(transformation(extent={{-72,-56},{-60,-44}})));
      Modelica.Electrical.Analog.Basic.Ground ground1
        annotation (Placement(transformation(extent={{30,-62},{42,-50}})));

      Modelica.Electrical.Analog.Interfaces.NegativePin A annotation (Placement(
            transformation(rotation=0, extent={{90,-70},{110,-50}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin B annotation (Placement(
            transformation(rotation=0, extent={{90,-10},{110,10}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin C annotation (Placement(
            transformation(rotation=0, extent={{90,50},{110,70}})));
      Modelica.Blocks.Interfaces.RealInput P_ref_pu
        annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
      Modelica.Blocks.Interfaces.RealInput Q_ref_pu
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
      Modelica.Blocks.Interfaces.RealInput V_ref_pu
        annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
      Modelica.Blocks.Math.Gain p_ref_mw(k=Sbase)
        annotation (Placement(transformation(extent={{-68,54},{-56,66}})));
      Modelica.Blocks.Math.Gain q_ref_mw(k=Sbase)
        annotation (Placement(transformation(extent={{-68,34},{-56,46}})));
    algorithm

      Functions.update(
        gfm_struct,
        time,
        grid_sensor_a.voltage,
        grid_sensor_b.voltage,
        grid_sensor_c.voltage,
        grid_sensor_a.current,
        grid_sensor_b.current,
        grid_sensor_c.current,
        bridge_sensor_a.current,
        bridge_sensor_b.current,
        bridge_sensor_c.current,
        p_ref_mw.y,
        q_ref_mw.y,
        V_ref_pu);

      out :=Functions.model_output(gfm_struct);
      phase_a.v :=out[1]*1000;
      phase_b.v :=out[2]*1000;
      phase_c.v :=out[3]*1000;
      when terminal() then
        Functions.save_ss_state(gfm_struct);
        Modelica.Utilities.Streams.print("Saved states in list.dat");
        Modelica.Utilities.Streams.print("C_A "+String(c_a.v));
        Modelica.Utilities.Streams.print("C_B "+String(c_b.v));
        Modelica.Utilities.Streams.print("C_C "+String(c_c.v));
        Modelica.Utilities.Streams.print("inductor "+String(inductor.i));
        Modelica.Utilities.Streams.print("inductor1 "+String(inductor1.i));
        Modelica.Utilities.Streams.print("inductor2 "+String(inductor2.i));
      end when;
    equation
      connect(c_a.p,inductor2. n)
        annotation (Line(points={{10,-20},{10,-10}}, color={0,0,255}));
      connect(inductor.n,grid_sensor_c. p)
        annotation (Line(points={{2,10},{68,10}},  color={0,0,255}));
      connect(inductor1.n,grid_sensor_b. p)
        annotation (Line(points={{6,0},{68,0}},  color={0,0,255}));
      connect(inductor2.n,grid_sensor_a. p)
        annotation (Line(points={{10,-10},{68,-10}}, color={0,0,255}));
      connect(c_b.p,grid_sensor_b. p)
        annotation (Line(points={{20,-20},{20,0},{68,0}}, color={0,0,255}));
      connect(c_c.p,grid_sensor_c. p)
        annotation (Line(points={{30,-20},{30,10},{68,10}}, color={0,0,255}));
      connect(phase_b.n,ground2. p)
        annotation (Line(points={{-66,-28},{-66,-44}}, color={0,0,255}));
      connect(phase_c.n,ground2. p) annotation (Line(points={{-78,-28},{-78,-40},{-66,
              -40},{-66,-44}}, color={0,0,255}));
      connect(phase_a.n,ground2. p) annotation (Line(points={{-54,-28},{-54,-40},{-66,
              -40},{-66,-44}}, color={0,0,255}));
      connect(phase_a.p,bridge_sensor_a. p)
        annotation (Line(points={{-54,-16},{-48,-16},{-48,-10}}, color={0,0,255}));
      connect(phase_b.p,bridge_sensor_b. p)
        annotation (Line(points={{-66,-16},{-66,0},{-48,0}}, color={0,0,255}));
      connect(phase_c.p,bridge_sensor_c. p)
        annotation (Line(points={{-78,-16},{-78,10},{-48,10}}, color={0,0,255}));
      connect(r_c.p,grid_sensor_c. p)
        annotation (Line(points={{62,-20},{62,10},{68,10}}, color={0,0,255}));
      connect(r_b.p,grid_sensor_b. p)
        annotation (Line(points={{52,-20},{52,0},{68,0}}, color={0,0,255}));
      connect(r_a.p,grid_sensor_a. p)
        annotation (Line(points={{42,-20},{42,-10},{68,-10}}, color={0,0,255}));
      connect(c_a.n,r_c. n) annotation (Line(points={{10,-32},{10,-36},{62,-36},{62,
              -32}}, color={0,0,255}));
      connect(c_b.n,r_c. n) annotation (Line(points={{20,-32},{20,-36},{62,-36},{62,
              -32}}, color={0,0,255}));
      connect(c_c.n,r_c. n) annotation (Line(points={{30,-32},{30,-36},{62,-36},{62,
              -32}}, color={0,0,255}));
      connect(r_a.n,r_c. n) annotation (Line(points={{42,-32},{42,-36},{62,-36},{62,
              -32}}, color={0,0,255}));
      connect(r_b.n,r_c. n) annotation (Line(points={{52,-32},{52,-36},{62,-36},{62,
              -32}}, color={0,0,255}));
      connect(ground1.p,r_c. n) annotation (Line(points={{36,-50},{36,-36},{62,-36},
              {62,-32}}, color={0,0,255}));
      connect(A, grid_sensor_a.n)
        annotation (Line(points={{100,-60},{84,-60},{84,-10},{78,-10}},
                                                                color={0,0,255}));
      connect(B, grid_sensor_b.n)
        annotation (Line(points={{100,0},{78,0}}, color={0,0,255}));
      connect(C, grid_sensor_c.n) annotation (Line(points={{100,60},{84,60},{84,
              10},{78,10}}, color={0,0,255}));
      connect(P_ref_pu, p_ref_mw.u)
        annotation (Line(points={{-100,60},{-69.2,60}}, color={0,0,127}));
      connect(q_ref_mw.u, Q_ref_pu) annotation (Line(points={{-69.2,40},{-90,40},{-90,
              0},{-100,0}}, color={0,0,127}));
      connect(bridge_sensor_c.n, inductor.p)
        annotation (Line(points={{-38,10},{-10,10}}, color={0,0,255}));
      connect(bridge_sensor_b.n, inductor1.p)
        annotation (Line(points={{-38,0},{-6,0}}, color={0,0,255}));
      connect(bridge_sensor_a.n, inductor2.p)
        annotation (Line(points={{-38,-10},{-2,-10}}, color={0,0,255}));
      annotation (Icon(graphics={
            Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
            Line(points={{-100,100},{100,-100}}, color={28,108,200}),
            Text(
              extent={{-30,92},{62,26}},
              textColor={28,108,200},
              textString="AC"),
            Text(
              extent={{-70,-8},{22,-74}},
              textColor={28,108,200},
              textString="DC"),
            Text(
              extent={{64,76},{92,46}},
              textColor={28,108,200},
              textString="C"),
            Text(
              extent={{64,14},{92,-16}},
              textColor={28,108,200},
              textString="B"),
            Text(
              extent={{64,-44},{92,-74}},
              textColor={28,108,200},
              textString="A")}),  experiment(
          StopTime=10,
          Interval=1e-05,
          __Dymola_fixedstepsize=1e-05,
          __Dymola_Algorithm="Euler"));
    end GFM_GFL_IBR_PSCAD;

    package Functions
    function my_add_c
      input Real a;
      input Real b;
      output Real sum;
      external "C" sum = my_add(a,b) annotation (Library="GFM_GFL_IBR_PSCAD",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    end my_add_c;

    function save_ss_state
      input GFM_DLL gfm_dll;
      external "C" save_states(gfm_dll) annotation (Library="GFM_GFL_IBR_PSCAD",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    end save_ss_state;

    function load_ss_state
      input GFM_DLL gfm_dll;
      output Real x;
      external "C" x = load_states(gfm_dll) annotation (Library="GFM_GFL_IBR_PSCAD",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    end load_ss_state;

      function update
        input GFM_DLL gfm_dll;
        input Real t;
        input Real va;
        input Real vb;
        input Real vc;
        input Real ia;
        input Real ib;
        input Real ic;
        input Real ial;
        input Real ibl;
        input Real icl;
        input Real pref;
        input Real qref;
        input Real vref;
        external "C" update_gfm_input(gfm_dll,t,va,vb,vc,ia,ib,ic,ial,ibl,icl,pref,qref,vref) annotation (Library="GFM_GFL_IBR_PSCAD",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
      end update;

      function model_output
        input GFM_DLL gfm_dll;
        output Real out[12];
        external "C" model_calculate(gfm_dll, out) annotation (Library="GFM_GFL_IBR_PSCAD",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
      end model_output;

      function get_time
        output Real out;
        external "C" out = get_sim_time() annotation (Library="GFM_GFL_IBR_PSCAD",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
      end get_time;
    end Functions;

    package tools
    model dq0_tf
      constant Real pi = Modelica.Constants.pi;
      Modelica.Blocks.Interfaces.RealInput a
        annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
      Modelica.Blocks.Interfaces.RealInput b
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
      Modelica.Blocks.Interfaces.RealInput c
        annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
      Modelica.Blocks.Interfaces.RealOutput d
        annotation (Placement(transformation(extent={{100,50},{120,70}})));
      Modelica.Blocks.Interfaces.RealOutput q
        annotation (Placement(transformation(extent={{100,-10},{120,10}})));
      Modelica.Blocks.Interfaces.RealOutput zero
        annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
      Modelica.Blocks.Interfaces.RealInput theta annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-100})));
    equation
      d = (2/3)*(a*sin(theta)+b*sin(theta-(2*pi)/(3))+c*sin(theta+(2*pi)/(3)));
      q = (2/3)*(a*cos(theta)+b*cos(theta-(2*pi)/(3))+c*cos(theta+(2*pi)/(3)));
      zero = (a+b+c)/3;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
            Line(points={{-100,-100},{100,100}}, color={28,108,200}),
            Text(
              extent={{-76,94},{28,22}},
              textColor={28,108,200},
              textString="ABC"),
            Text(
              extent={{-8,-6},{96,-78}},
              textColor={28,108,200},
              textString="dq0")}),                                   Diagram(
            coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(
                extent={{-100,100},{100,-100}}, lineColor={28,108,200})}));
    end dq0_tf;

    model Vabc_source
      OpenIPSL.Interfaces.PwPin p
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.Blocks.Interfaces.RealInput ref
        annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
      Modelica.Blocks.Interfaces.RealInput vin
        annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
    equation
      [p.vr; p.vi]=[0;0];
                          annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false), graphics={Rectangle(
                extent={{-100,100},{100,-100}}, lineColor={28,108,200})}));
    end Vabc_source;

    model votlage_current_sensor
      Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={20,-18})));
      Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-20,0})));
      Modelica.Electrical.Analog.Interfaces.PositivePin p
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin n
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.Electrical.Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{10,-80},{30,-60}})));
      Modelica.Blocks.Interfaces.RealOutput current( start = 0) annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-40,110})));
      Modelica.Blocks.Interfaces.RealOutput voltage( start = 0)   annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={40,110})));
    equation
      connect(currentSensor.p, p)
        annotation (Line(points={{-30,0},{-100,0}}, color={0,0,255}));
      connect(currentSensor.n, voltageSensor.p)
        annotation (Line(points={{-10,0},{20,0},{20,-8}}, color={0,0,255}));
      connect(n, voltageSensor.p)
        annotation (Line(points={{100,0},{20,0},{20,-8}}, color={0,0,255}));
      connect(ground.p, voltageSensor.n)
        annotation (Line(points={{20,-60},{20,-28}}, color={0,0,255}));
      connect(currentSensor.i, current) annotation (Line(points={{-20,-11},{-20,
              -14},{-40,-14},{-40,110}}, color={0,0,127}));
      connect(voltageSensor.v, voltage) annotation (Line(points={{9,-18},{0,-18},
              {0,40},{40,40},{40,110}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
            Text(
              extent={{-68,98},{-12,66}},
              textColor={28,108,200},
              textString="Current"),
            Text(
              extent={{12,98},{68,66}},
              textColor={28,108,200},
              textString="Voltage")}), Diagram(coordinateSystem(
              preserveAspectRatio=false)));
    end votlage_current_sensor;

    model votlage_current_sensor_no_init
      Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={20,-18})));
      Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-20,0})));
      Modelica.Electrical.Analog.Interfaces.PositivePin p
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica.Electrical.Analog.Interfaces.NegativePin n
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.Electrical.Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{10,-80},{30,-60}})));
      Modelica.Blocks.Interfaces.RealOutput current annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-40,110})));
      Modelica.Blocks.Interfaces.RealOutput voltage   annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={40,110})));
    equation
      connect(currentSensor.p, p)
        annotation (Line(points={{-30,0},{-100,0}}, color={0,0,255}));
      connect(currentSensor.n, voltageSensor.p)
        annotation (Line(points={{-10,0},{20,0},{20,-8}}, color={0,0,255}));
      connect(n, voltageSensor.p)
        annotation (Line(points={{100,0},{20,0},{20,-8}}, color={0,0,255}));
      connect(ground.p, voltageSensor.n)
        annotation (Line(points={{20,-60},{20,-28}}, color={0,0,255}));
      connect(currentSensor.i, current) annotation (Line(points={{-20,-11},{-20,
              -14},{-40,-14},{-40,110}}, color={0,0,127}));
      connect(voltageSensor.v, voltage) annotation (Line(points={{9,-18},{0,-18},
              {0,40},{40,40},{40,110}}, color={0,0,127}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
            Text(
              extent={{-68,98},{-12,66}},
              textColor={28,108,200},
              textString="Current"),
            Text(
              extent={{12,98},{68,66}},
              textColor={28,108,200},
              textString="Voltage")}), Diagram(coordinateSystem(
              preserveAspectRatio=false)));
    end votlage_current_sensor_no_init;

      model GFM_GFL_IBR_test

        Real out[12];
        //Real get_time_result;
        parameter Modelica.Units.SI.Capacitance c_filter = 0.0000627830 "Filter Capacitance";
        parameter Modelica.Units.SI.Resistance r_damp = 40.08173 "Damping Resistance";
        parameter Modelica.Units.SI.Inductance l_filter = 0.0008965728461 "Filter Inductance";
        parameter Modelica.Units.SI.Resistance r_l = 0.021125 "Inductor Resistance";
        parameter Real Vbase = 6.5 "kV";
        parameter Real Sbase = 10 "MVA";
        parameter Real VDC_base = 13 "kV";
        parameter Real w_type = 1 "0 - PLL, 1 - Droop";
        GFM_DLL gfm_struct = GFM_DLL(c_filter,r_damp,l_filter,r_l,Vbase,Sbase,VDC_base,w_type);

        Modelica.Electrical.Analog.Basic.Inductor inductor(i(start=0, fixed=true), L=
              l_filter) annotation (Placement(transformation(extent={{-10,4},{2,16}})));
        Modelica.Electrical.Analog.Basic.Capacitor c_b(v(start=0, fixed=false), C=
              c_filter) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={20,-26})));
        Modelica.Electrical.Analog.Basic.Resistor r_b(R=r_damp) annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={52,-26})));
        Modelica.Electrical.Analog.Basic.Capacitor c_c(v(start=0, fixed=false), C=
              c_filter) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={30,-26})));
        Modelica.Electrical.Analog.Basic.Resistor r_c(R=r_damp) annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={62,-26})));
        Modelica.Electrical.Analog.Basic.Capacitor c_a(v(start=0, fixed=false), C=
              c_filter) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={10,-26})));
        Modelica.Electrical.Analog.Basic.Resistor r_a(R=r_damp) annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={42,-26})));
        Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start=0, fixed=true), L
            =l_filter) annotation (Placement(transformation(extent={{-6,-6},{6,6}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start=0, fixed=true), L
            =l_filter)
          annotation (Placement(transformation(extent={{-2,-16},{10,-4}})));
        tools.votlage_current_sensor bridge_sensor_c
          annotation (Placement(transformation(extent={{-48,8},{-38,12}})));
        tools.votlage_current_sensor bridge_sensor_b
          annotation (Placement(transformation(extent={{-50,0},{-40,4}})));
        tools.votlage_current_sensor bridge_sensor_a
          annotation (Placement(transformation(extent={{-48,-12},{-38,-8}})));
        tools.votlage_current_sensor grid_sensor_c
          annotation (Placement(transformation(extent={{68,8},{78,12}})));
        tools.votlage_current_sensor grid_sensor_b
          annotation (Placement(transformation(extent={{68,-2},{78,2}})));
        tools.votlage_current_sensor grid_sensor_a
          annotation (Placement(transformation(extent={{68,-12},{78,-8}})));
        Modelica.Electrical.Analog.Sources.SignalVoltage phase_c annotation (
            Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-78,-22})));
        Modelica.Electrical.Analog.Sources.SignalVoltage phase_b annotation (
            Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-66,-22})));
        Modelica.Electrical.Analog.Sources.SignalVoltage phase_a annotation (
            Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-54,-22})));
        Modelica.Electrical.Analog.Basic.Ground ground2
          annotation (Placement(transformation(extent={{-72,-56},{-60,-44}})));
        Modelica.Electrical.Analog.Basic.Ground ground1
          annotation (Placement(transformation(extent={{30,-62},{42,-50}})));

        Modelica.Electrical.Analog.Interfaces.NegativePin n annotation (Placement(
              transformation(rotation=0, extent={{90,-70},{110,-50}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n1 annotation (Placement(
              transformation(rotation=0, extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n2 annotation (Placement(
              transformation(rotation=0, extent={{90,50},{110,70}})));
        Modelica.Blocks.Interfaces.RealInput P_ref_pu
          annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
        Modelica.Blocks.Interfaces.RealInput Q_ref_pu
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
        Modelica.Blocks.Interfaces.RealInput V_ref_pu
          annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
        Modelica.Blocks.Math.Gain p_ref_mw(k=Sbase)
          annotation (Placement(transformation(extent={{-62,54},{-50,66}})));
        Modelica.Blocks.Math.Gain q_ref_mw(k=Sbase)
          annotation (Placement(transformation(extent={{-62,34},{-50,46}})));
      algorithm

        Functions.update(
          gfm_struct,
          time,
          grid_sensor_a.voltage,
          grid_sensor_b.voltage,
          grid_sensor_c.voltage,
          grid_sensor_a.current,
          grid_sensor_b.current,
          grid_sensor_c.current,
          bridge_sensor_a.current,
          bridge_sensor_b.current,
          bridge_sensor_c.current,
          p_ref_mw.y,
          q_ref_mw.y,
          V_ref_pu);

        out :=Functions.model_output(gfm_struct);
        phase_a.v :=out[1]*1000;
        phase_b.v :=out[2]*1000;
        phase_c.v :=out[3]*1000;
        when terminal() then
          Functions.save_ss_state(gfm_struct);
          Modelica.Utilities.Streams.print("Saved states in list.dat");
          Modelica.Utilities.Streams.print("C_A "+String(c_a.v));
          Modelica.Utilities.Streams.print("C_B "+String(c_b.v));
          Modelica.Utilities.Streams.print("C_C "+String(c_c.v));
          Modelica.Utilities.Streams.print("inductor "+String(inductor.i));
          Modelica.Utilities.Streams.print("inductor1 "+String(inductor1.i));
          Modelica.Utilities.Streams.print("inductor2 "+String(inductor2.i));
        end when;
      equation
        connect(c_a.p,inductor2. n)
          annotation (Line(points={{10,-20},{10,-10}}, color={0,0,255}));
        connect(inductor.n,grid_sensor_c. p)
          annotation (Line(points={{2,10},{68,10}},  color={0,0,255}));
        connect(inductor1.n,grid_sensor_b. p)
          annotation (Line(points={{6,0},{68,0}},  color={0,0,255}));
        connect(inductor2.n,grid_sensor_a. p)
          annotation (Line(points={{10,-10},{68,-10}}, color={0,0,255}));
        connect(c_b.p,grid_sensor_b. p)
          annotation (Line(points={{20,-20},{20,0},{68,0}}, color={0,0,255}));
        connect(c_c.p,grid_sensor_c. p)
          annotation (Line(points={{30,-20},{30,10},{68,10}}, color={0,0,255}));
        connect(phase_b.n,ground2. p)
          annotation (Line(points={{-66,-28},{-66,-44}}, color={0,0,255}));
        connect(phase_c.n,ground2. p) annotation (Line(points={{-78,-28},{-78,-40},{-66,
                -40},{-66,-44}}, color={0,0,255}));
        connect(phase_a.n,ground2. p) annotation (Line(points={{-54,-28},{-54,-40},{-66,
                -40},{-66,-44}}, color={0,0,255}));
        connect(r_c.p,grid_sensor_c. p)
          annotation (Line(points={{62,-20},{62,10},{68,10}}, color={0,0,255}));
        connect(r_b.p,grid_sensor_b. p)
          annotation (Line(points={{52,-20},{52,0},{68,0}}, color={0,0,255}));
        connect(r_a.p,grid_sensor_a. p)
          annotation (Line(points={{42,-20},{42,-10},{68,-10}}, color={0,0,255}));
        connect(c_a.n,r_c. n) annotation (Line(points={{10,-32},{10,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(c_b.n,r_c. n) annotation (Line(points={{20,-32},{20,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(c_c.n,r_c. n) annotation (Line(points={{30,-32},{30,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(r_a.n,r_c. n) annotation (Line(points={{42,-32},{42,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(r_b.n,r_c. n) annotation (Line(points={{52,-32},{52,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(ground1.p,r_c. n) annotation (Line(points={{36,-50},{36,-36},{62,-36},
                {62,-32}}, color={0,0,255}));
        connect(n, grid_sensor_a.n)
          annotation (Line(points={{100,-60},{84,-60},{84,-10},{78,-10}},
                                                                  color={0,0,255}));
        connect(n1, grid_sensor_b.n)
          annotation (Line(points={{100,0},{78,0}},           color={0,0,255}));
        connect(n2, grid_sensor_c.n)
          annotation (Line(points={{100,60},{84,60},{84,10},{78,10}},
                                                                 color={0,0,255}));
        connect(bridge_sensor_c.p, phase_c.p)
          annotation (Line(points={{-48,10},{-78,10},{-78,-16}}, color={0,0,255}));
        connect(bridge_sensor_b.p, phase_b.p)
          annotation (Line(points={{-50,2},{-66,2},{-66,-16}}, color={0,0,255}));
        connect(bridge_sensor_a.p, phase_a.p)
          annotation (Line(points={{-48,-10},{-54,-10},{-54,-16}}, color={0,0,255}));
        connect(P_ref_pu, p_ref_mw.u)
          annotation (Line(points={{-100,60},{-63.2,60}}, color={0,0,127}));
        connect(Q_ref_pu, q_ref_mw.u) annotation (Line(points={{-100,0},{-92,0},{-92,40},
                {-63.2,40}}, color={0,0,127}));
        connect(bridge_sensor_c.n, inductor.p)
          annotation (Line(points={{-38,10},{-10,10}}, color={0,0,255}));
        connect(inductor1.p, bridge_sensor_b.n) annotation (Line(points={{-6,0},
                {-22,0},{-22,2},{-40,2}}, color={0,0,255}));
        connect(bridge_sensor_a.n, inductor2.p)
          annotation (Line(points={{-38,-10},{-2,-10}}, color={0,0,255}));
        annotation (Icon(graphics={
              Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
              Line(points={{-100,100},{100,-100}}, color={28,108,200}),
              Text(
                extent={{-14,82},{78,16}},
                textColor={28,108,200},
                textString="AC"),
              Text(
                extent={{-74,-14},{18,-80}},
                textColor={28,108,200},
                textString="DC")}), experiment(
            StopTime=10,
            Interval=1e-05,
            __Dymola_fixedstepsize=1e-05,
            __Dymola_Algorithm="Euler"));
      end GFM_GFL_IBR_test;

      model zeroXdetect
        Modelica.Blocks.MathBoolean.RisingEdge rising1
          annotation (Placement(transformation(extent={{-60,24},{-52,32}})));
        Modelica.Blocks.MathBoolean.FallingEdge falling1
          annotation (Placement(transformation(extent={{-60,-4},{-52,4}})));
        Modelica.Blocks.Logical.RSFlipFlop rSFlipFlop2
          annotation (Placement(transformation(extent={{-40,-16},{-20,4}})));
        Modelica.Blocks.Logical.ZeroCrossing zeroCrossing annotation (Placement(
              transformation(extent={{-10,-10},{10,10}}, rotation=270)));
        Modelica.Blocks.Logical.RSFlipFlop rSFlipFlop1
          annotation (Placement(transformation(extent={{54,12},{74,32}})));
        Modelica.Blocks.Interfaces.BooleanInput u
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
        Modelica.Blocks.Interfaces.BooleanOutput y
          annotation (Placement(transformation(extent={{100,-10},{120,10}})));
        Modelica.Blocks.Interfaces.RealInput u1 annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,100})));
      equation
        connect(falling1.u, rising1.u) annotation (Line(points={{-61.6,0},{-66,
                0},{-66,28},{-61.6,28}}, color={255,0,255}));
        connect(rising1.y, rSFlipFlop1.S)
          annotation (Line(points={{-51.2,28},{52,28}}, color={255,0,255}));
        connect(falling1.y, rSFlipFlop2.S)
          annotation (Line(points={{-51.2,0},{-42,0}}, color={255,0,255}));
        connect(rSFlipFlop2.R, rSFlipFlop1.QI) annotation (Line(points={{-42,
                -12},{-42,-38},{82,-38},{82,16},{75,16}}, color={255,0,255}));
        connect(rSFlipFlop2.Q, zeroCrossing.enable)
          annotation (Line(points={{-19,0},{-12,0}}, color={255,0,255}));
        connect(zeroCrossing.y, rSFlipFlop1.R) annotation (Line(points={{0,-11},
                {0,-16},{44,-16},{44,16},{52,16}}, color={255,0,255}));
        connect(rSFlipFlop1.Q, y) annotation (Line(points={{75,28},{96,28},{96,
                0},{110,0}}, color={255,0,255}));
        connect(u, rising1.u) annotation (Line(points={{-100,0},{-66,0},{-66,28},
                {-61.6,28}}, color={255,0,255}));
        connect(zeroCrossing.u, u1)
          annotation (Line(points={{0,12},{0,100}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={28,108,200},
                lineThickness=0.5)}), Diagram(coordinateSystem(
                preserveAspectRatio=false)));
      end zeroXdetect;

      model SmoothSwitch
        parameter SI.Resistance Ron = 1e-5
          "Closed switch resistance";
        parameter SI.Conductance Goff = 1e-5
          "Opened switch conductance";
        Modelica.Electrical.Analog.Interfaces.Pin pin
          annotation (Placement(transformation(extent={{-10,90},{10,110}})));
        Modelica.Electrical.Analog.Interfaces.Pin pin1
          annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
        Modelica.Blocks.Interfaces.BooleanInput u
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
        Modelica.Blocks.Math.BooleanToReal booleanToReal(realTrue=Ron, realFalse=1/
              Goff)
          annotation (Placement(transformation(extent={{-72,-10},{-52,10}})));
        Modelica.Blocks.Continuous.Filter filter(
          analogFilter=Modelica.Blocks.Types.AnalogFilter.CriticalDamping,
          filterType=Modelica.Blocks.Types.FilterType.LowPass,
          order=2,
          f_cut=f_cut,
          gain=1,
          normalized=true)
          annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
        Modelica.Electrical.Analog.Basic.VariableResistor resistor annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90)));
        parameter SI.Frequency f_cut=1e3 "Cut-off frequency";
      equation
        connect(u, booleanToReal.u)
          annotation (Line(points={{-100,0},{-74,0}}, color={255,0,255}));
        connect(resistor.n, pin) annotation (Line(points={{0,10},{0,100}},
              color={0,0,255}));
        connect(resistor.p, pin1) annotation (Line(points={{0,-10},{0,-100}},
                          color={0,0,255}));
        connect(filter.y, resistor.R)
          annotation (Line(points={{-19,0},{-12,0}},color={0,0,127}));
        connect(booleanToReal.y, filter.u)
          annotation (Line(points={{-51,0},{-42,0}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Ellipse(extent={{-4,4},{4,-4}},    lineColor={0,0,255},
                origin={0,-40},
                rotation=90),
              Line(points={{-22,-1},{30,-1}},color={0,0,255},
                origin={-1,72},
                rotation=90),
              Line(points={{-27,-38.5},{43,21.5}},
                                             color={0,0,255},
                origin={21.5,7},
                rotation=90),
              Line(points={{-34,25},{22,25}},
                                           color={0,0,255},
                origin={25,-66},
                rotation=90),
              Line(
                points={{24,-14},{24,-36},{40,-48}},
                color={28,108,200},
                smooth=Smooth.Bezier),
              Line(
                points={{18,-24},{18,-38},{26,-46}},
                color={28,108,200},
                smooth=Smooth.Bezier),
              Line(
                points={{12,-32},{12,-42},{18,-48}},
                color={28,108,200},
                smooth=Smooth.Bezier)}),                               Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(
            Interval=1e-05,
            __Dymola_fixedstepsize=1e-05,
            __Dymola_Algorithm="Euler"));
      end SmoothSwitch;

      model NearZeroX
        Modelica.Blocks.Interfaces.RealInput u annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,100})));
        Modelica.Blocks.Interfaces.BooleanInput enable
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
        Modelica.Blocks.Interfaces.BooleanOutput y annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-110})));
        Modelica.Blocks.Logical.LessEqualThreshold lessEqualThreshold(threshold
            =threshold) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,28})));
        Modelica.Blocks.Logical.And and1 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-50})));
        Modelica.Blocks.Math.Abs abs1 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,62})));
        parameter Real threshold=0.01 "Comparison with respect to threshold";
      equation
        connect(and1.y, y)
          annotation (Line(points={{0,-61},{0,-110}}, color={255,0,255}));
        connect(and1.u1, lessEqualThreshold.y)
          annotation (Line(points={{0,-38},{0,17}}, color={255,0,255}));
        connect(enable, and1.u2) annotation (Line(points={{-100,0},{-8,0},{-8,
                -38}}, color={255,0,255}));
        connect(abs1.u, u)
          annotation (Line(points={{0,74},{0,100}}, color={0,0,127}));
        connect(abs1.y, lessEqualThreshold.u)
          annotation (Line(points={{0,51},{0,40}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255})}),
            Diagram(coordinateSystem(preserveAspectRatio=false)));
      end NearZeroX;

      model NearZeroXdetect
        Modelica.Blocks.MathBoolean.RisingEdge rising1
          annotation (Placement(transformation(extent={{-60,24},{-52,32}})));
        Modelica.Blocks.MathBoolean.FallingEdge falling1
          annotation (Placement(transformation(extent={{-60,-4},{-52,4}})));
        Modelica.Blocks.Logical.RSFlipFlop rSFlipFlop2
          annotation (Placement(transformation(extent={{-40,-16},{-20,4}})));
        Modelica.Blocks.Logical.RSFlipFlop rSFlipFlop1
          annotation (Placement(transformation(extent={{54,12},{74,32}})));
        Modelica.Blocks.Interfaces.BooleanInput u
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
        Modelica.Blocks.Interfaces.BooleanOutput y
          annotation (Placement(transformation(extent={{100,-10},{120,10}})));
        Modelica.Blocks.Interfaces.RealInput u1 annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,100})));
        NearZeroX nearZeroX(threshold=threshold)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        parameter Real threshold=0.01 "Comparison with respect to threshold";
      equation
        connect(falling1.u, rising1.u) annotation (Line(points={{-61.6,0},{-66,
                0},{-66,28},{-61.6,28}}, color={255,0,255}));
        connect(rising1.y, rSFlipFlop1.S)
          annotation (Line(points={{-51.2,28},{52,28}}, color={255,0,255}));
        connect(falling1.y, rSFlipFlop2.S)
          annotation (Line(points={{-51.2,0},{-42,0}}, color={255,0,255}));
        connect(rSFlipFlop2.R, rSFlipFlop1.QI) annotation (Line(points={{-42,
                -12},{-42,-38},{82,-38},{82,16},{75,16}}, color={255,0,255}));
        connect(rSFlipFlop1.Q, y) annotation (Line(points={{75,28},{96,28},{96,
                0},{110,0}}, color={255,0,255}));
        connect(u, rising1.u) annotation (Line(points={{-100,0},{-66,0},{-66,28},
                {-61.6,28}}, color={255,0,255}));
        connect(nearZeroX.u, u1)
          annotation (Line(points={{0,10},{0,100}}, color={0,0,127}));
        connect(rSFlipFlop2.Q, nearZeroX.enable)
          annotation (Line(points={{-19,0},{-10,0}}, color={255,0,255}));
        connect(nearZeroX.y, rSFlipFlop1.R) annotation (Line(points={{0,-11},{0,
                -22},{40,-22},{40,16},{52,16}}, color={255,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={28,108,200},
                lineThickness=0.5)}), Diagram(coordinateSystem(
                preserveAspectRatio=false)));
      end NearZeroXdetect;

      model NoneIdealTransformer
        parameter Real n(start=1) "Turns ratio primary:secondary voltage";
        parameter Boolean considerMagnetization=false
          "Choice of considering magnetization";
        parameter SI.Inductance Lm1(start=1)
          "Magnetization inductance w.r.t. primary side"
          annotation (Dialog(enable=considerMagnetization));
        SI.Voltage v1 "Voltage drop of port 1 (= p1.v - n1.v)";
        SI.Voltage v2 "Voltage drop of port 2 (= p2.v - n2.v)";
        SI.Current i1 "Current flowing from pos. to neg. pin of port 1";
        SI.Current i2 "Current flowing from pos. to neg. pin of port 2";
        Modelica.Electrical.Analog.Interfaces.PositivePin p1
          annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n1
          annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p2
          annotation (Placement(transformation(extent={{90,90},{110,110}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n2
          annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
        Modelica.Blocks.Continuous.Filter filter(f_cut=f_cut)
          annotation (Placement(transformation(extent={{-44,-10},{-24,10}})));
        parameter SI.Frequency f_cut=1000 "Cut-off frequency";
      equation
        v1 = p1.v - n1.v;
        v2 = p2.v - n2.v;
        i1 = p1.i;
        i2 = p2.i;
        0 = p1.i + n1.i;
        0 = p2.i + n2.i;

        i1 = -i2/n;
        filter.y = n*v2;
        v1=filter.u;
      end NoneIdealTransformer;

      model NoneIdealTransformer_Emulation
        parameter Real n(start=1) "Turns ratio primary:secondary voltage";
        parameter Boolean considerMagnetization=false
          "Choice of considering magnetization";
        parameter SI.Inductance Lm1(start=1)
          "Magnetization inductance w.r.t. primary side"
          annotation (Dialog(enable=considerMagnetization));
        SI.Voltage v1 "Voltage drop of port 1 (= p1.v - n1.v)";
        SI.Voltage v2 "Voltage drop of port 2 (= p2.v - n2.v)";
        SI.Current i1 "Current flowing from pos. to neg. pin of port 1";
        SI.Current i2 "Current flowing from pos. to neg. pin of port 2";
        Modelica.Electrical.Analog.Interfaces.PositivePin p1
          annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n1
          annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p2
          annotation (Placement(transformation(extent={{90,90},{110,110}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n2
          annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
        parameter SI.Frequency f_cut=1000 "Cut-off frequency";
        Modelica.Blocks.Interfaces.RealInput PhaseVin annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,100})));
      equation
        v1 = p1.v - n1.v;
        v2 = p2.v - n2.v;
        i1 = p1.i;
        i2 = p2.i;
        0 = p1.i + n1.i;
        0 = p2.i + n2.i;

        i1 = -i2/n;
        v1=-PhaseVin/3;

        //v1=n*v2;
      end NoneIdealTransformer_Emulation;

      model IdealTransformer
        parameter Real n(start=1) "Turns ratio primary:secondary voltage";
        parameter Boolean considerMagnetization=false
          "Choice of considering magnetization";
        parameter SI.Inductance Lm1(start=1)
          "Magnetization inductance w.r.t. primary side"
          annotation (Dialog(enable=considerMagnetization));
        SI.Voltage v1 "Voltage drop of port 1 (= p1.v - n1.v)";
        SI.Voltage v2 "Voltage drop of port 2 (= p2.v - n2.v)";
        SI.Current i1 "Current flowing from pos. to neg. pin of port 1";
        SI.Current i2 "Current flowing from pos. to neg. pin of port 2";
        Modelica.Electrical.Analog.Interfaces.PositivePin p1
          annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n1
          annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p2
          annotation (Placement(transformation(extent={{90,90},{110,110}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n2
          annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
      equation
        v1 = p1.v - n1.v;
        v2 = p2.v - n2.v;
        i1 = p1.i;
        i2 = p2.i;
        0 = p1.i + n1.i;
        0 = p2.i + n2.i;

        i1 = -i2/n;

        v1 = n*v2;
        annotation (defaultComponentName="transformer",
          Documentation(info="<html>
<p>
The ideal transformer is a two-port circuit element;
in case of Boolean parameter <code>considerMagnetization = false</code> it is characterized by the following equations:
</p>
<blockquote><pre>
i2 = -i1*n;
v2 =  v1/n;
</pre></blockquote>
<p>
where <code>n</code> is a real number called the turns ratio.
Due to this equations, also DC voltages and currents are transformed - which is not the case for technical transformers.
</p>
<p>
In case of Boolean parameter <code>considerMagnetization = true</code> it is characterized by the following equations:
</p>
<blockquote><pre>
im1  = i1 + i2/n \"Magnetizing current w.r.t. primary side\";
psim1= Lm1*im1   \"Magnetic flux w.r.t. primary side\";
v1 = der(psim1)  \"Primary voltage\";
v2 = v1/n        \"Secondary voltage\";
</pre></blockquote>
<p>
where <code>Lm</code> denotes the magnetizing inductance.
Due to this equations, the DC offset of secondary voltages and currents decrement according to the time constant defined by the connected circuit.
</p>
<p>
Taking primary <code>L1sigma</code> and secondary <code>L2ssigma</code> leakage inductances into account,
compared with the <a href=\"modelica://Modelica.Electrical.Analog.Basic.Transformer\">basic transformer</a>
the following parameter conversion can be applied (which leads to identical results):
</p>
<blockquote><pre>
L1 = L1sigma + M*n \"Primary inductance at secondary no-load\";
L2 = L2sigma + M/n \"Secondary inductance at primary no-load\";
M  = Lm1/n         \"Mutual inductance\";
</pre></blockquote>
<p>
For the backward conversion, one has to decide about the partitioning of the leakage to primary and secondary side.
</p>
</html>",     revisions="<html>
<ul>
<li><em>June 3, 2009   </em>
       magnetisation current added by Anton Haumer<br>
       </li>
<li><em>1998   </em>
       initially implemented by Christoph Clauss<br>
       </li>
</ul>
</html>"),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                  100}}), graphics={
              Text(extent={{-150,-110},{150,-150}},textString="n=%n"),
              Text(
                extent={{-100,20},{-60,-20}},
                textColor={0,0,255},
                textString="1"),
              Text(
                extent={{60,20},{100,-20}},
                textColor={0,0,255},
                textString="2"),
              Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                textColor={0,0,255}),
              Line(points={{-40,60},{-40,100},{-90,100}}, color={0,0,255}),
              Line(points={{40,60},{40,100},{90,100}}, color={0,0,255}),
              Line(points={{-40,-60},{-40,-100},{-90,-100}}, color={0,0,255}),
              Line(points={{40,-60},{40,-100},{90,-100}}, color={0,0,255}),
              Line(
                points={{-15,-7},{-14,-1},{-7,7},{7,7},{14,-1},{15,-7}},
                color={0,0,255},
                smooth=Smooth.Bezier,
                origin={-33,45},
                rotation=270),
              Line(
                points={{-15,-7},{-14,-1},{-7,7},{7,7},{14,-1},{15,-7}},
                color={0,0,255},
                smooth=Smooth.Bezier,
                origin={-33,15},
                rotation=270),
              Line(
                points={{-15,-7},{-14,-1},{-7,7},{7,7},{14,-1},{15,-7}},
                color={0,0,255},
                smooth=Smooth.Bezier,
                origin={-33,-15},
                rotation=270),
              Line(
                points={{-15,-7},{-14,-1},{-7,7},{7,7},{14,-1},{15,-7}},
                color={0,0,255},
                smooth=Smooth.Bezier,
                origin={-33,-45},
                rotation=270),
              Line(
                points={{-15,-7},{-14,-1},{-7,7},{7,7},{14,-1},{15,-7}},
                color={0,0,255},
                smooth=Smooth.Bezier,
                origin={33,45},
                rotation=90),
              Line(
                points={{-15,-7},{-14,-1},{-7,7},{7,7},{14,-1},{15,-7}},
                color={0,0,255},
                smooth=Smooth.Bezier,
                origin={33,15},
                rotation=90),
              Line(
                points={{-15,-7},{-14,-1},{-7,7},{7,7},{14,-1},{15,-7}},
                color={0,0,255},
                smooth=Smooth.Bezier,
                origin={33,-15},
                rotation=90),
              Line(
                points={{-15,-7},{-14,-1},{-7,7},{7,7},{14,-1},{15,-7}},
                color={0,0,255},
                smooth=Smooth.Bezier,
                origin={33,-45},
                rotation=90)}));
      end IdealTransformer;
    end tools;

    package GridComponents

      model Line_R
        parameter Real Time = 1
                               "start";
        parameter Real Resistance = 0
                                     "line resistance";
        Modelica.Electrical.Analog.Interfaces.PositivePin p annotation (Placement(
              transformation(rotation=0, extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p1 annotation (Placement(
              transformation(rotation=0, extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p2 annotation (Placement(
              transformation(rotation=0, extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n annotation (Placement(
              transformation(rotation=0, extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n1 annotation (Placement(
              transformation(rotation=0, extent={{90,-70},{110,-50}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n2 annotation (Placement(
              transformation(rotation=0, extent={{90,50},{110,70}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor(R=Resistance)
          annotation (Placement(transformation(extent={{-10,50},{10,70}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor1(R=Resistance)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor2(R=Resistance)
          annotation (Placement(transformation(extent={{-10,-70},{10,-50}})));
      equation
        connect(resistor.p, p2)
          annotation (Line(points={{-10,60},{-100,60}}, color={0,0,255}));
        connect(p, resistor1.p)
          annotation (Line(points={{-100,0},{-10,0}}, color={0,0,255}));
        connect(resistor2.p, p1)
          annotation (Line(points={{-10,-60},{-100,-60}}, color={0,0,255}));
        connect(resistor2.n, n1)
          annotation (Line(points={{10,-60},{100,-60}}, color={0,0,255}));
        connect(n, resistor1.n)
          annotation (Line(points={{100,0},{10,0}}, color={0,0,255}));
        connect(resistor.n, n2)
          annotation (Line(points={{10,60},{100,60}}, color={0,0,255}));
      end Line_R;

      model Line_L
        parameter Real Time = 1
                               "start";
        parameter Real Inductance = 0
                                     "line inductance";
        parameter Real Resistance = 0
                                     "line resistance";
        Modelica.Electrical.Analog.Interfaces.PositivePin p annotation (Placement(
              transformation(rotation=0, extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p1 annotation (Placement(
              transformation(rotation=0, extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin p2 annotation (Placement(
              transformation(rotation=0, extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n annotation (Placement(
              transformation(rotation=0, extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n1 annotation (Placement(
              transformation(rotation=0, extent={{90,-70},{110,-50}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin n2 annotation (Placement(
              transformation(rotation=0, extent={{90,50},{110,70}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor(L=Inductance)
          annotation (Placement(transformation(extent={{-12,10},{8,30}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor1(L=Inductance)
          annotation (Placement(transformation(extent={{-10,-34},{10,-14}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor2(L=Inductance)
          annotation (Placement(transformation(extent={{-10,-92},{10,-72}})));
      equation
        connect(p2, inductor.p) annotation (Line(points={{-100,60},{-18,60},{-18,
                20},{-12,20}}, color={0,0,255}));
        connect(p, inductor1.p) annotation (Line(points={{-100,0},{-16,0},{-16,
                -24},{-10,-24}}, color={0,0,255}));
        connect(p1, inductor2.p) annotation (Line(points={{-100,-60},{-16,-60},{
                -16,-82},{-10,-82}}, color={0,0,255}));
        connect(inductor.n, n2) annotation (Line(points={{8,20},{86,20},{86,60},{
                100,60}}, color={0,0,255}));
        connect(n, inductor1.n) annotation (Line(points={{100,0},{16,0},{16,-24},
                {10,-24}}, color={0,0,255}));
        connect(n1, inductor2.n) annotation (Line(points={{100,-60},{16,-60},{16,
                -82},{10,-82}}, color={0,0,255}));
      end Line_L;

      model GridWithFault_Init
        parameter Modelica.Units.SI.Voltage Vbase=6500 "base voltage L-L RMS";
        parameter Real Vgrid = 1 "p.u.";
        parameter Real FaultVoltage = 0.7 "p.u.";
        parameter Modelica.Units.SI.Time FaultTime =5 "When fault happen";
        parameter Modelica.Units.SI.Time FaultDuration = 0.1 "for how long";
        parameter Modelica.Units.SI.Time StartTime = 0
                                                      "when to initialize model";
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-64,-78})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-30,-48})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage2 annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-14,-18})));
        Modelica.Blocks.Sources.Sine sine(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=60,
          phase=2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-24})));
        Modelica.Blocks.Sources.Sine sine1(amplitude=sqrt(2)*Vbase/sqrt(3),f=60)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-54})));
        Modelica.Blocks.Sources.Sine sine2(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=60,
          phase=-2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-84})));
        Modelica.Electrical.Analog.Basic.Ground ground4
          annotation (Placement(transformation(extent={{-70,-106},{-58,-94}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin C annotation (Placement(
              transformation(rotation=0, extent={{-110,50},{-90,70}}),
              iconTransformation(extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin B annotation (
            Placement(transformation(rotation=0, extent={{-110,-10},{-90,10}}),
              iconTransformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin A annotation (
            Placement(transformation(rotation=0, extent={{-110,-70},{-90,-50}}),
              iconTransformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-76,-78})));
        Modelica.Electrical.Analog.Basic.Resistor resistor1(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-46,-48})));
        Modelica.Electrical.Analog.Basic.Resistor resistor2(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-24,-18})));
      equation
        connect(C, signalVoltage.p)
          annotation (Line(points={{-100,60},{-64,60},{-64,-68}}, color={0,0,255}));
        connect(B, signalVoltage1.p) annotation (Line(points={{-100,0},{-30,0},
                {-30,-38}}, color={0,0,255}));
        connect(A, signalVoltage2.p) annotation (Line(points={{-100,-60},{-78,-60},
                {-78,-4},{-14,-4},{-14,-8}}, color={0,0,255}));
        connect(signalVoltage2.n, ground4.p)
          annotation (Line(points={{-14,-28},{-14,-94},{-64,-94}}, color={0,0,255}));
        connect(signalVoltage1.n, ground4.p)
          annotation (Line(points={{-30,-58},{-30,-94},{-64,-94}}, color={0,0,255}));
        connect(signalVoltage.n, ground4.p)
          annotation (Line(points={{-64,-88},{-64,-94}}, color={0,0,255}));
        connect(resistor.n, signalVoltage.n)
          annotation (Line(points={{-76,-88},{-64,-88}}, color={0,0,255}));
        connect(resistor.p, signalVoltage.p)
          annotation (Line(points={{-76,-68},{-64,-68}}, color={0,0,255}));
        connect(resistor1.p, signalVoltage1.p)
          annotation (Line(points={{-46,-38},{-30,-38}}, color={0,0,255}));
        connect(resistor1.n, signalVoltage1.n)
          annotation (Line(points={{-46,-58},{-30,-58}}, color={0,0,255}));
        connect(resistor2.n, signalVoltage2.n)
          annotation (Line(points={{-24,-28},{-14,-28}}, color={0,0,255}));
        connect(resistor2.p, signalVoltage2.p)
          annotation (Line(points={{-24,-8},{-14,-8}}, color={0,0,255}));
        connect(signalVoltage2.v, sine.y) annotation (Line(points={{-2,-18},{68,
                -18},{68,-24},{73,-24}}, color={0,0,127}));
        connect(signalVoltage1.v, sine1.y) annotation (Line(points={{-18,-48},{68,
                -48},{68,-54},{73,-54}}, color={0,0,127}));
        connect(signalVoltage.v, sine2.y) annotation (Line(points={{-52,-78},{68,
                -78},{68,-84},{73,-84}}, color={0,0,127}));
        annotation (Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                  lineColor={0,0,255}), Text(
                extent={{-60,56},{104,-54}},
                textColor={0,0,255},
                textString="Grid"),
              Text(
                extent={{-92,74},{-64,44}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{-92,14},{-64,-16}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{-92,-46},{-64,-76}},
                textColor={28,108,200},
                textString="A")}));
      end GridWithFault_Init;

      model GFM_GFL_IBR_Init_SS

        Real out[12];
        //Real get_time_result;
        parameter Modelica.Units.SI.Capacitance c_filter = 0.0000627830 "Filter Capacitance";
        parameter Modelica.Units.SI.Resistance r_damp = 845 "Damping Resistance";
        parameter Modelica.Units.SI.Inductance l_filter = 0.0008965728461 "Filter Inductance";
        parameter Modelica.Units.SI.Resistance r_l = 0.021125 "Inductor Resistance";
        parameter Real Vbase = 6.5 "kV";
        parameter Real Sbase = 10 "MVA";
        parameter Real VDC_base = 13 "kV";
        parameter Real w_type = 1 "0 - PLL, 1 - Droop";
        GFM_DLL gfm_struct = GFM_DLL(c_filter,r_damp,l_filter,r_l,Vbase,Sbase,VDC_base,w_type);

        Modelica.Electrical.Analog.Basic.Resistor resistor(R=r_l)
          annotation (Placement(transformation(extent={{-30,4},{-18,16}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor(i(start=-122.771,
              fixed=true),                                                         L=
              l_filter) annotation (Placement(transformation(extent={{-10,4},{2,16}})));
        Modelica.Electrical.Analog.Basic.Capacitor c_b(v(start=0, fixed=false), C=
              c_filter) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={20,-26})));
        Modelica.Electrical.Analog.Basic.Resistor r_b(R=r_damp) annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={52,-26})));
        Modelica.Electrical.Analog.Basic.Capacitor c_c(v(start=-4596.194, fixed=false),
                                                                                C=
              c_filter) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={30,-26})));
        Modelica.Electrical.Analog.Basic.Resistor r_c(R=r_damp) annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={62,-26})));
        Modelica.Electrical.Analog.Basic.Capacitor c_a(v(start=4596.194, fixed=false),
                                                                                C=
              c_filter) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={10,-26})));
        Modelica.Electrical.Analog.Basic.Resistor r_a(R=r_damp) annotation (Placement(
              transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={42,-26})));
        Modelica.Electrical.Analog.Basic.Resistor resistor4(R=r_l)
          annotation (Placement(transformation(extent={{-26,-6},{-14,6}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start=125.846,
              fixed=true),                                                          L
            =l_filter) annotation (Placement(transformation(extent={{-6,-6},{6,6}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor5(R=r_l)
          annotation (Placement(transformation(extent={{-22,-16},{-10,-4}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start=-3.07474,
              fixed=true),                                                          L
            =l_filter)
          annotation (Placement(transformation(extent={{-2,-16},{10,-4}})));
        tools.votlage_current_sensor_no_init
                                     bridge_sensor_c
          annotation (Placement(transformation(extent={{-48,8},{-38,12}})));
        tools.votlage_current_sensor_no_init
                                     bridge_sensor_b
          annotation (Placement(transformation(extent={{-48,-2},{-38,2}})));
        tools.votlage_current_sensor_no_init
                                     bridge_sensor_a
          annotation (Placement(transformation(extent={{-48,-12},{-38,-8}})));
        tools.votlage_current_sensor_no_init
                                     grid_sensor_c
          annotation (Placement(transformation(extent={{68,8},{78,12}})));
        tools.votlage_current_sensor_no_init
                                     grid_sensor_b
          annotation (Placement(transformation(extent={{68,-2},{78,2}})));
        tools.votlage_current_sensor_no_init
                                     grid_sensor_a
          annotation (Placement(transformation(extent={{68,-12},{78,-8}})));
        Modelica.Electrical.Analog.Sources.SignalVoltage phase_c annotation (
            Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-78,-22})));
        Modelica.Electrical.Analog.Sources.SignalVoltage phase_b annotation (
            Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-66,-22})));
        Modelica.Electrical.Analog.Sources.SignalVoltage phase_a annotation (
            Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-54,-22})));
        Modelica.Electrical.Analog.Basic.Ground ground2
          annotation (Placement(transformation(extent={{-72,-56},{-60,-44}})));
        Modelica.Electrical.Analog.Basic.Ground ground1
          annotation (Placement(transformation(extent={{30,-62},{42,-50}})));

        Modelica.Electrical.Analog.Interfaces.NegativePin A annotation (Placement(
              transformation(rotation=0, extent={{90,-70},{110,-50}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin B annotation (
            Placement(transformation(rotation=0, extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin C annotation (
            Placement(transformation(rotation=0, extent={{90,50},{110,70}})));
        Modelica.Blocks.Interfaces.RealInput P_ref_pu
          annotation (Placement(transformation(extent={{-120,40},{-80,80}})));
        Modelica.Blocks.Interfaces.RealInput Q_ref_pu
          annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
        Modelica.Blocks.Interfaces.RealInput V_ref_pu
          annotation (Placement(transformation(extent={{-120,-80},{-80,-40}})));
      initial equation
        OpenIPSL.Electrical.Controls.IEEE_CIGRE.GFM_PSCAD.Functions.load_ss_state(
          gfm_struct);
      algorithm
        Functions.update(
          gfm_struct,
          time,
          grid_sensor_a.voltage,
          grid_sensor_b.voltage,
          grid_sensor_c.voltage,
          grid_sensor_a.current,
          grid_sensor_b.current,
          grid_sensor_c.current,
          bridge_sensor_a.current,
          bridge_sensor_b.current,
          bridge_sensor_c.current,
          P_ref_pu,
          Q_ref_pu,
          V_ref_pu);

        out :=Functions.model_output(gfm_struct);
        phase_a.v :=out[1]*1000;
        phase_b.v :=out[2]*1000;
        phase_c.v :=out[3]*1000;
        //Modelica.Utilities.Streams.print(String(time));
      equation
        connect(resistor.n,inductor. p)
          annotation (Line(points={{-18,10},{-10,10}},
                                                    color={0,0,255}));
        connect(resistor4.n,inductor1. p)
          annotation (Line(points={{-14,0},{-6,0}},
                                                  color={0,0,255}));
        connect(resistor5.n,inductor2. p)
          annotation (Line(points={{-10,-10},{-2,-10}},
                                                      color={0,0,255}));
        connect(c_a.p,inductor2. n)
          annotation (Line(points={{10,-20},{10,-10}}, color={0,0,255}));
        connect(resistor.p,bridge_sensor_c. n)
          annotation (Line(points={{-30,10},{-38,10}}, color={0,0,255}));
        connect(bridge_sensor_b.n,resistor4. p)
          annotation (Line(points={{-38,0},{-26,0}}, color={0,0,255}));
        connect(resistor5.p,bridge_sensor_a. n)
          annotation (Line(points={{-22,-10},{-38,-10}}, color={0,0,255}));
        connect(inductor.n,grid_sensor_c. p)
          annotation (Line(points={{2,10},{68,10}},  color={0,0,255}));
        connect(inductor1.n,grid_sensor_b. p)
          annotation (Line(points={{6,0},{68,0}},  color={0,0,255}));
        connect(inductor2.n,grid_sensor_a. p)
          annotation (Line(points={{10,-10},{68,-10}}, color={0,0,255}));
        connect(c_b.p,grid_sensor_b. p)
          annotation (Line(points={{20,-20},{20,0},{68,0}}, color={0,0,255}));
        connect(c_c.p,grid_sensor_c. p)
          annotation (Line(points={{30,-20},{30,10},{68,10}}, color={0,0,255}));
        connect(phase_b.n,ground2. p)
          annotation (Line(points={{-66,-28},{-66,-44}}, color={0,0,255}));
        connect(phase_c.n,ground2. p) annotation (Line(points={{-78,-28},{-78,-40},{-66,
                -40},{-66,-44}}, color={0,0,255}));
        connect(phase_a.n,ground2. p) annotation (Line(points={{-54,-28},{-54,-40},{-66,
                -40},{-66,-44}}, color={0,0,255}));
        connect(phase_a.p,bridge_sensor_a. p)
          annotation (Line(points={{-54,-16},{-48,-16},{-48,-10}}, color={0,0,255}));
        connect(phase_b.p,bridge_sensor_b. p)
          annotation (Line(points={{-66,-16},{-66,0},{-48,0}}, color={0,0,255}));
        connect(phase_c.p,bridge_sensor_c. p)
          annotation (Line(points={{-78,-16},{-78,10},{-48,10}}, color={0,0,255}));
        connect(r_c.p,grid_sensor_c. p)
          annotation (Line(points={{62,-20},{62,10},{68,10}}, color={0,0,255}));
        connect(r_b.p,grid_sensor_b. p)
          annotation (Line(points={{52,-20},{52,0},{68,0}}, color={0,0,255}));
        connect(r_a.p,grid_sensor_a. p)
          annotation (Line(points={{42,-20},{42,-10},{68,-10}}, color={0,0,255}));
        connect(c_a.n,r_c. n) annotation (Line(points={{10,-32},{10,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(c_b.n,r_c. n) annotation (Line(points={{20,-32},{20,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(c_c.n,r_c. n) annotation (Line(points={{30,-32},{30,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(r_a.n,r_c. n) annotation (Line(points={{42,-32},{42,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(r_b.n,r_c. n) annotation (Line(points={{52,-32},{52,-36},{62,-36},{62,
                -32}}, color={0,0,255}));
        connect(ground1.p,r_c. n) annotation (Line(points={{36,-50},{36,-36},{62,-36},
                {62,-32}}, color={0,0,255}));
        connect(A, grid_sensor_a.n)
          annotation (Line(points={{100,-60},{84,-60},{84,-10},{78,-10}},
                                                                  color={0,0,255}));
        connect(B, grid_sensor_b.n)
          annotation (Line(points={{100,0},{78,0}}, color={0,0,255}));
        connect(C, grid_sensor_c.n) annotation (Line(points={{100,60},{84,60},{
                84,10},{78,10}}, color={0,0,255}));
        annotation (Icon(graphics={
              Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
              Line(points={{-100,100},{100,-100}}, color={28,108,200}),
              Text(
                extent={{-44,106},{48,40}},
                textColor={28,108,200},
                textString="AC"),
              Text(
                extent={{-46,-40},{46,-106}},
                textColor={28,108,200},
                textString="DC"),
              Text(
                extent={{64,74},{92,44}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{64,14},{92,-16}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{64,-46},{92,-76}},
                textColor={28,108,200},
                textString="A")}));
      end GFM_GFL_IBR_Init_SS;

      model GridWithFault
        parameter Modelica.Units.SI.Voltage Vbase=6500 "base voltage L-L RMS";
        parameter Real Vgrid = 1 "p.u.";
        parameter Real FaultVoltage = 0.7 "p.u.";
        parameter Modelica.Units.SI.Time FaultTime =5 "When fault happen";
        parameter Modelica.Units.SI.Time FaultDuration = 0.1 "for how long";
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-64,-78})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1 annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-30,-48})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage2 annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-14,-18})));
        Modelica.Blocks.Sources.Sine sine(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=60,
          phase=2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-24})));
        Modelica.Blocks.Sources.Sine sine1(amplitude=sqrt(2)*Vbase/sqrt(3),f=60)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-54})));
        Modelica.Blocks.Sources.Sine sine2(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=60,
          phase=-2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-84})));
        Modelica.Electrical.Analog.Basic.Ground ground4
          annotation (Placement(transformation(extent={{-70,-106},{-58,-94}})));
        Modelica.Blocks.Sources.Step step1(
          height=FaultVoltage - Vgrid,
          offset=Vgrid,
          startTime=FaultTime)
                       annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={28,82})));
        Modelica.Blocks.Math.Product product1 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={18,-18})));
        Modelica.Blocks.Math.Product product2 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={18,-48})));
        Modelica.Blocks.Math.Product product3 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={18,-78})));
        Modelica.Blocks.Continuous.FirstOrder firstOrder(
          k=1,
          T=0.0001,
          initType=Modelica.Blocks.Types.Init.InitialState,
          y_start=1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={44,18})));
        Modelica.Blocks.Sources.Step step2(
          height=Vgrid - FaultVoltage,
          offset=0,
          startTime=FaultTime + FaultDuration)
                         annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={60,82})));
        Modelica.Blocks.Math.Add add annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={44,46})));
        Modelica.Electrical.Analog.Interfaces.PositivePin C annotation (Placement(
              transformation(rotation=0, extent={{-110,50},{-90,70}}),
              iconTransformation(extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin B annotation (
            Placement(transformation(rotation=0, extent={{-110,-10},{-90,10}}),
              iconTransformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin A annotation (
            Placement(transformation(rotation=0, extent={{-110,-70},{-90,-50}}),
              iconTransformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-76,-78})));
        Modelica.Electrical.Analog.Basic.Resistor resistor1(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-46,-48})));
        Modelica.Electrical.Analog.Basic.Resistor resistor2(R=1e6) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-24,-18})));
      equation
        connect(product1.u1,sine. y)
          annotation (Line(points={{30,-24},{73,-24}},     color={0,0,127}));
        connect(product2.u1,sine1. y)
          annotation (Line(points={{30,-54},{73,-54}},     color={0,0,127}));
        connect(product3.u1,sine2. y)
          annotation (Line(points={{30,-84},{73,-84}},     color={0,0,127}));
        connect(product1.y,signalVoltage2. v) annotation (Line(points={{7,-18},{-2,-18}},
                                            color={0,0,127}));
        connect(product2.y,signalVoltage1. v) annotation (Line(points={{7,-48},{-18,-48}},
                                  color={0,0,127}));
        connect(product3.y,signalVoltage. v) annotation (Line(points={{7,-78},{-52,-78}},
                                  color={0,0,127}));
        connect(firstOrder.y,product1. u2)
          annotation (Line(points={{44,7},{44,-12},{30,-12}},      color={0,0,127}));
        connect(product2.u2,firstOrder. y) annotation (Line(points={{30,-42},{44,-42},
                {44,7}},    color={0,0,127}));
        connect(product3.u2,firstOrder. y) annotation (Line(points={{30,-72},{44,-72},
                {44,7}},    color={0,0,127}));
        connect(firstOrder.u,add. y)
          annotation (Line(points={{44,30},{44,35}},     color={0,0,127}));
        connect(step1.y,add. u2) annotation (Line(points={{28,71},{28,68},{38,68},{38,
                58}},                           color={0,0,127}));
        connect(step2.y,add. u1) annotation (Line(points={{60,71},{60,68},{50,68},{50,
                58}},                           color={0,0,127}));
        connect(C, signalVoltage.p)
          annotation (Line(points={{-100,60},{-64,60},{-64,-68}}, color={0,0,255}));
        connect(B, signalVoltage1.p) annotation (Line(points={{-100,0},{-30,0},
                {-30,-38}}, color={0,0,255}));
        connect(A, signalVoltage2.p) annotation (Line(points={{-100,-60},{-78,-60},
                {-78,-4},{-14,-4},{-14,-8}}, color={0,0,255}));
        connect(signalVoltage2.n, ground4.p)
          annotation (Line(points={{-14,-28},{-14,-94},{-64,-94}}, color={0,0,255}));
        connect(signalVoltage1.n, ground4.p)
          annotation (Line(points={{-30,-58},{-30,-94},{-64,-94}}, color={0,0,255}));
        connect(signalVoltage.n, ground4.p)
          annotation (Line(points={{-64,-88},{-64,-94}}, color={0,0,255}));
        connect(resistor.n, signalVoltage.n)
          annotation (Line(points={{-76,-88},{-64,-88}}, color={0,0,255}));
        connect(resistor.p, signalVoltage.p)
          annotation (Line(points={{-76,-68},{-64,-68}}, color={0,0,255}));
        connect(resistor1.p, signalVoltage1.p)
          annotation (Line(points={{-46,-38},{-30,-38}}, color={0,0,255}));
        connect(resistor1.n, signalVoltage1.n)
          annotation (Line(points={{-46,-58},{-30,-58}}, color={0,0,255}));
        connect(resistor2.n, signalVoltage2.n)
          annotation (Line(points={{-24,-28},{-14,-28}}, color={0,0,255}));
        connect(resistor2.p, signalVoltage2.p)
          annotation (Line(points={{-24,-8},{-14,-8}}, color={0,0,255}));
        annotation (Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                  lineColor={0,0,255}), Text(
                extent={{-64,58},{100,-52}},
                textColor={0,0,255},
                textString="Grid"),
              Text(
                extent={{-94,74},{-66,44}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{-94,14},{-66,-16}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{-94,-46},{-66,-76}},
                textColor={28,108,200},
                textString="A")}));
      end GridWithFault;

      model PSCADGrid
        parameter Modelica.Units.SI.Voltage Vbase=6500 "base voltage L-L RMS";
        parameter Modelica.Units.SI.Frequency f = 60 "Grid frequency(Hz)";
        parameter Modelica.Units.SI.Resistance Rpos=0.1953 "Source positive sequence resistance";
        parameter Modelica.Units.SI.Inductance Xpos=3.3200 "Source positive sequence reactance";

        Modelica.Blocks.Sources.Sine sine(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=f,
          phase=2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-80})));
        Modelica.Blocks.Sources.Sine sine1(amplitude=sqrt(2)*Vbase/sqrt(3), f=f)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-20})));
        Modelica.Blocks.Sources.Sine sine2(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=f,
          phase=-2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={80,40})));
        Modelica.Electrical.Analog.Basic.Ground ground4
          annotation (Placement(transformation(extent={{54,-112},{66,-100}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin C annotation (Placement(
              transformation(rotation=0, extent={{-110,50},{-90,70}}),
              iconTransformation(extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin B annotation (
            Placement(transformation(rotation=0, extent={{-110,-10},{-90,10}}),
              iconTransformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin A annotation (
            Placement(transformation(rotation=0, extent={{-110,-70},{-90,-50}}),
              iconTransformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor(i(start=0),
                                                           L=Xpos/(2*Modelica.Constants.pi
              *f))
          annotation (Placement(transformation(extent={{-80,50},{-60,70}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor3(R=Rpos)
          annotation (Placement(transformation(extent={{-56,50},{-36,70}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start=0),
                                                            L=Xpos/(2*Modelica.Constants.pi
              *f))
          annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor4(R=Rpos)
          annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start=0),
                                                            L=Xpos/(2*Modelica.Constants.pi
              *f))
          annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor5(R=Rpos)
          annotation (Placement(transformation(extent={{-56,-70},{-36,-50}})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,40})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage2
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,-20})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage3
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,-80})));
        Modelica.Blocks.Continuous.FirstOrder firstOrder(
          k=1,
          T=0.0001,
          initType=Modelica.Blocks.Types.Init.InitialState,
          y_start=1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={16,40})));
        Modelica.Blocks.Continuous.FirstOrder firstOrder1(
          k=1,
          T=0.0001,
          initType=Modelica.Blocks.Types.Init.InitialState,
          y_start=1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={18,-20})));
        Modelica.Blocks.Continuous.FirstOrder firstOrder2(
          k=1,
          T=0.0001,
          initType=Modelica.Blocks.Types.Init.InitialState,
          y_start=1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={18,-80})));
      equation
        connect(C, inductor.p)
          annotation (Line(points={{-100,60},{-80,60}}, color={0,0,255}));
        connect(inductor.n, resistor3.p)
          annotation (Line(points={{-60,60},{-56,60}}, color={0,0,255}));
        connect(inductor1.n, resistor4.p)
          annotation (Line(points={{-60,0},{-56,0}}, color={0,0,255}));
        connect(A, inductor2.p)
          annotation (Line(points={{-100,-60},{-80,-60}}, color={0,0,255}));
        connect(inductor2.n, resistor5.p)
          annotation (Line(points={{-60,-60},{-56,-60}}, color={0,0,255}));
        connect(signalVoltage3.n, ground4.p) annotation (Line(points={{-20,-90},
                {-20,-100},{60,-100}}, color={0,0,255}));
        connect(ground4.p, signalVoltage2.n) annotation (Line(points={{60,-100},
                {60,-40},{-20,-40},{-20,-30}}, color={0,0,255}));
        connect(signalVoltage1.n, signalVoltage2.n) annotation (Line(points={{
                -20,30},{60,30},{60,-40},{-20,-40},{-20,-30}}, color={0,0,255}));
        connect(B, inductor1.p)
          annotation (Line(points={{-100,0},{-80,0}}, color={0,0,255}));
        connect(signalVoltage1.v, firstOrder.y)
          annotation (Line(points={{-8,40},{5,40}}, color={0,0,127}));
        connect(firstOrder.u, sine2.y)
          annotation (Line(points={{28,40},{69,40}}, color={0,0,127}));
        connect(firstOrder1.y, signalVoltage2.v)
          annotation (Line(points={{7,-20},{-8,-20}}, color={0,0,127}));
        connect(firstOrder1.u, sine1.y)
          annotation (Line(points={{30,-20},{73,-20}}, color={0,0,127}));
        connect(signalVoltage3.v, firstOrder2.y)
          annotation (Line(points={{-8,-80},{7,-80}}, color={0,0,127}));
        connect(firstOrder2.u, sine.y)
          annotation (Line(points={{30,-80},{73,-80}}, color={0,0,127}));
        connect(resistor5.n, signalVoltage3.p) annotation (Line(points={{-36,
                -60},{-20,-60},{-20,-70}}, color={0,0,255}));
        connect(resistor4.n, signalVoltage2.p) annotation (Line(points={{-36,0},
                {-20,0},{-20,-10}}, color={0,0,255}));
        connect(resistor3.n, signalVoltage1.p) annotation (Line(points={{-36,60},
                {-20,60},{-20,50}}, color={0,0,255}));
        connect(B, B)
          annotation (Line(points={{-100,0},{-100,0}}, color={0,0,255}));
        annotation (Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                  lineColor={28,108,200},
                lineThickness=0.5),
              Text(
                extent={{-92,74},{-64,44}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{-92,14},{-64,-16}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{-92,-46},{-64,-76}},
                textColor={28,108,200},
                textString="A"),
              Line(
                points={{-70,0},{-52,0}},
                color={28,108,200},
                thickness=0.5),
              Rectangle(
                extent={{-52,8},{0,-8}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{0,0},{10,0}},
                color={28,108,200},
                thickness=0.5),
              Ellipse(
                extent={{20,30},{80,-30}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{30,0},{42,10},{58,-10},{70,0}},
                color={28,108,200},
                thickness=1,
                smooth=Smooth.Bezier),
              Line(
                points={{-70,-60},{-52,-60}},
                color={238,46,47},
                thickness=0.5),
              Rectangle(
                extent={{-52,-52},{0,-68}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{0,-60},{10,-60}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{-70,60},{-52,60}},
                color={0,140,72},
                thickness=0.5),
              Rectangle(
                extent={{-52,68},{0,52}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{10,60},{10,-60}},
                color={0,0,0},
                thickness=1),
              Line(
                points={{0,60},{10,60}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{10,0},{20,0}},
                color={0,0,0},
                thickness=1)}));
      end PSCADGrid;

      model EMTPGrid
        parameter Modelica.Units.SI.Voltage Vbase=6500 "base voltage L-L RMS";
        parameter Modelica.Units.SI.Frequency f = 60 "Grid frequency(Hz)";
        parameter Modelica.Units.SI.Resistance Rpos=0.1953 "Source positive sequence resistance";
        parameter Modelica.Units.SI.Inductance Xpos=3.3200 "Source positive sequence reactance";
        parameter SI.Resistance GroundingResistance=1e9;

        Modelica.Blocks.Sources.Sine sine(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=f,
          phase=2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-80})));
        Modelica.Blocks.Sources.Sine sine1(amplitude=sqrt(2)*Vbase/sqrt(3), f=f)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={84,-20})));
        Modelica.Blocks.Sources.Sine sine2(
          amplitude=sqrt(2)*Vbase/sqrt(3),
          f=f,
          phase=-2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={80,40})));
        Modelica.Electrical.Analog.Basic.Ground ground4
          annotation (Placement(transformation(extent={{54,-112},{66,-100}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin C annotation (Placement(
              transformation(rotation=0, extent={{-110,50},{-90,70}}),
              iconTransformation(extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin B annotation (
            Placement(transformation(rotation=0, extent={{-110,-10},{-90,10}}),
              iconTransformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin A annotation (
            Placement(transformation(rotation=0, extent={{-110,-70},{-90,-50}}),
              iconTransformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor(i(start=0),
                                                           L=Xpos/(2*Modelica.Constants.pi
              *f))
          annotation (Placement(transformation(extent={{-80,50},{-60,70}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor3(R=Rpos)
          annotation (Placement(transformation(extent={{-56,50},{-36,70}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start=0),
                                                            L=Xpos/(2*Modelica.Constants.pi
              *f))
          annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor4(R=Rpos)
          annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start=0),
                                                            L=Xpos/(2*Modelica.Constants.pi
              *f))
          annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor5(R=Rpos)
          annotation (Placement(transformation(extent={{-56,-70},{-36,-50}})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,40})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage2
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,-20})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage3
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,-80})));
        Modelica.Blocks.Continuous.FirstOrder firstOrder(
          k=1,
          T=0.0001,
          initType=Modelica.Blocks.Types.Init.InitialState,
          y_start=1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={16,40})));
        Modelica.Blocks.Continuous.FirstOrder firstOrder1(
          k=1,
          T=0.0001,
          initType=Modelica.Blocks.Types.Init.InitialState,
          y_start=1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={18,-20})));
        Modelica.Blocks.Continuous.FirstOrder firstOrder2(
          k=1,
          T=0.0001,
          initType=Modelica.Blocks.Types.Init.InitialState,
          y_start=1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={18,-80})));
        Modelica.Electrical.Analog.Basic.Ground ground1
          annotation (Placement(transformation(extent={{-106,16},{-94,28}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor1(R=GroundingResistance)
                                   annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-100,42})));
        Modelica.Electrical.Analog.Basic.Ground ground2
          annotation (Placement(transformation(extent={{-106,-46},{-94,-34}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor2(R=GroundingResistance)
                                   annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-100,-20})));
        Modelica.Electrical.Analog.Basic.Ground ground3
          annotation (Placement(transformation(extent={{-106,-104},{-94,-92}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor6(R=GroundingResistance)
                                   annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-100,-78})));
      equation
        connect(C, inductor.p)
          annotation (Line(points={{-100,60},{-80,60}}, color={0,0,255}));
        connect(inductor.n, resistor3.p)
          annotation (Line(points={{-60,60},{-56,60}}, color={0,0,255}));
        connect(inductor1.n, resistor4.p)
          annotation (Line(points={{-60,0},{-56,0}}, color={0,0,255}));
        connect(A, inductor2.p)
          annotation (Line(points={{-100,-60},{-80,-60}}, color={0,0,255}));
        connect(inductor2.n, resistor5.p)
          annotation (Line(points={{-60,-60},{-56,-60}}, color={0,0,255}));
        connect(signalVoltage3.n, ground4.p) annotation (Line(points={{-20,-90},
                {-20,-100},{60,-100}}, color={0,0,255}));
        connect(ground4.p, signalVoltage2.n) annotation (Line(points={{60,-100},
                {60,-40},{-20,-40},{-20,-30}}, color={0,0,255}));
        connect(signalVoltage1.n, signalVoltage2.n) annotation (Line(points={{
                -20,30},{60,30},{60,-40},{-20,-40},{-20,-30}}, color={0,0,255}));
        connect(B, inductor1.p)
          annotation (Line(points={{-100,0},{-80,0}}, color={0,0,255}));
        connect(signalVoltage1.v, firstOrder.y)
          annotation (Line(points={{-8,40},{5,40}}, color={0,0,127}));
        connect(firstOrder.u, sine2.y)
          annotation (Line(points={{28,40},{69,40}}, color={0,0,127}));
        connect(firstOrder1.y, signalVoltage2.v)
          annotation (Line(points={{7,-20},{-8,-20}}, color={0,0,127}));
        connect(firstOrder1.u, sine1.y)
          annotation (Line(points={{30,-20},{73,-20}}, color={0,0,127}));
        connect(signalVoltage3.v, firstOrder2.y)
          annotation (Line(points={{-8,-80},{7,-80}}, color={0,0,127}));
        connect(firstOrder2.u, sine.y)
          annotation (Line(points={{30,-80},{73,-80}}, color={0,0,127}));
        connect(resistor5.n, signalVoltage3.p) annotation (Line(points={{-36,
                -60},{-20,-60},{-20,-70}}, color={0,0,255}));
        connect(resistor4.n, signalVoltage2.p) annotation (Line(points={{-36,0},
                {-20,0},{-20,-10}}, color={0,0,255}));
        connect(resistor3.n, signalVoltage1.p) annotation (Line(points={{-36,60},
                {-20,60},{-20,50}}, color={0,0,255}));
        connect(B, B)
          annotation (Line(points={{-100,0},{-100,0}}, color={0,0,255}));
        connect(ground1.p,resistor1. n)
          annotation (Line(points={{-100,28},{-100,36}},
                                                       color={0,0,255}));
        connect(resistor1.p, C)
          annotation (Line(points={{-100,48},{-100,60}}, color={0,0,255}));
        connect(ground2.p,resistor2. n)
          annotation (Line(points={{-100,-34},{-100,-26}},
                                                       color={0,0,255}));
        connect(resistor2.p, B)
          annotation (Line(points={{-100,-14},{-100,0}}, color={0,0,255}));
        connect(ground3.p,resistor6. n)
          annotation (Line(points={{-100,-92},{-100,-84}},
                                                       color={0,0,255}));
        connect(resistor6.p, A)
          annotation (Line(points={{-100,-72},{-100,-60}}, color={0,0,255}));
        annotation (Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                  lineColor={28,108,200},
                lineThickness=0.5),
              Text(
                extent={{-92,74},{-64,44}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{-92,14},{-64,-16}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{-92,-46},{-64,-76}},
                textColor={28,108,200},
                textString="A"),
              Line(
                points={{-70,0},{-52,0}},
                color={28,108,200},
                thickness=0.5),
              Rectangle(
                extent={{-52,8},{0,-8}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{0,0},{10,0}},
                color={28,108,200},
                thickness=0.5),
              Ellipse(
                extent={{20,30},{80,-30}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{30,0},{42,10},{58,-10},{70,0}},
                color={28,108,200},
                thickness=1,
                smooth=Smooth.Bezier),
              Line(
                points={{-70,-60},{-52,-60}},
                color={238,46,47},
                thickness=0.5),
              Rectangle(
                extent={{-52,-52},{0,-68}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{0,-60},{10,-60}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{-70,60},{-52,60}},
                color={0,140,72},
                thickness=0.5),
              Rectangle(
                extent={{-52,68},{0,52}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{10,60},{10,-60}},
                color={0,0,0},
                thickness=1),
              Line(
                points={{0,60},{10,60}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{10,0},{20,0}},
                color={0,0,0},
                thickness=1)}));
      end EMTPGrid;

      model DeltaGrid
        parameter Modelica.Units.SI.Voltage Vbase=6500 "base voltage L-L RMS";
        parameter Modelica.Units.SI.Frequency f = 60 "Grid frequency(Hz)";
        parameter Modelica.Units.SI.Resistance Rpos=0.1953 "Source positive sequence resistance";
        parameter Modelica.Units.SI.Inductance Xpos=3.3200 "Source positive sequence reactance";

        parameter SI.Resistance GroundingResistance=1e9
          "Resistance at temperature T_ref";
        parameter SI.Resistance Rtf_delta=0.5 "Resistance at temperature T_ref";

        Modelica.Blocks.Sources.Sine sine(
          amplitude=sqrt(2)*Vbase,
          f=f,
          phase=2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={168,-80})));
        Modelica.Blocks.Sources.Sine sine1(amplitude=sqrt(2)*Vbase,         f=f)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={168,-20})));
        Modelica.Blocks.Sources.Sine sine2(
          amplitude=sqrt(2)*Vbase,
          f=f,
          phase=-2.0943951023932) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={164,40})));
        Modelica.Electrical.Analog.Interfaces.PositivePin C annotation (Placement(
              transformation(rotation=0, extent={{-110,50},{-90,70}}),
              iconTransformation(extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin B annotation (
            Placement(transformation(rotation=0, extent={{-110,-10},{-90,10}}),
              iconTransformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin A annotation (
            Placement(transformation(rotation=0, extent={{-110,-70},{-90,-50}}),
              iconTransformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor(i(start=0),
                                                           L=Xpos/(2*Modelica.Constants.pi
              *f))
          annotation (Placement(transformation(extent={{-80,50},{-60,70}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor3(R=Rpos)
          annotation (Placement(transformation(extent={{-56,50},{-36,70}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start=0),
                                                            L=Xpos/(2*Modelica.Constants.pi
              *f))
          annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor4(R=Rpos)
          annotation (Placement(transformation(extent={{-56,-10},{-36,10}})));
        Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start=0),
                                                            L=Xpos/(2*Modelica.Constants.pi
              *f))
          annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor5(R=Rpos)
          annotation (Placement(transformation(extent={{-56,-70},{-36,-50}})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage1
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={64,40})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage2
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={64,-20})));
        Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage3
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={64,-80})));
        Modelica.Blocks.Continuous.FirstOrder firstOrder(
          k=1,
          T=0.0001,
          initType=Modelica.Blocks.Types.Init.InitialState,
          y_start=1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={100,40})));
        Modelica.Blocks.Continuous.FirstOrder firstOrder1(
          k=1,
          T=0.0001,
          initType=Modelica.Blocks.Types.Init.InitialState,
          y_start=1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={102,-20})));
        Modelica.Blocks.Continuous.FirstOrder firstOrder2(
          k=1,
          T=0.0001,
          initType=Modelica.Blocks.Types.Init.InitialState,
          y_start=1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={102,-80})));
        Modelica.Electrical.Analog.Basic.Ground ground1
          annotation (Placement(transformation(extent={{-106,18},{-94,30}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor1(R=GroundingResistance)
                                   annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-100,44})));
        Modelica.Electrical.Analog.Basic.Ground ground2
          annotation (Placement(transformation(extent={{-106,-48},{-94,-36}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor2(R=GroundingResistance)
                                   annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-100,-22})));
        Modelica.Electrical.Analog.Basic.Ground ground3
          annotation (Placement(transformation(extent={{-106,-104},{-94,-92}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor6(R=GroundingResistance)
                                   annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={-100,-78})));
        Modelica.Electrical.Analog.Basic.Resistor resistor(R=Rtf_delta)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={64,14})));
        Modelica.Electrical.Analog.Basic.Resistor resistor7(R=Rtf_delta)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={64,-46})));
        Modelica.Electrical.Analog.Basic.Resistor resistor8(R=Rtf_delta)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={24,-28})));
      equation
        connect(C, inductor.p)
          annotation (Line(points={{-100,60},{-80,60}}, color={0,0,255}));
        connect(inductor.n, resistor3.p)
          annotation (Line(points={{-60,60},{-56,60}}, color={0,0,255}));
        connect(inductor1.n, resistor4.p)
          annotation (Line(points={{-60,0},{-56,0}}, color={0,0,255}));
        connect(A, inductor2.p)
          annotation (Line(points={{-100,-60},{-80,-60}}, color={0,0,255}));
        connect(inductor2.n, resistor5.p)
          annotation (Line(points={{-60,-60},{-56,-60}}, color={0,0,255}));
        connect(B, inductor1.p)
          annotation (Line(points={{-100,0},{-80,0}}, color={0,0,255}));
        connect(signalVoltage1.v, firstOrder.y)
          annotation (Line(points={{76,40},{89,40}},color={0,0,127}));
        connect(firstOrder.u, sine2.y)
          annotation (Line(points={{112,40},{153,40}},
                                                     color={0,0,127}));
        connect(firstOrder1.y, signalVoltage2.v)
          annotation (Line(points={{91,-20},{76,-20}},color={0,0,127}));
        connect(firstOrder1.u, sine1.y)
          annotation (Line(points={{114,-20},{157,-20}},
                                                       color={0,0,127}));
        connect(signalVoltage3.v, firstOrder2.y)
          annotation (Line(points={{76,-80},{91,-80}},color={0,0,127}));
        connect(firstOrder2.u, sine.y)
          annotation (Line(points={{114,-80},{157,-80}},
                                                       color={0,0,127}));
        connect(resistor5.n, signalVoltage3.p) annotation (Line(points={{-36,-60},{64,
                -60},{64,-70}},            color={0,0,255}));
        connect(resistor4.n, signalVoltage2.p) annotation (Line(points={{-36,0},{64,0},
                {64,-10}},          color={0,0,255}));
        connect(resistor3.n, signalVoltage1.p) annotation (Line(points={{-36,60},{64,60},
                {64,50}},           color={0,0,255}));
        connect(B, B)
          annotation (Line(points={{-100,0},{-100,0}}, color={0,0,255}));
        connect(ground1.p,resistor1. n)
          annotation (Line(points={{-100,30},{-100,38}},
                                                       color={0,0,255}));
        connect(ground2.p,resistor2. n)
          annotation (Line(points={{-100,-36},{-100,-28}},
                                                       color={0,0,255}));
        connect(ground3.p,resistor6. n)
          annotation (Line(points={{-100,-92},{-100,-84}},
                                                       color={0,0,255}));
        connect(resistor6.p, A)
          annotation (Line(points={{-100,-72},{-100,-60}}, color={0,0,255}));
        connect(resistor2.p, B)
          annotation (Line(points={{-100,-16},{-100,0}}, color={0,0,255}));
        connect(resistor1.p, C)
          annotation (Line(points={{-100,50},{-100,60}}, color={0,0,255}));
        connect(resistor.p, signalVoltage1.n)
          annotation (Line(points={{64,24},{64,30}}, color={0,0,255}));
        connect(resistor.n, signalVoltage2.p)
          annotation (Line(points={{64,4},{64,-10}}, color={0,0,255}));
        connect(resistor7.p, signalVoltage2.n)
          annotation (Line(points={{64,-36},{64,-30}}, color={0,0,255}));
        connect(resistor7.n, signalVoltage3.p)
          annotation (Line(points={{64,-56},{64,-70}}, color={0,0,255}));
        connect(resistor8.n, signalVoltage3.n) annotation (Line(points={{24,-38},{24,-96},
                {64,-96},{64,-90}}, color={0,0,255}));
        connect(resistor8.p, signalVoltage1.p) annotation (Line(points={{24,-18},{24,60},
                {64,60},{64,50}}, color={0,0,255}));
        annotation (Icon(graphics={Rectangle(extent={{-100,100},{100,-100}},
                  lineColor={28,108,200},
                lineThickness=0.5),
              Text(
                extent={{-92,74},{-64,44}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{-92,14},{-64,-16}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{-92,-46},{-64,-76}},
                textColor={28,108,200},
                textString="A"),
              Line(
                points={{-70,0},{-52,0}},
                color={28,108,200},
                thickness=0.5),
              Rectangle(
                extent={{-52,8},{0,-8}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{0,0},{10,0}},
                color={28,108,200},
                thickness=0.5),
              Ellipse(
                extent={{20,30},{80,-30}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-70,-60},{-52,-60}},
                color={238,46,47},
                thickness=0.5),
              Rectangle(
                extent={{-52,-52},{0,-68}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{0,-60},{10,-60}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{-70,60},{-52,60}},
                color={0,140,72},
                thickness=0.5),
              Rectangle(
                extent={{-52,68},{0,52}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(
                points={{10,60},{10,-60}},
                color={0,0,0},
                thickness=1),
              Line(
                points={{0,60},{10,60}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{10,0},{20,0}},
                color={0,0,0},
                thickness=1),
              Line(points={{50,30},{28,-20},{72,-20},{50,30}}, color={28,108,200})}));
      end DeltaGrid;

      model ShortFault
        parameter Modelica.Units.SI.Resistance R = 5 "Short resistance to ground";
        parameter Modelica.Units.SI.Time faultTime = 5;
        parameter Modelica.Units.SI.Time faultDuration = 0.1;
        parameter Real Ron=1e-5 "Switch on resistance";
        parameter Real Goff=0.0006 "Switch on resistance";
        parameter Real line_capacitance = 1e-6
                                              "line to ground capacitance";
        Modelica.Electrical.Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-10,-168},{10,-148}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor(R=R) annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,-132})));
        Modelica.Electrical.Analog.Interfaces.Pin C
          annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin B
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin A
          annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin C_n
          annotation (Placement(transformation(extent={{90,50},{110,70}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin B_n
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin A_n
          annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor1(R=R) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-132})));
        Modelica.Electrical.Analog.Basic.Resistor resistor2(R=R) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={20,-132})));
        Modelica.Electrical.Analog.Ideal.IdealClosingSwitch           switch(
          Ron=Ron,
          Goff=Goff) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-20,16})));
        Modelica.Electrical.Analog.Ideal.IdealClosingSwitch           switch1(
          Ron=Ron,
          Goff=Goff) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={0,-42})));
        Modelica.Electrical.Analog.Ideal.IdealClosingSwitch           switch2(
          Ron=Ron,
          Goff=Goff) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={20,-100})));
        Modelica.Blocks.Sources.BooleanTable booleanTable(
          table={faultTime,faultDuration + faultTime},
          startValue=false,
          extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
          annotation (Placement(transformation(extent={{-146,-52},{-126,-32}})));
        tools.zeroXdetect zeroXdetectC
          annotation (Placement(transformation(extent={{-60,6},{-40,26}})));
        tools.zeroXdetect zeroXdetectB
          annotation (Placement(transformation(extent={{-62,-52},{-42,-32}})));
        tools.zeroXdetect zeroXdetectA
          annotation (Placement(transformation(extent={{-60,-110},{-40,-90}})));
        Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
          annotation (Placement(transformation(extent={{48,50},{28,70}})));
        Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1
          annotation (Placement(transformation(extent={{50,-10},{30,10}})));
        Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor2
          annotation (Placement(transformation(extent={{50,-70},{30,-50}})));
      equation
        connect(C, C)
          annotation (Line(points={{-100,60},{-100,60}}, color={0,0,255}));
        connect(resistor.n, ground.p)
          annotation (Line(points={{-20,-142},{-20,-148},{0,-148}},
                                                           color={0,0,255}));
        connect(resistor1.n, ground.p)
          annotation (Line(points={{0,-142},{0,-148}},            color={0,0,255}));
        connect(resistor2.n, resistor1.n) annotation (Line(points={{20,-142},{20,-148},
                {0,-148},{0,-142}}, color={0,0,255}));
        connect(resistor.p, switch.p)
          annotation (Line(points={{-20,-122},{-20,6}},   color={0,0,255}));
        connect(resistor1.p, switch1.p)
          annotation (Line(points={{0,-122},{0,-52}}, color={0,0,255}));
        connect(switch2.p, resistor2.p)
          annotation (Line(points={{20,-110},{20,-122}},color={0,0,255}));
        connect(resistor2.n, ground.p)
          annotation (Line(points={{20,-142},{20,-148},{0,-148}}, color={0,0,255}));
        connect(zeroXdetectC.y, switch.control)
          annotation (Line(points={{-39,16},{-32,16}}, color={255,0,255}));
        connect(zeroXdetectB.y, switch1.control)
          annotation (Line(points={{-41,-42},{-12,-42}}, color={255,0,255}));
        connect(zeroXdetectA.y, switch2.control)
          annotation (Line(points={{-39,-100},{8,-100}}, color={255,0,255}));
        connect(booleanTable.y, zeroXdetectC.u) annotation (Line(points={{-125,-42},{-114,
                -42},{-114,16},{-60,16}}, color={255,0,255}));
        connect(zeroXdetectB.u, booleanTable.y)
          annotation (Line(points={{-62,-42},{-125,-42}}, color={255,0,255}));
        connect(zeroXdetectA.u, booleanTable.y) annotation (Line(points={{-60,-100},{-114,
                -100},{-114,-42},{-125,-42}}, color={255,0,255}));

        connect(currentSensor.p, C_n)
          annotation (Line(points={{48,60},{100,60}}, color={0,0,255}));
        connect(currentSensor.n, C)
          annotation (Line(points={{28,60},{-100,60}}, color={0,0,255}));
        connect(currentSensor.i, zeroXdetectC.u1) annotation (Line(points={{38,49},{38,
                36},{-50,36},{-50,26}}, color={0,0,127}));
        connect(switch.n, C)
          annotation (Line(points={{-20,26},{-20,60},{-100,60}}, color={0,0,255}));
        connect(currentSensor1.p, B_n)
          annotation (Line(points={{50,0},{100,0}}, color={0,0,255}));
        connect(currentSensor1.n, B)
          annotation (Line(points={{30,0},{-100,0}}, color={0,0,255}));
        connect(zeroXdetectB.u1, currentSensor1.i) annotation (Line(points={{-52,-32},
                {-52,-24},{40,-24},{40,-11}}, color={0,0,127}));
        connect(currentSensor2.p, A_n)
          annotation (Line(points={{50,-60},{100,-60}}, color={0,0,255}));
        connect(currentSensor2.n, A)
          annotation (Line(points={{30,-60},{-100,-60}}, color={0,0,255}));
        connect(zeroXdetectA.u1, currentSensor2.i) annotation (Line(points={{-50,-90},
                {-50,-80},{40,-80},{40,-71}}, color={0,0,127}));
        connect(switch1.n, B)
          annotation (Line(points={{0,-32},{0,0},{-100,0}}, color={0,0,255}));
        connect(switch2.n, A)
          annotation (Line(points={{20,-90},{20,-60},{-100,-60}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                  -100,-140},{100,100}}), graphics={
              Rectangle(
                extent={{-100,100},{100,-140}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
                                     Rectangle(
                extent={{-72,46},{-48,6}},
                lineColor={0,0,0},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Line(
                points={{-60,6},{-60,6},{-60,-6}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-72,-6},{-48,-6}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-70,-10},{-50,-10}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-66,-14},{-52,-14}},
                color={0,0,255},
                smooth=Smooth.None),Rectangle(
                extent={{-64,50},{-56,46}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Line(
                points={{-62,48},{-54,30},{-68,30},{-56,8}},
                color={255,0,0},
                smooth=Smooth.None,
                thickness=0.5),Line(
                points={{-62,10},{-56,8},{-56,14}},
                color={255,0,0},
                smooth=Smooth.None), Rectangle(
                extent={{-12,-12},{12,-52}},
                lineColor={0,0,0},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Line(
                points={{0,-52},{0,-52},{0,-64}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-12,-64},{12,-64}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-10,-68},{10,-68}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-6,-72},{8,-72}},
                color={0,0,255},
                smooth=Smooth.None),Rectangle(
                extent={{-4,-8},{4,-12}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Line(
                points={{-2,-10},{6,-28},{-8,-28},{4,-50}},
                color={255,0,0},
                smooth=Smooth.None,
                thickness=0.5),Line(
                points={{-2,-48},{4,-50},{4,-44}},
                color={255,0,0},
                smooth=Smooth.None), Rectangle(
                extent={{48,-72},{72,-112}},
                lineColor={0,0,0},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Line(
                points={{60,-112},{60,-112},{60,-124}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{48,-124},{72,-124}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{50,-128},{70,-128}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{54,-132},{68,-132}},
                color={0,0,255},
                smooth=Smooth.None),Rectangle(
                extent={{56,-68},{64,-72}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Line(
                points={{58,-70},{66,-88},{52,-88},{64,-110}},
                color={255,0,0},
                smooth=Smooth.None,
                thickness=0.5),Line(
                points={{58,-108},{64,-110},{64,-104}},
                color={255,0,0},
                smooth=Smooth.None),
              Line(
                points={{-100,60},{100,60}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{8,60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-102,-60},{102,-60}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{-100,0},{-76,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-76,0},{0,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{0,0},{76,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{76,0},{102,0}},
                color={28,108,200},
                thickness=0.5),
              Text(
                extent={{-102,98},{-74,68}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{-102,38},{-74,8}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{-102,-22},{-74,-52}},
                textColor={28,108,200},
                textString="A"),
              Text(
                extent={{70,98},{98,68}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{70,38},{98,8}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{70,-22},{98,-52}},
                textColor={28,108,200},
                textString="A"),
              Line(
                points={{-60,50},{-60,60}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{0,-8},{0,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{60,-68},{60,-60}},
                color={238,46,47},
                thickness=0.5)}),                                      Diagram(
              coordinateSystem(preserveAspectRatio=false, extent={{-100,-140},{
                  100,100}})));
      end ShortFault;

      model SmoothShortFault
        parameter Modelica.Units.SI.Resistance R = 5 "Short resistance to ground";
        parameter Modelica.Units.SI.Time faultTime = 5;
        parameter Modelica.Units.SI.Time faultDuration = 0.1;
        parameter Real Ron=1e-5 "Switch on resistance";
        parameter Real Goff=0.0006 "Switch on resistance";
        parameter Real line_capacitance = 1e-6
                                              "line to ground capacitance";
        Modelica.Electrical.Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-10,-168},{10,-148}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor(R=R) annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-20,-132})));
        Modelica.Electrical.Analog.Interfaces.Pin C
          annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin B
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin A
          annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin C_n
          annotation (Placement(transformation(extent={{90,50},{110,70}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin B_n
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin A_n
          annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor1(R=R) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-132})));
        Modelica.Electrical.Analog.Basic.Resistor resistor2(R=R) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={20,-132})));
        Modelica.Blocks.Sources.BooleanTable booleanTable(
          table={faultTime,faultDuration + faultTime},
          startValue=false,
          extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
          annotation (Placement(transformation(extent={{-148,-52},{-128,-32}})));
        tools.zeroXdetect zeroXdetect
          annotation (Placement(transformation(extent={{-60,6},{-40,26}})));
        tools.NearZeroXdetect
                          nearZeroXdetect2(threshold=threshold)
          annotation (Placement(transformation(extent={{-62,-52},{-42,-32}})));
        tools.zeroXdetect zeroXdetect1
          annotation (Placement(transformation(extent={{-62,-110},{-42,-90}})));
        Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
          annotation (Placement(transformation(extent={{48,50},{28,70}})));
        Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor1
          annotation (Placement(transformation(extent={{50,-10},{30,10}})));
        Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor2
          annotation (Placement(transformation(extent={{50,-70},{30,-50}})));
        tools.SmoothSwitch smoothSwitch(
          Ron=Ron,
          Goff=Goff,
          f_cut=f_cut)
          annotation (Placement(transformation(extent={{-30,6},{-10,26}})));
        tools.SmoothSwitch smoothSwitch1(
          Ron=Ron,
          Goff=Goff,
          f_cut=f_cut)
          annotation (Placement(transformation(extent={{-10,-52},{10,-32}})));
        tools.SmoothSwitch smoothSwitch2(
          Ron=Ron,
          Goff=Goff,
          f_cut=f_cut)
          annotation (Placement(transformation(extent={{10,-110},{30,-90}})));
        parameter SI.Frequency f_cut=1e3 "Cut-off frequency";
        parameter Real threshold=0.01 "Comparison with respect to threshold";
      equation
        connect(C, C)
          annotation (Line(points={{-100,60},{-100,60}}, color={0,0,255}));
        connect(resistor.n, ground.p)
          annotation (Line(points={{-20,-142},{-20,-148},{0,-148}},
                                                           color={0,0,255}));
        connect(resistor1.n, ground.p)
          annotation (Line(points={{0,-142},{0,-148}},            color={0,0,255}));
        connect(resistor2.n, resistor1.n) annotation (Line(points={{20,-142},{20,-148},
                {0,-148},{0,-142}}, color={0,0,255}));
        connect(resistor2.n, ground.p)
          annotation (Line(points={{20,-142},{20,-148},{0,-148}}, color={0,0,255}));
        connect(booleanTable.y, zeroXdetect.u) annotation (Line(points={{-127,
                -42},{-120,-42},{-120,16},{-60,16}}, color={255,0,255}));
        connect(nearZeroXdetect2.u, booleanTable.y)
          annotation (Line(points={{-62,-42},{-127,-42}}, color={255,0,255}));
        connect(zeroXdetect1.u, booleanTable.y) annotation (Line(points={{-62,
                -100},{-120,-100},{-120,-42},{-127,-42}}, color={255,0,255}));

        connect(currentSensor.p, C_n)
          annotation (Line(points={{48,60},{100,60}}, color={0,0,255}));
        connect(currentSensor.n, C)
          annotation (Line(points={{28,60},{-100,60}}, color={0,0,255}));
        connect(currentSensor.i, zeroXdetect.u1) annotation (Line(points={{38,
                49},{38,36},{-50,36},{-50,26}}, color={0,0,127}));
        connect(currentSensor1.p, B_n)
          annotation (Line(points={{50,0},{100,0}}, color={0,0,255}));
        connect(currentSensor1.n, B)
          annotation (Line(points={{30,0},{-100,0}}, color={0,0,255}));
        connect(nearZeroXdetect2.u1, currentSensor1.i) annotation (Line(points=
                {{-52,-32},{-52,-24},{40,-24},{40,-11}}, color={0,0,127}));
        connect(currentSensor2.p, A_n)
          annotation (Line(points={{50,-60},{100,-60}}, color={0,0,255}));
        connect(currentSensor2.n, A)
          annotation (Line(points={{30,-60},{-100,-60}}, color={0,0,255}));
        connect(zeroXdetect1.u1, currentSensor2.i) annotation (Line(points={{
                -52,-90},{-52,-80},{40,-80},{40,-71}}, color={0,0,127}));
        connect(zeroXdetect.y, smoothSwitch.u) annotation (Line(
            points={{-39,16},{-34,16},{-30,16}},
            color={255,0,255},
            smooth=Smooth.Bezier));
        connect(smoothSwitch.pin, C) annotation (Line(points={{-20,26},{-20,60},
                {-100,60}}, color={0,0,255}));
        connect(smoothSwitch.pin1, resistor.p) annotation (Line(
            points={{-20,6},{-20,-122}},
            color={0,0,255},
            smooth=Smooth.Bezier));
        connect(smoothSwitch1.pin, B)
          annotation (Line(points={{0,-32},{0,0},{-100,0}}, color={0,0,255}));
        connect(smoothSwitch1.pin1, resistor1.p) annotation (Line(
            points={{0,-52},{0,-122}},
            color={0,0,255},
            smooth=Smooth.Bezier));
        connect(zeroXdetect1.y, smoothSwitch2.u) annotation (Line(
            points={{-41,-100},{-14,-100},{10,-100}},
            color={255,0,255},
            smooth=Smooth.Bezier));
        connect(smoothSwitch2.pin, A) annotation (Line(points={{20,-90},{20,-60},
                {-100,-60}}, color={0,0,255}));
        connect(smoothSwitch2.pin1, resistor2.p) annotation (Line(
            points={{20,-110},{20,-122}},
            color={0,0,255},
            smooth=Smooth.Bezier));
        connect(nearZeroXdetect2.y, smoothSwitch1.u) annotation (Line(
            points={{-41,-42},{-41,-42},{-10,-42}},
            color={255,0,255},
            smooth=Smooth.Bezier));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                  -100,-140},{100,100}}), graphics={
              Rectangle(
                extent={{-100,100},{100,-140}},
                lineColor={28,108,200},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
                                     Rectangle(
                extent={{-72,46},{-48,6}},
                lineColor={0,0,0},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Line(
                points={{-60,6},{-60,6},{-60,-6}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-72,-6},{-48,-6}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-70,-10},{-50,-10}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-66,-14},{-52,-14}},
                color={0,0,255},
                smooth=Smooth.None),Rectangle(
                extent={{-64,50},{-56,46}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Line(
                points={{-62,48},{-54,30},{-68,30},{-56,8}},
                color={255,0,0},
                smooth=Smooth.None,
                thickness=0.5),Line(
                points={{-62,10},{-56,8},{-56,14}},
                color={255,0,0},
                smooth=Smooth.None), Rectangle(
                extent={{-12,-12},{12,-52}},
                lineColor={0,0,0},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Line(
                points={{0,-52},{0,-52},{0,-64}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-12,-64},{12,-64}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-10,-68},{10,-68}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{-6,-72},{8,-72}},
                color={0,0,255},
                smooth=Smooth.None),Rectangle(
                extent={{-4,-8},{4,-12}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Line(
                points={{-2,-10},{6,-28},{-8,-28},{4,-50}},
                color={255,0,0},
                smooth=Smooth.None,
                thickness=0.5),Line(
                points={{-2,-48},{4,-50},{4,-44}},
                color={255,0,0},
                smooth=Smooth.None), Rectangle(
                extent={{48,-72},{72,-112}},
                lineColor={0,0,0},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Line(
                points={{60,-112},{60,-112},{60,-124}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{48,-124},{72,-124}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{50,-128},{70,-128}},
                color={0,0,255},
                smooth=Smooth.None),Line(
                points={{54,-132},{68,-132}},
                color={0,0,255},
                smooth=Smooth.None),Rectangle(
                extent={{56,-68},{64,-72}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid),Line(
                points={{58,-70},{66,-88},{52,-88},{64,-110}},
                color={255,0,0},
                smooth=Smooth.None,
                thickness=0.5),Line(
                points={{58,-108},{64,-110},{64,-104}},
                color={255,0,0},
                smooth=Smooth.None),
              Line(
                points={{-100,60},{100,60}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{8,60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-102,-60},{102,-60}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{-100,0},{-76,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-76,0},{0,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{0,0},{76,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{76,0},{102,0}},
                color={28,108,200},
                thickness=0.5),
              Text(
                extent={{-102,98},{-74,68}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{-102,38},{-74,8}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{-102,-22},{-74,-52}},
                textColor={28,108,200},
                textString="A"),
              Text(
                extent={{70,98},{98,68}},
                textColor={28,108,200},
                textString="C"),
              Text(
                extent={{70,38},{98,8}},
                textColor={28,108,200},
                textString="B"),
              Text(
                extent={{70,-22},{98,-52}},
                textColor={28,108,200},
                textString="A"),
              Line(
                points={{-60,50},{-60,60}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{0,-8},{0,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{60,-68},{60,-60}},
                color={238,46,47},
                thickness=0.5)}),                                      Diagram(
              coordinateSystem(preserveAspectRatio=false, extent={{-100,-140},{
                  100,100}})));
      end SmoothShortFault;

      model EMTPtransformer
        parameter Modelica.Units.SI.ApparentPower Sbase = 1e8;
        parameter Modelica.Units.SI.Frequency f = 60 "Grid nominal frequency";
        parameter Modelica.Units.SI.Frequency f_cut = 1000 "Transformer cutoff frequency";
        parameter Modelica.Units.SI.Voltage Winding1Voltage = 230e3 "Winding 1 voltage";
        parameter Modelica.Units.SI.Voltage Winding2Voltage = 6.5e3 "Winding 2 voltage";
        parameter Real WindingR_pu=0.00375 "Winding resisrance in pu";
        parameter Real WindingX_pu=0.15 "Winding reactance in pu";
        parameter Real D = 0.9 "Winding impedance on winding 1";

        parameter Real Zbase1 = Winding1Voltage^2/Sbase;
        parameter Real Zbase2 = Winding2Voltage^2/Sbase;
        parameter Real Ratio =  sqrt(3)*Winding2Voltage/(Winding1Voltage);

        parameter Modelica.Units.SI.Resistance Rp = D*WindingR_pu*Zbase1;
        parameter Modelica.Units.SI.Inductance Lp = D*WindingX_pu*Zbase1/(2*Modelica.Constants.pi*f);

        parameter Modelica.Units.SI.Resistance Rs = 2*(1-D)*WindingR_pu*Zbase2;
        parameter Modelica.Units.SI.Inductance Ls = 2*(1-D)*WindingX_pu*Zbase2/(2*Modelica.Constants.pi*f);
        Modelica.Electrical.Analog.Interfaces.Pin Cy
          annotation (Placement(transformation(extent={{-108,50},{-88,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin By
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin Ay
          annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Interfaces.Pin Cd
          annotation (Placement(transformation(extent={{90,50},{110,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin Bd
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin Ad
          annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
        TFsubcircuitZeroZsec
                     tFsubcircuitZeroZsec(
          n=Ratio,
          Lp=Lp,
          Rp=Rp,
          Ls=Ls,
          Rs=Rs,
          f_cut=f_cut)
                 annotation (Placement(transformation(extent={{-10,40},{10,60}})));
        TFsubcircuitZeroZsec
                     tFsubcircuitZeroZsec1(
          n=Ratio,
          Lp=Lp,
          Rp=Rp,
          Ls=Ls,
          Rs=Rs,
          f_cut=f_cut)
                 annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
        TFsubcircuitZeroZsec
                     tFsubcircuitZeroZsec2(
          n=Ratio,
          Lp=Lp,
          Rp=Rp,
          Ls=Ls,
          Rs=Rs,
          f_cut=f_cut)
                 annotation (Placement(transformation(extent={{-10,-80},{10,-60}})));
        Modelica.Electrical.Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-46,-100},{-26,-80}})));
        parameter SI.Resistance GroundingResistance=1e9
          "Resistance at temperature T_ref";
        Modelica.Electrical.Analog.Sensors.VoltageSensor VPrimABLL annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-70,-30})));
        Modelica.Electrical.Analog.Sensors.VoltageSensor VSecABLL annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={52,-34})));
        Modelica.Electrical.Analog.Basic.Resistor resistor(R=Rtf_delta)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={20,22})));
        Modelica.Electrical.Analog.Basic.Resistor resistor1(R=Rtf_delta)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={20,-38})));
        Modelica.Electrical.Analog.Basic.Resistor resistor2(R=Rtf_delta)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={68,20})));
        parameter SI.Resistance Rtf_delta=0.5 "Resistance at temperature T_ref";
        Modelica.Electrical.Analog.Basic.Ground ground1
          annotation (Placement(transformation(extent={{94,16},{106,28}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor3(R=
              GroundingResistance) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={100,42})));
        Modelica.Electrical.Analog.Basic.Ground ground2
          annotation (Placement(transformation(extent={{94,-44},{106,-32}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor4(R=
              GroundingResistance) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={100,-18})));
        Modelica.Electrical.Analog.Basic.Ground ground3
          annotation (Placement(transformation(extent={{94,-102},{106,-90}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor5(R=
              GroundingResistance) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={100,-76})));
      equation
        connect(Cy, tFsubcircuitZeroZsec.pin_p)
          annotation (Line(points={{-98,60},{-10,60}}, color={0,0,255}));
        connect(By, tFsubcircuitZeroZsec1.pin_p)
          annotation (Line(points={{-100,0},{-10,0}}, color={0,0,255}));
        connect(Ay, tFsubcircuitZeroZsec2.pin_p)
          annotation (Line(points={{-100,-60},{-10,-60}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec1.pin_n, tFsubcircuitZeroZsec2.pin_n)
          annotation (Line(points={{-10,-20},{-36,-20},{-36,-80},{-10,-80}},
              color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_n, tFsubcircuitZeroZsec1.pin_n)
          annotation (Line(points={{-10,40},{-36,40},{-36,-20},{-10,-20}},
              color={0,0,255}));
        connect(tFsubcircuitZeroZsec1.pin_n, ground.p) annotation (Line(points=
                {{-10,-20},{-36,-20},{-36,-80}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_p1, Cd)
          annotation (Line(points={{10,60},{100,60}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec1.pin_p1, Bd)
          annotation (Line(points={{10,0},{100,0}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec2.pin_p1, Ad)
          annotation (Line(points={{10,-60},{100,-60}}, color={0,0,255}));
        connect(Bd, Bd) annotation (Line(points={{100,0},{100,0}}, color={0,0,255}));
        connect(VPrimABLL.p, tFsubcircuitZeroZsec2.pin_p) annotation (Line(
              points={{-70,-40},{-70,-60},{-10,-60}}, color={0,0,255}));
        connect(VPrimABLL.n, tFsubcircuitZeroZsec1.pin_p) annotation (Line(
              points={{-70,-20},{-70,0},{-10,0}}, color={0,0,255}));
        connect(VSecABLL.p, Ad)
          annotation (Line(points={{52,-44},{52,-60},{100,-60}}, color={0,0,255}));
        connect(VSecABLL.n, Bd)
          annotation (Line(points={{52,-24},{52,0},{100,0}}, color={0,0,255}));
        connect(resistor.p, tFsubcircuitZeroZsec.pin_n1)
          annotation (Line(points={{20,32},{20,40},{10,40}}, color={0,0,255}));
        connect(resistor.n, Bd)
          annotation (Line(points={{20,12},{20,0},{100,0}}, color={0,0,255}));
        connect(resistor1.p, tFsubcircuitZeroZsec1.pin_n1) annotation (Line(
              points={{20,-28},{20,-20},{10,-20}}, color={0,0,255}));
        connect(resistor1.n, Ad) annotation (Line(points={{20,-48},{20,-60},{
                100,-60}}, color={0,0,255}));
        connect(resistor2.p, Cd) annotation (Line(points={{68,30},{68,60},{100,
                60}}, color={0,0,255}));
        connect(resistor2.n, tFsubcircuitZeroZsec2.pin_n1) annotation (Line(
              points={{68,10},{68,-80},{10,-80}}, color={0,0,255}));
        connect(ground1.p, resistor3.n)
          annotation (Line(points={{100,28},{100,36}}, color={0,0,255}));
        connect(resistor3.p, Cd)
          annotation (Line(points={{100,48},{100,60}}, color={0,0,255}));
        connect(ground2.p, resistor4.n)
          annotation (Line(points={{100,-32},{100,-24}}, color={0,0,255}));
        connect(resistor4.p, Bd)
          annotation (Line(points={{100,-12},{100,0}}, color={0,0,255}));
        connect(ground3.p, resistor5.n)
          annotation (Line(points={{100,-90},{100,-82}}, color={0,0,255}));
        connect(resistor5.p, Ad)
          annotation (Line(points={{100,-70},{100,-60}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Ellipse(
                extent={{-80,46},{10,-44}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Ellipse(
                extent={{-10,46},{80,-44}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Line(
                points={{-40,12}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{34,-12},{54,0}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{34,-12},{34,12}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{34,12},{54,0}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-40,0},{-40,24}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-40,0},{-20,-12}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-60,-12},{-40,0}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{-40,0},{-28,0}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-28,0},{-28,-18}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-38,-18},{-20,-18},{-22,-18}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-34,-22},{-22,-22}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-32,-26},{-24,-26}},
                color={0,0,0},
                thickness=0.5),
              Text(
                extent={{-50,44},{-24,20}},
                textColor={0,0,0},
                textString="1"),
              Text(
                extent={{22,44},{48,20}},
                textColor={0,0,0},
                textString="2"),
              Line(
                points={{-98,60}},
                color={28,108,200},
                thickness=0.5),
              Line(points={{-98,62}}, color={0,140,72}),
              Line(
                points={{-96,60},{-80,60},{-60,38}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{98,60},{80,60},{60,38}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-88,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,0},{-80,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{88,0},{80,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,-60},{-80,-60},{-58,-38}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{88,-60},{80,-60},{58,-38}},
                color={238,46,47},
                thickness=0.5)}), Diagram(coordinateSystem(preserveAspectRatio=false)));
      end EMTPtransformer;

      model EMTPtransformerMod
        parameter Modelica.Units.SI.ApparentPower Sbase = 1e8;
        parameter Modelica.Units.SI.Frequency f = 60 "Grid nominal frequency";
        parameter Modelica.Units.SI.Frequency f_cut = 1000 "Transformer cutoff frequency";
        parameter Modelica.Units.SI.Voltage Winding1Voltage = 230e3 "Winding 1 voltage";
        parameter Modelica.Units.SI.Voltage Winding2Voltage = 6.5e3 "Winding 2 voltage";
        parameter Real WindingR_pu=0.00375 "Winding resisrance in pu";
        parameter Real WindingX_pu=0.15 "Winding reactance in pu";
        parameter Real D = 0.9 "Winding impedance on winding 1";

        parameter Real Zbase1 = Winding1Voltage^2/Sbase;
        parameter Real Zbase2 = Winding2Voltage^2/Sbase;
        parameter Real Ratio =  Winding2Voltage/(Winding1Voltage);

        parameter Modelica.Units.SI.Resistance Rp = D*WindingR_pu*Zbase1;
        parameter Modelica.Units.SI.Inductance Lp = D*WindingX_pu*Zbase1/(2*Modelica.Constants.pi*f);

        parameter Modelica.Units.SI.Resistance Rs = 2*(1-D)*WindingR_pu*Zbase2;
        parameter Modelica.Units.SI.Inductance Ls = 2*(1-D)*WindingX_pu*Zbase2/(2*Modelica.Constants.pi*f);
        Modelica.Electrical.Analog.Interfaces.Pin Cy
          annotation (Placement(transformation(extent={{-108,50},{-88,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin By
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin Ay
          annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Interfaces.Pin Cd
          annotation (Placement(transformation(extent={{90,50},{110,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin Bd
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin Ad
          annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
        parameter SI.Resistance GroundingResistance=1e9
          "Resistance at temperature T_ref";
        parameter SI.Resistance Rtf_delta=0.5 "Resistance at temperature T_ref";
        TFsubcircuitZeroZsec tFsubcircuitZeroZsec(
          n=35.38,
          Lp=0.19,
          Rp=1.8)
          annotation (Placement(transformation(extent={{-10,40},{10,60}})));
        TFsubcircuitZeroZsec tFsubcircuitZeroZsec1(
          n=35.38,
          Lp=0.19,
          Rp=1.8)
          annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
        TFsubcircuitZeroZsec tFsubcircuitZeroZsec2(
          n=35.38,
          Lp=0.19,
          Rp=1.8)
          annotation (Placement(transformation(extent={{-10,-80},{10,-60}})));
        Modelica.Electrical.Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-24,-108},{-4,-88}})));
        Modelica.Electrical.Analog.Sensors.VoltageSensor VSecABLL annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={70,32})));
        Modelica.Electrical.Analog.Sensors.VoltageSensor VPrimABLL annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-54,32})));
      equation
        connect(Bd, Bd) annotation (Line(points={{100,0},{100,0}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_p1, Cd)
          annotation (Line(points={{10,60},{100,60}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_p, Cy)
          annotation (Line(points={{-10,60},{-98,60}}, color={0,0,255}));
        connect(By, tFsubcircuitZeroZsec1.pin_p)
          annotation (Line(points={{-100,0},{-10,0}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec1.pin_p1, Bd)
          annotation (Line(points={{10,0},{100,0}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec2.pin_p1, Ad)
          annotation (Line(points={{10,-60},{100,-60}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec2.pin_p, Ay)
          annotation (Line(points={{-10,-60},{-100,-60}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_n, tFsubcircuitZeroZsec1.pin_n)
          annotation (Line(points={{-10,40},{-14,40},{-14,-20},{-10,-20}},
              color={0,0,255}));
        connect(tFsubcircuitZeroZsec2.pin_n, tFsubcircuitZeroZsec1.pin_n)
          annotation (Line(points={{-10,-80},{-14,-80},{-14,-20},{-10,-20}},
              color={0,0,255}));
        connect(tFsubcircuitZeroZsec2.pin_n, ground.p) annotation (Line(points=
                {{-10,-80},{-14,-80},{-14,-88}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_n1, Bd) annotation (Line(points={{10,
                40},{20,40},{20,0},{100,0}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec1.pin_n1, Ad) annotation (Line(points={{10,
                -20},{20,-20},{20,-60},{100,-60}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec2.pin_n1, Cd) annotation (Line(points={{10,
                -80},{40,-80},{40,60},{100,60}}, color={0,0,255}));
        connect(VSecABLL.p, Cd) annotation (Line(points={{70,42},{70,60},{100,
                60}}, color={0,0,255}));
        connect(VSecABLL.n, Bd)
          annotation (Line(points={{70,22},{70,0},{100,0}}, color={0,0,255}));
        connect(VPrimABLL.p, Cy) annotation (Line(points={{-54,42},{-54,60},{
                -98,60}}, color={0,0,255}));
        connect(VPrimABLL.n, tFsubcircuitZeroZsec1.pin_p) annotation (Line(
              points={{-54,22},{-54,0},{-10,0}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Ellipse(
                extent={{-80,46},{10,-44}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Ellipse(
                extent={{-10,46},{80,-44}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Line(
                points={{-40,12}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{34,-12},{54,0}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{34,-12},{34,12}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{34,12},{54,0}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-40,0},{-40,24}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-40,0},{-20,-12}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-60,-12},{-40,0}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{-40,0},{-28,0}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-28,0},{-28,-18}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-38,-18},{-20,-18},{-22,-18}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-34,-22},{-22,-22}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-32,-26},{-24,-26}},
                color={0,0,0},
                thickness=0.5),
              Text(
                extent={{-50,44},{-24,20}},
                textColor={0,0,0},
                textString="1"),
              Text(
                extent={{22,44},{48,20}},
                textColor={0,0,0},
                textString="2"),
              Line(
                points={{-98,60}},
                color={28,108,200},
                thickness=0.5),
              Line(points={{-98,62}}, color={0,140,72}),
              Line(
                points={{-96,60},{-80,60},{-60,38}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{98,60},{80,60},{60,38}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-88,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,0},{-80,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{88,0},{80,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,-60},{-80,-60},{-58,-38}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{88,-60},{80,-60},{58,-38}},
                color={238,46,47},
                thickness=0.5)}), Diagram(coordinateSystem(preserveAspectRatio=false)));
      end EMTPtransformerMod;

      model EMTPtransformerZeroSeq
        parameter Modelica.Units.SI.ApparentPower Sbase = 1e8;
        parameter Modelica.Units.SI.Frequency f = 60 "Grid nominal frequency";
        parameter Modelica.Units.SI.Frequency f_cut = 1000 "Transformer cutoff frequency";
        parameter Modelica.Units.SI.Voltage Winding1Voltage = 230e3 "Winding 1 voltage";
        parameter Modelica.Units.SI.Voltage Winding2Voltage = 6.5e3 "Winding 2 voltage";
        parameter Real WindingR_pu=0.00375 "Winding resisrance in pu";
        parameter Real WindingX_pu=0.15 "Winding reactance in pu";
        parameter Real D = 0.9 "Winding impedance on winding 1";

        parameter Real Zbase1 = Winding1Voltage^2/Sbase;
        parameter Real Zbase2 = Winding2Voltage^2/Sbase;
        parameter Real Ratio =  sqrt(3)*Winding2Voltage/(Winding1Voltage);

        parameter Modelica.Units.SI.Resistance Rp = D*WindingR_pu*Zbase1;
        parameter Modelica.Units.SI.Inductance Lp = D*WindingX_pu*Zbase1/(2*Modelica.Constants.pi*f);

        parameter Modelica.Units.SI.Resistance Rs = 2*(1-D)*WindingR_pu*Zbase2;
        parameter Modelica.Units.SI.Inductance Ls = 2*(1-D)*WindingX_pu*Zbase2/(2*Modelica.Constants.pi*f);
        Modelica.Electrical.Analog.Interfaces.Pin Cy
          annotation (Placement(transformation(extent={{-108,50},{-88,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin By
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin Ay
          annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Interfaces.Pin Cd
          annotation (Placement(transformation(extent={{170,50},{190,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin Bd
          annotation (Placement(transformation(extent={{170,-10},{190,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin Ad
          annotation (Placement(transformation(extent={{170,-70},{190,-50}})));
        TFsubcircuitZeroZsec
                     tFsubcircuitZeroZsec(
          n=Ratio,
          Lp=Lp,
          Rp=Rp,
          Ls=Ls,
          Rs=Rs,
          f_cut=f_cut)
                 annotation (Placement(transformation(extent={{-10,40},{10,60}})));
        TFsubcircuitZeroZsec
                     tFsubcircuitZeroZsec1(
          n=Ratio,
          Lp=Lp,
          Rp=Rp,
          Ls=Ls,
          Rs=Rs,
          f_cut=f_cut)
                 annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
        TFsubcircuitZeroZsec
                     tFsubcircuitZeroZsec2(
          n=Ratio,
          Lp=Lp,
          Rp=Rp,
          Ls=Ls,
          Rs=Rs,
          f_cut=f_cut)
                 annotation (Placement(transformation(extent={{-10,-80},{10,-60}})));
        Modelica.Electrical.Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-46,-100},{-26,-80}})));
        parameter SI.Resistance GroundingResistance=1e9
          "Resistance at temperature T_ref";
        Modelica.Electrical.Analog.Sensors.VoltageSensor VPrimABLL annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-70,-30})));
        parameter SI.Resistance Rtf_delta=0.5 "Resistance at temperature T_ref";
        Modelica.Electrical.Analog.Basic.Resistor Rcb(R=Rtf_delta) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={16,20})));
        Modelica.Electrical.Analog.Basic.Resistor Rba(R=Rtf_delta) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={16,-38})));
        Modelica.Electrical.Analog.Basic.Resistor Rac(R=Rtf_delta) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={32,-38})));
        Modelica.Electrical.Analog.Sensors.VoltageSensor VSecABLL annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={56,-38})));
        Modelica.Electrical.Analog.Sensors.VoltageSensor VSecBCLL1
                                                                  annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={56,32})));
        Modelica.Electrical.Analog.Sensors.VoltageSensor VSecABLL1
                                                                  annotation (
            Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={74,-14})));
        Modelica.Blocks.Math.Add3 VabcSum
          annotation (Placement(transformation(extent={{102,14},{122,34}})));
        Modelica.Electrical.Analog.Sensors.CurrentSensor Bcurrent
          annotation (Placement(transformation(extent={{132,-10},{152,10}})));
      equation
        connect(Cy, tFsubcircuitZeroZsec.pin_p)
          annotation (Line(points={{-98,60},{-10,60}}, color={0,0,255}));
        connect(By, tFsubcircuitZeroZsec1.pin_p)
          annotation (Line(points={{-100,0},{-10,0}}, color={0,0,255}));
        connect(Ay, tFsubcircuitZeroZsec2.pin_p)
          annotation (Line(points={{-100,-60},{-10,-60}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec1.pin_n, tFsubcircuitZeroZsec2.pin_n)
          annotation (Line(points={{-10,-20},{-36,-20},{-36,-80},{-10,-80}},
              color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_n, tFsubcircuitZeroZsec1.pin_n)
          annotation (Line(points={{-10,40},{-36,40},{-36,-20},{-10,-20}},
              color={0,0,255}));
        connect(tFsubcircuitZeroZsec1.pin_n, ground.p) annotation (Line(points=
                {{-10,-20},{-36,-20},{-36,-80}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_p1, Cd)
          annotation (Line(points={{10,60},{180,60}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec2.pin_p1, Ad)
          annotation (Line(points={{10,-60},{180,-60}}, color={0,0,255}));
        connect(Bd, Bd) annotation (Line(points={{180,0},{180,0}}, color={0,0,255}));
        connect(VPrimABLL.p, tFsubcircuitZeroZsec2.pin_p) annotation (Line(
              points={{-70,-40},{-70,-60},{-10,-60}}, color={0,0,255}));
        connect(VPrimABLL.n, tFsubcircuitZeroZsec1.pin_p) annotation (Line(
              points={{-70,-20},{-70,0},{-10,0}}, color={0,0,255}));
        connect(VSecABLL.p, Ad) annotation (Line(points={{56,-48},{56,-60},{180,
                -60}}, color={0,0,255}));
        connect(VSecBCLL1.n, Cd) annotation (Line(points={{56,42},{56,60},{180,
                60}}, color={0,0,255}));
        connect(VSecABLL1.p, Cd) annotation (Line(points={{74,-4},{74,60},{180,
                60}}, color={0,0,255}));
        connect(VSecABLL1.n, Ad) annotation (Line(points={{74,-24},{74,-60},{
                180,-60}}, color={0,0,255}));
        connect(VSecBCLL1.v, VabcSum.u1)
          annotation (Line(points={{67,32},{100,32}}, color={0,0,127}));
        connect(VSecABLL1.v, VabcSum.u2) annotation (Line(points={{85,-14},{86,
                -14},{86,24},{100,24}}, color={0,0,127}));
        connect(VSecABLL.v, VabcSum.u3) annotation (Line(points={{67,-38},{92,
                -38},{92,16},{100,16}}, color={0,0,127}));
        connect(tFsubcircuitZeroZsec1.pin_n1, Rba.n) annotation (Line(points={{
                10,-20},{16,-20},{16,-28}}, color={0,0,255}));
        connect(tFsubcircuitZeroZsec.pin_n1, Rcb.n)
          annotation (Line(points={{10,40},{16,40},{16,30}}, color={0,0,255}));
        connect(Rba.p, Ad) annotation (Line(points={{16,-48},{16,-60},{180,-60}},
              color={0,0,255}));
        connect(Rac.p, tFsubcircuitZeroZsec2.pin_n1) annotation (Line(points={{
                32,-48},{32,-80},{10,-80}}, color={0,0,255}));
        connect(Rac.n, Cd) annotation (Line(points={{32,-28},{34,-28},{34,60},{
                180,60}}, color={0,0,255}));
        connect(Bcurrent.p, tFsubcircuitZeroZsec1.pin_p1)
          annotation (Line(points={{132,0},{10,0}}, color={0,0,255}));
        connect(Bcurrent.n, Bd)
          annotation (Line(points={{152,0},{180,0}}, color={0,0,255}));
        connect(Rcb.p, tFsubcircuitZeroZsec1.pin_p1)
          annotation (Line(points={{16,10},{16,0},{10,0}}, color={0,0,255}));
        connect(VSecBCLL1.p, tFsubcircuitZeroZsec1.pin_p1)
          annotation (Line(points={{56,22},{56,0},{10,0}}, color={0,0,255}));
        connect(VSecABLL.n, tFsubcircuitZeroZsec1.pin_p1)
          annotation (Line(points={{56,-28},{56,0},{10,0}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                  -100,-100},{180,100}}),                             graphics={
              Ellipse(
                extent={{-80,46},{10,-44}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Ellipse(
                extent={{-10,46},{80,-44}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Line(
                points={{-40,12}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{34,-12},{54,0}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{34,-12},{34,12}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{34,12},{54,0}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-40,0},{-40,24}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-40,0},{-20,-12}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-60,-12},{-40,0}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{-40,0},{-28,0}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-28,0},{-28,-18}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-38,-18},{-20,-18},{-22,-18}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-34,-22},{-22,-22}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-32,-26},{-24,-26}},
                color={0,0,0},
                thickness=0.5),
              Text(
                extent={{-50,44},{-24,20}},
                textColor={0,0,0},
                textString="1"),
              Text(
                extent={{22,44},{48,20}},
                textColor={0,0,0},
                textString="2"),
              Line(
                points={{-98,60}},
                color={28,108,200},
                thickness=0.5),
              Line(points={{-98,62}}, color={0,140,72}),
              Line(
                points={{-96,60},{-80,60},{-60,38}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{184,60},{80,60},{60,38}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-88,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,0},{-80,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{180,0},{80,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,-60},{-80,-60},{-58,-38}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{182,-60},{80,-60},{58,-38}},
                color={238,46,47},
                thickness=0.5)}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={
                  {-100,-100},{180,100}})));
      end EMTPtransformerZeroSeq;

      model EMTPtransformerIdeal
        parameter Modelica.Units.SI.ApparentPower Sbase = 1e8;
        parameter Modelica.Units.SI.Frequency f = 60 "Grid nominal frequency";
        parameter Modelica.Units.SI.Frequency f_cut = 1000 "Transformer cutoff frequency";
        parameter Modelica.Units.SI.Voltage Winding1Voltage = 230e3 "Winding 1 voltage";
        parameter Modelica.Units.SI.Voltage Winding2Voltage = 6.5e3 "Winding 2 voltage";
        parameter Real WindingR_pu=0.00375 "Winding resisrance in pu";
        parameter Real WindingX_pu=0.15 "Winding reactance in pu";
        parameter Real D = 0.9 "Winding impedance on winding 1";

        parameter Real Zbase1 = Winding1Voltage^2/Sbase;
        parameter Real Zbase2 = Winding2Voltage^2/Sbase;
        parameter Real Ratio =  sqrt(3)*Winding2Voltage/(Winding1Voltage);

        parameter Modelica.Units.SI.Resistance Rp = D*WindingR_pu*Zbase1;
        parameter Modelica.Units.SI.Inductance Lp = D*WindingX_pu*Zbase1/(2*Modelica.Constants.pi*f);

        parameter Modelica.Units.SI.Resistance Rs = 2*(1-D)*WindingR_pu*Zbase2;
        parameter Modelica.Units.SI.Inductance Ls = 2*(1-D)*WindingX_pu*Zbase2/(2*Modelica.Constants.pi*f);
        Modelica.Electrical.Analog.Interfaces.Pin Cy
          annotation (Placement(transformation(extent={{-108,50},{-88,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin By
          annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin Ay
          annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
        Modelica.Electrical.Analog.Interfaces.Pin Cd
          annotation (Placement(transformation(extent={{170,50},{190,70}})));
        Modelica.Electrical.Analog.Interfaces.Pin Bd
          annotation (Placement(transformation(extent={{170,-10},{190,10}})));
        Modelica.Electrical.Analog.Interfaces.Pin Ad
          annotation (Placement(transformation(extent={{170,-70},{190,-50}})));
        TFsubcircuitIdeal
                     tFsubcircuitIdeal(
          n=Ratio,
          Lp=Lp,
          Rp=Rp,
          Ls=Ls,
          Rs=Rs,
          f_cut=f_cut)
                 annotation (Placement(transformation(extent={{-10,40},{10,60}})));
        TFsubcircuitIdeal
                     tFsubcircuitIdeal1(
          n=Ratio,
          Lp=Lp,
          Rp=Rp,
          Ls=Ls,
          Rs=Rs,
          f_cut=f_cut)
                 annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
        TFsubcircuitIdeal
                     tFsubcircuitIdeal2(
          n=Ratio,
          Lp=Lp,
          Rp=Rp,
          Ls=Ls,
          Rs=Rs,
          f_cut=f_cut)
                 annotation (Placement(transformation(extent={{-10,-80},{10,-60}})));
        Modelica.Electrical.Analog.Basic.Ground ground
          annotation (Placement(transformation(extent={{-46,-100},{-26,-80}})));
        parameter SI.Resistance GroundingResistance=1e9
          "Resistance at temperature T_ref";
        parameter SI.Resistance Rtf_delta=0.5 "Resistance at temperature T_ref";
        Modelica.Electrical.Analog.Basic.Resistor Rcb(R=Rtf_delta) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={16,20})));
        Modelica.Electrical.Analog.Basic.Resistor Rba(R=Rtf_delta) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={16,-38})));
        Modelica.Electrical.Analog.Basic.Resistor Rac(R=Rtf_delta) annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={32,-38})));
        Modelica.Electrical.Analog.Basic.Ground ground1
          annotation (Placement(transformation(extent={{174,14},{186,26}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor3(R=
              GroundingResistance) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={180,40})));
        Modelica.Electrical.Analog.Basic.Ground ground2
          annotation (Placement(transformation(extent={{174,-44},{186,-32}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor1(R=
              GroundingResistance) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={180,-18})));
        Modelica.Electrical.Analog.Basic.Ground ground3
          annotation (Placement(transformation(extent={{174,-102},{186,-90}})));
        Modelica.Electrical.Analog.Basic.Resistor resistor2(R=
              GroundingResistance) annotation (Placement(transformation(
              extent={{-6,-6},{6,6}},
              rotation=270,
              origin={180,-76})));
      equation
        connect(Cy, tFsubcircuitIdeal.pin_p)
          annotation (Line(points={{-98,60},{-10,60}}, color={0,0,255}));
        connect(By, tFsubcircuitIdeal1.pin_p)
          annotation (Line(points={{-100,0},{-10,0}}, color={0,0,255}));
        connect(Ay, tFsubcircuitIdeal2.pin_p)
          annotation (Line(points={{-100,-60},{-10,-60}}, color={0,0,255}));
        connect(tFsubcircuitIdeal1.pin_n, tFsubcircuitIdeal2.pin_n) annotation
          (Line(points={{-10,-20},{-36,-20},{-36,-80},{-10,-80}}, color={0,0,
                255}));
        connect(tFsubcircuitIdeal.pin_n, tFsubcircuitIdeal1.pin_n) annotation (
            Line(points={{-10,40},{-36,40},{-36,-20},{-10,-20}}, color={0,0,255}));
        connect(tFsubcircuitIdeal1.pin_n, ground.p) annotation (Line(points={{-10,
                -20},{-36,-20},{-36,-80}}, color={0,0,255}));
        connect(tFsubcircuitIdeal.pin_p1, Cd)
          annotation (Line(points={{10,60},{180,60}}, color={0,0,255}));
        connect(tFsubcircuitIdeal2.pin_p1, Ad)
          annotation (Line(points={{10,-60},{180,-60}}, color={0,0,255}));
        connect(Bd, Bd) annotation (Line(points={{180,0},{180,0}}, color={0,0,255}));
        connect(tFsubcircuitIdeal1.pin_n1, Rba.n) annotation (Line(points={{10,
                -20},{16,-20},{16,-28}}, color={0,0,255}));
        connect(tFsubcircuitIdeal.pin_n1, Rcb.n)
          annotation (Line(points={{10,40},{16,40},{16,30}}, color={0,0,255}));
        connect(Rba.p, Ad) annotation (Line(points={{16,-48},{16,-60},{180,-60}},
              color={0,0,255}));
        connect(Rac.p, tFsubcircuitIdeal2.pin_n1) annotation (Line(points={{32,
                -48},{32,-80},{10,-80}}, color={0,0,255}));
        connect(Rac.n, Cd) annotation (Line(points={{32,-28},{34,-28},{34,60},{
                180,60}}, color={0,0,255}));
        connect(Rcb.p, tFsubcircuitIdeal1.pin_p1)
          annotation (Line(points={{16,10},{16,0},{10,0}}, color={0,0,255}));
        connect(Bd, tFsubcircuitIdeal1.pin_p1)
          annotation (Line(points={{180,0},{10,0}}, color={0,0,255}));
        connect(ground1.p,resistor3. n)
          annotation (Line(points={{180,26},{180,34}}, color={0,0,255}));
        connect(ground2.p,resistor1. n)
          annotation (Line(points={{180,-32},{180,-24}},
                                                       color={0,0,255}));
        connect(ground3.p,resistor2. n)
          annotation (Line(points={{180,-90},{180,-82}},
                                                       color={0,0,255}));
        connect(resistor2.p, Ad)
          annotation (Line(points={{180,-70},{180,-60}}, color={0,0,255}));
        connect(resistor1.p, Bd)
          annotation (Line(points={{180,-12},{180,0}}, color={0,0,255}));
        connect(resistor3.p, Cd)
          annotation (Line(points={{180,46},{180,60}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                  -100,-100},{180,100}}),                             graphics={
              Ellipse(
                extent={{-80,46},{10,-44}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Ellipse(
                extent={{-10,46},{80,-44}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Line(
                points={{-40,12}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{34,-12},{54,0}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{34,-12},{34,12}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{34,12},{54,0}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-40,0},{-40,24}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-40,0},{-20,-12}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-60,-12},{-40,0}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{-40,0},{-28,0}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-28,0},{-28,-18}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-38,-18},{-20,-18},{-22,-18}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-34,-22},{-22,-22}},
                color={0,0,0},
                thickness=0.5),
              Line(
                points={{-32,-26},{-24,-26}},
                color={0,0,0},
                thickness=0.5),
              Text(
                extent={{-50,44},{-24,20}},
                textColor={0,0,0},
                textString="1"),
              Text(
                extent={{22,44},{48,20}},
                textColor={0,0,0},
                textString="2"),
              Line(
                points={{-98,60}},
                color={28,108,200},
                thickness=0.5),
              Line(points={{-98,62}}, color={0,140,72}),
              Line(
                points={{-96,60},{-80,60},{-60,38}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{184,60},{80,60},{60,38}},
                color={0,140,72},
                thickness=0.5),
              Line(
                points={{-88,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,0},{-80,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{180,0},{80,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,-60},{-80,-60},{-58,-38}},
                color={238,46,47},
                thickness=0.5),
              Line(
                points={{182,-60},{80,-60},{58,-38}},
                color={238,46,47},
                thickness=0.5)}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={
                  {-100,-100},{180,100}})));
      end EMTPtransformerIdeal;

      model TFsubcircuit
        tools.NoneIdealTransformer                        noneIdealTransformer(
                                                                      n=1/n, f_cut=
              f_cut)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
          annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_p1
          annotation (Placement(transformation(extent={{90,90},{110,110}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
          annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_n1
          annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
        Modelica.Electrical.Analog.Basic.Inductor L1(L=Lp)
          annotation (Placement(transformation(extent={{-72,50},{-52,70}})));
        Modelica.Electrical.Analog.Basic.Inductor L2(L=Ls)
          annotation (Placement(transformation(extent={{28,50},{48,70}})));
        Modelica.Electrical.Analog.Basic.Resistor R1(R=Rp)
          annotation (Placement(transformation(extent={{-46,50},{-26,70}})));
        Modelica.Electrical.Analog.Basic.Resistor R2(R=Rs)
          annotation (Placement(transformation(extent={{54,50},{74,70}})));
        parameter Real n =1 "Turns ratio primary:secondary voltage";
        parameter SI.Inductance Lp =1 "Inductance on winding 1";
        parameter SI.Resistance Rp =1 "Resistance at temperature T_ref on winding 1";
        parameter SI.Inductance Ls =1 "Inductance on winding 2";
        parameter SI.Resistance Rs =1 "Resistance at temperature T_ref on winding 2";

        parameter SI.Frequency f_cut=1000 "Cut-off frequency";
      equation
        connect(L1.n, R1.p)
          annotation (Line(points={{-52,60},{-46,60}}, color={0,0,255}));
        connect(L2.n, R2.p)
          annotation (Line(points={{48,60},{54,60}}, color={0,0,255}));
        connect(L2.p, noneIdealTransformer.p2)
          annotation (Line(points={{28,60},{10,60},{10,10}}, color={0,0,255}));
        connect(R1.n, noneIdealTransformer.p1)
          annotation (Line(points={{-26,60},{-10,60},{-10,10}}, color={0,0,255}));
        connect(L1.p, pin_p) annotation (Line(points={{-72,60},{-86,60},{-86,100},{-100,
                100}}, color={0,0,255}));
        connect(R2.n, pin_p1) annotation (Line(points={{74,60},{88,60},{88,100},{100,100}},
              color={0,0,255}));
        connect(noneIdealTransformer.n1, pin_n) annotation (Line(points={{-10,-10},{-54,
                -10},{-54,-100},{-100,-100}}, color={0,0,255}));
        connect(noneIdealTransformer.n2, pin_n1) annotation (Line(points={{10,-10},{56,
                -10},{56,-100},{100,-100}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Line(
                points={{-100,100},{-80,100}},
                color={28,108,200},
                thickness=0.5),
              Rectangle(
                extent={{-80,106},{-52,94}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Rectangle(
                extent={{52,106},{80,94}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Line(
                points={{80,100},{100,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-52,100},{-20,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,100},{52,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-2,100},{-2,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{2,100},{2,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,-100},{-20,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-100},{90,-100}},
                color={28,108,200},
                thickness=0.5),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,90},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,70},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,50},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,30},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,10},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-10},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-30},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-50},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-70},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-90},
                rotation=90),
              Line(
                points={{-20,80},{-26,80}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,60},{-26,60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,40},{-26,40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,20},{-26,20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,0},{-26,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-20},{-26,-20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-40},{-26,-40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-60},{-26,-60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-80},{-26,-80}},
                color={28,108,200},
                thickness=0.5),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,90},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,70},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,50},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,30},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,10},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-10},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-30},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-50},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-70},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-90},
                rotation=90),
              Line(
                points={{20,80},{26,80}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,60},{26,60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,40},{26,40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,20},{26,20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,0},{26,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-20},{26,-20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-40},{26,-40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-60},{26,-60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-80},{26,-80}},
                color={28,108,200},
                thickness=0.5),
              Text(
                extent={{-76,22},{-48,-22}},
                textColor={28,108,200},
                textString="1"),
              Text(
                extent={{44,22},{72,-22}},
                textColor={28,108,200},
                textString="2"),
              Text(
                extent={{-82,104},{-40,46}},
                textColor={28,108,200},
                textString="Zp"),
              Text(
                extent={{52,104},{92,48}},
                textColor={28,108,200},
                textString="Zs")}),                                    Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end TFsubcircuit;

      model TFsubcircuitZeroZsec
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
          annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_p1
          annotation (Placement(transformation(extent={{90,90},{110,110}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
          annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_n1
          annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
        Modelica.Electrical.Analog.Basic.Inductor L1(L=Lp)
          annotation (Placement(transformation(extent={{-72,50},{-52,70}})));
        Modelica.Electrical.Analog.Basic.Resistor R1(R=Rp)
          annotation (Placement(transformation(extent={{-46,50},{-26,70}})));
        parameter Real n =1 "Turns ratio primary:secondary voltage";
        parameter SI.Inductance Lp =1 "Inductance on winding 1";
        parameter SI.Resistance Rp =1 "Resistance at temperature T_ref on winding 1";
        parameter SI.Inductance Ls =1 "Inductance on winding 2";
        parameter SI.Resistance Rs =1 "Resistance at temperature T_ref on winding 2";

        parameter SI.Frequency f_cut=1000 "Cut-off frequency";
        tools.NoneIdealTransformer noneIdealTransformer(n=1/n, f_cut=f_cut)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
      equation
        connect(L1.n, R1.p)
          annotation (Line(points={{-52,60},{-46,60}}, color={0,0,255}));
        connect(L1.p, pin_p) annotation (Line(points={{-72,60},{-86,60},{-86,100},{-100,
                100}}, color={0,0,255}));
        connect(noneIdealTransformer.p1, R1.n) annotation (Line(points={{-10,10},
                {-14,10},{-14,60},{-26,60}}, color={0,0,255}));
        connect(noneIdealTransformer.n1, pin_n) annotation (Line(points={{-10,
                -10},{-56,-10},{-56,-100},{-100,-100}}, color={0,0,255}));
        connect(noneIdealTransformer.n2, pin_n1) annotation (Line(points={{10,
                -10},{56,-10},{56,-100},{100,-100}}, color={0,0,255}));
        connect(noneIdealTransformer.p2, pin_p1) annotation (Line(points={{10,
                10},{56,10},{56,100},{100,100}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Line(
                points={{-100,100},{-80,100}},
                color={28,108,200},
                thickness=0.5),
              Rectangle(
                extent={{-80,106},{-52,94}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Line(
                points={{80,100},{100,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-52,100},{-20,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,100},{80,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-2,100},{-2,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{2,100},{2,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,-100},{-20,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-100},{90,-100}},
                color={28,108,200},
                thickness=0.5),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,90},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,70},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,50},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,30},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,10},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-10},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-30},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-50},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-70},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-90},
                rotation=90),
              Line(
                points={{-20,80},{-26,80}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,60},{-26,60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,40},{-26,40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,20},{-26,20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,0},{-26,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-20},{-26,-20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-40},{-26,-40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-60},{-26,-60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-80},{-26,-80}},
                color={28,108,200},
                thickness=0.5),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,90},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,70},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,50},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,30},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,10},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-10},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-30},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-50},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-70},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-90},
                rotation=90),
              Line(
                points={{20,80},{26,80}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,60},{26,60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,40},{26,40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,20},{26,20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,0},{26,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-20},{26,-20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-40},{26,-40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-60},{26,-60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-80},{26,-80}},
                color={28,108,200},
                thickness=0.5),
              Text(
                extent={{-76,22},{-48,-22}},
                textColor={28,108,200},
                textString="1"),
              Text(
                extent={{44,22},{72,-22}},
                textColor={28,108,200},
                textString="2"),
              Text(
                extent={{-82,104},{-40,46}},
                textColor={28,108,200},
                textString="Zp"),
              Text(
                extent={{52,104},{92,48}},
                textColor={28,108,200},
                textString="Zs")}),                                    Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end TFsubcircuitZeroZsec;

      model TFsubcircuitEmulation
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
          annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_p1
          annotation (Placement(transformation(extent={{90,90},{110,110}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
          annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_n1
          annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
        Modelica.Electrical.Analog.Basic.Inductor L1(L=Lp)
          annotation (Placement(transformation(extent={{-72,50},{-52,70}})));
        Modelica.Electrical.Analog.Basic.Resistor R1(R=Rp)
          annotation (Placement(transformation(extent={{-46,50},{-26,70}})));
        parameter Real n =1 "Turns ratio primary:secondary voltage";
        parameter SI.Inductance Lp =1 "Inductance on winding 1";
        parameter SI.Resistance Rp =1 "Resistance at temperature T_ref on winding 1";
        parameter SI.Inductance Ls =1 "Inductance on winding 2";
        parameter SI.Resistance Rs =1 "Resistance at temperature T_ref on winding 2";

        parameter SI.Frequency f_cut=1000 "Cut-off frequency";
        tools.NoneIdealTransformer_Emulation noneIdealTransformer_Emulation(n=1
              /n, f_cut=f_cut)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Modelica.Blocks.Interfaces.RealInput PhaseVin annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,100})));
      equation
        connect(L1.n, R1.p)
          annotation (Line(points={{-52,60},{-46,60}}, color={0,0,255}));
        connect(L1.p, pin_p) annotation (Line(points={{-72,60},{-86,60},{-86,100},{-100,
                100}}, color={0,0,255}));
        connect(noneIdealTransformer_Emulation.p1, R1.n) annotation (Line(
              points={{-10,10},{-14,10},{-14,60},{-26,60}}, color={0,0,255}));
        connect(noneIdealTransformer_Emulation.n1, pin_n) annotation (Line(
              points={{-10,-10},{-56,-10},{-56,-100},{-100,-100}}, color={0,0,
                255}));
        connect(noneIdealTransformer_Emulation.n2, pin_n1) annotation (Line(
              points={{10,-10},{56,-10},{56,-100},{100,-100}}, color={0,0,255}));
        connect(noneIdealTransformer_Emulation.p2, pin_p1) annotation (Line(
              points={{10,10},{56,10},{56,100},{100,100}}, color={0,0,255}));
        connect(PhaseVin, noneIdealTransformer_Emulation.PhaseVin)
          annotation (Line(points={{0,100},{0,10}}, color={0,0,127}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Line(
                points={{-100,100},{-80,100}},
                color={28,108,200},
                thickness=0.5),
              Rectangle(
                extent={{-80,106},{-52,94}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Line(
                points={{80,100},{100,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-52,100},{-20,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,100},{80,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-2,100},{-2,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{2,100},{2,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,-100},{-20,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-100},{90,-100}},
                color={28,108,200},
                thickness=0.5),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,90},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,70},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,50},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,30},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,10},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-10},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-30},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-50},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-70},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-90},
                rotation=90),
              Line(
                points={{-20,80},{-26,80}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,60},{-26,60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,40},{-26,40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,20},{-26,20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,0},{-26,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-20},{-26,-20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-40},{-26,-40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-60},{-26,-60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-80},{-26,-80}},
                color={28,108,200},
                thickness=0.5),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,90},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,70},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,50},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,30},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,10},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-10},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-30},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-50},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-70},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-90},
                rotation=90),
              Line(
                points={{20,80},{26,80}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,60},{26,60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,40},{26,40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,20},{26,20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,0},{26,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-20},{26,-20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-40},{26,-40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-60},{26,-60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-80},{26,-80}},
                color={28,108,200},
                thickness=0.5),
              Text(
                extent={{-76,22},{-48,-22}},
                textColor={28,108,200},
                textString="1"),
              Text(
                extent={{44,22},{72,-22}},
                textColor={28,108,200},
                textString="2"),
              Text(
                extent={{-82,104},{-40,46}},
                textColor={28,108,200},
                textString="Zp"),
              Text(
                extent={{52,104},{92,48}},
                textColor={28,108,200},
                textString="Zs")}),                                    Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end TFsubcircuitEmulation;

      model TFsubcircuitIdeal
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
          annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_p1
          annotation (Placement(transformation(extent={{90,90},{110,110}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
          annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_n1
          annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
        parameter Real n =1 "Turns ratio primary:secondary voltage";
        parameter SI.Inductance Lp =1 "Inductance on winding 1";
        parameter SI.Resistance Rp =1 "Resistance at temperature T_ref on winding 1";
        parameter SI.Inductance Ls =1 "Inductance on winding 2";
        parameter SI.Resistance Rs =1 "Resistance at temperature T_ref on winding 2";

        parameter SI.Frequency f_cut=1000 "Cut-off frequency";
        tools.NoneIdealTransformer noneIdealTransformer(n=1/n, f_cut=f_cut)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
      equation
        connect(noneIdealTransformer.n1, pin_n) annotation (Line(points={{-10,-10},
                {-56,-10},{-56,-100},{-100,-100}}, color={0,0,255}));
        connect(noneIdealTransformer.n2, pin_n1) annotation (Line(points={{10,-10},
                {56,-10},{56,-100},{100,-100}}, color={0,0,255}));
        connect(noneIdealTransformer.p2, pin_p1) annotation (Line(points={{10,
                10},{56,10},{56,100},{100,100}}, color={0,0,255}));
        connect(pin_p, noneIdealTransformer.p1) annotation (Line(points={{-100,
                100},{-56,100},{-56,10},{-10,10}}, color={0,0,255}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Line(
                points={{-100,100},{-80,100}},
                color={28,108,200},
                thickness=0.5),
              Rectangle(
                extent={{-80,106},{-52,94}},
                lineColor={28,108,200},
                lineThickness=0.5),
              Line(
                points={{80,100},{100,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-52,100},{-20,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,100},{80,100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-2,100},{-2,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{2,100},{2,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-90,-100},{-20,-100}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-100},{90,-100}},
                color={28,108,200},
                thickness=0.5),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,90},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,70},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,50},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,30},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,10},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-10},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-30},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-50},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-70},
                rotation=90),
              Ellipse(
                extent={{-10,10},{10,-10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={-20,-90},
                rotation=90),
              Line(
                points={{-20,80},{-26,80}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,60},{-26,60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,40},{-26,40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,20},{-26,20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,0},{-26,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-20},{-26,-20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-40},{-26,-40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-60},{-26,-60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{-20,-80},{-26,-80}},
                color={28,108,200},
                thickness=0.5),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,90},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,70},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,50},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,30},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,10},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-10},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-30},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-50},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-70},
                rotation=90),
              Ellipse(
                extent={{-10,-10},{10,10}},
                lineColor={28,108,200},
                lineThickness=0.5,
                closure=EllipseClosure.None,
                startAngle=0,
                endAngle=180,
                origin={20,-90},
                rotation=90),
              Line(
                points={{20,80},{26,80}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,60},{26,60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,40},{26,40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,20},{26,20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,0},{26,0}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-20},{26,-20}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-40},{26,-40}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-60},{26,-60}},
                color={28,108,200},
                thickness=0.5),
              Line(
                points={{20,-80},{26,-80}},
                color={28,108,200},
                thickness=0.5),
              Text(
                extent={{-76,22},{-48,-22}},
                textColor={28,108,200},
                textString="1"),
              Text(
                extent={{44,22},{72,-22}},
                textColor={28,108,200},
                textString="2"),
              Text(
                extent={{-82,104},{-40,46}},
                textColor={28,108,200},
                textString="Zp"),
              Text(
                extent={{52,104},{92,48}},
                textColor={28,108,200},
                textString="Zs")}),                                    Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end TFsubcircuitIdeal;

      package GridComponentsTest

        model EMTPGridTest
          EMTPGrid eMTPGrid
            annotation (Placement(transformation(extent={{12,-20},{52,20}})));
          ShortFault shortFault(line_capacitance=1e-6)
            annotation (Placement(transformation(extent={{-48,-28},{-8,20}})));
        equation
          connect(shortFault.C_n, eMTPGrid.C)
            annotation (Line(points={{-8,12},{12,12}}, color={0,0,255}));
          connect(shortFault.B_n, eMTPGrid.B)
            annotation (Line(points={{-8,0},{12,0}}, color={0,0,255}));
          connect(shortFault.A_n, eMTPGrid.A)
            annotation (Line(points={{-8,-12},{12,-12}}, color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false)),
            Diagram(coordinateSystem(preserveAspectRatio=false)),
            experiment(
              StopTime=10,
              Interval=1e-05,
              __Dymola_fixedstepsize=1e-05,
              __Dymola_Algorithm="Euler"));
        end EMTPGridTest;

        model EMTPTransTest
          EMTPGrid eMTPGrid(Vbase=230000)
            annotation (Placement(transformation(extent={{60,-18},{100,22}})));
          ShortFault shortFault(line_capacitance=1e-6)
            annotation (Placement(transformation(extent={{40,-26},{0,22}})));
          EMTPtransformer eMTPtransformer(f_cut=300)
            annotation (Placement(transformation(extent={{-14,-18},{-54,22}})));
          Line_R line_R(Resistance=1000) annotation (Placement(transformation(
                  extent={{-112,-18},{-72,22}})));
          Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(
                transformation(extent={{-130,-30},{-110,-10}})));
        equation
          connect(line_R.n, eMTPtransformer.Bd)
            annotation (Line(points={{-72,2},{-54,2}},  color={0,0,255}));
          connect(eMTPtransformer.Ad, line_R.n1)
            annotation (Line(points={{-54,-10},{-72,-10}},  color={0,0,255}));
          connect(eMTPtransformer.Cd, line_R.n2)
            annotation (Line(points={{-54,14},{-72,14}},  color={0,0,255}));
          connect(line_R.p1, line_R.p2) annotation (Line(points={{-112,-10},{
                  -120,-10},{-120,14},{-112,14}}, color={0,0,255}));
          connect(line_R.p, line_R.p2) annotation (Line(points={{-112,2},{-120,
                  2},{-120,14},{-112,14}}, color={0,0,255}));
          connect(line_R.p1, ground.p)
            annotation (Line(points={{-112,-10},{-120,-10}}, color={0,0,255}));
          connect(shortFault.C, eMTPGrid.C)
            annotation (Line(points={{40,14},{60,14}}, color={0,0,255}));
          connect(shortFault.B, eMTPGrid.B)
            annotation (Line(points={{40,2},{60,2}}, color={0,0,255}));
          connect(shortFault.A, eMTPGrid.A)
            annotation (Line(points={{40,-10},{60,-10}}, color={0,0,255}));
          connect(eMTPtransformer.Cy, shortFault.C_n)
            annotation (Line(points={{-14.4,14},{0,14}}, color={0,0,255}));
          connect(eMTPtransformer.By, shortFault.B_n)
            annotation (Line(points={{-14,2},{0,2}}, color={0,0,255}));
          connect(eMTPtransformer.Ay, shortFault.A_n)
            annotation (Line(points={{-14,-10},{0,-10}}, color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},
                    {140,100}})),
            Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,
                    -100},{140,100}})),
            experiment(
              StopTime=10,
              Interval=1e-05,
              __Dymola_fixedstepsize=1e-05,
              __Dymola_Algorithm="Euler"));
        end EMTPTransTest;

        model SmoothSwitchTest
          tools.SmoothSwitch smoothSwitch
            annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
          Modelica.Blocks.Sources.BooleanPulse booleanPulse(period=1)
            annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
          Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage(V=10, f=60)
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={48,-10})));
          Modelica.Electrical.Analog.Basic.Resistor resistor(R=10) annotation (
              Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={0,-30})));
          Modelica.Electrical.Analog.Basic.Ground ground
            annotation (Placement(transformation(extent={{-10,-64},{10,-44}})));
          Modelica.Electrical.Analog.Basic.Inductor inductor(L=1)
            annotation (Placement(transformation(extent={{14,10},{34,30}})));
        equation
          connect(booleanPulse.y, smoothSwitch.u)
            annotation (Line(points={{-59,0},{-10,0}}, color={255,0,255}));
          connect(resistor.p, smoothSwitch.pin1)
            annotation (Line(points={{0,-20},{0,-10}}, color={0,0,255}));
          connect(resistor.n, sineVoltage.n) annotation (Line(points={{0,-40},{
                  0,-44},{48,-44},{48,-20}}, color={0,0,255}));
          connect(resistor.n, ground.p)
            annotation (Line(points={{0,-40},{0,-44}}, color={0,0,255}));
          connect(smoothSwitch.pin, inductor.p)
            annotation (Line(points={{0,10},{0,20},{14,20}}, color={0,0,255}));
          connect(inductor.n, sineVoltage.p) annotation (Line(points={{34,20},{
                  48,20},{48,0}}, color={0,0,255}));
          annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
              Diagram(coordinateSystem(preserveAspectRatio=false)));
        end SmoothSwitchTest;

        model SmoothEMTPTransTest
          EMTPGrid eMTPGrid(Vbase=230000)
            annotation (Placement(transformation(extent={{60,-18},{100,22}})));
          EMTPtransformer eMTPtransformer(
            f_cut=300,
            GroundingResistance=1e3,
            Rtf_delta=100)
            annotation (Placement(transformation(extent={{-14,-18},{-54,22}})));
          Line_R line_R(Resistance=100)  annotation (Placement(transformation(
                  extent={{-112,-18},{-72,22}})));
          Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(
                transformation(extent={{-130,-30},{-110,-10}})));
          SmoothShortFault smoothShortFault(f_cut=100)
            annotation (Placement(transformation(extent={{46,-26},{2,22}})));
        equation
          connect(line_R.n, eMTPtransformer.Bd)
            annotation (Line(points={{-72,2},{-54,2}},  color={0,0,255}));
          connect(eMTPtransformer.Ad, line_R.n1)
            annotation (Line(points={{-54,-10},{-72,-10}},  color={0,0,255}));
          connect(eMTPtransformer.Cd, line_R.n2)
            annotation (Line(points={{-54,14},{-72,14}},  color={0,0,255}));
          connect(line_R.p1, line_R.p2) annotation (Line(points={{-112,-10},{
                  -120,-10},{-120,14},{-112,14}}, color={0,0,255}));
          connect(line_R.p, line_R.p2) annotation (Line(points={{-112,2},{-120,
                  2},{-120,14},{-112,14}}, color={0,0,255}));
          connect(line_R.p1, ground.p)
            annotation (Line(points={{-112,-10},{-120,-10}}, color={0,0,255}));
          connect(smoothShortFault.C, eMTPGrid.C)
            annotation (Line(points={{46,14},{60,14}}, color={0,0,255}));
          connect(smoothShortFault.B, eMTPGrid.B)
            annotation (Line(points={{46,2},{60,2}}, color={0,0,255}));
          connect(smoothShortFault.A, eMTPGrid.A)
            annotation (Line(points={{46,-10},{60,-10}}, color={0,0,255}));
          connect(eMTPtransformer.Cy, smoothShortFault.C_n)
            annotation (Line(points={{-14.4,14},{2,14}}, color={0,0,255}));
          connect(smoothShortFault.B_n, eMTPtransformer.By)
            annotation (Line(points={{2,2},{-14,2}}, color={0,0,255}));
          connect(eMTPtransformer.Ay, smoothShortFault.A_n)
            annotation (Line(points={{-14,-10},{2,-10}}, color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},
                    {140,100}})),
            Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,
                    -100},{140,100}})),
            experiment(
              StopTime=0.003,
              __Dymola_NumberOfIntervals=100000,
              __Dymola_fixedstepsize=1e-05,
              __Dymola_Algorithm="Euler"));
        end SmoothEMTPTransTest;

        model SmoothEMTPGridTest
          EMTPGrid eMTPGrid(Vbase=230000)
            annotation (Placement(transformation(extent={{12,-20},{52,20}})));
          SmoothShortFault smoothShortFault(f_cut=100, threshold=0.5)
            annotation (Placement(transformation(extent={{-40,-28},{0,20}})));
        equation
          connect(smoothShortFault.C_n, eMTPGrid.C)
            annotation (Line(points={{0,12},{12,12}}, color={0,0,255}));
          connect(smoothShortFault.B_n, eMTPGrid.B)
            annotation (Line(points={{0,0},{12,0}}, color={0,0,255}));
          connect(smoothShortFault.A_n, eMTPGrid.A)
            annotation (Line(points={{0,-12},{12,-12}}, color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false)),
            Diagram(coordinateSystem(preserveAspectRatio=false)),
            experiment(
              StopTime=10,
              Interval=0.0001,
              __Dymola_fixedstepsize=1e-05,
              __Dymola_Algorithm="Euler"));
        end SmoothEMTPGridTest;

        model TFsubCircuitTest
          TFsubcircuitZeroZsec tFsubcircuitZeroZsec(
            n=10,
            Lp=0.19,
            Rp=1.8,
            Ls=0,
            Rs=0,
            f_cut=1000) annotation (Placement(transformation(extent={{-34,-30},
                    {-14,-10}})));
          Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(
                transformation(extent={{-54,-70},{-34,-50}})));
          Modelica.Electrical.Analog.Basic.Resistor resistor(R=100) annotation (
             Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={6,-22})));
          EMTPGrid eMTPGrid(Vbase=23)
            annotation (Placement(transformation(extent={{-102,-32},{-142,8}})));
        equation
          connect(tFsubcircuitZeroZsec.pin_n1, tFsubcircuitZeroZsec.pin_n)
            annotation (Line(points={{-14,-30},{-14,-42},{-34,-42},{-34,-30}},
                color={0,0,255}));
          connect(resistor.p, tFsubcircuitZeroZsec.pin_p1) annotation (Line(
                points={{6,-12},{6,-4},{-14,-4},{-14,-10}}, color={0,0,255}));
          connect(resistor.n, tFsubcircuitZeroZsec.pin_n) annotation (Line(
                points={{6,-32},{6,-42},{-34,-42},{-34,-30}}, color={0,0,255}));
          connect(eMTPGrid.A, tFsubcircuitZeroZsec.pin_p) annotation (Line(
                points={{-102,-24},{-40,-24},{-40,-10},{-34,-10}}, color={0,0,
                  255}));
          connect(eMTPGrid.B, ground.p) annotation (Line(points={{-102,-12},{
                  -86,-12},{-86,-36},{-44,-36},{-44,-50}}, color={0,0,255}));
          connect(eMTPGrid.C, ground.p) annotation (Line(points={{-102,0},{-72,
                  0},{-72,-44},{-64,-44},{-64,-50},{-44,-50}}, color={0,0,255}));
          connect(ground.p, tFsubcircuitZeroZsec.pin_n) annotation (Line(points
                ={{-44,-50},{-40,-50},{-40,-42},{-34,-42},{-34,-30}}, color={0,
                  0,255}));
          annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
              Diagram(coordinateSystem(preserveAspectRatio=false)));
        end TFsubCircuitTest;

        model EMTPTransModTest
          EMTPGrid eMTPGrid(Vbase=230000)
            annotation (Placement(transformation(extent={{16,-20},{56,20}})));
          Line_R line_R(Resistance=100)  annotation (Placement(transformation(
                  extent={{-114,-20},{-74,20}})));
          Modelica.Electrical.Analog.Basic.Ground ground annotation (Placement(
                transformation(extent={{-130,-32},{-110,-12}})));
          EMTPtransformerMod eMTPtransformerMod
            annotation (Placement(transformation(extent={{-10,-20},{-50,20}})));
        equation
          connect(line_R.p1, line_R.p2) annotation (Line(points={{-114,-12},{
                  -120,-12},{-120,12},{-114,12}}, color={0,0,255}));
          connect(line_R.p, line_R.p2) annotation (Line(points={{-114,0},{-120,
                  0},{-120,12},{-114,12}}, color={0,0,255}));
          connect(line_R.p1, ground.p)
            annotation (Line(points={{-114,-12},{-120,-12}}, color={0,0,255}));
          connect(eMTPtransformerMod.Cd, line_R.n2)
            annotation (Line(points={{-50,12},{-74,12}}, color={0,0,255}));
          connect(line_R.n, eMTPtransformerMod.Bd)
            annotation (Line(points={{-74,0},{-50,0}}, color={0,0,255}));
          connect(eMTPtransformerMod.Ad, line_R.n1)
            annotation (Line(points={{-50,-12},{-74,-12}}, color={0,0,255}));
          connect(eMTPtransformerMod.Cy, eMTPGrid.C)
            annotation (Line(points={{-10.4,12},{16,12}}, color={0,0,255}));
          connect(eMTPGrid.B, eMTPtransformerMod.By)
            annotation (Line(points={{16,0},{-10,0}}, color={0,0,255}));
          connect(eMTPtransformerMod.Ay, eMTPGrid.A)
            annotation (Line(points={{-10,-12},{16,-12}}, color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},
                    {140,100}})),
            Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,
                    -100},{140,100}})),
            experiment(
              StopTime=0.003,
              __Dymola_NumberOfIntervals=100000,
              __Dymola_fixedstepsize=1e-05,
              __Dymola_Algorithm="Euler"));
        end EMTPTransModTest;

        model EMTPTransZeroSeqTest
          EMTPGrid eMTPGrid(Vbase=230000)
            annotation (Placement(transformation(extent={{34,-20},{74,20}})));
          Line_R line_R(Resistance=100)  annotation (Placement(transformation(
                  extent={{-114,-20},{-74,20}})));
          Modelica.Electrical.Analog.Basic.Ground ground
            annotation (Placement(transformation(extent={{-130,-32},{-110,-12}})));
          EMTPtransformerZeroSeq eMTPtransformerZeroSeq(Rtf_delta=0.3)
            annotation (Placement(transformation(extent={{4,-20},{-50,20}})));
        equation
          connect(line_R.p1, line_R.p2) annotation (Line(points={{-114,-12},{-120,-12},{
                  -120,12},{-114,12}},            color={0,0,255}));
          connect(line_R.p, line_R.p2) annotation (Line(points={{-114,0},{-120,0},{-120,
                  12},{-114,12}},          color={0,0,255}));
          connect(line_R.p1, ground.p)
            annotation (Line(points={{-114,-12},{-120,-12}}, color={0,0,255}));
          connect(eMTPtransformerZeroSeq.Cd, line_R.n2)
            annotation (Line(points={{-50,12},{-74,12}}, color={0,0,255}));
          connect(line_R.n, eMTPtransformerZeroSeq.Bd)
            annotation (Line(points={{-74,0},{-50,0}}, color={0,0,255}));
          connect(eMTPtransformerZeroSeq.Ad, line_R.n1)
            annotation (Line(points={{-50,-12},{-74,-12}}, color={0,0,255}));
          connect(eMTPtransformerZeroSeq.Cy, eMTPGrid.C)
            annotation (Line(points={{3.61429,12},{34,12}},
                                                          color={0,0,255}));
          connect(eMTPGrid.B, eMTPtransformerZeroSeq.By)
            annotation (Line(points={{34,0},{4,0}},   color={0,0,255}));
          connect(eMTPtransformerZeroSeq.Ay, eMTPGrid.A)
            annotation (Line(points={{4,-12},{34,-12}},   color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,100}})),
            Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,
                    100}})),
            experiment(
              StopTime=3,
              __Dymola_NumberOfIntervals=100000,
              __Dymola_fixedstepsize=1e-05,
              __Dymola_Algorithm="Euler"));
        end EMTPTransZeroSeqTest;

        model DeltaGridTest
          ShortFault shortFault(line_capacitance=1e-6)
            annotation (Placement(transformation(extent={{-48,-28},{-8,20}})));
          DeltaGrid deltaGrid(
            Vbase=650,
            GroundingResistance=1e3,
            Rtf_delta=0.5)
            annotation (Placement(transformation(extent={{24,-26},{76,26}})));
        equation
          connect(shortFault.C_n, deltaGrid.C) annotation (Line(points={{-8,12},
                  {10,12},{10,15.6},{24,15.6}}, color={0,0,255}));
          connect(shortFault.B_n, deltaGrid.B)
            annotation (Line(points={{-8,0},{24,0}}, color={0,0,255}));
          connect(shortFault.A_n, deltaGrid.A) annotation (Line(points={{-8,-12},
                  {12,-12},{12,-15.6},{24,-15.6}}, color={0,0,255}));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=false)),
            Diagram(coordinateSystem(preserveAspectRatio=false)),
            experiment(
              StopTime=10,
              Interval=1e-05,
              __Dymola_fixedstepsize=2e-05,
              __Dymola_Algorithm="Euler"));
        end DeltaGridTest;
      end GridComponentsTest;
    end GridComponents;

  end GFM_PSCAD;

  package SCRX9 "scrx9_dll"
    class SCRX9_DLL
      extends ExternalObject;

      function constructor
          output SCRX9_DLL scrx9_dll;
          external "C" scrx9_dll = init_scrx_model() annotation (Library="SCRX9",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
      end constructor;

      function destructor
          input SCRX9_DLL scrx9_dll;
          external "C" deinit_scrx_model(scrx9_dll) annotation (Library="SCRX9",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
      end destructor;

      annotation (Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={255,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.None), Text(
          extent={{-100,46},{98,-102}},
          textColor={238,46,47},
          textString="Class
")}));
    end SCRX9_DLL;

    model SCRX
      Modelica.Blocks.Interfaces.RealInput ETERM(start = 1) annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={100,50})));
      Modelica.Blocks.Interfaces.RealInput XADIFD(start = 1.325) annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={100,-50})));
      Modelica.Blocks.Interfaces.RealOutput EFD annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-110,0})));
      SCRX9_DLL scrx9_struct = SCRX9_DLL();
    algorithm
        Functions.update(
          scrx9_struct,
          time,
          1,
          ETERM,
          0,
          XADIFD,
          ETERM,
          0,
          0);
      EFD:=Functions.model_output(scrx9_struct);

      annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
              Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.None), Text(
              extent={{-78,48},{68,-48}},
              textColor={0,0,0},
              textString="SCRX9")}), Diagram(coordinateSystem(preserveAspectRatio=false)));
    end SCRX;

    package Functions
      function update
        input SCRX9_DLL scrx9_dll;
        input Real t;
        input Real vref;
        input Real ec;
        input Real vs;
        input Real ifd;
        input Real vt;
        input Real vuel;
        input Real voel;
        external "C" update_scrx_input(scrx9_dll,t,vref,ec,vs,ifd,vt,vuel,voel) annotation (Library="SCRX9",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
      end update;

      function model_output
        input SCRX9_DLL scrx9_dll;
        output Real out;
        external "C" out = model_calculate(scrx9_dll) annotation (Library="SCRX9",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
      end model_output;

      function get_time
        output Real out;
        external"C" out = get_sim_time() annotation (Library="SCRX9",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
      end get_time;

    function add_c
      input Real a;
      input Real b;
      output Real sum;
      external "C" sum = my_sum(a,b) annotation (Library="SCRX9",LibraryDirectory="modelica://OpenIPSL/Resources/Library");
    end add_c;
    end Functions;

  end SCRX9;
end IEEE_CIGRE;
