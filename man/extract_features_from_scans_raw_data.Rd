% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extract_features_from_scans_raw_data.R
\name{extract_features_from_scans_raw_data}
\alias{extract_features_from_scans_raw_data}
\title{extract_features_from_scans_raw_data}
\usage{
extract_features_from_scans_raw_data(sps_j, name, f_path, cutoff, tol)
}
\arguments{
\item{sps_j:}{a list of concatenated MS2 spectra for a given feature}

\item{name:}{name of feature (ID)}

\item{f_path:}{path to the a folder with the same name as the feature ID is created inside the folder titled MS2_scans_before_denoising}

\item{cutoff:}{top x\% TIC cutoff}

\item{tol:}{mass tolerance for grouping}
}
\value{
A list containing the top x\% TIC and number of scans before and after TIC filtering
}
\description{
Helper function for extract_raw_spectra. Need not be run separately. For every feature, reads the MS2 spectra, groups fragments within a given tolerance, extracts the resulting sprectrum to a text file. Based on user input, it will retain only the top x\% TIC spectra.
}
\examples{
# Example usage of the function
extract_features_from_scans_raw_data(sps_j, 1098, f_path, 0.8, 0.05)
}
