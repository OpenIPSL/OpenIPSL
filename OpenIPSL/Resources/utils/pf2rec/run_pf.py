from pf2rec import *

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import datetime
import random

import GridCalEngine.api as gce

LIST_OF_MODELS = ['AVRI', 'IEEE9', 'IEEE14', 'SMIB', 'TwoAreas']

import argparse
import os

parser = argparse.ArgumentParser()

parser.add_argument("model", help = "Model for which the power flow structure will be created")

args = parser.parse_args()

if __name__ == '__main__':

    _model = args.model
    if _model not in LIST_OF_MODELS:
        raise ValueError('Model not available')

# Absolute path to the data directory of the model
data_path = os.path.abspath(os.path.join(os.getcwd(), "models", _model))

grid = None

# Grid model in GridCal
grid = gce.open_file(os.path.abspath(os.path.join(data_path,
                                                  "PSSE_Files",
                                                  f"{_model}_Base_Case.raw")))

# Power flow options
options = gce.PowerFlowOptions(solver_type = gce.SolverType.NR,
                    verbose = True,
                    initialize_with_existing_solution = False,
                    tolerance = 1e-12,
                    max_iter = 99,
                    control_q = True)

pf = gce.PowerFlowDriver(grid, options)

pf.run()

gridcal2rec(grid = grid, pf = pf, model_name = _model,
    data_path = data_path,
    pf_num = 0, export_pf_results = False,
    is_time_series = False)