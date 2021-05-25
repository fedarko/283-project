# CSE 283 / BENG 203 Project: Spring 2021

## `data/` sources

ALl of the files located in this folder are associated with
[Zhou et al. 2019](https://www.pnas.org/content/116/38/19200).

Most of the files located in this folder were
downloaded from the "supplementary files" section on
[NCBI GEO (accession number GSE131512)](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE131512).

The `geo_metadata.tsv` file was converted from the `GSE131512_metaData.xlsx` file
to simplify loading the metadata in scripts; and the `table_s3.tsv` file was
copied from Table S3 in the supplementary materials of Zhou et al. 2019 to
simplify mapping sample IDs to their status (C-R, C-N, N). The
`merged_metadata.tsv` file is created in the `01-MergeMetadata.ipynb` notebook,
and includes all of the information from the GEO and Table S3 metadata files.

## Note about "starting" data

We note that, although a full replication of this work would ideally begin with
the raw sequencing data, we have begun our work starting with the gene
frequency tables derived from the sequencing data for the sake of convenience
(and due to the time constraints associated with this class project).
