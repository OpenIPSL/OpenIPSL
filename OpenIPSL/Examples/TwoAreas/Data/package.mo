within OpenIPSL.Examples.TwoAreas;
package Data "Power flow data records for network initialization"
annotation (Documentation(info="<html>
<p>This package contains four different sets of data records that can be used to initialize the power network on a determined operating point.</p>
<p>The power flow records can be used to test how the operating point alters the dynamic response observed after a disturbance.</p>
<p>Note that some of the PF records may not work in all three example systems. For example, note that the first three data records (<strong>PF1, PF2 and PF3</strong>) cannot be applied to <strong>Two_Area_PSSE_AVR</strong>.</p>
</html>"));
end Data;
