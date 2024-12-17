within OpenIPSL.Examples.Microgrids.UniversityCampus.CampusB.GeneratorGroups;
package DynParamRecords "Sets of generator parameters"
  extends Modelica.Icons.RecordsPackage;

  record GUDynamicsTemplate
    "Template Record for Generation Unit Dynamic Parameters"
    extends Modelica.Icons.Record;
    annotation (Documentation(info="<html>
<p>Template Record for Generation Unit Dynamic Parameters.</p>
</html>"));
  end GUDynamicsTemplate;

  record GUDynamics "Instantiable Record for Generation Unit Dynamic Parameters"
    extends Modelica.Icons.Record;

    replaceable record GUnitDynamics = GUDynamicsTemplate
      constrainedby GUDynamicsTemplate
    annotation(choicesAllMatching);

    GUnitDynamics guDynamics;

    annotation (Documentation(info="<html>
<p>Instantiable Record for Generation Unit Dynamic Parameters</p>
</html>"));
  end GUDynamics;

  package MachineData "Records with Synchronous Machine Dynamic Parameters"

    partial record MachineDataTemplate "Synchronous Machine Dynamic Data Record Template"
      parameter Types.ApparentPower M_b "Machine base power";
      parameter Types.Time Tpd0 "d-axis transient open-circuit time constant";
      parameter Types.Time Tppd0 "d-axis sub-transient open-circuit time constant";
      parameter Types.Time Tppq0 "q-axis sub-transient open-circuit time constant";
      parameter Types.Time H "Inertia constant";
      parameter Real D "Speed damping";
      parameter Types.PerUnit Xd "d-axis reactance";
      parameter Types.PerUnit Xq "q-axis reactance";
      parameter Types.PerUnit Xpd "d-axis transient reactance";
      parameter Types.PerUnit Xppd "d-axis sub-transient reactance";
      parameter Types.PerUnit Xppq "q-axis sub-transient reactance";
      parameter Types.PerUnit Xl "leakage reactance";
      parameter Types.PerUnit S10 "Saturation factor at 1.0 pu";
      parameter Types.PerUnit S12 "Saturation factor at 1.2 pu";
      parameter Types.PerUnit R_a "Armature resistance";
      parameter Types.PerUnit Xpq "q-axis transient reactance (pu)";
      parameter Types.Time Tpq0 "q-axis transient open-circuit time constant (s)";
      parameter Types.PerUnit Xpp "Sub-transient reactance (pu)";

    end MachineDataTemplate;

    record MachineParsGT "Machine Parameters for GT"
      extends MachineDataTemplate(
        M_b=16667000,
        Tpd0=4.822,
        Tppd0=0.023,
        Tppq0=0.065,
        H=8.75,
        D=2,
        Xd=1.897,
        Xq=1.78,
        Xpd=0.23,
        Xppd=0.156,
        Xppq=0.156,
        Xl=0.123,
        S10=0.12,
        S12=0.4,
        R_a=0.01,
        Xpq=0.4610,
        Tpq0=0.391,
        Xpp=Xppd);

    end MachineParsGT;

    record MachineParsST "Machine Parameters for ST"
      extends MachineDataTemplate(
        M_b=4475000,
        Tpd0=7,
        Tppd0=0.03,
        Tppq0=0.05,
        H=3,
        D=0,
        Xd=2.1,
        Xq=2,
        Xpd=0.2,
        Xppd=0.18,
        Xppq=0.18,
        Xl=0.15,
        S10=0.05,
        S12=0.3,
        R_a=0.01,
        Xpq=0.5,
        Tpq0=0.75,
        Xpp=Xppd);
    end MachineParsST;
  end MachineData;

  package ESData "Records with Excitation System (ES) Parameters"
    partial record EXST1Template "Type EXST1 Excitation System Data"
      parameter Types.Time T_R "Regulator input filter time constant";
      parameter Types.PerUnit V_IMAX "Maximum voltage error (regulator input)";
      parameter Types.PerUnit V_IMIN "Minimum voltage error (regulator input)";
      parameter Types.Time T_C "Regulator numerator (lead) time constant";
      parameter Types.Time T_B "Regulator denominator (lag) time constant";
      parameter Types.PerUnit K_A "Voltage regulator gain";
      parameter Types.Time T_A "Voltage regulator time constant";
      parameter Types.PerUnit V_RMAX "Maximum exciter output";
      parameter Types.PerUnit V_RMIN "Minimum exciter output";
      parameter Types.PerUnit K_C "Rectifier loading factor proportional to commutating reactance";
      parameter Types.PerUnit K_F "Rate feedback gain";
      parameter Types.Time T_F "Rate feedback time constant";

    end EXST1Template;

    partial record EXAC1Template "Type EXAC1 Excitation System Data"
      parameter Types.Time T_R "Regulator input filter time constant";
      parameter Types.Time T_B "Regulator denominator (lag) time constant";
      parameter Types.Time T_C "Regulator numerator (lead) time constant";
      parameter Types.PerUnit K_A "Regulator output gain";
      parameter Types.Time T_A "Regulator output time constant";
      parameter Types.PerUnit V_RMAX "Maximum regulator output";
      parameter Types.PerUnit V_RMIN "Minimum regulator output";
      parameter Types.Time T_E "Exciter field time constant";
      parameter Types.PerUnit K_F "Rate feedback excitation system stabilizer gain";
      parameter Types.Time T_F "Rate feedback time constant";
      parameter Types.PerUnit K_C "Rectifier loading factor proportional to commutating reactance";
      parameter Types.PerUnit K_D "Demagnetizing factor, function of exciter alternator reactances";
      parameter Types.PerUnit K_E "Exciter field proportional constant";
      parameter Types.PerUnit E_1 "Exciter output voltage for saturation factor S_E(E_1)";
      parameter Types.PerUnit E_2 "Exciter output voltage for saturation factor S_E(E_2)";
      parameter Types.PerUnit S_EE_1 "Exciter saturation factor at exciter output voltage E1";
      parameter Types.PerUnit S_EE_2 "Exciter saturation factor at exciter output voltage E2";

    end EXAC1Template;

    record EXST1ST "Type EXST1 ES for ST"
      extends EXST1Template(
        T_R = 0.02,
        V_IMAX=1,
        V_IMIN=-1,
        T_C=1,
        T_B=10,
        K_A=200,
        T_A=0.05,
        V_RMAX=5,
        V_RMIN=-4,
        K_C=0.04,
        K_F=0.02,
        T_F=1);
    end EXST1ST;

    record EXAC1GT "Type EXAC1 ES for TG"
      extends EXAC1Template(
        T_R=0,
        T_B=0,
        T_C=0,
        K_A=150,
        T_A=0.02,
        V_RMAX=20,
        V_RMIN=-20,
        T_E=0.5,
        K_F=0.0045,
        T_F=0.1,
        K_C=0.1,
        K_D=1,
        K_E=1,
        E_1=4.20,
        E_2=5.6,
        S_EE_1=0.1827,
        S_EE_2=0.2558);
    end EXAC1GT;
  end ESData;

  package TGData "Records with Turbine Governor (TG) Parameters"
    record GASTTemplate "Template for GAST turbine governor model"
      parameter Types.PerUnit R "Speed droop gain";
      parameter Types.Time T_1 "Valve response time constant";
      parameter Types.Time T_2 "Turbine response time constant";
      parameter Types.Time T_3 "Load limit response time constant";
      parameter Types.PerUnit AT "Ambient temperature load limit";
      parameter Types.PerUnit K_T "Load-limited feedback path adjustment gain";
      parameter Types.PerUnit V_MAX "Operational control high limit on fuel valve opening";
      parameter Types.PerUnit V_MIN "Low output control limit on fuel valve opening";
      parameter Types.PerUnit D_turb "Turbine damping";
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end GASTTemplate;

    record TGOV1Template "Template for TGOV1 turbine governor model"
      parameter Types.PerUnit R "Inverse of governor gain (the actual gain is 1/R)";
      parameter Types.PerUnit D_t "Turbine damping factor (on Machine Base)";
      parameter Types.Time T_1 "Regulator time constant. It must be greater than 0";
      parameter Types.Time T_2 "High-pressure reheater time constant";
      parameter Types.Time T_3 "Reheater time constant. It must be greater than 0";
      parameter Types.PerUnit V_MAX "Maximum valve position (on Machine Base)";
      parameter Types.PerUnit V_MIN "Minimum valve position (on Machine Base)";
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end TGOV1Template;

    record GASTTG "Type GAST TG for CTG1"
      extends GASTTemplate(
      R=0.05,
      T_1=0.4,
      T_2=0.1,
      T_3=3.0,
      AT=0.9,
      K_T=2.0,
      V_MAX=1.0,
      V_MIN=-0.05,
      D_turb=0.0);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end GASTTG;

    record TGOV1ST "Type TGOV1 TG for STG1"
      extends TGOV1Template(
        R=0.05,
        D_t=0,
        T_1=0.49,
        T_2=2.1,
        T_3=7,
        V_MAX=1,
        V_MIN=0);
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end TGOV1ST;

  end TGData;

  record GT "Machine, ES and TG Parameters for TG"
    extends GUDynamicsTemplate;

    replaceable record Machine = MachineData.MachineParsGT     constrainedby
      MachineData.MachineDataTemplate     "Machine data";
    Machine machine;

    replaceable record ExcSystem = ESData.EXAC1GT      constrainedby
      ESData.EXAC1Template     "Excitation system data";
    ExcSystem excSystem;

    replaceable record TG = TGData.GASTTG   constrainedby TGData.GASTTemplate
                                "Turbine governor data";
    TG tg;

  end GT;

  record ST "Machine, ES and TG Parameters for ST"
    extends GUDynamicsTemplate;

    replaceable record Machine = MachineData.MachineParsST     constrainedby
      MachineData.MachineDataTemplate     "Machine data";
    Machine machine;

    replaceable record ExcSystem = ESData.EXST1ST      constrainedby
      ESData.EXST1Template     "Excitation system data";
    ExcSystem excSystem;

    replaceable record TG = TGData.TGOV1ST   constrainedby TGData.TGOV1Template
                                 "Turbine governor data";
    TG tg;

  end ST;
end DynParamRecords;
