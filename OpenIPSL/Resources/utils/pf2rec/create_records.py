from pf2rec import *

import argparse
import os
import re

parser = argparse.ArgumentParser()

parser.add_argument("--model", help = "Name of the package containing the target OpenIPSL model. Defaults to 'SMIB'")

args = parser.parse_args()

if __name__ == '__main__':

    if args.model:
        _model = args.model
    else:
        _model = 'SMIB'

    # Absolute path to the '.mo' file of the model (total model)
    data_path = os.path.abspath(os.path.join(os.getcwd(), "models", _model))

    path_mo_file = os.path.abspath(os.path.join(data_path, f"{_model}Total.mo"))

    # Remove Modelica code lines from the '.mo' file that alter the expected input for
    #   pf2rec functions (the GenerationUnits package section of Modelica code should 
    #   be excluded)
    includeCodeLine = False # True if line of code should be included
    new_lines = list()
    with open(path_mo_file, "r") as mo_file:
        lines = mo_file.readlines()

        for l in lines:
            if re.search(r'^package\sSMIB', l):
                includeCodeLine = True
            if re.search(r'^\s+package\sGenerationUnits', l):
                includeCodeLine = False
            if re.search(r'^\s+package\sBaseNetwork', l):
                includeCodeLine = True
            if includeCodeLine:
                new_lines.append(l);

    with open(path_mo_file, "w") as mo_file:
        for l in new_lines:
            mo_file.write("{}".format(l))

    create_pf_records(_model,
                      path_mo_file,
                      data_path)
