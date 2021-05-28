# CSE 283 / BENG 203 Project: Spring 2021

## `data/` sources

All of the files located in this folder are associated with
[Zhou et al. 2019](https://www.pnas.org/content/116/38/19200).

Most of the files located in this folder were
downloaded from the "supplementary files" section on
[NCBI GEO (accession number GSE131512)](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE131512). There are additionally some metadata files we generate.

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
