within OpenIPSL.UsersGuide;
model Publications "Publications"
  extends Modelica.Icons.References;
  annotation (Documentation(info="<html>
<p>The list of publications written about OpenIPSL library and its models can be found below. </p>
<p>If you use OpenIPSL in your work or research, we kindly ask you to cite (preferably), our <a href=\"https://www.sciencedirect.com/science/article/pii/S2352711018300050\">SoftwareX</a> paper:</p>

<ul>
<li>M. Baudette, M. Castro, T. Rabuzin, J. Lavenius, T. Bogodorova, L. Vanfretti,
    OpenIPSL: Open-Instance Power System Library — Update 1.5 to &quot;iTesla Power Systems Library (iPSL):
    A Modelica library for phasor time-domain simulations&quot;, SoftwareX, Volume 7, January–June 2018, Pages 34-36, ISSN 2352-7110,
    <a href= \"https://doi.org/10.1016/j.softx.2018.01.002\">DOI: 10.1016/j.softx.2018.01.002</a>.</li>
</ul>

<p>Otherwise, you cite one of the following papers, according to a specific use of OpenIPSL:</p>

<ul>

<li>M. de Castro, G. Laera, F. Fachini, S.A. Dorado-Rojas, L. Vanfretti, S. Ahmed, C. Mishra, K.D. Jones and R. M. Gardner,
    &quot;Power System Real-Time Simulation using Modelica and the FMI&quot;,
    American Modelica Conference 2022, October 26-28, 2022, Dallas, Texas, US.</li>

<li>G. Laera, L. Vanfretti, M. de Castro Fernandes, S.A. Dorado-Rojas, F. Fachini, C. Mishra, K.D. Jones and R.M. Gardner,
    &quot;Guidelines and Use Cases for Power System Dynamics Modeling and Model Verification using Modelica&quot;,
    American Modelica Conference 2022, October 26-28, 2022, Dallas, Texas, US.
</li>

<li>S. Boersma, X. Bombois, L. Vanfretti, J.C. Gonzalez-Torres, and A. Benchaib,
    &quot;Probing Signal Design for Enhanced Damping Estimation in Power Networks&quot;,
    International Journal of Electrical Power &amp; Energy Systems, vol. 129, July 2021, 106640, ISSN 0142-0615.
    <a href=\"https://doi.org/10.1016/j.ijepes.2020.106640\">DOI:10.1016/j.ijepes.2020.106640</a>.</li>

<li>M. Podlaski, L. Vanfretti, T. Bogodorova, T. Rabuzin, and M. Baudette,
    &quot;RaPId - A Parameter Estimation Toolbox for Modelica/FMI-Based Models Exploiting Global Optimization Methods&quot;,
    SYSID 2021 - 19th IFAC Symposium on System Identification – Learning Models for Decision and Control, Padova, Italy, 14-16 July 2021,
    IFAC-PapersOnLine, Volume 54, Issue 7, 2021, Pages 391-396, ISSN 2405-8963,
    <a href=\"https://doi.org/10.1016/j.ifacol.2021.08.391\">DOI: 10.1016/j.ifacol.2021.08.391</a>.
    <a href=\"https://youtu.be/S5QT6j5DOY4\">Video of paper presentation</a> and <a href=\"https://github.com/ALSETLab/RaPId\">GitHub repository</a>.</li>

<li>L. Vanfretti, G. Laera, M. de Castro Fernandes, C. Wang, C. Mishra and K. D. Jones,
    &quot;Initial steps in deploying and calibrating power system models on a sychrophasor data cloud platform using FMI &quot;,
    User Presentation at the FMI User Meeting at the Modelica Conference 2021, 14th International Modelica Conference, Linköping, September 20-24, 2021.
    <a href=\"https://raw.githubusercontent.com/modelica/ModelicaConference2021/master/presentations/FMI-User-Meeting/01_FMI_Dominion_Model_Calibration_Slides.pdf\">Presentation</a>, and
    <a href=\"https://ecse.rpi.edu/~vanfrl/documents/publications/conference/2021/CNPR_2021_05_LV_Dominion_Cloud_MODELICA_2021_paper_45.pdf\">authors' copy of abstract</a>.</li>

<li>B. Mukherjee, M. de Castro Fernandes, and L. Vanfretti,
    &quot;A PMU-Based Control Scheme for Islanded Operation and Re-synchronization of DER &quot;,
    International Journal of Electrical Power & Energy Systems, Volume 133, 2021, 107217, ISSN 0142-0615,
    <a href=\"https://doi.org/10.1016/j.ijepes.2021.107217\">DOI: 10.1016/j.ijepes.2021.107217</a></li>

<li>F.J. Gomez, L. Vanfretti, M. Aguilera, and Svein H. Olsen,
    &quot;Software Requirements for Interoperable and Standard-Based Power System Modeling Tools &quot;,
    Simulation Modelling Practice and Theory, Volume 103, 2020, 102095, ISSN 1569-190X,
    <a href=\"https://doi.org/10.1016/j.simpat.2020.102095\">DOI: 10.1016/j.simpat.2020.102095</a></li>

<li>M. de Castro Fernandes, M. Navarro Catalan, M. Baudette, and L. Vanfretti,
    &quot;The Open Instance Power System Library (OpenIPSL): A Modelica Library for Phasor Time-Domain Simulations &quot;,
    User Presentation at the American Modelica Conference 2020, Boulder, Colorado, USA, March 23-25, 2020.
    Presentation <a href=\"https://2020.american.conference.modelica.org/proceedings/userpresentations/MarcelodeCastroOpenIPSL.pdf\">Presentation PDF</a>,
    <a href=\"https://www.youtube.com/watch?v=2i3fvgFtcYA\">video</a>, and
    <a href=\"https://sites.ecse.rpi.edu/~vanfrl/documents/publications/conference/2020/CNPR202002_openipsl_abstract.pdf\">authors' copy of abstract</a>.</li>

<li>S.A. Dorado-Rojas, M. Navarro Catalan, M. de Castro Fernandes, and L. Vanfretti,
    &quot;Performance Benchmark of Modelica Time-Domain Power System Automated Simulations using Python &quot;,
    Proceedings of the American Modelica Conference 2020, Boulder, Colorado, USA, March 23-25, 2020,
    <a href=\"https://doi.org/10.3384/ecp2016928\">DOI: 10.3384/ecp2016928</a></li>

<li> M. Podlaski, L. Vanfretti, M. de Castro Fernandes, and J. Pesente,
    &quot;Parameter Estimation of User-Defined Control System Models for Itaipu Power Plant using Modelica and OpenIPSL &quot;,
    Proceedings of the American Modelica Conference 2020, Boulder, Colorado, USA, March 23-25, 2020,
    <a href=\"https://doi.org/10.3384/ecp20169139\">DOI: 10.3384/ecp20169139</a></li>

<li> M. Podlaski, L. Vanfretti, J. Pesente and P. H. Galassi,
    &quot;Automated Parameter Identification and Calibration for the Itaipu Power Generation System using Modelica, FMI, and RaPId &quot;,
    2019 7th Workshop on Modeling and Simulation of Cyber-Physical Energy Systems (MSCPES), 2019, pp. 1-5,
    <a href=\"https://doi.org/10.1109/MSCPES.2019.8738793\">DOI: 10.1109/MSCPES.2019.8738793.</a></li>

<li> L. Vanfretti, B. Mukherjee, K. M. Moudgalya, and F. J. Gomez,
    &quot;Automatic Re-synchronization Controller Analysis within a Multi-Domain Gas Turbine and Power System Model &quot;,
    2019 7th Workshop on Modeling and Simulation of Cyber-Physical Energy Systems (MSCPES), 2019, pp. 1-5,
    <a href=\"https://doi.org/10.1109/MSCPES.2019.8738797\">DOI: 10.1109/MSCPES.2019.8738797.</a></li>

<li> E. Henningsson, H. Olsson, and L. Vanfretti,
    &quot;DAE Solvers for Large-Scale Hybrid Models &quot;,
    Proceedings of the 13th International Modelica Conference, Regensburg, Germany, March 4–6, 2019,
    <a href=\"http://dx.doi.org/10.3384/ecp19157491\">DOI: 10.3384/ecp19157491</a></li>

<li> M. de Castro Fernandes, L. Vanfretti, Janaina G. de Oliveira, and M. Baudette,
    &quot;A Fundamental Time-Domain and Linearized Eigenvalue Analysis of Coalesced Power Transmission and Unbalanced Distribution Grids using Modelica and the OpenIPSL &quot;,
    Proceedings of the 13th International Modelica Conference, Regensburg, Germany, March 4–6, 2019,
    <a href=\"http://dx.doi.org/10.3384/ecp19157617\">DOI: 10.3384/ecp19157617</a></li>

<li> B. Mukherjee, and L. Vanfretti,
    &quot;Modeling of PMU-Based Automatic Re-synchronization Controls for DER Generators in Power Distribution Networks using Modelica and the OpenIPSL &quot;,
    Proceedings of the 13th International Modelica Conference, Regensburg, Germany, March 4–6, 2019,
    <a href=\"http://dx.doi.org/10.3384/ecp19157607\">DOI: 10.3384/ecp19157607</a></li>

<li> M. de Castro Fernandes, J. G. de Oliveira, L. Vanfretti, M. Baudette, and M.A. Tomim,
    &quot;Modeling and simulation of a hybrid single-phase/three-phase system in Modelica &quot;,
    2018 Simposio Brasileiro de Sistemas Eletricos (SBSE), 2018, pp. 1-7,
    <a href=\"http://dx.doi.org/10.1109/SBSE.2018.8395775\">DOI: 10.1109/SBSE.2018.8395775 </a></li>

<li> M. Aguilera, L. Vanfretti, and F. Gomez,
    &quot;Experiences in power system multi-domain modeling and simulation with Modelica &amp; FMI: The case of gas power turbines and power systems &quot;,
    2018 Workshop on Modeling and Simulation of Cyber-Physical Energy Systems (MSCPES), 2018, pp. 1-6,
    <a href=\"http://dx.doi.org/10.1109/MSCPES.2018.8405397\">DOI: 10.1109/MSCPES.2018.8405397</a></li>

<li> M. Aguilera, L. Vanfretti, T. Bogodorova, and F. Gomez,
    &quot;Coalesced Gas Turbine and Power System Modeling and Simulation using Modelica &quot;,
    Proceedings of The American Modelica Conference 2018, October 9-10, Samberg Conference Center, Cambridge MA, USA, Issue 154, 2019-02-26, Pages 112-120, ISSN 1650-3740.
    <a href=\"http://dx.doi.org/10.3384/ecp1815493\">DOI: 10.3384/ecp1815493</a></li>

<li> B. Mukherjee, and L. Vanfretti,
    &quot;Modeling of PMU-Based Islanded Operation Controls for Power Distribution Networks using Modelica and OpenIPSL &quot;,
    Proceedings of The American Modelica Conference 2018, October 9-10, Samberg Conference Center, Cambridge MA, USA, Issue 154, 2019-02-26, Pages 112-120, ISSN 1650-3740.
    <a href=\" http://doi.org/10.3384/ecp18154112\">DOI: 10.3384/ecp18154112</a></li>

<li>D. Winkler,
    &quot;Analysing the stability of an Islanded hydro-electric power system&quot;,
    Proceedings of The American Modelica Conference 2018, October 9-10, Samberg Conference Center, Cambridge MA, USA, Issue 154, 2019-02-26, Pages 112-120, ISSN 1650-3740.
    <a href=\" http://doi.org/10.3384/ecp18154103\">DOI: 10.3384/ecp18154103</a></li>

<li>D. Winkler,
    &quot;Electrical Power System Modelling in Modelica - Comparing Open-source Library Options&quot;,
    Proceedings of the 58th Conference on Simulation and Modelling (SIMS 58), September 25-27, Reykjavik, Iceland,
    Issue 188, 2017-09-27, Pages 263-270, ISSN 1650-3740.
    <a href=\" http://doi.org/10.3384/ecp17138263\">DOI: 10.3384/ecp17138263</a></li>

<li> T. Rabuzin, M. Baudette and L. Vanfretti,
     &quot;Implementation of a continuous integration workflow for a power system Modelica library,&quot;
     2017 IEEE Power &amp; Energy Society General Meeting, 2017, pp. 1-5,
     <a href=\"https://doi.org/10.1109/PESGM.2017.8274618\">DOI: 10.1109/PESGM.2017.8274618.</a></li>

<li> L. Vanfretti, T. Rabuzin, M. Baudette, and M. Murad,
    &quot;iTesla Power Systems Library (iPSL): A Modelica library for phasor time-domain simulations,&quot;
    SoftwareX, Available online 18 May 2016, ISSN 2352-7110,
    <a href=\"https://doi.org/10.1016/j.softx.2016.05.001\">DOI: 10.1016/j.softx.2016.05.001.</a></li>

<li> M. Zhang, M. Baudette, J. Lavenius, S. Løvlund, and L. Vanfretti,
    &quot;Modelica Implementation and Software-to-Software Validation of Power
    System Component Models Commonly used by Nordic TSOs for Dynamic Simulations&quot;,
    In Proceedings of the 56th Conference on Simulation and Modelling (SIMS 56),
    7-9 October 2015, Linköping, Sweden.
    <a href=\"http://dx.doi.org/10.3384/ecp15119105\">DOI: 10.3384/ecp15119105</a></li>

<li> M. Sabate, G. Leon, M. Halat, J.B. Heyberger, F.J. Gomez and L. Vanfretti,
    &quot;Aspects of Power System Modeling, Initialization and Simulation using the Modelica Language&quot;,
    2015 IEEE Eindhoven PowerTech 2015, June 29 - July 02, 2015, Eindhoven, Netherlands.
    <a href=\"https://doi.org/10.1109/PTC.2015.7232504\">DOI: 10.1109/PTC.2015.7232504</a></li>

<li> M.A. Adib Murad, F.J. Gomez, and L. Vanfretti,
    &quot;Equation-Based Modeling of FACTS using Modelica&quot;,
    2015 IEEE Eindhoven PowerTech 2015, June 29 - July 02, 2015, Eindhoven, Netherlands.
    <a href=\"https://doi.org/10.1109/PTC.2015.7232500\">DOI: 10.1109/PTC.2015.7232500</a></li>

<li> M.A. Adib Murad, F.J. Gomez, and L. Vanfretti,
    &quot;Equation-Based Modeling and Simulation of Three-Winding, and Regulating Transformers using Modelica&quot;,
    2015 IEEE Eindhoven PowerTech 2015, June 29 - July 02, 2015, Eindhoven, Netherlands.
    <a href=\"https://doi.org/10.1109/PTC.2015.7232503\">DOI: 10.1109/PTC.2015.7232503</a></li>

<li> L. Vanfretti, T. Bogodorova, and M. Baudette,
    &quot;Power System Model Identification Exploiting the Modelica Language and FMI Technologies&quot;,
    2014 IEEE International Conference on Intelligent Energy and Power Systems, June 2-6, 2014, Kyiv, Ukraine.
    <a href=\"https://doi.org/10.1109/IEPS.2014.6874164\">DOI: 10.1109/IEPS.2014.6874164</a></li>

<li> L. Vanfretti, T. Bogodorova, and M. Baudette,
    &quot;A Modelica Power System Component Library for Model Validation and Parameter Identification&quot;,
    10th International Modelica Conference, Mar. 10 – 12, 2014, Lund, Sweden.
    <a href=\"https://doi.org/10.3384/ecp140961195\">DOI: 10.3384/ecp140961195</a></li>

<li> T. Bogodorova, M. Sabate, G. León, L. Vanfretti, M. Halat, J.B. Heyberger, and P. Panciatici,
    &quot;A Modelica Power System Library for Phasor Time-Domain Simulation&quot;,
    IEEE ISGT Europe 2013, Oct. 6 – 9, 2013, Lyngby, Denmark.
    <a href=\"https://doi.org/10.1109/ISGTEurope.2013.6695422\">DOI: 10.1109/ISGTEurope.2013.6695422</a></li>

<li> L. Vanfretti, W. Li, T. Bogodorova, and P.Panciatici,
    &quot;Unambiguous Power System Modeling and Simulation using Modelica Tools&quot;,
    2013 IEEE Power and Energy Society General Meeting, Jul. 21 – 25, 2013, Vancouver, Canada.
    <a href=\"https://doi.org/10.1109/PESMG.2013.6672476\">DOI: 10.1109/PESMG.2013.6672476</a></li>
</ul>

<p>In addition, you can also browse a few of the thesis of the students that carried out their MSc and PhD research under Prof. Vanfretti's group in the following links:</p>

<ul>
<li><a href= \"https://ecse.rpi.edu/~vanfrl/documents/mscthesis/2013_Joan_MSc_Thesis.pdf\">Joan Russinol (2013)</a>.</li>
<li><a href= \"https://ecse.rpi.edu/~vanfrl/documents/mscthesis/2014_LeQi_MScThesis.pdf\">Le Qi (2014)</a>.</li>
<li><a href= \"https://ecse.rpi.edu/~vanfrl/documents/mscthesis/2015_Ahsan_MScThesis.pdf\">M.Ahsan Adib Murad (2015)</a>.</li>
<li><a href= \"https://ecse.rpi.edu/~vanfrl/documents/mscthesis/2015_MengjiaZhang_MScThesis.pdf\">Mengjia Zhang (2015)</a>.</li>
<li><a href= \"https://ecse.rpi.edu/~vanfrl/documents/mscthesis/2018_Marcelo_Thesis.pdf\">Marcelo de Castro Fernandes (2017)</a>.</li>
<li><a href= \"https://ecse.rpi.edu/~vanfrl/documents/mscthesis/2017_MiguelAguilera.pdf\">Miguel Aguilera Chavez (2017)</a>.</li>
<li><a href= \"https://ecse.rpi.edu/~vanfrl/documents/mscthesis/2017_Biswarup.pdf\">Biswarup Mukherjee (2017)</a>.</li>
<li><a href= \"https://ecse.rpi.edu/~vanfrl/documents/phdthesis/2017_Bogodorova_PhD_Thesis.pdf\">Dr. Tetiana Bogodorova (2017)</a>.</li>
</ul>

</html>"));
end Publications;
