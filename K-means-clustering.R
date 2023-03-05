# K-means clustering and PCA for data science curricula comparisons
# Torbet McNeil
# tmcneil@arizona.edu
# 2022-11-01

#########################################################################
# Using k-means clustering

library("factoextra")
library("cluster")
library("dplyr")

# read the dataset
programs.scores <- read.csv(file = "Data/scores-nasem-1.csv")

# Investigate data 
head(programs.scores)

# including all areas/sub-areas in NASEM in cluster analysis, excluding following: NASEM.Statistics.04, NASEM.Data.management.01, NASEM.Data.management.06, 
# NASEM.Data.description.visualization.02
NASEM.all.areas.1 <- programs.scores[,c("NASEM.Math.01", "NASEM.Math.02", "NASEM.Math.03", "NASEM.Math.04", "NASEM.Math.05", "NASEM.Math.06",
"NASEM.Compute.01", "NASEM.Compute.02", "NASEM.Compute.03", "NASEM.Compute.04", "NASEM.Compute.05", 
"NASEM.Statistics.01", "NASEM.Statistics.02", "NASEM.Statistics.03", "NASEM.Statistics.05", "NASEM.Statistics.06", 
"NASEM.Data.management.02", "NASEM.Data.management.03", "NASEM.Data.management.04", "NASEM.Data.management.05", "NASEM.Data.management.07",
"NASEM.Data.description.visualization.01", "NASEM.Data.description.visualization.03", 
"NASEM.Modeling.01", "NASEM.Modeling.02", "NASEM.Modeling.03", "NASEM.Modeling.04", "NASEM.Modeling.05", "NASEM.Modeling.06",
"NASEM.Reproducibility.01", "NASEM.Reproducibility.02", 
"NASEM.Communication.01", "NASEM.Communication.02", "NASEM.Communication.03","NASEM.Communication.04", "NASEM.Communication.05", 
"NASEM.Domain.01", 
"NASEM.Ethics.01", "NASEM.Ethics.02", "NASEM.Ethics.03", "NASEM.Ethics.04", "NASEM.Ethics.05")]

# Elbow method (scree plot) to determine ideal number of clusters
fviz_nbclust(NASEM.all.areas.1, kmeans, method = "wss",  k.max = 17)

# Silhouette method
fviz_nbclust(NASEM.all.areas.1, kmeans, method = "silhouette") +
  labs(subtitle = "Silhouette method")

# Gap statistic
set.seed(42)
fviz_nbclust(NASEM.all.areas.1, kmeans,
  nstart = 25,
  method = "gap_stat",
  nboot = 500 # reduce it for lower computation time (but less precise results)
) +
  labs(subtitle = "Gap statistic method")


# compute the number of chosen clusters 
km.5 <- kmeans(NASEM.all.areas.1, centers = 7)
km.5

# plot the results of the clusters in a scatter plot formed by the variables
fviz_cluster(km.5, data = NASEM.all.areas.1, label=NA)+theme_bw()

# put plot in "Notes for clustering project" document 

# including all areas/sub-areas in GDS in cluster analysis
# read the dataset
GDS.programs.scores <- read.csv(file = "scores-GDS-1.csv")

# Investigate data 
head(GDS.programs.scores)

# Include all GDS area scores
GDS.all.areas <- GDS.programs.scores[,c("GDS.Data.literacy", "GDS.Databases", "GDS.Math", "GDS.Compute", "GDS.Generative.Modeling", "GDS.Predictive.Modeling", "GDS.Communication", "GDS.Science")]

# Elbow method (scree plot) to determine ideal number of clusters
fviz_nbclust(GDS.all.areas, kmeans, method = "wss",  k.max = 7)

# Silhouette method
fviz_nbclust(GDS.all.areas, kmeans, method = "silhouette") +
  labs(subtitle = "Silhouette method")

# Gap statistic
set.seed(42)
fviz_nbclust(GDS.all.areas, kmeans,
  nstart = 25,
  method = "gap_stat",
  nboot = 500 # reduce it for lower computation time (but less precise results)
) +
  labs(subtitle = "Gap statistic method")


# compute the number of chosen clusters
# Will change this after correct interpretation of Scree plot
km.3 <- kmeans(GDS.all.areas, centers = 5)
km.3

# plot the results of the clusters in a scatter plot formed by the variables
fviz_cluster(km.3, data = GDS.all.areas, label=NA)+theme_bw()
# Put plot in "Notes for clustering project" document 


# including only the mean area scores in NASEM in cluster analysis. Not sure if this is necessary. 
# NASEM.only.areas <- programs.scores[,c("


# Perform principal components analysis using the prcomp() function on NASEM
pr.out.NA <- prcomp (x = NASEM.all.areas.1 , scale = TRUE)
# Look at results
pca.summary.NA <- summary(pr.out.NA)
# Lists the objects produced by summary
ls(pca.summary.NA)
# Identify important factors that emerge from the PCA that explain a lot of variation
pca.summary.NA$importance
# Second row, "Proportion of Variance," shows how much variation in the data is described by each component

# Identify what these factors actually say about the variation observed in data
pca.summary.NA$rotation

# Scree plot
plot(pr.out.NA, type = "l")

# Plot PCA results
biplot(x = pr.out.NA)

# Plot the first two components
plot(x = pr.out.NA$x[, 1],
     y = pr.out.NA$x[, 2],
     xlab = "PC 1",
     ylab = "PC 2",
     pch = 19,
    
legend("bottomleft", 
       legend = Institution, 
       pch = 19, 
       cex = 0.8)
     

# perform principal components analysis using the prcomp() function on GDS
pr.out.GDS <- prcomp (x = GDS.all.areas , scale = TRUE)
# Look at results
pca.summary.GDS <- summary(pr.out.GDS)
# Lists the objects produced by summary
ls(pca.summary.GDS)
# Identify important factors that emerge from the PCA
pca.summary.GDS$importance

# Identify what these factors actually say about the variation observed in data
pca.summary.GDS$rotation
 
# Scree plot
plot(pr.out.GDS, type = "l")

# Plot PCA results
biplot(x = pr.out.GDS)

# Plot the first two components
# Need to experiment with xlim and ylim to get labels to show up properly
plot(x = pr.out.GDS$x[, 1],
     y = pr.out.GDS$x[, 2],
     xlab = "PC 1",
     ylab = "PC 2",
     pch = 19,
     xlim = c(-5, 8),
ylim = c(-5, 5))
     
legend("bottomleft", 
     legend = Institution, 
  pch = 19, 
   cex = 0.8)

# add Institution labels
text(pr.out.GDS$x[, 1], pr.out.GDS$x[, 2], labels = GDS.programs.scores$Institution)
     

     
     
     
