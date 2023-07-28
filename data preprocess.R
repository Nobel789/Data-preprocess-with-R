df1=read.csv("/Users/myyntiimac/Desktop/Churn_Modelling.csv")
View(df1)

mean(df1[,2])
mean(df1[,1])

total_missing =sum(is.na(df1))
total_missing
#encoding catagorical variable
#lebel encoding
df1$Geography = as.integer(factor(df1$Geography))
#Binary encoding Gender
df1$Gender = ifelse(df1$Gender == "Male", 0, 1)
#deleting column
columns_to_delete <- c("RowNumber", "Surname")
df1[, columns_to_delete] <- NULL
#split the data
# Assuming 'df' is your dataframe and you want to split it into 70% training and 30% test set
set.seed(123)  # For reproducibility

# Generate random indices for the train and test sets
train_indices <- sample(seq_len(nrow(df1)), size = 0.7 * nrow(df1), replace = FALSE)

# Create the training set
train_set <- df1[train_indices, ]

# Create the test set (excluding the rows in the training set)
test_set <- df1[-train_indices, ]
#Find all column name
column_names <- names(df1)
column_names 

# Feature scale the data
columns_to_scale <- c("CustomerId","CreditScore", "Age","Balance","EstimatedSalary")
train_set[, columns_to_scale] <- scale(train_set[, columns_to_scale])
#scale test set
columns_to_scale <- c("CustomerId","CreditScore", "Age","Balance","EstimatedSalary")
test_set[, columns_to_scale] <- scale(test_set[, columns_to_scale])

