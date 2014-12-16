Getting and Cleaning Data: Course Project
=========================================

In (1), Anguita, Ghio, Oneto, Parra, and Reyes-Ortiz present a system for human activity recognition using accelerometer and gyroscope sensors in smartphones. The dataset is available at the UC Irvine machine learning repository website [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones][1]. In this course project, we provide scripts written in the R porgramming language to download, process, clean, and summarize portions of the data.


### Description of the files included

* README.md - this document.
* run_analysis.R - contains code written in the R programming language to
                   process and create a tidy data set from the smartphone data.
* codebook.md - a codebook describing the variables in the tidy data set.


### Instructions: Loading the data and running the scripts
To create a tidy data set, open an R session, set
the current working directory (using `setwd()`) to the directory
containing `run_analysis.R` and enter the following at the prompt:



```r
source('run_analysis.R')
df <- run_analysis() # downloads the dataset and creates a large data frame, this could take 3-4 minutes
tidy_df <- tidy(df) # creates a tidy data set
```
### The `run_analysis.R` file

The `run_analysis.R` file contains code for the functions `run_analysis()` and `tidy()`.

The `run_analysis()` function requires no argument, whereas `tidy()` requires a data frame as its argument, and it MUST be the data frame returned by `run_analysis()`. Both functions return a data frame object.

* **run_analysis()** - Performs the following:
      1. Downloads the Human Activity Recognition dataset
         from cloudfront.net
      2. Saves the dataset to "UCI HAR Dataset.zip" in the current
         working directory.
      3. Unzips the file "UCI HAR Dataset.zip", creating a directory
         "UCI HAR Dataset" in the current working directory.
      4. Merges the training and the test sets to create one data set.
      5. Extracts only the measurements on the mean and standard
         deviation for each measurement.
      6. Uses descriptive activity names to name the activities
         in the data set.
      7. Appropriately labels the data set with descriptive variable
         names, removing non-alphanumeric characters from the labels.

* **tidy()** - Creates a tidy data set from the data frame produced by the run_analysis() function. Returns a data frame where the columns are averaged for each subject ID and activity.


### Summary of the datasets created by `run_analysis()` and `tidy()`
The function `run_analysis()` creates a relatively large data frame having 10299 rows and 88 columns. The first 86 columns give measurements collected from the accelerometers and gyroscope sensors in the Samsung Galaxy S smartphone (refer to the `codebook.md` file for further descriptions of each variable).

The last two columns are 'activity' and 'subject', which indicates the activity a specific subject was performing when the measurements were taken.

There are 30 subjects labelled 1 through 30. The activities listed in the 'activity' column are given the descriptive activity names "STANDING", "SITTING", "LAYING", "WALKING", "WALKINGDOWNSTAIRS", and "WALKINGUPSTAIRS".

On average, each (activity, subject) pair has approximately 57 observations. The data set created by the `tidy()` function summarizes everything by averaging the measurements for each (activity, subject) pair. Since there are 180 such pairs, the `tidy()` functions produces a smaller data frame having only 180 rows (and 88 columns).


```r
# eight random rows, the first column and last two columns only.
tidy_df[sort(sample(180, 8)), c(1, 87, 88)]
```

```
##     TimeBodyAccelMeanX          Activity Subject
## 14           0.2571976           SITTING       3
## 26           0.2736941           SITTING       5
## 56           0.2706121           SITTING      10
## 81           0.2805456          STANDING      14
## 119          0.2961444 WALKINGDOWNSTAIRS      20
## 148          0.2789928           WALKING      25
## 155          0.2792846 WALKINGDOWNSTAIRS      26
## 160          0.2768495           WALKING      27
```

### References
(1) Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

[1]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
