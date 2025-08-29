# Install packages
install.packages("caret")
install.packages("rpart")
install.packages("randomForest")


# Load libraries
library(tidyverse)   # for data manipulation
library(caret)       # for ML pipeline
library(rpart)       # for decision tree (optional)
library(randomForest) # for Random Forest (optional, better performance)


# Load the datasets
train <- read.csv("train.csv")
test  <- read.csv("test.csv")
gender_submission <- read.csv("gender_submission.csv")


# Quick look
str(train)
summary(train)


# Checking missing/empty cells
colSums(is.na(train))
sapply(train, function(x) sum(x == ""))

colSums(is.na(test))
sapply(test, function(x) sum(x == ""))



# Handle missing values in Age by replacing with median
train$Age[is.na(train$Age)] <- median(train$Age, na.rm = TRUE)
test$Age[is.na(test$Age)]   <- median(train$Age, na.rm = TRUE)


# Handle missing Embarked (only a couple missing)
train$Embarked[train$Embarked == ""] <- "S"


# Handle missing Fare in test
test$Fare[is.na(test$Fare)] <- median(train$Fare, na.rm = TRUE)


# Convert categorical variables
train$Sex <- as.factor(train$Sex)
test$Sex  <- as.factor(test$Sex)


train$Embarked <- as.factor(train$Embarked)
test$Embarked  <- as.factor(test$Embarked)


# Logistic Regression model
model_logit <- glm(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, 
                   data = train, family = binomial)

summary(model_logit)


# Make predictions
test$Survived <- predict(model_logit, newdata = test, type = "response")
test$Survived <- ifelse(test$Survived > 0.5, 1, 0)


# Create submission file
submission <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
write.csv(submission, file = "my_submission.csv", row.names = FALSE)
