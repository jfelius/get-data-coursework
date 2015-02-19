README.md

This repo contains the files requested for the Course Prject belonging to the "Get Data" data science course.

The assignment was to create an R script (run_analysis.R) that reads in a large dataset that was provided. These data consist of a large number (561) variables, measured in 30 subjects while doing 6 different activities. For each subject-activity combination, there are many repeat measurements. Goal was to summarize the data, on a selection of variables, in terms of their mean values (for each subject-activity combination).

The raw data are distributed in several files, which the R script merges into one. Then only a selection of 66 of the original 561 parameters (dependent variables) is kept for further analyis. Data analysis consists of creating a 'tidy' data set with the mean values (per subject-activity combination).

The repo contains 4 files:

run_analysis.R : An R script that performs the analysis. The script will assume that the raw data files are in the current work directory of R.

CodeBook.md : A markdown file with information on variables and data manipulations associated with the R script.

newVarNames.txt : A text file containing a list of new variable names. This file need to be placed in the current working directory of R and will be read during execution of the R script.

README.md : This readme text.

