within OpenIPSL.Electrical.ThreePhase.Branches.MonoTri.LineFcn;
function MT_InfiniteImpedances "Calculation of impedance matrices for hybrid line."
  extends Modelica.Icons.Function;
  input Real[1, 18] Yser;
  input Real[1, 18] Ysht;
  output Real[1, 32] Y;
  //Writing the Y_ser matrix
protected
  Real Gaaser=Yser[1, 1];
  Real Baaser=Yser[1, 2];
  Real Gabser=Yser[1, 3];
  Real Babser=Yser[1, 4];
  Real Gacser=Yser[1, 5];
  Real Bacser=Yser[1, 6];
  Real Gbaser=Yser[1, 7];
  Real Bbaser=Yser[1, 8];
  Real Gbbser=Yser[1, 9];
  Real Bbbser=Yser[1, 10];
  Real Gbcser=Yser[1, 11];
  Real Bbcser=Yser[1, 12];
  Real Gcaser=Yser[1, 13];
  Real Bcaser=Yser[1, 14];
  Real Gcbser=Yser[1, 15];
  Real Bcbser=Yser[1, 16];
  Real Gccser=Yser[1, 17];
  Real Bccser=Yser[1, 18];
  //Writing the Y_sht matrix
  Real Gaasht=Ysht[1, 1];
  Real Baasht=Ysht[1, 2];
  Real Gabsht=Ysht[1, 3];
  Real Babsht=Ysht[1, 4];
  Real Gacsht=Ysht[1, 5];
  Real Bacsht=Ysht[1, 6];
  Real Gbasht=Ysht[1, 7];
  Real Bbasht=Ysht[1, 8];
  Real Gbbsht=Ysht[1, 9];
  Real Bbbsht=Ysht[1, 10];
  Real Gbcsht=Ysht[1, 11];
  Real Bbcsht=Ysht[1, 12];
  Real Gcasht=Ysht[1, 13];
  Real Bcasht=Ysht[1, 14];
  Real Gcbsht=Ysht[1, 15];
  Real Bcbsht=Ysht[1, 16];
  Real Gccsht=Ysht[1, 17];
  Real Bccsht=Ysht[1, 18];
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
<p>This function considers that positive-, negative-, and zero-sequence Norton equivalent impedances have infinite values.</p>
</html>"));
end MT_InfiniteImpedances;
