#MR_T1d
#Group 10
#2023-03-11
knitr::opts_chunk$set(echo = TRUE)

#INSTALL PACKAGES
install.packages('plyr', repos = "http://cran.us.r-project.org")
##
## The downloaded binary packages are in
##  /var/folders/2y/z3g4d8r132j6m0_l9skqmw6c0000gp/T//RtmpQ9Vxmq/downloaded_packages
remotes::install_github("MRCIEU/TwoSampleMR")
## Skipping install of 'TwoSampleMR' from a github remote, the SHA1 (f5935b55) has not changed since last install.
##   Use `force = TRUE` to force installation
library(TwoSampleMR)
## TwoSampleMR version 0.5.6
## [>] New: Option to use non-European LD reference panels for clumping etc
## [>] Some studies temporarily quarantined to verify effect allele
## [>] See news(package='TwoSampleMR') and https://gwas.mrcieu.ac.uk for further details
##GET EXPOSURE INSTRUMENTS
exposure_dat <- extract_instruments("ukb-b-13891")
## API: public: http://gwas-api.mrcieu.ac.uk/
exposure_dat
##   samplesize.exposure se.exposure chr.exposure pval.exposure beta.exposure
## 1              461384 0.001062700            2   7.00003e-09    0.00615290
## 2              461384 0.000484436            4   2.59998e-08   -0.00269594
## 3              461384 0.000412620           10   2.10000e-08    0.00231084
##   pos.exposure id.exposure        SNP effect_allele.exposure
## 1    171417598 ukb-b-13891  rs6756297                      G
## 2     42117173 ukb-b-13891  rs4861163                      T
## 3     64934548 ukb-b-13891 rs10822145                      T
##   other_allele.exposure eaf.exposure
## 1                     T     0.039545
## 2                     C     0.240647
## 3                     C     0.475714
##                                                        exposure
## 1 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
## 2 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
## 3 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
##   mr_keep.exposure pval_origin.exposure data_source.exposure
## 1             TRUE             reported                  igd
## 2             TRUE             reported                  igd
## 3             TRUE             reported                  igd

#GET EFFECTS OF INSTRUMENTS ON OUTCOME
outcome_dat <- extract_outcome_data(snps=exposure_dat$SNP, outcomes = "ebi-a-GCST010681")
## Extracting data for 3 SNP(s) from 1 GWAS(s)
outcome_dat
##          SNP chr       pos beta.outcome se.outcome samplesize.outcome
## 1  rs6756297   2 171417598      -0.0234     0.0623              24840
## 2  rs4861163   4  42117173      -0.0348     0.0274              24840
## 3 rs10822145  10  64934548      -0.0050     0.0235              24840
##   pval.outcome eaf.outcome effect_allele.outcome other_allele.outcome
## 1       0.7072      0.0386                     G                    T
## 2       0.2030      0.2379                     T                    C
## 3       0.8305      0.4779                     T                    C
##                                  outcome       id.outcome originalname.outcome
## 1 Type 1 diabetes || id:ebi-a-GCST010681 ebi-a-GCST010681      Type 1 diabetes
## 2 Type 1 diabetes || id:ebi-a-GCST010681 ebi-a-GCST010681      Type 1 diabetes
## 3 Type 1 diabetes || id:ebi-a-GCST010681 ebi-a-GCST010681      Type 1 diabetes
##        outcome.deprecated mr_keep.outcome data_source.outcome
## 1 Type 1 diabetes ||  ||             TRUE                 igd
## 2 Type 1 diabetes ||  ||             TRUE                 igd
## 3 Type 1 diabetes ||  ||             TRUE                 igd

