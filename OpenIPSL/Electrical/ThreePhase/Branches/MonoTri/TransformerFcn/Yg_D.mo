within OpenIPSL.Electrical.ThreePhase.Branches.MonoTri.TransformerFcn;
function Yg_D "Calculation of hybrid impedance matrices for a grounded-wye-delta-connected three-phase transformer."
  extends Modelica.Icons.Function;
  input Real X;
  input Real R;
  input Real tap;
  output Real[1, 32] V;

protected
  Real sGser=(1/tap/sqrt(3))*(R/(R*R + X*X));
  Real sBser=(1/tap/sqrt(3))*(-X/(R*R + X*X));
  Real mGser=(1/tap/sqrt(3))*(-R/(R*R + X*X));
  Real mBser=(1/tap/sqrt(3))*(X/(R*R + X*X));

  Real sGshk=((1/tap) - (1/sqrt(3)))/tap*(R/(R*R + X*X));
  Real sBshk=((1/tap) - (1/sqrt(3)))/tap*(-X/(R*R + X*X));

  Real sGshm=((2/3) - (1/tap/sqrt(3)))*(R/(R*R + X*X));
  Real sBshm=((2/3) - (1/tap/sqrt(3)))*(-X/(R*R + X*X));
  Real mGshm=(1/3)*(-R/(R*R + X*X));
  Real mBshm=(1/3)*(X/(R*R + X*X));
  Real nGshm=((1/tap/sqrt(3)) - (1/3))*(R/(R*R + X*X));
  Real nBshm=((1/tap/sqrt(3)) - (1/3))*(-X/(R*R + X*X));

  //Writing the Y_ser1 matrix according to Simulight
  Real Gaaser=sGser;
  Real Baaser=sBser;
  Real Gabser=mGser;
  Real Babser=mBser;
  Real Gacser=0;
  Real Bacser=0;
  Real Gbaser=0;
  Real Bbaser=0;
  Real Gbbser=sGser;
  Real Bbbser=sBser;
  Real Gbcser=mGser;
  Real Bbcser=mBser;
  Real Gcaser=mGser;
  Real Bcaser=mBser;
  Real Gcbser=0;
  Real Bcbser=0;
  Real Gccser=sGser;
  Real Bccser=sBser;

  //Writing the Y_ser2 matrix according to Simulight
  Real Gaaser2=Gaaser;
  Real Baaser2=Baaser;
  Real Gabser2=Gbaser;
  Real Babser2=Bbaser;
  Real Gacser2=Gcaser;
  Real Bacser2=Bcaser;
  Real Gbaser2=Gabser;
  Real Bbaser2=Babser;
  Real Gbbser2=Gbbser;
  Real Bbbser2=Bbbser;
  Real Gbcser2=Gcbser;
  Real Bbcser2=Bcbser;
  Real Gcaser2=Gacser;
  Real Bcaser2=Bacser;
  Real Gcbser2=Gbcser;
  Real Bcbser2=Bbcser;
  Real Gccser2=Gccser;
  Real Bccser2=Bccser;

  //Writing the Y_sht_k matrix according to Simulight
  Real Gaask=sGshk;
  Real Baask=sBshk;
  Real Gabsk=sGser;
  Real Babsk=sBser;
  Real Gacsk=0;
  Real Bacsk=0;
  Real Gbask=0;
  Real Bbask=0;
  Real Gbbsk=sGshk;
  Real Bbbsk=sBshk;
  Real Gbcsk=sGser;
  Real Bbcsk=sBser;
  Real Gcask=sGser;
  Real Bcask=sBser;
  Real Gcbsk=0;
  Real Bcbsk=0;
  Real Gccsk=sGshk;
  Real Bccsk=sBshk;

  //Writing the Y_sht_m matrix according to Simulight
  Real Gaasm=sGshm;
  Real Baasm=sBshm;
  Real Gabsm=mGshm;
  Real Babsm=mBshm;
  Real Gacsm=nGshm;
  Real Bacsm=nBshm;
  Real Gbasm=nGshm;
  Real Bbasm=nBshm;
  Real Gbbsm=sGshm;
  Real Bbbsm=sBshm;
  Real Gbcsm=mGshm;
  Real Bbcsm=mBshm;
  Real Gcasm=mGshm;
  Real Bcasm=mBshm;
  Real Gcbsm=nGshm;
  Real Bcbsm=nBshm;
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
  Real C1r=-(2*Gaaser2 - Gabser2 + sqrt(3)*Babser2 - Gacser2 - sqrt(3)
      *Bacser2)/2;
  Real C1i=-(2*Baaser2 - Babser2 - sqrt(3)*Gabser2 - Bacser2 + sqrt(3)
      *Gacser2)/2;
  Real C2r=-(2*Gbaser2 - Gbbser2 + sqrt(3)*Bbbser2 - Gbcser2 - sqrt(3)
      *Bbcser2)/2;
  Real C2i=-(2*Bbaser2 - Bbbser2 - sqrt(3)*Gbbser2 - Bbcser2 + sqrt(3)
      *Gbcser2)/2;
  Real C3r=-(2*Gcaser2 - Gcbser2 + sqrt(3)*Bcbser2 - Gccser2 - sqrt(3)
      *Bccser2)/2;
  Real C3i=-(2*Bcaser2 - Bcbser2 - sqrt(3)*Gcbser2 - Bccser2 + sqrt(3)
      *Gccser2)/2;

  //Calculating elements of Matrix D
  Real D11r=Gaaser2 + Gaasm;
  Real D11i=Baaser2 + Baasm;
  Real D12r=Gabser2 + Gabsm;
  Real D12i=Babser2 + Babsm;
  Real D13r=Gacser2 + Gacsm;
  Real D13i=Bacser2 + Bacsm;
  Real D21r=Gbaser2 + Gbasm;
  Real D21i=Bbaser2 + Bbasm;
  Real D22r=Gbbser2 + Gbbsm;
  Real D22i=Bbbser2 + Bbbsm;
  Real D23r=Gbcser2 + Gbcsm;
  Real D23i=Bbcser2 + Bbcsm;
  Real D31r=Gcaser2 + Gcasm;
  Real D31i=Bcaser2 + Bcasm;
  Real D32r=Gcbser2 + Gcbsm;
  Real D32i=Bcbser2 + Bcbsm;
  Real D33r=Gccser2 + Gccsm;
  Real D33i=Bccser2 + Bccsm;
algorithm
  V := [Ar, Ai, MB1r, MB1i, MB2r, MB2i, MB3r, MB3i, C1r, C1i, C2r, C2i, C3r,
    C3i, D11r, D11i, D12r, D12i, D13r, D13i, D21r, D21i, D22r, D22i, D23r, D23i,
    D31r, D31i, D32r, D32i, D33r, D33i];
annotation (
Documentation(info="<html>
<p>This function calculates impedance matrices of a hybrid positive-sequece/three-phase transformer modeled as a pi-equivalent.</p>
<p>The transformer that uses this function should have its primary windings connected in grounded-wye (grounded-star) and its secondary windings connected in delta.
In addition, this function considers that positive-, negative-, and zero-sequence Norton equivalent impedances have infinite values.</p>
</html>"));
end Yg_D;
