# Load the Boston dataset
data("Boston", package = "MASS")

library(scales)
?Boston
head(Boston)
summary(Boston)


##############################################################
# Standardize the dataset
boston_standardized <- as.data.frame(scale(Boston))
summary(boston_standardized)

# Calculate the correlation matrix
cor_matrix <- cor(boston_standardized)

# Plot the correlation matrix
library(corrplot)
corrplot(cor_matrix, method = "color", addCoef.col = "black")

# Pairplots for selected variables
selected_vars <- c("rm", "medv", "age", "dis", "lstat")
pairs(boston_standardized[, selected_vars], main = "Pairplots of choosen variables")

# medv distribution
hist(Boston$medv, xlab = "medv", ylab = "Frequency", col = "Dark green")

# 3D scatter plot for medv, lstat and rm
scatterplot3d(boston_standardized$medv, 
              boston_standardized$lstat, 
              boston_standardized$rm,
              main = "3D Scatterplot of medv, lstat, and rm",
              xlab = "medv", 
              ylab = "lstat", 
              zlab = "rm",
              angle = 145,         # Rotate the plot
              pch = 16,           # Change point type to filled circles
              type = "h",         # Draw vertical lines from points to the xy-plane
              highlight.3d = TRUE, # Highlight points in 3D
)

##############################################################

# Models implementation:
library(caret)
set.seed(123)
# Create a training index based on 80 % of the data using only the target variable (medv)
TrainingIndex <- createDataPartition(boston_standardized$medv, p = 0.8, list = FALSE)

# Split the boston_standardized dataset into the training set (80 %) and the testing set (20 %)
TrainingSet <- boston_standardized[TrainingIndex, ]  # 80 % of data for training
TestingSet <- boston_standardized[-TrainingIndex, ]  # Remaining 20 % of data for testing

# Linear regression model

Model_linr <- train(medv ~., data = TrainingSet,
                    method = "lm",
                    trControl = trainControl(method = "none"),
                    tuneGrid = expand.grid(intercept = FALSE)
                    )

Model_linr.cv <- train(medv ~., data = TrainingSet,
                       method = "lm",
                       trControl = trainControl(method = "cv", number = 10), # 10-fold cross-validation
                       tuneGrid = expand.grid(intercept = FALSE)
                       )

# Applying the model:

Model.training <- predict(Model_linr, TrainingSet)
Model.testing <- predict(Model_linr, TestingSet)
Model.training.cv <- predict(Model_linr.cv, TrainingSet)

# RMSE and R2 perfomances:

RMSE_perfomance_train <- RMSE(Model.training, TrainingSet$medv)
R_square_train <- cor(Model.training, TrainingSet$medv)^2

RMSE_perfomance_test <- RMSE(Model.testing, TestingSet$medv)
R_square_test <- cor(Model.testing, TestingSet$medv)^2

# Test and split data perfomances
print(RMSE_perfomance_train)
print(RMSE_perfomance_test)
print(R_square_train)
print(R_square_test)

# CV perfomances
RMSE_perfomance_train_cv <- RMSE(Model.training.cv, TrainingSet$medv)
R_square_train_cv <- cor(Model.training.cv, TrainingSet$medv)^2


print(RMSE_perfomance_train_cv)
print(R_square_train_cv)

# Principal Component Regression:

# Load necessary libraries
set.seed(123)
library(pls)

# PCR model without cross-validation
Model_pcr <- pcr(medv ~ ., data = TrainingSet, validation = "none")

# PCR model with cross-validation
Model_pcr.cv <- pcr(medv ~ ., data = TrainingSet, validation = "CV", segments = 10)

# Checking optimal number of ncomp
summary(Model_pcr.cv)

# Applying the model
Model.pcr.training <- predict(Model_pcr, TrainingSet, ncomp = 5) # Adjust ncomp as needed
Model.pcr.testing <- predict(Model_pcr, TestingSet, ncomp = 5) # Adjust ncomp as needed
Model.pcr.training.cv <- predict(Model_pcr.cv, TrainingSet, ncomp = 5) # Adjust ncomp as needed

# Convert predictions to a numeric vector
Model.pcr.training <- as.numeric(Model.pcr.training)
Model.pcr.testing <- as.numeric(Model.pcr.testing)
Model.pcr.training.cv <- as.numeric(Model.pcr.training.cv)

# RMSE and R2 performances for PCR without CV
RMSE_pcr_training <- RMSE(Model.pcr.training, TrainingSet$medv)
R2_pcr_training <- cor(Model.pcr.training, TrainingSet$medv)^2
RMSE_pcr_testing <- RMSE(Model.pcr.testing, TestingSet$medv)
R2_pcr_testing <- cor(Model.pcr.testing, TestingSet$medv)^2

print(RMSE_pcr_training)
print(R2_pcr_training)
print(RMSE_pcr_testing)
print(R2_pcr_testing)

# RMSE and R2 performances for PCR with CV
RMSE_pcr_training_cv <- RMSE(Model.pcr.training.cv, TrainingSet$medv)
R2_pcr_training_cv <- cor(Model.pcr.training.cv, TrainingSet$medv)^2

print(RMSE_pcr_training_cv)
print(R2_pcr_training_cv)