#HARMONISE EXPOSURE AND OUTCOME DATA
dat <- harmonise_data(exposure_dat, outcome_dat, action = 3)
## Harmonising Mineral and other dietary supplements: Zinc || id:ukb-b-13891 (ukb-b-13891) and Type 1 diabetes || id:ebi-a-GCST010681 (ebi-a-GCST010681)
dat
##          SNP effect_allele.exposure other_allele.exposure effect_allele.outcome
## 1 rs10822145                      T                     C                     T
## 2  rs4861163                      T                     C                     T
## 3  rs6756297                      G                     T                     G
##   other_allele.outcome beta.exposure beta.outcome eaf.exposure eaf.outcome
## 1                    C    0.00231084      -0.0050     0.475714      0.4779
## 2                    C   -0.00269594      -0.0348     0.240647      0.2379
## 3                    T    0.00615290      -0.0234     0.039545      0.0386
##   remove palindromic ambiguous       id.outcome chr       pos se.outcome
## 1  FALSE       FALSE     FALSE ebi-a-GCST010681  10  64934548     0.0235
## 2  FALSE       FALSE     FALSE ebi-a-GCST010681   4  42117173     0.0274
## 3  FALSE       FALSE     FALSE ebi-a-GCST010681   2 171417598     0.0623
##   samplesize.outcome pval.outcome                                outcome
## 1              24840       0.8305 Type 1 diabetes || id:ebi-a-GCST010681
## 2              24840       0.2030 Type 1 diabetes || id:ebi-a-GCST010681
## 3              24840       0.7072 Type 1 diabetes || id:ebi-a-GCST010681
##   originalname.outcome      outcome.deprecated mr_keep.outcome
## 1      Type 1 diabetes Type 1 diabetes ||  ||             TRUE
## 2      Type 1 diabetes Type 1 diabetes ||  ||             TRUE
## 3      Type 1 diabetes Type 1 diabetes ||  ||             TRUE
##   data_source.outcome samplesize.exposure se.exposure chr.exposure
## 1                 igd              461384 0.000412620           10
## 2                 igd              461384 0.000484436            4
## 3                 igd              461384 0.001062700            2
##   pval.exposure pos.exposure id.exposure
## 1   2.10000e-08     64934548 ukb-b-13891
## 2   2.59998e-08     42117173 ukb-b-13891
## 3   7.00003e-09    171417598 ukb-b-13891
##                                                        exposure
## 1 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
## 2 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
## 3 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
##   mr_keep.exposure pval_origin.exposure data_source.exposure action mr_keep
## 1             TRUE             reported                  igd      3    TRUE
## 2             TRUE             reported                  igd      3    TRUE
## 3             TRUE             reported                  igd      3    TRUE

#MEASURE STRENGTH OF INSTRUMENTS TO PREDICT OUTCOME
# Calculate per-SNP F-statistic
dat$EAF2 <- (1 - dat$eaf.exposure)
dat$MAF <- pmin(dat$eaf.exposure, dat$EAF2)
PVEfx <- function(BETA, MAF, SE, N){
 pve <- (2*(BETA^2)*MAF*(1 - MAF))/
 ((2*(BETA^2)*MAF*(1 - MAF)) + ((SE^2)*2*N*MAF*(1 - MAF)))
 return(pve)
}

dat$PVE <- mapply(PVEfx,
 dat$beta.exposure,
 dat$MAF,
 dat$se.exposure,
 N = 461384)

dat$FSTAT <- ((461384- 1 - 1)/1)*(dat$PVE/(1 -
dat$PVE))
dat
##          SNP effect_allele.exposure other_allele.exposure effect_allele.outcome
## 1 rs10822145                      T                     C                     T
## 2  rs4861163                      T                     C                     T
## 3  rs6756297                      G                     T                     G
##   other_allele.outcome beta.exposure beta.outcome eaf.exposure eaf.outcome
## 1                    C    0.00231084      -0.0050     0.475714      0.4779
## 2                    C   -0.00269594      -0.0348     0.240647      0.2379
## 3                    T    0.00615290      -0.0234     0.039545      0.0386
##   remove palindromic ambiguous       id.outcome chr       pos se.outcome
## 1  FALSE       FALSE     FALSE ebi-a-GCST010681  10  64934548     0.0235
## 2  FALSE       FALSE     FALSE ebi-a-GCST010681   4  42117173     0.0274
## 3  FALSE       FALSE     FALSE ebi-a-GCST010681   2 171417598     0.0623
##   samplesize.outcome pval.outcome                                outcome
## 1              24840       0.8305 Type 1 diabetes || id:ebi-a-GCST010681
## 2              24840       0.2030 Type 1 diabetes || id:ebi-a-GCST010681
## 3              24840       0.7072 Type 1 diabetes || id:ebi-a-GCST010681
##   originalname.outcome      outcome.deprecated mr_keep.outcome
## 1      Type 1 diabetes Type 1 diabetes ||  ||             TRUE
## 2      Type 1 diabetes Type 1 diabetes ||  ||             TRUE
## 3      Type 1 diabetes Type 1 diabetes ||  ||             TRUE
##   data_source.outcome samplesize.exposure se.exposure chr.exposure
## 1                 igd              461384 0.000412620           10
## 2                 igd              461384 0.000484436            4
## 3                 igd              461384 0.001062700            2
##   pval.exposure pos.exposure id.exposure
## 1   2.10000e-08     64934548 ukb-b-13891
## 2   2.59998e-08     42117173 ukb-b-13891
## 3   7.00003e-09    171417598 ukb-b-13891
##                                                        exposure
## 1 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
## 2 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
## 3 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
##   mr_keep.exposure pval_origin.exposure data_source.exposure action mr_keep
## 1             TRUE             reported                  igd      3    TRUE
## 2             TRUE             reported                  igd      3    TRUE
## 3             TRUE             reported                  igd      3    TRUE
##       EAF2      MAF          PVE    FSTAT
## 1 0.524286 0.475714 6.797468e-05 31.36442
## 2 0.759353 0.240647 6.712062e-05 30.97032
## 3 0.960455 0.039545 7.265145e-05 33.52251
# Calculate a total instrument F statistic
# Total PVE
PVEtot <- sum(dat$PVE)
PVEtot
## [1] 0.0002077467
FSTATtot <- ((461384 - 3 - 1)/ 3)*(PVEtot/(1 - PVEtot))
FSTATtot
## [1] 31.9567

