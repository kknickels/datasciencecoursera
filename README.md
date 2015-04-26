# Getting and Cleaning Data Course Project (JH Data Science Priject)

The code/script to run the data transfer is included in one file(also in this repo) named run_analysis.r

The script will run as long as it is in the same directory with the data files.  

DATA FILES:

The data files should be in the same structure as the downloaded zip file with "features.txt" and "activity_labels" at the root alongside two directories "test" and "train" that each contain three text files for Subject, X and Y data.  Subject identifies the subject, Y identifies the activity, X contatins the observation data across all of the variables.

run_analysis.R

The code is commented, but a brief overview below:

Packages Required
  The code reads 'dplyr' and 'data.table' into the library

URLs
  8 Urls are defined.  
    (1-6) for the data (3 each for test and train)
    (7) activity_labels to give the activities meaningful names
    (8) and features.txt in order to identify the variable columns required and give them meaningful names.

Read data into dataframes
  All six files from the test and train directories are read into dataframes
  Activity labels are read into a frea
