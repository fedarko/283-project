#! /usr/bin/env python3
# Quickly computes the sparsity of the cancer matrix, just so we can mention
# this in the slides.

import pandas as pd
mat = pd.read_csv("data/GSE131512_cancerTPM.txt", sep="\t", index_col=0)

# Compute sparsity
sparsity = (mat == 0).sum().sum() / (len(mat.columns) * len(mat.index))
print(f"Matrix has {sparsity * 100:.2f}% sparsity.")
