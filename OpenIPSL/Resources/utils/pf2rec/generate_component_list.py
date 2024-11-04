import re
import os

def remove_prefix(text, prefix):
    '''
    Description:

    Function to remove a given prefix from a list

    Arguments:
    - text: given text container (preferably a string)
    - prefix: prefix that is to be removed from 'text'
    '''

    if text.startswith(prefix):
        return text[len(prefix):]
    return text  # or whatever

def generate_component_list(model_mo_path):
    '''

    DESCRIPTION:
    this function generates a dictionary of lists with the component names of the devices employed to construct the power system models using the OpenIPSL library.

    INPUTS:
    - model_mo_path: absolute path to the `.mo` file of the model
    If the `.mo` file is `IEEE_14_Base_Case.mo`, then the absolute path can be constructed as:

        model_mo_path = os.path.join(os.getcwd(), 'IEEE_14_Base_Case.mo')

    OUTPUTS:
    - components: dictionary containing lists of the line, transformer, generator, load, bus and faults model name in each of the models.
    Note that the keys of the dictionaries are `lines`, `trafos`, `generators`, `loads`, `buses` and `faults`.
    '''

    lines = []
    trafos = []
    generators = []
    loads = []
    buses = []
    faults = []

    #############################################
    #     READING COMPONENT NAME FROM MODELS    #
    #############################################

    # Opening raw text file of the '.mo' file
    model_mo = open(model_mo_path, "r")
    # Parsing file into a list and splitting it per new line. The output is a list
    model_mo_text = model_mo.read().split('\n')

    # Converting the list into a single string
    model_mo_full_text = '\n'.join(model_mo_text)

    # Regular expression for finding lines
    line_regex = re.compile(r'OpenIPSL.Electrical.Branches.PwLine (\w+)')
    lines = line_regex.findall(model_mo_full_text)

    # Regular expression for finding buses
    bus_regex = re.compile(r'OpenIPSL.Electrical.Buses.(?:BusExt|Bus|InternalBus) (\w+)')
    buses = bus_regex.findall(model_mo_full_text)

    # Regular expression for finding loads
    load_regex = re.compile(r'OpenIPSL.Electrical.Loads.(?:PSAT|PSSE).(?:\w+) (\w+)')
    loads = load_regex.findall(model_mo_full_text)

    # Regular expression for finding transformers (substations) connecting buses
    trafo_regex = re.compile(r'(?:^\s)*OpenIPSL.Electrical.Branches.(?:(?!PwLine)\w+).(?:\w*)(?:\s)*(\w+)')
    trafos = trafo_regex.findall(model_mo_full_text)

    # Regular expression for finding faults
    fault_regex = re.compile(r'OpenIPSL.Electrical.Events.(?:\w+) (\w+)')
    faults = fault_regex.findall(model_mo_full_text)

    # Regular expression for finding shunts
    shunt_regex = re.compile(r'OpenIPSL.Electrical.Banks.(?:\w+(?:.\w+)*) (\w+)')
    shunts = shunt_regex.findall(model_mo_full_text)

    # First we try with the plant model of PSS/E
    gen_regex = re.compile(r'OpenIPSL.Electrical.Machines.PSSE.Plant(?:\s)*(\w+)')
    gens = gen_regex.findall(model_mo_full_text)

    if len(gens) == 0:
        # If nothing was found with the new PSS/E-based plant model, look for this
        # WARNING: no result might be found
        # This regex has worked with the N44 model
        regex_patterns = [r'BaseModels.GeneratingUnits.GeneratorOnly(?:\s)*(\w+)',
                          r'GeneratingUnits.InfiniteBus(?:\s)*(\w+)']
        for pattern in regex_patterns:
            gen_regex = re.compile(pattern)
            gens.extend(gen_regex.findall(model_mo_full_text))

    # If at this point there is nothing in `gens`, an error is raised
    if len(gens) == 0:
        raise ValueError('No generators were found. Revisit your model and name the generators class appropriately (e.g., `gen`, `generators`, etc).')

    components = {'lines': lines, 'trafos' : trafos, 'generators' : gens,
        'loads' : loads, 'buses' : buses, 'faults' : faults, 'shunts' : shunts}

    return components
