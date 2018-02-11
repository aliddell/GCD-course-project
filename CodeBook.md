## Code Book

The output file `summary.txt` contains the following variables:

 * `Subject.ID`
 * `Activity.Name`
 * `Average.Mean.Body.Accelerometer.X`
 * `Average.Mean.Body.Accelerometer.Y`
 * `Average.Mean.Body.Accelerometer.Z`
 * `Average.StdDev.Body.Accelerometer.X`
 * `Average.StdDev.Body.Accelerometer.Y`
 * `Average.StdDev.Body.Accelerometer.Z`
 * `Average.Mean.Gravity.Accelerometer.X`
 * `Average.Mean.Gravity.Accelerometer.Y`
 * `Average.Mean.Gravity.Accelerometer.Z`
 * `Average.StdDev.Gravity.Accelerometer.X`
 * `Average.StdDev.Gravity.Accelerometer.Y`
 * `Average.StdDev.Gravity.Accelerometer.Z`
 * `Average.Mean.Body.Accelerometer.Jerk.X`
 * `Average.Mean.Body.Accelerometer.Jerk.Y`
 * `Average.Mean.Body.Accelerometer.Jerk.Z`
 * `Average.StdDev.Body.Accelerometer.Jerk.X`
 * `Average.StdDev.Body.Accelerometer.Jerk.Y`
 * `Average.StdDev.Body.Accelerometer.Jerk.Z`
 * `Average.Mean.Body.Gyroscope.X`
 * `Average.Mean.Body.Gyroscope.Y`
 * `Average.Mean.Body.Gyroscope.Z`
 * `Average.StdDev.Body.Gyroscope.X`
 * `Average.StdDev.Body.Gyroscope.Y`
 * `Average.StdDev.Body.Gyroscope.Z`
 * `Average.Mean.Body.Gyroscope.Jerk.X`
 * `Average.Mean.Body.Gyroscope.Jerk.Y`
 * `Average.Mean.Body.Gyroscope.Jerk.Z`
 * `Average.StdDev.Body.Gyroscope.Jerk.X`
 * `Average.StdDev.Body.Gyroscope.Jerk.Y`
 * `Average.StdDev.Body.Gyroscope.Jerk.Z`
 * `Average.Mean.Body.Accelerometer.Magnitude`
 * `Average.StdDev.Body.Accelerometer.Magnitude`
 * `Average.Mean.Gravity.Accelerometer.Magnitude`
 * `Average.StdDev.Gravity.Accelerometer.Magnitude`
 * `Average.Mean.Body.Accelerometer.Jerk.Magnitude`
 * `Average.StdDev.Body.Accelerometer.Jerk.Magnitude`
 * `Average.Mean.Body.Gyroscope.Magnitude`
 * `Average.StdDev.Body.Gyroscope.Magnitude`
 * `Average.Mean.Body.Gyroscope.Jerk.Magnitude`
 * `Average.StdDev.Body.Gyroscope.Jerk.Magnitude`
 * `Average.Mean.Body.Accelerometer.X.Freq`
 * `Average.Mean.Body.Accelerometer.Y.Freq`
 * `Average.Mean.Body.Accelerometer.Z.Freq`
 * `Average.StdDev.Body.Accelerometer.X.Freq`
 * `Average.StdDev.Body.Accelerometer.Y.Freq`
 * `Average.StdDev.Body.Accelerometer.Z.Freq`
 * `Average.Mean.Body.Accelerometer.Jerk.X.Freq`
 * `Average.Mean.Body.Accelerometer.Jerk.Y.Freq`
 * `Average.Mean.Body.Accelerometer.Jerk.Z.Freq`
 * `Average.StdDev.Body.Accelerometer.Jerk.X.Freq`
 * `Average.StdDev.Body.Accelerometer.Jerk.Y.Freq`
 * `Average.StdDev.Body.Accelerometer.Jerk.Z.Freq`
 * `Average.Mean.Body.Gyroscope.X.Freq`
 * `Average.Mean.Body.Gyroscope.Y.Freq`
 * `Average.Mean.Body.Gyroscope.Z.Freq`
 * `Average.StdDev.Body.Gyroscope.X.Freq`
 * `Average.StdDev.Body.Gyroscope.Y.Freq`
 * `Average.StdDev.Body.Gyroscope.Z.Freq`
 * `Average.Mean.Body.Accelerometer.Magnitude.Freq`
 * `Average.StdDev.Body.Accelerometer.Magnitude.Freq`
 * `Average.Mean.Body.Accelerometer.Jerk.Magnitude.Freq`
 * `Average.StdDev.Body.Accelerometer.Jerk.Magnitude.Freq`
 * `Average.Mean.Body.Gyroscope.Magnitude.Freq`
 * `Average.StdDev.Body.Gyroscope.Magnitude.Freq`
 * `Average.Mean.Body.Gyroscope.Jerk.Magnitude.Freq`
 * `Average.StdDev.Body.Gyroscope.Jerk.Magnitude.Freq`

`Subject.ID` and `Activity.Name` describe the subject and activity, respectively.
Subjects take integer values between 1 and 30, while possible activities are "Laying", "Sitting", "Standing", "Walking", "Walking Downstairs", and "Walking Upstairs".

All other values are averages (means) of mean and standard deviation values of measurements or values computed from those measurements.
Averages computed from means are labeled `Average.Mean`, while averages computed from standard deviations are labeled `Average.StdDev`.
Values labeled `Accelerometer` were computed from measurements taken from an accelerometer, while values labeld `Gyroscope` were computed from measurements taken from a gyroscope.
(All measurements were taken from instruments embedded on Samsung Galaxy SIIs.)
Signals were separated into body and gravity signals; these measurements are reflected in fature names containing `Body` and `Gravity`, respectively.
As in the original data set, `.XYZ` is used to denote 3-axial signals in the X, Y and Z directions.
Feature names ending in `Freq` are frequency-domain signals computed using a FFT, while feature names not containing `Freq` are time-domain signals.
Feature names containing `Jerk` are computations of [jerk](https://en.wikipedia.org/wiki/Jerk_%28physics%29), while the others are measurements of acceleration.
Finally, the features labeled `Magnitude` are 2-norm magnitudes of measurements computed from X, Y, and Z.