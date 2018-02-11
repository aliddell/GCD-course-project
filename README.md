## Getting and Cleaning Data Course Project

This repository contains the following scripts:

 * `run_analysis.R`
 
Additionally, it contains the following files:

 * `README.md`
 * `CodeBook.md`
 
Data dependencies include the [UCI Human Activity Recognition](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip) data set.
 
### run_analysis.R

This script performs the analysis.
It transforms the [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) into a tidy summary data set.
Provided this script is invoked from the base directory of the uncompressed zip, it will output a file `summary.txt` containing the summarized data set.

Library dependencies:

 * `plyr`
 * `dplyr`
 * `tools`

### README.md

This README file.

### CodeBook.md

A data code book describing the output data in `summary.txt`.