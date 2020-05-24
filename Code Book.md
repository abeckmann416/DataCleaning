---
title: "Code Book"
author: "Alex M. Beckmann"
date: "24/05/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

This document describes data transformation from the original set presented in the folder **UCI HAR Dataset** to the summary file **CleanSetOfMeans.txt** of mean values of mean and standard deviation measurements of the initial data set performed by the script *run_analysis.R* in this folder.

The initial dara set is comprised of two subsets, one is for training and the other is for testing the algorythm. The data of each set is organzied into 2 subfolders, **test** and **train**, each of which contains a list of subjects denoted by numbers per each measurement, **subject_test.txt** (and **subject_train.txt**, respectivel), the list of activity codes per each measurement **y_test.txt** (and **y_train.txt**, respectively) and the list of measurements themselves **X_test.txt** and **X_train.txt**. In addition, these subfolders contain subfolders **Initial Signals** from which the above-mentioned summaries are derived.

The core directory **UCI HAR Dataset** also contains the file **activity_labels.txt**, containing translations for the 6 different types ofinputs of the files **y_test.txt** and **y_train.txt**, the file **features.txt** with 561 variables measured in the experiment and in the order provided in the files **X_test.txt** and **X_train.txt**

The script *run_analysis.R* checks for the presence of the initial data folder  **UCI HAR Dataset** in the working directory, combines the test and train files of measurements (**X**), activity codes (**y**) and **subjects** and assembles them into one data set
\br
Then only the measurements of *9*mean values** and **standard deviations** are extracted from this data set, which reduced the number of measurement variables to 79 and the total number of columns to 81.

The column titles are then modified to reflect clarify the actual measurements they describe

Finally, mean values are computed for each subject and for each activity.

*Please refer to the README file in this folder for the code snippets and explanation of what they do.
*the columns 3-81 represent mean values for each subject/activity type for the variables described in the titles:* 


 [1] "Subject"  -a number denoting a subject                                                      
 [2] "Label" - an activity type: LAYING. SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS or WALKING_UPSTAIRS  
 [3] "TimeBodyAccelerometer.MeanValue...X"                            
 [4] "TimeBodyAccelerometer.MeanValue...Y"                            
 [5] "TimeBodyAccelerometer.MeanValue...Z"                            
 [6] "TimeBodyAccelerometer.StandardDeviation...X"                    
 [7] "TimeBodyAccelerometer.StandardDeviation...Y"                    
 [8] "TimeBodyAccelerometer.StandardDeviation...Z"                    
 [9] "TimeGravityAccelerometer.MeanValue...X"                         
