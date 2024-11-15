within OpenIPSL.Electrical.ThreePhase.Branches.MonoTri.MonoTriFcn;
function NegZerFilter "Calculation of negative, and zero-sequence filters used in Norton equivalent."
  extends Modelica.Icons.Function;
  input Real[1, 18] Z;
  output Real[1, 18] Y;

  // Getting data for the positive filter
protected
  Real g0=1;
  Real b0=0;
  Real g1=0;
  Real b1=0;
  Real g2=1;
  Real b2=0;

  // Writing the positive filter matrix
  Real c11=(g0 + g1 + g2)/3;
  Real d11=(b0 + b1 + b2)/3;
  Real c12=(2*g0 - g1 - b1*sqrt(3) - g2 + b2*sqrt(3))/6;
  Real d12=(2*b0 + g1*sqrt(3) - b1 - g2*sqrt(3) - b2)/6;
  Real c13=(2*g0 - g1 + b1*sqrt(3) - g2 - b2*sqrt(3))/6;
  Real d13=(2*b0 - g1*sqrt(3) - b1 + g2*sqrt(3) - b2)/6;
  Real c21=c13;
  Real d21=d13;
  Real c22=c11;
  Real d22=d11;
  Real c23=c12;
  Real d23=d12;
  Real c31=c12;
  Real d31=d12;
  Real c32=c13;
  Real d32=d13;
  Real c33=c11;
  Real d33=d11;

  // Getting the elements of matrix Z (zii = rii +j*xii)
  Real r11=Z[1, 1];
  Real x11=Z[1, 2];
  Real r12=Z[1, 3];
  Real x12=Z[1, 4];
  Real r13=Z[1, 5];
  Real x13=Z[1, 6];
  Real r21=Z[1, 7];
  Real x21=Z[1, 8];
  Real r22=Z[1, 9];
  Real x22=Z[1, 10];
  Real r23=Z[1, 11];
  Real x23=Z[1, 12];
  Real r31=Z[1, 13];
  Real x31=Z[1, 14];
  Real r32=Z[1, 15];
  Real x32=Z[1, 16];
  Real r33=Z[1, 17];
  Real x33=Z[1, 18];

  // Getting the result for F*Z = Y (yii = gii + j*bii)
  Real g11=c11*r11 - d11*x11 + c12*r21 - d12*x21 + c13*r31 - d13*x31;
  Real b11=c11*x11 + d11*r11 + c12*x21 + d12*r21 + c13*x31 + d13*r31;
  Real g12=c11*r12 - d11*x12 + c12*r22 - d12*x22 + c13*r32 - d13*x32;
  Real b12=c11*x12 + d11*r12 + c12*x22 + d12*r22 + c13*x32 + d13*r32;
  Real g13=c11*r13 - d11*x13 + c12*r23 - d12*x23 + c13*r33 - d13*x33;
  Real b13=c11*x13 + d11*r13 + c12*x23 + d12*r23 + c13*x33 + d13*r33;
  Real g21=c21*r11 - d21*x11 + c22*r21 - d22*x21 + c23*r31 - d23*x31;
  Real b21=c21*x11 + d21*r11 + c22*x21 + d22*r21 + c23*x31 + d23*r31;
  Real g22=c21*r12 - d21*x12 + c22*r22 - d22*x22 + c23*r32 - d23*x32;
  Real b22=c21*x12 + d21*r12 + c22*x22 + d22*r22 + c23*x32 + d23*r32;
  Real g23=c21*r13 - d21*x13 + c22*r23 - d22*x23 + c23*r33 - d23*x33;
  Real b23=c21*x13 + d21*r13 + c22*x23 + d22*r23 + c23*x33 + d23*r33;
  Real g31=c31*r11 - d31*x11 + c32*r21 - d32*x21 + c33*r31 - d33*x31;
  Real b31=c31*x11 + d31*r11 + c32*x21 + d32*r21 + c33*x31 + d33*r31;
  Real g32=c31*r12 - d31*x12 + c32*r22 - d32*x22 + c33*r32 - d33*x32;
  Real b32=c31*x12 + d31*r12 + c32*x22 + d32*r22 + c33*x32 + d33*r32;
  Real g33=c31*r13 - d31*x13 + c32*r23 - d32*x23 + c33*r33 - d33*x33;
  Real b33=c31*x13 + d31*r13 + c32*x23 + d32*r23 + c33*x33 + d33*r33;

algorithm
  // The output value receive the filtered value
  Y := [g11, b11, g12, b12, g13, b13, g21, b21, g22, b22, g23, b23, g31, b31,
    g32, b32, g33, b33];
annotation (
Documentation(info="<html>
<p>This function calculates negative-, and zero-sequece impedance filters used in hybrid components.
The filters are used as a negative-, and zero-sequece Norton equivalent admittances, representing the single-phase equivalent seen from the three-phase side.</p>
</html>"));
end NegZerFilter;
