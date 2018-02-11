# you should be in the root data directory
# i.e., containing README.txt, features.txt,
# features_info.txt, activity_labels.txt, and
# the folders `test` and `train`

library(plyr) # join
library(dplyr) # tbl_df, group_by, summarize_all
library(tools) # toTitleCase

# ensure everything is present
filenames <- c('features.txt', 'activity_labels.txt', 'train/subject_train.txt',
               'train/X_train.txt', 'train/y_train.txt', 'test/subject_test.txt',
               'test/X_test.txt', 'test/y_test.txt')
for (filename in filenames) {
        if (!file.exists(filename))
                stop(filename, ' is missing; aborting')
}

# load feature names
all.features <- read.table('features.txt', col.names=c('feature.id', 'feature.name'),
                       row.names=1, stringsAsFactors=F)
# load activity names
activity.labels <- read.table('activity_labels.txt',
                              col.names=c('Activity.ID', 'Activity.Name'), header=F,
                              stringsAsFactors=F)
# convert activity names to title case, replace underscores with spaces
activity.labels$Activity.Name <- toTitleCase(gsub('_', ' ',
                                                tolower(activity.labels$Activity.Name)))
# extract indices of features containing `mean()` or `std()`,
# for mean and standard deviation, respectively
feature.indices <- grep('(mean\\(\\)|std\\(\\))', all.features$feature.name)

## load training data, pull out only interesting features
x.train <- read.table('train/X_train.txt', col.names=all.features$feature.name,
                      sep='')
y.train <- join(read.table('train/y_train.txt', col.names=c('Activity.ID')), activity.labels,
                 by='Activity.ID')
subject.train <- read.table('train/subject_train.txt', col.names='Subject.ID')

# merge collected data, activity names, subject IDs
training.data <- cbind(subject.train, y.train, x.train[,feature.indices])
rm(x.train, y.train, subject.train)

## load test data, pull out only interesting features
x.test <- read.table('test/X_test.txt', col.names=all.features$feature.name,
                     sep='')
y.test <- join(read.table('test/y_test.txt', col.names=c('Activity.ID')), activity.labels,
                by='Activity.ID')
subject.test <- read.table('test/subject_test.txt', col.names='Subject.ID')

# merge collected data, activity names, subject IDs
test.data <- cbind(subject.test, y.test, x.test[,feature.indices])
rm(x.test, y.test, subject.test, feature.indices, all.features, activity.labels)

# merge training and test data
full.data <- tbl_df(rbind(training.data, test.data)) %>% select(-Activity.ID)
rm(training.data, test.data)

## make variable names more descriptive
# replace occurrences of 'BodyBody' with just 'Body'
names(full.data) <- gsub('BodyBody', 'Body', names(full.data))
# separate out Body/Gravity signals in the time domain, drop time label
names(full.data) <- gsub('t(Body|Gravity)', '\\1', names(full.data))
# separate out Body signals in the freq domain, keep freq label
names(full.data) <- gsub('fBody(.+)', 'Body \\1 Freq', names(full.data))
# split up camel-cased words
names(full.data) <- gsub('([a-z])([A-Z])', '\\1 \\2', names(full.data))
# replace '...{X,Y,Z}' with ' {X,Y,Z}'
names(full.data) <- gsub('\\.\\.\\.([XYZ])', ' \\1', names(full.data))
# remove '..' from column names
names(full.data) <- gsub('..', '', names(full.data), fixed=T)
# put 'Mean' out in front where appropriate
names(full.data) <- gsub('(.+)\\.mean(.*)$', 'Mean \\1\\2', names(full.data))
# put 'StdDev out in front where appropriate
names(full.data) <- gsub('(.+)\\.std(.*)$', 'StdDev \\1\\2', names(full.data))
# replace Acc with Accelerometer, Gyro with Gyroscope, Mag with Magnitude
names(full.data) <- gsub('Acc', 'Accelerometer', names(full.data))
names(full.data) <- gsub('Gyro', 'Gyroscope', names(full.data))
names(full.data) <- gsub('Mag', 'Magnitude', names(full.data))
# replace spaces with periods
names(full.data) <- gsub(' ', '.', names(full.data))

## create second, independent tidy data set
# with the average of each variable for each activity and each subject
summary.data <- full.data %>% group_by(Subject.ID, Activity.Name) %>%
        summarize_all(funs(mean))
# rename data columns to prepend 'Average.'
names(summary.data) <- c(names(summary.data[,1:2]),
                         paste('Average', names(summary.data[,3:68]), sep='.'))

# write out summary.data to a file
write.table(summary.data, file="summary.txt", row.names=F)