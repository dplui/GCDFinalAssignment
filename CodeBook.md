# Code Book
This dataset is a *modified version* of the original dataset ‘Human Activity Recognition Using Smartphones Data Set’ built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. The original dataset is available at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The original dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data; *this modified dataset has re-merged these two portioned datasets into one dataset.*

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
## Attribute Information:
In this *modified version* of the dataset, each row corresponds to: 
- measurement of one subject who carried out the experiment (“subject”) 
- performing one of the six aforementioned activities (“activity”)

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A vector with mean time and frequency domain variables (i.e. mean of the all experimental observations per subject/activity combination) described in the ‘Feature Selection’ section below.

*For each measured variable, this modified dataset summarises the original experimental data to give the mean reading from each subject/activity combination.*

The features selection section below provides more detail of the variables.

The precise steps taken to transform the original dataset (with the R code used) are described in the readme.md  
## Feature Selection (Variables)
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals timeAcc-XYZ and timeGyro-XYZ. These time domain signals (prefix 'time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAcc-XYZ and timeGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerk-XYZ and timeBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, timeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing freqBodyAcc-XYZ, freqBodyAccJerk-XYZ, freqBodyGyro-XYZ, freqBodyAccJerkMag, freqBodyGyroMag, freqBodyGyroJerkMag. (Note the 'freq' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Features are normalized and bounded within [-1,1]

timeBodyAcc-XYZ

timeGravityAcc-XYZ

timeBodyAccJerk-XYZ

timeBodyGyro-XYZ

timeBodyGyroJerk-XYZ

timeBodyAccMag

timeGravityAccMag

timeBodyAccJerkMag

timeBodyGyroMag

timeBodyGyroJerkMag

freqBodyAcc-XYZ

freqBodyAccJerk-XYZ

freqBodyGyro-XYZ

freqBodyAccMag

freqBodyAccJerkMag

freqBodyGyroMag

freqBodyGyroJerkMag

(NB. Variable names have been modified to assist users of the database according to tidy data principles. Specifically the ‘t’ prefix has been changed to ‘time’ and ‘f’ prefix has been changed to ‘freq’).

The set of variables that were estimated from these signals and included in this modified database are: 

mean(): Mean value

std(): Standard deviation

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

*(NB. Other variables from the original database have been omitted.)*

*In this modified database, each row corresponds to the mean reading from each subject/activity combination (i.e. the mean of all the experimental observations for the mean or std values that were provided in the original dataset).*
