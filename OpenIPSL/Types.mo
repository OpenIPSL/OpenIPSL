within OpenIPSL;
package Types "Library specific type definitions"
  extends Modelica.Icons.TypesPackage;
  type Voltage = SI.Voltage(nominal = 1e4, displayUnit = "kV");
  type Current = SI.Current(nominal = 1e4, displayUnit = "kA");
  type ActivePower = SI.ActivePower(nominal = 1e8, displayUnit = "MW");
  type ReactivePower = SI.ReactivePower(nominal = 1e8, displayUnit = "Mvar");
  type Power = SI.Power(nominal = 1e8, displayUnit = "MW");
  type ApparentPower = SI.ApparentPower(nominal = 1e8, displayUnit = "MVA");
  type Angle = SI.Angle(displayUnit="deg");
  type AngularVelocity = SI.AngularVelocity;
  type Frequency = SI.Frequency;
  type Resistance = SI.Resistance;
  type Reactance = SI.Reactance;
  type Conductance = SI.Conductance;
  type Susceptance = SI.Susceptance;
  type Impedance = SI.Impedance;
  type PerUnit = SI.PerUnit;
  type Time = SI.Time;
  type TimeAging = SI.TimeAging;
  operator record ComplexVoltage = SI.ComplexVoltage(re(nominal = 1e4, displayUnit="kV"), im(nominal = 1e4, displayUnit="kV")) "Voltage phasor in cartesian representation";
  operator record ComplexCurrent = SI.ComplexCurrent(re(nominal = 1e4, displayUnit="kA"), im(nominal = 1e4, displayUnit="kA")) "Current phasor in cartesian representation";
  operator record ComplexAdmittance = SI.ComplexAdmittance "Admittance in cartesian representation";
  operator record ComplexImpedance = SI.ComplexImpedance "Impedance in cartesian representation";
  operator record ComplexPower = SI.ComplexPower(re(nominal = 1e8, displayUnit="MW"), im(nominal = 1e8, displayUnit="MVA")) "Active and Reactive powers in cartesian representation";
  operator record ComplexPerUnit = Complex(re(unit = "1"), im(unit = "1")) "Per unit record for phasor in cartesian representation";
  type Ctrl = enumeration(
      alpha "Control using the firing angle alpha",
      xTCSC "Control using reactance xTCSC")
       "Control type of the PSAT TCSC";
type DelayType = enumeration(
      FixedDelay
               "Fixed Delay",
      PadeDelay
              "Pade Delay") "Enumeration defining the delay type";
end Types;
