# Nodes
NODES = ('EGFR', 'MEK1', 'ERK1', 'GSK3', 'CREB1',
         'BioAkt', 'PRAS40', 'P70S6K', 'RS6')

PERTURBATION_NAMES = (
    # Receptors
    'IGF1Ri3uM', 'IGF1Ri10uM', 'EGFRi03uM', 'EGFRi1uM',
    # MAPK pathway
    'RAFi1uM', 'MEKi0002uM', 'MEKi002uM', 'ERKi002uM', 'ERKi04uM', "GSK3i2uM",
    "GSK3i5uM",
    # AKT pathway
    'PI3Ki1uM', 'PI3Ki2uM', 'AKTi1uM', 'AKTi5uM', 'mTORi001uM', 'mTORi03uM',
    # 2x MAPK
    'EGFRi03uM_IGF1Ri3uM', 'EGFRi03uM_MEKi0002uM', 'EGFRi03uM_ERKi002uM',
    'MEKi0002uM_ERKi002uM',
    # 2x PI3K
    'IGF1Ri3uM_AKTi1uM', 'IGF1Ri3uM_mTORi001uM', 'PI3Ki1uM_mTORi001uM',
    'AKTi1uM_mTORi001uM',
    # MAPK + PI3K
    'EGFRi03uM_PI3Ki1uM', 'EGFRi03uM_AKTi1uM', 'EGFRi03uM_mTORi001uM',
    'MEKi0002uM_PI3Ki1uM', 'ERKi002uM_PI3Ki1uM', 'ERKi002uM_AKTi1uM'
)

# Perturbations.
PERTURBATIONS = []
for pert_name in list(PERTURBATION_NAMES):
    pert_lst = pert_name.split("_")
    tmp = []
    for pert in pert_lst:
        if "IGF1Ri" in pert:
            tmp += [pert+"mek", pert+"akt"]
        elif "MEKi" in pert:
            tmp += [pert, pert+"ds"]
        elif "mTORi" in pert:
            tmp += [pert+"mtorc1", pert+"mtorc2"]
        else:
            tmp += [pert]
    PERTURBATIONS.append(tmp)

# Perturbation target annotations
PERTS_ANNOT = {
    'AKTi1uM':  "BioAkt",
    'AKTi5uM':   "BioAkt",
    'EGFRi03uM': "EGFR",
    'EGFRi1uM':  "EGFR",
    'ERKi002uM': "ERK1",
    'ERKi04uM':  "ERK1",
    'IGF1Ri10uMmek': "MEK1",
    'IGF1Ri3uMmek': "MEK1",
    'IGF1Ri10uMakt': "BioAkt",
    'IGF1Ri3uMakt': "BioAkt",
    # MEK inihibitor might affect pMEK, but also affects pMEK kinase activity
    'MEKi0002uM': "MEK1",
    'MEKi002uM': "MEK1",
    'MEKi0002uMds': "MEK1",
    'MEKi002uMds': "MEK1",
    "GSK3i2uM": "GSK3",  # Not used because GSK inhibition shows no effect
    "GSK3i5uM": "GSK3",
    'PI3Ki1uM':  "BioAkt",
    'PI3Ki2uM':  "BioAkt",
    'RAFi1uM':   "MEK1",
    'mTORi001uMmtorc2': "BioAkt",
    'mTORi03uMmtorc2': "BioAkt",
    'mTORi001uMmtorc1': "P70S6K",
    'mTORi03uMmtorc1': "P70S6K"
}


DOWNSTREAM_ACTING_INHIBITORS = [
    "MEKi0002uMds", 'MEKi002uMds']  # , 'mTORi001uM', 'mTORi03uM']


# Known interactions
GIVEN_EDGES = [
    ("EGFR", "ERK1"),
    ("MEK1", "EGFR"),
    ("ERK1", "MEK1"),
    ("GSK3", "ERK1"), ("GSK3", "BioAkt"),
    ("BioAkt", "EGFR"), ("BioAkt", "PRAS40"),
    ("PRAS40", "BioAkt"),
    #    ("P70S6K", "BioAkt"), ("P70S6K", "ERK1"),
    ("P70S6K", "PRAS40"),  # ("P70S6K", "ERK1"),
    # ("RS6", "PRAS40"),
    ("RS6", "P70S6K"), ("RS6", "ERK1"),  # ERK1 through p90
    ("CREB1", "ERK1")
]


POSITIVE_EDGES = [
    ("MEK1", "EGFR"),
    ("ERK1", "MEK1"),
    ("GSK3", "ERK1"), ("GSK3", "BioAkt"),
    ("BioAkt", "EGFR"),
    ("PRAS40", "BioAkt"),
    ("P70S6K", "PRAS40"),  # ("P70S6K", "ERK1"),
    ("RS6", "P70S6K"), ("RS6", "ERK1"),
    ("CREB1", "ERK1")
]

NEGATIVE_EDGES = [
    ("EGFR", "ERK1")
]

# All set of inhibitors-target pairs for all inhibitors used in this experiment
INHIB_TARGET_PAIRS = set()
for inhib, target in PERTS_ANNOT.items():
    if inhib in DOWNSTREAM_ACTING_INHIBITORS:
        for node in set(NODES) - set([target]):
            INHIB_TARGET_PAIRS.add((inhib.split("i")[0]+"i", node))
    else:
        INHIB_TARGET_PAIRS.add((inhib.split("i")[0]+"i", target))

# A sorted list of all inhibitors used in this experiment
INHIBITORS = sorted(list(set(dict(INHIB_TARGET_PAIRS).keys())))
