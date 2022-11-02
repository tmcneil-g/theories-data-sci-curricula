# K-means clustering for area/sub-area scores for NASEM framework
# Torbet McNeil
# tmcneil@arizona.edu
# 2022-11-01

#########################################################################
# Using k-means clustering, where x-axis is the program and y-axis is a 
#specific area/sub-area in the NASEM framework

set.seed (4)
km.out <- kmeans (x, 3, nstart =    )
kmeans()
par (mfrow = c(1, 2))
plot (x, col = (km.out$cluster + 1),
main = "K- Means Clustering Results with K = 2", xlab = "Program", ylab = "Score", pch = 20, cex = 2)