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

# Keep only selected variables:
# (These are the column numbers that have all the 'means' and 'standard deviations'.)
df <- select(df, c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241,
                    253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543))

# Give variable names (NOTE: I stored them in a separate file because it is such a very long list)
varNames <- read.table("newVarNames.txt")
names(df) <- varNames[,1]

# Read the subject ID and activity labels for both data sets:
test.subject <- read.table("test/subject_test.txt")
train.subject <- read.table("train/subject_train.txt")
subject <- rbind(test.subject, train.subject)

test.activity <- read.table("test/y_test.txt")
train.activity <- read.table("train/y_train.txt")
activity <- rbind(test.activity, train.activity)

# Create a 'group' variable to indicate which group each observation belongs to ('Test' or 'Train').
# (This was not part of the assignment, but I would always do this to make it easier to trace back
# later. For the time being, I am not using it.)
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
# At this point the data frame 'df' is ready to be analyzed / summarized.

# Group all observations by 'subject' and by 'activity':
person.activity <- group_by(df, subject, activity)

# Create a new 'grouped_by' dataframe
newdf <- summarise_each(person.activity, funs(mean))

# Write to text file (for upload to Course Assignment website)
write.table(newdf, file="tidySummary_of_means.txt", row.names=FALSE)
