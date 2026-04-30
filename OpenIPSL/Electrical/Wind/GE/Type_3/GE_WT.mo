within OpenIPSL.Electrical.Wind.GE.Type_3;
model GE_WT "Type 3 wind turbine machine from GE"
  import Modelica.Constants.pi;
  import Modelica.Constants.eps;
  parameter Types.PerUnit _V0=1.03 "Terminal Voltage from Power Flow";
  parameter Types.Angle _Ang0=0.00735136412 "Terminal Angle from Power Flow";
  parameter Types.ActivePower _P0=162000000 "Active Power from Power Flow";
  parameter Types.ReactivePower _Q0=-37049223.1185345 "Reactive Power from Power Flow";
  parameter Types.ApparentPower GEN_base=180000000 "Base Power from the Electrical Generator";
  parameter Types.ApparentPower WT_base=162000000 "Base Power from the Turbine";
  parameter Types.ApparentPower SYS_base=100000000 "Base Power from the power system";
  parameter Types.ApparentPower Qbase=50000000 "Base reactive power in var";
  parameter Types.Frequency freq=60 "Steady state Frequency of the power system";
  parameter Integer poles=3 "Number of pole pairs";
  parameter Types.Time Tp=0.3 "Time Constant Pitch command";
  parameter Real Kpp=150.0 "Pitch Control gain";
  parameter Real Kip=25.0 "Gain of integrator of Pitch Control";
  parameter Real Kpc=3.0 "Pitch Compensation gain";
  parameter Real Kic=30.0 "Gain of integrator of Pitch Compensation";
  parameter Types.Angle pimax=0.47123889803 "Maximum pitch angle";
  parameter Types.Angle pimin=0.0 "minimum pitch angle";
  parameter Types.TimeAging pirat=10.0 "maximum variation rate of pitch angle";
  parameter Types.PerUnit pwmax=1.12 "Maximal power taken from the wind";
  parameter Types.PerUnit pwmin=0.1 "Minimal power taken from the wind";
  parameter Types.TimeAging pwrat=0.45 "maximum variation rate of power taken from the wind";
  parameter Real Kptrq=3.0 "Gain Torque Controller";
  parameter Real Kitrq=0.6 "Gain of integrator of Torque Controller";
  parameter Types.Time Tpc=0.05 "Time Constant Torque controller";
  parameter Types.PerUnit KQi=0.1 "Gain constant of first PI in DFIG electrical control model.";
  parameter Types.PerUnit KVi=0.4 "Gain constant of second PI in DFIG electrical control model.";
  parameter Types.PerUnit xiqmax=0.4 "Up saturation of second PI in DFIG electrical control model";
  parameter Types.PerUnit xiqmin=-0.5 "Down saturation of second PI in DFIG electrical control model";
  parameter Real Kpllp=30;
  parameter Types.PerUnit Xpp=0.8;
  parameter Types.PerUnit qmax=0.312;
  parameter Types.PerUnit qmin=-0.436;
  parameter Integer nmass=2 "Mono-mass or Two-mass model";
  parameter Types.Time Hg=0.62 "Inertia 2";
  parameter Types.Time H=4.33 "Inertia";
  parameter Real Ktg=1.11 "Gain for 2 mass model";
  parameter Real Dtg=1.5 "Damping";
  parameter Real Kl=56.6;
  Types.ActivePower P "Active Power produced in SYS_base";
  Types.ReactivePower Q "Reactive Power produced in SYS_base";
  OpenIPSL.Interfaces.PwPin pwPin1 annotation (Placement(
      transformation(
        origin={137.088,52.2584},
        extent={{-10,-10},{10,10}}),
      iconTransformation(
        origin={-110,0},
        extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealInput Wind_Speed annotation (Placement(
      transformation(
        origin={-100,60},
        extent={{-20,-20},{20,20}}),
      iconTransformation(
        origin={0,77.9903},
        extent={{-20,-20},{20,20}},
        rotation=-90)));
  Turbine.Turbine_Model turbine_Model1(
    GEN_base=GEN_base,
    Kic=Kic,
    Kip=Kip,
    Kitrq=Kitrq,
    Kpc=Kpc,
    Kpp=Kpp,
    Kptrq=Kptrq,
    pimax=pimax,
    pimin=pimin,
    pirat=pirat,
    pwmax=pwmax,
    pwmin=pwmin,
    pwrat=pwrat,
    Tp=Tp,
    Tpc=Tpc,
    wt_x0_0=wt_x0_0,
    wt_x1_0=wt_x1_0,
    wt_x2_0=wt_x2_0,
    wt_x3_0=wt_x3_0,
    wt_x4_0=wt_x4_0,
    wt_x5_0=wt_x5_0,
    wt_x6_0=wt_x6_0,
    wt_x7_0=wt_x7_0,
    wt_x8_0=wt_x8_0,
    wt_x9_0=wt_x9_0,
    WT_base=WT_base,
    Dtg=Dtg,
    H=H,
    Hg=Hg,
    KI=Kl,
    Ktg=Ktg,
    wndtge_kp=wndtge_kp,
    wbase=wbase,
    wndtge_ang0=wndtge_ang0,
    wndtge_spd0=wndtge_spd0) annotation (Placement(transformation(
        origin={-66.6105,53.4541},
        extent={{-10,-10},{10,10}})));
  Electrical_Control.Electrical_Control electrical_Control1(
    ex_x0_0=ex_x0_0,
    ex_x1_0=ex_x1_0,
    KQi=KQi,
    qmax=qmax,
    qmin=qmin,
    KVi=KVi,
    xiqmax=xiqmax,
    xiqmin=xiqmin, Qbase = Qbase) annotation (Placement(transformation(
        origin={0,57.46},
        extent={{-10,-10},{10,10}})));
  Generator.Generator generator1(
    freq=freq,
    ge_x0_0=ge_x0_0,
    ge_x1_0=ge_x1_0,
    ge_x2_0=ge_x2_0,
    GEN_base=GEN_base,
    Kpllp=Kpllp,
    Lpp=Lpp,
    SYS_base=SYS_base) annotation (Placement(transformation(
        origin={40,60},
        extent={{-10,-10},{10,10}})));
protected
  function cp_init
    input Real lambda;
    input Real theta;
    output Real cp;
  protected
    Real[5, 1] lambda_vec;
    Real[5, 1] theta_vec;
    Real[5, 1] prod;
    parameter Real[5, 5] coeff=[-0.41909, 0.21808, -0.012406, -0.00013365,
        0.000011524; -0.067606, 0.060405, -0.013934, 0.0010683, -0.000023895;
        0.015727, -0.010996, 0.0021495, -0.00014855, 0.0000027937; -0.00086018,
        0.00057051, -0.00010479, 0.0000059924, -0.000000089194; 0.000014788, -0.0000094839,
        0.0000016167, -0.000000071535, 0.00000000049686];
  algorithm
    lambda_vec := [1; lambda; lambda^2; lambda^3; lambda^4];
    theta_vec := [1; theta; theta^2; theta^3; theta^4];
    prod := coeff*lambda_vec;
    cp := prod[1, 1]*theta_vec[1, 1] + prod[2, 1]*theta_vec[2, 1] + prod[3, 1]*
      theta_vec[3, 1] + prod[4, 1]*theta_vec[4, 1] + prod[5, 1]*theta_vec[5, 1];
  end cp_init;

  function get_Vw
    input Real pimin;
    input Real wndtge_kl;
    input Real wndtge_kp;
    input Real genbc_k_speed;
    input Real pmech;
    output Real lambdaOUT;
  protected
    Real cp;
    Real Vw;
    Real last_err;
    Real new_err;
    Real pwind;
    Real lambda_save;
    Real lambda;
    Boolean stop;
  algorithm
    last_err := 99999.0;
    lambda := 15 + 0.001;
    lambda_save := lambda "Added to rectify compilation issue"; 
    stop := false;
    while lambda >= 2.001 and not stop loop
      lambda := lambda - 0.001;
      cp := cp_init(lambda, pimin);
      Vw := wndtge_kl*genbc_k_speed/lambda;
      pwind := wndtge_kp*cp*Vw^3;
      new_err := pwind - pmech;
      if abs(new_err) <= 0.01 then
        lambdaOUT := lambda;
        stop := true;
      else
        if abs(new_err - last_err) < abs(new_err + last_err) or last_err >
            90000.0 then
          last_err := new_err;
          lambda_save := lambda "Allocate lambda to the saved value";
        else
          lambdaOUT := lambda_save - last_err*(lambda - lambda_save)/(new_err -
            last_err);
          cp := cp_init(lambdaOUT, 0.0);
          Vw := wndtge_kl*genbc_k_speed/lambdaOUT;
          stop := true;
        end if;
      end if;
    end while;
  end get_Vw;

  function get_theta
    input Real lambda;
    input Real Vw;
    input Real wndtge_kl;
    input Real wndtge_kp;
    input Real genbc_k_speed;
    input Real pmech;
    input Real pimin;
    input Real pimax;
    output Real thetaOUT;
  protected
    Real Vw1;
    Real cp;
    Real last_err;
    Real new_err;
    Real pwind;
    Real theta_sav;
    Boolean stop;
    Real theta;
  algorithm
    last_err := 99999.0;
    theta := pimin - 0.005;
    theta_sav := theta "Angle saved.";
    stop := false;
    Vw1 := Vw;
    while theta <= pimax - 0.005 and not stop loop
      theta := theta + 0.005;
      cp := cp_init(lambda, theta);
      pwind := wndtge_kp*cp*Vw1^3;
      new_err := pwind - pmech;
      if abs(new_err) <= 0.01 then
        thetaOUT := theta;
        stop := true;
      else
        if abs(new_err - last_err) < abs(new_err + last_err) or last_err >
            90000 then
          last_err := new_err;
          theta_sav := theta;
        else
          thetaOUT := theta_sav - last_err*(theta - theta_sav)/(new_err -
            last_err);
          cp := cp_init(lambda, thetaOUT);
          Vw1 := wndtge_kl*genbc_k_speed/lambda;
          stop := true;
        end if;
      end if;
    end while;
  end get_theta;

  Modelica.Blocks.Sources.Constant const(k=qgen) annotation (Placement(transformation(
        origin={-44.2929,70.7071},
        extent={{-4.2929,-4.2929},{4.2929,4.2929}})));
  parameter Types.PerUnit Lpp=Xpp;
  parameter Real wbase=2*Modelica.Constants.pi*freq/poles;
  parameter Types.PerUnit pelec=_P0/WT_base;
  parameter Types.PerUnit pmech=pelec;
  parameter Types.PerUnit wt_x0_0(fixed=false);
  parameter Types.PerUnit wt_x1_0(fixed=false);
  parameter Types.PerUnit wt_x2_0(fixed=false);
  parameter Types.PerUnit wt_x3_0(fixed=false);
  parameter Types.PerUnit wt_x4_0(fixed=false);
  parameter Types.PerUnit wt_x5_0(fixed=false);
  parameter Types.PerUnit wt_x6_0(fixed=false);
  parameter Types.PerUnit wt_x7_0(fixed=false);
  parameter Types.PerUnit wt_x8_0(fixed=false);
  parameter Types.PerUnit wt_x9_0(fixed=false);
  parameter Types.PerUnit ex_x0_0(fixed=false);
  parameter Types.PerUnit ex_x1_0(fixed=false);
  parameter Types.PerUnit ge_x0_0(fixed=false);
  parameter Types.PerUnit ge_x1_0(fixed=false);
  parameter Types.PerUnit ge_x2_0(fixed=false);
  parameter Types.PerUnit qgen(fixed=false);
  parameter Types.Angle wndtge_ang0(fixed=false);
  parameter Real wndtge_spd0(fixed=false);
  parameter Real wndtge_spdwmx(fixed=false);
  parameter Real wndtge_spdwmn(fixed=false);
  parameter Real wndtge_kp(fixed=false) "Power coefficient";
  parameter Real cp(fixed=false);
  parameter Real theta(fixed=false);
  parameter Real Vw(fixed=false);
  parameter Real genbc_k_speed(fixed=false);
  parameter Real wndtge_spdw1(fixed=false);
  parameter Real wndtge_wn=0;
  parameter Real wndtge_m1=0;
  parameter Real wndtge_q11=0;
  parameter Real wndtge_q21=0;
  parameter Real lambda(fixed=false);
  parameter Integer masflg=1;
initial algorithm
  wndtge_spdwmx := 25.0 "Max. wind speed";
  wndtge_spdwmn := 3.0 "Min. wind speed";
  wndtge_spdw1 := 14.0;
  genbc_k_speed := 1.2;
  wndtge_kp := 0.00159;
  qgen := _Q0/GEN_base;
  ge_x0_0 := _V0 + _Q0/GEN_base*Lpp/_V0;
  ge_x1_0 := _P0/GEN_base/_V0;
  ge_x2_0 := _Ang0;
  ex_x0_0 := _V0;
  ex_x1_0 := ge_x0_0;
  wndtge_spd0 := if pmech < 0.75 then ((-0.67*pmech) + 1.42)*pmech + 0.51 else
    genbc_k_speed;
  theta := pimin;
  lambda := get_Vw(
    pimin,
    Kl,
    wndtge_kp,
    genbc_k_speed,
    pmech);
  lambda := lambda + 0.01;
  cp := cp_init(lambda, 0.0);
  Vw := Kl*genbc_k_speed/lambda;
  if wndtge_spdw1 > wndtge_spdwmx then
    wndtge_spdw1 := wndtge_spdwmx;
  end if;
  if wndtge_spdw1 < wndtge_spdwmn then
    wndtge_spdw1 := wndtge_spdwmn;
  end if;
  if pmech >= 1.0 and wndtge_spdw1 > Vw then
    Vw := wndtge_spdw1;
    lambda := Kl*genbc_k_speed/Vw;
    theta := get_theta(
      lambda,
      Vw,
      Kl,
      wndtge_kp,
      genbc_k_speed,
      pmech,
      pimin,
      pimax);
    cp := cp_init(lambda, theta);
    Vw := Kl*genbc_k_speed/lambda;
  end if;
  wndtge_kp := pmech/(cp*Vw^3);
  wt_x0_0 := theta;
  wt_x1_0 := if Kip <= C.eps then 0.0 else theta - Kpc*(pelec - 1.0);
  wt_x4_0 := pelec;
  wt_x2_0 := if Kitrq <= C.eps then 0.0 else wt_x4_0/genbc_k_speed;
  wt_x3_0 := 0.0;
  wt_x5_0 := genbc_k_speed;
  wt_x6_0 := 0.0;
  wt_x7_0 := if masflg == 3 then pmech/genbc_k_speed/(wndtge_wn*wndtge_wn*
    wndtge_m1)*(wndtge_q11 - wndtge_q21) else 0.0;
  wt_x8_0 := 0.0;
  wt_x9_0 := 0.0;
  wndtge_ang0 := -pmech/(Ktg*genbc_k_speed);
equation
  connect(pwPin1, generator1.p) annotation (Line(
      points = {{137, 52}, {137, 49}, {40, 49}}));
  connect(generator1.Pgen, turbine_Model1.Pelec) annotation (Line(
      points = {{48, 58}, {60, 58}, {60, 40.4416}, {-89.6231, 40.4416}, {-89.6231, 47}, {-75, 47}},
      color={0,0,127}));
  connect(Wind_Speed, turbine_Model1.Wind_Speed) annotation (Line(
      points = {{-100, 60}, {-75, 60}},
      color={0,0,127}));
  connect(const.y, electrical_Control1.Qord) annotation (Line(
      points = {{-39.5707, 70.7071}, {-39.5707, 65}, {-8, 65}},
      color={0,0,127}));
  P = generator1.Pgen*GEN_base/SYS_base;
  Q = generator1.Qgen*GEN_base/SYS_base;
  connect(electrical_Control1.Ipcmd, generator1.Ipcmd) annotation (Line(
      points = {{8, 65}, {31.9874, 65}, {31.9874, 130.082}, {56.7437, 130.082}},
      color={0,0,127}));
  connect(electrical_Control1.Efd, generator1.Efd) annotation (Line(
      points = {{8, 59}, {31.9874, 59}, {31.9874, 110.528}, {56.7437, 110.528}},
      color={0,0,127}));
  connect(turbine_Model1.Pord, electrical_Control1.Pord) annotation(
    Line(points = {{-59, 60}, {-8, 60}}, color = {0, 0, 127}));
  connect(generator1.Vt, electrical_Control1.Vterm) annotation(
    Line(points = {{48, 67}, {48, 75}, {-35, 75}, {-35, 55}, {-8, 55}}, color = {0, 0, 127}));
  connect(electrical_Control1.Qgen, generator1.Qgen) annotation(
    Line(points = {{-8, 49}, {-25, 49}, {-25, 80}, {65, 80}, {65, 54}, {48, 54}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        grid={10,10}), graphics={Ellipse(
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          origin={0.0,16.6286},
          extent={{-44.8085,-23.3714},{44.8085,23.3714}},
          textString="DFIG",
          fontName="Arial"),Text(
          origin={0.0,-17.9447},
          extent={{-25.6048,-15.9106},{25.6048,15.9106}},
          textString="GE",
          fontName="Arial")}),
    Diagram(coordinateSystem(
        extent={{-148.5,-105.0},{148.5,105.0}},
        preserveAspectRatio=true,
        grid={5,5})),
    Documentation(revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Reference</p></td>
<td><p>GE Wind Turbine Generator<a href=\"http://doi.org/10.1109/PES.2003.1267470\"> http://doi.org/10.1109/PES.2003.1267470</a></p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>2015-07</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p><a href=\"https://github.com/MaximeBaudette\">@MaximeBaudette</a></p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
</table>
</html>"));
end GE_WT;