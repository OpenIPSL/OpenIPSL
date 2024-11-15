within OpenIPSL.Electrical.ThreePhase.Branches.Transformer.TransfConnection;
function D_Yg "Calculation of impedance matrices for a delta-grounded-wye-connected three-phase transformer."
  extends Modelica.Icons.Function;
  input Real X;
  input Real R;
  input Real tap;
  output Real[12, 12] PiMatrix;
protected
  Real sGser=(1/tap/sqrt(3))*(R/(R*R + X*X));
  Real sBser=(1/tap/sqrt(3))*(-X/(R*R + X*X));
  Real mGser=(1/tap/sqrt(3))*(-R/(R*R + X*X));
  Real mBser=(1/tap/sqrt(3))*(X/(R*R + X*X));
  Real sGshk=((2/3/tap/tap) - (1/tap/sqrt(3)))*(R/(R*R + X*X));
  Real sBshk=((2/3/tap/tap) - (1/tap/sqrt(3)))*(-X/(R*R + X*X));
  Real mGshk=((1/3/tap/tap))*(-R/(R*R + X*X));
  Real mBshk=((1/3/tap/tap))*(X/(R*R + X*X));
  Real nGshk=((1/sqrt(3)/tap) - (1/3/tap/tap))*(R/(R*R + X*X));
  Real nBshk=((1/sqrt(3)/tap) - (1/3/tap/tap))*(-X/(R*R + X*X));
  Real sGshm=(1 - (1/tap/sqrt(3)))*(R/(R*R + X*X));
  Real sBshm=(1 - (1/tap/sqrt(3)))*(-X/(R*R + X*X));
  Real mGshm=(1/tap/sqrt(3))*(R/(R*R + X*X));
  Real mBshm=(1/tap/sqrt(3))*(-X/(R*R + X*X));
  Real zero=1e-6;

  //Writing the Y_ser1 matrix according to Simulight
  Real[6, 6] Y_ser1=[sGser, -sBser, zero, zero, mGser, -mBser;
      sBser, sGser, zero, zero, mBser, mGser; mGser, -mBser, sGser, -sBser,
      zero, zero; mBser, mGser, sBser, sGser, zero, zero; zero, zero, mGser,
      -mBser, sGser, -sBser; zero, zero, mBser, mGser, sBser, sGser];

  //Writing the Y_ser2 matrix according to Simulight
  Real[6, 6] Y_ser2=[sGser, -sBser, mGser, -mBser, zero, zero;
      sBser, sGser, mBser, mGser, zero, zero; zero, zero, sGser, -sBser,
      mGser, -mBser; zero, zero, sBser, sGser, mBser, mGser; mGser, -mBser,
      zero, zero, sGser, -sBser; mBser, mGser, zero, zero, sBser, sGser];

  //Writing the Y_sht_k matrix according to Simulight
  Real[6, 6] Yshtk=[sGshk, -sBshk, mGshk, -mBshk, nGshk, -nBshk;
      sBshk, sGshk, mBshk, mGshk, nBshk, nGshk; nGshk, -nBshk, sGshk, -sBshk,
      mGshk, -mBshk; nBshk, nGshk, sBshk, sGshk, mBshk, mGshk; mGshk, -mBshk,
      nGshk, -nBshk, sGshk, -sBshk; mBshk, mGshk, nBshk, nGshk, sBshk, sGshk];

  //Writing the Y_sht_m matrix according to Simulight
  Real[6, 6] Yshtm=[sGshm, -sBshm, mGshm, -mBshm, zero, zero; sBshm,
      sGshm, mBshm, mGshm, zero, zero; zero, zero, sGshm, -sBshm, mGshm, -
      mBshm; zero, zero, sBshm, sGshm, mBshm, mGshm; mGshm, -mBshm, zero,
      zero, sGshm, -sBshm; mBshm, mGshm, zero, zero, sBshm, sGshm];

  //Calculating the parameters for the Transformer
  //Writing the matrix A (Yser1+Yshtk)
  Real[6, 6] A=Y_ser1 + Yshtk;

  //Writing the matrix B (-Yser1)
  Real[6, 6] B=-Y_ser1;

  //Writing the matrix MC (-Yser2)
  Real[6, 6] C=-Y_ser2;

  //Writing the matrix D (Yser2+Yshtm)
  Real[6, 6] D=Y_ser2 + Yshtm;
algorithm
  PiMatrix := [A, B; C, D];
annotation (
Documentation(info="<html>
<p>This function calculates impedance matrices of a three-phase transformer modeled as a pi-equivalent.</p>
<p>The transformer that uses this function should have its primary windings connected in delta and its secondary windings connected in grounded-wye (grounded-star).</p>
</html>"));
end D_Yg;
