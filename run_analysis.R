## Set the working directory:
setwd("C:/Users/laerk/Desktop/R-kursus/Kursus 3 - Getting And Cleaning Data/Afsluttende projekt")

## Download and unzip files:
file_name <- "smartphone_data.zip"
if(!file.exists(file_name)) {
        file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(file_url, file_name)
        unzip(file_name)
}

## Reset working directory:
setwd("./UCI HAR Dataset")

## Obtain a list of the txt. files in working directory and subfolders:
list_of_files <- list.files(path = ".", recursive = TRUE,
                            pattern = "\\.txt$", 
                            full.names = TRUE)

## Read each relevant data file and add descriptive column names:
Test_subject <- read.table(list_of_files[14], col.names = "Subject_ID")
Test_labels <- read.table(list_of_files[16], col.names = "Activity")
Features <- read.table(list_of_files[2], col.names = c("Feature_Category", "Features"))
Test_data <- read.table(list_of_files[15], col.names = Features$Features)

Training_subject <- read.table(list_of_files[26], col.names = "Subject_ID")
Training_labels <- read.table(list_of_files[28], col.names = "Activity")
Training_data <- read.table(list_of_files[27], col.names = Features$Features)

Activity_labels <- read.table(list_of_files[1], col.names = c("Activity_Category", "Activity"))

##Merge the test data and training data:
Merged_TestData <- cbind(Test_subject, Test_labels, Test_data)
Merged_TrainingData <- cbind(Training_subject, Training_labels, Training_data)
Merged_Data <- rbind(Merged_TestData, Merged_TrainingData)

## Remove variables that are not measurements of the mean or standard deviation:
variable_names <- names(Merged_Data)
use_variables <- grep("mean|std", variable_names)
Merged_Data <- select(Merged_Data, 1, 2, all_of(use_variables))
meanFreq_names <- grep("meanFreq", names(Merged_Data))
Merged_Data <- select(Merged_Data, -(all_of(meanFreq_names)))

##Substitute the activity label codes with descriptive values:
Merged_Data$Activity <- sub("1", Activity_labels$Activity[1], Merged_Data$Activity)
Merged_Data$Activity <- sub("2", Activity_labels$Activity[2], Merged_Data$Activity)
Merged_Data$Activity <- sub("3", Activity_labels$Activity[3], Merged_Data$Activity)
Merged_Data$Activity <- sub("4", Activity_labels$Activity[4], Merged_Data$Activity)
Merged_Data$Activity <- sub("5", Activity_labels$Activity[5], Merged_Data$Activity)
Merged_Data$Activity <- sub("6", Activity_labels$Activity[6], Merged_Data$Activity)

## Renaming the data set with descriptive variable names:
names(Merged_Data) <- gsub("^t", "Time", names(Merged_Data))
names(Merged_Data) <- gsub("^f", "Frequency", names(Merged_Data))
names(Merged_Data) <- gsub("Acc", "Acceleration", names(Merged_Data))
names(Merged_Data) <- gsub("Gyro", "Gyroscope", names(Merged_Data))
names(Merged_Data) <- gsub("Mag", "Magnitude", names(Merged_Data))
names(Merged_Data) <- gsub("BodyBody", "Body", names(Merged_Data))

## Create a second tidy data set:
Merged_Data <- arrange(Merged_Data, Merged_Data$Subject_ID, Merged_Data$Activity)
Second_Dataset <- Merged_Data
Second_Dataset <- Second_Dataset %>% group_by(Subject_ID, Activity) %>% 
        summarize_all(funs(mean))

## Rename variables in second dataset:
variable_names2 <- names(Second_Dataset)
old_names <- variable_names2[-c(1,2)]
new_names <- paste0("Average(", old_names, ")")
final_names <- c(names(Second_Dataset[1:2]), new_names)
names(Second_Dataset) <- final_names

