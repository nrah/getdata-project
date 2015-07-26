library(dplyr)

# Make sure the files are there
if (!file.exists("UCI HAR Dataset")) stop("Data files not found!")

# Read in the files
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')
features <- read.table("UCI HAR Dataset/features.txt")

# Attach the subject and activity columns and combine the datasets
test <- cbind(subject_test, y_test, X_test)
train <- cbind(subject_train, y_train, X_train)
combined <- rbind(train, test)

# Name the columns and activities
names(combined) <- c("subject", "activity", as.character(features[[2]]))
combined$activity <- factor(combined$activity, levels = 1:6,
                            labels = c("Walking", "Walking Upstairs",
                                       "Walking Downstairs", "Sitting",
                                       "Standing", "Laying"))

# Extract the mean and std columns and clean up the column names
columns <- c("subject", "activity", grep("mean[^F]|std",
                                         features[[2]], value = TRUE))
extracted <- combined[, columns]
names(extracted) <- gsub("-mean\\(\\)-?", "Mean", names(extracted))
names(extracted) <- gsub("-std\\(\\)-?", "STD", names(extracted))

# Make the tidy dataset and write it to a file
tidy <- extracted %>%
        group_by(subject, activity) %>%
        summarise_each(funs(mean))

write.table(tidy, file = "tidy.txt", row.names = FALSE)