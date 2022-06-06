## Code Book
This code book applies to the course project of Module 3 "Getting and Cleaning Data", a part of a Coursera data science course, and describes how the data for the project was obtained and provides information about the data, variables, and summary choices.  

### Experimental Study Design
The data for this course project was obtained from:  
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


A description of the data is available at:  
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)  

**Brief description of the data** (taken from the original description)  
The data was obtained from experiments carried out with a group of 30 volunteers where each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone on the waist. Using the smartphone's embedded accelerometer and gyroscope, the 3-axial linear acceleration and 3-axial angular velocity was recorded.  
The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% for generating the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

**For each record the following information is provided:**  
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.  
- Triaxial Angular velocity from the gyroscope.  
- A 561-feature vector with time and frequency domain variables.  
- Its activity label.  
- An identifier of the subject who carried out the experiment.  

More extensive information about the variables and units are available in the 'features_info.txt' and 'features.txt' files of the data.

### Data Files
The dataset includes the following files (taken from the original description):

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent: 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Cleaning the data
Two processed datasets were obtained in this project; a primary tidy dataset denoted **"Merged_Data"** and a second tidy dataset denoted **"Second_Dataset"**. Transformation of the data is documented in the script (run_analysis.R) supported by an Instruction List.
The units of the variables in both datasets are similar to the units of the variables of the original data (see description above).  

The primary tidy dataset includes the subject id, the physical activity during each measurement, and a subset of variables which represent the mean or standard deviation of each measurement.

The second tidy dataset includes the same variables (and units) as the primary dataset but is summarized to display the average of each variable grouped by each subject and each activity.

