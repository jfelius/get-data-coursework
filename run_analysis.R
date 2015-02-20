# Coursework Assignment "Get Data", week 3
# Joost Felius, 18 February 2015
# This is the annotated R script that performs the requested data analysis.
# More detailed information is in the accompanying files 'README.md' and 'codebook.md'.

library(dplyr)

# Read the data from the two .txt files:
test.set <- read.table("test/X_test.txt")
train.set <- read.table("train/X_train.txt")

# Merge the 2 data frames:
df <- rbind(test.set, train.set)

# Get variable names from separate file:
varNames <- read.table("features.txt")
names(df) <- varNames[,2]

# Keep only selected variables:
# (These are the columns that have all the 'means' and 'standard deviations'.)
selection <- sort( c( grep("mean()",names(df),fixed=TRUE), grep("std()",names(df),fixed=TRUE) ) )
df <- df[ , selection]

# Give new variable names (NOTE: I stored them in a file because it is still a very long list)
varNames <- read.table("newVarNames.txt")
names(df) <- varNames[,1]

# Read the subject ID and activity labels for both data sets:
test.subject <- read.table("test/subject_test.txt")
train.subject <- read.table("train/subject_train.txt")
subject <- rbind(test.subject, train.subject)

test.activity <- read.table("test/y_test.txt")
train.activity <- read.table("train/y_train.txt")
activity <- rbind(test.activity, train.activity)

# [Optional] Create a 'group' variable to indicate which group each observation belongs to ('Test' 
# or 'Train'). This was not specified in the assignment, but I would always do this to make it easier
# to trace back later. For the time being, I am not using it.
group <- c(rep("Test", nrow(test.set)), rep("Train", nrow(train.set)))

# Add the 'subject', and 'activity' variables to the data frame:
df <- cbind(subject, activity, df)
names(df)[1:2] <- c("subject", "activity")

# Rename the 'activity' factor labels:
df$activity[df$activity==1] <- "Walking"
df$activity[df$activity==2] <- "Walking Upstairs"
df$activity[df$activity==3] <- "Walking Downstairs"
df$activity[df$activity==4] <- "Sitting"
df$activity[df$activity==5] <- "Standing"
df$activity[df$activity==6] <- "Laying"

#####
# At this point the dataframe 'df' is tidy and ready to be analyzed / summarized.
#####

# Group all observations by 'subject' and by 'activity':
person.activity <- group_by(df, subject, activity)

# Create a new 'grouped_by' dataframe
newdf <- summarise_each(person.activity, funs(mean))

# Write to text file (for upload to Course Assignment website)
write.table(newdf, file="Summary_of_PersonActivityMeans.txt", row.names=FALSE)

