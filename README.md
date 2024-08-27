# <ins>D<\ins>enoising Using Replicate Spectra (DuReS)

## Introduction

This package provides a set of easy-to-implement functions to denoise tandem mass spectrometry data. It requires a set of mzML files and a txt file containing feature information (from peak picking) such as the mz and RT as input and outputs a set of mzML files with the same number of features. 

## Installation

First, you need to install two dependencies from Bioconductor: S4Vectors and Spectra
```r
install.packages("BiocManager")
BiocManager::install(c("Spectra", "S4Vectors"))
```
After this you can proceed with the installation of the development version of the package DuReS as follows:

```r
install.packages("devtools")
devtools::install_github("banerjeeshayantan/dures")
```

## Documentation
Detailed documentation of the package is available [here](https://banerjeeshayantan.github.io/dures/)

## Quick Start
```r
#This step reads in the mzML files, prepares the stats.txt file in a format that extracts MS2 spectra and returns a list
folder_path = "~/metabolomics/test_1/" #folder path containing mzml/ and Stats.txt in required format
l1 = preprocess(folder_path = folder_path, ppm = 5, tol_rt = 0.1) #reads mzml files, prepares Stats file, extracts spectra and concatenates spectra

#This step extracts the top 80% TIC spectra and groups fragments within a given mass tolerance
l2 = extract_raw_spectra(folder_path = folder_path, l1, 0.05, 0.8) #extract top x% (where x = 0.8) TIC spectra, groups fragments within a given tolerance (0.05 Da)

#This step aggregates the top 80% TIC spectra from step2 and calculates the fragment frequencies
l3 = call_aggregate(l2$sps_top_tic_2, 0.05, folder_path) 

#This step labels the individual spectrum with frequencies learnt from Step 3
l4 = label_individual_spectrum(l3, folder_path, 0.05)

#This step removed fragments with frequencies below the given threshold (denoising step)
l5 = generate_denoised_spectra(l4, folder_path, ion_mode = "pos") 
```

## Package Workflow
![Workflow Diagram](https://raw.githubusercontent.com/banerjeeshayantan/test_read_the_docs_tut/main/dures_workflow.png)

## Citation
Please cite the following paper if you use our package