#PERFORM MR ANALYSIS
# mr_method_list()
# Primary MR analysis

MR_ss <- mr_singlesnp(
  dat,
  parameters = default_parameters(),
  single_method = "mr_wald_ratio",
  all_method = "mr_ivw")
MR_ss
##                                                        exposure
## 1 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
## 2 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
## 3 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
## 4 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
##                                  outcome id.exposure       id.outcome
## 1 Type 1 diabetes || id:ebi-a-GCST010681 ukb-b-13891 ebi-a-GCST010681
## 2 Type 1 diabetes || id:ebi-a-GCST010681 ukb-b-13891 ebi-a-GCST010681
## 3 Type 1 diabetes || id:ebi-a-GCST010681 ukb-b-13891 ebi-a-GCST010681
## 4 Type 1 diabetes || id:ebi-a-GCST010681 ukb-b-13891 ebi-a-GCST010681
##   samplesize                             SNP         b        se         p
## 1      24840                      rs10822145 -2.163715 10.169462 0.8315095
## 2      24840                       rs4861163 12.908299 10.163431 0.2040586
## 3      24840                       rs6756297 -3.803085 10.125307 0.7072129
## 4      24840 All - Inverse variance weighted  2.300248  5.861651 0.6947455
# MR analysis with

mr_res <- mr(dat, method_list = c("mr_ivw","mr_egger_regression", "mr_weighted_median", "mr_weighted_mode"))
## Analysing 'ukb-b-13891' on 'ebi-a-GCST010681'
mr_res
##   id.exposure       id.outcome                                outcome
## 1 ukb-b-13891 ebi-a-GCST010681 Type 1 diabetes || id:ebi-a-GCST010681
## 2 ukb-b-13891 ebi-a-GCST010681 Type 1 diabetes || id:ebi-a-GCST010681
## 3 ukb-b-13891 ebi-a-GCST010681 Type 1 diabetes || id:ebi-a-GCST010681
## 4 ukb-b-13891 ebi-a-GCST010681 Type 1 diabetes || id:ebi-a-GCST010681
##                                                        exposure
## 1 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
## 2 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
## 3 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
## 4 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
##                      method nsnp         b        se      pval
## 1 Inverse variance weighted    3  2.300248  5.861651 0.6947455
## 2                  MR Egger    3 -5.734363 20.499709 0.8263572
## 3           Weighted median    3 -2.207003  7.394298 0.7653417
## 4             Weighted mode    3 -2.992375  8.764928 0.7653326
generate_odds_ratios(mr_res)
##   id.exposure       id.outcome                                outcome
## 1 ukb-b-13891 ebi-a-GCST010681 Type 1 diabetes || id:ebi-a-GCST010681
## 2 ukb-b-13891 ebi-a-GCST010681 Type 1 diabetes || id:ebi-a-GCST010681
## 3 ukb-b-13891 ebi-a-GCST010681 Type 1 diabetes || id:ebi-a-GCST010681
## 4 ukb-b-13891 ebi-a-GCST010681 Type 1 diabetes || id:ebi-a-GCST010681
##                                                        exposure
## 1 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
## 2 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
## 3 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
## 4 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
##                      method nsnp         b        se      pval      lo_ci
## 1 Inverse variance weighted    3  2.300248  5.861651 0.6947455  -9.188587
## 2                  MR Egger    3 -5.734363 20.499709 0.8263572 -45.913793
## 3           Weighted median    3 -2.207003  7.394298 0.7653417 -16.699828
## 4             Weighted mode    3 -2.992375  8.764928 0.7653326 -20.171633
##      up_ci         or     or_lci95     or_uci95
## 1 13.78908 9.97665939 1.021992e-04 9.739192e+05
## 2 34.44507 0.00323294 1.147871e-20 9.105467e+14
## 3 12.28582 0.11002992 5.589295e-08 2.166031e+05
## 4 14.18688 0.05016812 1.736085e-09 1.449722e+06

