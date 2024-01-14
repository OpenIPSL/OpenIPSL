within OpenIPSL.Electrical.Machines;
package NonMultiDomain "Non multi-domain motor models"
  package Motors "Single phase and three phase non-multidomain motor models"

    package SinglePhase "Non multi-domain single and dual phase motor models"
      model NMD_SPIM "This model is the steady-state circuit model of the non multi-domain single phase induction motor model."

        extends
          OpenIPSL.Electrical.Machines.NonMultiDomain.Motors.SinglePhase.BaseClasses.BaseNonMultiDomainSinglePhase;

          //parameter Boolean Sup = true "True: Start-up process, False: Steady-state condition" annotation (Dialog(group="Motor Setup"));

          parameter OpenIPSL.Types.PerUnit R1 "Stator winding resistor" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit R2 "Rotor winding resistor" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit X1 "Stator winding reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit X2 "Rotor winding reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit Xm "Magnitization reactance value" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit H "Inertia coeficient" annotation (Dialog(group="Machine parameters"));
          parameter Real a annotation (Dialog(group="Machine parameters"));
          parameter Real b annotation (Dialog(group="Machine parameters"));
          parameter Real c annotation (Dialog(group="Machine parameters"));

          OpenIPSL.Types.PerUnit RF "Equivalent resistor component of the forward circuit";
          OpenIPSL.Types.PerUnit XF "Equivalent resistor component of the forward circuit";
          OpenIPSL.Types.PerUnit RB "Equivalent resistor component of the backward circuit";
          OpenIPSL.Types.PerUnit XB "Equivalent resistor component of the backward circuit";
          OpenIPSL.Types.PerUnit s(start = s0)  "Induction motor slip";

          OpenIPSL.Types.PerUnit I "Magnitude of the consumed current";
          OpenIPSL.Types.PerUnit Ir "Real component of the consumed current in Machine Base";
          OpenIPSL.Types.PerUnit Ii "Imaginary component of the consumed current in Machine Base";
          OpenIPSL.Types.PerUnit P_AGF "Air Gap Power for forward magnetic field";
          OpenIPSL.Types.PerUnit P_AGB "Air Gap Power for reverse field";
          OpenIPSL.Types.PerUnit P( start = P_0/S_b) "Net air gap power in single-phase induction motor";
          //OpenIPSL.Types.PerUnit Q "Reactive Power consumed by the single phase induction motor model";
          OpenIPSL.Types.PerUnit Te "Electrical Torque";
          OpenIPSL.Types.PerUnit Tm "Mechanical Torque of the Load";
          OpenIPSL.Types.PerUnit Pc;
          OpenIPSL.Types.PerUnit Qc;

      protected
        parameter Real A = a + b + c;
        parameter Real B = -b - 2*c;
        parameter Real C = c;
        parameter OpenIPSL.Types.PerUnit vr0=v_0*cos(angle_0);
        parameter OpenIPSL.Types.PerUnit vi0=v_0*sin(angle_0);
        parameter OpenIPSL.Types.PerUnit ir0=(P_0/S_b*vr0 + Q_0/S_b*vi0)/(vr0^2 + vi0^2);
        parameter OpenIPSL.Types.PerUnit ii0=(P_0/S_b*vi0 - Q_0/S_b*vr0)/(vr0^2 + vi0^2);
        OpenIPSL.Types.PerUnit sm  "Induction motor slip for calculation when dividing by s";
        parameter Real CoB = M_b/S_b;
        parameter OpenIPSL.Types.PerUnit s0 = (2*ii0*R2^2*Xm)/(2*ir0*R2*Xm^2 - 2*ii0*R2^2*Xm);

      initial equation
        der(s) = 0;

      equation

        //Network Interface Equations
        [Ir; Ii] = (1/CoB)*[p.ir; p.ii];
        I = sqrt(Ir^2 + Ii^2);

        //Active and Reactive Power Consumption in the system base
        Pc = p.vr*p.ir + p.vi*p.ii;
        Qc = (-p.vr*p.ii) + p.vi*p.ir;

        //Slip for calculations
        sm = s + Modelica.Constants.eps;

        RF = (-X2*Xm*R2/sm + R2*Xm*(X2 + Xm)/sm)/((R2/sm)^2 + (X2 + Xm)^2);
        XF = ((R2/sm)^2*Xm + X2*Xm*(X2 + Xm))/((R2/sm)^2 + (X2 + Xm)^2);
        RB = (-X2*Xm*R2/(2-sm) + R2*Xm*(X2 + Xm)/(2-sm))/((R2/(2-sm))^2 + (X2 + Xm)^2);
        XB = ((R2/(2-sm))^2*Xm + X2*Xm*(X2 + Xm))/((R2/(2-sm))^2 + (X2 + Xm)^2);

        Ir = p.vr*(0.5*RF + 0.5*RB + R1)/((0.5*RF + 0.5*RB + R1)^2 + (0.5*XF + 0.5*XB + X1)^2) + p.vi*(0.5*XF + 0.5*XB + X1)/((0.5*RF + 0.5*RB + R1)^2 + (0.5*XF + 0.5*XB + X1)^2);
        Ii = p.vi*(0.5*RF + 0.5*RB + R1)/((0.5*RF + 0.5*RB + R1)^2 + (0.5*XF + 0.5*XB + X1)^2) - p.vr*(0.5*XF + 0.5*XB + X1)/((0.5*RF + 0.5*RB + R1)^2 + (0.5*XF + 0.5*XB + X1)^2);

        P_AGF = I^2*0.5*RF;
        P_AGB = I^2*0.5*RB;
        P     = P_AGF - P_AGB;

        Te = P;
        Tm = A + B*s + C*s^2;
        der(s) = (Tm - Te)/(2*H);
        annotation (preferredView = "info",Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end NMD_SPIM;

      model NMD_DPIM "This model is the steady-state circuit model of the multi-domain single phase induction motor model initialized by either a split-phase auxiliary circuit or a capacitor-start auxiliary circuit."

      extends
          OpenIPSL.Electrical.Machines.NonMultiDomain.Motors.SinglePhase.BaseClasses.BaseNonMultiDomainSinglePhase;

        parameter Integer init "Initialization Method: (1) Split-Phase Motor, (2) Capacitor-Start Motor" annotation (choices(choice=1, choice=2));
        parameter Real switch_open_speed = 0.2 "Auxiliary winding cut-off speed";
        parameter Real poles = 2 "Number of poles";
        parameter Modelica.Units.SI.Inductance Lmainr
          "Mutual-inductance of the main winding";
        parameter Modelica.Units.SI.Inductance Lmain
          "Self-inductance of the magnetizing branch";
        parameter Modelica.Units.SI.Inductance Lauxr
          "Mutual-inductance of the auxiliary winding";
        parameter Modelica.Units.SI.Inductance Laux
          "Self-inductance of the auxiliary winding";
        parameter Modelica.Units.SI.Inductance Lr
          "Self-inductance of the equivalent rotor windings";
        parameter Modelica.Units.SI.Resistance Rmain
          "Resistance of the main winding";
        parameter Modelica.Units.SI.Resistance Rr
          "Resistance of the rotor winding";
        parameter Modelica.Units.SI.Resistance Raux
          "Resistance of the auxiliary winding";
        parameter Modelica.Units.SI.Capacitance Cc
          "Capacitance of the capacitor-start configuration"
          annotation (Dialog(enable=(init == 2)));
          parameter OpenIPSL.Types.PerUnit H "Inertia Constant";
          parameter Real a "Load Torque Coefficient a";
          parameter Real b "Load Torque Coefficient b";
          parameter Real c "Load Torque Coefficient c";

          OpenIPSL.Types.PerUnit Pc;
          OpenIPSL.Types.PerUnit Qc;
          OpenIPSL.Types.PerUnit s(start = s0);
          OpenIPSL.Types.PerUnit Te1 "First Component of the Electrical Torque";
          OpenIPSL.Types.PerUnit Te2 "Second Component of the Electrical Torque";
          OpenIPSL.Types.PerUnit Te "Total Electrical Torque";
          OpenIPSL.Types.PerUnit Tm "Mechanical Torque of the Load";
        Modelica.Units.SI.Power P;

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
        parameter Modelica.Units.SI.AngularVelocity we=2*Modelica.Constants.pi*fn;
        parameter Real A = a + b + c;
        parameter Real B = -b - 2*c;
        parameter Real C = c;
        parameter OpenIPSL.Types.PerUnit s0 = 0.999;
        Modelica.Units.SI.Impedance Zb=V_b^2/S_b;
        Modelica.Units.SI.Current I_b=S_b/V_b;
        Modelica.Units.SI.Torque Tb=S_b/we;

      equation

        // Calculation of the coeficients of the two-phase motor

        KplusK_real = Rr*we*(Rr^2 - Lr^2*(s-2)*s*we^2)/(((Lr^2*(s-2)^2*we^2) + Rr^2)*((Lr*s*we)^2 + Rr^2));
        KplusK_imag = -Lr*we^2*((Lr*(s-2)*s*we)^2 + Rr^2*(s^2-2*s+2))/(((Lr*(s-2)*we)^2 + Rr^2)*((Lr*s*we)^2 + Rr^2));
        KminusK_real = Rr*(s-1)*we*(Lr^2*(s-2)*s*we^2 + Rr^2)/(((Lr*(s-2)*we)^2 + Rr^2)*((Lr*s*we)^2 + Rr^2));
        KminusK_imag = -2*Lr*Rr^2*(s-1)*we^2/(((Lr*(s-2)*we)^2 + Rr^2)*((Lr*s*we)^2 + Rr^2));

        K1_real = Rmain + we*Lmainr^2*KplusK_real;
        K1_imag = we*Lmain + we*Lmainr^2*KplusK_imag;

        K2_real = -we*Lmainr*Lauxr*KminusK_imag;
        K2_imag = we*Lmainr*Lauxr*KminusK_real;

        K3_real = Raux + we*Lauxr^2*KplusK_real;
        K3_imag = if init == 1 then we*Laux + we*Lauxr^2*KplusK_imag else we*Laux + we*Lauxr^2*KplusK_imag - 1/(we*Cc);

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
        Vmain_aux_real = if s > switch_open_speed then p.vr*V_b else 0;
        Vmain_aux_imag = if s > switch_open_speed then p.vi*V_b else 0;
        Vaux_real = if s > switch_open_speed then p.vr*V_b else 0;
        Vaux_imag = if s > switch_open_speed then p.vi*V_b else 0;

        Iaux_real = Cond1_aux_real*Vaux_real - Cond1_aux_imag*Vaux_imag + Cond2_aux_real*Vaux_real - Cond2_aux_imag*Vaux_imag;
        Iaux_imag = (Cond1_aux_real*Vaux_imag + Cond1_aux_imag*Vaux_real + Cond2_aux_real*Vaux_imag + Cond2_aux_imag*Vaux_real);
        Imain_real = Cond1_main_real*Vmain_real - Cond1_main_imag*Vmain_imag - Constant1*Iaux_real + Constant2*Iaux_imag;
        Imain_imag = -(Cond1_main_imag*Vmain_real + Cond1_main_real*Vmain_imag - Constant2*Iaux_real - Constant1*Iaux_imag);
        Itotal = sqrt((Imain_real + Iaux_real)^2 + (Imain_imag + Iaux_imag)^2);
        Itotal_real = Imain_real + Iaux_real;
        Itotal_imag = (Imain_imag + Iaux_imag);
        p.ir = Itotal_real/I_b;
        p.ii = Itotal_imag/I_b;

        Pc = p.vr*p.ir + p.vi*p.ii;
        Qc = (-p.vr*p.ii) + p.vi*p.ir;
        P = Pc*S_b;

        Te1 = ((Lmainr^2*(Imain_real^2 + Imain_imag^2) + Lauxr^2*(Iaux_real^2 + Iaux_imag^2))*KminusK_real)/Tb;
        Te2 = (2*Lmainr*Lauxr*KplusK_real*(Imain_real*Iaux_imag - Imain_imag*Iaux_real))/Tb;
        Te = (poles/2)*(Te1 + Te2);
        Tm = A + B*s + C*s^2;

        der(s) = (Tm - Pc)/(2*H);
        annotation (preferredView = "info",Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)));
      end NMD_DPIM;

      package BaseClasses "Non multidomain single-phase induction motor base class package"
        extends Modelica.Icons.BasesPackage;
        partial model BaseNonMultiDomainSinglePhase "Base class model for the single-phase and dual-phase non multi-domain induction motor models."

          parameter OpenIPSL.Types.ApparentPower M_b = SysData.S_b "Machine base power"
                                                                                       annotation (Dialog(group="Power flow data"));
          extends OpenIPSL.Electrical.Essentials.pfComponent(
            final enabledisplayPF=false,
            final enablefn=false,
            final enableV_b=false,
            final enableangle_0=true,
            final enablev_0=true,
            final enableQ_0=true,
            final enableP_0=true,
            final enableS_b=true);

          OpenIPSL.Interfaces.PwPin p
            annotation (Placement(transformation(extent={{90,-10},{110,10}})));
          annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                Text(
                  extent={{-100,-60},{100,-100}},
                  lineColor={28,108,200},
                  textString="%name"),             Text(
                  extent={{-50,50},{50,-50}},
                  lineColor={0,0,0},
                  textString="M"),                Ellipse(
                  fillColor={255,255,255},
                  extent={{-56,-56},{55.932,56}}),
                  Rectangle(
                  extent={{-100,100},{100,-100}},
                  lineColor={0,0,0})}), Diagram(coordinateSystem(preserveAspectRatio=false)));
        end BaseNonMultiDomainSinglePhase;
        annotation(preferredView = "info");
      end BaseClasses;
      annotation (preferredView = "info",Icon(graphics={
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
            Rectangle(
              extent={{-38,34},{-56,24}},
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
            Polygon(
              points={{42,42},{24,-40},{34,-40},{52,42},{42,42}},
              lineColor={238,46,47},
              lineThickness=1,
              fillColor={238,46,47},
              fillPattern=FillPattern.Solid)}));
    end SinglePhase;

    package ThreePhase "Non multi-domain three-phase motor models"
      package PSSE "PSSE-Based non multi-domain three-phase induction motor models"
        model NMD_CIM5 "Non Multi-Domain PSSE CIM5 Three-Phase Induction Motor Model."
          extends BaseClasses.BaseNonMultiDomainThreePhase;
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
          parameter Modelica.Units.SI.Time H = 0.4 "Inertia constant" annotation (Dialog(group="Machine parameters"));
          parameter Real T_nom = 1 "Load torque at 1 pu speed" annotation (Dialog(group="Machine parameters"));
          parameter Real D = 1 "Load Damping Factor" annotation (Dialog(group="Machine parameters"));

          OpenIPSL.Types.PerUnit Te_motor;
          OpenIPSL.Types.PerUnit Te_sys;
          OpenIPSL.Types.PerUnit TL;

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
            der(s) = 0;
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
          der(s) = (TL - Te_motor)/(2*H);

          //Electromagnetic torque equation in system and machine base
          Te_sys = Te_motor*CoB;
          Te_motor = Eppr*Ir + Eppi*Ii;

          //Mechanical Torque Equation
          TL = T_nom*(1 - s)^D;

            annotation (preferredView = "info",Dialog(group="Machine parameters"));
        end NMD_CIM5;

        model NMD_CIM6 "Non Multi-Domain PSSE CIM6 Three-Phase Induction Motor Model."
          extends BaseClasses.BaseNonMultiDomainThreePhase;
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
          parameter Modelica.Units.SI.Time H = 0.4 "Inertia constant" annotation (Dialog(group="Machine parameters"));
          parameter Real T_nom = 1 "Load torque at 1 pu speed" annotation (Dialog(group="Machine parameters"));

          parameter Real A = 1 "Load Torque Coefficient D" annotation (Dialog(group="Machine parameters"));
          parameter Real B = 1 "Load Torque Coefficient D" annotation (Dialog(group="Machine parameters"));
          parameter Real D = 1 "Load Torque Coefficient D" annotation (Dialog(group="Machine parameters"));
          parameter Real E = 1 "Load Torque Coefficient D" annotation (Dialog(group="Machine parameters"));
          parameter Real C0 = 1 "Load Torque Coefficient D" annotation (Dialog(group="Machine parameters"));

          OpenIPSL.Types.PerUnit Te_motor;
          OpenIPSL.Types.PerUnit Te_sys;
          OpenIPSL.Types.PerUnit TL;

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
            der(s) = 0;
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
          der(s) = (TL - Te_motor)/(2*H);

          //Electromagnetic torque equation in system and machine base
          Te_sys = Te_motor*CoB;
          Te_motor = Eppr*Ir + Eppi*Ii;

          //Mechanical Torque Equation
          TL = T_nom*(A*Omegar^2 + B*Omegar + C0 + D*Omegar^E);

            annotation (preferredView = "info",Dialog(group="Machine parameters"));
        end NMD_CIM6;
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
                textString="NMD
PSSE")}));
      end PSSE;

      package PSAT "PSAT-Based non multi-domain three-phase induction motor models"
        model NMD_MotorTypeI "Non Multi-Domain Type I Three-Phase Induction Motor Model."
          extends
            OpenIPSL.Electrical.Machines.NonMultiDomain.Motors.ThreePhase.BaseClasses.BaseNonMultiDomainThreePhase;

          // Parameter Set
          parameter OpenIPSL.Types.PerUnit Xs=0.0759 "Stator reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit R1=0.0085 "1st cage rotor resistance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit X1=0.0759 "1st cage rotor reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit Xm=3.1241 "Magnetizing reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit a = 1 "1st coefficient of load torque" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit b = 1 "2nd coefficient of load torque" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit c = 1 "3rd coefficient of load torque" annotation (Dialog(group="Machine parameters"));

          // Variable Set
          OpenIPSL.Types.PerUnit Re;
          OpenIPSL.Types.PerUnit Xe;
          OpenIPSL.Types.PerUnit Xmag;
          OpenIPSL.Types.PerUnit Omegar "Rotor angular velocity";
          OpenIPSL.Types.PerUnit TL;
          OpenIPSL.Types.PerUnit Te;
          Real alpha;
          Real beta;
          Real gamma;

        protected
          parameter Real S0 = R1/w_b;
          parameter Real W0 = -s0*w_b + w_b;
          parameter Real s0 = if Sup == true then (1 - Modelica.Constants.eps) else S0;
          parameter Real w_start = if Sup == true then Modelica.Constants.eps else W0;

        initial equation
          if Sup == false then
            der(s) = Modelica.Constants.eps;
          else
            s = 1 - Modelica.Constants.eps;
          end if;

        equation

          //Real and Imaginary currents drawn by the motor in the motor base
          Ii = (-p.vr/Xmag) + (p.vi*Re - p.vr*Xe)/(Re*Re + Xe*Xe);
          Ir =   p.vi/Xmag  + (p.vr*Re + p.vi*Xe)/(Re*Re + Xe*Xe);

          //Rotor impedance
          Re = R1/s;
          Xe = (if Ctrl == false then Xs + X1 else (we_fix.y/w_b)*(Xs + X1));

          //Magnetization Impedance
          Xmag = (if Ctrl == false then Xm else (we_fix.y/w_b)*Xm);

          //Mechanical Swing Equation
          s = (1 - Omegar);
          der(s) = (TL - Te)/(2*H);

          //Load Torque Coefficient Equations
          alpha = a + b + c;
          beta = -b - 2*c;
          gamma = c;

          //Mechanical Torque Equation
          TL = alpha + beta*s + gamma*s^2;

          //Electromagnetic Torque
          Te = if Ctrl == true then P_motor/(we_fix.y/w_b) else P_motor;

          annotation(preferredView = "info");
        end NMD_MotorTypeI;

        model NMD_MotorTypeIII "Non Multi-Domain Type III Three-Phase Induction Motor Model."
          extends
            OpenIPSL.Electrical.Machines.NonMultiDomain.Motors.ThreePhase.BaseClasses.BaseNonMultiDomainThreePhase;

          // Parameter Set
          parameter OpenIPSL.Types.PerUnit Rs=0 "Stator resistance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit Xs=0.0759 "Stator reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit R1=0.0085 "1st cage rotor resistance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit X1=0.0759 "1st cage rotor reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit Xm=3.1241 "Magnetizing reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit a = 1 "1st coefficient of load torque" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit b = 1 "2nd coefficient of load torque" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit c = 1 "3rd coefficient of load torque" annotation (Dialog(group="Machine parameters"));

          // Variable Set
          OpenIPSL.Types.PerUnit epr;
          OpenIPSL.Types.PerUnit epm;
          OpenIPSL.Types.PerUnit X0;
          OpenIPSL.Types.PerUnit Xp;
          OpenIPSL.Types.Time Tp0;
          OpenIPSL.Types.PerUnit Te_motor;
          OpenIPSL.Types.PerUnit Te_sys;
          OpenIPSL.Types.PerUnit TL;
          Real alpha;
          Real beta;
          Real gamma;

        protected
          parameter Real S0 = R1/w_b;
          parameter Real W0 = -s0*w_b + w_b;
          parameter Real s0 = if Sup == true then (1 - Modelica.Constants.eps) else S0;
          parameter Real w_start = if Sup == true then Modelica.Constants.eps else W0;

        initial equation
          if Sup == false then
            der(s) = Modelica.Constants.eps;
            der(epm) = Modelica.Constants.eps;
            der(epr) = Modelica.Constants.eps;

          else
            s = 1 - Modelica.Constants.eps;
            der(epm) = 0;

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
          der(s) = (TL - Te_motor)/(2*H);

          //Electromagnetic torque equation in system and machine base
          Te_sys = Te_motor*CoB;
          Te_motor = epr*Ir + epm*Ii;

          //Load Torque Coefficient Equations
          alpha = a + b + c;
          beta = -b - 2*c;
          gamma = c;

          //Mechanical Torque Equation
          TL = alpha + beta*s + gamma*s^2;

          annotation(preferredView = "info");
        end NMD_MotorTypeIII;

        model NMD_MotorTypeV "Non Multi-Domain Type V Three-Phase Induction Motor Model."
          extends
            OpenIPSL.Electrical.Machines.NonMultiDomain.Motors.ThreePhase.BaseClasses.BaseNonMultiDomainThreePhase;

          // Parameter Set
          parameter OpenIPSL.Types.PerUnit Rs=0 "Stator resistance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit Xs=0.0759 "Stator reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit R1=0.0085 "1st cage rotor resistance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit X1=0.0759 "1st cage rotor reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit R2=0 "1st cage rotor resistance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit X2=0 "1st cage rotor reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit Xm=3.1241 "Magnetizing reactance" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit a = 1 "1st coefficient of load torque" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit b = 1 "2nd coefficient of load torque" annotation (Dialog(group="Machine parameters"));
          parameter OpenIPSL.Types.PerUnit c = 1 "3rd coefficient of load torque" annotation (Dialog(group="Machine parameters"));

          // Variable Set
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
          OpenIPSL.Types.PerUnit TL;
          Real alpha;
          Real beta;
          Real gamma;

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
          Tp0  = (if (Ctrl == false) then (X1 + Xm)/(w_b*R1) else (we_fix.y/w_b)*((X1 + Xm)/(w_b*R1)));
          Tpp0 = (if (Ctrl == false and R2 ==0 and X2 == 0) then Modelica.Constants.inf elseif (Ctrl == false) then (X2 + X1*Xm/(X1+Xm))/(w_b*R2) elseif  (Ctrl == true and R2 ==0 and X2 == 0) then Modelica.Constants.inf else (we_fix.y/w_b)*(X2 + X1*Xm/(X1+Xm))/(w_b*R2));

          //The link between voltages, currents and state variables is
          Vr = eppr + Rs*Ir - Xpp*Ii;
          Vi = eppm + Rs*Ii + Xpp*Ir;

          //Electromagnetic differential equations
          der(epr)  =   w_b*s*epm  - (epr + (X0 - Xp)*Ii)/Tp0;
          der(epm)  = (-w_b*s*epr) - (epm - (X0 - Xp)*Ir)/Tp0;
          der(eppr) = (-w_b*s*(epm -eppm)) + der(epr) - (epr - eppm - (Xp - Xpp)*Ii)/Tpp0;
          der(eppm) =   w_b*s*(epr - eppr) + der(epm) - (epm - eppr + (Xp - Xpp)*Ir)/Tpp0;

          //Mechanical Slip Equation
          der(s) = (TL - Te_motor)/(2*H);

          //Electromagnetic torque equation in system and machine base
          Te_sys = Te_motor*CoB;
          Te_motor = eppr*Ir + eppm*Ii;

          //Load Torque Coefficient Equations
          alpha = a + b + c;
          beta = -b - 2*c;
          gamma = c;

          //Mechanical Torque Equation
          TL = alpha + beta*s + gamma*s^2;

          annotation(preferredView = "info");
        end NMD_MotorTypeV;
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
                textString="NMD
PSAT")}));
      end PSAT;

      package BaseClasses "Non multidomain three-phase induction motor base class package"
        extends Modelica.Icons.BasesPackage;

        partial model BaseNonMultiDomainThreePhase "Base class model for the non multi-domain three-phase induction motor models."

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
            final enableS_b=true);

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
          OpenIPSL.Types.PerUnit P_motor "OK";
          OpenIPSL.Types.PerUnit Q_motor "OK";
          OpenIPSL.Types.PerUnit Vr "OK";
          OpenIPSL.Types.PerUnit Vi "OK";
          OpenIPSL.Types.PerUnit Ir "OK";
          OpenIPSL.Types.PerUnit Ii "OK";
          OpenIPSL.Types.PerUnit Imag;

          Modelica.Blocks.Sources.RealExpression Rotor_Speed(y=nr)
            annotation (Placement(transformation(extent={{-60,-10},{-80,10}})));
          Modelica.Blocks.Math.Gain we_fix(k=1)
            annotation (Placement(transformation(extent={{80,-88},{90,-78}})));
          Modelica.Blocks.Sources.Constant we_source_fix(k=0)
                                                         if not Ctrl
            annotation (Placement(transformation(extent={{32,-86},{44,-74}})));
          OpenIPSL.Interfaces.PwPin p(
            vr(start=vr0),
            vi(start=vi0),
            ir(start=ir0_sys),
            ii(start=ii0_sys))
            annotation (Placement(transformation(extent={{90,-10},{110,10}})));
          Modelica.Blocks.Interfaces.RealOutput wr
            "Absolute angular velocity of flange as output signal"
            annotation (Placement(transformation(extent={{-100,-10},{-120,10}}),
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
                origin={-60,-120})));

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
        equation
          connect(wr,Rotor_Speed. y) annotation (Line(points={{-110,0},{-81,0}},
                           color={0,0,127}));
          connect(we,we_fix. u)
            annotation (Line(points={{60,-120},{60,-83},{79,-83}}, color={0,0,127}));
          connect(we_source_fix.y,we_fix. u)
            annotation (Line(points={{44.6,-80},{70,-80},{70,-83},{79,-83}},
                                                                    color={0,0,127}));

          //Synchronous speed based on controllable boolean parameter
          w_sync = (if Ctrl == true then we_fix.y else w_b);

          //Network Interface Equations
          [Vr; Vi] = [p.vr; p.vi];
          [Ir; Ii] = (1/CoB)*[p.ir; p.ii];
          Imag = sqrt(Ir^2 + Ii^2);
          v = sqrt(p.vr^2 + p.vi^2);
          anglev = atan2(p.vi, p.vr);
          delta = anglev;

          //Active and Reactive Power Consumption in the system base
          P = if Ctrl == true then (p.vr*p.ir + p.vi*p.ii)*(we_fix.y/w_b) else (p.vr*p.ir + p.vi*p.ii);
          Q = if Ctrl == true then ((-p.vr*p.ii) + p.vi*p.ir)*(we_fix.y/w_b) else ((-p.vr*p.ii) + p.vi*p.ir);

          //Active and Reactive Power Consumption in the machine base
          P_motor = P/CoB;
          Q_motor = Q/CoB;

          //Rotor speed equation
          ns = w_sync/N;
          nr = (1-s)*ns;

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
                  textColor={238,46,47},
                  textString="NMD")}),   Diagram(coordinateSystem(preserveAspectRatio=false)));
        end BaseNonMultiDomainThreePhase;
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
              extent={{-18,34},{-56,24}},
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
            textColor={102,44,145},
            textStyle={TextStyle.Bold,TextStyle.Italic},
            textString="NMD")}));
  end Motors;
  annotation (preferredView="info", Icon(graphics={
        Rectangle(
          lineColor={200,200,200},
          fillColor={248,248,248},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-100,-100},{100,100}},
          radius=25.0,
          lineThickness=5), Text(
          extent={{-84,44},{84,-48}},
          textColor={238,46,47},
          textStyle={TextStyle.Bold,TextStyle.Italic},
          textString="NMD")}));
end NonMultiDomain;
