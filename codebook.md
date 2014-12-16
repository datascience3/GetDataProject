==================================================================
Codebook
========

The features selected for this database originate from the raw inertial
signal readings collected from the embedded accelerometer and gyroscope.
These time domain signals were captured at a constant rate of 50 Hz in
time windows of 2.56 seconds (128 readings/window). The raw data can be
found in the text files located within the directories 'UCI HAR Dataset
train/Inertial Signals' and 'UCI HAR Dataset/test/Inertial Signals'.

The acceleration signals are measured in standard gravity units and split
apart into body and gravity components. The gyroscope readings give the
angular velocity in radians per second.

The body acceleration and angular velocity signals were used to subsequently
derive jerk signals. The magnitudes of these signals were then calculated
using the Euclidean norm. Furthermore, a fast Fourier transform was applied
to some of these signals producing frequency domain signals.

Several different variables were subsequently estimated from these signals.
We focus our attention only on those involving the mean or standard deviation.

1. Mean: Mean value
2. Std: Standard deviation
3. MeanFreq: Weighted average of the frequency components to obtain a mean
   frequency

Finally, additional vectors were obtained by averaging the 128 signal readings
in a signal window sample.

1. GravityMean: mean direction of gravitational force.
2. TimeBodyAccelMean: mean direction of time-domain body linear acceleration
   signal.
3. TimeBodyAccelJerkMean: mean direction of time-domain body linear acceleration
   jerk signal.
4. TimeBodyGyroMean: mean direction of time-domain body angular acceleration
   signal.
5. TimeBodyGyroJerkMean: mean direction of time-domain body angular acceleration
   jerk signal.


All features are normalized and bounded within [-1,1].

---------------------------------------------------------------------------
Variables in the tidy dataset:
==============================

The column names in the tidy dataset can be summarized in the table below.
Each column name can be obtained by first fixing a row in the table below,
and then by concatenating an entry from each column in that row.



| Domain | Body/Gravity | TYPE| Variable | DIRECTION/Magnitude|
| :------ | :------: | :------ | :------: | :------: |
|Time |Gravity |Accel |Mean, Std |X, Y, Z, Mag|
|Time, Freq |Body |Accel, AccelJerk, Gyro |Mean, Std |X, Y, Z, Mag|
|Freq |Body |Accel, AccelJerk, Gyro |MeanFreq |X, Y, Z, Mag|
|Time |Body |GyroJerk |Mean, Std |X, Y, Z, Mag|
|Freq |Body |GyroJerk |Mean, Std, MeanFreq |Mag|

'XYZ' is used to denote signals in the X, Y and Z directions.

Furthermore, the angles between GravityMean and the three coordinate directions
X,Y,Z are recorded in the tidy dataset as well as the angles between GravityMean
and each of TimeBody(TYPE)Mean. These angles are labelled by the columns
having names prefixed by 'AngleBetween'.

Finally, the last two columns are 'Activity' and  'Subject', giving the
activity performed by the specific subject.

--------------------------------------------------------------------------

List of column names
====================

1. TimeBodyAccelMeanX
2. TimeBodyAccelMeanY
3. TimeBodyAccelMeanZ
4. TimeBodyAccelStdX
5. TimeBodyAccelStdY
6. TimeBodyAccelStdZ
7. TimeGravityAccelMeanX
8. TimeGravityAccelMeanY
9. TimeGravityAccelMeanZ
10. TimeGravityAccelStdX
11. TimeGravityAccelStdY
12. TimeGravityAccelStdZ
13. TimeBodyAccelJerkMeanX
14. TimeBodyAccelJerkMeanY
15. TimeBodyAccelJerkMeanZ
16. TimeBodyAccelJerkStdX
17. TimeBodyAccelJerkStdY
18. TimeBodyAccelJerkStdZ
19. TimeBodyGyroMeanX
20. TimeBodyGyroMeanY
21. TimeBodyGyroMeanZ
22. TimeBodyGyroStdX
23. TimeBodyGyroStdY
24. TimeBodyGyroStdZ
25. TimeBodyGyroJerkMeanX
26. TimeBodyGyroJerkMeanY
27. TimeBodyGyroJerkMeanZ
28. TimeBodyGyroJerkStdX
29. TimeBodyGyroJerkStdY
30. TimeBodyGyroJerkStdZ
31. TimeBodyAccelMagMean
32. TimeBodyAccelMagStd
33. TimeGravityAccelMagMean
34. TimeGravityAccelMagStd
35. TimeBodyAccelJerkMagMean
36. TimeBodyAccelJerkMagStd
37. TimeBodyGyroMagMean
38. TimeBodyGyroMagStd
39. TimeBodyGyroJerkMagMean
40. TimeBodyGyroJerkMagStd
41. FreqBodyAccelMeanX
42. FreqBodyAccelMeanY
43. FreqBodyAccelMeanZ
44. FreqBodyAccelStdX
45. FreqBodyAccelStdY
46. FreqBodyAccelStdZ
47. FreqBodyAccelMeanFreqX
48. FreqBodyAccelMeanFreqY
49. FreqBodyAccelMeanFreqZ
50. FreqBodyAccelJerkMeanX
51. FreqBodyAccelJerkMeanY
52. FreqBodyAccelJerkMeanZ
53. FreqBodyAccelJerkStdX
54. FreqBodyAccelJerkStdY
55. FreqBodyAccelJerkStdZ
56. FreqBodyAccelJerkMeanFreqX
57. FreqBodyAccelJerkMeanFreqY
58. FreqBodyAccelJerkMeanFreqZ
59. FreqBodyGyroMeanX
60. FreqBodyGyroMeanY
61. FreqBodyGyroMeanZ
62. FreqBodyGyroStdX
63. FreqBodyGyroStdY
64. FreqBodyGyroStdZ
65. FreqBodyGyroMeanFreqX
66. FreqBodyGyroMeanFreqY
67. FreqBodyGyroMeanFreqZ
68. FreqBodyAccelMagMean
69. FreqBodyAccelMagStd
70. FreqBodyAccelMagMeanFreq
71. FreqBodyAccelJerkMagMean
72. FreqBodyAccelJerkMagStd
73. FreqBodyAccelJerkMagMeanFreq
74. FreqBodyGyroMagMean
75. FreqBodyGyroMagStd
76. FreqBodyGyroMagMeanFreq
77. FreqBodyGyroJerkMagMean
78. FreqBodyGyroJerkMagStd
79. FreqBodyGyroJerkMagMeanFreq
80. AngleBetweenTimeBodyAccelMeanAndGravityMean
81. AngleBetweenTimeBodyAccelJerkMeanAndGravityMean
82. AngleBetweenTimeBodyGyroMeanAndGravityMean
83. AngleBetweenTimeBodyGyroJerkMeanAndGravityMean
84. AngleBetweenXAndGravityMean
85. AngleBetweenYAndGravityMean
86. AngleBetweenZAndGravityMean
87. Activity
88. Subject






