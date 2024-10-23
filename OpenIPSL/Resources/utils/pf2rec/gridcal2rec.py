import os
import pandas as pd
import numpy as np
import re

import GridCalEngine.api as gce

EPS = np.finfo(float).eps

# Function to write single power flow
def _write_single_pf(grid, pf, model_name, data_dirs, pf_num, export_pf_results, is_time_series, ts_name):
    '''
    _WRITE_SINGLE_PF

    DESCRIPTION:
    this function generates the files to write a single power flow record
    using a power flow result from GridCal

    INPUTS:
    - `grid`: GridCal power flow model of the power system
    - `pf`: GridCal power flow object (containing power flow results)
    In case this is a time-series power flow result, the flag `is_time_series` must be set to `True`
    - `model_name`: name of the Modelica model (for creating records the first time)
    - `data_dirs`: dictionary containing the paths to the data directories
    where the bus, load, machine, and transformer records will be written
    - `pf_num`: number of the power flow (for automation in an outer loop)
    - `export_pf_results`: export power flow results as `.csv` files: one for buses, another for machines
    - `is_time_series`: flag that indicates whether the script is being called inside a time-series power flow loop. It only changes the name of the output file
    -  `ts_name`: name of the time-series

    OUTPUTS:
    None

    LAST MODIFICATION DATE:
    10/01/2021 BY SADR
    '''

    # Extracting data directories
    bus_data_dir = data_dirs['buses']
    loads_data_dir = data_dirs['loads']
    machines_data_dir = data_dirs['machines']
    trafos_data_dir = data_dirs['trafos']
    pf_data_dir = data_dirs['PFData']

    #####################################
    ### WRITING LOAD POWER FLOW DATA ####
    #####################################

    # Adding the PF result reference to the `package.order` file
    pk_order_path = os.path.join(pf_data_dir, 'package.order') # Getting the path to the 'package.order' file

    # Checking if the PF already is in `package.order`
    with open(pk_order_path, 'r') as file:
        lines = file.readlines()

    if is_time_series:
        if ts_name == None:
            raise ValueError('Time-series name not specified')
        else:
            extension_record = f'{ts_name}_{pf_num:05d}'
    else:
        extension_record = f'{pf_num:05d}'

    # If it is not, then append `PFData` at the end of the package.order file
    with open(pk_order_path, 'a') as file:
        if f'PF{extension_record}\n' not in lines:
            file.writelines(f'PF{extension_record}\n')

    file.close()

    pf_result_file_path = os.path.join(pf_data_dir, f"PF{extension_record}.mo")

    # Heading of the record definition
    pf_result = open(pf_result_file_path, "w+")
    pf_result.write(f"within {model_name}.PFData;\n")
    pf_result.write(f"record PF{extension_record}\n")
    pf_result.write(f"extends {model_name}.PFData.PowerFlowTemplate;\n\n")

    pf_result.write(f"replaceable record Bus = {model_name}.PFData.BusData.PFBus{extension_record} \"Bus power flow results\"\n")
    pf_result.write(f"constrainedby {model_name}.PFData.BusData.BusTemplate;\n")
    #pf_result.write("annotation(choicesAllMatching);\n")
    pf_result.write(f"Bus bus;\n\n")

    pf_result.write(f"replaceable record Load = {model_name}.PFData.LoadData.PFLoad{extension_record} \"Loads power flow results\"\n")
    pf_result.write(f"constrainedby {model_name}.PFData.LoadData.LoadTemplate;\n")
    #pf_result.write("annotation(choicesAllMatching);\n")
    pf_result.write(f"Load load;\n\n")

    pf_result.write(f"replaceable record Machine = {model_name}.PFData.MachineData.PFMachine{extension_record} \"Machine power flow results\"\n")
    pf_result.write(f"constrainedby {model_name}.PFData.MachineData.MachineTemplate;\n")
    #pf_result.write("annotation(choicesAllMatching);\n")
    pf_result.write(f"Machine machine;\n\n")

    pf_result.write(f"replaceable record Trafo = {model_name}.PFData.TrafoData.PFTrafo{extension_record} \"Trafos power flow results\"\n")
    pf_result.write(f"constrainedby {model_name}.PFData.TrafoData.TrafoTemplate;\n")
    #pf_result.write("annotation(choicesAllMatching);\n")
    pf_result.write(f"Trafo trafo;\n\n")

    pf_result.write(f"end PF{extension_record};".format(num = pf_num))
    pf_result.close()

    # Adjusting the units to the new format in the OpenIPSL library
    # just for power at loads and generators
    adjust_units = '1e06*'
    adjust_angle = 1 # leaving angle in rad

    #####################################
    ### WRITING LOAD POWER FLOW DATA ####
    #####################################

    # Creating '.mo' file for storing the load power flow results
    load_result_file_path = os.path.join(loads_data_dir, f"PFLoad{extension_record}.mo")
    load_result = open(load_result_file_path, "w+")
    load_result.write(f"within {model_name}.PFData.LoadData;\n")
    load_result.write(f"record PFLoad{extension_record}\n")
    load_result.write(f"extends {model_name}.PFData.LoadData.LoadTemplate(\n\n")

    for n_load, load in enumerate(grid.get_loads()):

        load_result.write("// Load: '{}'\n".format(str(load.name)))
        load_result.write(f"PL{n_load + 1} = {adjust_units}({load.P:.7f}),\n")
        if n_load == len(grid.get_loads()) - 1:
            load_result.write(f"QL{n_load + 1} = {adjust_units}({load.Q:.7f})\n\n")
        else:
            load_result.write(f"QL{n_load + 1} = {adjust_units}({load.Q:.7f}),\n\n")

    load_result.write(");\n")
    load_result.write(f"end PFLoad{extension_record};")
    load_result.close()

    ####################################
    ### WRITING BUS POWER FLOW DATA ####
    ####################################

    bus_result_file_path = os.path.join(bus_data_dir, f"PFBus{extension_record}.mo")
    bus_result = open(bus_result_file_path, "w+")
    bus_result.write(f"within {model_name}.PFData.BusData;\n")
    bus_result.write(f"record PFBus{extension_record}\n")
    bus_result.write(f"extends {model_name}.PFData.BusData.BusTemplate(\n\n")

    for n_bus, bus in enumerate(grid.get_buses()):

        if pf.results.bus_types[n_bus] == 1:
            # PQ Bus
            bus_result.write("// Bus: '{}' (PQ bus)\n".format(bus.name))
        elif pf.results.bus_types[n_bus] == 2:
            # PV Bus
            bus_result.write("// Bus: '{}' (PV bus)\n".format(bus.name))
        elif pf.results.bus_types[n_bus] == 3:
            # Slack Bus
            bus_result.write("// Bus: '{}' (slack bus)\n".format(bus.name))

        # Writing bus voltage phasor magnitude
        bus_voltage_magnitude = np.abs(pf.results.voltage[n_bus])
        bus_result.write("v{b_name} = {v_magn:.7f},\n".format(b_name = n_bus + 1, v_magn = bus_voltage_magnitude))

        # Writing bus voltage phasor angle in degrees
        bus_voltage_angle = np.arctan(np.imag(pf.results.voltage[n_bus]) \
            / np.real(pf.results.voltage[n_bus])) * adjust_angle
        if n_bus == len(grid.buses) - 1:
            bus_result.write("A{b_name} = {v_angl:.7f}\n\n".format(b_name = n_bus + 1, v_angl = bus_voltage_angle))
        else:
            bus_result.write("A{b_name} = {v_angl:.7f},\n\n".format(b_name = n_bus + 1, v_angl = bus_voltage_angle))

    bus_result.write(");\n")
    bus_result.write(f"end PFBus{extension_record};")
    bus_result.close()

    ############################################
    ### WRITING TRANSFORMER POWER FLOW DATA ####
    ############################################

    # Containers for information about the buses
    br_trafos_index = []
    br_trafos_from = []
    br_trafos_name = []
    br_trafos_to = []

    # Getting indices of the branches which are a transformer in the grid object
    for n_branch, branch in enumerate(grid.get_branches()):
        if str(branch.device_type) == gce.DeviceType.Transformer2WDevice:
            br_trafos_index.append(n_branch)
            br_trafos_from.append(branch.bus_from)
            br_trafos_to.append(branch.bus_to)
            br_trafos_name.append(branch.name.split()) # Strip is used to remove blank spaces from the name

    trafos_result_file_path = os.path.join(trafos_data_dir, f"PFTrafo{extension_record}.mo")
    trafos_result = open(trafos_result_file_path, "w+")
    trafos_result.write(f"within {model_name}.PFData.TrafoData;\n")
    trafos_result.write(f"record PFTrafo{extension_record}\n")
    trafos_result.write(f"extends {model_name}.PFData.TrafoData.TrafoTemplate(\n\n")

    if br_trafos_index:
        # Writing tap results
        for n_trafo, trafo in enumerate(pf.results.tap_module):
            trafos_result.write("// TRAFO: '{}'\n".format(br_trafos_name[n_trafo]))
            trafos_result.write("// From: '{}' - To: '{}'\n".format(br_trafos_from[n_trafo], br_trafos_to[n_trafo]))
            trafos_result.write("t1_trafo_{n_traf} = {t:.7f},\n".format(n_traf = n_trafo + 1, t = pf.results.tap_module[n_trafo]))
            if n_trafo == len(br_trafos_index) - 1:
                trafos_result.write("t2_trafo_{n_traf} = 1.0000000\n\n".format(n_traf = n_trafo + 1))
            else:
                trafos_result.write("t2_trafo_{n_traf} = 1.0000000,\n\n".format(n_traf = n_trafo + 1))

    trafos_result.write(");\n")
    trafos_result.write(f"end PFTrafo{extension_record};")
    trafos_result.close()

    ############################################
    ### WRITING GENERATOR POWER FLOW DATA ######
    ############################################

    # Creating the '.mo' file
    machines_result_file_path = os.path.join(machines_data_dir, f"PFMachine{extension_record}.mo")
    machines_result = open(machines_result_file_path, "w+")
    machines_result.write(f"within {model_name}.PFData.MachineData;\n")
    machines_result.write(f"record PFMachine{extension_record}\n")
    machines_result.write(f"extends {model_name}.PFData.MachineData.MachineTemplate(\n\n")

    # Creating Pandas DataFrame with power flow results and bus type for each bus (power only)
    pf_S_bus_results = pd.DataFrame(columns = [], index = pf.results.bus_names)

    # Adding active power and reactive power to the buses
    pf_S_bus_results["P [MW]"] = np.real(pf.results.Sbus)
    pf_S_bus_results["Q [Mvar]"] = np.imag(pf.results.Sbus)

    # Adding the bus type
    pf_S_bus_results["Bus_Type"] = pf.results.bus_types

    # Getting information of the generators and loads of the system
    gen_name = []
    gen_bus = []
    gen_P = []

    # Information required to allocate reactive power in multi-plant units
    gen_P_max = []
    gen_P_min = []
    gen_Q_max = []
    gen_Q_min = []
    gen_active = []

    load_name = []
    load_bus = []
    load_Q = []
    load_P = []

    for gen in grid.get_generators():
        gen_name.append(str(gen.name).strip())
        gen_bus.append(str(gen.bus).strip())
        gen_P.append(gen.P)
        gen_P_max.append(gen.Pmax)
        gen_P_min.append(gen.Pmin)
        gen_Q_max.append(gen.Qmax)
        gen_Q_min.append(gen.Qmin)
        gen_active.append(gen.active)

    for load in grid.get_loads():
        load_name.append(str(load.name).strip())
        load_bus.append(str(load.bus).strip())
        load_P.append(load.P)
        load_Q.append(load.Q)

    df_gen_data = pd.DataFrame(columns = [], index = gen_name)
    df_gen_data["Bus"] = gen_bus
    df_gen_data["P [MW]"] = gen_P
    df_gen_data["Pmin [MW]"] = gen_P_min
    df_gen_data["Pmax [MW]"] = gen_P_max
    df_gen_data["Qmin [Mvar]"] = gen_Q_min
    df_gen_data["Qmax [Mvar]"] = gen_Q_max
    df_gen_data["Active"] = gen_active

    df_load_data = pd.DataFrame(columns = [], index = load_name)
    df_load_data["P [MW]"] = load_P
    df_load_data["Bus"] = load_bus
    df_load_data["Q [Mvar]"] = load_Q

    gen_P = []
    gen_Q = []

    for n_gen, gen in enumerate(gen_name):

        # Getting the bus to which the generator is connected
        gen_bus = df_gen_data.loc[gen]["Bus"]

        # Getting the bus type
        bus_type = pf_S_bus_results.loc[gen_bus]["Bus_Type"]

        if bus_type == 3:
            # If the bus is the slack bus, then read the generated power from the power flow

            # Net active power at the corresponding bus
            P_net_bus = pf_S_bus_results.loc[gen_bus]["P [MW]"]

            # Sum of all active power of the loads connected to the generation bus (if any)
            P_load_sum = np.abs(df_load_data.loc[df_load_data["Bus"] == gen_bus]["P [MW]"].sum())

            # Generated active power at the bus
            P_gen_bus = P_net_bus + P_load_sum

            # Number of generators connected at the bus
            n_gens = len(df_gen_data.loc[df_gen_data["Bus"] == gen_bus])

            if n_gens == 1:
                P_machine = P_gen_bus
                gen_P.append(P_machine)
            else:
                # Distribute 'P' along all machines equally (for the time being)
                P_machine = P_gen_bus / n_gens
                gen_P.append(P_machine)

        else:
            # Getting the active power dispatch of the generator
            P_machine = df_gen_data.loc[gen]["P [MW]"]
            gen_P.append(P_machine)

        # ----------------------------------------------------------------------
        # ----------------- Reactive power allocation --------------------------
        # ----------------------------------------------------------------------

        # Net reactive power at the corresponding bus
        Q_net_bus = pf_S_bus_results.loc[gen_bus]["Q [Mvar]"]

        # Sum of all reactive power of the loads connected to the generation bus (if any)
        Q_load_sum = np.abs(df_load_data.loc[df_load_data["Bus"] == gen_bus]["Q [Mvar]"].sum())

        # Generated reactive power at the bus
        Q_gen_bus = Q_net_bus + Q_load_sum

        # Number of generators connected at the bus
        n_gens = len(df_gen_data.loc[df_gen_data["Bus"] == gen_bus])

        if n_gens == 1:
            Q_machine = Q_gen_bus
        else:
            # Distribute 'Q' along all machines equally (for the time being)
            #Q_machine = Q_gen_bus / n_gens
            #gen_Q.append(Q_machine)
            # Sum of the maximum and minimum reactive power limit of all the generators connected to the bus
            Q_tot_max = df_gen_data.loc[df_gen_data["Bus"] == gen_bus]['Qmax [Mvar]'].sum()
            Q_tot_min = df_gen_data.loc[df_gen_data["Bus"] == gen_bus]['Qmin [Mvar]'].sum()

            # Minimum and maximum ranges of the machine
            Q_mach_min = df_gen_data.loc[gen]["Qmin [Mvar]"]
            Q_mach_max = df_gen_data.loc[gen]["Qmax [Mvar]"]

            if Q_mach_min == Q_mach_max:
                # No range to allocate more reactive power to the machine rather
                # than what has already been allocated
                Q_machine = Q_gen_bus / n_gens
            else:
                Q_machine = Q_mach_min + ((Q_gen_bus - Q_tot_min) / (Q_tot_max - Q_tot_min + EPS)) * (Q_mach_max - Q_mach_min)

        gen_Q.append(Q_machine)

        # ----------------------------------------------------------------------
        # ----------------- Writing power flow result --------------------------
        # ----------------------------------------------------------------------

        machines_result.write("// MACHINE: '{}'\n".format(gen))
        machines_result.write("// Bus: {}'\n".format(gen_bus))
        machines_result.write(f"PG{n_gen + 1} = {adjust_units}({P_machine:.7f}),\n")

        if n_gen == len(gen_name) - 1:
            machines_result.write(f"QG{n_gen + 1} = {adjust_units}({Q_machine:.7f})\n\n")
        else:
            machines_result.write(f"QG{n_gen + 1} = {adjust_units}({Q_machine:.7f}),\n\n")

    machines_result.write(");\n")
    machines_result.write(f"end PFMachine{extension_record};")
    machines_result.close()

    # ----------------------------------------------------------------------
    # ----------- EXPORTING PF RESULT AS `.csv` FILE------------------------
    # ----------------------------------------------------------------------

    if export_pf_results:

        # EXPORTING PF RESULTS AS `.csv` FILES

        # Creating the csv file directory
        pf_data_csv_dir = os.path.join(pf_data_dir, "PF_Results_csv")

        if not os.path.exists(pf_data_csv_dir):
            os.makedirs(pf_data_csv_dir)

        ######################
        #### BUS VOLTAGE #####
        ######################

        headers = ["Bus_Type", "|V| [pu]", "d [deg]"]
        df_voltage = pd.DataFrame(index = grid.get_bus_dict().keys(), columns = headers)
        df_voltage["Bus_Type"] = pf.results.bus_types
        df_voltage["|V| [pu]"] = np.abs(pf.results.voltage)
        df_voltage["d [deg]"] = np.arctan(np.imag(pf.results.voltage)/np.real(pf.results.voltage))*180/np.pi

        # Exporting to `.csv`
        voltage_results = os.path.join(pf_data_csv_dir, f"PFBusresults_{extension_record}.csv")
        df_voltage.to_csv(voltage_results, index = True)

        ########################
        #### MACHINE POWER #####
        ########################

        headers = ["P [MW]", "Q [Mvar]"]
        df_machines = pd.DataFrame(index = gen_name, columns = headers)
        df_machines["P [MW]"] = gen_P
        df_machines["Q [Mvar]"] = gen_Q

        # Exporting to `.csv`
        machine_results = os.path.join(pf_data_csv_dir, f"PF_machine_results_{extension_record}.csv")
        df_machines.to_csv(machine_results, index = True)

        ########################
        ######## LOADS #########
        ########################

        # Exporting to `.csv`
        load_results = os.path.join(pf_data_csv_dir, f"PF_load_results_{extension_record}.csv")
        df_load_data.to_csv(load_results, index = True)

        ####################################
        ######## NET POWER PER BUS #########
        ####################################

        # Per bus
        headers = ["P [MW]", "Q [Mvar]", "Bus_Type"]
        df_bus = pd.DataFrame(index = grid.bus_names, columns = headers)

        # Bus results data frame
        df_bus["P [MW]"] = np.real(pf.results.Sbus)*grid.Sbase
        df_bus["Q [Mvar]"] = np.imag(pf.results.Sbus)*grid.Sbase
        df_bus["Bus_Type"] = pf.results.bus_types

        # Exporting to `.csv`
        bus_power_results = os.path.join(pf_data_csv_dir, f"PFBuspower_results_{extension_record}.csv")
        df_bus.to_csv(bus_power_results, index = True)


