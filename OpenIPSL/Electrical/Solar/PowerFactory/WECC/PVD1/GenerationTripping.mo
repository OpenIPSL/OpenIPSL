within OpenIPSL.Electrical.Solar.PowerFactory.WECC.PVD1;
model GenerationTripping "Calculating the tripping response"
  parameter Real Lv0 "Tripping repose curve point 0";
  parameter Real Lv1 "Tripping repose curve point 1";
  parameter Real Lv2 "Tripping repose curve point 2";
  parameter Real Lv3 "Tripping repose curve point 3";
  parameter Real recov "Revovery amount for reconnection";
  parameter Real Tfilter=1e-2 "Best to set about the time step value for fixed-step solvers";
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput TrpLow annotation (Placement(transformation(origin={110,50}, extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput TrpHigh annotation (Placement(transformation(origin={110,-50}, extent={{-10,-10},{10,10}})));
  Real umin;
  Real umax;
initial equation
  umin = Lv1;
  umax = Lv2;
equation
  umin + Tfilter*der(umin) = if noEvent(u < umin and umin > Lv0) then u else umin "Tracking the minimum input constrained by Lv0";
  umax + Tfilter*der(umax) = if noEvent(u > umax and umax < Lv3) then u else umax "Tracking the maximum input constrained by the Lv3";
  
  if noEvent(u < Lv0) then
    TrpLow = 0.0 "Trip below threshold";
  elseif noEvent(u < Lv1) then
    TrpLow = (umin - Lv0 + (if noEvent(u <= umin) then 0 else recov*(u - umin)))/(Lv1 - Lv0);
  else
    TrpLow = if noEvent(umin >= Lv1) then 1.0 else (umin - Lv0 + recov*(Lv1 - umin))/(Lv1 - Lv0);
  end if;
  
  when (u <= Lv1) and (umin > Lv1) then
    reinit(umin, Lv1) "Handling the jump in TrpLow due to a delay in computing the minimum";
  end when;
  
  if noEvent(u > Lv3) then
    TrpHigh = 0 "Tripping for high values of the input signal";
  elseif noEvent(u > Lv2) then
    TrpHigh = (Lv3 - umax + (if noEvent(u >= umax) then 0 else recov*(umax - u)))/(Lv3 - Lv2);
  else
    TrpHigh = if noEvent(umax <= Lv2) then 1.0 else (Lv3 - umax + recov*(umax - Lv2))/(Lv3 - Lv2);
  end if;
 
  when (u >= Lv2) and (umax < Lv2) then
    reinit(umax, Lv2) "Handling the jump in TrpHihg due to a delay in computing the maximum";
  end when;
  annotation (Icon(graphics={
        Rectangle(
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,100},{100,-100}}),
        Text(
          origin={32,83},
          extent={{-132,7},{68,-13}},
          textString="%name",
          textColor={0,0,0}),
        Text(extent={{38,59},{98,40}}, textString="TripLow"),
        Text(extent={{38,-40},{98,-60}}, textString="TripHigh"),
        Text(extent={{-96,9},{-56,-10}}, textString="Input")}));
end GenerationTripping;
