#! /usr/bin/env python3
# Quickly computes the sparsity of the total matrix, just so we can mention
# this in the slides.

import pandas as pd
df = pd.read_csv("data/GSE131512_cancerTPM.txt", sep="\t", index_col=0)
df2 = pd.read_csv("data/GSE131512_normalTPM.txt", sep="\t", index_col=0)
# Merge matrices
mat = pd.concat([df, df2], axis=1)

# Compute sparsity
sparsity = (mat == 0).sum().sum() / (len(mat.columns) * len(mat.index))
print(f"Matrix has {sparsity * 100:.2f}% sparsity.")
