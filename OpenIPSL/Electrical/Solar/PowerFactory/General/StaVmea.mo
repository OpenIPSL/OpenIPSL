within OpenIPSL.Electrical.Solar.PowerFactory.General;
model StaVmea "Voltage Measurement Device"
  parameter Types.Time Tfe=3/50 "Measurement delay" annotation (Dialog(enable=use_ref_machine_frequency));
  parameter Types.Frequency fn=50 "Nominal frequency";
  parameter Types.Angle angle_0=0 "Initial angle";
  parameter Boolean use_ref_machine_frequency=false "Use reference machine frequency" annotation (choices(checkBox=true));
  OpenIPSL.Interfaces.PwPin p annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  Real cosphi(start=cos(angle_0));
  Real sinphi(start=sin(angle_0));
  Types.Frequency df(start=0) "Frequency difference";
  Types.PerUnit vx "Voltage component";
  Types.PerUnit vy "Voltage component";
  Modelica.Blocks.Interfaces.RealOutput u "Voltage magnitude [pu]" annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput fe "Electrical frequency [Hz]" annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
  Modelica.Blocks.Interfaces.RealInput omega "Reference machine frequency [Hz]" annotation (Placement(transformation(extent={{-140,40},{-100,80}}))); 

protected
  Modelica.Blocks.Interfaces.RealInput omega_internal if use_ref_machine_frequency "Helping variable/connector"; 
  Modelica.Blocks.Interfaces.RealInput phi if use_ref_machine_frequency "Conditional angle."; 
  Modelica.Blocks.Interfaces.RealInput phi_internal if use_ref_machine_frequency "Helping variable/connector"; 
equation
  u = sqrt(p.vr^2 + p.vi^2) "Get the magnitude of the voltage phasor"; 
  connect(omega, omega_internal);
  connect(phi, phi_internal);
  
  if use_ref_machine_frequency then
    der(phi_internal) = 2*C.pi*fn*(omega_internal - 1) "First this has to be transformed to the rotating reference frame (w.r.t. the frequency of the reference machine) to correspond to PowerFactory implementation";
    vx = p.vr*cos(phi_internal) + p.vi*sin(phi_internal);
    vy = (-p.vr*sin(phi_internal)) + p.vi*cos(phi_internal);
    der(cosphi) = (vx/u - cosphi)/Tfe;
    der(sinphi) = (vy/u - sinphi)/Tfe;
    fe = omega_internal + df "Apply the calculation w.r.t provided frequency of synchronous machine";
  else
    vx = p.vr;
    vy = p.vi;
    der(cosphi) = (vx/u - cosphi)/Tfe;
    der(sinphi) = (vy/u - sinphi)/Tfe;
    fe = 1 + df "Apply the calculation w.r.t system base frequency";

  end if;
  if abs(cosphi) > abs(sinphi) then
    df = der(sinphi)/cosphi/(2*C.pi*fn);
  else
    df = -der(cosphi)/sinphi/(2*C.pi*fn);
  end if;
  p.ii = 0;
  p.ir = 0;
  annotation (Icon(graphics={
        Rectangle(
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,100},{100,-100}}),
        Text(extent={{70,70},{90,50}}, textString="u"),
        Text(extent={{70,-50},{90,-70}}, textString="fe"),
        Text(
          extent={{-100,20},{100,-20}},
          textColor={0,0,0},
          textString="%name")}), Documentation(info="<html>
<p>
StaVmea model in PowerFactory measures voltage and frequency.
The frequency in PowerFactory is computed with respect to the frame rotating with frequency
equal to the synchronous machine.
This is supported via the input <code>omega</code> here.
Most of the OpenIPSL examples do not provide <code>omega</code> of the reference machine and thus,
if the input is not connected the frequency is computed with respect to the 50&nbsp;Hz reference frame
and filtered to simulate the measurement delay.
</p>
</html>", revisions="<html>
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\"><tr>
<td><p>Model Name</p></td>
<td><p>StaVmea</p></td>
</tr>
<tr>
<td><p>Reference</p></td>
<td><p>PowerFactory Manual</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td><p>January 2021</p></td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Tin Rabuzin, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p>see <a href=\"modelica://OpenIPSL.UsersGuide.Contact\">UsersGuide.Contact</a></p></td>
</tr>
<tr>
<td><p>Model Verification</p></td>
<td><p>This model has not been verified against PowerFactory.</p></td>
</tr>
<tr>
<td><p>Description</p></td>
<td></td>
</tr>
</table>
</html>"));
end StaVmea;