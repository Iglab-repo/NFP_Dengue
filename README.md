# NFP_Dengue

**Scripts used for simulation, computing, analysis and to generate figures**
--------------------------------------------------------------------------------

combination.pl: This script is used to geneerate the all possible combinations (18 to 22) of 25 virus strains 

correlation_pairwise.pl: This script is used to compute the pairwise correlation based on ID50 values in two ways: serumwise, strainwise

correlation_pairwise_groupwise.pl: This script is used to compute the pairwise correlation based on ID50 values between groups (N30, P0 and P30)

compute_ratio_day30_day0.pl: This script is used to compute the ratio between P30 and P0

donorwise_ID50_comparison_scatterplot.R: This script is used to generate scatterplots for the 10 donors (using serum data from P0 and P30)

donorwise_NFPresults_comparison_scatterplot.R: This script is used to generate scatterplots for the 10 donors (using NFP prediction results of P0 and P30)

ratio_day30_day0_ID50_heatmap.R: This script is used to generate heatmap using the data computed from compute_ratio_day30_day0.pl

gen_theoretical_comb_w-var_modified.m: This script is used to simulate serum data using antibody neutralization data

octave_delSel_w-tp.oct: This script is used to delineate antibody specificities of simulated sera (using 2 antibody data) using antibody neutralization data of all the combinations of 25 strains generated using combination.pl

octave_delSel_w-tp_4class.oct: This script is used to delineate antibody specificities of simulated sera (using 4 antibody data) using antibody neutralization data of all the combinations of 25 strains generated using combination.pl

ser-del_mab-set_fixed-serum-subset.oct: This script is used to predict the delineate of antibody specificities present in the 30 serum data from 20 donors

gen_addtl_spec.oct: This script is used to simualte random serum data with unknow antibody specificities

gen_additional_serum.pl: This script is sued to check the correlation between simulated data from gen_addtl_spec.oct and antibody neutralization data to select serum data with less correlation (<0.2)



---------------------------------------------------------------------------
For further details or help, please contact the corresponding author
