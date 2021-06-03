# Code by Sara (modified a bit by Marcus).
# Adapted from https://medium.com/@dtuk81/confusion-matrix-visualization-fc31e3f30fea.

import seaborn as sn
import numpy as np
def confusion_matrix(tp, fp, tn, fn, ax):
    test_sample_ct = 29
    vals = [tn, fp, fn, tp]
    group_names = ['True Neg', 'False Pos', 'False Neg', 'True Pos']
    group_counts = [str(value) for value in vals]
    group_pcts = ["{0:.2%}".format(value / test_sample_ct) for value in vals]
    labels = [f'{v1}\n{v2}\n{v3}' for v1, v2, v3 in
              zip(group_names, group_counts, group_pcts)]
    
    labels = np.asarray(labels).reshape(2, 2)
    sn.heatmap(
        np.asarray(vals).reshape(2, 2),
        annot = labels,
        fmt = '',
        cmap = 'Blues',
        annot_kws = {"size": 14},
        ax = ax
    ).set_ylim([0, 2])
