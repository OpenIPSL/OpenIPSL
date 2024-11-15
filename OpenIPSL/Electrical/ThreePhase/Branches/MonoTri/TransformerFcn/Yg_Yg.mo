within OpenIPSL.Electrical.ThreePhase.Branches.MonoTri.TransformerFcn;
function Yg_Yg "Calculation of impedance matrices for a grounded-wye-grounded-wye-connected hybrid transformer."
  extends Modelica.Icons.Function;
  input Real X;
  input Real R;
  input Real tap;
  output Real[1, 32] V;
protected
  Real Gser=(1/tap)*(R/(R*R + X*X));
  Real Bser=(1/tap)*(-X/(R*R + X*X));

  Real Gshk=(1/tap)*((1/tap) - 1)*(R/(R*R + X*X));
  Real Bshk=(1/tap)*((1/tap) - 1)*(-X/(R*R + X*X));

  Real Gshm=(1 - (1/tap))*(R/(R*R + X*X));
  Real Bshm=(1 - (1/tap))*(-X/(R*R + X*X));

  //Writing the Y_ser matrix according to Simulight
  Real Gaaser=Gser;
  Real Baaser=Bser;
  Real Gabser=0;
  Real Babser=0;
  Real Gacser=0;
  Real Bacser=0;
  Real Gbaser=0;
  Real Bbaser=0;
  Real Gbbser=Gser;
  Real Bbbser=Bser;
  Real Gbcser=0;
  Real Bbcser=0;
  Real Gcaser=0;
  Real Bcaser=0;
  Real Gcbser=0;
  Real Bcbser=0;
  Real Gccser=Gser;
  Real Bccser=Bser;

  //Writing the Y_sht_k matrix according to Simulight
  Real Gaask=Gshk;
  Real Baask=Bshk;
  Real Gabsk=0;
  Real Babsk=0;
  Real Gacsk=0;
  Real Bacsk=0;
  Real Gbask=0;
  Real Bbask=0;
  Real Gbbsk=Gshk;
  Real Bbbsk=Bshk;
  Real Gbcsk=0;
  Real Bbcsk=0;
  Real Gcask=0;
  Real Bcask=0;
  Real Gcbsk=0;
  Real Bcbsk=0;
  Real Gccsk=Gshk;
  Real Bccsk=Bshk;

  //Writing the Y_sht_m matrix according to Simulight
  Real Gaasm=Gshm;
  Real Baasm=Bshm;
  Real Gabsm=0;
  Real Babsm=0;
  Real Gacsm=0;
  Real Bacsm=0;
  Real Gbasm=0;
  Real Bbasm=0;
  Real Gbbsm=Gshm;
  Real Bbbsm=Bshm;
  Real Gbcsm=0;
  Real Bbcsm=0;
  Real Gcasm=0;
  Real Bcasm=0;
  Real Gcbsm=0;
  Real Bcbsm=0;
  Real Gccsm=Gshm;
  Real Bccsm=Bshm;

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
<p>The transformer that uses this function should have its primary and secondary windings connected in grounded-wye (grounded-wye).
In addition, this function considers that positive-, negative-, and zero-sequence Norton equivalent impedances have infinite values.</p>
</html>"));
end Yg_Yg;
