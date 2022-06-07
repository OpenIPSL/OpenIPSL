<!---
[![Build Status](https://travis-ci.org/OpenIPSL/OpenIPSL.svg?branch=master)](https://travis-ci.org/OpenIPSL/OpenIPSL)
[![Documentation Status](https://readthedocs.org/projects/openipsl/badge/?version=latest)](http://openipsl.readthedocs.io/en/latest/?badge=latest)
-->
[![Build Status](https://github.com/openipsl/openipsl/actions/workflows/checkCI.yml/badge.svg?branch=master)](https://github.com/OpenIPSL/OpenIPSL/actions)

# **OpenIPSL**: Open-Instance Power System Library
The OpenIPSL or Open-Instance Power System Library is a library of power system component models written in the [Modelica](http://modelica.org) language that can be used for power system dynamic analysis, such as phasor time-domain simulations.

The OpenIPSL is currently developed and maintained by Prof. [Luigi Vanfretti's](https://github.com/lvanfretti) research group [ALSETLab](https://github.com/ALSETLab) at [Rensselaer Polytechnic Institute](http://rpi.edu), Troy, NY, collaborators and friends, such as [Dietmar Winkler](https://github.com/dietmarw) and [FOSSEE](https://om.fossee.in/fellowship2018) (contributions are welcome!).

## Scope
The OpenIPSL is developed to be used for research and education (therefore frequent release times may be available), with maximum compatibility with [OpenModelica](https://openmodelica.org/) (to provide a free/libre and cost-free alternative for power system dynamic simulation), to provide as many as possible typical "test networks" for use in research and teaching, and to be developed in such way that the library can efficiently be used for power system simulation within Modelica-based workflows (i.e., helping to give reference power system models for development and testing of Modelica back-end compilers) when faced with power system simulation challenges.

Please note that the library contains only the models that can be used for dynamic studies. As such, there are no solver tools provided in this repository (no Power Flow Solvers, no Time-Domain solvers, etc.).
The user should use a Modelica-compliant tool for simulation of models in this lirbary.

## History
The iPSL is a [Modelica](https://www.modelica.org) library developed during the [iTesla project](http://www.itesla-project.eu/).
The members of this project (OpenIPSL) at SmarTS Lab (now [ALSETLab](https://github.com/ALSETLab)) where key developers of the iPSL until March 31, 2016, when the iTesla project was completed.
Prof. [Luigi Vanfretti](https://github.com/lvanfretti) lead the development of a large amount of the models of the library (particularly those that replicate results from PSAT and PSS/E).
iPSL is part of the [iTesla Tool](https://github.com/itesla/ipst), and thus, it is subject to the needs of the consortium that develops the iTesla Tool.
Therefore, the SmarTS Lab / ALSETLab team decided to create the OpenIPSL fork in order to develop the library in a direction that is more suitable for researchers and teachers/professors, and in a transparent, open source software approach.

## Documentation
Documentation is provided within the library and can be accessed when loading OpenIPSL in any Modelica-compliant tool. Tutorials on OpenIPSL have been given at many conferences, and are available under [Release](https://github.com/OpenIPSL/OpenIPSL/releases). We recommend you start from there.

Our documentation assumes that you have working knowledge of the Modelica language, are familiar with a Modelica-compliant modeling and simulation environment, that you have proeficient knowledge on power system steady state analysis (i.e., the so called "power flow"), and knowledge on power system dynamic modeling (i.e., the called "transient" and "small-signal" stability). As such, the documentation is limited, and aims to provide very consice information for people who fulfill the requirements above. If you do not fulfill these requirements, we recommend that you first get acquainted with both Modelica and Power Systems.

## Citing OpenIPSL in Publications
If you use OpenIPSL in your work or research, all we ask you in exchange is that you **cite the reference publications**, according to your use. Please consult our publication list, located within the User's Guide package, in the Publications page, for browsing the reference publications. Preferrably, please cite this repository by using our preferred reference, as seen on GitHub GUI.

You are also welcome to submit your contributions as stated below.

## Contributing

Contributions to the library are welcome and can be submitted in the form of pull requests to this repository. Please consult the [contribution guidelines](.github/CONTRIBUTING.md) for more information on how to contribute to the development of this library. Information about our current and past contributors can be found when the library is loaded into a Modelica-compliant software. The information is located within the Users' Guide package, in the Contact page.

If you want to submit your contributions to the OpenIPSL, note that we make use of an automated assistant for dealing with Contributor's License Agreements (CLAs). Please read the [CLA intructions](.github/legal/README.md) beforehand. If you have any questions, please don't hesitate to <a href="mailto:luigi.vanfretti@gmail.com?subject=Contributing_to_OpenIPSL">contact us</a>.

## Copyright and License Information

**OpenIPSL:** Copyright April 2016 - current [Luigi Vanfretti](https://github.com/lvanfretti), [ALSETLab](https://github.com/ALSETLab), Troy, NY (Formely SmarTS Lab, Stockholm, Sweden).

The authors can be contacted by email: <a href="mailto:luigi.vanfretti@gmail.com?subject=OpenIPSL_License">luigi.vanfretti@gmail.com</a>.

This Source Code Form is subject to the terms of the [3-Clause BSD license](https://opensource.org/licenses/BSD-3-Clause).

## Acknowledgements

This work was supported primarily by the following grants and institutions, in reverse chronological order:
- 2018-2023: Dominion Energy Virginia through sponsored research projects: (2018-2019) Flexible Alternating Current Transmission System Modeling and Performance Analysis using Measurement Data, (2020-2021) Model Validation of Generator Power Plants, and (2021-2022) Cloud-Based Integrated Model-and-Measurement Analytics for Power System Applications, at Rensselaer Polytechnic Institute.
- 2019-2021: New York State Energy Research and Development Authority (NYSERDA) through the Electric Power Transmission and Distribution (EPTD) PON 3770 High Performing Grid Program together with the New York Power Authority (NYPA).
- 2018-2020: This work was also supported in part by the ERC Program of the National Science Foundation and DOE under NSF Award Number EEC-1041877 and in part by the CURENT Industry Partnership Program.