#SENSITIVITY ANALYSIS
#pleiotropy
ple<-mr_pleiotropy_test(dat)
ple
##   id.exposure       id.outcome                                outcome
## 1 ukb-b-13891 ebi-a-GCST010681 Type 1 diabetes || id:ebi-a-GCST010681
##                                                        exposure egger_intercept
## 1 Mineral and other dietary supplements: Zinc || id:ukb-b-13891      0.02498159
##           se      pval
## 1 0.05997393 0.7487365
#heterogeneity
het<- mr_heterogeneity(dat)
het
##   id.exposure       id.outcome                                outcome
## 1 ukb-b-13891 ebi-a-GCST010681 Type 1 diabetes || id:ebi-a-GCST010681
## 2 ukb-b-13891 ebi-a-GCST010681 Type 1 diabetes || id:ebi-a-GCST010681
##                                                        exposure
## 1 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
## 2 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
##                      method        Q Q_df    Q_pval
## 1                  MR Egger 1.402153    1 0.2363634
## 2 Inverse variance weighted 1.645436    2 0.4392363
mr_leaveoneout(dat)
##                                                        exposure
## 1 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
## 2 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
## 3 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
## 4 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
##                                  outcome id.exposure       id.outcome
## 1 Type 1 diabetes || id:ebi-a-GCST010681 ukb-b-13891 ebi-a-GCST010681
## 2 Type 1 diabetes || id:ebi-a-GCST010681 ukb-b-13891 ebi-a-GCST010681
## 3 Type 1 diabetes || id:ebi-a-GCST010681 ukb-b-13891 ebi-a-GCST010681
## 4 Type 1 diabetes || id:ebi-a-GCST010681 ukb-b-13891 ebi-a-GCST010681
##   samplesize        SNP         b       se         p
## 1      24840 rs10822145  4.521205 8.355633 0.5884409
## 2      24840  rs4861163 -2.986967 7.175233 0.6771989
## 3      24840  rs6756297  5.376763 7.536006 0.4755510
## 4      24840        All  2.300248 5.861651 0.6947455


#SCATTERPLOT
p1 <- mr_scatter_plot(mr_res, dat)
p1
## $`ukb-b-13891.ebi-a-GCST010681`


##
## attr(,"split_type")
## [1] "data.frame"
## attr(,"split_labels")
##   id.exposure       id.outcome
## 1 ukb-b-13891 ebi-a-GCST010681

#FOREST PLOT
p2 <- mr_forest_plot(MR_ss, exponentiate = FALSE)
p2
## $`ukb-b-13891.ebi-a-GCST010681`
## Warning: Removed 1 rows containing missing values (geom_errorbarh).
## Warning: Removed 1 rows containing missing values (geom_point).

##
## attr(,"split_type")
## [1] "data.frame"
## attr(,"split_labels")
##   id.exposure       id.outcome
## 1 ukb-b-13891 ebi-a-GCST010681

#DIRECTIONALITY TEST
out <- directionality_test(dat)
## r.exposure and/or r.outcome not present.
## Calculating approximate SNP-exposure and/or SNP-outcome correlations, assuming all are quantitative traits. Please pre-calculate r.exposure and/or r.outcome using get_r_from_lor() for any binary traits
out
##   id.exposure       id.outcome
## 1 ukb-b-13891 ebi-a-GCST010681
##                                                        exposure
## 1 Mineral and other dietary supplements: Zinc || id:ukb-b-13891
##                                  outcome snp_r2.exposure snp_r2.outcome
## 1 Type 1 diabetes || id:ebi-a-GCST010681    0.0002078824    7.27737e-05
##   correct_causal_direction steiger_pval
## 1                     TRUE    0.3660221
