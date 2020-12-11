# Generate heatmaps of Luminex perturbation data

import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import os
import re

# Fix some font issues
import matplotlib
matplotlib.rcParams['pdf.fonttype'] = 42
matplotlib.rcParams['ps.fonttype'] = 42
plt.rcParams['font.sans-serif'] = "Helvetica"
plt.rcParams['font.family'] = "sans-serif"


# # Parent folder dirname
# dirname = os.path.dirname(os.path.dirname(__file__))
# print(dirname)
# load data
wt = pd.read_csv(
    "../results/perturbations/wt-luminex-lfc.tsv",
    sep="\t", index_col=0
)
pi3k = pd.read_csv(
    "../results/perturbations/pi3k-luminex-lfc.tsv",
    sep="\t", index_col=0
)

# Remove uninformative Treatments and Epitopes
wt.index.name = None
pi3k.index.name = None
wt = wt.drop("Akt1").drop(['FGFRi 0.1uM'], axis=1)
pi3k = pi3k.drop("Akt1").drop(['FGFRi 0.1uM'], axis=1)


# def clean_colname(s):
#     return re.sub('\s+', ' ', re.sub("[0-9]|uM|\\.", "", s)).strip()
# wt.columns = [clean_colname(s) for s in list(wt.columns)]
# pi3k.columns = [clean_colname(s) for s in list(pi3k.columns)]


# Add phopshosite annotation to xtick marks
xtick_labels = {
    'EGFR': r'EGFR$^{\mathregular{Y1068}}$',
    'MEK1': r'MEK1$^{\mathregular{S217/S221}}$',
    'ERK1': r'ERK1$^{\mathregular{T202/Y204}}$',
    'GSK3': r'GSK3$^{\mathregular{S21/S9}}$',
    'CREB1': r'CREB1$^{\mathregular{S133}}$',
    'BioAkt': r'AKT1$^{\mathregular{S473}}$',
    'PRAS40': r'PRAS40$^{\mathregular{T246}}$',
    'P70S6K': r'p70S6K$^{\mathregular{T3890}}$',
    'RS6': r'RPS6$^{\mathregular{S235}}$'
}
wt.index = [xtick_labels[s] for s in wt.index]
pi3k.index = [xtick_labels[s] for s in pi3k.index]


dfs = [wt, pi3k]
titles = ["MCF10A Parental$^{ }$", r'MCF10A PI3K$^{\mathregular{H1047R}}$']

fig, axes = plt.subplots(
    nrows=2, ncols=1, figsize=(3.1  , 2.5),
    sharex=True, sharey=True)
cbar_ax = fig.add_axes([.9, .45, .01, .25])

# axes[0].set_axis_off()
for i, ax in enumerate(axes.flat):
    im = sns.heatmap(
        dfs[i], ax=ax,
        cbar=i == 0,
        center=0, cmap="RdBu", vmin=-4, vmax=4, annot=False, linewidths=.5,
        cbar_kws={'label': 'log$_2$(perturbed/unperturbed)'},
        xticklabels=True, yticklabels=True,
        cbar_ax=None if i else cbar_ax
    )
    im.tick_params(labelsize=4)
    ax.set_xticklabels(ax.get_xticklabels(),rotation=45,ha="right",rotation_mode='anchor')
    ax.tick_params(axis='both', which='both', length=0)
    ax.figure.axes[-1].yaxis.label.set_size(4)
    ax.figure.axes[-1].tick_params(labelsize=0)
    ax.set_title(titles[i], loc='left', fontsize=6)
    plt.subplots_adjust(top=2)
    plt.xticks(rotation=45, fontsize=4, ticks=None)
    plt.yticks(rotation=0, fontsize=4, ticks=None)

fig.tight_layout(pad = 0., rect=[0, 0, 0.85, 1])
plt.savefig("../figures/luminex/heatmap-lfc-combined.pdf")

# WT plot
# fig, ax = plt.subplots(ncols=1, nrows=2, sharex=True)
# fig.set_size_inches(4, 3)
# sns.heatmap(
#     wt, center=0, cmap="RdBu", vmin=-4, vmax=4, annot=False, linewidths=1,
#     cbar_kws={'label': 'log$_2$(perturbed/unperturbed)'},
#     xticklabels=True, yticklabels=True)
# # cbar label size
# ax.figure.axes[-1].yaxis.label.set_size(6)
# ax.figure.axes[-1].tick_params(labelsize=6)
# plt.title("MCF10A Parental$^{ }$", loc='left', fontsize=8)
# plt.xticks(rotation=90, fontsize=6, ticks=None)
# plt.yticks(rotation=0, fontsize=6, ticks=None)
# plt.tight_layout()
# plt.savefig("../figures/Luminex/heatmap-mcf10a-wt.pdf")
# plt.clf()

# # # Mutant plot
# fig, ax = plt.subplots()
# fig.set_size_inches(4, 2)
# sns.heatmap(
#     pi3k, center=0, cmap="RdBu", vmin=-4, vmax=4, annot=False, linewidths=1,
#     cbar_kws={'label': 'log$_2$(perturbed/unperturbed)'},
#     xticklabels=True, yticklabels=True)
# ax.figure.axes[-1].yaxis.label.set_size(6)
# ax.figure.axes[-1].tick_params(labelsize=6)
# plt.title(r'MCF10A PI3K$^{\mathregular{H1047R}}$', loc='left', fontsize=8)
# plt.xticks(rotation=90, fontsize=6)
# plt.yticks(rotation=0, fontsize=6)
# plt.tight_layout()
# plt.savefig("../figures/Luminex/heatmap-mcf10a-pi3k.pdf")
# plt.clf()


# Repeat with annotation

# # WT plot
# fig, ax = plt.subplots()
# fig.set_size_inches(5, 3)
# sns.heatmap(
#     wt, center=0, cmap="RdBu", vmin=-4, vmax=1, annot=True, linewidths=1,
#     cbar_kws={'label': 'log$_2$(perturbed/unperturbed)'},
#     annot_kws={"size": 3},
#     xticklabels=True, yticklabels=True)
# ax.figure.axes[-1].yaxis.label.set_size(6)
# ax.figure.axes[-1].tick_params(labelsize=6)
# plt.title("MCF10A Parental$^{ }$", loc='left', fontsize=8)
# plt.xticks(rotation=90, fontsize=6)
# plt.yticks(rotation=0, fontsize=6)
# plt.tight_layout()
# plt.savefig("../figures/Luminex/heatmap-mcf10-wt-annot.pdf")
# plt.clf()

# # Mutant plot
# fig, ax = plt.subplots()
# fig.set_size_inches(5, 3)
# sns.heatmap(
#     pi3k, center=0, cmap="RdBu", vmin=-4, vmax=1, annot=True, linewidths=1,
#     cbar_kws={'label': 'log$_2$(perturbed/unperturbed)'},
#     annot_kws={"size": 3},
#     xticklabels=True, yticklabels=True)
# ax.figure.axes[-1].yaxis.label.set_size(6)
# ax.figure.axes[-1].tick_params(labelsize=6)
# plt.title(r'MCF10A PI3K$^{\mathregular{H1047R}}$', loc='left', fontsize=8)
# plt.xticks(rotation=90, fontsize=6)
# plt.yticks(rotation=0, fontsize=6)
# plt.tight_layout()
# plt.savefig("../figures/Luminex/heatmap-mcf10a-pi3k-annot.pdf")
# plt.clf()
