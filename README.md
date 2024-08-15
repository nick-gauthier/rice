# Analysis Code for "Projected Warming Will Exceed the Long-Term Thermal Limits of Rice Cultivation"

This repository contains the R notebooks used for the analysis presented in the manuscript "Projected Warming Will Exceed the Fundamental Thermal Niche of Rice Cultivation."
- Main manuscript available [here](https://github.com/nick-gauthier/rice/blob/main/main.qmd). This notebook includes the main text, online methods, and generates all the main analysis figures preprocessed data.
- Data preprocessing and computationally intensive analyses can be found [here](https://github.com/nick-gauthier/rice/blob/main/preprocessing.qmd). Code for the genetic offset analysis is available at [this repository](https://github.com/ornobalam/riceGenomicOffset).
- Supplementary figures and tables are available [here](https://github.com/nick-gauthier/rice/blob/main/supplemental_materials.qmd).
  
## System Requirements

### Software Dependencies
- R (version 4.3.3 and above)
- RStudio (recommended for working with Quarto notebooks)
- See the relevant notebooks for information on the specific R packages and versions employed.

### Operating Systems
- Tested on macOS Sonoma, but should work on Windows and Linux systems as well.

### Hardware
- No special hardware required, the main analysis can be reproduced on a standard laptop computer. Reproducing the data climate and genetic data preprocessing may require a computer with sufficient RAM and storage to handle large datasets.

## Installation Guide

### Prerequisites
Ensure that you have R and RStudio installed on your machine. You can download them from:
- [R](https://cran.r-project.org/)
- [RStudio](https://www.rstudio.com/products/rstudio/download/)

### Installation Steps
1. Clone this repository to your local machine using:
   ```bash
   git clone https://github.com/nick-gauthier/rice
   ```
2. Open RStudio and select the `rice.rproj` file from this folder.

### Typical Installation Time
Installation time is primarily the time taken to install R and RStudio, which typically takes about 5-10 minutes depending on your internet connection.

## Instructions for Use
1. Open the `main.qmd` file or whichever notebook you wish to run in RStudio.
2. Run the notebook using the "Knit" button in RStudio to generate the report which includes figures and analysis output.

### Expected Output
- The output will include all the computational results, figures, and tables used in the manuscript.

### Expected Time to Run
- It takes approximately 5 minutes to reproduce the main analysis and figures in the manuscript. Note that data preprocessing scripts may take longer depending on download speeds.

For any issues or further inquiries, please open an issue in this repository.
