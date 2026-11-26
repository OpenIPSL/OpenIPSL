within OpenIPSL.Tests.Branches.PSSE;
model TwoWindingTransformer "Simple SMIB system for testing two-winding transformer functionality"
  extends BaseClasses.SMIB(
    gENCLS(P_0=10043038.215919, Q_0=25816529.8776857),
    constantLoad(v_0=0.974183701812906, angle_0=-0.0101768554317619),
    GEN1(v_0=0.947270629833985, angle_0=0.0767017214541097),
    FAULT(v_0=0.98707907418053, angle_0=-0.00502188603554991));
  extends Modelica.Icons.Example;
  OpenIPSL.Electrical.Machines.PSSE.GENSAL gENSAL(
    Tpd0=5,
    D=0,
    Xppd=0.2,
    Xl=0.12,
    Xppq=0.2,
    Tppd0=0.05,
    Tppq0=0.1,
    H=4,
    Xd=1.41,
    Xq=1.35,
    Xpd=0.3,
    S10=0.1,
    S12=0.5,
    R_a=0.002,
    angle_0=0.189139609765807,
    M_b=100000000,
    P_0=40000000,
    Q_0=-7208886.69389233,
    v_0=1,
    V_b=14700) annotation (Placement(transformation(extent={{-92,-12},{-68,12}})));
  OpenIPSL.Electrical.Branches.PSSE.TwoWindingTransformer twoWindingTransformer(
    CZ=1,
    R=0.001,
    X=0.2,
    G=0,
    B=0,
    S_n=1000000,
    ANG1= 0.017453292519943,
    VB1=14700,
    VB2=130000,
    t1=0.8085,
    VNOM1=20000,
    t2=1.02,
    VNOM2=130000,
    CW=3) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(gENSAL.PMECH, gENSAL.PMECH0) annotation (Line(points={{-94.4,6},{-100,6},{-100,20},{-62,20},{-62,6},{-66.8,6}},
                                                       color={0,0,127}));
  connect(gENSAL.EFD, gENSAL.EFD0) annotation (Line(points={{-94.4,-6},{-100,-6},{-100,-20},{-62,-20},{-62,-6},{-66.8,-6}},
                                                       color={0,0,127}));
  connect(twoWindingTransformer.n, GEN1.p) annotation (Line(points={{-39,0},{-30,0}}, color={0,0,255}));
  connect(gENSAL.p, twoWindingTransformer.p) annotation (Line(points={{-68,0},{-64,0},{-64,0},{-61,0}}, color={0,0,255}));
  annotation (experiment(StopTime=10), Documentation(info="<html>
<p>A machine behind a step-up transformer on the network of
<a href=\"modelica://OpenIPSL.Tests.BaseClasses.SMIB\">SMIB</a>. The transformer has off-nominal ratios on both
windings, given in pu of the nominal winding voltages (<code>CW=3</code>), and a phase shift of 1 degree
(<code>ANG1</code>, in radians).</p>
<p>The transformer changes the power flow of the base class, so its power flow data is modified here: the data
of the infinite bus, of the load and of the buses <code>GEN1</code> and <code>FAULT</code>, with the machine's
data, is the PSS/E power flow of this network with the machine's bus held at 1 pu and 40 MW. Angles are in
radians, the unit of <code>angle_0</code>. The test starts in steady state on it: the transformer model and
PSS/E agree on these ratios and this phase shift. The fault of the base class acts at 2 s.</p>
</html>"));
end TwoWindingTransformer;
