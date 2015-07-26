# Getting and Cleaning Data Course Project

This repo contains my course project files for the July 2015 run of the Getting and Cleaning Data course in the JHU Data Science Specialization on Coursera. The data are taken from the [Human Activity Recognition](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) dataset at the UCI Machine Learning Repository.

run_analysis.R should be run with the UCI HAR Dataset directory inside the current working directory. The script will (in broad outline) perform the following steps:

1. Load the relevant data and combine the training and testing sets
2. Extract the means and standard deviations of the measurements
3. Find the averages of these for each subject and activity
4. Write an output file, tidy.txt, containing a tidy dataset with the summarized data

Codebook.md contains descriptions of the variables.
