<<<<<<< HEAD
# PhD_Thesis_Chapter_4
Using mouse stomach single-cell sequencing data to identify dasatinib-based synergistic drug combinations for the chemoprevention of HDGC.
=======
# sc-seq_mouse
Single-cell transcriptomic data from drugged mice.

# Notes
* scDrugMice2023 links to data pre-processed by Conor Vaessen, as outlined in 0_sc-seq_processing.Rmd.
* .gitignore includes large data and .RData files, as well as anything beyond the symlink to /scDrugMice2023.
* /output includes output from 1_sc-seq_mouse.Rmd and 2_sc-seq_dasatinib.Rmd, but this should be changed.
* /output_ac includes output from sc-seq_mouse_stronger_qc.Rmd, for comparison.
* All of this code needs to be updated when there is better pre-processed data available.

# 0_sc-seq_processing.Rmd
* Loads in raw read data from its location on the Department of Biochemistry's server.
* Processes it in bash with CellRanger.
* Labels the larger dataset objects for analysis.
* Saves data as 10X Seurat objects.

# 1_sc-seq_mouse.Rmd
* Loads in and normalises processed data in a 10X Seurat object for all mouse data.
* Annotates cell clusters with various programs, including SingleR and sc-type.

# 2_sc-seq_dasatinib.Rmd
* Loads in and normalises processed data in a 10X Seurat object for only the two dasatinib treated and two vehicle control mice.
* Annotates cell clusters with various programs, including SingleR and sc-type.
* Manually annotates clusters based off the top marker genes in each cluster, working off the sc-type classifications as a baseline.
* Carries out differential expression analysis across the same cluster between the two different treatment groups to find genes that may be involved in dasatinib response.
>>>>>>> 2e050a1 (Final updates)
