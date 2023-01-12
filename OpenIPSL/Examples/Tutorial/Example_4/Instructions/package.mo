within OpenIPSL.Examples.Tutorial.Example_4;
package Instructions "Instructions"
  extends Modelica.Icons.Information;
  annotation (DocumentationClass=true, Documentation(info="<html>
  <h4>Before You Start</h4>
  <h5>Prerequisites</h5>
  <ul>
    <li>Dymola/OpenModelica installation.</li>
    <li>
      <strong>GridCal</strong> setup to generate the power flow solutions. Please refer to section <a href=\"modelica://OpenIPSL.Examples.Tutorial.Example_4.Instructions.InstallingGridCal\">Installing GridCal</a> for installation instructions.
    </li>
    <li>OpenIPSL library.</li>
    <li>Download the files of the <a href=\"https://github.com/ALSETLab/SMIB_Tutorial\">SMIB_Tutorial</a> repository. </li>
  </ul>
  <h5>System Parameters</h5>
  <p>The system parameters for the static power flow model are listed below:</p>
  <table cellspacing=\"0\" cellpadding=\"0\" border=\"1\">
    <caption align=\"bottom\"><em>* A three-phase fault is to be set at bus FAULT</em></caption>
    <tr>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\">
          <strong>Bus No.</strong></p>
      </th>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>Bus Name</strong></p>
      </th>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>Type</strong></p>
      </th>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>V (pu)</strong></p>
      </th>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>Angle</strong></p>
      </th>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>P (MW)</strong></p>
      </th>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>Q (Mvar)</strong></p>
      </th>
    </tr>
    <tr>
      <td>
        <p align=\"center\">1 </p>
      </td>
      <td>
        <p align=\"center\">B01 </p>
      </td>
      <td>
        <p align=\"center\">PV </p>
      </td>
      <td>
        <p align=\"center\">1.0000 </p>
      </td>
      <td>
        <p align=\"center\">From PF </p>
      </td>
      <td>
        <p align=\"center\">40.0000 </p>
      </td>
      <td>
        <p align=\"center\">From PF </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">2 </p>
      </td>
      <td>
        <p align=\"center\">B02 </p>
      </td>
      <td>
        <p align=\"center\">Slack </p>
      </td>
      <td>
        <p align=\"center\">1.0000 </p>
      </td>
      <td>
        <p align=\"center\">0.0000 </p>
      </td>
      <td>
        <p align=\"center\">From PF </p>
      </td>
      <td>
        <p align=\"center\">From PF </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">3 </p>
      </td>
      <td>
        <p align=\"center\">B03* </p>
      </td>
      <td>
        <p align=\"center\">PQ </p>
      </td>
      <td>
        <p align=\"center\">From PF </p>
      </td>
      <td>
        <p align=\"center\">From PF </p>
      </td>
      <td>
        <p align=\"center\">0.0000 </p>
      </td>
      <td>
        <p align=\"center\">0.0000 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">4 </p>
      </td>
      <td>
        <p align=\"center\">B04 </p>
      </td>
      <td>
        <p align=\"center\">PQ </p>
      </td>
      <td>
        <p align=\"center\">From PF </p>
      </td>
      <td>
        <p align=\"center\">From PF </p>
      </td>
      <td>
        <p align=\"center\">50.0000 </p>
      </td>
      <td>
        <p align=\"center\">10.0000 </p>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table cellspacing=\"0\" cellpadding=\"0\" border=\"1\">
    <tr>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>Line Name</strong></p>
      </th>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>From Bus</strong></p>
      </th>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>To Bus</strong></p>
      </th>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>R (pu)</strong></p>
      </th>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>X (pu)</strong></p>
      </th>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>B (pu)</strong></p>
      </th>
    </tr>
    <tr>
      <td>
        <p align=\"center\">line_01 </p>
      </td>
      <td>
        <p align=\"center\">B01 </p>
      </td>
      <td>
        <p align=\"center\">B03 </p>
      </td>
      <td>
        <p align=\"center\">0.0010 </p>
      </td>
      <td>
        <p align=\"center\">0.2000 </p>
      </td>
      <td>
        <p align=\"center\">0.0000 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">line_02 </p>
      </td>
      <td>
        <p align=\"center\">B03 </p>
      </td>
      <td>
        <p align=\"center\">B02 </p>
      </td>
      <td>
        <p align=\"center\">0.0010 </p>
      </td>
      <td>
        <p align=\"center\">0.2000 </p>
      </td>
      <td>
        <p align=\"center\">0.0000 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">line_03 </p>
      </td>
      <td>
        <p align=\"center\">B03 </p>
      </td>
      <td>
        <p align=\"center\">B04 </p>
      </td>
      <td>
        <p align=\"center\">0.0005 </p>
      </td>
      <td>
        <p align=\"center\">0.1000 </p>
      </td>
      <td>
        <p align=\"center\">0.0000 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">line_04 </p>
      </td>
      <td>
        <p align=\"center\">B04 </p>
      </td>
      <td>
        <p align=\"center\">B02 </p>
      </td>
      <td>
        <p align=\"center\">0.0005 </p>
      </td>
      <td>
        <p align=\"center\">0.1000 </p>
      </td>
      <td>
        <p align=\"center\">0.0000 </p>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>For the dynamic part of the simulation, the parameters of the models are:</p>
  <table cellspacing=\"0\" cellpadding=\"0\" border=\"1\">
    <tr>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>Generator (Bus)</strong></p>
      </th>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>Generator Type</strong></p>
      </th>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>Exciter</strong></p>
      </th>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>Turbine Governor</strong></p>
      </th>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>Stabilizer</strong></p>
      </th>
    </tr>
    <tr>
      <td>
        <p align=\"center\">1 </p>
      </td>
      <td>
        <p align=\"center\">GENROE </p>
      </td>
      <td>
        <p align=\"center\">None </p>
      </td>
      <td>
        <p align=\"center\">None </p>
      </td>
      <td>
        <p align=\"center\">None </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">3 </p>
      </td>
      <td>
        <p align=\"center\">GENCLS </p>
      </td>
      <td>
        <p align=\"center\">None </p>
      </td>
      <td>
        <p align=\"center\">None </p>
      </td>
      <td>
        <p align=\"center\">None </p>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table cellspacing=\"0\" cellpadding=\"0\" border=\"1\">
    <tr>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>Generator (Bus)</strong></p>
      </th>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>Parameter</strong></p>
      </th>
      <th bgcolor=\"#b3e6ff\">
        <p align=\"center\"><strong>Value</strong></p>
      </th>
    </tr>
    <tr>
      <td rowspan=\"17\">
        <p align=\"center\">GENROE</p>
      </td>
      <td>
        <p align=\"center\">Mbase </p>
      </td>
      <td>
        <p align=\"center\">100 MVA </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">T&apos;do (&gt; 0) </p>
      </td>
      <td>
        <p align=\"center\">5.0000 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">T&apos;&apos;do (&gt; 0) </p>
      </td>
      <td>
        <p align=\"center\">0.0700 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">T&apos;qo (&gt; 0) </p>
      </td>
      <td>
        <p align=\"center\">0.9000 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">T&apos;&apos;qo (&gt; 0) </p>
      </td>
      <td>
        <p align=\"center\">0.0900 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">H, Inertia </p>
      </td>
      <td>
        <p align=\"center\">4.2800 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">D, Speed Damping </p>
      </td>
      <td>
        <p align=\"center\">0.0000 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">Xd </p>
      </td>
      <td>
        <p align=\"center\">1.8400 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">Xq </p>
      </td>
      <td>
        <p align=\"center\">1.7500 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">X&apos;d </p>
      </td>
      <td>
        <p align=\"center\">0.4100 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">X&apos;q </p>
      </td>
      <td>
        <p align=\"center\">0.6000 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">X&apos;&apos;d = X&apos;&apos;q </p>
      </td>
      <td>
        <p align=\"center\">0.2000 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">Xl </p>
      </td>
      <td>
        <p align=\"center\">0.1200 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">S(1.0) </p>
      </td>
      <td>
        <p align=\"center\">0.1100 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">S(1.2) </p>
      </td>
      <td>
        <p align=\"center\">0.3900 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">Ra </p>
      </td>
      <td>
        <p align=\"center\">0.0000 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">Xsource (= Xpq) </p>
      </td>
      <td>
        <p align=\"center\">0.2000 </p>
      </td>
    </tr>
    <tr>
      <td rowspan=\"5\">
        <p align=\"center\">GENCLS</p>
      </td>
      <td>
        <p align=\"center\">Mbase </p>
      </td>
      <td>
        <p align=\"center\">100 MVA </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">Inertia H </p>
      </td>
      <td>
        <p align=\"center\">5.0000 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">Damping Constant D </p>
      </td>
      <td>
        <p align=\"center\">0.0000 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">Ra </p>
      </td>
      <td>
        <p align=\"center\">0.0000 </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align=\"center\">XSource </p>
      </td>
      <td>
        <p align=\"center\">0.2000 </p>
      </td>
    </tr>
  </table>
</html>"));
end Instructions;
