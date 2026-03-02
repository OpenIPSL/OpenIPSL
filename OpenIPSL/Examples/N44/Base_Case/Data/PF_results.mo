within OpenIPSL.Examples.N44.Base_Case.Data;
record PF_results "Data record of power flow results for model initialization"
  extends Modelica.Icons.Record;

  record Loads "Data record with active and reactive power consumed by loads"
    extends Modelica.Icons.Record;
    // Load 3100_1
    parameter Real PL3100_1=90.182999*1e6;
    parameter Real QL3100_1=94.384003*1e6;
    // Load 7000_5
    parameter Real PL7000_5=1372.248047*1e6;
    parameter Real QL7000_5=286.123993*1e6;
    // Load 8500_2
    parameter Real PL8500_2=963.666992*1e6;
    parameter Real QL8500_2=316.742004*1e6;
    // Load 8500_3
    parameter Real PL8500_3=963.666992*1e6;
    parameter Real QL8500_3=316.742004*1e6;
    // Load 8500_1
    parameter Real PL8500_1=963.666992*1e6;
    parameter Real QL8500_1=316.742004*1e6;
    // Load 3360_1
    parameter Real PL3360_1=-80.000000*1e6;
    parameter Real QL3360_1=-26.295000*1e6;
    // Load 5620_1
    parameter Real PL5620_1=727.000000*1e6;
    parameter Real QL5620_1=238.953003*1e6;
    // Load 5400_1
    parameter Real PL5400_1=1226.567017*1e6;
    parameter Real QL5400_1=233.710007*1e6;
    // Load 5500_1
    parameter Real PL5500_1=1119.907959*1e6;
    parameter Real QL5500_1=467.424011*1e6;
    // Load 7000_1
    parameter Real PL7000_1=1372.248047*1e6;
    parameter Real QL7000_1=286.123993*1e6;
    // Load 7100_3
    parameter Real PL7100_3=36.000000*1e6;
    parameter Real QL7100_3=11.833000*1e6;
    // Load 7100_2
    parameter Real PL7100_2=1232.879028*1e6;
    parameter Real QL7100_2=817.508972*1e6;
    // Load 7100_1
    parameter Real PL7100_1=1232.879028*1e6;
    parameter Real QL7100_1=817.508972*1e6;
    // Load 3000_2
    parameter Real PL3000_2=293.760986*1e6;
    parameter Real QL3000_2=99.392998*1e6;
    // Load 5300_2
    parameter Real PL5300_2=2303.000000*1e6;
    parameter Real QL5300_2=756.958984*1e6;
    // Load 5600_2
    parameter Real PL5600_2=1397.946045*1e6;
    parameter Real QL5600_2=284.834991*1e6;
    // Load 7000_6
    parameter Real PL7000_6=-1220.000000*1e6;
    parameter Real QL7000_6=-400.994995*1e6;
    // Load 7000_4
    parameter Real PL7000_4=1372.248047*1e6;
    parameter Real QL7000_4=286.123993*1e6;
    // Load 5500_2
    parameter Real PL5500_2=1119.907959*1e6;
    parameter Real QL5500_2=467.424011*1e6;
    // Load 7000_2
    parameter Real PL7000_2=1372.248047*1e6;
    parameter Real QL7000_2=286.123993*1e6;
    // Load 7000_3
    parameter Real PL7000_3=1372.248047*1e6;
    parameter Real QL7000_3=286.123993*1e6;
    // Load 6100_1
    parameter Real PL6100_1=714.054016*1e6;
    parameter Real QL6100_1=261.881989*1e6;
    // Load 3249_1
    parameter Real PL3249_1=1893.817017*1e6;
    parameter Real QL3249_1=557.724976*1e6;
    // Load 3000_3
    parameter Real PL3000_3=293.760986*1e6;
    parameter Real QL3000_3=99.392998*1e6;
    // Load 5600_1
    parameter Real PL5600_1=1397.946045*1e6;
    parameter Real QL5600_1=284.834991*1e6;
    // Load 5100_1
    parameter Real PL5100_1=586.617981*1e6;
    parameter Real QL5100_1=163.598007*1e6;
    // Load 6500_1
    parameter Real PL6500_1=832.666992*1e6;
    parameter Real QL6500_1=273.683990*1e6;
    // Load 6500_2
    parameter Real PL6500_2=832.666992*1e6;
    parameter Real QL6500_2=273.683990*1e6;
    // Load 6500_3
    parameter Real PL6500_3=832.666992*1e6;
    parameter Real QL6500_3=273.683990*1e6;
    // Load 3300_1
    parameter Real PL3300_1=1285.400024*1e6;
    parameter Real QL3300_1=358.053009*1e6;
    // Load 3300_2
    parameter Real PL3300_2=1285.400024*1e6;
    parameter Real QL3300_2=358.053009*1e6;
    // Load 3115_1
    parameter Real PL3115_1=1029.000000*1e6;
    parameter Real QL3115_1=338.216003*1e6;
    // Load 8600_1
    parameter Real PL8600_1=-76.000000*1e6;
    parameter Real QL8600_1=-24.980000*1e6;
    // Load 6701_3
    parameter Real PL6701_3=-18.000000*1e6;
    parameter Real QL6701_3=-5.916000*1e6;
    // Load 3000_1
    parameter Real PL3000_1=293.760986*1e6;
    parameter Real QL3000_1=99.392998*1e6;
    // Load 6701_1
    parameter Real PL6701_1=-36.000000*1e6;
    parameter Real QL6701_1=-11.833000*1e6;
    // Load 8700_1
    parameter Real PL8700_1=0.000000;
    parameter Real QL8700_1=0.000000;
    // Load 5610_1
    parameter Real PL5610_1=-1584.000000*1e6;
    parameter Real QL5610_1=-225.707993*1e6;
    // Load 7010_1
    parameter Real PL7010_1=-1005.000000*1e6;
    parameter Real QL7010_1=-330.328003*1e6;
    // Load 3020_1
    parameter Real PL3020_1=1220.000000*1e6;
    parameter Real QL3020_1=400.994995*1e6;
    // Load 6100_2
    parameter Real PL6100_2=714.054016*1e6;
    parameter Real QL6100_2=261.881989*1e6;
    // Load 6700_1
    parameter Real PL6700_1=2256.000000*1e6;
    parameter Real QL6700_1=741.510986*1e6;
    // Load 3359_3
    parameter Real PL3359_3=1542.479004*1e6;
    parameter Real QL3359_3=537.078003*1e6;
    // Load 3359_2
    parameter Real PL3359_2=1542.479004*1e6;
    parameter Real QL3359_2=537.078003*1e6;
    // Load 3359_1
    parameter Real PL3359_1=1542.479004*1e6;
    parameter Real QL3359_1=537.078003*1e6;
    // Load 8500_4
    parameter Real PL8500_4=-400.000000*1e6;
    parameter Real QL8500_4=-131.473999*1e6;
    // Load 3359_4
    parameter Real PL3359_4=1542.479004*1e6;
    parameter Real QL3359_4=537.078003*1e6;
    // Load 7020_1
    parameter Real PL7020_1=719.000000*1e6;
    parameter Real QL7020_1=236.324005*1e6;
  end Loads;

  record Voltages "Voltage magnitudes and angles coming from power flow calculation"
    extends Modelica.Icons.Record;
    // Bus number 3200
    parameter Real V3200=1.032229;
    parameter Real A3200=0.052605*C.pi/180;
    // Bus number 7020
    parameter Real V7020=0.997605;
    parameter Real A7020=11.129037*C.pi/180;
    // Bus number 6700
    parameter Real V6700=1.020000;
    parameter Real A6700=-2.223044*C.pi/180;
    // Bus number 6701
    parameter Real V6701=1.009082;
    parameter Real A6701=-1.757651*C.pi/180;
    // Bus number 8600
    parameter Real V8600=1.020245;
    parameter Real A8600=-4.000396*C.pi/180;
    // Bus number 5400
    parameter Real V5400=1.007000;
    parameter Real A5400=20.340874*C.pi/180;
    // Bus number 5401
    parameter Real V5401=1.009460;
    parameter Real A5401=20.855167*C.pi/180;
    // Bus number 5402
    parameter Real V5402=1.003232;
    parameter Real A5402=21.678808*C.pi/180;
    // Bus number 3100
    parameter Real V3100=1.037953;
    parameter Real A3100=2.446836*C.pi/180;
    // Bus number 3359
    parameter Real V3359=1.000000;
    parameter Real A3359=-0.825942*C.pi/180;
    // Bus number 3360
    parameter Real V3360=1.001124;
    parameter Real A3360=-0.741913*C.pi/180;
    // Bus number 8500
    parameter Real V8500=1.020000;
    parameter Real A8500=-4.042240*C.pi/180;
    // Bus number 3115
    parameter Real V3115=1.000000;
    parameter Real A3115=6.522730*C.pi/180;
    // Bus number 3244
    parameter Real V3244=0.995715;
    parameter Real A3244=-5.312940*C.pi/180;
    // Bus number 3245
    parameter Real V3245=1.000000;
    parameter Real A3245=-4.288845*C.pi/180;
    // Bus number 3249
    parameter Real V3249=1.000000;
    parameter Real A3249=11.095716*C.pi/180;
    // Bus number 5300
    parameter Real V5300=1.000000;
    parameter Real A5300=43.358406*C.pi/180;
    // Bus number 5301
    parameter Real V5301=0.994281;
    parameter Real A5301=33.916851*C.pi/180;
    // Bus number 5304
    parameter Real V5304=0.991906;
    parameter Real A5304=25.853479*C.pi/180;
    // Bus number 5305
    parameter Real V5305=1.000543;
    parameter Real A5305=26.851227*C.pi/180;
    // Bus number 7100
    parameter Real V7100=1.000000;
    parameter Real A7100=8.925404*C.pi/180;
    // Bus number 3020
    parameter Real V3020=0.995898;
    parameter Real A3020=-3.604041*C.pi/180;
    // Bus number 7010
    parameter Real V7010=1.003242;
    parameter Real A7010=12.115957*C.pi/180;
    // Bus number 3000
    parameter Real V3000=1.000000;
    parameter Real A3000=-2.902135*C.pi/180;
    // Bus number 6100
    parameter Real V6100=1.000000;
    parameter Real A6100=51.105946*C.pi/180;
    // Bus number 7000
    parameter Real V7000=1.000000;
    parameter Real A7000=11.541987*C.pi/180;
    // Bus number 6500
    parameter Real V6500=1.000000;
    parameter Real A6500=-15.553716*C.pi/180;
    // Bus number 5600
    parameter Real V5600=1.010000;
    parameter Real A5600=12.494167*C.pi/180;
    // Bus number 5601
    parameter Real V5601=1.007137;
    parameter Real A5601=22.359991*C.pi/180;
    // Bus number 5602
    parameter Real V5602=1.034142;
    parameter Real A5602=24.178598*C.pi/180;
    // Bus number 5603
    parameter Real V5603=1.035641;
    parameter Real A5603=24.573368*C.pi/180;
    // Bus number 3300
    parameter Real V3300=1.000000;
    parameter Real A3300=0.000000;
    // Bus number 8700
    parameter Real V8700=1.020000;
    parameter Real A8700=-4.042240*C.pi/180;
    // Bus number 5610
    parameter Real V5610=1.037703;
    parameter Real A5610=25.417891*C.pi/180;
    // Bus number 5100
    parameter Real V5100=1.000000;
    parameter Real A5100=11.340187*C.pi/180;
    // Bus number 5101
    parameter Real V5101=0.992044;
    parameter Real A5101=11.798026*C.pi/180;
    // Bus number 5102
    parameter Real V5102=0.995200;
    parameter Real A5102=17.675926*C.pi/180;
    // Bus number 5103
    parameter Real V5103=0.992576;
    parameter Real A5103=18.696482*C.pi/180;
    // Bus number 6000
    parameter Real V6000=1.005000;
    parameter Real A6000=23.961414*C.pi/180;
    // Bus number 6001
    parameter Real V6001=1.001689;
    parameter Real A6001=22.582314*C.pi/180;
    // Bus number 5620
    parameter Real V5620=1.007603;
    parameter Real A5620=12.084859*C.pi/180;
    // Bus number 3701
    parameter Real V3701=1.008833;
    parameter Real A3701=8.403682*C.pi/180;
    // Bus number 5500
    parameter Real V5500=1.004000;
    parameter Real A5500=13.624016*C.pi/180;
    // Bus number 5501
    parameter Real V5501=1.008783;
    parameter Real A5501=13.804609*C.pi/180;
  end Voltages;

  record Machines "Data record with active and reactive power generated"
    extends Modelica.Icons.Record;
    // Machine 8500_6
    parameter Real P8500_6=171.148743*1e6;
    parameter Real Q8500_6=157.443024*1e6;
    // Machine 5600_1
    parameter Real P5600_1=261.114502*1e6;
    parameter Real Q5600_1=289.519989*1e6;
    // Machine 8500_4
    parameter Real P8500_4=171.148743*1e6;
    parameter Real Q8500_4=157.443024*1e6;
    // Machine 7000_5
    parameter Real P7000_5=705.408630*1e6;
    parameter Real Q7000_5=51.735935*1e6;
    // Machine 8500_2
    parameter Real P8500_2=171.148743*1e6;
    parameter Real Q8500_2=157.443024*1e6;
    // Machine 8500_3
    parameter Real P8500_3=171.148743*1e6;
    parameter Real Q8500_3=157.443024*1e6;
    // Machine 6500_1
    parameter Real P6500_1=205.884567*1e6;
    parameter Real Q6500_1=248.786835*1e6;
    // Machine 6500_4
    parameter Real P6500_4=205.884567*1e6;
    parameter Real Q6500_4=248.786835*1e6;
    // Machine 6100_1
    parameter Real P6100_1=628.820984*1e6;
    parameter Real Q6100_1=129.825394*1e6;
    // Machine 6500_3
    parameter Real P6500_3=205.884567*1e6;
    parameter Real Q6500_3=248.786835*1e6;
    // Machine 5400_1
    parameter Real P5400_1=333.242004*1e6;
    parameter Real Q5400_1=225.036179*1e6;
    // Machine 5400_2
    parameter Real P5400_2=333.242004*1e6;
    parameter Real Q5400_2=225.036179*1e6;
    // Machine 8500_1
    parameter Real P8500_1=171.148743*1e6;
    parameter Real Q8500_1=157.443024*1e6;
    // Machine 5500_1
    parameter Real P5500_1=291.266541*1e6;
    parameter Real Q5500_1=-52.494392*1e6;
    // Machine 6700_1
    parameter Real P6700_1=517.749390*1e6;
    parameter Real Q6700_1=173.417313*1e6;
    // Machine 7100_3
    parameter Real P7100_3=450.046997*1e6;
    parameter Real Q7100_3=578.315125*1e6;
    // Machine 7100_2
    parameter Real P7100_2=450.046997*1e6;
    parameter Real Q7100_2=578.315125*1e6;
    // Machine 7100_1
    parameter Real P7100_1=450.046997*1e6;
    parameter Real Q7100_1=578.315125*1e6;
    // Machine 8500_5
    parameter Real P8500_5=171.148743*1e6;
    parameter Real Q8500_5=157.443024*1e6;
    // Machine 3000_2
    parameter Real P3000_2=371.233002*1e6;
    parameter Real Q3000_2=173.005066*1e6;
    // Machine 5300_5
    parameter Real P5300_5=733.302551*1e6;
    parameter Real Q5300_5=200.370499*1e6;
    // Machine 5300_4
    parameter Real P5300_4=733.302551*1e6;
    parameter Real Q5300_4=200.370499*1e6;
    // Machine 5300_3
    parameter Real P5300_3=733.302551*1e6;
    parameter Real Q5300_3=200.370499*1e6;
    // Machine 5300_2
    parameter Real P5300_2=733.302551*1e6;
    parameter Real Q5300_2=200.370499*1e6;
    // Machine 5300_1
    parameter Real P5300_1=733.302551*1e6;
    parameter Real Q5300_1=200.370499*1e6;
    // Machine 5600_2
    parameter Real P5600_2=261.114502*1e6;
    parameter Real Q5600_2=289.519989*1e6;
    // Machine 7000_6
    parameter Real P7000_6=705.408630*1e6;
    parameter Real Q7000_6=51.735935*1e6;
    // Machine 7000_7
    parameter Real P7000_7=705.408630*1e6;
    parameter Real Q7000_7=51.735935*1e6;
    // Machine 7000_4
    parameter Real P7000_4=705.408630*1e6;
    parameter Real Q7000_4=51.735935*1e6;
    // Machine 5500_2
    parameter Real P5500_2=291.266541*1e6;
    parameter Real Q5500_2=-52.494392*1e6;
    // Machine 7000_2
    parameter Real P7000_2=705.408630*1e6;
    parameter Real Q7000_2=51.735935*1e6;
    // Machine 7000_3
    parameter Real P7000_3=705.408630*1e6;
    parameter Real Q7000_3=51.735935*1e6;
    // Machine 7000_1
    parameter Real P7000_1=705.408630*1e6;
    parameter Real Q7000_1=51.735935*1e6;
    // Machine 3249_1
    parameter Real P3249_1=446.653534*1e6;
    parameter Real Q3249_1=7.175142*1e6;
    // Machine 3000_3
    parameter Real P3000_3=371.233002*1e6;
    parameter Real Q3000_3=173.005066*1e6;
    // Machine 3249_3
    parameter Real P3249_3=446.653534*1e6;
    parameter Real Q3249_3=7.175142*1e6;
    // Machine 3249_2
    parameter Real P3249_2=446.653534*1e6;
    parameter Real Q3249_2=7.175142*1e6;
    // Machine 3249_5
    parameter Real P3249_5=446.653534*1e6;
    parameter Real Q3249_5=7.175142*1e6;
    // Machine 3249_4
    parameter Real P3249_4=446.653534*1e6;
    parameter Real Q3249_4=7.175142*1e6;
    // Machine 3249_7
    parameter Real P3249_7=446.653534*1e6;
    parameter Real Q3249_7=7.175142*1e6;
    // Machine 3249_6
    parameter Real P3249_6=446.653534*1e6;
    parameter Real Q3249_6=7.175142*1e6;
    // Machine 5100_1
    parameter Real P5100_1=351.755005*1e6;
    parameter Real Q5100_1=433.876678*1e6;
    // Machine 3249_8
    parameter Real P3249_8=446.653534*1e6;
    parameter Real Q3249_8=7.175142*1e6;
    // Machine 5100_2
    parameter Real P5100_2=351.755005*1e6;
    parameter Real Q5100_2=433.876678*1e6;
    // Machine 3300_5
    parameter Real P3300_5=708.448486*1e6;
    parameter Real Q3300_5=29.516121*1e6;
    // Machine 3300_4
    parameter Real P3300_4=708.448486*1e6;
    parameter Real Q3300_4=29.516121*1e6;
    // Machine 6500_2
    parameter Real P6500_2=205.884567*1e6;
    parameter Real Q6500_2=248.786835*1e6;
    // Machine 3300_6
    parameter Real P3300_6=708.448486*1e6;
    parameter Real Q3300_6=29.516121*1e6;
    // Machine 3300_1
    parameter Real P3300_1=708.448486*1e6;
    parameter Real Q3300_1=29.516121*1e6;
    // Machine 5600_3
    parameter Real P5600_3=261.114502*1e6;
    parameter Real Q5600_3=289.519989*1e6;
    // Machine 3300_3
    parameter Real P3300_3=708.448486*1e6;
    parameter Real Q3300_3=29.516121*1e6;
    // Machine 3300_2
    parameter Real P3300_2=708.448486*1e6;
    parameter Real Q3300_2=29.516121*1e6;
    // Machine 3115_1
    parameter Real P3115_1=322.409119*1e6;
    parameter Real Q3115_1=-65.683617*1e6;
    // Machine 3115_3
    parameter Real P3115_3=322.409119*1e6;
    parameter Real Q3115_3=-65.683617*1e6;
    // Machine 3115_2
    parameter Real P3115_2=322.409119*1e6;
    parameter Real Q3115_2=-65.683617*1e6;
    // Machine 3115_5
    parameter Real P3115_5=322.409119*1e6;
    parameter Real Q3115_5=-65.683617*1e6;
    // Machine 3115_4
    parameter Real P3115_4=322.409119*1e6;
    parameter Real Q3115_4=-65.683617*1e6;
    // Machine 3245_1
    parameter Real P3245_1=200.270004*1e6;
    parameter Real Q3245_1=-23.443638*1e6;
    // Machine 3000_1
    parameter Real P3000_1=371.233002*1e6;
    parameter Real Q3000_1=173.005066*1e6;
    // Machine 6000_4
    parameter Real P6000_4=429.843994*1e6;
    parameter Real Q6000_4=8.998412*1e6;
    // Machine 5600_4
    parameter Real P5600_4=261.114502*1e6;
    parameter Real Q5600_4=289.519989*1e6;
    // Machine 6000_1
    parameter Real P6000_1=429.843994*1e6;
    parameter Real Q6000_1=8.998412*1e6;
    // Machine 6000_3
    parameter Real P6000_3=429.843994*1e6;
    parameter Real Q6000_3=8.998412*1e6;
    // Machine 6000_2
    parameter Real P6000_2=429.843994*1e6;
    parameter Real Q6000_2=8.998412*1e6;
    // Machine 7000_8
    parameter Real P7000_8=705.408630*1e6;
    parameter Real Q7000_8=51.735935*1e6;
    // Machine 6700_3
    parameter Real P6700_3=517.749390*1e6;
    parameter Real Q6700_3=173.417313*1e6;
    // Machine 6100_4
    parameter Real P6100_4=628.820984*1e6;
    parameter Real Q6100_4=129.825394*1e6;
    // Machine 6100_5
    parameter Real P6100_5=628.820984*1e6;
    parameter Real Q6100_5=129.825394*1e6;
    // Machine 6700_4
    parameter Real P6700_4=517.749390*1e6;
    parameter Real Q6700_4=173.417313*1e6;
    // Machine 7000_9
    parameter Real P7000_9=705.408630*1e6;
    parameter Real Q7000_9=51.735935*1e6;
    // Machine 6700_2
    parameter Real P6700_2=517.749390*1e6;
    parameter Real Q6700_2=173.417313*1e6;
    // Machine 5300_6
    parameter Real P5300_6=733.302551*1e6;
    parameter Real Q5300_6=200.370499*1e6;
    // Machine 6100_2
    parameter Real P6100_2=628.820984*1e6;
    parameter Real Q6100_2=129.825394*1e6;
    // Machine 6100_3
    parameter Real P6100_3=628.820984*1e6;
    parameter Real Q6100_3=129.825394*1e6;
    // Machine 3359_3
    parameter Real P3359_3=698.948975*1e6;
    parameter Real Q3359_3=268.691681*1e6;
    // Machine 3359_2
    parameter Real P3359_2=698.948975*1e6;
    parameter Real Q3359_2=268.691681*1e6;
    // Machine 3359_1
    parameter Real P3359_1=698.948975*1e6;
    parameter Real Q3359_1=268.691681*1e6;
    // Machine 3359_6
    parameter Real P3359_6=698.948975*1e6;
    parameter Real Q3359_6=268.691681*1e6;
    // Machine 3359_5
    parameter Real P3359_5=698.948975*1e6;
    parameter Real Q3359_5=268.691681*1e6;
    // Machine 3359_4
    parameter Real P3359_4=698.948975*1e6;
    parameter Real Q3359_4=268.691681*1e6;
  end Machines;

  record Trafos "Transformer tap values for initialization"
    extends Modelica.Icons.Record;
    // 2WindingTrafo 5601_6001
    parameter Real t1_5601_6001=1.005400;
    parameter Real t2_5601_6001=1.000000;
    // 2WindingTrafo 6000_6001
    parameter Real t1_6000_6001=1.006300;
    parameter Real t2_6000_6001=1.000000;
    // 2WindingTrafo 3244_3245
    parameter Real t1_3244_3245=1.000000;
    parameter Real t2_3244_3245=1.000000;
    // 2WindingTrafo 5602_5603
    parameter Real t1_5602_5603=1.000000;
    parameter Real t2_5602_5603=1.000000;
    // 2WindingTrafo 3249_3701
    parameter Real t1_3249_3701=1.000000;
    parameter Real t2_3249_3701=1.000000;
    // 2WindingTrafo 6700_6701
    parameter Real t1_6700_6701=1.012500;
    parameter Real t2_6700_6701=1.000000;
    // 2WindingTrafo 5400_5401
    parameter Real t1_5400_5401=1.006400;
    parameter Real t2_5400_5401=1.000000;
    // 2WindingTrafo 5400_5402
    parameter Real t1_5400_5402=1.000000;
    parameter Real t2_5400_5402=1.000000;
    // 2WindingTrafo 3359_3360
    parameter Real t1_3359_3360=0.999800;
    parameter Real t2_3359_3360=1.000000;
    // 2WindingTrafo 5500_5501
    parameter Real t1_5500_5501=1.012600;
    parameter Real t2_5500_5501=1.000000;
    // 2WindingTrafo 5100_5101
    parameter Real t1_5100_5101=1.012750;
    parameter Real t2_5100_5101=1.000000;
    // 2WindingTrafo 5300_5301
    parameter Real t1_5300_5301=0.993650;
    parameter Real t2_5300_5301=1.000000;
  end Trafos;

  Voltages voltages;
  Machines machines;
  Trafos trafos;
  Loads loads;
  annotation (
    defaultComponentName="PF_results",
    defaultComponentPrefixes="inner",
    missingInnerMessage="
    No 'PF_results' data is defined.");
end PF_results;