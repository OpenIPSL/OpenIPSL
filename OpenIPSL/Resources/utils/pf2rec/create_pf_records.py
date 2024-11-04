from .generate_component_list import *
import os

def create_pf_records(model_name, model_mo_path, data_path = None):

    '''
    create_pf_records

    DESCRIPTION:
    this function creates a records structure reading the `.mo` file of a model

    INPUTS:
    - model_name: name of the model (without `.mo` ending).
    This is the name of the main model in Modelica.
    - model_mo_path: absolute path to the folder where the `.mo` file of the OpenIPSL model is located.
    - data_path: absolute path to the folder where the records (and the PF data) will be stored.

    OUTPUTS:
    - void function. Writes `.mo` files inside the data_path

    LAST MODIFICATION DATE:
    10/09/2020 by Sergio A. Dorado-Rojas
    '''

    # Getting the list of the components of the given `.mo` file
    components = generate_component_list(model_mo_path)

    # Sorting alphabetically the component list
    for comp in components.keys():
        components[comp].sort()

    #############################################################
    ################# CREATING RECORD STRUCTURE #################
    #############################################################

    # Getting absolute path of the `PFData` folder
    pf_data_folder_path = os.path.join(data_path, 'PFData')

    # Creating the `PFData` folder if it does not exist
    if not os.path.exists(pf_data_folder_path):
        os.makedirs(pf_data_folder_path)

    # Adding the `PFData` reference to the `package.order` file
    pk_order_path = os.path.join(data_path, 'package.order') # Getting the path to the 'package.order' file

    # Checking if `PFData` already is in `package.order`
    with open(pk_order_path, 'r') as file:
        lines = file.readlines()

    # If it is not, then append `PFData` at the end of the package.order file
    with open(pk_order_path, 'a') as file:
        if 'PFData\n' not in lines:
            file.writelines('PFData\n')

    # Creating `package.mo` file for the `PFData` of each model (if it does not exist yet)
    if 'package.mo' not in os.listdir(pf_data_folder_path):
        pack_mo_path = os.path.join(pf_data_folder_path, 'package.mo')
        pack_mo = open(pack_mo_path, "w+")

        pack_mo.write("within {};\n".format(model_name))
        pack_mo.write("package PFData\n\n")
        pack_mo.write("end PFData;")
        pack_mo.close()

    # Creating `package.order` file for each model (if it does not exist yet)
    if 'package.order' not in os.listdir(pf_data_folder_path):
        pack_order_path = os.path.join(pf_data_folder_path, 'package.order')
        pack_order = open(pack_order_path, "w+")
        # Writing main record structure
        pack_order.write("PowerFlow\n")

        # Writing main record template
        pack_order.write("PowerFlowTemplate\n")

        # Writing subfolders with power flow results
        pack_order.write("BusData\n")
        pack_order.write("LoadData\n")
        pack_order.write("TrafoData\n")
        pack_order.write("MachineData\n")
        pack_order.close()

    # Creating `PowerFlow.mo` file for each model (if it does not exist yet)
    if 'PowerFlow.mo' not in os.listdir(pf_data_folder_path):
        pf_path = os.path.join(pf_data_folder_path, 'PowerFlow.mo')
        pf_data = open(pf_path, "w+")

        # Header of the `.mo` file
        pf_data.write("within {}.PFData;\n".format(model_name))
        pf_data.write("record PowerFlow\n")
        pf_data.write("extends Modelica.Icons.Record;\n\n")

        # Power flow attribute declaration
        pf_data.write("replaceable record PowerFlow = {}.PFData.PowerFlowTemplate \n".format(model_name))
        pf_data.write("constrainedby {}.PFData.PowerFlowTemplate\n".format(model_name))
        pf_data.write("annotation(choicesAllMatching);\n\n")
        pf_data.write("PowerFlow powerflow;\n\n")

        pf_data.write("end PowerFlow;")
        pf_data.close()

    # Creating `PowerFlowTemplate.mo` file for each model (if it does not exist yet)
    if 'PowerFlowTemplate.mo' not in os.listdir(pf_data_folder_path):
        pf_data_path = os.path.join(pf_data_folder_path, 'PowerFlowTemplate.mo')
        pf_data = open(pf_data_path, "w+")

        # Header of the `.mo` file
        pf_data.write("within {}.PFData;\n".format(model_name))
        #pf_data.write("partial record PowerFlowTemplate\n")
        pf_data.write("record PowerFlowTemplate\n")
        pf_data.write("extends Modelica.Icons.Record;\n\n")

        pf_data.write("end PowerFlowTemplate;")
        pf_data.close()

    ######################################################
    ################# CREATING TEMPLATES #################
    ######################################################

    type_p = 'OpenIPSL.Types.ActivePower'
    type_q = 'OpenIPSL.Types.ReactivePower'
    type_voltage_pu = 'OpenIPSL.Types.PerUnit'
    type_angle = 'OpenIPSL.Types.Angle' # angle in radians

    ###########################
    ####### BUS TEMPLATE ######
    ###########################

    bus_data_dir = os.path.join(pf_data_folder_path, "BusData")
    if not os.path.exists(bus_data_dir):
        os.makedirs(bus_data_dir)

    # Creating `package.mo`
    if 'package.mo' not in os.listdir(bus_data_dir):
        # Creating the 'package.mo' file for the bus data
        if 'package.mo' not in os.listdir(bus_data_dir):
            pack_mo_path = os.path.join(bus_data_dir, "package.mo")
            pack_mo = open(pack_mo_path, "w+")
            pack_mo.write("within {}.PFData;\n".format(model_name))
            pack_mo.write("package BusData\n\n")
            pack_mo.write("end BusData;")
            pack_mo.close()

    # Creating `BusTemplate.mo`
    if 'BusTemplate.mo' not in os.listdir(bus_data_dir):

        # Creating the `.mo` file
        bus_template_path = os.path.join(bus_data_dir, 'BusTemplate.mo')
        bus_template = open(bus_template_path, "w+")
        bus_template.write(f"within {model_name}.PFData.BusData;\n")
        bus_template.write("partial record BusTemplate\n\n")

        for n_bus, bus in enumerate(components['buses']):

            # Write v, A (and delta for the slack)
            bus_template.write(f"parameter {type_voltage_pu} v{n_bus + 1} \"(pu) {bus}\" annotation(Dialog(enable = false));\n")
            bus_template.write(f"parameter {type_angle} A{n_bus + 1} \"{bus}\" annotation(Dialog(enable = false));\n\n")

        bus_template.write("end BusTemplate;")
        bus_template.close()

    ###########################
    ##### LOADS TEMPLATE ######
    ###########################

    loads_data_dir = os.path.join(pf_data_folder_path, "LoadData")
    if not os.path.exists(loads_data_dir):
        os.makedirs(loads_data_dir)

    # Creating `package.mo`
    if 'package.mo' not in os.listdir(loads_data_dir):
        pack_mo_path = os.path.join(loads_data_dir, "package.mo")
        pack_mo = open(pack_mo_path, "w+")
        pack_mo.write("within {}.PFData;\n".format(model_name))
        pack_mo.write("package LoadData\n\n")
        pack_mo.write("end LoadData;")
        pack_mo.close()

    if 'LoadTemplate.mo' not in os.listdir(loads_data_dir):

        # Creating the `.mo` file
        loads_template_path = os.path.join(loads_data_dir, 'LoadTemplate.mo')
        loads_template = open(loads_template_path, "w+")
        loads_template.write(f"within {model_name}.PFData.LoadData;\n")
        loads_template.write("partial record LoadTemplate\n\n")

        for n_load, load in enumerate(components['loads']):

            # Write P,Q
            loads_template.write(f"parameter {type_p} PL{n_load + 1} \"{load}\" annotation(Dialog(enable = false));\n")
            loads_template.write(f"parameter {type_q} QL{n_load + 1} \"{load}\" annotation(Dialog(enable = false));\n\n")

        loads_template.write("end LoadTemplate;")
        loads_template.close()

    ###########################
    #### MACHINES TEMPLATE ####
    ###########################

    machines_data_dir = os.path.join(pf_data_folder_path, "MachineData")
    if not os.path.exists(machines_data_dir):
        os.makedirs(machines_data_dir)

    # Creating `package.mo`
    if 'package.mo' not in os.listdir(machines_data_dir):
        pack_mo_path = os.path.join(machines_data_dir, "package.mo")
        pack_mo = open(pack_mo_path, "w+")
        pack_mo.write("within {}.PFData;\n".format(model_name))
        pack_mo.write("package MachineData\n\n")
        pack_mo.write("end MachineData;")
        pack_mo.close()

    # Creating the `.mo` file
    if 'MachineTemplate.mo' not in os.listdir(machines_data_dir):

        # Creating the `.mo` file
        machines_template_path = os.path.join(machines_data_dir, 'MachineTemplate.mo')
        machines_template = open(machines_template_path, "w+")
        machines_template.write(f"within {model_name}.PFData.MachineData;\n")
        machines_template.write("partial record MachineTemplate\n\n")

        for n_gen, gen in enumerate(components['generators']):
            # Write PG, QG
            machines_template.write(f"parameter {type_p} PG{n_gen + 1} \"{gen}\" annotation(Dialog(enable = false));\n")
            machines_template.write(f"parameter {type_q} QG{n_gen + 1} \"{gen}\" annotation(Dialog(enable = false));\n\n")

        machines_template.write("end MachineTemplate;")
        machines_template.close()

    ###########################
    ## TRANSFORMERS TEMPLATE ##
    ###########################

    trafos_data_dir = os.path.join(pf_data_folder_path, "TrafoData")
    if not os.path.exists(trafos_data_dir):
        os.makedirs(trafos_data_dir)

    # Creating `package.mo`
    if 'package.mo' not in os.listdir(trafos_data_dir):
        pack_mo_path = os.path.join(trafos_data_dir, "package.mo")
        pack_mo = open(pack_mo_path, "w+")
        pack_mo.write("within {}.PFData;\n".format(model_name))
        pack_mo.write("package TrafoData\n\n")
        pack_mo.write("end TrafoData;")
        pack_mo.close()

    # Creating `.mo` file
    if 'TrafoTemplate.mo' not in os.listdir(trafos_data_dir):

        # Creating the `.mo` file
        trafos_template_path = os.path.join(trafos_data_dir, 'TrafoTemplate.mo')
        trafos_template = open(trafos_template_path, "w+")
        trafos_template.write(f"within {model_name}.PFData.TrafoData;\n")
        trafos_template.write("partial record TrafoTemplate\n\n")

        for n_trafo, trafo in enumerate(components['trafos']):
            # Write t1, t2
            trafos_template.write(f"parameter Real t1_trafo_{n_trafo + 1} \"{trafo}\" annotation(Dialog(enable = false));\n")
            trafos_template.write(f"parameter Real t2_trafo_{n_trafo + 1} \"{trafo}\" annotation(Dialog(enable = false));\n\n")

        trafos_template.write("end TrafoTemplate;")
        trafos_template.close()

    return
