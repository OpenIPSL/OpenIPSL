within OpenIPSL.Electrical.ThreePhase.Branches.MonoTri.LineFcn;
function MT_FiniteImpedance "Calculation of impedance matrices for hybrid line when finite values of Norton equivalent impedances are taken into account."
  extends Modelica.Icons.Function;
  import OpenIPSL.Electrical.ThreePhase.Branches.MonoTri.MonoTriFcn.Inverse;
  import OpenIPSL.Electrical.ThreePhase.Branches.MonoTri.MonoTriFcn.PositiveFilter;
  import OpenIPSL.Electrical.ThreePhase.Branches.MonoTri.MonoTriFcn.NegZerFilter;
  input Real[1, 18] Yser;
  input Real[1, 18] Yshtk;
  input Real[1, 18] Y012;
  output Real[1, 32] Y;

  // Getting data for the norton equivalent impedances
protected
  Real g0=Y012[1, 1];
  Real b0=Y012[1, 2];
  Real g1=Y012[1, 9];
  Real b1=Y012[1, 10];
  Real g2=Y012[1, 17];
  Real b2=Y012[1, 18];

  // Writing the Yabc norton equivalent matrix
  Real g11=(g0 + g1 + g2)/3;
  Real b11=(b0 + b1 + b2)/3;
  Real g12=(2*g0 - g1 + b1*sqrt(3) - g2 - b2*sqrt(3))/6;
  Real b12=(2*b0 - g1*sqrt(3) - b1 + g2*sqrt(3) - b2)/6;
  Real g13=(2*g0 - g1 - b1*sqrt(3) - g2 + b2*sqrt(3))/6;
  Real b13=(2*b0 + g1*sqrt(3) - b1 - g2*sqrt(3) - b2)/6;
  Real g21=g13;
  Real b21=b13;
  Real g22=g11;
  Real b22=b11;
  Real g23=g12;
  Real b23=b12;
  Real g31=g12;
  Real b31=b12;
  Real g32=g13;
  Real b32=b13;
  Real g33=g11;
  Real b33=b11;

  // Writing Yabc norton equivalent

  Real[1, 18] Yabcnrt=[g11, b11, g12, b12, g13, b13, g21, b21, g22,
      b22, g23, b23, g31, b31, g32, b32, g33, b33];

  // Writing the calculations for matrix that will be placed in parallel with Yshtm and the matrix that will replace Yser
  Real[1, 18] A=Yabcnrt + Yshtk;
  Real[1, 18] B=Inverse(A);
  Real[1, 18] C=Inverse(Yser);
  Real[1, 18] D=B + C;
  Real[1, 18] E=Inverse(D);
  Real[1, 18] Yshtm2=NegZerFilter(E);
  Real[1, 18] Ysernew=PositiveFilter(Yser);
  Real[1, 18] Yshtm=Yshtk;
  // Specifically in Transmission Line
  Real[1, 18] Yshtmnew=Yshtm + Yshtm2;

  // Now, we can calculate everything normally

  //Writing the Y_ser matrix
  Real Gaaser=Ysernew[1, 1];
  Real Baaser=Ysernew[1, 2];
  Real Gabser=Ysernew[1, 3];
  Real Babser=Ysernew[1, 4];
  Real Gacser=Ysernew[1, 5];
  Real Bacser=Ysernew[1, 6];
  Real Gbaser=Ysernew[1, 7];
  Real Bbaser=Ysernew[1, 8];
  Real Gbbser=Ysernew[1, 9];
  Real Bbbser=Ysernew[1, 10];
  Real Gbcser=Ysernew[1, 11];
  Real Bbcser=Ysernew[1, 12];
  Real Gcaser=Ysernew[1, 13];
  Real Bcaser=Ysernew[1, 14];
  Real Gcbser=Ysernew[1, 15];
  Real Bcbser=Ysernew[1, 16];
  Real Gccser=Ysernew[1, 17];
  Real Bccser=Ysernew[1, 18];
  //Writing the Y_sht matrix
  Real Gaasht=Yshtmnew[1, 1];
  Real Baasht=Yshtmnew[1, 2];
  Real Gabsht=Yshtmnew[1, 3];
  Real Babsht=Yshtmnew[1, 4];
  Real Gacsht=Yshtmnew[1, 5];
  Real Bacsht=Yshtmnew[1, 6];
  Real Gbasht=Yshtmnew[1, 7];
  Real Bbasht=Yshtmnew[1, 8];
  Real Gbbsht=Yshtmnew[1, 9];
  Real Bbbsht=Yshtmnew[1, 10];
  Real Gbcsht=Yshtmnew[1, 11];
  Real Bbcsht=Yshtmnew[1, 12];
  Real Gcasht=Yshtmnew[1, 13];
  Real Bcasht=Yshtmnew[1, 14];
  Real Gcbsht=Yshtmnew[1, 15];
  Real Bcbsht=Yshtmnew[1, 16];
  Real Gccsht=Yshtmnew[1, 17];
  Real Bccsht=Yshtmnew[1, 18];
  //Calculating the parameters for the MonoxTri interface
  //Calculating some auxiliary variables
  Real G1=(Gaasht + Gaaser + Gbbsht + Gbbser + Gccsht + Gccser)/3;
  Real B1=(Baasht + Baaser + Bbbsht + Bbbser + Bccsht + Bccser)/3;
  Real G2=(Gbasht + Gbaser + Gacsht + Gacser + Gcbsht + Gcbser)/3;
  Real B2=(Bbasht + Bbaser + Bacsht + Bacser + Bcbsht + Bcbser)/3;
  Real G3=(Gabsht + Gabser + Gbcsht + Gbcser + Gcasht + Gcaser)/3;
  Real B3=(Babsht + Babser + Bbcsht + Bbcser + Bcasht + Bcaser)/3;
  //Calculating the element of Matrix A
  Real Ar=(2*G1 - G2 - sqrt(3)*B2 - G3 + sqrt(3)*B3)/2;
  Real Ai=(2*B1 - B2 + sqrt(3)*G2 - B3 - sqrt(3)*G3)/2;
  //Calculating elements of Matrix MB
  Real MB1r=-(2*Gaaser - Gbaser - sqrt(3)*Bbaser - Gcaser + sqrt(3)*
      Bcaser)/6;
  Real MB1i=-(2*Baaser - Bbaser + sqrt(3)*Gbaser - Bcaser - sqrt(3)*
      Gcaser)/6;
  Real MB2r=-(2*Gabser - Gbbser - sqrt(3)*Bbbser - Gcbser + sqrt(3)*
      Bcbser)/6;
  Real MB2i=-(2*Babser - Bbbser + sqrt(3)*Gbbser - Bcbser - sqrt(3)*
      Gcbser)/6;
  Real MB3r=-(2*Gacser - Gbcser - sqrt(3)*Bbcser - Gccser + sqrt(3)*
      Bccser)/6;
  Real MB3i=-(2*Bacser - Bbcser + sqrt(3)*Gbcser - Bccser - sqrt(3)*
      Gccser)/6;
  //Calculating elements of Matrix C
  Real C1r=-(2*Gaaser - Gabser + sqrt(3)*Babser - Gacser - sqrt(3)*
      Bacser)/2;
  Real C1i=-(2*Baaser - Babser - sqrt(3)*Gabser - Bacser + sqrt(3)*
      Gacser)/2;
  Real C2r=-(2*Gbaser - Gbbser + sqrt(3)*Bbbser - Gbcser - sqrt(3)*
      Bbcser)/2;
  Real C2i=-(2*Bbaser - Bbbser - sqrt(3)*Gbbser - Bbcser + sqrt(3)*
      Gbcser)/2;
  Real C3r=-(2*Gcaser - Gcbser + sqrt(3)*Bcbser - Gccser - sqrt(3)*
      Bccser)/2;
  Real C3i=-(2*Bcaser - Bcbser - sqrt(3)*Gcbser - Bccser + sqrt(3)*
      Gccser)/2;
  //Calculating elements of Matrix D
  Real D11r=Gaaser + Gaasht;
  Real D11i=Baaser + Baasht;
  Real D12r=Gabser + Gabsht;
  Real D12i=Babser + Babsht;
  Real D13r=Gacser + Gacsht;
  Real D13i=Bacser + Bacsht;
  Real D21r=Gbaser + Gbasht;
  Real D21i=Bbaser + Bbasht;
  Real D22r=Gbbser + Gbbsht;
  Real D22i=Bbbser + Bbbsht;
  Real D23r=Gbcser + Gbcsht;
  Real D23i=Bbcser + Bbcsht;
  Real D31r=Gcaser + Gcasht;
  Real D31i=Bcaser + Bcasht;
  Real D32r=Gcbser + Gcbsht;
  Real D32i=Bcbser + Bcbsht;
  Real D33r=Gccser + Gccsht;
  Real D33i=Bccser + Bccsht;
algorithm
  Y := [Ar, Ai, MB1r, MB1i, MB2r, MB2i, MB3r, MB3i, C1r, C1i, C2r, C2i, C3r,
    C3i, D11r, D11i, D12r, D12i, D13r, D13i, D21r, D21i, D22r, D22i, D23r, D23i,
    D31r, D31i, D32r, D32i, D33r, D33i];
annotation (
Documentation(info="<html>
<p>This function calculates impedance matrices of a hybrid positive-sequece/three-phase power line modeled as a pi-equivalent.</p>
<p>This function considers that positive-, negative-, and zero-sequence Norton equivalent impedances have finite values.</p>
</html>"));
end MT_FiniteImpedance;