def gridcal2rec(grid, pf, model_name, data_path = None, pf_num = 1, export_pf_results = False, is_time_series = False, ts_name = None):
    '''
    GRIDCAL2REC

    DESCRIPTION:
    This function takes a GridCal multicircuit model and a power flow result and writes them into a power flow record compatible with Dymola.
    The template for the power flow is defined using the function `create_pf_records`.

    INPUTS:
    - `grid`: GridCal power flow model of the power system
    - `pf`: GridCal power flow object (containing power flow results)
    In case this is a time-series power flow result, the flag `is_time_series` must be set to `True`
    - `model_name`: name of the Modelica model (for creating records the first time)
    - `path_pf_data`: absolute path to the `PFData` folder where the records will be written
    - `pf_num`: number of the power flow (for automation in an outer loop)
    - `export_pf_results`: export power flow results as `.csv` files: one for buses, another for machines
    - `is_time_series`: flag that indicates whether the script is being called inside a time-series power flow loop. It only changes the name of the output file
    -  `ts_name`: name of the time-series

    OUTPUTS:
    Writes a power flow record compatible with OpenIPSL

    LAST MODIFICATION DATE:
    10/09/2020 by Sergio A. Dorado-Rojas
    '''

    # Getting the path to the `PFData` folder
    # That should be the current working directory if nothing has been specified --for testing--
    if data_path is None:
        data_path = os.getcwd()

    pf_data_dir = os.path.join(data_path, "PFData")

    # Creating the `PFData` folder if it does not exist yet
    if not os.path.exists(pf_data_dir):
        os.makedirs(pf_data_dir)

    # Creating directories for power flow results (buses, loads, machines and trafos)
    bus_data_dir = os.path.join(pf_data_dir, "BusData")
    loads_data_dir = os.path.join(pf_data_dir, "LoadData")
    machines_data_dir = os.path.join(pf_data_dir, "MachineData")
    trafos_data_dir = os.path.join(pf_data_dir, "TrafoData")

    data_dirs = {'buses': bus_data_dir,
    'loads' : loads_data_dir,
    'trafos' : trafos_data_dir,
    'machines' :  machines_data_dir,
    'PFData' :  pf_data_dir}
    _write_single_pf(grid, pf, model_name, data_dirs, pf_num, export_pf_results, is_time_series, ts_name)
