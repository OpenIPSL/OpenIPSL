within OpenIPSL.Examples.NamsskoganGrid;
model Grid_Model "Namsskogan distribution network modeled in positive sequence equivalent"
  extends Modelica.Icons.Example;
  // power flow: Bus voltage and angle
  parameter Real V1=1;
  parameter Real V2=1.000978686192306;
  parameter Real V3=1;
  parameter Real V4=1.001144870523547;
  parameter Real V5=0.990020695285066;
  parameter Real V6=0.991917071975107;
  parameter Real V7=0.999615092363111;
  parameter Real V8=1;
  parameter Real V9=1.005264704500199;
  parameter Real V10=1;
  parameter Real V11=1.001556334539315;
  parameter Real V12=1.006202074015938;
  parameter Real V13=1.000000000000000;
  parameter Real V14=1.002111573421558;
  parameter Real V15=1.000000000000000;
  parameter Real V16=1.005604575469775;
  parameter Real V17=1.009794898737450;
  parameter Real V18=1.000000000000000;
  parameter Real V19=1.008781516367090;
  parameter Real V20=1;
  parameter Real V21=1.012927254781854;
  parameter Real V22=1;
  parameter Real V23=0.990365039555955;
  parameter Real V24=0.992547458367065;
  parameter Real V25=1;
  parameter Real V26=1.002923143837613;
  parameter Real V27=1.006140397842372;
  parameter Real V28=1;
  parameter Real V29=1.012448925490739;
  parameter Real V30=1;
  parameter Real V31=1.002824689578292;
  parameter Real V32=1.004709989851770;
  parameter Real V33=1;

  parameter Real A1=0;
  parameter Real A2=0.012115755806484;
  parameter Real A3=0.082104439709160;
  parameter Real A4=0.018646091088315;
  parameter Real A5=0.097659480242634;
  parameter Real A6=0.108076654318283;
  parameter Real A7=0.131030947639985;
  parameter Real A8=0.195385827816926;
  parameter Real A9=0.139383558459376;
  parameter Real A10=0.172643191674894;
  parameter Real A11=0.190217292503320;
  parameter Real A12=0.197208802953018;
  parameter Real A13=0.235551877788020;
  parameter Real A14=0.190575809878652;
  parameter Real A15=0.229503417720643;
  parameter Real A16=0.210698071068972;
  parameter Real A17=0.214843158238043;
  parameter Real A18=0.250897893281931;
  parameter Real A19=0.225718726448939;
  parameter Real A20=0.272921892240354;
  parameter Real A21=0.230335027909897;
  parameter Real A22=0.268846818377855;
  parameter Real A23=0.128478717667788;
  parameter Real A24=0.129308136402056;
  parameter Real A25=0.174661512804609;
  parameter Real A26=0.186581039775171;
  parameter Real A27=0.193547709333211;
  parameter Real A28=0.223369006924396;
  parameter Real A29=0.200756261937865;
  parameter Real A30=0.236321108087801;
  parameter Real A31=0.224124501167591;
  parameter Real A32=0.229781948566553;
  parameter Real A33=0.266019238907426;

  //Power flow: active power
  parameter Real P1=0.052;
  parameter Real P2=0.1;
  parameter Real P3=0.06;
  parameter Real P4=0.026;
  parameter Real P5=0.034;
  parameter Real P6=0.039;
  parameter Real P7=0.013;
  parameter Real P8=0.026;
  parameter Real P9=0.036;
  parameter Real P10=0.01;
  parameter Real P11=0.015;
  parameter Real P12=0.35;
  parameter Real PinfBus=-0.731785154599269;
  //Power flow: Reactive power
  parameter Real Q1=-0.007324710145409;
  parameter Real Q2=0.003817600219383;
  parameter Real Q3=-0.008497237496540;
  parameter Real Q4=-0.006527593903969;
  parameter Real Q5=-0.005469908840906;
  parameter Real Q6=-0.012176182035471;
  parameter Real Q7=-4.504107405815501e-4;
  parameter Real Q8=-0.002893142134279;
  parameter Real Q9=-0.011808690774769;
  parameter Real Q10=-0.001897297640474;
  parameter Real Q11=0.002824778539280;
  parameter Real Q12=0.007359590829532;
  parameter Real QinfBus=0.094186096048226;
  //Power flow: Gen field voltage
  parameter Real VF1=1.514917156447076;
  parameter Real VF2=1.415463512981568;
  parameter Real VF3=1.673011441020379;
  parameter Real VF4=1.440249537769634;
  parameter Real VF5=1.547064720603257;
  parameter Real VF6=1.403336792187835;
  parameter Real VF7=1.516519670430372;
  parameter Real VF8=1.536585695281951;
  parameter Real VF9=1.506707258466347;
  parameter Real VF10=1.212912773594076;
  parameter Real VF11=1.960438233476215;
  parameter Real VF12=1.294154485396935;
  // Power flow: Reference voltage
  parameter Real VR1=0.998835608710304;
  parameter Real VR2=0.999494535063984;
  parameter Real VR3=1.004193839884901;
  parameter Real VR4=0.998622927924158;
  parameter Real VR5=0.998527646052893;
  parameter Real VR6=0.998936877367948;
  parameter Real VR7=1.003800205404283;
  parameter Real VR8=1.007701305520621;
  parameter Real VR9=0.998563459160107;
  parameter Real VR10=0.997078697666231;
  parameter Real VR11=0.996020051548693;

  OpenIPSL.Electrical.Machines.PSAT.Order6 syn1(
    V_b=6600,
    v_0=V10,
    Sn=8000000,
    Vn=6600,
    ra=0,
    x1d=0.2,
    M=5,
    D=0,
    w(fixed=true),
    xd=2,
    xq=1.5,
    x1q=0.3,
    x2d=0.15,
    x2q=0.25,
    T1d0=4,
    T1q0=0.8,
    T2d0=0.026667,
    T2q0=0.18,
    Taa=0.002,
    P_0=P1*SysData.S_b,
    Q_0=Q1*SysData.S_b,
    angle_0=A10)
    annotation (Placement(transformation(extent={{28,-158},{48,-138}})));
  OpenIPSL.Electrical.Buses.BusExt B1(
    V_b=132000,
    nn=1,
    v_0=V1,
    angle_0=A1,
    np=1) annotation (Placement(transformation(
        extent={{-2,-28},{2,28}},
        rotation=90,
        origin={208,-134})));
  OpenIPSL.Electrical.Buses.BusExt B2(
    V_b=132000,
    nn=3,
    v_0=V2,
    angle_0=A2,
    np=1) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={162,-82})));
  OpenIPSL.Electrical.Buses.BusExt B3(
    V_b=6600,
    np=1,
    nn=1,
    v_0=V3,
    angle_0=A3) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={290,-96})));
  OpenIPSL.Electrical.Buses.BusExt B4(
    V_b=132000,
    np=1,
    nn=1,
    v_0=V4,
    angle_0=A4) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={134,-32})));
  OpenIPSL.Electrical.Buses.BusExt B5(
    V_b=22000,
    v_0=V5,
    angle_0=A5,
    nn=4,
    np=1) annotation (Placement(transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={106,2})));
  OpenIPSL.Electrical.Buses.BusExt B6(
    V_b=22000,
    np=2,
    nn=2,
    v_0=V6,
    angle_0=A6) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=180,
        origin={18,18})));
  OpenIPSL.Electrical.Buses.BusExt B7(
    V_b=22000,
    np=2,
    v_0=V7,
    angle_0=A7,
    nn=1) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-12,-44})));
  OpenIPSL.Electrical.Buses.BusExt B8(
    V_b=6600,
    np=1,
    nn=1,
    v_0=V8,
    angle_0=A8) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-40,-92})));
  OpenIPSL.Electrical.Buses.BusExt B9(
    V_b=22000,
    np=1,
    nn=1,
    v_0=V9,
    angle_0=A9) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={58,-82})));
  OpenIPSL.Electrical.Buses.BusExt B10(
    V_b=6600,
    np=1,
    nn=1,
    v_0=V10,
    angle_0=A10) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={58,-124})));
  OpenIPSL.Electrical.Buses.BusExt B11(
    V_b=22000,
    nn=3,
    v_0=V11,
    angle_0=A11,
    np=2) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=180,
        origin={-82,16})));
  OpenIPSL.Electrical.Buses.BusExt B12(
    V_b=22000,
    np=1,
    nn=1,
    v_0=V12,
    angle_0=A12) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-110,-60})));
  OpenIPSL.Electrical.Buses.BusExt B13(
    V_b=6600,
    np=1,
    nn=1,
    v_0=V13,
    angle_0=A13) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-122,-118})));
  OpenIPSL.Electrical.Buses.BusExt B14(
    V_b=22000,
    np=1,
    nn=1,
    v_0=V14,
    angle_0=A14) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-106,80})));
  OpenIPSL.Electrical.Buses.BusExt B15(
    V_b=690,
    np=1,
    nn=1,
    v_0=V15,
    angle_0=A15) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=180,
        origin={-42,114})));
  OpenIPSL.Electrical.Buses.BusExt B16(
    V_b=22000,
    nn=2,
    v_0=V16,
    angle_0=A16,
    np=1) annotation (Placement(transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-194,-18})));
  OpenIPSL.Electrical.Buses.BusExt B17(
    V_b=22000,
    nn=1,
    v_0=V17,
    angle_0=A17,
    np=1) annotation (Placement(transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-214,-66})));
  OpenIPSL.Electrical.Buses.BusExt B18(
    V_b=6600,
    np=1,
    nn=1,
    v_0=V18,
    angle_0=A18) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-228,-112})));
  OpenIPSL.Electrical.Buses.BusExt B19(
    V_b=22000,
    nn=2,
    v_0=V19,
    angle_0=A19,
    np=1) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-266,-12})));
  OpenIPSL.Electrical.Buses.BusExt B20(
    V_b=6600,
    np=1,
    nn=1,
    v_0=V20,
    angle_0=A20) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-310,-72})));
  OpenIPSL.Electrical.Buses.BusExt B21(
    V_b=22000,
    np=1,
    nn=1,
    v_0=V21,
    angle_0=A21) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=180,
        origin={-318,50})));
  OpenIPSL.Electrical.Buses.BusExt B22(
    V_b=6600,
    nn=1,
    v_0=V22,
    angle_0=A22,
    np=1) annotation (Placement(transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={-288,122})));
  OpenIPSL.Electrical.Buses.BusExt B23(
    V_b=22000,
    nn=3,
    v_0=V23,
    angle_0=A23,
    np=1) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={98,62})));
  OpenIPSL.Electrical.Buses.BusExt B24(
    V_b=22000,
    np=1,
    v_0=V24,
    angle_0=A24,
    nn=1) annotation (Placement(transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={192,44})));
  OpenIPSL.Electrical.Buses.BusExt B25(
    V_b=690,
    np=1,
    nn=1,
    v_0=V25,
    angle_0=A25) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={240,-2})));
  OpenIPSL.Electrical.Buses.BusExt B26(
    V_b=22000,
    np=4,
    v_0=V26,
    angle_0=A26,
    nn=2) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={98,110})));
  OpenIPSL.Electrical.Buses.BusExt B27(
    V_b=22000,
    nn=2,
    v_0=V27,
    angle_0=A27,
    np=1) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={196,94})));
  OpenIPSL.Electrical.Buses.BusExt B28(
    V_b=690,
    np=1,
    v_0=V28,
    angle_0=A28,
    nn=1) annotation (Placement(transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={266,56})));
  OpenIPSL.Electrical.Buses.BusExt B29(
    V_b=22000,
    nn=1,
    v_0=V29,
    angle_0=A29,
    np=1) annotation (Placement(transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={322,96})));
  OpenIPSL.Electrical.Buses.BusExt B30(
    V_b=6600,
    np=1,
    nn=1,
    v_0=V30,
    angle_0=A30) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={342,18})));
  OpenIPSL.Electrical.Buses.BusExt B31(
    V_b=22000,
    np=1,
    nn=1,
    v_0=V31,
    angle_0=A31) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=90,
        origin={94,158})));
  OpenIPSL.Electrical.Buses.BusExt B32(
    V_b=22000,
    nn=2,
    v_0=V32,
    angle_0=A32,
    np=1) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=180,
        origin={212,140})));
  OpenIPSL.Electrical.Buses.BusExt B33(
    V_b=6600,
    np=1,
    nn=1,
    v_0=V33,
    angle_0=A33) annotation (Placement(
        transformation(
        extent={{2,-22},{-2,22}},
        rotation=180,
        origin={284,136})));

  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer(
    Sn=50000000,
    V_b=6600,
    Vn=6600,
    rT=0,
    xT=0.1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={230,-78})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer1(
    Sn=50000000,
    V_b=132000,
    Vn=132000,
    rT=0,
    xT=0.1) annotation (Placement(transformation(
        extent={{-8,-9},{8,9}},
        rotation=90,
        origin={131,-16})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer2(
    V_b=6600,
    Vn=6600,
    Sn=14000000,
    rT=0,
    xT=0.09) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={-38,-74})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer3(
    V_b=6600,
    Vn=6600,
    Sn=14000000,
    rT=0,
    xT=0.09) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,-106})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer4(
    V_b=6600,
    Vn=6600,
    Sn=14000000,
    rT=0,
    xT=0.09) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-114,-92})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer5(
    Sn=2000000,
    V_b=690,
    Vn=690,
    rT=0,
    xT=0.06) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-74,110})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer6(
    V_b=6600,
    Vn=6600,
    Sn=5000000,
    rT=0,
    xT=0.07) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-212,-88})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer7(
    V_b=6600,
    Vn=6600,
    Sn=5000000,
    rT=0,
    xT=0.07) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-292,-46})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer8(
    V_b=6600,
    Vn=6600,
    Sn=8000000,
    rT=0,
    xT=0.08) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-330,96})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer9(
    Sn=2000000,
    V_b=690,
    Vn=690,
    rT=0,
    xT=0.06) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={242,22})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer10(
    Sn=2000000,
    V_b=690,
    Vn=690,
    rT=0,
    xT=0.06) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={238,78})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer11(
    Sn=8000000,
    V_b=6600,
    Vn=6600,
    rT=0,
    xT=0.08) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={328,54})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer twoWindingTransformer12(
    Sn=5000000,
    V_b=6600,
    Vn=6600,
    rT=0,
    xT=0.07) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={250,140})));
  OpenIPSL.Electrical.Branches.PwLine Line1_2(
    R=0.00336,
    X=0.01613,
    G=0,
    B=0.00426/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={198,-108})));
  OpenIPSL.Electrical.Branches.PwLine Line2_4(
    R=0.00336,
    X=0.01613,
    G=0,
    B=0.0026/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={144,-60})));
  OpenIPSL.Electrical.Branches.PwLine line56_1(
    R=0.0262,
    X=0.0595,
    G=0,
    B=0.00001289376/2,
    t2=11,
    t1=10) annotation (Placement(transformation(extent={{48,-4},{68,16}})));
  OpenIPSL.Electrical.Branches.PwLine Line56_2(
    G=0,
    R=0.0262,
    X=0.0595,
    B=0.00001289376/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={60,30})));
  OpenIPSL.Electrical.Branches.PwLine Line6_11(
    G=0,
    R=0.192,
    X=0.436,
    B=0.0000947/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-32,18})));
  OpenIPSL.Electrical.Branches.PwLine Line6_7(
    G=0,
    R=0.064,
    X=0.145,
    B=0.00003151808/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={2,-16})));
  OpenIPSL.Electrical.Branches.PwLine Line7_9(
    G=0,
    R=0.134,
    X=0.138,
    B=0.0000267/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={18,-68})));
  OpenIPSL.Electrical.Branches.PwLine Line7_1(
    G=0,
    R=0.0964,
    X=0.10,
    B=0.0000193/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-66,-30})));
  OpenIPSL.Electrical.Branches.PwLine Line11_16(
    G=0,
    R=0.09814,
    X=0.1807,
    B=0.000039/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-132,22})));
  OpenIPSL.Electrical.Branches.PwLine Line16_19(
    G=0,
    R=0.098,
    X=0.181,
    B=0.0000394/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-236,22})));
  OpenIPSL.Electrical.Branches.PwLine Line19_21(
    G=0,
    R=0.134,
    X=0.0734,
    B=0.0000126/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-284,24})));
  OpenIPSL.Electrical.Branches.PwLine Line11_14(
    G=0,
    R=0.0446,
    X=0.0244,
    B=0.0000042/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-100,52})));
  OpenIPSL.Electrical.Branches.PwLine Line5_23(
    G=0,
    R=0.157,
    X=0.289,
    B=0.00000632/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={100,38})));
  OpenIPSL.Electrical.Branches.PwLine Line2326_1(
    G=0,
    R=1.016,
    X=1.055,
    B=0.0002038/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={74,84})));
  OpenIPSL.Electrical.Branches.PwLine Line2326_2(
    G=0,
    R=1.016,
    X=1.055,
    B=0.0002038/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={98,84})));
  OpenIPSL.Electrical.Branches.PwLine Line26_31(
    G=0,
    R=0.742,
    X=0.771,
    B=0.000148/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={94,132})));
  OpenIPSL.Electrical.Branches.PwLine Line31_32(
    G=0,
    R=0.1489,
    X=0.0816,
    B=0.00014/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={156,164})));
  OpenIPSL.Electrical.Branches.PwLine Line26_27(
    G=0,
    R=0.111,
    X=0.116,
    B=0.0000223/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={156,116})));
  OpenIPSL.Electrical.Branches.PwLine Line26_29(
    G=0,
    R=0.223,
    X=0.122,
    B=0.000021/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={252,102})));
  OpenIPSL.Electrical.Branches.PwLine Line26_1(
    G=0,
    R=0.134,
    X=0.0734,
    B=0.0000126/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={154,64})));
  OpenIPSL.Electrical.Loads.PSAT.VoltageDependent voltDependant(
    V_b=22000,
    v_0=V11,
    angle_0=A11,
    P_0=211600,
    Q_0=43000) annotation (Placement(transformation(extent={{-100,-16},{-88,-4}})));
  OpenIPSL.Electrical.Loads.PSAT.VoltageDependent voltDependant1(
    V_b=22000,
    v_0=V26,
    angle_0=A26,
    P_0=7400,
    Q_0=1800) annotation (Placement(transformation(extent={{116,82},{126,92}})));
  OpenIPSL.Electrical.Loads.PSAT.VoltageDependent voltDependant2(
    V_b=132000,
    v_0=V2,
    angle_0=A2,
    P_0=702000,
    Q_0=143000) annotation (Placement(transformation(extent={{120,-86},{128,-78}})));
  OpenIPSL.Electrical.Branches.PwLine Line16_17(
    G=0,
    R=0.19365,
    X=0.10609,
    B=0.000082/2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-196,-44})));
  OpenIPSL.Electrical.Loads.PSAT.VoltageDependent voltDependant3(
    V_b=22000,
    v_0=V5,
    angle_0=A5,
    P_0=0,
    Q_0=-8000000) annotation (Placement(transformation(extent={{146,-16},{160,-2}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR1(
    vrmin=-1,
    vrmax=1,
    Ka=62,
    Ta=0.05,
    Kf=0.1140,
    Tf=0.5,
    Ke=-0.05,
    Te=0.405,
    Tr=1,
    v0=V10) annotation (Placement(transformation(extent={{-2,-154},{18,-134}})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn2(
    V_b=6600,
    Vn=6600,
    ra=0,
    M=5,
    D=0,
    w(fixed=true),
    x1q=0.3,
    T1q0=0.8,
    Taa=0.002,
    v_0=V8,
    Sn=15000000,
    x1d=0.3,
    xd=1.5,
    xq=1,
    x2d=0.2,
    x2q=0.15,
    T1d0=3,
    T2d0=0.015,
    T2q0=0.2,
    P_0=P2*SysData.S_b,
    Q_0=Q2*SysData.S_b,
    angle_0=A8) annotation (Placement(transformation(extent={{-64,-152},{-44,-132}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR2(
    vrmin=-1,
    vrmax=1,
    Tr=1,
    Ka=50,
    Ta=0.06,
    Kf=0.08,
    Tf=1,
    Ke=-0.02,
    Te=0.5)
    annotation (Placement(transformation(extent={{-94,-148},{-74,-128}})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn3(
    V_b=6600,
    Sn=8000000,
    Vn=6600,
    ra=0,
    x1d=0.2,
    D=0,
    w(fixed=true),
    xd=2,
    xq=1.5,
    x1q=0.3,
    x2d=0.15,
    x2q=0.25,
    T1d0=4,
    T1q0=0.8,
    T2d0=0.026667,
    T2q0=0.18,
    Taa=0.002,
    v_0=V13,
    M=2.5,
    P_0=P3*SysData.S_b,
    Q_0=Q3*SysData.S_b,
    angle_0=A13) annotation (Placement(transformation(extent={{-158,-156},{-138,-136}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR3(
    Tr=1,
    vrmin=-7.3,
    vrmax=7.3,
    Ka=400,
    Ta=0.02,
    Kf=0.03,
    Tf=1,
    Ke=1,
    Te=0.790,
    v0=V13)
    annotation (Placement(transformation(extent={{-188,-152},{-168,-132}})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn4(
    V_b=6600,
    Vn=6600,
    ra=0,
    x1d=0.2,
    D=0,
    w(fixed=true),
    xd=2,
    xq=1.5,
    x1q=0.3,
    T1q0=0.8,
    Taa=0.002,
    v_0=V18,
    Sn=4000000,
    M=0.7,
    x2d=0.1,
    x2q=0.15,
    T1d0=3,
    T2d0=0.02,
    T2q0=0.2,
    P_0=P4*SysData.S_b,
    Q_0=Q4*SysData.S_b,
    angle_0=A18) annotation (Placement(transformation(extent={{-252,-148},{-232,-128}})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR4(
    vrmin=-1,
    vrmax=1,
    Ke=-0.05,
    Tr=1,
    Ka=50,
    Ta=0.06,
    Kf=0.08,
    Tf=1,
    Te=0.5,
    v0=V18)
    annotation (Placement(transformation(extent={{-282,-144},{-262,-124}})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn5(
    V_b=6600,
    Vn=6600,
    ra=0,
    x1d=0.2,
    D=0,
    w(fixed=true),
    xd=2,
    xq=1.5,
    x1q=0.3,
    T1q0=0.8,
    Taa=0.002,
    x2d=0.1,
    T2d0=0.02,
    v_0=V20,
    Sn=5000000,
    M=1,
    x2q=0.2,
    T1d0=4,
    T2q0=0.225,
    P_0=P5*SysData.S_b,
    Q_0=Q5*SysData.S_b,
    angle_0=A20) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-310,-106})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR5(
    vrmin=-1,
    vrmax=1,
    Ke=-0.05,
    Tr=1,
    Ka=50,
    Ta=0.06,
    Kf=0.08,
    Tf=1,
    Te=0.5,
    v0=V20) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-312,-136})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn6(
    V_b=6600,
    Vn=6600,
    ra=0,
    x1d=0.2,
    D=0,
    w(fixed=true),
    xd=2,
    xq=1.5,
    x1q=0.3,
    T1d0=4,
    T1q0=0.8,
    Taa=0.002,
    v_0=V22,
    Sn=6000000,
    M=1.5,
    x2d=0.1,
    x2q=0.2,
    T2d0=0.04,
    T2q0=0.225,
    P_0=P6*SysData.S_b,
    Q_0=Q6*SysData.S_b,
    angle_0=A22) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-250,144})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR6(
    vrmin=-1,
    vrmax=1,
    Tr=1,
    Ka=50,
    Ta=0.02,
    Kf=0.06,
    Tf=1.25,
    Ke=-0.04,
    Te=0.470,
    v0=V22) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-214,152})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn7(
    ra=0,
    D=0,
    w(fixed=true),
    x1q=0.3,
    T1q0=0.8,
    Taa=0.002,
    x2d=0.1,
    V_b=690,
    v_0=V15,
    Sn=1600000,
    Vn=690,
    x1d=0.15,
    M=0.5,
    xd=1.5,
    xq=1,
    x2q=0.1,
    T1d0=2,
    T2d0=0.015,
    T2q0=0.1,
    P_0=P7*SysData.S_b,
    Q_0=Q7*SysData.S_b,
    angle_0=A15) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-4,118})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR7(
    Tr=1,
    Ta=0.02,
    vrmin=-6.5,
    vrmax=6.5,
    Ka=400,
    Kf=0.03,
    Tf=1,
    Ke=1,
    Te=0.730,
    v0=V15) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={32,126})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn8(
    ra=0,
    D=0,
    w(fixed=true),
    x1q=0.3,
    T1q0=0.8,
    Taa=0.002,
    x2d=0.1,
    V_b=6600,
    v_0=V33,
    Sn=4000000,
    Vn=6600,
    x1d=0.2,
    M=0.7,
    xd=2,
    xq=1.5,
    x2q=0.15,
    T1d0=3,
    T2d0=0.02,
    T2q0=0.2,
    P_0=P8*SysData.S_b,
    Q_0=Q8*SysData.S_b,
    angle_0=A33) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={320,142})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR8(
    Tr=1,
    Ta=0.02,
    Kf=0.03,
    Tf=1,
    Ke=1,
    vrmin=-4.26,
    vrmax=4.26,
    Ka=200,
    Te=1.4,
    v0=V33) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={356,148})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn9(
    ra=0,
    D=0,
    w(fixed=true),
    x1q=0.3,
    T1q0=0.8,
    Taa=0.002,
    x2d=0.1,
    V_b=6600,
    Vn=6600,
    x1d=0.2,
    xd=2,
    xq=1.5,
    T2d0=0.02,
    v_0=V30,
    Sn=5000000,
    M=1,
    x2q=0.2,
    T1d0=4,
    T2q0=0.225,
    P_0=P9*SysData.S_b,
    Q_0=Q9*SysData.S_b,
    angle_0=A30) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={342,-12})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR9(
    Tr=1,
    Ta=0.02,
    vrmin=-1,
    vrmax=1,
    Ka=50,
    Kf=0.0332,
    Tf=1.26,
    Ke=-0.05,
    Te=0.530,
    v0=V30) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={378,-4})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn10(
    ra=0,
    D=0,
    w(fixed=true),
    x1q=0.3,
    T1q0=0.8,
    Taa=0.002,
    x2d=0.1,
    V_b=6900,
    v_0=V28,
    Sn=1600000,
    Vn=690,
    x1d=0.15,
    M=0.5,
    xd=1.5,
    xq=1,
    x2q=0.1,
    T1d0=2,
    T2d0=0.015,
    T2q0=0.15,
    P_0=P10*SysData.S_b,
    Q_0=Q10*SysData.S_b,
    angle_0=A28) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={276,26})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR10(
    Tr=1,
    vrmin=-1,
    vrmax=1,
    Ka=25,
    Ta=0.2,
    Kf=0.6571,
    Tf=0.35,
    Ke=-0.062,
    Te=0.5,
    v0=V28) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={278,-2})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn11(
    ra=0,
    D=0,
    w(fixed=true),
    x1q=0.3,
    T1q0=0.8,
    Taa=0.002,
    x2d=0.1,
    V_b=690,
    Vn=690,
    M=0.5,
    x2q=0.1,
    T2q0=0.15,
    v_0=V25,
    Sn=2000000,
    x1d=0.2,
    xd=2,
    xq=1.5,
    T1d0=3,
    T2d0=0.02,
    P_0=P11*SysData.S_b,
    Q_0=Q11*SysData.S_b,
    angle_0=A25) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={238,-30})));
  OpenIPSL.Electrical.Controls.PSAT.AVR.AVRTypeII aVR11(
    Tr=1,
    vrmin=-1,
    vrmax=1,
    Ta=0.2,
    Ka=16.5,
    Kf=0.06,
    Tf=1,
    Ke=-0.037,
    Te=0.270,
    v0=V25) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={240,-58})));
  OpenIPSL.Electrical.Machines.PSAT.Order6 syn12(
    ra=0,
    D=0,
    w(fixed=true),
    x1q=0.3,
    T1q0=0.8,
    Taa=0.002,
    V_b=6600,
    v_0=V3,
    Sn=45000000,
    Vn=6600,
    x1d=0.3,
    M=2.5,
    xd=1.05,
    xq=0.8,
    x2d=0.2,
    x2q=0.2,
    T1d0=2.8,
    T2d0=0.03,
    T2q0=0.12,
    P_0=P12*SysData.S_b,
    Q_0=Q12*SysData.S_b,
    angle_0=A3) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={294,-128})));
  OpenIPSL.Electrical.Buses.InfiniteBus infiniteBus(
    v_0=V1,
    angle_0=A1,
    V_b=132000,
    P_0=PinfBus,
    Q_0=QinfBus) annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=180,
        origin={140,-148})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=100000000,
                                                        fn=50)
    annotation (Placement(transformation(extent={{-358,138},{-284,180}})));
  StaticCondenser staticCondenser(B=0.02)
    annotation (Placement(transformation(extent={{164,130},{176,142}})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=1e-3,
    X=1e-3,
    t1=1,
    t2=1.02) annotation (Placement(transformation(extent={{138,86},{150,98}})));
equation
  connect(twoWindingTransformer.p, B3.n[1]) annotation (Line(points={{241,-78},{262,-78},{290,-78},{290,-94}},
                                         color={0,0,255}));
  connect(B2.n[1], twoWindingTransformer.n) annotation (Line(points={{170.8,-80},{172,-80},{172,-78},{219,-78}},
                                          color={0,0,255}));
  connect(twoWindingTransformer1.p, B4.n[1]) annotation (Line(points={{131,-24.8},{131,-28.4},{134,-28.4},{134,-30}},
                                              color={0,0,255}));
  connect(B1.p[1], Line1_2.p) annotation (Line(points={{208,-132},{204,-132},{204,-122},{198,-122},{198,-117}},
                                            color={0,0,255}));
  connect(B4.p[1], Line2_4.n) annotation (Line(points={{134,-34},{138,-34},{138,-44},{138,-46},{144,-46},{144,-51}},
                                               color={0,0,255}));
  connect(B5.n[1], voltDependant3.p) annotation (Line(points={{115.9,4},{112,4},
          {112,8},{153,8},{153,-2}},color={0,0,255}));
  connect(B5.n[2], Line5_23.n) annotation (Line(points={{109.3,4},{110,4},{110,12},{110,18},{102,18},{102,29},{100,29}},
                                                    color={0,0,255}));
  connect(B5.n[3], Line56_2.p) annotation (Line(points={{102.7,4},{108,4},{108,12},{92,12},{92,30},{69,30}},
                                        color={0,0,255}));
  connect(B6.p[1], Line56_2.n) annotation (Line(points={{20,24.6},{38,24.6},{38,30},{51,30}},
                        color={0,0,255}));
  connect(B6.p[2], line56_1.p) annotation (Line(points={{20,11.4},{38,11.4},{38,6},{49,6}},
                      color={0,0,255}));
  connect(Line6_11.p, B6.n[1])
    annotation (Line(points={{-23,18},{16,18},{16,24.6}}, color={0,0,255}));
  connect(B25.n[1], twoWindingTransformer9.p) annotation (Line(points={{240,0},{244,0},{244,8},{244,11},{242,11}},
                                               color={0,0,255}));
  connect(B24.p[1], twoWindingTransformer9.n) annotation (Line(points={{192,42},{196,42},{196,33},{242,33}},
                                       color={0,0,255}));
  connect(Line26_1.p, B24.n[1])
    annotation (Line(points={{163,64},{192,64},{192,46}}, color={0,0,255}));
  connect(B23.n[1], Line26_1.n) annotation (Line(points={{106.8,64},{108,64},{108,64},{145,64}},
                             color={0,0,255}));
  connect(B26.p[1], voltDependant1.p) annotation (Line(points={{107.9,108},{104,108},{104,96},{121,96},{121,92}},
                                            color={0,0,255}));
  connect(B26.p[2], Line2326_2.p)
    annotation (Line(points={{101.3,108},{98,108},{98,93}}, color={0,0,255}));
  connect(B26.p[3], Line2326_1.p) annotation (Line(points={{94.7,108},{96,108},{96,100},{74,100},{74,93}},
                                      color={0,0,255}));
  connect(Line26_31.p, B31.p[1]) annotation (Line(points={{94,141},{92,141},{92,156},{94,156}},
                          color={0,0,255}));
  connect(B31.n[1], Line31_32.n)
    annotation (Line(points={{94,160},{94,164},{147,164}}, color={0,0,255}));
  connect(Line31_32.p, B32.n[1]) annotation (Line(points={{165,164},{190,164},{190,146.6},{210,146.6}},
                                   color={0,0,255}));
  connect(twoWindingTransformer12.p, B33.n[1])
    annotation (Line(points={{261,140},{282,140},{282,136}}, color={0,0,255}));
  connect(twoWindingTransformer10.p, B28.n[1])
    annotation (Line(points={{249,78},{266,78},{266,58}}, color={0,0,255}));
  connect(B27.n[1], Line26_29.n) annotation (Line(points={{202.6,96},{202,96},{202,100},{243,100},{243,102}},
                                         color={0,0,255}));
  connect(B29.n[1], Line26_29.p)
    annotation (Line(points={{322,98},{322,102},{261,102}}, color={0,0,255}));
  connect(B29.p[1], twoWindingTransformer11.n) annotation (Line(points={{322,94},{326,94},{326,78},{326,65},{328,65}},
                                                color={0,0,255}));
  connect(B30.n[1], twoWindingTransformer11.p) annotation (Line(points={{342,20},{346,20},{346,43},{328,43}},
                                       color={0,0,255}));
  connect(B11.n[1], voltDependant.p) annotation (Line(points={{-84,24.8},{-94,24.8},{-94,-4}},
                           color={0,0,255}));
  connect(Line11_14.n, B11.n[2]) annotation (Line(points={{-100,43},{-100,43},{-100,34},{-84,34},{-84,16},{-84,16}},
                                                color={0,0,255}));
  connect(Line11_14.p, B14.p[1])
    annotation (Line(points={{-100,61},{-100,78},{-106,78}}, color={0,0,255}));
  connect(B14.n[1], twoWindingTransformer5.n) annotation (Line(points={{-106,82},{-96,82},{-96,110},{-85,110}},
                                         color={0,0,255}));
  connect(B15.n[1], twoWindingTransformer5.p) annotation (Line(points={{-44,114},{-48,114},{-48,110},{-56,110},{-63,110}},
                                                    color={0,0,255}));
  connect(B6.n[2], Line6_7.p) annotation (Line(points={{16,11.4},{14,11.4},{14,10},{2,10},{2,-7}},
                              color={0,0,255}));
  connect(B7.p[1], Line7_9.p) annotation (Line(points={{-5.4,-46},{-4,-46},{-4,-58},{18,-58},{18,-59}},
                                   color={0,0,255}));
  connect(Line7_9.n, B9.n[1]) annotation (Line(points={{18,-77},{36,-77},{36,-72},{58,-72},{58,-80}},
                              color={0,0,255}));
  connect(B8.n[1], twoWindingTransformer2.p) annotation (Line(points={{-40,-90},{-40,-90},{-40,-84},{-40,-80},{-49,-80},{-49,-74}},
                                                              color={0,0,255}));
  connect(Line7_1.p, B12.n[1]) annotation (Line(points={{-66,-39},{-66,-39},{-66,-48},{-102,-48},{-102,-58},{-110,-58}},
                                                  color={0,0,255}));
  connect(B12.p[1], twoWindingTransformer4.p) annotation (Line(points={{-110,-62},{-110,-81},{-114,-81}},
                                  color={0,0,255}));
  connect(twoWindingTransformer4.n, B13.n[1]) annotation (Line(points={{-114,-103},{-114,-116},{-122,-116}},
                                    color={0,0,255}));
  connect(B16.n[1], Line11_16.n) annotation (Line(points={{-187.4,-16},{-187.4,22},{-141,22}},
                          color={0,0,255}));
  connect(B19.n[1], Line16_19.n) annotation (Line(points={{-259.4,-10},{-259.4,22},{-245,22}},
                          color={0,0,255}));
  connect(B21.p[1], Line19_21.p)
    annotation (Line(points={{-316,50},{-284,50},{-284,33}}, color={0,0,255}));
  connect(twoWindingTransformer8.n, B21.n[1]) annotation (Line(points={{-330,85},{-328,85},{-328,46},{-320,46},{-320,50}},
                                                    color={0,0,255}));
  connect(B22.p[1], twoWindingTransformer8.p) annotation (Line(points={{-288,120},{-288,107},{-330,107}},
                                       color={0,0,255}));
  connect(B20.n[1], twoWindingTransformer7.n) annotation (Line(points={{-310,-70},{-310,-57},{-292,-57}},
                                  color={0,0,255}));
  connect(B17.n[1], Line16_17.p) annotation (Line(points={{-214,-64},{-214,-53},{-196,-53}},
                       color={0,0,255}));
  connect(B17.p[1], twoWindingTransformer6.p)
    annotation (Line(points={{-214,-68},{-214,-72},{-212,-72},{-212,-77}},
                                                     color={0,0,255}));
  connect(twoWindingTransformer6.n, B18.n[1]) annotation (Line(points={{-212,-99},{-218,-99},{-218,-100},{-228,-100},{-228,-110}},
                                                           color={0,0,255}));
  connect(B10.n[1], twoWindingTransformer3.n)
    annotation (Line(points={{58,-122},{58,-117},{60,-117}}, color={0,0,255}));
  connect(B9.p[1], twoWindingTransformer3.p)
    annotation (Line(points={{58,-84},{58,-95},{60,-95}}, color={0,0,255}));
  connect(aVR1.vf, syn1.vf) annotation (Line(points={{20,-144},{22.25,-144},{
          22.25,-143},{26,-143}}, color={0,0,127}));
  connect(syn1.v, aVR1.v) annotation (Line(points={{49,-145},{54,-145},{54,-162},
          {-12,-162},{-12,-150},{-4,-150}},color={0,0,127}));
  connect(aVR2.vf, syn2.vf) annotation (Line(points={{-72,-138},{-69.75,-138},{
          -69.75,-137},{-66,-137}}, color={0,0,127}));
  connect(syn2.v, aVR2.v) annotation (Line(points={{-43,-139},{-34,-139},{-34,-154},
          {-100,-154},{-100,-144},{-96,-144}}, color={0,0,127}));
  connect(aVR3.vf, syn3.vf) annotation (Line(points={{-166,-142},{-163.75,-142},
          {-163.75,-141},{-160,-141}}, color={0,0,127}));
  connect(syn3.v, aVR3.v) annotation (Line(points={{-137,-143},{-128,-143},{-128,
          -158},{-194,-158},{-194,-148},{-190,-148}}, color={0,0,127}));
  connect(aVR4.vf, syn4.vf) annotation (Line(points={{-260,-134},{-257.75,-134},
          {-257.75,-133},{-254,-133}}, color={0,0,127}));
  connect(syn4.v, aVR4.v) annotation (Line(points={{-231,-135},{-222,-135},{-222,
          -150},{-288,-150},{-288,-140},{-284,-140}}, color={0,0,127}));
  connect(aVR5.vf, syn5.vf) annotation (Line(points={{-312,-124},{-312,-121.75},
          {-315,-121.75},{-315,-118}}, color={0,0,127}));
  connect(syn5.v, aVR5.v) annotation (Line(points={{-313,-95},{-313,-86},{-324,
          -86},{-324,-150},{-306,-150},{-306,-148}}, color={0,0,127}));
  connect(aVR6.vf, syn6.vf) annotation (Line(points={{-226,152},{-230,152},{-230,
          139},{-238,139}}, color={0,0,127}));
  connect(syn6.v, aVR6.v) annotation (Line(points={{-261,141},{-266,141},{-266,
          122},{-200,122},{-200,158},{-202,158}}, color={0,0,127}));
  connect(syn5.p, B20.p[1]) annotation (Line(points={{-310,-96},{-310,-86.5},{-310,-86.5},{-310,-74}},
                              color={0,0,255}));
  connect(syn4.p, B18.p[1]) annotation (Line(points={{-232,-138},{-228,-138},{-228,-114}},
                  color={0,0,255}));
  connect(syn2.p, B8.p[1]) annotation (Line(points={{-44,-142},{-40,-142},{-40,-94}},
                 color={0,0,255}));
  connect(syn1.p, B10.p[1])
    annotation (Line(points={{48,-148},{58,-148},{58,-126}}, color={0,0,255}));
  connect(aVR7.vf, syn7.vf) annotation (Line(points={{20,126},{16,126},{16,113},
          {8,113}}, color={0,0,127}));
  connect(syn7.v, aVR7.v) annotation (Line(points={{-15,115},{-18,115},{-18,106},
          {48,106},{48,132},{44,132}}, color={0,0,127}));
  connect(aVR8.vf, syn8.vf) annotation (Line(points={{344,148},{340,148},{340,
          137},{332,137}}, color={0,0,127}));
  connect(syn8.v, aVR8.v) annotation (Line(points={{309,139},{306,139},{306,128},
          {372,128},{372,154},{368,154}}, color={0,0,127}));
  connect(aVR9.vf, syn9.vf) annotation (Line(points={{366,-4},{362,-4},{362,-17},
          {354,-17}}, color={0,0,127}));
  connect(syn9.v, aVR9.v) annotation (Line(points={{331,-15},{328,-15},{328,-24},
          {394,-24},{394,2},{390,2}}, color={0,0,127}));
  connect(syn10.v, aVR10.v) annotation (Line(points={{273,37},{273,42},{298,42},
          {298,-16},{284,-16},{284,-14}}, color={0,0,127}));
  connect(aVR10.vf, syn10.vf) annotation (Line(points={{278,10},{278,12},{271,
          12},{271,14}}, color={0,0,127}));
  connect(syn11.v, aVR11.v) annotation (Line(points={{235,-19},{235,-14},{264,-14},
          {264,-72},{246,-72},{246,-70}}, color={0,0,127}));
  connect(aVR11.vf, syn11.vf) annotation (Line(points={{240,-46},{240,-44},{233,
          -44},{233,-42}}, color={0,0,127}));
  connect(syn6.p, B22.n[1]) annotation (Line(points={{-260,144},{-288,144},{-288,124}},
                 color={0,0,255}));
  connect(syn7.p, B15.p[1]) annotation (Line(points={{-14,118},{-26,118},{-26,114},{-40,114}},
                           color={0,0,255}));
  connect(syn8.p, B33.p[1]) annotation (Line(points={{310,142},{298,142},{298,136},{286,136}},
                           color={0,0,255}));
  connect(syn9.p, B30.p[1]) annotation (Line(points={{332,-12},{322,-12},{322,8},{342,8},{342,16}},
                             color={0,0,255}));
  connect(syn11.p, B25.p[1]) annotation (Line(points={{238,-20},{238,-12.5},{240,-12.5},{240,-4}},
                                color={0,0,255}));
  connect(syn12.p, B3.p[1]) annotation (Line(points={{294,-118},{294,-108.5},{290,-108.5},{290,-98}},
                                   color={0,0,255}));
  connect(syn9.pm0, syn9.pm) annotation (Line(points={{350,-1},{350,0},{356,0},
          {356,-7},{354,-7}},color={0,0,127}));
  connect(syn10.pm0, syn10.pm) annotation (Line(points={{287,18},{290,18},{290,
          12},{281,12},{281,14}}, color={0,0,127}));
  connect(syn11.pm0, syn11.pm) annotation (Line(points={{249,-38},{254,-38},{
          254,-44},{243,-44},{243,-42}}, color={0,0,127}));
  connect(syn8.pm0, syn8.pm) annotation (Line(points={{328,153},{328,154},{334,
          154},{334,147},{332,147}}, color={0,0,127}));
  connect(syn10.p, B28.p[1]) annotation (Line(points={{276,36},{276,46},{266,46},{266,54}},
                     color={0,0,255}));
  connect(syn7.pm0, syn7.pm) annotation (Line(points={{4,129},{4,132},{12,132},
          {12,123},{8,123}},color={0,0,127}));
  connect(syn6.pm0, syn6.pm) annotation (Line(points={{-242,155},{-242,158},{-236,
          158},{-236,149},{-238,149}}, color={0,0,127}));
  connect(syn5.pm0, syn5.pm) annotation (Line(points={{-299,-114},{-298,-114},{
          -298,-122},{-305,-122},{-305,-118}}, color={0,0,127}));
  connect(syn4.pm0, syn4.pm) annotation (Line(points={{-250,-149},{-250,-152},{
          -258,-152},{-258,-143},{-254,-143}}, color={0,0,127}));
  connect(syn3.pm0, syn3.pm) annotation (Line(points={{-156,-157},{-156,-162},{
          -164,-162},{-164,-151},{-160,-151}}, color={0,0,127}));
  connect(syn2.pm0, syn2.pm) annotation (Line(points={{-62,-153},{-62,-158},{-68,
          -158},{-68,-147},{-66,-147}}, color={0,0,127}));
  connect(syn1.pm0, syn1.pm) annotation (Line(points={{30,-159},{30,-166},{16,-166},
          {16,-153},{26,-153}}, color={0,0,127}));
  connect(syn12.vf0, syn12.vf) annotation (Line(points={{283,-136},{280,-136},{
          280,-140},{289,-140},{289,-140}}, color={0,0,127}));
  connect(syn12.pm0, syn12.pm) annotation (Line(points={{305,-136},{310,-136},{
          310,-140},{299,-140},{299,-140}}, color={0,0,127}));
  connect(infiniteBus.p, B1.n[1]) annotation (Line(points={{148,-148},{180,-148},
          {180,-152},{208,-152},{208,-136}}, color={0,0,255}));
  connect(syn3.p, B13.p[1]) annotation (Line(points={{-138,-146},{-130,-146},{-130,-120},{-122,-120}},
                              color={0,0,255}));
  connect(Line16_17.n, B16.p[1]) annotation (Line(points={{-196,-35},{-196,-35},{-196,-20},{-194,-20}},
                                  color={0,0,255}));
  connect(pwFault.p, B26.p[4]) annotation (Line(points={{137,92},{124,92},{124,108},{88.1,108}},
                            color={0,0,255}));
  connect(B16.n[2], Line16_19.p) annotation (Line(points={{-200.6,-16},{-200.6,22},{-227,22}},
                          color={0,0,255}));
  connect(twoWindingTransformer2.n, B7.p[2]) annotation (Line(points={{-27,-74},{-20,-74},{-20,-54},{-18.6,-54},{-18.6,-46}},
                                                        color={0,0,255}));
  connect(staticCondenser.p, B32.n[2]) annotation (Line(points={{175.4,136.12},{206,136.12},{206,133.4},{210,133.4}},
                                                 color={0,0,255}));
  connect(Line26_27.p, B27.n[2]) annotation (Line(points={{165,116},{178,116},{178,104},{189.4,104},{189.4,96}},
                                            color={0,0,255}));
  connect(Line2326_2.n, B23.n[2]) annotation (Line(points={{98,75},{100,75},{100,64},{98,64}},
                             color={0,0,255}));
  connect(Line2326_1.n, B23.n[3])
    annotation (Line(points={{74,75},{89.2,75},{89.2,64}}, color={0,0,255}));
  connect(line56_1.n, B5.n[4])
    annotation (Line(points={{67,6},{96.1,6},{96.1,4}}, color={0,0,255}));
  connect(Line2_4.p, B2.n[2]) annotation (Line(points={{144,-69},{154,-69},{164,-69},{164,-70},{164,-80},{162,-80}},
                                               color={0,0,255}));
  connect(voltDependant2.p, B2.n[3]) annotation (Line(points={{124,-78},{126,-78},{126,-72},{153.2,-72},{153.2,-80}},
                                              color={0,0,255}));
  connect(B11.n[3], Line11_16.p) annotation (Line(points={{-84,7.2},{-102,7.2},{-102,22},{-123,22}},
                                color={0,0,255}));
  connect(Line19_21.n, B19.n[2]) annotation (Line(points={{-284,15},{-278,15},{-278,-4},{-272.6,-4},{-272.6,-10}},
                                              color={0,0,255}));
  connect(aVR3.vf0, syn3.vf0) annotation (Line(points={{-178,-154},{-178,-154},
          {-178,-166},{-170,-166},{-170,-130},{-156,-130},{-156,-135}}, color={
          0,0,127}));
  connect(aVR3.vref0, aVR3.vref) annotation (Line(points={{-178,-130},{-180,-130},
          {-180,-124},{-180,-126},{-196,-126},{-196,-136},{-190,-136}}, color={
          0,0,127}));
  connect(syn2.vf0, aVR2.vf0) annotation (Line(points={{-62,-131},{-64,-131},{-64,
          -124},{-64,-174},{-80,-174},{-80,-150},{-84,-150}}, color={0,0,127}));
  connect(aVR2.vref, aVR2.vref0) annotation (Line(points={{-96,-132},{-102,-132},
          {-102,-126},{-84,-126}}, color={0,0,127}));
  connect(syn1.vf0, aVR1.vf0) annotation (Line(points={{30,-137},{28,-137},{28,
          -124},{-22,-124},{-22,-182},{8,-182},{8,-156}}, color={0,0,127}));
  connect(aVR1.vref, aVR1.vref0) annotation (Line(points={{-4,-138},{-10,-138},
          {-10,-136},{-10,-132},{8,-132}}, color={0,0,127}));
  connect(aVR4.vf0, syn4.vf0) annotation (Line(points={{-272,-146},{-270,-146},
          {-270,-166},{-270,-170},{-294,-170},{-294,-116},{-250,-116},{-250,-127}},
        color={0,0,127}));
  connect(aVR4.vref, aVR4.vref0) annotation (Line(points={{-284,-128},{-288,-128},
          {-288,-126},{-288,-122},{-272,-122}}, color={0,0,127}));
  connect(syn5.vf0, aVR5.vf0) annotation (Line(points={{-321,-114},{-338,-114},
          {-338,-160},{-300,-160},{-300,-136}}, color={0,0,127}));
  connect(aVR5.vref, aVR5.vref0) annotation (Line(points={{-318,-148},{-318,-156},
          {-330,-156},{-330,-136},{-324,-136}}, color={0,0,127}));
  connect(syn6.vf0, aVR6.vf0) annotation (Line(points={{-242,133},{-242,126},{-178,
          126},{-178,172},{-214,172},{-214,164}}, color={0,0,127}));
  connect(aVR6.vref, aVR6.vref0) annotation (Line(points={{-202,146},{-188,146},
          {-188,138},{-188,130},{-214,130},{-214,140}}, color={0,0,127}));
  connect(syn7.vf0, aVR7.vf0) annotation (Line(points={{4,107},{6,107},{6,98},{
          6,86},{50,86},{50,148},{32,148},{32,138}}, color={0,0,127}));
  connect(aVR7.vref, aVR7.vref0) annotation (Line(points={{44,120},{44,120},{44,
          114},{44,110},{32,110},{32,114}}, color={0,0,127}));
  connect(aVR11.vref, aVR11.vref0) annotation (Line(points={{234,-70},{226,-70},
          {226,-64},{218,-64},{218,-58},{228,-58}}, color={0,0,127}));
  connect(syn11.vf0, aVR11.vf0) annotation (Line(points={{227,-38},{218,-38},{
          218,-40},{208,-40},{208,-90},{258,-90},{258,-58},{252,-58}}, color={0,
          0,127}));
  connect(syn9.vf0, aVR9.vf0) annotation (Line(points={{350,-23},{350,-46},{406,
          -46},{406,14},{378,14},{378,8}}, color={0,0,127}));
  connect(aVR9.vref0, aVR9.vref) annotation (Line(points={{378,-16},{382,-16},{
          382,-20},{390,-20},{390,-10}}, color={0,0,127}));
  connect(aVR10.vref, aVR10.vref0) annotation (Line(points={{272,-14},{272,-26},
          {266,-26},{266,-2}}, color={0,0,127}));
  connect(syn10.vf0, aVR10.vf0) annotation (Line(points={{265,18},{308,18},{308,
          -2},{290,-2}}, color={0,0,127}));
  connect(syn8.vf0, aVR8.vf0) annotation (Line(points={{328,131},{328,124},{384,
          124},{384,170},{356,170},{356,160}}, color={0,0,127}));
  connect(aVR8.vref, aVR8.vref0) annotation (Line(points={{368,142},{368,134},{
          356,134},{356,136}}, color={0,0,127}));
  connect(twoWindingTransformer12.n, B32.p[1]) annotation (Line(points={{239,140},{226,140},{226,140},{214,140}}, color={0,0,255}));
  connect(Line6_7.n, B7.n[1]) annotation (Line(points={{2,-25},{2,-34},{-12,-34},{-12,-42}}, color={0,0,255}));
  connect(Line1_2.n, B2.p[1]) annotation (Line(points={{198,-99},{198,-92},{162,-92},{162,-84}}, color={0,0,255}));
  connect(Line6_11.n, B11.p[1]) annotation (Line(points={{-41,18},{-60,18},{-60,22.6},{-80,22.6}}, color={0,0,255}));
  connect(Line7_1.n, B11.p[2]) annotation (Line(points={{-66,-21},{-68,-21},{-68,9.4},{-80,9.4}}, color={0,0,255}));
  connect(twoWindingTransformer1.n, B5.p[1]) annotation (Line(points={{131,-7.2},{106,-7.2},{106,0}}, color={0,0,255}));
  connect(twoWindingTransformer7.p, B19.p[1]) annotation (Line(points={{-292,-35},{-266,-35},{-266,-14}}, color={0,0,255}));
  connect(Line5_23.p, B23.p[1]) annotation (Line(points={{100,47},{100,60},{98,60}}, color={0,0,255}));
  connect(Line26_31.n, B26.n[1]) annotation (Line(points={{94,123},{96,123},{96,112},{104.6,112}}, color={0,0,255}));
  connect(Line26_27.n, B26.n[2]) annotation (Line(points={{147,116},{100,116},{100,112},{91.4,112}}, color={0,0,255}));
  connect(twoWindingTransformer10.n, B27.p[1]) annotation (Line(points={{227,78},{210,78},{210,80},{196,80},{196,92}}, color={0,0,255}));
  annotation(Diagram(coordinateSystem(extent={{-360,-180},{400,180}},
          preserveAspectRatio=false), graphics={Text(
          extent={{132,-90},{132,-80}},
          lineColor={0,0,0},
          textString="B2",
          textStyle={TextStyle.Bold}),Text(
          extent={{244,-144},{244,-134}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B1"),Text(
          extent={{312,-94},{312,-84}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B3"),Text(
          extent={{172,-40},{172,-30}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B4"),Text(
          extent={{140,-4},{140,6}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B5"),Text(
          extent={{10,44},{10,54}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B6"),Text(
          extent={{-72,44},{-72,54}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B11"),Text(
          extent={{24,-52},{24,-42}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B7"),Text(
          extent={{-4,-98},{-4,-88}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B8"),Text(
          extent={{94,-88},{94,-78}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B9"),Text(
          extent={{94,-128},{94,-118}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B10"),Text(
          extent={{-74,-66},{-74,-56}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B12"),Text(
          extent={{-84,-126},{-84,-116}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B13"),Text(
          extent={{-126,88},{-126,98}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B14"),Text(
          extent={{-40,142},{-40,152}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B15"),Text(
          extent={{-152,-22},{-152,-12}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B16"),Text(
          extent={{-178,-72},{-178,-62}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B17"),Text(
          extent={{-192,-118},{-192,-108}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B18"),Text(
          extent={{-316,-18},{-316,-8}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B19"),Text(
          extent={{-298,60},{-298,72}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B21"),Text(
          extent={{-250,112},{-250,122}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B22"),Text(
          extent={{-274,-80},{-274,-70}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B20"),Text(
          extent={{62,58},{62,68}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B23"),Text(
          extent={{60,106},{60,116}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B26"),Text(
          extent={{56,152},{56,162}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B31"),Text(
          extent={{156,38},{156,48}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B24"),Text(
          extent={{214,2},{214,12}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B25"),Text(
          extent={{162,84},{162,94}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B27"),Text(
          extent={{234,56},{234,66}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B28"),Text(
          extent={{342,100},{342,110}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B29"),Text(
          extent={{362,20},{362,30}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B30"),Text(
          extent={{216,166},{216,176}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B32"),Text(
          extent={{288,166},{288,176}},
          lineColor={0,0,0},
          textStyle={TextStyle.Bold},
          textString="B33")}),
    experiment(
      StopTime=10,
      Interval=0.001,
      Tolerance=1e-006),
Documentation(info="<html>
<p>This example is composed by the 33-bus 12-machine system representing a distribution-level subsystem of Norway.</p>
<p>The system undergoes a three-phase fault on Bus 26 at 1s, lasting for 20ms. Simulate the system for 10 seconds.</p>
<p>Variables of interest are the voltages in many buses. For example:</p>
<ul>
<li><code>B3.v</code></li>
<li><code>B11.v</code></li>
<li><code>B26.v</code></li>
</ul>
</html>", revisions="<html>

</html>"));
end Grid_Model;
