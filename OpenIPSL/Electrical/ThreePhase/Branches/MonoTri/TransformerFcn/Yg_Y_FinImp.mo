within OpenIPSL.Electrical.ThreePhase.Branches.MonoTri.TransformerFcn;
function Yg_Y_FinImp "Calculation of impedance matrices for a grounded-wye-wye-connected hybrid transformer. Finite values of Norton equivalent impedances are taken into account."
  extends Modelica.Icons.Function;
  import OpenIPSL.Electrical.ThreePhase.Branches.MonoTri.MonoTriFcn.Inverse;
  import OpenIPSL.Electrical.ThreePhase.Branches.MonoTri.MonoTriFcn.PositiveFilter;
  import OpenIPSL.Electrical.ThreePhase.Branches.MonoTri.MonoTriFcn.NegZerFilter;
  input Real X;
  input Real R;
  input Real tap;
  input Real[1, 18] Y012;
  output Real[1, 32] Y;
protected
  Real sGser=((1/tap)/3)*(2*R/(R*R + X*X));
  Real sBser=((1/tap)/3)*(-2*X/(R*R + X*X));
  Real mGser=((1/tap)/3)*(-R/(R*R + X*X));
  Real mBser=((1/tap)/3)*(X/(R*R + X*X));

  Real sGshk=((3 - 2*tap)/(3*tap*tap))*(R/(R*R + X*X));
  Real sBshk=((3 - 2*tap)/(3*tap*tap))*(-X/(R*R + X*X));
  Real mGshk=(1/(3*tap))*(R/(R*R + X*X));
  Real mBshk=(1/(3*tap))*(-X/(R*R + X*X));

  Real sGshm=((tap - 1)/(3*tap))*(2*R/(R*R + X*X));
  Real sBshm=((tap - 1)/(3*tap))*(-2*X/(R*R + X*X));
  Real mGshm=((tap - 1)/(3*tap))*(-R/(R*R + X*X));
  Real mBshm=((tap - 1)/(3*tap))*(X/(R*R + X*X));
  // Getting data for the norton equivalent impedances
  Real g0=Y012[1, 1];
  Real b0=Y012[1, 2];
  Real g1=Y012[1, 9];
  Real b1=Y012[1, 10];
  Real g2=Y012[1, 17];
  Real b2=Y012[1, 18];
  // Writing the Yabc norton equivalent matrix
  Real g11=(g0 + g1 + g2)/3;
  Real b11=(b0 + b1 + b2)/3;
  Real g12=(2*g0 - g1 - b1*sqrt(3) - g2 + b2*sqrt(3))/6;
  Real b12=(2*b0 + g1*sqrt(3) - b1 - g2*sqrt(3) - b2)/6;
  Real g13=(2*g0 - g1 + b1*sqrt(3) - g2 - b2*sqrt(3))/6;
  Real b13=(2*b0 - g1*sqrt(3) - b1 + g2*sqrt(3) - b2)/6;
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
  //Writing the Y_ser matrix according to Simulight
  Real[1, 18] Yser=[sGser, sBser, mGser, mBser, mGser, mBser, mGser,
      mBser, sGser, sBser, mGser, mBser, mGser, mBser, mGser, mBser, sGser,
      sBser];
  //Writing the Y_sht_k matrix according to Simulight
  Real[1, 18] Yshtk=[sGshk, sBshk, mGshk, mBshk, mGshk, mBshk, mGshk,
      mBshk, sGshk, sBshk, mGshk, mBshk, mGshk, mBshk, mGshk, mBshk, sGshk,
      sBshk];
  //Writing the Y_sht_m matrix according to Simulight
  Real[1, 18] Yshtm=[sGshm, sBshm, mGshm, mBshm, mGshm, mBshm, mGshm,
      mBshm, sGshm, sBshm, mGshm, mBshm, mGshm, mBshm, mGshm, mBshm, sGshm,
      sBshm];
  // Writing the calculations for matrix that will be placed in parallel with Yshtm and the matrix that will replace Yser
  Real[1, 18] A=Yabcnrt + Yshtk;
  Real[1, 18] B=Inverse(A);
  Real[1, 18] C=Inverse(Yser);
  Real[1, 18] D=B + C;
  Real[1, 18] E=Inverse(D);
  Real[1, 18] Yshtm2=NegZerFilter(E);
  Real[1, 18] Ysernew=PositiveFilter(Yser);
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
  //Writing the Y_sht_m matrix
  Real Gaasm=Yshtmnew[1, 1];
  Real Baasm=Yshtmnew[1, 2];
  Real Gabsm=Yshtmnew[1, 3];
  Real Babsm=Yshtmnew[1, 4];
  Real Gacsm=Yshtmnew[1, 5];
  Real Bacsm=Yshtmnew[1, 6];
  Real Gbasm=Yshtmnew[1, 7];
  Real Bbasm=Yshtmnew[1, 8];
  Real Gbbsm=Yshtmnew[1, 9];
  Real Bbbsm=Yshtmnew[1, 10];
  Real Gbcsm=Yshtmnew[1, 11];
  Real Bbcsm=Yshtmnew[1, 12];
  Real Gcasm=Yshtmnew[1, 13];
  Real Bcasm=Yshtmnew[1, 14];
  Real Gcbsm=Yshtmnew[1, 15];
  Real Bcbsm=Yshtmnew[1, 16];
  Real Gccsm=Yshtmnew[1, 17];
  Real Bccsm=Yshtmnew[1, 18];
  //Writing the Y_sht_k matrix
  Real Gaask=Yshtk[1, 1];
  Real Baask=Yshtk[1, 2];
  Real Gabsk=Yshtk[1, 3];
  Real Babsk=Yshtk[1, 4];
  Real Gacsk=Yshtk[1, 5];
  Real Bacsk=Yshtk[1, 6];
  Real Gbask=Yshtk[1, 7];
  Real Bbask=Yshtk[1, 8];
  Real Gbbsk=Yshtk[1, 9];
  Real Bbbsk=Yshtk[1, 10];
  Real Gbcsk=Yshtk[1, 11];
  Real Bbcsk=Yshtk[1, 12];
  Real Gcask=Yshtk[1, 13];
  Real Bcask=Yshtk[1, 14];
  Real Gcbsk=Yshtk[1, 15];
  Real Bcbsk=Yshtk[1, 16];
  Real Gccsk=Yshtk[1, 17];
  Real Bccsk=Yshtk[1, 18];
  //Calculating the parameters for the MonoxTri interface
  //Calculating auxiliary variables
  Real G1=(Gaask + Gaaser + Gbbsk + Gbbser + Gccsk + Gccser)/3;
  Real B1=(Baask + Baaser + Bbbsk + Bbbser + Bccsk + Bccser)/3;
  Real G2=(Gbask + Gbaser + Gacsk + Gacser + Gcbsk + Gcbser)/3;
  Real B2=(Bbask + Bbaser + Bacsk + Bacser + Bcbsk + Bcbser)/3;
  Real G3=(Gabsk + Gabser + Gbcsk + Gbcser + Gcask + Gcaser)/3;
  Real B3=(Babsk + Babser + Bbcsk + Bbcser + Bcask + Bcaser)/3;
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
  Real D11r=Gaaser + Gaasm;
  Real D11i=Baaser + Baasm;
  Real D12r=Gabser + Gabsm;
  Real D12i=Babser + Babsm;
  Real D13r=Gacser + Gacsm;
  Real D13i=Bacser + Bacsm;
  Real D21r=Gbaser + Gbasm;
  Real D21i=Bbaser + Bbasm;
  Real D22r=Gbbser + Gbbsm;
  Real D22i=Bbbser + Bbbsm;
  Real D23r=Gbcser + Gbcsm;
  Real D23i=Bbcser + Bbcsm;
  Real D31r=Gcaser + Gcasm;
  Real D31i=Bcaser + Bcasm;
  Real D32r=Gcbser + Gcbsm;
  Real D32i=Bcbser + Bcbsm;
  Real D33r=Gccser + Gccsm;
  Real D33i=Bccser + Bccsm;
algorithm
  Y := [Ar, Ai, MB1r, MB1i, MB2r, MB2i, MB3r, MB3i, C1r, C1i, C2r, C2i, C3r,
    C3i, D11r, D11i, D12r, D12i, D13r, D13i, D21r, D21i, D22r, D22i, D23r, D23i,
    D31r, D31i, D32r, D32i, D33r, D33i];
annotation (
Documentation(info="<html>
<p>This function calculates impedance matrices of a hybrid positive-sequece/three-phase transformer modeled as a pi-equivalent.</p>
<p>The transformer that uses this function should have its primary windings connected in grounded-wye (grounded-star) and its secondary windings connected in wye (star).
In addition, this function considers that positive-, negative-, and zero-sequence Norton equivalent impedances have finite values.</p>
</html>"));
end Yg_Y_FinImp;
