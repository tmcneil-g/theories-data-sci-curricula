# Higher education theories for data science curricula comparisons

A theoretical investigation of how undergraduate data science programs perform against two 
data science frameworks, the National Academies' "Data Science for 
Undergraduates Opportunities and Options" (2018) and Donoho's "Greater Data Science" (2017).

## Dependencies

The analyses and visualizations require the following packages:

+ factoextra
+ cluster
+ dplyr
+ ggplot2 (part of tidyverse)

## Workflow

This work addresses several main questions:

1. Using the NASEM (2018) framework, how does required curricula coverage of areas/sub-areas in the (1) “hard” skills of statistics/mathematics and computer science   
   compare to that of (2) domain knowledge and “soft” skills in ethics and communication and teamwork? 
2. How do areas/sub-areas in the NASEM (2018) and Donoho’s (2017) Greater Data Science (GDS) frameworks cluster? 
3. Donoho (2017) posits that the current academic field of undergraduate data science degree programs emphasize statistics and machine learning, with some attention 
   given to technology in curriculum that can handle big data. Is Donoho correct?

## 1. Comparison of skills 
To compare skills and test academic capitalism theory, using the 46 areas/sub-areas in the NASEM (2018) framework, I measure coursework coverage of (1) “hard” skills in statistics/mathematics and computer science versus (2) domain knowledge and “soft” skills in ethics and communication and teamwork.

## 2. Cluster analysis
I compare coverage among 53 areas/sub-areas within each of the NASEM and GDS frameworks using k-means clustering.


### 2. Coursework and administrative unit

To visualize the proportion of coursework in two areas ("hard" skills and "other" areas,), the units-visualization.R script creates a 
parallel coordinates plot with the proportions for each undergraduate data 
science program analyzed here.

