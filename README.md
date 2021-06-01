# CSE 283 / BENG 203 Project: Spring 2021

## Repository structure

### `notebooks/`

Contains Jupyter notebooks that are used in processing the data, generating
some of the plots, running classifiers, etc.

### `scripts/`

Contains one-off scripts used for various tasks (generating some of the plots,
computing metrics of the dataset, etc.). The `PCA_tSNE_analysis.R` script was
written by Sara Rahiminejad.

## `data/` sources

All of the files located in this folder are associated with
[Zhou et al. 2019](https://www.pnas.org/content/116/38/19200).

The files prefixed with `GSE131512_` were
downloaded from the "supplementary files" section on
[NCBI GEO (accession number GSE131512)](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE131512). Some additional files come from other sources; these are described below.

### `preselectedEnsemblIDList.txt`

This list was downloaded from [this GitHub
repository](https://github.com/Zhong-Lab-UCSD/course_project_2020), which was
linked in the course slides.
This list contains 750 Ensembl IDs, which we understand correspond to the gene
names listed in Table S5 of the supplementary materials of Zhou et al. 2019.

While we were working on this project, Ensembl was down, so for the sake of
convenience we just used this list rather than convert the gene names in Table
S5 to Ensembl IDs ourselves.

### Metadata files

- The `geo_metadata.tsv` file was converted from the `GSE131512_metaData.xlsx`
  file to simplify loading this data in scripts.
- The `table_s3.tsv` file was copied from Table S3 in the supplementary
  materials of Zhou et al. 2019 to simplify mapping sample IDs to their status
  (C-R, C-N, N).
- The `table_s4.tsv` file was copied from Table S4 in the supplementary
  materials of Zhou et al. 2019 to simplify mapping sample IDs from patients
  with cancer to their particular cancer subtype, chemotherapy status, and
  other provided medical metadata.
- The `merged_metadata.tsv` file is created in the `01-MergeMetadata.ipynb`
  notebook, and includes all of the information from the GEO, Table S3, and
  Table S4 metadata files.
- The `final_metadata.tsv` file is created in the `02-TrainTestSplit.ipynb`
  notebook, and includes everything in `merged_metadata.tsv` plus assignments
  of each sample to training vs. test data. Please see the train/test split
  notebook for more information.

## Note about "starting" data

We note that, although a full analysis using this data would ideally start from
scratch with the raw sequencing data, we have instead started our work with the
gene frequency tables derived from the sequencing data. We have done this for
the sake of convenience due to the time constraints inherent to this project.
