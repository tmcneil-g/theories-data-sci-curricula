# K-means clustering for area/sub-area scores for NASEM framework
# Torbet McNeil
# tmcneil@arizona.edu
# 2022-11-01

#########################################################################
# Using k-means clustering, where x-axis is the institution and y-axis is a 
#specific area/sub-area in the NASEM framework

install.packages(factoextra)
library(factoextra)

#read the dataset
programs.scores <- read.csv(file = "scores-nasem.csv")

# Merge the institutions with units to get short names in units_df
# Will do this later

# Merge units_df with programs
# Will do this later

# Re-number rows
# Will do this later
# rownames(units_df) <- NULL

#select a subset of the variables
programs.domain <- programs.scores[,c("Institution", "NASEM.Domain.01")]

#compute the number of chosen clusters 
km <- kmeans(programs.domain, centers = 3)
km

# plot the results of the clusters in a scatter plot formed by the two variables
fviz_cluster(km, data = programs.domain, label=NA)+theme_bw()



#parts of code from An Introduction to Statistical Learning book that I am not using now
#set.seed (4)
#km.out <- kmeans (x, 3, centers = 3)
#kmeans()
#par (mfrow = c(1, 2))
#plot (x, col = (km.out$cluster + 1),
#main = "K- Means Clustering Results with K = 2", xlab = "Program", ylab = "Score", pch = 20, cex = 2)
