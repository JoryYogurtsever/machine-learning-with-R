# K-Means Clustering

# Importing the dataset
dataset = read.csv('mall.csv')
X = dataset[4:5]

# Using the elbow method to find the optimal number of clusters
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(X, i)$withinss)
plot(x = 1:10,
     y = wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')
# for (i in 1:10) wcss[i] = sum(kmeans(X, i)$withinss)
# split(1:10, wcss, type='b',main = paste('Clusers of clients'), xlab="Number of clusters", ylab="WCSS")

#Applying k-means to the mall dataset
set.seed(29)
kmeans = kmeans(X, 5, iter.max = 300, nstart = 10)
y_kmeans = kmeans$cluster

#Visualizing the clusters
#install.packages('cluster')
library(cluster)
clusplot(X,
        y_kmeans,
        shade=TRUE,
        color=TRUE,
        labels = 2,
        plotchar = FALSE,
        span = TRUE,
        main = paste('Clusers of Clients'),
        xlab = 'Annual Income',
        ylab = 'Spending Score')