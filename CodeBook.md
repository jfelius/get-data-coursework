# Code Book

## Source data
Source data is provided in a set of text files. The files "test/X_test.txt" and "train/X_train.txt" contain the actual data, with each line containing a large number of vaiables belonging to one observation.

The files "test/subject_test.txt" and "train/subject_train.txt" contain a numeric code (1-30) corresponding to the subject ID for each observation in the data files.

The files "test/y_test.txt" and "train"/y_train.txt" contain a *activity code* corresponding to each observation in the data files. There are 6 different activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying), coded '1' through '6', respectively.

## Data manipulation and R script
* The R script run_analysis.R reads in each text files as a dataframe, then merges the dataframes together: lining up the subject and activiy codes with the observations, and combining the test and train groups.
* Only a subset of 66 dependent variables is selected, and these variables get renamed using meaningful names. These names are fetched from a spearate txt file 'newVarNames.txt'. 
* Activity codes are replaced by meaningful names.
* Thus, a dataframe (df) is created that includes values on 66 variables for each observation, where each observation is identified as belonging to a given subject performing a given activity.
* A new dataframe (newdf) is constructed containing only the means (for each subject-activity combination) of the 66 variables.

## Output: the summary of means (newdf)
Each line in summary of means (newdf) lists the mean values of all variables for a single subject-activity combination. the variable names are the same as in the original dataframe.

## Variable names and descriptions

subject
	: Subject ID number (numeric 1-30)

group
	: Group designation for each subject; factor with levels "Test" and "Train"

activity
	: Factor denoting the activity during which the data were obtained;
	  Levels="Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying".

tBodyAcc.X.mean
tBodyAcc.Y.meantBodyAcc.Z.mean	: (numeric) Body acceleration, time domain signal, mean values of the x-, y-, and z-components
tBodyAcc.X.sdtBodyAcc.Y.sdtBodyAcc.Z.sd
	: (numeric) Body acceleration, time domain signal, standard deviation of the x-, y-, and z-components

tGravityAcc.X.meantGravityAcc.Y.meantGravityAcc.Z.mean
	: (numeric) Gravitational acceleration, time domain signal, mean values of the x-, y-, and z-components

tGravityAcc.X.sdtGravityAcc.Y.sdtGravityAcc.Z.sd	: (numeric) Gravitational acceleration, time domain signal, standard deviation of the x-, y-, and z-components

tBodyAccJerk.X.meantBodyAccJerk.Y.meantBodyAccJerk.Z.mean
	: (numeric) Body acceleration jerk, time domain signal, mean values of the  x-, y-, and z-components

tBodyAccJerk.X.sdtBodyAccJerk.Y.sdtBodyAccJerk.Z.sd
	: (numeric) Body acceleration jerk, time domain signal, standard deviation of the  x-, y-, and z-components

tBodyGyro.X.meantBodyGyro.Y.meantBodyGyro.Z.mean
	: (numeric) Body gyroscopic motion, time domain signal, mean values of the  x-, y-, and z-components

tBodyGyro.X.sdtBodyGyro.Y.sdtBodyGyro.Z.sd
	: (numeric) Body gyroscopic motion, time domain signal, standard deviation of the  x-, y-, and z-components

tBodyGyroJerk.X.meantBodyGyroJerk.Y.meantBodyGyroJerk.Z.mean
	: (numeric) Body gyroscopic jerk, time domain signal, mean values of the  x-, y-, and z-components

tBodyGyroJerk.X.sdtBodyGyroJerk.Y.sdtBodyGyroJerk.Z.sd
	: (numeric) Body gyroscopic jerk, time domain signal, standard deviation of the  x-, y-, and z-components

tBodyAccMag.meantBodyAccMag.sd
	: (numeric) Body acceleration, time domain signal, mean and standard deviation of the vector magnitude

tGravityAccMag.meantGravityAccMag.sd
	: (numeric) Gravitational acceleration, time domain signal, mean and standard deviation of the vector magnitude

tBodyAccJerkMag.meantBodyAccJerkMag.sd
	: (numeric) Body acceleration jerk, time domain signal, mean and standard deviation of the vector magnitude

tBodyGyroMag.meantBodyGyroMag.sd
	: (numeric) Body gyroscopic motion, time domain signal, mean and standard deviation of the vector magnitude

tBodyGyroJerkMag.meantBodyGyroJerkMag.sd
	: (numeric) Body gyroscopic jerk, time domain signal, mean and standard deviation of the vector magnitude

fBodyAcc.X.meanfBodyAcc.Y.meanfBodyAcc.Z.mean
	: (numeric) Body acceleration, frequency domain signal, mean values of the x-, y-, and z-components

fBodyAcc.X.sdfBodyAcc.Y.sdfBodyAcc.Z.sd
	: (numeric) Body acceleration, frequency domain signal, standard deviation of the x-, y-, and z-components

fBodyAccJerk.X.meanfBodyAccJerk.Y.meanfBodyAccJerk.Z.mean
	: (numeric) Body acceleration jerk, frequency domain signal, mean values of the x-, y-, and z-components

fBodyAccJerk.X.sdfBodyAccJerk.Y.sdfBodyAccJerk.Z.sd
	: (numeric) Body acceleration jerk, frequency domain signal, standard deviation of the x-, y-, and z-components

fBodyGyro.X.meanfBodyGyro.Y.meanfBodyGyro.Z.mean
	: (numeric) Body gyroscopic motion, frequency domain signal, mean values of the x-, y-, and z-components

fBodyGyro.X.sdfBodyGyro.Y.sdfBodyGyro.Z.sd
	: (numeric) Body gyroscopic motion, frequency domain signal, standard deviation of the x-, y-, and z-components

fBodyAccMag.meanfBodyAccMag.sd
	: (numeric) Body acceleration, frequency domain signal, mean and standard deviation of the vector magnitude

fBodyAccJerkMag.meanfBodyAccJerkMag.sd
	: (numeric) Body acceleration jerk, frequency domain signal, mean and standard deviation of the vector magnitude

fBodyGyroMag.meanfBodyGyroMag.sd
	: (numeric) Body gyroscopic motion, frequency domain signal, mean and standard deviation of the vector magnitude

fBodyGyroJerkMag.meanfBodyGyroJerkMag.sd
	: (numeric) Body gyroscopic jerk, frequency domain signal, mean and standard deviation of the vector magnitude


