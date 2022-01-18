#!/usr/bin/env python
# coding: utf-8

# In[198]:


import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
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
dat_sel = pd.read_csv(
    "../results/perturbations/optimization/optimization-selected-wtselective-ic10norm.csv",
    sep=",", index_col=0, header=None
)


dat_ctr = pd.read_csv(
    "../results/perturbations/optimization/optimization-selected-control-ic10norm.csv",
    sep=",", index_col=0, header=None
)

# PLot the WT selective combinations
fig, axs = plt.subplots(
    nrows=2, ncols=1,
    figsize = (3, 2),
    gridspec_kw={'height_ratios': [9, 1]}
)

sns.heatmap(dat_sel.iloc[:-1], ax=axs[0], 
            xticklabels=False, yticklabels=True,
            linewidths=.5,cbar=False,
            vmin=0, vmax=1, cmap="Blues")
axs[0].set_title("Drug concentration (relative to IC10)", loc='left', fontsize=8);
axs[0].tick_params(axis='both', which='both', length=0, labelsize=6)
axs[0].set_ylabel('')    
sns.heatmap(dat_sel.iloc[[-1]], ax=axs[1], 
            xticklabels=False, yticklabels=False,
            linewidths=.5,
            cbar=False, vmin=0, vmax=1, cmap="Blues",
           )
axs[1].set_title("Predicted anti-selectivity", loc='left', fontsize=8);
axs[1].set_ylabel('')  
plt.tight_layout()
plt.savefig("../figures/validation/selected-combos-overview.pdf")


# PLot the control combinations
fig, axs = plt.subplots(
    nrows=2, ncols=1,
    figsize = (3, 2),
    gridspec_kw={'height_ratios': [9, 1]}
)
sns.heatmap(dat_ctr.iloc[:-1], ax=axs[0], 
            xticklabels=False, yticklabels=True,
            linewidths=.5,cbar=False,
            vmin=0, vmax=1, cmap="Blues")
axs[0].set_title("Drug concentration (relative to IC10)", loc='left', fontsize=8);
axs[0].tick_params(axis='both', which='both', length=0, labelsize=6)
axs[0].set_ylabel('')    
sns.heatmap(dat_ctr.iloc[[-1]], ax=axs[1], 
            xticklabels=False, yticklabels=False,
            linewidths=.5,
            cbar=False, vmin=0, vmax=1, cmap="Blues",
           )
axs[1].set_title("Predicted anti-selectivity", loc='left', fontsize=8);
axs[1].set_ylabel('')  
plt.tight_layout()
plt.savefig("../figures/validation/control-combos-overview.pdf")



fig, ax = plt.subplots(figsize=(.6, 1.5))
norm = matplotlib.colors.Normalize(vmin=0, vmax=1)
fig.colorbar(matplotlib.cm.ScalarMappable(cmap=matplotlib.cm.Blues, norm=norm),
             cax=ax, orientation='vertical', aspect=10)
ax.tick_params(labelsize=6)
plt.tight_layout()
plt.savefig("../figures/validation/colorbar.pdf")



