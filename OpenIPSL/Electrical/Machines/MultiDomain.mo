within OpenIPSL.Electrical.Machines;
package MultiDomain "Multi-domain motor models"
  package Motors "Single phase and three phase multidomain motor models"

    model MD_All_In_One_ThreePhaseMotor
      "All-in-one three-phase induction motor model framework for all three-phase multidomain motor models"
      parameter OpenIPSL.Types.ApparentPower M_b = 15e6 "Machine base power"
                                                                            annotation (Dialog(group="Power flow data"));
      extends OpenIPSL.Electrical.Essentials.pfComponent(
        final enablefn=false,
        final enableV_b=false,
        final enableangle_0=false,
        final enablev_0=false,
        final enableQ_0=false,
        final enableP_0=false,
        final enabledisplayPF=true,
        final enableS_b=false);

      parameter Boolean Sup = true "True: Start-up process, False: Steady-state condition" annotation (Dialog(group="Motor Setup"));
      parameter Boolean Ctrl = true "True: Model for VSD control, False: Model not controllable"
                                                                                                annotation (Dialog(group="Motor Setup"));
      parameter Real N = 1 "Number of pair of Poles"
                                                    annotation (Dialog(group="Machine Parameters"));
      parameter Modelica.Units.SI.Time H = 0.4 "Inertia constant"
                                                                 annotation (Dialog(group="Machine Parameters"));

      replaceable ThreePhase.BaseClasses.BaseMultiDomainThreePhase motor(
        M_b=M_b,
        P_0=P_0,
        Q_0=Q_0,
        v_0=v_0,
        angle_0=angle_0,
        Sup=Sup,
        Ctrl=Ctrl,
        N=N,
        H=H) annotation (
        Dialog(group="Motor Selection"),
        choicesAllMatching=true,
        Placement(transformation(extent={{10,-10},{-10,10}})));
      OpenIPSL.Interfaces.PwPin pwpin
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange1
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.Blocks.Interfaces.RealOutput wr
        "Absolute angular velocity of flange as output signal" annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,-110}), iconTransformation(
            extent={{-11.7614,-11.7642},{28.2274,-51.7642}},
            rotation=270,
            origin={-28.2358,-111.761})));
      Modelica.Blocks.Interfaces.RealInput we if Ctrl annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,-120})));
      Modelica.Blocks.Interfaces.RealInput mech_torque annotation (Placement(
            transformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={60,-120})));
    equation
      connect(motor.p, pwpin)
        annotation (Line(points={{-10,0},{-100,0}}, color={0,0,255}));
      connect(motor.flange, flange1)
        annotation (Line(points={{10,0},{100,0}}, color={0,0,0}));
      connect(motor.wr, wr) annotation (Line(points={{-6,-12},{-6,-96},{-60,-96},{-60,
              -110}}, color={0,0,127}));
      connect(motor.we, we)
        annotation (Line(points={{0,-12},{0,-120}}, color={0,0,127}));
      connect(motor.mech_torque, mech_torque) annotation (Line(points={{6,-12},{6,-96},
              {60,-96},{60,-120}}, color={0,0,127}));
      annotation (preferredView = "info",Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Text(
              extent={{-90,100},{90,60}},
              textColor={0,140,72},
              textString="MD ALL-IN-ONE"),
              Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}),
                                               Text(
              extent={{-50,48},{50,-52}},
              lineColor={0,0,0},
              textString="M"),                Ellipse(
              fillColor={255,255,255},
              extent={{-60,-60},{60,60}}),
                              Text(
              origin={0,-80},
              extent={{-70,-10},{70,10}},
              fontName="Arial",
              lineColor={0,0,0},
              textString="%name")}),                                 Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end MD_All_In_One_ThreePhaseMotor;

    package SinglePhase "Multi-domain single and dual phase motor models"

      model MD_SPIM
        "This model is the steady-state circuit model of the single phase induction motor model."

        extends
          OpenIPSL.Electrical.Machines.MultiDomain.Motors.SinglePhase.BaseClasses.BaseMultiDomainSinglePhase;

          parameter OpenIPSL.Types.PerUnit R1 "Stator winding resistor" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit R2 "Rotor winding resistor" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit X1 "Stator winding reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit X2 "Rotor winding reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit Xm "Magnitization reactance value" annotation (Dialog(group="Machine parameters"));

          OpenIPSL.Types.PerUnit RF "Equivalent resistor component of the forward circuit";
          OpenIPSL.Types.PerUnit XF "Equivalent resistor component of the forward circuit";
          OpenIPSL.Types.PerUnit RB "Equivalent resistor component of the backward circuit";
          OpenIPSL.Types.PerUnit XB "Equivalent resistor component of the backward circuit";
          OpenIPSL.Types.PerUnit I "Magnitude of the consumed current";
          OpenIPSL.Types.PerUnit Ir "Real component of the consumed current in Machine Base";
          OpenIPSL.Types.PerUnit Ii "Imaginary component of the consumed current in Machine Base";
          OpenIPSL.Types.PerUnit P_AGF "Air Gap Power for forward magnetic field";
          OpenIPSL.Types.PerUnit P_AGB "Air Gap Power for reverse field";
          OpenIPSL.Types.PerUnit Pc "Net air gap power in single-phase induction motor";
          //OpenIPSL.Types.PerUnit Q "Reactive Power consumed by the single phase induction motor model";
          OpenIPSL.Types.PerUnit Te "Electrical Torque";
          OpenIPSL.Types.PerUnit P;
          OpenIPSL.Types.PerUnit Q;

      protected
        parameter OpenIPSL.Types.PerUnit vr0=v_0*cos(angle_0);
        parameter OpenIPSL.Types.PerUnit vi0=v_0*sin(angle_0);
        parameter OpenIPSL.Types.PerUnit ir0=(P_0/S_b*vr0 + Q_0/S_b*vi0)/(vr0^2 + vi0^2);
        parameter OpenIPSL.Types.PerUnit ii0=(P_0/S_b*vi0 - Q_0/S_b*vr0)/(vr0^2 + vi0^2);
        //parameter Modelica.Units.SI.AngularVelocity w0 = w_b;
        parameter OpenIPSL.Types.PerUnit s0 = Modelica.Constants.eps;
        OpenIPSL.Types.PerUnit sm(fixed=false, start= s0)   "Induction motor slip for calculation when dividing by s";

      initial equation
        der(s) = 0;

      equation

        //Network Interface Equations
        [Ir; Ii] = (1/CoB)*[p.ir; p.ii];
        I = sqrt(Ir^2 + Ii^2);

        //Active and Reactive Power Consumption in the system base
        P = p.vr*p.ir + p.vi*p.ii;
        Q = (-p.vr*p.ii) + p.vi*p.ir;

        //Slip for calculations
        sm = max(s, Modelica.Constants.eps);
        //sm = s;

        //Forward and Reverse Impedance Calculations
        RF = (-X2*Xm*R2/sm + R2*Xm*(X2 + Xm)/sm)/((R2/sm)^2 + (X2 + Xm)^2);
        XF = ((R2/sm)^2*Xm + X2*Xm*(X2 + Xm))/((R2/sm)^2 + (X2 + Xm)^2);
        RB = (-X2*Xm*R2/(2-sm) + R2*Xm*(X2 + Xm)/(2-sm))/((R2/(2-sm))^2 + (X2 + Xm)^2);
        XB = ((R2/(2-sm))^2*Xm + X2*Xm*(X2 + Xm))/((R2/(2-sm))^2 + (X2 + Xm)^2);

        Ir = p.vr*(0.5*RF + 0.5*RB + R1)/((0.5*RF + 0.5*RB + R1)^2 + (0.5*XF + 0.5*XB + X1)^2) + p.vi*(0.5*XF + 0.5*XB + X1)/((0.5*RF + 0.5*RB + R1)^2 + (0.5*XF + 0.5*XB + X1)^2);
        Ii = p.vi*(0.5*RF + 0.5*RB + R1)/((0.5*RF + 0.5*RB + R1)^2 + (0.5*XF + 0.5*XB + X1)^2) - p.vr*(0.5*XF + 0.5*XB + X1)/((0.5*RF + 0.5*RB + R1)^2 + (0.5*XF + 0.5*XB + X1)^2);

        P_AGF = I^2*0.5*RF;
        P_AGB = I^2*0.5*RB;
        Pc     = P_AGF - P_AGB;

        Te = Pc;
        der(s) = (Tmech_pu_motor - Te)/(2*H);

          annotation (preferredView = "info",Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0}),
              Text(
                extent={{-100,-60},{100,-100}},
                lineColor={28,108,200},
                textString="%name"),             Text(
                extent={{-50,50},{50,-50}},
                lineColor={0,0,0},
                textString="M"),                Ellipse(
                fillColor={255,255,255},
                extent={{-56,-56},{55.932,56}})}),                     Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end MD_SPIM;

      model MD_DPIM_v1
        "This model is the steady-state circuit model of the single phase induction motor model initialized by either a split-phase auxiliary circuit or a capacitor-start auxiliary circuit (VERSION 1)"

      extends
          OpenIPSL.Electrical.Machines.MultiDomain.Motors.SinglePhase.BaseClasses.BaseMultiDomainSinglePhase(
            Rotor_Inertia(w(fixed=false, start=w0)));

        parameter Boolean Sup = true "True: Start-up process, False: Steady-state condition" annotation (Dialog(group="Motor Setup"));

        parameter Integer init "Initialization Method: (1) Split-Phase Motor, (2) Capacitor-Start Motor" annotation (Dialog(group="Motor Setup"), choices(choice=1, choice=2));
        parameter Real switch_open_speed = 0.2 "Auxiliary winding cut-off speed" annotation (Dialog(group="Machine parameters"));
        parameter Modelica.Units.SI.Inductance Lmainr "Mutual-inductance of the main winding" annotation (Dialog(group="Machine parameters"));
        parameter Modelica.Units.SI.Inductance Lmain "Self-inductance of the magnetizing branch" annotation (Dialog(group="Machine parameters"));
        parameter Modelica.Units.SI.Inductance Lauxr "Mutual-inductance of the auxiliary winding" annotation (Dialog(group="Machine parameters"));
        parameter Modelica.Units.SI.Inductance Laux "Self-inductance of the auxiliary winding" annotation (Dialog(group="Machine parameters"));
        parameter Modelica.Units.SI.Inductance Lr "Self-inductance of the equivalent rotor windings" annotation (Dialog(group="Machine parameters"));
        parameter Modelica.Units.SI.Resistance Rmain "Resistance of the main winding" annotation (Dialog(group="Machine parameters"));
        parameter Modelica.Units.SI.Resistance Rr "Resistance of the rotor winding" annotation (Dialog(group="Machine parameters"));
        parameter Modelica.Units.SI.Resistance Raux "Resistance of the auxiliary winding" annotation (Dialog(group="Machine parameters"));
        parameter Modelica.Units.SI.Capacitance Cc "Capacitance of the capacitor-start configuration" annotation (Dialog(group="Machine parameters", enable=(init == 2)));

        Modelica.Units.SI.Reactance Xmain;
        Modelica.Units.SI.Reactance Xaux;
        OpenIPSL.Types.PerUnit P;
        OpenIPSL.Types.PerUnit Q;
        OpenIPSL.Types.PerUnit Pmb;
        OpenIPSL.Types.PerUnit Qmb;
        OpenIPSL.Types.PerUnit s;
        OpenIPSL.Types.PerUnit Te1 "First Component of the Electrical Torque";
        OpenIPSL.Types.PerUnit Te2 "Second Component of the Electrical Torque";
        OpenIPSL.Types.PerUnit Te "Total Electrical Torque";
        Modelica.Units.SI.ActivePower Pc;
        Modelica.Units.SI.ReactivePower Qc;

          //Modelica.SIunits.Torque Tele;
        Modelica.Units.SI.Current Iaux_real;
        Modelica.Units.SI.Current Iaux_imag;
        Modelica.Units.SI.Current Imain_real;
        Modelica.Units.SI.Current Imain_imag;
        Modelica.Units.SI.Current Itotal;
        Modelica.Units.SI.Current Itotal_real;
        Modelica.Units.SI.Current Itotal_imag;
        Modelica.Units.SI.Voltage Vmain_real;
        Modelica.Units.SI.Voltage Vmain_imag;
        Modelica.Units.SI.Voltage Vaux_real;
        Modelica.Units.SI.Voltage Vaux_imag;
        Modelica.Units.SI.Voltage Vmain_aux_real;
        Modelica.Units.SI.Voltage Vmain_aux_imag;
        Real K1_real;
        Real K1_imag;
        Real K2_real;
        Real K2_imag;
        Real K3_real;
        Real K3_imag;
        Real KplusK_real;
        Real KplusK_imag;
        Real KminusK_real;
        Real KminusK_imag;
        Real Kden_real;
        Real Kden_imag;
        Modelica.Units.SI.Conductance Cond1_aux_real;
        Modelica.Units.SI.Conductance Cond1_aux_imag;
        Modelica.Units.SI.Conductance Cond2_aux_real;
        Modelica.Units.SI.Conductance Cond2_aux_imag;
        Modelica.Units.SI.Conductance Cond1_main_real;
        Modelica.Units.SI.Conductance Cond1_main_imag;
        Real Constant1;
        Real Constant2;

      protected
        parameter OpenIPSL.Types.PerUnit vr0=v_0*cos(angle_0);
        parameter OpenIPSL.Types.PerUnit vi0=v_0*sin(angle_0);
        parameter OpenIPSL.Types.PerUnit ir0=(P_0/S_b*vr0 + Q_0/S_b*vi0)/(vr0^2 + vi0^2);
        parameter OpenIPSL.Types.PerUnit ii0=(P_0/S_b*vi0 - Q_0/S_b*vr0)/(vr0^2 + vi0^2);
        parameter Modelica.Units.SI.AngularVelocity w0 = if Sup == true then Modelica.Constants.eps else w_b;
        Modelica.Units.SI.Impedance Z_b=V_b^2/S_b;
        Modelica.Units.SI.Current I_b=S_b/V_b;
        OpenIPSL.Types.PerUnit sm  "Induction motor slip for calculation when dividing by s";

      initial equation
        if Sup == true then
          s = 1- Modelica.Constants.eps;
          else
        der(s) = 0;
        end if;

      equation

        //SI Reactance of the Main Winding of the Dual Phase Induction Motor
        Xmain = w_b*Lmain;
        Xaux = w_b*Laux;

        //Slip for calculations
        sm = s;

        // Calculation of the coeficients of the two-phase motor

        KplusK_real = Rr*w_b*(Rr^2 - Lr^2*(sm-2)*sm*w_b^2)/(((Lr^2*(sm-2)^2*w_b^2) + Rr^2)*((Lr*sm*w_b)^2 + Rr^2));
        KplusK_imag = -Lr*w_b^2*((Lr*(sm-2)*sm*w_b)^2 + Rr^2*(sm^2-2*sm+2))/(((Lr*(sm-2)*w_b)^2 + Rr^2)*((Lr*sm*w_b)^2 + Rr^2));
        KminusK_real = Rr*(sm-1)*w_b*(Lr^2*(sm-2)*sm*w_b^2 + Rr^2)/(((Lr*(sm-2)*w_b)^2 + Rr^2)*((Lr*sm*w_b)^2 + Rr^2));
        KminusK_imag = -2*Lr*Rr^2*(sm-1)*w_b^2/(((Lr*(sm-2)*w_b)^2 + Rr^2)*((Lr*sm*w_b)^2 + Rr^2));

        K1_real = Rmain + w_b*Lmainr^2*KplusK_real;
        K1_imag = w_b*Lmain + w_b*Lmainr^2*KplusK_imag;

        K2_real = -w_b*Lmainr*Lauxr*KminusK_imag;
        K2_imag = w_b*Lmainr*Lauxr*KminusK_real;

        K3_real = Raux + w_b*Lauxr^2*KplusK_real;
        K3_imag = if init == 1 then w_b*Laux + w_b*Lauxr^2*KplusK_imag else w_b*Laux + w_b*Lauxr^2*KplusK_imag - 1/(w_b*Cc);

        Kden_real = (K2_real^2 - K2_imag^2 + K1_real*K3_real - K1_imag*K3_imag);
        Kden_imag = (2*K2_real*K2_imag + K1_real*K3_imag + K3_real*K1_imag);

        Cond2_aux_real = (K2_real*Kden_real + K2_imag*Kden_imag)/(Kden_real^2 + Kden_imag^2);
        Cond2_aux_imag = (K2_imag*Kden_real - K2_real*Kden_imag)/(Kden_real^2 + Kden_imag^2);

        Cond1_aux_real = (K1_real*Kden_real + K1_imag*Kden_imag)/(Kden_real^2 + Kden_imag^2);
        Cond1_aux_imag = (K1_imag*Kden_real - K1_real*Kden_imag)/(Kden_real^2 + Kden_imag^2);

        Cond1_main_real = K1_real/(K1_real^2 + K1_imag^2);
        Cond1_main_imag = K1_imag/(K1_real^2 + K1_imag^2);
        Constant1 = (K2_real*K1_real + K2_imag*K1_imag)/(K1_real^2 + K1_imag^2);
        Constant2 = (K2_imag*K1_real - K2_real*K1_imag)/(K1_real^2 + K1_imag^2);

        Vmain_real = p.vr*V_b;
        Vmain_imag = p.vi*V_b;
        Vmain_aux_real = if sm > switch_open_speed then p.vr*V_b else 0;
        Vmain_aux_imag = if sm > switch_open_speed then p.vi*V_b else 0;
        Vaux_real = if sm > switch_open_speed then p.vr*V_b else 0;
        Vaux_imag = if sm > switch_open_speed then p.vi*V_b else 0;

        Iaux_real = Cond1_aux_real*Vaux_real - Cond1_aux_imag*Vaux_imag + Cond2_aux_real*Vaux_real - Cond2_aux_imag*Vaux_imag;
        Iaux_imag = (Cond1_aux_real*Vaux_imag + Cond1_aux_imag*Vaux_real + Cond2_aux_real*Vaux_imag + Cond2_aux_imag*Vaux_real);
        Imain_real = Cond1_main_real*Vmain_real - Cond1_main_imag*Vmain_imag - Constant1*Iaux_real + Constant2*Iaux_imag;
        Imain_imag = -(Cond1_main_imag*Vmain_real + Cond1_main_real*Vmain_imag - Constant2*Iaux_real - Constant1*Iaux_imag);
        Itotal = sqrt((Imain_real + Iaux_real)^2 + (Imain_imag + Iaux_imag)^2);
        Itotal_real = Imain_real + Iaux_real;
        Itotal_imag = (Imain_imag + Iaux_imag);
        p.ir = Itotal_real/I_b;
        p.ii = Itotal_imag/I_b;

        P = p.vr*p.ir + p.vi*p.ii;
        Q = (-p.vr*p.ii) + p.vi*p.ir;

        Pmb = P/CoB;
        Qmb = Q/CoB;
        Pc = P*S_b;
        Qc = Q*S_b;

        Te1 = ((Lmainr^2*(Imain_real^2 + Imain_imag^2) + Lauxr^2*(Iaux_real^2 + Iaux_imag^2))*KminusK_real)/T_bm;
        Te2 = (2*Lmainr*Lauxr*KplusK_real*(Imain_real*Iaux_imag - Imain_imag*Iaux_real))/T_bm;
        Te  =  N*(Te1 + Te2);

        der(s) = (Tmech_pu_motor - Pmb)/(2*H);
        annotation (preferredView = "info",Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end MD_DPIM_v1;

      model MD_DPIM_v2
        "This model is the steady-state circuit model of the single phase induction motor model initialized by either a split-phase auxiliary circuit or a capacitor-start auxiliary circuit (VERSION 2)"

      extends
          OpenIPSL.Electrical.Machines.MultiDomain.Motors.SinglePhase.BaseClasses.BaseMultiDomainSinglePhase(
            Rotor_Inertia(w(fixed=false, start=w0)));

        import Modelica.ComplexMath;
        import Complex;
        import Modelica.ComplexMath.arg;
        import Modelica.ComplexMath.real;
        import Modelica.ComplexMath.imag;
        import Modelica.ComplexMath.conj;
        import Modelica.ComplexMath.fromPolar;
        import Modelica.ComplexMath.j;

        parameter Boolean Sup = true "True: Start-up process, False: Steady-state condition" annotation (Dialog(group="Motor Setup"));

        parameter Integer init "Initialization Method: (1) Split-Phase Motor, (2) Capacitor-Start Motor" annotation (Dialog(group="Motor Setup"), choices(choice=1, choice=2));
        parameter Real switch_open_speed = 0.2 "Auxiliary winding cut-off speed" annotation (Dialog(group="Machine parameters"));
        parameter Modelica.Units.SI.Inductance Lmainr "Mutual-inductance of the main winding" annotation (Dialog(group="Machine parameters"));
        parameter Modelica.Units.SI.Inductance Lmain "Self-inductance of the magnetizing branch" annotation (Dialog(group="Machine parameters"));
        parameter Modelica.Units.SI.Inductance Lauxr "Mutual-inductance of the auxiliary winding" annotation (Dialog(group="Machine parameters"));
        parameter Modelica.Units.SI.Inductance Laux "Self-inductance of the auxiliary winding" annotation (Dialog(group="Machine parameters"));
        parameter Modelica.Units.SI.Inductance Lr "Self-inductance of the equivalent rotor windings" annotation (Dialog(group="Machine parameters"));
        parameter Modelica.Units.SI.Resistance Rmain "Resistance of the main winding" annotation (Dialog(group="Machine parameters"));
        parameter Modelica.Units.SI.Resistance Rr "Resistance of the rotor winding" annotation (Dialog(group="Machine parameters"));
        parameter Modelica.Units.SI.Resistance Raux "Resistance of the auxiliary winding" annotation (Dialog(group="Machine parameters"));
        parameter Modelica.Units.SI.Capacitance Cc "Capacitance of the capacitor-start configuration" annotation (Dialog(group="Machine parameters", enable=(init == 2)));

        Modelica.Units.SI.Reactance Xmain;
        Modelica.Units.SI.Reactance Xaux;
        Modelica.Units.SI.Reactance Xc;
        OpenIPSL.Types.PerUnit P;
        OpenIPSL.Types.PerUnit Pmotorbase;
        OpenIPSL.Types.PerUnit Q;
        OpenIPSL.Types.PerUnit s;
        OpenIPSL.Types.PerUnit Te "Total Electrical Torque";
        Complex Te_pre;
        Modelica.Units.SI.ActivePower Pc;
        Modelica.Units.SI.ReactivePower Qc;

          //Modelica.SIunits.Torque Tele;

        Complex Kplus;
        Complex Kminus;
        Complex Vmain;
        Complex Vaux;
        Complex Lambda_main;
        Complex Lambda_aux;
        Complex Imain;
        Complex Iaux;
        Real KplusK_real;
        Real KplusK_imag;
        Real KminusK_real;
        Real KminusK_imag;

      protected
        parameter OpenIPSL.Types.PerUnit vr0=v_0*cos(angle_0);
        parameter OpenIPSL.Types.PerUnit vi0=v_0*sin(angle_0);
        parameter OpenIPSL.Types.PerUnit ir0=(P_0/S_b*vr0 + Q_0/S_b*vi0)/(vr0^2 + vi0^2);
        parameter OpenIPSL.Types.PerUnit ii0=(P_0/S_b*vi0 - Q_0/S_b*vr0)/(vr0^2 + vi0^2);
        parameter Modelica.Units.SI.AngularVelocity w0 = if Sup == true then Modelica.Constants.eps else w_b;
        Modelica.Units.SI.Impedance Z_b=V_b^2/S_b;
        Modelica.Units.SI.Current I_b=S_b/V_b;
        OpenIPSL.Types.PerUnit sm  "Induction motor slip for calculation when dividing by s";

      initial equation
        if Sup == true then
          s = 1- Modelica.Constants.eps;
          else
        der(s) = 0;
        end if;

      equation

        //Reactance of the Capacitor
        Xc = 1/(w_b*Cc);

        //SI Reactance of the Main Winding of the Dual Phase Induction Motor
        Xmain = w_b*Lmain;
        Xaux = w_b*Laux;

        //Slip for calculations
        sm = s;

        // Calculation of the coeficients of the two-phase motor

        Kplus = (sm*w_b)/(2*(Rr+ j*sm*w_b*Lr));
        Kminus = ((2-sm)*w_b)/(2*(Rr+ j*(2-sm)*w_b*Lr));

        KplusK_real = real(Kplus + Kminus);
        KplusK_imag = imag(Kplus + Kminus);
        KminusK_real = real(Kplus - Kminus);
        KminusK_imag = imag(Kplus - Kminus);

        Lambda_main = if sm > switch_open_speed then (Lmain - j*Lmainr^2*(Kplus + Kminus))*Imain + Lmainr*Lauxr*(Kplus - Kminus)*Iaux else (Lmain - j*Lmainr^2*(Kplus + Kminus))*Imain;
        Lambda_aux = if sm > switch_open_speed  then -Lmainr*Lauxr*(Kplus - Kminus)*Imain + (Laux - j*Lauxr^2*(Kplus + Kminus))*Iaux else 0*j;
        Vmain = V_b*(p.vr + j*p.vi);
        Vaux = if sm > switch_open_speed  then Vmain else 0*j;

        Imain = (Vmain - j*w_b*Lambda_main)/Rmain;

        if sm > switch_open_speed and init == 1 then
          Vaux = Iaux*Raux + j*w_b*Lambda_aux;
        elseif sm > switch_open_speed and init == 2 then
          Vaux = Iaux*Raux + j*w_b*Lambda_aux - j*Iaux/(w_b*Cc);
        else
          //Vaux = 0*j;
          Iaux = 0*j;
        end if;

        //Iaux = if sm > switch_open_speed and init == 1 then (Vaux - j*w_b*Lambda_aux)/Raux elseif sm > switch_open_speed and init == 2 then (Vaux - j*w_b*Lambda_aux)/(Raux - j/(w_b*Cc)) else 0*j;

        p.ir = real(Imain + Iaux)/I_b;
        p.ii = imag(Imain + Iaux)/I_b;

        P = p.vr*p.ir + p.vi*p.ii;
        Q = (-p.vr*p.ii) + p.vi*p.ir;

        Pmotorbase = P/CoB;

        Pc = P*S_b;
        Qc = Q*S_b;

        Te_pre = (Lmainr^2*Imain*conj(Imain) + Lauxr^2*Iaux*conj(Iaux))*conj(Kplus - Kminus) + j*Lmainr*Lauxr*(conj(Imain)*Iaux - Imain*conj(Iaux))*conj(Kplus + Kminus);
        Te  =  (N/T_bm)*real(Te_pre);

        der(s) = (Tmech_pu_motor - Pmotorbase)/(2*H);
        annotation (preferredView = "info",Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end MD_DPIM_v2;

      package BaseClasses "Multidomain partial models for single-phase motors"
        extends Modelica.Icons.BasesPackage;
        partial model BaseMultiDomainSinglePhase "Base class model for the single-phase and dual-phase multi-domain induction motor models."

            Modelica.Blocks.Sources.RealExpression Rotor_Speed(y=nr)
            annotation (Placement(transformation(extent={{70,-10},{50,10}})));
          Modelica.Mechanics.Rotational.Components.Inertia Rotor_Inertia(J=J_load)
            annotation (Placement(transformation(extent={{-40,-10},{-60,10}})));
          Modelica.Mechanics.Rotational.Interfaces.Flange_b flange annotation (
              Placement(transformation(extent={{-110,-10},{-90,10}}),
                iconTransformation(extent={{-110,-10},{-90,10}})));
          Modelica.Blocks.Interfaces.RealOutput wr
            "Absolute angular velocity of flange as output signal"
            annotation (Placement(transformation(extent={{-100,-50},{-120,-30}}),
                iconTransformation(
                extent={{20,-20},{-20,20}},
                rotation=90,
                origin={60,-120})));
          Modelica.Blocks.Interfaces.RealInput mech_torque annotation (Placement(
                transformation(
                extent={{-20,-20},{20,20}},
                rotation=90,
                origin={0,-120}),   iconTransformation(
                extent={{-20,-20},{20,20}},
                rotation=90,
                origin={-60,-120})));
                 OpenIPSL.Interfaces.PwPin p
            annotation (Placement(transformation(extent={{90,-10},{110,10}})));

            parameter OpenIPSL.Types.ApparentPower M_b = 15e6 "Machine base power"
                                                                                  annotation (Dialog(group="Power flow data"));
            extends OpenIPSL.Electrical.Essentials.pfComponent(
            final enabledisplayPF=false,
            final enablefn=false,
            final enableV_b=true,
            final enableangle_0=false,
            final enablev_0=false,
            final enableQ_0=false,
            final enableP_0=false,
            final enableS_b=true);

          import Modelica.ComplexMath.j;
          import OpenIPSL.NonElectrical.Functions.SE;
          import Modelica.Constants.pi;
          import Modelica.Constants.eps;
          import Complex;
          import Modelica.ComplexMath.arg;
          import Modelica.ComplexMath.real;
          import Modelica.ComplexMath.imag;
          import Modelica.ComplexMath.conj;
          import Modelica.Blocks.Interfaces.*;

          parameter Real N = 1 "Number of pair of Poles"
                                                        annotation (Dialog(group="Machine parameters"));
          parameter Modelica.Units.SI.Time H = 0.4 "Inertia constant"
                                                                     annotation (Dialog(group="Machine parameters"));

          Modelica.Units.SI.AngularVelocity nr;
          Modelica.Units.SI.AngularVelocity ns;
          OpenIPSL.Types.PerUnit s;
          Modelica.Units.SI.Torque T_b;
          Modelica.Units.SI.Torque T_bm;
          OpenIPSL.Types.PerUnit Tmech_pu_sys;
          OpenIPSL.Types.PerUnit Tmech_pu_motor;

          Modelica.Mechanics.Rotational.Sources.Speed speed(exact=true) annotation (Placement(
                transformation(
                extent={{-10,10},{10,-10}},
                rotation=180)));

        protected
          parameter Modelica.Units.SI.Inertia J_load = 2*H*M_b/((2*pi*fn/N)^2);
          parameter Modelica.Units.SI.AngularVelocity w_b=2*pi*fn/N "Base freq in rad/s";
          parameter Real CoB = M_b/S_b;
        equation

          //Rotor speed equation
          ns = w_b;
          nr = (1-s)*ns;

          //Conversion from SI torqur to p.u. torque
          Tmech_pu_sys = mech_torque/T_b;
          Tmech_pu_motor = Tmech_pu_sys/T_bm;

          //Torque System base
          T_b = S_b/w_b;

          //Torque Machine Base
          T_bm = M_b/w_b;

          connect(Rotor_Inertia.flange_b,flange)
            annotation (Line(points={{-60,0},{-100,0}}, color={0,0,0}));
          connect(speed.w_ref,Rotor_Speed. y)
            annotation (Line(points={{12,-1.9984e-15},{12,0},{49,0}},
                                                               color={0,0,127}));
          connect(speed.flange,Rotor_Inertia. flange_a) annotation (Line(points={{-10,7.21645e-16},
                  {-40,0}},              color={0,0,0}));
          connect(wr,Rotor_Speed. y) annotation (Line(points={{-110,-40},{40,-40},{40,0},
                  {49,0}}, color={0,0,127}));
          annotation (preferredView = "info",Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                  Rectangle(
                  extent={{-100,100},{100,-100}},
                  lineColor={0,0,0}),
                Text(
                  extent={{-100,-60},{100,-100}},
                  lineColor={28,108,200},
                  textString="%name"),             Text(
                  extent={{-50,50},{50,-50}},
                  lineColor={0,0,0},
                  textString="M"),                Ellipse(
                  fillColor={255,255,255},
                  extent={{-56,-56},{55.932,56}})}),                     Diagram(
                coordinateSystem(preserveAspectRatio=false)));
        end BaseMultiDomainSinglePhase;

      end BaseClasses;
      annotation (preferredView = "info", Icon(graphics={
            Rectangle(
              lineColor={200,200,200},
              fillColor={248,248,248},
              fillPattern=FillPattern.HorizontalCylinder,
              extent={{-100,-100},{100,100}},
              radius=25.0,
              lineThickness=0.5),
            Rectangle(
              extent={{-38,34},{-28,-22}},
              lineColor={238,46,47},
              lineThickness=1,
              fillColor={238,46,47},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-58,-22},{-10,-32}},
              lineColor={238,46,47},
              lineThickness=1,
              fillColor={238,46,47},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-38,34},{-56,24}},
              lineColor={238,46,47},
              lineThickness=1,
              fillColor={238,46,47},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{12,34},{64,-32}},
              lineColor={238,46,47},
              lineThickness=1,
              fillColor={238,46,47},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{22,24},{54,-22}},
              lineColor={238,46,47},
              lineThickness=1,
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{42,42},{24,-40},{34,-40},{52,42},{42,42}},
              lineColor={238,46,47},
              lineThickness=1,
              fillColor={238,46,47},
              fillPattern=FillPattern.Solid)}));
    end SinglePhase;

    package ThreePhase "Multidomain three-phase motor models"

      package PSSE "Three-phase induction motor models from PSSE software"

        model MD_CIM "Multi-Domain CIM5/6 three-phase induction motor model"
          extends BaseClasses.BaseMultiDomainThreePhase;
          import Modelica.Constants.eps;
          import OpenIPSL.NonElectrical.Functions.SE;

          parameter Integer Mtype = 1 "1- Motor Type A; 2- Motor Type B" annotation (Dialog(group=
                  "Motor Setup"), choices(choice=1, choice=2));
          parameter OpenIPSL.Types.PerUnit Ra=0 "Stator resistance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit Xa=0.0759 "Stator reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit Xm=3.1241 "Magnetizing reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit R1=0.0085 "1st cage rotor resistance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit X1=0.0759 "1st cage rotor reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit R2=0 "2nd cage rotor resistance. To model single cage motor set R2 = 0." annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit X2=0 "2nd cage rotor reactance. To model single cage motor set X2 = 0." annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit E1=1 "First Saturation Voltage Value"
                                                                                annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit SE1 = 0.06 "Saturation Factor at E1" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit E2=1.2 "Second Saturation Voltage Value"
                                                                                   annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit SE2 = 0.6 "Saturation Factor at E2" annotation (Dialog(group="Machine parameters"));
          parameter Modelica.Units.SI.Time H = 0.4 "Inertia constant";

          OpenIPSL.Types.PerUnit Te_motor;
          OpenIPSL.Types.PerUnit Te_sys;

          OpenIPSL.Types.PerUnit Epr;
          OpenIPSL.Types.PerUnit Epi;
          OpenIPSL.Types.PerUnit Eppr;
          OpenIPSL.Types.PerUnit Eppi;
          OpenIPSL.Types.PerUnit Epp;
          OpenIPSL.Types.PerUnit Ekr;
          OpenIPSL.Types.PerUnit Eki;
          OpenIPSL.Types.PerUnit NUM;
          OpenIPSL.Types.PerUnit EQC;
          OpenIPSL.Types.PerUnit EQ1;
          OpenIPSL.Types.PerUnit EQ2;
          OpenIPSL.Types.PerUnit EQ3;
          OpenIPSL.Types.PerUnit EQ4;
          OpenIPSL.Types.PerUnit EQ5;
          OpenIPSL.Types.PerUnit EQ6;
          OpenIPSL.Types.PerUnit EQ7;
          OpenIPSL.Types.PerUnit EQ8;
          OpenIPSL.Types.PerUnit EQ9;
          OpenIPSL.Types.PerUnit EQ10;
          OpenIPSL.Types.PerUnit EQ11;
          OpenIPSL.Types.PerUnit EQ12;
          OpenIPSL.Types.PerUnit EQ13;
          OpenIPSL.Types.PerUnit EQ14;
          OpenIPSL.Types.PerUnit EQ15;
          OpenIPSL.Types.PerUnit EQ16;
          OpenIPSL.Types.PerUnit EQ17;
          OpenIPSL.Types.PerUnit EQ18;
          OpenIPSL.Types.PerUnit EQ19;
          OpenIPSL.Types.PerUnit EQ20;
          OpenIPSL.Types.PerUnit EQ21;
          OpenIPSL.Types.PerUnit EQ22;
          OpenIPSL.Types.PerUnit EQ23;
          OpenIPSL.Types.PerUnit EQ24;
          OpenIPSL.Types.PerUnit Omegar "Rotor angular velocity";

          OpenIPSL.Types.PerUnit Ls;
          OpenIPSL.Types.PerUnit Ll;
          OpenIPSL.Types.PerUnit Lp;
          OpenIPSL.Types.PerUnit Lpp;

          OpenIPSL.Types.PerUnit Xa_c;
          OpenIPSL.Types.PerUnit Xm_c;
          OpenIPSL.Types.PerUnit X1_c;
          OpenIPSL.Types.PerUnit X2_c;

          OpenIPSL.Types.PerUnit constant1;
          OpenIPSL.Types.PerUnit constant2;
          OpenIPSL.Types.PerUnit constant3;
          OpenIPSL.Types.PerUnit constant4;
          OpenIPSL.Types.PerUnit constant5;

          Modelica.Units.SI.Time Tp0;
          Modelica.Units.SI.Time Tpp0;

        initial equation
          if Sup == false then
            der(Ekr) = 0;
            der(Eki) = 0;
            der(Epr) = 0;
            der(Epi) = 0;

          else
            s = (1 - Modelica.Constants.eps);

          end if;

        equation

          // Frequency dependent circuit impedances
          Xa_c = if (Ctrl == false) then Xa else (we_fix.y/w_b)*(Xa);
          Xm_c = if (Ctrl == false) then Xm else (we_fix.y/w_b)*(Xm);
          X1_c = if (Ctrl == false) then X1 else (we_fix.y/w_b)*(X1);
          X2_c = if (Ctrl == false) then X2 else (we_fix.y/w_b)*(X2);

          // Frequency dependent parameters and constants
          Ls = Xa_c + Xm_c;
          Ll = Xa_c;
          Lp = Xa_c + X1_c*Xm_c/(X1_c + Xm_c);
          Lpp = if (Mtype == 1 and R2 == 0 and X2 == 0) then Lp elseif (Mtype == 1) then Xa_c + X1_c*Xm_c*X2_c/(X1_c*X2_c + X1_c*Xm_c + X2_c*Xm_c) elseif (Mtype == 2 and R2 == 0 and X2 == 0) then Lp else Xa_c + (Xm_c*(X1_c+X2_c)/(X1_c + X2_c + Xm_c));
          Tp0 = if (Mtype == 1) then (X1_c + Xm_c)/(w_b*R1) elseif (Mtype == 2 and R2 == 0 and X2 == 0) then (X1_c + Xm_c)/(w_b*R1) else (X1_c + X2_c +Xm_c)/(w_b*R2);
          Tpp0 = if (Mtype == 1 and R2 == 0 and X2 == 0) then 1e-7 elseif (Mtype == 1) then (X2_c + (X1_c*Xm_c/(X1_c + Xm_c)))/(w_b*R2) elseif (Mtype == 2 and R2 == 0 and X2 == 0) then 1e-7 else (1/((1/(X1_c+Xm_c) + 1/X2_c)))/(w_b*R1);
          constant5 = Ls - Lp;
          constant3 = Lp - Ll;
          constant4 = (Lp - Lpp)/((Lp - Ll)^2);
          constant2 = (Lp - Lpp)/(Lp - Ll);
          constant1 = (Lpp - Ll)/(Lp - Ll);

          // Steady-State circuit set of algebraic-differential equations
          Eppr = EQ1 + EQ2;
          EQ1 = Epr*constant1;
          EQ2 = Ekr*constant2;
          EQ3 = Tpp0*der(Ekr);
          EQ3 = EQ4 + EQ5;
          EQ4 = (Tpp0*w_b*s)*Eki;
          EQ5 = Epr - Ekr - EQ6;
          EQ6 = Ii*constant3;
          EQ7 = EQ5*constant4;
          EQ8 = EQ7 + Ii;
          EQ9 = EQ8*constant5;
          EQ10 = Eppi*EQC;
          EQ11 = Epi*(Tp0*w_b*s);
          EQ12 = EQ10 + EQ11 - Epr - EQ9;
          EQ12 = Tp0*der(Epr);
          EQC = NUM/(Epp + eps);
          NUM = SE(Epp,SE1,SE2,1,1.2);
          Epp = sqrt(Eppr^2 + Eppi^2);
          EQ13 = EQC*Eppr;
          EQ14 = Epr*(Tp0*w_b*s);
          EQ22 = Ir - EQ21;
          EQ15 = EQ22*constant5;
          EQ16 = EQ15 - EQ14 - EQ13 - Epi;
          EQ16 = Tp0*der(Epi);
          EQ17 = Ir*constant3;
          EQ18 = EQ17 + Epi - Eki;
          EQ21 = EQ18*constant4;
          EQ19 = Ekr*(Tpp0*w_b*s);
          EQ20 = EQ18 - EQ19;
          EQ20 = Tpp0*der(Eki);
          EQ24 = Epi*constant1;
          EQ23 = Eki*constant2;
          Eppi = EQ23 + EQ24;

          //The link between voltages, currents and state variables is
          Vr = Eppr + Ra*Ir - Lpp*Ii;
          Vi = Eppi + Ra*Ii + Lpp*Ir;

          // Mechanical Equation
          s = (1 - Omegar);
          der(s) = (Tmech_pu_motor - Te_motor)/(2*H);

          //Electromagnetic torque equation in system and machine base
          Te_sys = Te_motor*CoB;
          Te_motor = Eppr*Ir + Eppi*Ii;

            annotation (preferredView = "info",Dialog(group="Machine parameters"));
        end MD_CIM;

        annotation(preferredView = "info", Icon(graphics={
              Rectangle(
                lineColor={200,200,200},
                fillColor={248,248,248},
                fillPattern=FillPattern.HorizontalCylinder,
                extent={{-100,-100},{100,100}},
                radius=25.0,
                lineThickness=0.5),
                                  Text(
                extent={{-100,100},{100,-100}},
                textColor={238,46,47},
                textStyle={TextStyle.Bold,TextStyle.Italic},
                textString="MD
PSSE")}));
      end PSSE;

      package PSAT "Three-phase induction motor models from PSAT software"

        model MD_MotorTypeI "Multidomain type I three-phase induction motor model"
          extends BaseClasses.BaseMultiDomainThreePhase;

          // Parameter Set
          parameter OpenIPSL.Types.PerUnit Xs=0.0759 "Stator reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit R1=0.0085 "1st cage rotor resistance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit X1=0.0759 "1st cage rotor reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit Xm=3.1241 "Magnetizing reactance" annotation (Dialog(group="Machine parameters"));

          // Variable Set
          OpenIPSL.Types.PerUnit Re;
          OpenIPSL.Types.PerUnit Xe;
          OpenIPSL.Types.PerUnit Xmag;
          OpenIPSL.Types.PerUnit Omegar "Rotor angular velocity";
          OpenIPSL.Types.PerUnit Pmotor;
          OpenIPSL.Types.PerUnit Te;
        equation

          //Real and Imaginary currents drawn by the motor in the motor base
          Ii = (-p.vr/Xmag) + (p.vi*Re - p.vr*Xe)/(Re*Re + Xe*Xe);
          Ir =   p.vi/Xmag  + (p.vr*Re + p.vi*Xe)/(Re*Re + Xe*Xe);

          //Rotor impedance
          Re = R1/max(s,Modelica.Constants.eps);
          Xe = (if Ctrl == false then Xs + X1 else (we_fix.y/w_b)*(Xs + X1));

          //Magnetization Impedance
          Xmag = (if Ctrl == false then Xm else (we_fix.y/w_b)*Xm);

          //Mechanical Swing Equation
          s = (1 - Omegar);
          der(s) = (Tmech_pu_motor - Pmotor)/(2*H);

          //Electromagnetic Torque
          Te = if Ctrl == true then P_motor/(we_fix.y/w_b) else P_motor;
          annotation(preferredView = "info");
        end MD_MotorTypeI;

        model MD_MotorTypeIII
          "Multidomain type III three-phase induction motor model"
          extends BaseClasses.BaseMultiDomainThreePhase(Rotor_Inertia(w(fixed=false)));

          parameter OpenIPSL.Types.PerUnit Rs=0 "Stator resistance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit Xs=0.0759 "Stator reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit R1=0.0085 "1st cage rotor resistance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit X1=0.0759 "1st cage rotor reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit Xm=3.1241 "Magnetizing reactance" annotation (Dialog(group="Machine parameters"));

          OpenIPSL.Types.PerUnit epr;
          OpenIPSL.Types.PerUnit epm;
          OpenIPSL.Types.PerUnit X0;
          OpenIPSL.Types.PerUnit Xp;
          OpenIPSL.Types.Time Tp0;

          OpenIPSL.Types.PerUnit Te_motor;
          OpenIPSL.Types.PerUnit Te_sys;

        initial equation
          if Sup == false then
            der(epm) = Modelica.Constants.eps;
            der(epr) = Modelica.Constants.eps;

          else
            epm = 0;

          end if;

        equation

          //Rotor impedance based on controllable model
          X0  = (if Ctrl == false then Xs + Xm else (we_fix.y/w_b)*(Xs + Xm));
          Xp  = (if Ctrl == false then Xs + X1*Xm/(X1 + Xm) else (we_fix.y/w_b)*(Xs + X1*Xm/(X1 + Xm)));
          Tp0 = (if Ctrl == false then (X1 + Xm)/(w_b*R1) else (we_fix.y/w_b)*((X1 + Xm)/(w_b*R1)));

          //The real and imaginary current relationship
          Vr = epr + Rs*Ir - Xp*Ii;
          Vi = epm + Rs*Ii + Xp*Ir;

          //Electromagnetic differential equations
          der(epr) =   w_b*s*epm  - (epr + (X0 - Xp)*Ii)/Tp0;
          der(epm) = (-w_b*s*epr) - (epm - (X0 - Xp)*Ir)/Tp0;

          //Mechanical Slip Equation
          der(s) = (Tmech_pu_motor - Te_motor)/(2*H);

          //Electromagnetic torque equation in system and machine base
          Te_sys = Te_motor*CoB;
          Te_motor = (if Ctrl == false then (epr*Ir + epm*Ii) else (epr*Ir + epm*Ii)/(we_fix.y/w_b));

          annotation(preferredView = "info");
        end MD_MotorTypeIII;

        model MD_MotorTypeV "Multidomain type V three-phase induction motor model"
          extends BaseClasses.BaseMultiDomainThreePhase;

          parameter OpenIPSL.Types.PerUnit Rs=0 "Stator resistance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit Xs=0.0759 "Stator reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit R1=0.0085 "1st cage rotor resistance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit X1=0.0759 "1st cage rotor reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit R2=0 "1st cage rotor resistance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit X2=0 "1st cage rotor reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit Xm=3.1241 "Magnetizing reactance" annotation (Dialog(group="Machine parameters"));

          //OpenIPSL.Types.PerUnit epr(start = epr0, fixed=false);
          //OpenIPSL.Types.PerUnit epm(start = epm0, fixed=false);
          //OpenIPSL.Types.PerUnit eppr(start = eppr0, fixed=false);
          //OpenIPSL.Types.PerUnit eppm(start = eppm0, fixed=false);
          OpenIPSL.Types.PerUnit epr;
          OpenIPSL.Types.PerUnit epm;
          OpenIPSL.Types.PerUnit eppr;
          OpenIPSL.Types.PerUnit eppm;
          OpenIPSL.Types.PerUnit X0;
          OpenIPSL.Types.PerUnit Xp;
          OpenIPSL.Types.PerUnit Xpp;
          OpenIPSL.Types.PerUnit Tp0;
          OpenIPSL.Types.PerUnit Tpp0;

          OpenIPSL.Types.PerUnit Te_motor;
          OpenIPSL.Types.PerUnit Te_sys;

        initial equation
          if Sup == false then
            s = Modelica.Constants.eps;

          else
            s = (1 - Modelica.Constants.eps);
            epm=0;
            epr=0;
            eppm=0;
            eppr=0;

          end if;

        equation

          //Rotor impedance based on controllable model
          X0   = (if (Ctrl == false) then Xs + Xm else (we_fix.y/w_b)*(Xs + Xm));
          Xp   = (if (Ctrl == false) then Xs + X1*Xm/(X1 + Xm) else (we_fix.y/w_b)*(Xs + X1*Xm/(X1 + Xm)));
          Xpp  = (if (Ctrl == false and R2 ==0 and X2 == 0) then Xp elseif (Ctrl == false) then (Xs + X1*X2*Xm/(X1*X2 + X1*Xm + X2*Xm)) elseif (Ctrl == true and R2 ==0 and X2 == 0) then Xp else (we_fix.y/w_b)*(Xs + X1*X2*Xm/(X1*X2 + X1*Xm + X2*Xm)));
          Tp0  = (if (Ctrl == false) then (X1 + Xm)/(w_b*R1) else (we_fix.y/w_b)*((X1 + Xm)/(w_sync*R1)));
          Tpp0 = (if (Ctrl == false and R2 ==0 and X2 == 0) then Modelica.Constants.inf elseif (Ctrl == false) then (X2 + X1*Xm/(X1+Xm))/(w_b*R2) elseif  (Ctrl == true and R2 ==0 and X2 == 0) then Modelica.Constants.inf else (we_fix.y/w_b)*(X2 + X1*Xm/(X1+Xm))/(w_sync*R2));

          //The link between voltages, currents and state variables is
          Vr = eppr + Rs*Ir - Xpp*Ii;
          Vi = eppm + Rs*Ii + Xpp*Ir;

          //Electromagnetic differential equations
          der(epr)  =   w_sync*s*epm  - (epr + (X0 - Xp)*Ii)/Tp0;
          der(epm)  = (-w_sync*s*epr) - (epm - (X0 - Xp)*Ir)/Tp0;
          der(eppr) = (-w_sync*s*(epm -eppm)) + der(epr) - (epr - eppm - (Xp - Xpp)*Ii)/Tpp0;
          der(eppm) =   w_sync*s*(epr - eppr) + der(epm) - (epm - eppr + (Xp - Xpp)*Ir)/Tpp0;

          //Mechanical Slip Equation
          der(s) = (Tmech_pu_motor - Te_motor)/(2*H);

          //Electromagnetic torque equation in system and machine base
          Te_sys = Te_motor*CoB;
          Te_motor = (if Ctrl == false then (eppr*Ir + eppm*Ii) else (eppr*Ir + eppm*Ii)/(we_fix.y/w_b));

          annotation(preferredView = "info");
        end MD_MotorTypeV;

        annotation(preferredView = "info", Icon(graphics={
              Rectangle(
                lineColor={200,200,200},
                fillColor={248,248,248},
                fillPattern=FillPattern.HorizontalCylinder,
                extent={{-100,-100},{100,100}},
                radius=25.0,
                lineThickness=0.5),
                                  Text(
                extent={{-100,100},{100,-100}},
                textColor={238,46,47},
                textStyle={TextStyle.Bold,TextStyle.Italic},
                textString="MD
PSAT")}));
      end PSAT;

      package BaseClasses "Multidomain partial models for three-phase motors"
        extends Modelica.Icons.BasesPackage;

        partial model BaseMultiDomainThreePhase "Three-phase motor partial model"

          parameter OpenIPSL.Types.ApparentPower M_b = 15e6 "Machine base power"
                                                                                annotation (Dialog(group="Power flow data"));
          extends OpenIPSL.Electrical.Essentials.pfComponent(
            final enabledisplayPF=false,
            final enablefn=false,
            final enableV_b=false,
            final enableangle_0=false,
            final enablev_0=false,
            final enableQ_0=false,
            final enableP_0=false,
            final enableS_b=false);

            import Modelica.Constants.pi;
            import OpenIPSL.NonElectrical.Functions.SE;
            import Modelica.Constants.eps;

          parameter Boolean Sup = true "True: Start-up process, False: Steady-state condition" annotation (Dialog(group="Motor Setup"));
          parameter Boolean Ctrl = true "True: Model for VSD control, False: Model not controllable"
                                                                                                    annotation (Dialog(group="Motor Setup"));
          parameter Real N = 1 "Number of pair of Poles"
                                                        annotation (Dialog(group="Machine parameters"));
          parameter Modelica.Units.SI.Time H = 0.4 "Inertia constant"
                                                                     annotation (Dialog(group="Machine parameters"));

          OpenIPSL.Types.PerUnit v "Bus voltage magnitude";
          OpenIPSL.Types.Angle anglev " Bus voltage angle";
          OpenIPSL.Types.Angle delta " Bus voltage angle";
          OpenIPSL.Types.PerUnit s;
          OpenIPSL.Types.PerUnit P;
          OpenIPSL.Types.PerUnit Q;
          Modelica.Units.SI.AngularVelocity nr;
          Modelica.Units.SI.AngularVelocity ns;
          Modelica.Units.SI.AngularVelocity w_sync;
          Modelica.Units.SI.Torque T_b;
          OpenIPSL.Types.PerUnit Tmech_pu_sys;
          OpenIPSL.Types.PerUnit Tmech_pu_motor;
          OpenIPSL.Types.PerUnit P_motor "OK";
          OpenIPSL.Types.PerUnit Q_motor "OK";
          OpenIPSL.Types.PerUnit Vr "OK";
          OpenIPSL.Types.PerUnit Vi "OK";
          OpenIPSL.Types.PerUnit Ir "OK";
          OpenIPSL.Types.PerUnit Ii "OK";
          OpenIPSL.Types.PerUnit Imag;

          Modelica.Blocks.Sources.RealExpression Rotor_Speed(y=nr)
            annotation (Placement(transformation(extent={{70,-10},{50,10}})));
          Modelica.Mechanics.Rotational.Components.Inertia Rotor_Inertia(J=J_load)
            annotation (Placement(transformation(extent={{-40,-10},{-60,10}})));
          Modelica.Blocks.Math.Gain we_fix(k=1)
            annotation (Placement(transformation(extent={{70,-90},{80,-80}})));
          Modelica.Blocks.Sources.Constant we_source_fix(k=0)
                                                         if not Ctrl
            annotation (Placement(transformation(extent={{32,-86},{44,-74}})));
          OpenIPSL.Interfaces.PwPin p(
            vr(start=vr0),
            vi(start=vi0),
            ir(start=ir0_sys),
            ii(start=ii0_sys))
            annotation (Placement(transformation(extent={{90,-10},{110,10}})));
          Modelica.Mechanics.Rotational.Interfaces.Flange_b flange annotation (
              Placement(transformation(extent={{-110,-10},{-90,10}}),
                iconTransformation(extent={{-110,-10},{-90,10}})));
          Modelica.Blocks.Interfaces.RealOutput wr
            "Absolute angular velocity of flange as output signal"
            annotation (Placement(transformation(extent={{-100,-50},{-120,-30}}),
                iconTransformation(
                extent={{20,-20},{-20,20}},
                rotation=90,
                origin={60,-120})));
          Modelica.Blocks.Interfaces.RealInput we if Ctrl annotation (Placement(
                transformation(
                extent={{-20,-20},{20,20}},
                rotation=90,
                origin={60,-120}), iconTransformation(
                extent={{-20,-20},{20,20}},
                rotation=90,
                origin={0,-120})));
          Modelica.Blocks.Interfaces.RealInput mech_torque annotation (Placement(
                transformation(
                extent={{-20,-20},{20,20}},
                rotation=90,
                origin={-60,-120}), iconTransformation(
                extent={{-20,-20},{20,20}},
                rotation=90,
                origin={-60,-120})));
        protected
          Modelica.Mechanics.Rotational.Sources.Speed speed(exact=true)
                                                            annotation (Placement(
                transformation(
                extent={{-10,10},{10,-10}},
                rotation=180)));

        protected
          parameter Modelica.Units.SI.Inertia J_load = 2*H*M_b/((2*pi*fn/N)^2);
          parameter OpenIPSL.Types.PerUnit p0 = P_0/M_b;
          parameter OpenIPSL.Types.PerUnit q0 = Q_0/M_b;
          parameter Modelica.Units.SI.AngularVelocity w_b=2*pi*fn/N "Base freq in rad/s";
          parameter OpenIPSL.Types.PerUnit vr0=v_0*cos(angle_0);
          parameter OpenIPSL.Types.PerUnit vi0=v_0*sin(angle_0);
          parameter OpenIPSL.Types.PerUnit ir0=(p0*vr0 + q0*vi0)/(vr0^2 + vi0^2);
          parameter OpenIPSL.Types.PerUnit ii0=(p0*vi0 - q0*vr0)/(vr0^2 + vi0^2);
          parameter OpenIPSL.Types.PerUnit ir0_sys = CoB*ir0 "Initial real current in system base";
          parameter OpenIPSL.Types.PerUnit ii0_sys = CoB*ii0 "Initial imaginary current in system base";
          parameter Real CoB = M_b/S_b;
          parameter Real s0 = 1 - eps;
          parameter Real w0 = if Sup == true then 100*eps else 2*Modelica.Constants.pi*SysData.fn;
          //parameter OpenIPSL.Types.PerUnit epm0 = 0;
          //parameter OpenIPSL.Types.PerUnit eppm0 = 0;
          //parameter OpenIPSL.Types.PerUnit eppr0 = 0;
          //parameter OpenIPSL.Types.PerUnit epr0 = 0;

        initial equation
          if Sup == false then
            der(s) = Modelica.Constants.eps;
        else
            s = 1 - Modelica.Constants.eps;
        end if;

        equation
          connect(Rotor_Inertia.flange_b,flange)
            annotation (Line(points={{-60,0},{-100,0}}, color={0,0,0}));
          connect(speed.w_ref,Rotor_Speed. y)
            annotation (Line(points={{12,0},{49,0}},           color={0,0,127}));
          connect(speed.flange,Rotor_Inertia. flange_a) annotation (Line(points={{-10,0},
                  {-40,0}},              color={0,0,0}));
          connect(wr,Rotor_Speed. y) annotation (Line(points={{-110,-40},{40,-40},{40,
                  0},{49,0}},
                           color={0,0,127}));
          connect(we,we_fix. u)
            annotation (Line(points={{60,-120},{60,-85},{69,-85}}, color={0,0,127}));
          connect(we_source_fix.y,we_fix. u)
            annotation (Line(points={{44.6,-80},{69,-80},{69,-85}}, color={0,0,127}));

          //Synchronous speed based on controllable boolean parameter
          w_sync = (if Ctrl == true then we_fix.y/N else w_b);

          // Network Interface Equations
          anglev = atan2(p.vi, p.vr) "OK";
          delta = anglev "OK";
          v = sqrt(p.vr^2 + p.vi^2) "OK";
          Vr = p.vr "OK";
          Vi = p.vi "OK";
          [Ir; Ii] = (1/CoB)*[p.ir; p.ii] "OK";
          Imag = sqrt(Ir^2 + Ii^2);

          // MISSING VOLTAGE EQUATIONS

          P = if Ctrl == true then (p.vr*p.ir + p.vi*p.ii)*(we_fix.y/w_b) else (p.vr*p.ir + p.vi*p.ii);
          Q = if Ctrl == true then ((-p.vr*p.ii) + p.vi*p.ir)*(we_fix.y/w_b) else (-p.vr*p.ii) + p.vi*p.ir;

          //Active and Reactive Power consumption in the machine base
          P_motor = P/CoB;
          Q_motor = Q/CoB;

          //Rotor speed equation
          ns = w_sync;
          nr = (1-s)*ns;

          //Conversion from SI torqur to p.u. torque
          Tmech_pu_sys = mech_torque/T_b;
          Tmech_pu_motor = Tmech_pu_sys/CoB;

          //Torque System base
          T_b = S_b/w_b;

          annotation (preferredView = "info",Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                  Rectangle(extent={{-100,100},{100,-100}}, lineColor={28,108,200}),
                                                  Ellipse(
                  fillColor={255,255,255},
                  extent={{-56,-58},{55.932,54}}), Text(
                  extent={{-50,48},{50,-52}},
                  lineColor={0,0,0},
                  textString="M"),Text(
                  origin={0,-80},
                  extent={{-100,-20},{100,20}},
                  fontName="Arial",
                  lineColor={0,0,0},
                  textString="%name"),
                Text(
                  extent={{-90,100},{-30,60}},
                  textColor={0,140,72},
                  textString="MD")}),    Diagram(coordinateSystem(preserveAspectRatio=false)));
        end BaseMultiDomainThreePhase;
      annotation(preferredView = "info");
      end BaseClasses;
      annotation (preferredView = "info", Icon(graphics={
            Rectangle(
              lineColor={200,200,200},
              fillColor={248,248,248},
              fillPattern=FillPattern.HorizontalCylinder,
              extent={{-100,-100},{100,100}},
              radius=25.0,
              lineThickness=0.5),
            Rectangle(
              extent={{12,34},{64,-32}},
              lineColor={238,46,47},
              lineThickness=1,
              fillColor={238,46,47},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-18,34},{-56,24}},
              lineColor={238,46,47},
              lineThickness=1,
              fillColor={238,46,47},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{22,24},{54,-22}},
              lineColor={238,46,47},
              lineThickness=1,
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{40,42},{24,-40},{34,-40},{50,42},{40,42}},
              lineColor={238,46,47},
              lineThickness=1,
              fillColor={238,46,47},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{19,5},{-19,-5}},
              lineColor={238,46,47},
              lineThickness=1,
              fillColor={238,46,47},
              fillPattern=FillPattern.Solid,
              origin={-23,15},
              rotation=90),
            Rectangle(
              extent={{-18,8},{-50,-2}},
              lineColor={238,46,47},
              lineThickness=1,
              fillColor={238,46,47},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{19,5},{-19,-5}},
              lineColor={238,46,47},
              lineThickness=1,
              fillColor={238,46,47},
              fillPattern=FillPattern.Solid,
              origin={-23,-13},
              rotation=90),
            Rectangle(
              extent={{-18,-22},{-56,-32}},
              lineColor={238,46,47},
              lineThickness=1,
              fillColor={238,46,47},
              fillPattern=FillPattern.Solid)}));
    end ThreePhase;
    annotation (preferredView = "info", Icon(graphics={
          Rectangle(
            lineColor={0,0,0},
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid,
            extent={{-100,-100},{100,100}},
            radius=25.0,
            lineThickness=0.5),
          Rectangle(
            extent={{-56,72},{-76,-48}},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={128,128,128}),
          Rectangle(
            extent={{-56,82},{24,62}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{64,22},{88,2}},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={95,95,95}),
          Polygon(
            points={{-66,-78},{-56,-78},{-26,-8},{24,-8},{54,-78},{64,-78},{64,
                -88},{-66,-88},{-66,-78}},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-56,72},{64,-48}},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={0,128,255}),
          Text(
            extent={{-52,46},{56,-22}},
            textColor={238,46,47},
            textStyle={TextStyle.Bold,TextStyle.Italic},
            textString="MD")}));
  end Motors;
  annotation (preferredView = "info", Icon(graphics={
        Rectangle(
          lineColor={200,200,200},
          fillColor={248,248,248},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-100,-100},{100,100}},
          radius=25.0,
          lineThickness=0.5), Text(
          extent={{-84,44},{84,-48}},
          textColor={238,46,47},
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="MD")}));
end MultiDomain;
