# K-means clustering for area/sub-area scores for NASEM framework
# Torbet McNeil
# tmcneil@arizona.edu
# 2022-11-01

#########################################################################
# Using k-means clustering, where x-axis is a specific area/sub-area and y-axis is a 
# specific area/sub-area in the NASEM framework
# Using code from this website: https://bookdown.org/tpinto_home/Unsupervised-learning/k-means-clustering.html

install.packages("factoextra")
library("factoextra")
install.packages("cluster")
library("cluster")

# read the dataset
programs.scores <- read.csv(file = "scores-nasem.csv")

# Investigate data 
head(programs.scores)

# select a subset of the variables
ethics.domain <- programs.scores[,c("NASEM.Ethics.01", "NASEM.Domain.01")]

# Drop NA's
# Not necessary for this dataset
# programs.scores <- na.omit(programs.scores)

# compute the number of chosen clusters 
km <- kmeans(ethics.domain, centers = 3)
km

# plot the results of the clusters in a scatter plot formed by the two variables
fviz_cluster(km, data = ethics.domain, label=NA)+theme_bw()



#parts of code from An Introduction to Statistical Learning book that I am not using now
#set.seed (4)
#km.out <- kmeans (x, 3, centers = 3)
#kmeans()
#par (mfrow = c(1, 2))
#plot (x, col = (km.out$cluster + 1),
#main = "K- Means Clustering Results with K = 2", xlab = "Program", ylab = "Score", pch = 20, cex = 2)
