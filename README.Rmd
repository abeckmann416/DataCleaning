---
title: "README"
author: "Alex M. Beckmann"
date: "24/05/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This document describes the script **run_analysis.R**

**STEP 0**: Loading the necessary libraries for data transformation: **dplyr** and **tidyr**:

```{r}
library(tidyr)
library(dplyr)
```

**STEP 1**: creating the subdirectory and loading the data package in the case it does not exist or misses necessary files (*else* statement), as well as unzipping it into a directory:

```{r}
 if (!dir.exists("./UCI HAR Dataset")){
   dir.create("./UCI HAR Dataset")
 } else{
#checking if the necessary files were removed from their destinations"
if(!file.exists("./UCI HAR Dataset/features.txt") || 
   !file.exists("./UCI HAR Dataset/activity_labels.txt") ||
   !file.exists("./UCI HAR Dataset/test/subject_test.txt") ||
   !file.exists("./UCI HAR Dataset/test/X_test.txt") ||
   !file.exists("./UCI HAR Dataset/test/y_test.txt") ||
   !file.exists("./UCI HAR Dataset/train/subject_train.txt") ||
   !file.exists("./UCI HAR Dataset/train/X_train.txt") ||
   !file.exists("./UCI HAR Dataset/train/y_train.txt")){
  print("The data directory is corrupt. Reloading, please wait....")
  unlink("./UCI HAR Dataset")
}
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","AccelerometerData.zip", method =  "curl")
  unzip("AccelerometerData.zip")
 }

```

**STEP 2**: Moving raw data into independent datasets for further combining:

```{r}
features <- read.table("C:/RWorking/DataCleaning/UCI HAR Dataset/features.txt", col.names = c("MeasurementNumber", "MeasurementTitle"))
activity_labels <- read.table("C:/RWorking/DataCleaning/UCI HAR Dataset/activity_labels.txt", col.names = c("ActivityNumber", "ActivityName"))
subject_test <- read.table("C:/RWorking/DataCleaning/UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
subject_train <- read.table("C:/RWorking/DataCleaning/UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
x_test <- read.table("C:/RWorking/DataCleaning/UCI HAR Dataset/test/X_test.txt", col.names = features$MeasurementTitle)
y_test <- read.table("C:/RWorking/DataCleaning/UCI HAR Dataset/test/y_test.txt", col.names = "Label")
x_train <- read.table("C:/RWorking/DataCleaning/UCI HAR Dataset/train/X_train.txt", col.names = features$MeasurementTitle)
y_train <- read.table("C:/RWorking/DataCleaning/UCI HAR Dataset/train/y_train.txt", col.names = "Label")

```

**STEP 3**: merging train and test sets and adding columns of Subjects and Labels on the left (as the original data numbers at this stage):

```{r}
TotalMeasurementData <- rbind(x_train,x_test)
TotalMeasurementLabels <- rbind(y_train,y_test)
TotalSubjectList <- rbind(subject_train,subject_test)
TotalRawDataSet <- cbind(TotalSubjectList,TotalMeasurementLabels,TotalMeasurementData)

```

**STEP 4**:  Filtering header values to the ones containing "std" and "mean" and replacing numbers with values in the *Label* column using the data frame *activity_label* created at **STEP 2**

```{r}
TextToMatch <- c("std","mean")
MeanStdColumns <- unique(grep(paste(TextToMatch, collapse = "|"), features$MeasurementTitle))
MeanStdColumnsFinal <- MeanStdColumns + 2
MeanStdRawDataSubset <- TotalRawDataSet[,c(1,2, MeanStdColumnsFinal)]

#Replacing Activity Number with Activity Name in the Label column:
MeanStdRawDataSubset$Label <- activity_labels[MeanStdRawDataSubset$Label,2]

```

**STEP 5**: Replacing column names with more descriptive ones and creating *MeanStdTidyDataSet*:
```{r}
MeanStdTidyDataSet <- MeanStdRawDataSubset
ShortKey <- c("Acc","Gyro","BodyBody","Mag","tBody","tGravity","fBody","mean()","std()","freq()","angle","gravity","Freq.","jerk")
ReplaceKey <- c("Accelerometer","Gyroscope","Body","Magnitude","TimeBody","TimeGravity","FrequencyBody","MeanValue","StandardDeviation","Frequency","Angle","Gravity","Frequency","Jerk")

for (i in 1:length(ShortKey)){
  names(MeanStdTidyDataSet) <- gsub(ShortKey[i],ReplaceKey[i],names(MeanStdTidyDataSet)) 
}
```

**STEP 6**:  Generating the summary set:
```{r}
GroupedByActivitySet <- group_by(MeanStdTidyDataSet, Subject, Label)
SetOfMeans <- summarise_all(GroupedByActivitySet, mean)

#Final Text Output
write.table(SetOfMeans, "CleanSetOfMeans.txt", row.name=FALSE)
```

The resulting file, *CleanSetOfMeans.txt* in the working directory, contains mean values for each activity label and for each subject (represented by a number), for each measured variable (see the Code Book file in the same directory)
