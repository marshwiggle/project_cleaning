
# Get activities names
activity_labels <- read.table("activity_labels.txt")

#In the Source Dataset activities are coded as numbers. 
#We want represent them as ordinary english words like "walking" or "laying"
#First for the training set
activities_train_raw <- read.table("y_train.txt")
activities_train <- merge(activities_train_raw, activity_labels)$V2

#... and then for the test set
activities_test_raw <- read.table("y_test.txt")
activities_test <- merge(activities_test_raw, activity_labels)$V2

# Now, let's read info about the subject for each measurement
subject_train <- read.table("subject_train.txt")
subject_test  <- read.table("subject_test.txt")

#These are column names for the features table
features_raw <- read.table("features.txt", header = FALSE)

#..but we have to select only those, that contains the word "mean" or "std"
col_nums <- grep("(mean|std)", features_raw$V2, ignore.case = TRUE)
col_names <- features_raw[col_nums, "V2"]
col_names <- as.character(col_names)
# First two columns in the final table will contain subject number and activity name,
# So we prepend this two lables to the column names list.
col_names <- append(c("subject", "activity"), col_names)

#Extracting training data 
data_train <- read.table("X_train.txt", header = FALSE)
#Selecting columns
data_train <- data_train[, col_nums]
#Prepending subject and activity columns to the training data
data_train <- cbind(subject_train, activities_train, data_train)
#Adding column names
names(data_train) <- col_names

# Extracting test data 
data_test <- read.table("X_test.txt", header = FALSE)
data_test <- data_test[, col_nums]
data_test <- cbind(subject_test, activities_test, data_test)
names(data_test) <- col_names

# Merging training and test data
ds <- rbind(data_train, data_test)
# Grouping and avergagind the data
result <- ds %>% group_by(subject, activity) %>% summarize_each(funs(mean), 2:length(col_names))
# Writing output to csv
write.table(result, "processed_data.txt", row.names = FALSE)
