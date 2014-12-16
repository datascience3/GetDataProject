run_analysis <- function() {
    '
      Performs the following:
      1. Downloads the Human Activity Recognition dataset (which can be
         found on the UC Irvine machine learning repository) from
         cloudfront.net
      2. Saves the dataset to "UCI HAR Dataset.zip" in the current
         working directory.
      3. Unzips the file "UCI HAR Dataset.zip", creating a directory
         "UCI HAR Dataset" in the current working directory.
      4. Merges the training and the test sets to create one data set.
      5. Extracts only the measurements on the mean and standard
         deviation for each measurement.
      6. Uses descriptive activity names to name the activities in the data set.
      7. Appropriately labels the data set with descriptive variable names,
         removing non-alphanumeric characters from the labels.

      Returns a data frame object.
    '

    # download the dataset and save to "UCI HAR Dataset" directory
    if (!file.exists("UCI HAR Dataset")) {
        download.file(paste0("https://d396qusza40orc.cloudfront.net/",
                      "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"),
                      destfile = "UCI HAR Dataset.zip",
                      method = "curl",
                      quiet = TRUE)
        unzip("UCI HAR Dataset.zip")
    }

    # save the list of features
    features <- read.table("UCI HAR Dataset/features.txt")$V2


    # merge the training and test data into a single data frame
    train_X <- read.table("UCI HAR Dataset/train/X_train.txt")
    test_X <- read.table("UCI HAR Dataset/test/X_test.txt")
    result <- rbind(train_X, test_X)


    # assign column names as given in the 'features.txt' file
    colnames(result) <- features



    # remove non-alphanumeric symbols from the column names
    colnames(result) <- gsub("[^a-zA-Z0-9]", "", colnames(result))

    # replace 'BodyBody' with 'Body' in column names
    colnames(result) <- gsub("BodyBody", "Body", colnames(result))


    # further cleanup of column names
    colnames(result) <- gsub("gravity$", "AndGravityMean", colnames(result))
    colnames(result) <- gsub("^t", "Time", colnames(result))
    colnames(result) <- gsub("anglet", "AngleBetweenTime", colnames(result))
    colnames(result) <- gsub("^f", "Freq", colnames(result))
    colnames(result) <- gsub("angle", "AngleBetween", colnames(result))
    colnames(result) <- gsub("gravity", "AndGravity", colnames(result))
    colnames(result) <- gsub("mean", "Mean", colnames(result))
    colnames(result) <- gsub("std", "Std", colnames(result))
    colnames(result) <- gsub("Acc", "Accel", colnames(result))


    # keep only columns matching "Mean" or "Std"
    result <- subset(result, select=grepl("Std|Mean", colnames(result)))


    # use descriptive activity names
    train_y <- readLines("UCI HAR Dataset/train/y_train.txt")
    test_y <- readLines("UCI HAR Dataset/test/y_test.txt")
    activity_y <- c(train_y, test_y)
    activities <- read.table("UCI HAR Dataset/activity_labels.txt")
    for (row in 1:nrow(activities)) {
        activity_y = gsub(activities[row, 1], activities[row, 2], activity_y)
    }
    activity_y <- gsub("_", "", activity_y)




    # append the y column, name it 'Activity'
    activity_y <- as.data.frame(activity_y)
    colnames(activity_y) <- c("Activity")
    result <- cbind(result, activity_y)



    # append the 'Subject' column, name it 'Subject'
    subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
    subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
    subjects <- rbind(subject_train, subject_test)
    colnames(subjects) <- c("Subject")
    result <- cbind(result, subjects)



    return(result)
}




tidy <- function(data_frame) {
    ' Creates a tidy data set from the data frame produced by
      the run_analysis() function.

      Returns a data frame where the columns are averaged for each
      subject ID and activity.

      NOTE: The input to this function MUST be the data frame
            produced from the run_analysis() function.

    '

    # the number of columns in the data frame
    num_col <- ncol(data_frame)

    # the number of subjects
    num_subjects <- 30

    # the number of activities for each subject
    num_activities <- 6

    # split the data frame by subject ID and activity
    dfsplit <- lapply(split(data_frame, data_frame$Subject),
                      function(x) {split(x, x$Activity)})

    # initialize an empty data frame
    result <- data.frame(matrix(vector(), 0, num_col))
    colnames(result) <- names(data_frame)

    # Loop over dfsplit to populate the data frame 'result'
    for (i in 1:num_subjects) {
        for (j in 1:num_activities) {

            activity <- as.character(dfsplit[[i]][[j]][1, num_col - 1])
            subject <- dfsplit[[i]][[j]][1, num_col]

            # append row of averages to 'result'
            new_row <- c(lapply(dfsplit[[i]][[j]][,1: (num_col - 2)], mean),
                       Activity = activity, Subject = subject)
            result <- rbind(result, new_row)
            result$Activity <- as.character(result$Activity)

        }
    }
    return(result)
}

