### Instruction List
The script "run_analysis.R" contains the code for processing the "Human Activity Recognition Using Smartphones" dataset into a primary ("Merged_Data") and 
secondary ("Second_Dataset") tidy dataset as specified in the Module 3 project criteria following the 5 described requirements to the final script.

- The **dplyr**-package is needed for the script to work correctly.  
- Descriptive comments are included in the script to better understand the transformation.  
- If the end user should want to use the script to replicate the work, only the path to the working directory should be changed to the end users needs. 
The remaing code should reproduce exactly the same two tidy datasets, as no other input parametres are needed.  

**Requirements to the final script:**

1) Merges the training and the test sets to create one data set.
	- After downloading and unzipping the files, a list of the files is obtained (28 elements) and each of the relevant data files are read into R with descriptive variable names added using the '*read.table*' function.
	- The test data and training data are then merged using the '*cbind*' and '*rbind*' functions, ultimately rendering a **"Merged_Data" data set with 10299 obs. of 563 variables**.  
<br>
2) Extracts only the measurements on the mean and standard deviation for each measurement.
	- The '*grep*' function is used to subset the variables that represent either mean og standard deviation specified by the variable name.
	- '*Select*' is then used to combine only the relevant variables/columns into a new dataframe (the "meanFreq" variables are weighted averages and are not considered to be included as a 'mean' because a mean() variable is also specifically given). This renders a **"Merged_Data" data set with 10299 obs. of 68 variables**.  
<br>
3) Uses descriptive activity names to name the activities in the data set.
	- Using '*sub*' the values of the Activity variable are substituted by the corresponding descriptive labels given in the "activity_labels" file.  
<br>
4) Appropriately labels the data set with descriptive variable names.
	- Abbreviations in the variables names are substituted by more descriptive words using the '*gsub*' function.  

*These first 4 steps generate a primary tidy dataset (Merged_Data) with all the required information.*  

5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	- Using '*group_by*' the primary tidy data set is grouped by subject ID and then activity.
	- The data is summarized by the average of the measurements in each group and the variable names are changed to describe the summary choice. This renders a **"Second_Dataset" with 180 obs. of 68 variables**.