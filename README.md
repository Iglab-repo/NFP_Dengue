# NFP_Dengue

Scripts used for simulation, computing, analysis and to generate figures
pidiagram_isotype_switch.pl: This script is used to compute the number of antibody sequences with each isotypes for each timepoints by considering SARS-CoV-2 specific B cells and SARS-CoV-2 cross reactive B cells. The output files from this script are the input files for the script "Figure6C_piechart.R".

Figure6C_piechart.R: This script is used to generate the pie charts shown in figure 6C.

Figure6d_linechart.pl and Figure6d_linechart.R: These scripts were used to generate the data and line charts shown in figure 6d.

shared_unique_sequences_isotype_antigenwise_IgAIgG.pl: This script is used to comput the unique and cross reactive B-cells between the antigens for each timepoint. The output files from this script is the input file for the "upset_antigen_isotype2.R".

upset_antigen_isotype2.R: This script is used to generate the 4 upset plots shown in the supplementary figure 7.

unique-shared_clonotypes2.pl: This script is used to compute the unique and shared clonotypes between the 4 timepoints. This is the input file for the "upset.R" script

upset.R : This script is used to generate the upset plot shown in the supplementary figure 6
