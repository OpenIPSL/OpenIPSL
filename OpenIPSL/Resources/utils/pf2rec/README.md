SMIB Tutorial: OpenIPSL Model Assembly and Power Flow Integration with GridCal
===================================

**Authors:** [Sergio A. Dorado-Rojas](https://sergio-dorado.github.io) (sergio.dorado.rojas@gmail.com), [Giuseppe Laera](https://www.linkedin.com/in/giuslaera), [Marcelo de Castro Fernandes](https://www.linkedin.com/in/marcelo-de-castro-615570b3), [Dr. Tetiana Bogodorova](https://www.linkedin.com/in/tetiana-bogodorova-ph-d-20711763/), and [Dr. Luigi Vanfretti](https://faculty.rpi.edu/node/36204) (luigi.vanfretti@gmail.com)

### Cite this work :innocent: :thumbsup:
This work was accepted and presented at [The 14th International Modelica Conference](https://2021.international.conference.modelica.org/). Please cite it if you find it useful.

> Dorado-Rojas, S. A., Laera, G., de Castro Fernandes, M., Bogodorova, T., & Vanfretti, L. (2021). Power Flow Record Structures to Initialize OpenIPSL Phasor Time-Domain Simulations with Python.

This repo contains an implementation of the Single Machine Infinite Bus (SMIB) system developed with the Open Instance Power System Library ([OpenIPSL](https://github.com/OpenIPSL/OpenIPSL)). The Python code to generate the power flow records for the models can be found in [pf2rec](/docs/pf2rec). Also available are the SMIB models on the [1.5.0 release](/models/_old/SMIB) and the [2.0.0 version](/models/_new/SMIB) of the library

**Accompanying Material:**

- [Introductory slides](https://docs.google.com/presentation/d/1EKeKHnyoLQeC1HwLtGGRk25ST2qX4dB5cxsqEz3dwW0/edit?usp=sharing) of the YouTube tutorial
- A detailed [step-by-step](https://docs.google.com/document/d/1uB3e-KXT6zUqG7W-FEdlMiI31R2jPnAmmRVvjmAHoT8/edit?usp=sharing) guideline for setting up the Single Machine Infinite Bus (SMIB) model
- To install GridCal alongside Miniconda, please follow the steps [here](/docs/gridcal_installation.md)
- [PSSE files](/models/_old/PSSE_Files) for the SMIB system

## SMIB Tutorial: Assembly and Power Flow Generation for Dynamic Simulation using OpenIPSL

The full playlist of the tutorial we prepared as part of this repository can be found in the link below

[![](http://img.youtube.com/vi/4qfKw9SAXFY/0.jpg)](http://www.youtube.com/watch?v=4qfKw9SAXFY "GridCal Installation")

The tutorial consists of six parts:

- **Part 1:** [GridCal Installation](https://youtu.be/4qfKw9SAXFY)
- **Part 2:** [SMIB Assembly with OpenIPSL (version 2.0.0)](https://youtu.be/DZ_hcUXPjMA)
- **Part 3:** [Power Flow Records Integration](https://youtu.be/XpOjrfYWJyQ)
- **Part 4.1:** [Power Flow Generation using GridCal (single power flow)](https://youtu.be/A8bObYrJeVI)
- **Part 4.2:** [Power Flow Record Integration](https://youtu.be/RMD8WEOi6r4)
- **Part 4.3:** [Time-Series Power Flow Computation using GridCal and Integration to the OpenIPSL Model](https://youtu.be/NjORJBivo_4)

## Scripts

The Python scripts shown in the tutorial are listed here:

- [Creating the power flow record structure for an existing Modelica model](/docs/create_pf_records)
- [Generating a single power flow result using GridCal](/docs/generate_pf_basecase.py)
- [Running a time-series power flow and writing the corresponding power flow records](/docs/generate_tspf_smib.py)

## Command Line Execution

You may reuse the code here right out-of-the-box to populate power flow records for an existing OpenIPSL model provided the power flow network model in PSSE format ([`.raw` file](/models/_old/PSSE_Files)). To generate the power flow structure, place your model inside the `models` subdirectory in the folders `_new` (for OpenIPSL 2.0.0) or `_old` (for OpenIPSL 1.5.0). Then, run:

```
python create_records.py --model <<model_name>> --version <<version_name>>
```

For instance, to generate a base case power flow for the SMIB model developed with the 1.5.0 release of the library, the command

```
python create_records.py --model SMIB --version 1.5.0
```

creates the record structure for the SMIB model with OpenIPSL 1.5.0.

To run a power flow computation and write the corresponding record, do:

```
python run_pf.py --model <<model_name>> --version <<version_name>>
```

For example, to populate a base case power flow for the SMIB model built on OpenIPSL 2.0.0, do:

```
python run_pf.py --model SMIB --version 2.0.0
```
