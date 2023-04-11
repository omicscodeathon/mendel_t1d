# Exploring the Causal Effect of Omega-3 Fatty acid  Levels on Risk of Type 1 Diabetes: A Mendelian Randomization Study

## Background
Type 1 diabetes mellitus (T1D) is a chronic autoimmune disease characterized by the destruction of insulin-producing pancreatic beta cells and an ensuing lack of or low insulin. The burden of T1D is vast and as of 2021, an estimated 8.4 million people were living with the disease across the globe. It is predicted that by 2040, this number could increase to up to 17.4 million people. Despite nearly a century of insulin therapy for alleviating hyperglycaemia and the accompanying symptoms of T1D, no therapies exist to treat the underlying etiopathology of the disease. As evidenced by several studies, dietary interventions could offer a cost-effective approach to lowering the risk of T1D. The role of fatty acid status in the development of T1D has been of notable interest to researchers. Particularly, adequate dietary intake of omega-3 fatty acids (ω-3) has been reported to be associated with reduced risk of developing T1D. Given the inconclusive evidence from observational studies and RCTs, we conducted a Mendelian randomization (MR) study to explore the relationship between omega-3 fatty acids  intake and T1D. 

## Project description
This project uses MR to investigate the causal effect of omega-3 levels on risk of Type 1 diabetes mellitus using genetic variants from Genome-wide association study (GWAS) summary statistics. 

## Getting started
These instructions will get you a copy of the project up and running on your local machine for your own analysis.
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
* Open the mr_T1d.Rmd file in the scripts folder in RStudio.
* Knit the file to generate the analysis report (mr_T1d.html).
* View the report to see the results of the MR analysis.

## Project Workflow
<img width="589" alt="Screenshot 2023-04-05 at 10 16 26" src="https://user-images.githubusercontent.com/101923400/230008866-7b354de6-62fd-41dc-8b2f-d687467347f5.png">


## Project Structure
This repository is structured as follows:

* data: Contains the raw data files used in the analysis.
* scripts: Contains the instrumental variable selection and statistical analysis scripts.
* output: Contains the MR analysis results.
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








