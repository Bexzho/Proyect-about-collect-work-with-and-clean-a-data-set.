# Parte número 1
## Merges the training and the test sets to create one data set.

# Leer test data

testx <- read.table("UCI HAR Dataset/test/X_test.txt")
testy <- read.table("UCI HAR Dataset/test/y_test.txt") 
testsubject <- read.table("UCI HAR Dataset/test/subject_test.txt")

#Leer trainig data

trainx <- read.table("UCI HAR Dataset/train/X_train.txt")
trainy <- read.table("UCI HAR Dataset/train/y_train.txt")
trainsubject <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Unir todos los data sets

Xtotal <- rbind(testx, trainx)
Ytotal <- rbind(testy, trainy)
subjecttotal <- rbind(testsubject, trainsubject) 


# Parte 2
## Extracts only the measurements on the mean and standard deviation for each measurement.

mean_std_Xtotal <- Xtotal[,grep("-(mean|std)\\(\\)", read.table("UCI HAR Dataset/features.txt")[ ,2])]

names(mean_std_Xtotal) <- read.table("UCI HAR Dataset/features.txt")[grep("-(mean|std)\\(\\)", read.table("UCI HAR Dataset/features.txt")[ ,2]), 2]

view(mean_std_Xtotal)

# Parte 3
## Uses descriptive activity names to name the activities in the data set.


Ytotal[ ,1] <- read.table("UCI HAR Dataset/activity_labels.txt")[Ytotal[ ,1], 2]

names(Ytotal) <- "namesactivity"

view(Ytotal)


# Parte 4
## Appropriately labels the data set with descriptive variable names

names(subjecttotal) <- "subjects"

# Unir todos los datasets
datasetultimo <- cbind(mean_std_Xtotal, Ytotal, subjecttotal)


# Poner nombres a las variables, que sean descriptivos.
names(datasetultimo) <- gsub('Freq\\.',"Frequency.",names(datasetultimo))
names(datasetultimo) <- gsub('Freq$',"Frequency",names(datasetultimo))
names(datasetultimo) <- make.names(names(datasetultimo))
names(datasetultimo) <- gsub('Acc',"Acceleration",names(datasetultimo))
names(datasetultimo) <- gsub('GyroJerk',"AngularAcceleration",names(datasetultimo))
names(datasetultimo) <- gsub('Gyro',"AngularSpeed",names(datasetultimo))
names(datasetultimo) <- gsub('Mag',"Magnitude",names(datasetultimo))
names(datasetultimo) <- gsub('^t',"TimeDomain.",names(datasetultimo))
names(datasetultimo) <- gsub('^f',"FrequencyDomain.",names(datasetultimo))
names(datasetultimo) <- gsub('\\.mean',".Mean",names(datasetultimo))
names(datasetultimo) <- gsub('\\.std',".StandardDeviation",names(datasetultimo))


view(datasetultimo)

# Parte 5
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

#Observamos todos los nombres de las variables
names(datasetultimo)

# Creamos el nuevo dataset

Nuevodataframe <- aggregate(datasetultimo, list(subjects = datasetultimo$subjects, 
                                                namesactivity = datasetultimo$namesactivity), mean)

Nuevodataframe <- Nuevodataframe[,c(-69,-70)]

# Se ordena el dataframe de acuerdo a los subjects y namesactivity
Nuevodataframe <- Nuevodataframe[order(Nuevodataframe$subjects, Nuevodataframe$namesactivity), ]

# Pasamos la data a un archivo tipo texto.
write.table(Nuevodataframe, file = "goodandtidydata.txt",row.name=FALSE)















