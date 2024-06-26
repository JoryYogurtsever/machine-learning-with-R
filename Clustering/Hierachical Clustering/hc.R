# Hierarchical Clustering

# Importing the dataset
dataset = read.csv('mall.csv')
X = dataset[4:5]

# Using the dendrogram to find the optimal number of clusters
dendrogram = hclust(dist(X, method = 'euclidean'), method = 'ward.D')
plot(dendrogram,
     main = paste('Dendrogram'),
     xlab = 'Customers',
     ylab = 'SEuclidean Distances')

#Fitting heirarchical clustering to the mall dataset
hc = hclust(dist(X, method = 'euclidean'), method = 'ward.D')
y_hc = cutree(hc, 5)

# Visualising the clusters
library(cluster)
clusplot(X,
        y_hc,
        shade=TRUE,
        color=TRUE,
        labels = 2,
        plotchar = FALSE,
        span = TRUE,
        main = paste('Clusers of Clients'),
        xlab = 'Annual Income',
        ylab = 'Spending Score')