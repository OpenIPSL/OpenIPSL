within OpenIPSL.Electrical.ThreePhase.Branches.MonoTri.TransformerFcn;
function Y_Yg "Calculation of impedance matrices for a wye-grounded-wye-connected hybrid transformer."
  extends Modelica.Icons.Function;
  input Real X;
  input Real R;
  input Real tap;
  output Real[1, 32] V;
protected
  Real sGser=((1/tap)/3)*(2*R/(R*R + X*X));
  Real sBser=((1/tap)/3)*(-2*X/(R*R + X*X));
  Real mGser=((1/tap)/3)*(-R/(R*R + X*X));
  Real mBser=((1/tap)/3)*(X/(R*R + X*X));

  Real sGshk=((1 - tap)/(3*tap*tap))*(2*R/(R*R + X*X));
  Real sBshk=((1 - tap)/(3*tap*tap))*(-2*X/(R*R + X*X));
  Real mGshk=((1 - tap)/(3*tap*tap))*(-R/(R*R + X*X));
  Real mBshk=((1 - tap)/(3*tap*tap))*(X/(R*R + X*X));

  Real sGshm=((3*tap - 2)/(3*tap))*(R/(R*R + X*X));
  Real sBshm=((3*tap - 2)/(3*tap))*(-X/(R*R + X*X));
  Real mGshm=(1/(3*tap))*(R/(R*R + X*X));
  Real mBshm=(1/(3*tap))*(-X/(R*R + X*X));

  //Writing the Y_ser matrix according to Simulight
  Real Gaaser=sGser;
  Real Baaser=sBser;
  Real Gabser=mGser;
  Real Babser=mBser;
  Real Gacser=mGser;
  Real Bacser=mBser;
  Real Gbaser=mGser;
  Real Bbaser=mBser;
  Real Gbbser=sGser;
  Real Bbbser=sBser;
  Real Gbcser=mGser;
  Real Bbcser=mBser;
  Real Gcaser=mGser;
  Real Bcaser=mBser;
  Real Gcbser=mGser;
  Real Bcbser=mBser;
  Real Gccser=sGser;
  Real Bccser=sBser;

  //Writing the Y_sht_k matrix according to Simulight
  Real Gaask=sGshk;
  Real Baask=sBshk;
  Real Gabsk=mGshk;
  Real Babsk=mBshk;
  Real Gacsk=mGshk;
  Real Bacsk=mBshk;
  Real Gbask=mGshk;
  Real Bbask=mBshk;
  Real Gbbsk=sGshk;
  Real Bbbsk=sBshk;
  Real Gbcsk=mGshk;
  Real Bbcsk=mBshk;
  Real Gcask=mGshk;
  Real Bcask=mBshk;
  Real Gcbsk=mGshk;
  Real Bcbsk=mBshk;
  Real Gccsk=sGshk;
  Real Bccsk=sBshk;

  //Writing the Y_sht_m matrix according to Simulight
  Real Gaasm=sGshm;
  Real Baasm=sBshm;
  Real Gabsm=mGshm;
  Real Babsm=mBshm;
  Real Gacsm=mGshm;
  Real Bacsm=mBshm;
  Real Gbasm=mGshm;
  Real Bbasm=mBshm;
  Real Gbbsm=sGshm;
  Real Bbbsm=sBshm;
  Real Gbcsm=mGshm;
  Real Bbcsm=mBshm;
  Real Gcasm=mGshm;
  Real Bcasm=mBshm;
  Real Gcbsm=mGshm;
  Real Bcbsm=mBshm;
  Real Gccsm=sGshm;
  Real Bccsm=sBshm;

  //Calculating the parameters for the MonoxTri interface

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
  V := [Ar, Ai, MB1r, MB1i, MB2r, MB2i, MB3r, MB3i, C1r, C1i, C2r, C2i, C3r,
    C3i, D11r, D11i, D12r, D12i, D13r, D13i, D21r, D21i, D22r, D22i, D23r, D23i,
    D31r, D31i, D32r, D32i, D33r, D33i];
annotation (
Documentation(info="<html>
<p>This function calculates impedance matrices of a hybrid positive-sequece/three-phase transformer modeled as a pi-equivalent.</p>
<p>The transformer that uses this function should have its primary windings connected in wye (star) and its secondary windings connected ingrounded-wye (grounded-star).
In addition, this function considers that positive-, negative-, and zero-sequence Norton equivalent impedances have infinite values.</p>
</html>"));
end Y_Yg;
