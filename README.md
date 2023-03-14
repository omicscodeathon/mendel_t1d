# Exploring the Causal Effect of Serum Zinc Levels on Risk of Type 1 Diabetes: A Mendelian Randomization Study

## Background
Type 1 diabetes mellitus (T1D) is a chronic autoimmune disease characterized by the destruction of insulin-producing pancreatic beta cells and an ensuing lack of or low insulin. Previous research on risk factors for diabetes have shown that abnormalities in serum levels of essential trace elements may be associated with T1D. As demonstrated by previous studies, zinc metabolism appears to be altered in prediabetes and diabetes indicating its likely role in the pathophysiology of  T1D. While observational studies have been instrumental in decoding the association between zinc deficiency and diabetes, these studies are limited by potential confounders and reverse causality. A limited number of randomized controlled trials (RCTs) investigating glycemic control and zinc supplementation have been conducted. However, there’s a lack of agreement on the effect of zinc on glycemic control. An alternative approach to inferring causality between exposures and outcomes is Mendelian randomization (MR). MR studies use genetic variants that serve as a robust proxy for an environmentally modifiable exposure in order to make causal inferences about the outcome.

## Project description
This project uses MR to investigate the causal effect of serum zinc levels on risk of Type 1 diabetes mellitus using genetic variants from Genome-wide association study (GWAS) summary statistics. 

## Getting started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.
#### Prerequisites
To run this project, you will need:
* R software (version 4.0 or later)
* RStudio (version 1.2 or later)
* R packages
  * TwoSampleMR version 0.5.6 
  * plyr 
#### Installing
* Clone this repository to your local machine.
* Open RStudio and set the working directory to the cloned repository.
* Install the required packages by running "install.packages('plyr', repos = "http://cran.us.r-project.org")
remotes::install_github("MRCIEU/TwoSampleMR")".
#### Data
This project uses publicly available genetic data from the IEU OpenGWAS project. The data can be obtained from the OpenGWAS website (https://gwas.mrcieu.ac.uk/) using the dataset IDs indicated in the R script (mr_T1d.Rmd).

## Running the Analysis
* Open the mr_T1d.Rmd file in RStudio.
* Knit the file to generate the analysis report (mr_T1d.html).
* View the report to see the results of the MR analysis.

## Project Workflow
![Screenshot 2023-03-14 at 11 30 20](https://user-images.githubusercontent.com/101923400/224941626-07e0d9c3-649a-4843-a41a-3d2c17259ef7.png)

## Project Structure
This repository is structured as follows:

* data: Contains the raw data files used in the analysis.
* mr_T1D.Rmd: Contains the instrumental variable selection and statistical analysis scripts.
* mr_T1d.html: Contains the MR analysis results.
* README.md: Contains a summary of the project documentation.

## Authors
* Joachim Ssenkaali
* Onan Mulumba
* Lydia Abolo


## Acknowledgments
We thank IEU OpenGWAS for providing access to their data.

## References
* Smith GD, Ebrahim S. Mendelian randomization: prospects, potentials, and limitations. Int J Epidemiol. 2004;33(1):30-42.
* Burgess S, Thompson SG. Mendelian randomization: methods for using genetic variants in causal estimation. Chapman & Hall/CRC Press; 2015.
* Pierce, Brandon L, and Stephen Burgess. 2013. “Efficient design for Mendelian randomization studies: subsample and 2-sample instrumental variable estimators.” American Journal of Epidemiology 178 (7): 1177–84. https://doi.org/10.1093/aje/kwt084.
* https://github.com/MRCIEU/ieugwasr/blob/master/README.md#authentication








