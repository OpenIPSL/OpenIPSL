within OpenIPSL.Electrical.ThreePhase.Branches.Transformer.TransfConnection;
function Yg_D "Calculation of impedance matrices for a grounded-wye-delta-connected three-phase transformer."
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
  Real sGshk=((1/tap) - (1/sqrt(3)))/tap*(R/(R*R + X*X));
  Real sBshk=((1/tap) - (1/sqrt(3)))/tap*(-X/(R*R + X*X));
  Real sGshm=((2/3) - (1/tap/sqrt(3)))*(R/(R*R + X*X));
  Real sBshm=((2/3) - (1/tap/sqrt(3)))*(-X/(R*R + X*X));
  Real mGshm=(1/3)*(-R/(R*R + X*X));
  Real mBshm=(1/3)*(X/(R*R + X*X));
  Real nGshm=((1/tap/sqrt(3)) - (1/3))*(R/(R*R + X*X));
  Real nBshm=((1/tap/sqrt(3)) - (1/3))*(-X/(R*R + X*X));
  Real zero=1e-6;

  //Writing the Y_ser1 matrix according to Simulight
  Real[6, 6] Y_ser1=[sGser, -sBser, mGser, -mBser, zero, zero;
      sBser, sGser, mBser, mGser, zero, zero; zero, zero, sGser, -sBser,
      mGser, -mBser; zero, zero, sBser, sGser, mBser, mGser; mGser, -mBser,
      zero, zero, sGser, -sBser; mBser, mGser, zero, zero, sBser, sGser];

  //Writing the Y_ser2 matrix according to Simulight
  Real[6, 6] Y_ser2=[sGser, -sBser, zero, zero, mGser, -mBser;
      sBser, sGser, zero, zero, mBser, mGser; mGser, -mBser, sGser, -sBser,
      zero, zero; mBser, mGser, sBser, sGser, zero, zero; zero, zero, mGser,
      -mBser, sGser, -sBser; zero, zero, mBser, mGser, sBser, sGser];

  //Writing the Y_sht_k matrix according to Simulight
  Real[6, 6] Yshtk=[sGshk, -sBshk, sGser, -sBser, zero, zero; sBshk,
      sGshk, sBser, sGser, zero, zero; zero, zero, sGshk, -sBshk, sGser, -
      sBser; zero, zero, sBshk, sGshk, sBser, sGser; sGser, -sBser, zero,
      zero, sGshk, -sBshk; sBser, sGser, zero, zero, sBshk, sGshk];

  //Writing the Y_sht_m matrix according to Simulight
  Real[6, 6] Yshtm=[sGshm, -sBshm, mGshm, -mBshm, nGshm, -nBshm;
      sBshm, sGshm, mBshm, mGshm, nBshm, nGshm; nGshm, -nBshm, sGshm, -sBshm,
      mGshm, -mBshm; nBshm, nGshm, sBshm, sGshm, mBshm, mGshm; mGshm, -mBshm,
      nGshm, -nBshm, sGshm, -sBshm; mBshm, mGshm, nBshm, nGshm, sBshm, sGshm];

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
<p>The transformer that uses this function should have its primary windings connected in grounded-wye (grounded-star) and its secondary windings connected in delta.</p>
</html>"));
end Yg_D;
