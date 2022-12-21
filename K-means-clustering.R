# K-means clustering for data science curricula comparisons
# Torbet McNeil
# tmcneil@arizona.edu
# 2022-11-01

#########################################################################
# Using k-means clustering
# Using code from this website: https://bookdown.org/tpinto_home/Unsupervised-learning/k-means-clustering.html. This code is different than that for 
# running k-means clustering in An Introduction to Statistical Learning. 

# Please also look at notes/questions on the Google Doc "Notes for clustering project" (updated 12-19; you have access through @arizona.edu account):
# https://docs.google.com/document/d/1Y7HgH8U0KEWig-rw4qZpULBX8b2VY3iJiObbir6_TvI/edit

library("factoextra")
library("cluster")
library("dplyr")

# read the dataset
programs.scores <- read.csv(file = "Data/scores-nasem-1.csv")

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

# I can onduct exploratory analysis by selecting other pairs of variables.

# Create table that shows the distinct pairs of points
count(ethics.domain, NASEM.Modeling.01, NASEM.Data.description.visualization.01)

# Investigate variable
ethics.domain

# Look at basic scatterplots of data
ggplot(ethics.domain, aes(x=NASEM.Modeling.01, y=NASEM.Data.description.visualization.01)) + 
  geom_point(alpha=0.2) + 
  theme_bw()

ggplot(ethics.domain, aes(x=NASEM.Modeling.01, y=NASEM.Data.description.visualization.01)) + 
  geom_jitter(width = 0.1, height = 0.1, alpha = 0.5) + 
  theme_bw()

# There are four distinct groups in data. K-means clustering does not really appear needed.
# If I see more fuzziness and overlap of points, then k-means clustering may be justified.
# Can check other scatterplots to see if I think other pairs of variables will benefit from k-means clustering 

# including all areas/sub-areas in NASEM in cluster analysis
# 
# NASEM.all.areas <- programs.scores[,c("NASEM.Math.01", "NASEM.Math.02", "NASEM.Math.03", "NASEM.Math.04", "NASEM.Math.05", "NASEM.Math.06", 
# "NASEM.Compute.01", "NASEM.Compute.02", "NASEM.Compute.03", "NASEM.Compute.04", "NASEM.Compute.05", 
# "NASEM.Statistics.01", "NASEM.Statistics.02", "NASEM.Statistics.03", "NASEM.Statistics.04", "NASEM.Statistics.05", "NASEM.Statistics.06", 
# "NASEM.Data.management.01", "NASEM.Data.management.02", "NASEM.Data.management.03", "NASEM.Data.management.04", "NASEM.Data.management.05", 
# "NASEM.Data.management.06", "NASEM.Data.management.07", 
# "NASEM.Data.description.visualization.01", "NASEM.Data.description.visualization.02", "NASEM.Data.description.visualization.03", 
# "NASEM.Modeling.01", "NASEM.Modeling.02", "NASEM.Modeling.03", "NASEM.Modeling.04", "NASEM.Modeling.05", "NASEM.Modeling.06", 
# "NASEM.Reproducibility.01", "NASEM.Reproducibility.02", 
# "NASEM.Communication.01", "NASEM.Communication.02", "NASEM.Communication.03","NASEM.Communication.04", "NASEM.Communication.05", 
# "NASEM.Domain.01", 
# "NASEM.Ethics.01", "NASEM.Ethics.02", "NASEM.Ethics.03", "NASEM.Ethics.04", "NASEM.Ethics.05")]
NASEM.all.areas <- programs.scores[, -c(1:3)]

# Remove any invariant columns
invariant_cols <- apply(X = NASEM.all.areas,
                        MARGIN = 2,
                        FUN = sd) == 0
NASEM.all.areas <- NASEM.all.areas[, !invariant_cols]

# compute the number of chosen clusters 
km.2 <- kmeans(NASEM.all.areas, centers = 3)
km.2

# plot the results of the clusters in a scatter plot formed by the variables
fviz_cluster(km.2, data = NASEM.all.areas, label=NA)+theme_bw()

# Got all code to run and put plot in "Notes for clustering project" document 


#  start to make multiple dimension plots 

# try different numbers of clusters


# including all areas/sub-areas in GDS in cluster analysis
# read the dataset
GDS.programs.scores <- read.csv(file = "scores-GDS-1.csv")

# Investigate data 
head(GDS.programs.scores)

# Include all GDS area scores
GDS.all.areas <- GDS.programs.scores[,c("GDS.Data.literacy", "GDS.Databases", "GDS.Math", "GDS.Compute", "GDS.Generative.Modeling", "GDS.Predictive.Modeling", "GDS.Communication", "GDS.Science")]

# compute the number of chosen clusters
km.3 <- kmeans(GDS.all.areas, centers = 3)
km.3

# plot the results of the clusters in a scatter plot formed by the variables
fviz_cluster(km.3, data = GDS.all.areas, label=NA)+theme_bw()
# Got all code to run and put plot in "Notes for clustering project" document 

# try different numbers of clusters

# including only the mean area scores in NASEM in cluster analysis
# NASEM.only.areas <- programs.scores[,c("


# parts of code from An Introduction to Statistical Learning book that I am not using now
# set.seed (4)
# km.out <- kmeans (x, 3, centers = 3)
# kmeans()
# par (mfrow = c(1, 2))
# plot (x, col = (km.out$cluster + 1),
# main = "K- Means Clustering Results with K = 2", xlab = "Program", ylab = "Score", pch = 20, cex = 2)
