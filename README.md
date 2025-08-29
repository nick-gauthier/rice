# Analysis Code for "Projected Warming Will Exceed the Long-Term Thermal Limits of Rice Cultivation"

This repository contains the R notebooks used for the analysis presented in the manuscript "Projected Warming Will Exceed the Long-Term Thermal Limits of Rice Cultivation."

[Click here for a fully rendered version of the manuscript.](https://nick-gauthier.github.io/rice/)

## Repository Structure

### Main Analysis: `main.qmd`
The [main notebook](https://github.com/nick-gauthier/rice/blob/main/main.qmd) contains:
- Complete manuscript text with embedded analysis
- All main and supplementary figures and tables
- Online methods section
- **This is the primary file to run** - it reproduces all results using preprocessed data included in the repository

### Data Preprocessing: `preprocessing.qmd` 
The [preprocessing notebook](https://github.com/nick-gauthier/rice/blob/main/preprocessing.qmd) is provided for reference and transparency but is **not intended to be run** as it requires:
- Hundreds of GB of raw climate data (CHELSA-TraCE21k, CMIP6 ensembles)
- Access to external data repositories and cloud storage
- Significant computational resources and time

All necessary intermediate datasets are provided in `data/derived/` for the main analysis.

### Genetic Analysis
Code for the genetic offset analysis is available at [this separate repository](https://github.com/ornobalam/riceGenomicOffset).
  
## System Requirements

### Software Dependencies
- R (version 4.3.3 and above)
- RStudio (recommended for working with Quarto notebooks)
- See the relevant notebooks for information on the specific R packages and versions employed.

### Operating Systems
- Tested on macOS Sonoma, but should work on Windows and Linux systems as well.

### Hardware
- No special hardware required - the main analysis can be reproduced on a standard laptop computer
- The preprocessing workflow (not included for reproduction) required high-performance computing resources to handle hundreds of GB of climate data

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

### To Reproduce the Main Analysis
1. Open the `main.qmd` file in RStudio
2. Install required R packages (they will be loaded automatically when you run the notebook)
3. Click the "Render" button in RStudio to generate the complete manuscript with embedded figures and analysis

### Expected Output
- A complete HTML/PDF manuscript with all computational results, figures, and tables
- All main text figures (1-6) and supplementary figures (S1-S9)
- All tables including supplementary tables

### Expected Time to Run
- Approximately **5-10 minutes** to reproduce the complete analysis and generate all figures
- No large data downloads required - all preprocessed data is included in the repository

### Note on Preprocessing
- **Do not attempt to run `preprocessing.qmd`** - it requires access to hundreds of GB of external climate datasets
- This file is provided for methodological transparency and to document the data processing pipeline
- All outputs from preprocessing are already provided in `data/derived/`

For any issues or further inquiries, please open an issue in this repository.
