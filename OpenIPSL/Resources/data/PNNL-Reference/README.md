# PNNL-Reference

PSS/E 36.4 results of the seven REGFM_A1 validation cases of Pacific Northwest National Laboratory, as published in
release V1 of [PSCAD and PSS/E versions of the WECC grid-forming inverter models](https://github.com/pnnl/PSCAD-and-PSSE-Version-of-WECC-Grid-Forming-Inverter-Models).
The tests in `OpenIPSL.Tests.GFCs.GFMs.REGFMA1.PNNL` read them with `Modelica.Blocks.Sources.CombiTimeTable`, so that a
simulation can be plotted against PSS/E. PSS/E 36.7.1 gives the same values.

| File | PNNL's case |
|---|---|
| `VoltStepDown.txt` | 1: the voltage of bus 601 steps to 0.95 pu at 3 s |
| `VoltStepUp.txt` | 2: the voltage of bus 601 steps to 1.05 pu at 3 s |
| `FreqStepDown.txt` | 3: the frequency of bus 601 steps to 59.8 Hz at 3 s |
| `FreqStepUp.txt` | 4: the frequency of bus 601 steps to 60.2 Hz at 3 s |
| `Fault01s.txt` | 5: fault of 0.000434 pu at bus 401 for 0.1 s |
| `Fault05s.txt` | 6: the same fault for 0.5 s |
| `Fault05sHI.txt` | 7: fault of 0.0139 pu at bus 401 for 0.5 s |

Columns, as PSS/E names the channels of bus 401: time (s), P (`POWR`), Q (`VARS`), V (`ETRM`), I (`ITRM`), all in pu on
0.1 MVA, and the speed deviation (`SPD`, pu). The step is 4.2 ms and the values are single precision.

The files are comma-separated, in the text format of the table reader: a first line `#1`, comment lines that start with
`#`, and a line `double PNNL(rows,6)` before the numbers. They are named `.txt` because that is the one format both
versions of the Modelica Standard Library in use read: version 4.0.0, which OpenIPSL declares, has no CSV reader, and
version 4.1.0 reads a file named `.csv` as a plain table, without those lines.

Two things differ from the published files. Only these five channels are kept. The time column is PSS/E's integration
time, k times the step, instead of its single-precision label, so that a discontinuity falls at the time of the event.

The data are under the BSD 3-Clause License of that repository: see [`LICENSE.md`](LICENSE.md).