[10] "TimeGravityAccelerometer.MeanValue...Y"                         
[11] "TimeGravityAccelerometer.MeanValue...Z"                         
[12] "TimeGravityAccelerometer.StandardDeviation...X"                 
[13] "TimeGravityAccelerometer.StandardDeviation...Y"                 
[14] "TimeGravityAccelerometer.StandardDeviation...Z"                 
[15] "TimeBodyAccelerometerJerk.MeanValue...X"                        
[16] "TimeBodyAccelerometerJerk.MeanValue...Y"                        
[17] "TimeBodyAccelerometerJerk.MeanValue...Z"                        
[18] "TimeBodyAccelerometerJerk.StandardDeviation...X"                
[19] "TimeBodyAccelerometerJerk.StandardDeviation...Y"                
[20] "TimeBodyAccelerometerJerk.StandardDeviation...Z"                
[21] "TimeBodyGyroscope.MeanValue...X"                                
[22] "TimeBodyGyroscope.MeanValue...Y"                                
[23] "TimeBodyGyroscope.MeanValue...Z"                                
[24] "TimeBodyGyroscope.StandardDeviation...X"                        
[25] "TimeBodyGyroscope.StandardDeviation...Y"                        
[26] "TimeBodyGyroscope.StandardDeviation...Z"                        
[27] "TimeBodyGyroscopeJerk.MeanValue...X"                            
[28] "TimeBodyGyroscopeJerk.MeanValue...Y"                            
[29] "TimeBodyGyroscopeJerk.MeanValue...Z"                            
[30] "TimeBodyGyroscopeJerk.StandardDeviation...X"                    
[31] "TimeBodyGyroscopeJerk.StandardDeviation...Y"                    
[32] "TimeBodyGyroscopeJerk.StandardDeviation...Z"                    
[33] "TimeBodyAccelerometerMagnitude.MeanValue.."                     
[34] "TimeBodyAccelerometerMagnitude.StandardDeviation.."             
[35] "TimeGravityAccelerometerMagnitude.MeanValue.."                  
[36] "TimeGravityAccelerometerMagnitude.StandardDeviation.."          
[37] "TimeBodyAccelerometerJerkMagnitude.MeanValue.."                 
[38] "TimeBodyAccelerometerJerkMagnitude.StandardDeviation.."         
[39] "TimeBodyGyroscopeMagnitude.MeanValue.."                         
[40] "TimeBodyGyroscopeMagnitude.StandardDeviation.."                 
[41] "TimeBodyGyroscopeJerkMagnitude.MeanValue.."                     
[42] "TimeBodyGyroscopeJerkMagnitude.StandardDeviation.."             
[43] "FrequencyencyBodyAccelerometer.MeanValue...X"                   
[44] "FrequencyencyBodyAccelerometer.MeanValue...Y"                   
[45] "FrequencyencyBodyAccelerometer.MeanValue...Z"                   
[46] "FrequencyencyBodyAccelerometer.StandardDeviation...X"           
[47] "FrequencyencyBodyAccelerometer.StandardDeviation...Y"           
[48] "FrequencyencyBodyAccelerometer.StandardDeviation...Z"           
[49] "FrequencyencyBodyAccelerometer.MeanValueFrequency..X"           
[50] "FrequencyencyBodyAccelerometer.MeanValueFrequency..Y"           
[51] "FrequencyencyBodyAccelerometer.MeanValueFrequency..Z"           
[52] "FrequencyencyBodyAccelerometerJerk.MeanValue...X"               
[53] "FrequencyencyBodyAccelerometerJerk.MeanValue...Y"               
[54] "FrequencyencyBodyAccelerometerJerk.MeanValue...Z"               
[55] "FrequencyencyBodyAccelerometerJerk.StandardDeviation...X"       
[56] "FrequencyencyBodyAccelerometerJerk.StandardDeviation...Y"       
[57] "FrequencyencyBodyAccelerometerJerk.StandardDeviation...Z"       
[58] "FrequencyencyBodyAccelerometerJerk.MeanValueFrequency..X"       
[59] "FrequencyencyBodyAccelerometerJerk.MeanValueFrequency..Y"       
[60] "FrequencyencyBodyAccelerometerJerk.MeanValueFrequency..Z"       
[61] "FrequencyencyBodyGyroscope.MeanValue...X"                       
[62] "FrequencyencyBodyGyroscope.MeanValue...Y"                       
[63] "FrequencyencyBodyGyroscope.MeanValue...Z"                       
[64] "FrequencyencyBodyGyroscope.StandardDeviation...X"               
[65] "FrequencyencyBodyGyroscope.StandardDeviation...Y"               
[66] "FrequencyencyBodyGyroscope.StandardDeviation...Z"               
[67] "FrequencyencyBodyGyroscope.MeanValueFrequency..X"               
[68] "FrequencyencyBodyGyroscope.MeanValueFrequency..Y"               
[69] "FrequencyencyBodyGyroscope.MeanValueFrequency..Z"               
[70] "FrequencyencyBodyAccelerometerMagnitude.MeanValue.."            
[71] "FrequencyencyBodyAccelerometerMagnitude.StandardDeviation.."    
[72] "FrequencyencyBodyAccelerometerMagnitude.MeanValueFrequency."    
[73] "FrequencyencyBodyAccelerometerJerkMagnitude.MeanValue.."        
[74] "FrequencyencyBodyAccelerometerJerkMagnitude.StandardDeviation.."

[75] "FrequencyencyBodyAccelerometerJerkMagnitude.MeanValueFrequency."

[76] "FrequencyencyBodyGyroscopeMagnitude.MeanValue.."                
[77] "FrequencyencyBodyGyroscopeMagnitude.StandardDeviation.."        
[78] "FrequencyencyBodyGyroscopeMagnitude.MeanValueFrequency."        
[79] "FrequencyencyBodyGyroscopeJerkMagnitude.MeanValue.."            
[80] "FrequencyencyBodyGyroscopeJerkMagnitude.StandardDeviation.."    
[81] "FrequencyencyBodyGyroscopeJerkMagnitude.MeanValueFrequency."

The results of these measurements are presented in the space-separated file **CleanSetOfMeans.txt**
 



