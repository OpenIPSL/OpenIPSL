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
  parameter Real KQi=0.1 "Gain constant of first PI in DFIG electrical control model";
  parameter Real KVi=40 "Gain constant of second PI in DFIG electrical control model";
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
        origin={-77.9122,32.2584},
        extent={{-10.0,-10.0},{10.0,10.0}}),
      iconTransformation(
        origin={-110.0,0.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Modelica.Blocks.Interfaces.RealInput Wind_Speed annotation (Placement(
      transformation(
        origin={-80.0,60.0},
        extent={{-20.0,-20.0},{20.0,20.0}}),
      iconTransformation(
        origin={0.0,77.9903},
        extent={{-20.0,-20.0},{20.0,20.0}},
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
        origin={-46.6105,53.4541},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Electrical_Control.Electrical_Control electrical_Control1(
    ex_x0_0=ex_x0_0,
    ex_x1_0=ex_x1_0,
    KQi=KQi,
    qmax=qmax,
    qmin=qmin,
    KVi=KVi,
    xiqmax=xiqmax,
    xiqmin=xiqmin) annotation (Placement(transformation(
        origin={-10.0,57.46},
        extent={{-10.0,-10.0},{10.0,10.0}})));
  Generator.Generator generator1(
    freq=freq,
    ge_x0_0=ge_x0_0,
    ge_x1_0=ge_x1_0,
    ge_x2_0=ge_x2_0,
    GEN_base=GEN_base,
    Kpllp=Kpllp,
    Lpp=Lpp,
    SYS_base=SYS_base) annotation (Placement(transformation(
        origin={45.0,60.0},
        extent={{-10.0,-10.0},{10.0,10.0}})));
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
    Real lambda_sav;
    Real lambda;
    Boolean stop;
  algorithm
    last_err := 99999.0;
    lambda := 15 + 0.001;
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
          lambda_sav := lambda;
        else
          lambdaOUT := lambda_sav - last_err*(lambda - lambda_sav)/(new_err -
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
      origin={4.0293,37.8389},
      points={{-81.9415,-5.5805},{40.9707,-5.5805},{40.9707,11.1611}}));
  connect(generator1.Pgen, turbine_Model1.Pelec) annotation (Line(
      origin={-0.1428,48.5266},
      points={{53.1428,9.4734},{60.1428,9.4734},{60.1428,-8.085},{-59.4803,-8.085},
          {-59.4803,-1.38836},{-54.4677,-1.38836}},
      color={0,0,127}));
  connect(Wind_Speed, turbine_Model1.Wind_Speed) annotation (Line(
      origin={-62.4641,60.0491},
      points={{-17.5359,-0.0491},{4.8411,-0.0491},{4.8411,0.04919},{7.8536,
          0.04919}},
      color={0,0,127}));
  connect(turbine_Model1.Pord, electrical_Control1.Pord) annotation (Line(
      origin={-25.6589,60.1024},
      points={{-12.9516,-0.01612},{2.6464,-0.01612},{2.6464,0.0162},{7.6589,
          0.0162}},
      color={0,0,127}));
  connect(const.y, electrical_Control1.Qord) annotation (Line(
      origin={-25.1902,68.958},
      points={{-14.3805,1.7491},{7.1902,1.7491},{7.1902,-3.498}},
      color={0,0,127}));
  P = generator1.Pgen*GEN_base/SYS_base;
  Q = generator1.Qgen*GEN_base/SYS_base;
  connect(electrical_Control1.Ipcmd, generator1.Ipcmd) annotation (Line(
      origin={24.7437,65.082},
      points={{-26.7437,-0.08283},{7.2437,-0.08283},{7.2437,0.0828},{12.2563,
          0.0828}},
      color={0,0,127}));
  connect(electrical_Control1.Efd, generator1.Efd) annotation (Line(
      origin={24.7437,56.5275},
      points={{-26.7437,2.18767},{7.2437,2.18767},{7.2437,-2.18767},{12.2563,-2.18767}},
      color={0,0,127}));

  connect(generator1.Qgen, electrical_Control1.Qgen) annotation (Line(
      origin={26.605,49.271},
      points={{26.395,4.729},{31.4075,4.729},{31.4075,-4.8235},{-44.605,-4.8235},
          {-44.605,0.189}},
      color={0,0,127}));
  connect(generator1.Vt, electrical_Control1.Vterm) annotation (Line(
      origin={17.5,65.2993},
      points={{35.5,2.12607},{40.5125,2.12607},{40.5125,7.7132},{-40.5125,
          7.7132},{-40.5125,-9.8393},{-35.5,-9.8393}},
      color={0,0,127}));
  annotation (
    Icon(coordinateSystem(
        extent={{-100.0,-100.0},{100.0,100.0}},
        preserveAspectRatio=true,
        grid={10,10}), graphics={Ellipse(
          fillColor={255,255,255},
          extent={{-100.0,-100.0},{100.0,100.0}}),Text(
          origin={0.0,16.6286},
          fillPattern=FillPattern.Solid,
          extent={{-44.8085,-23.3714},{44.8085,23.3714}},
          textString="DFIG",
          fontName="Arial"),Text(
          origin={0.0,-17.9447},
          fillPattern=FillPattern.Solid,
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
