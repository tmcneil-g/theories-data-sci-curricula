# K-means clustering for data science curricula comparisons
# Torbet McNeil
# tmcneil@arizona.edu
# 2022-11-01

#########################################################################
# Using k-means clustering
# Using code from this website: https://bookdown.org/tpinto_home/Unsupervised-learning/k-means-clustering.html

library("factoextra")
library("cluster")
library("dplyr")

# read the dataset
programs.scores <- read.csv(file = "scores-nasem-1.csv")

# Investigate data 
head(programs.scores)

# select a subset of the variables
# Here, the x-axis and y-axis are specific areas/sub-areas in the NASEM framework
# I chose two variables that scored low: ethics.01, the most general ethics sub-area, and domain
ethics.domain <- programs.scores[,c("NASEM.Ethics.01", "NASEM.Domain.01")]

# compute the number of chosen clusters 
km <- kmeans(ethics.domain, centers = 3)
km

# plot the results of the clusters in a scatter plot formed by the two variables
fviz_cluster(km, data = ethics.domain, label=NA)+theme_bw()

# select a subset of the variables
# Here, the x-axis and y-axis are specific areas/sub-areas in the NASEM framework
# I chose variables that are common in many programs: machine learning and data viz
ML.visual <- programs.scores[,c("NASEM.Modeling.01", "NASEM.Data.description.visualization.01")]

# compute the number of chosen clusters 
km.1 <- kmeans(ML.visual, centers = 3)
km.1

# plot the results of the clusters in a scatter plot formed by the two variables
fviz_cluster(km, data = ML.visual, label=NA)+theme_bw()

# I am conducting exploratory analysis by select other subsets of the variables

# Create table that shows the distinct pairs of points
count(ethics.domain, NASEM.Modeling.01, NASEM.Data.description.visualization.01)

# Investigate variable
ethics.domain

# Look at basic scatterplots of data to see if fancy-dancy k-means clustering is even needed
ggplot(ethics.domain, aes(x=NASEM.Modeling.01, y=NASEM.Data.description.visualization.01)) + 
  geom_point(alpha=0.2) + 
  theme_bw()

ggplot(ethics.domain, aes(x=NASEM.Modeling.01, y=NASEM.Data.description.visualization.01)) + 
  geom_jitter(width = 0.1, height = 0.1, alpha = 0.5) + 
  theme_bw()

# There are four distinct groups in data. K-means clustering does not really appear needed.
# If I see more fuzziness and overlap of points, then k-means clustering may be justified
# Can check other scatterplots to see if I think other pairs of variables will benefit from k-means clustering 

# including all areas/sub-areas in NASEM in cluster analysis
# 
NASEM.all.areas <- programs.scores[,c("NASEM.Math.01", "NASEM.Math.02", "NASEM.Math.03", "NASEM.Math.04", "NASEM.Math.05", "NASEM.Math.06", 
"NASEM.Compute.01", "NASEM.Compute.02", "NASEM.Compute.03", "NASEM.Compute.04", "NASEM.Compute.05", 
"NASEM.Statistics.01", "NASEM.Statistics.02", "NASEM.Statistics.03", "NASEM.Statistics.04", "NASEM.Statistics.05", "NASEM.Statistics.06",
"NASEM.Data.management.01", "NASEM.Data.management.02", "NASEM.Data.management.03", "NASEM.Data.management.04", "NASEM.Data.management.05", "NASEM.Data.management.06", "NASEM.Data.management.07",
"NASEM.Data.description.visualization.01", "NASEM.Data.description.visualization.02", "NASEM.Data.description.visualization.03", 
"NASEM.Modeling.01", "NASEM.Modeling.02", "NASEM.Modeling.03", "NASEM.Modeling.04", "NASEM.Modeling.05", "NASEM.Modeling.06",
"NASEM.Reproducibility.01", "NASEM.Reproducibility.02", 
"NASEM.Communication.01", "NASEM.Communication.02", "NASEM.Communication.03","NASEM.Communication.04", "NASEM.Communication.05",
"NASEM.Domain.01", 
"NASEM.Ethics.01", "NASEM.Ethics.02", "NASEM.Ethics.03", "NASEM.Ethics.04", "NASEM.Ethics.05")]

# compute the number of chosen clusters 
km.2 <- kmeans(NASEM.all.areas, centers = 3)
km.2

# try different numbers of clusters

# plot the results of the clusters in a scatter plot formed by the variables
fviz_cluster(km.2, data = NASEM.all.areas, label=NA)+theme_bw()

#  start to make multiple dimension plots 


# including all areas/sub-areas in GDS in cluster analysis
GDS.all.areas <- programs.scores[,c("GDS.Data.literacy", "GDS.Databases", "GDS.Math", "GDS.Compute", "GDS.Generative.Modeling", "GDS.Predictive.Modeling", "GDS.Communication", "GDS.Science")]

# compute the number of chosen clsuters
km.3 <- kmeans(GDS.all.areas, centers = 3)
km.3

# plot the results of the clusters in a scatter plot formed by the variables
fviz_cluster(km.3, data = GDS.all.areas, label=NA)+theme_bw()

# try different numbers of clusters

# including only the mean area scores in NASEM in cluster analysis
# NASEM.only.areas <- programs.scores[,c("


# select a subset of the variables
# Here, the x-axis is the institution, and the y-axis is a specific areas/sub-areas in the NASEM framework.
# I re-coded the program name to a numerical number from 1-18
# Code runs, but results do not appear meaningful
# institution.domain <- programs.scores[,c("Institution.01", "NASEM.Domain.01")]

# compute the number of chosen clusters 
# km.4 <- kmeans(institution.domain, centers = 3)
# km.4

# plot the results of the clusters in a scatter plot formed by the two variables
# fviz_cluster(km, data = institution.domain, label=NA)+theme_bw()


# parts of code from An Introduction to Statistical Learning book that I am not using now
# set.seed (4)
# km.out <- kmeans (x, 3, centers = 3)
# kmeans()
# par (mfrow = c(1, 2))
# plot (x, col = (km.out$cluster + 1),
# main = "K- Means Clustering Results with K = 2", xlab = "Program", ylab = "Score", pch = 20, cex = 2)
