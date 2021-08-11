## Repository for the "Genetic Dissection of Seasonal Vegetation Index Dynamics in Maize through Aerial Based High-throughput Phenotyping" Project

### Outline of the repository
In order to better guide the visitors about the repository, here we briefly introduce the outline of the repository

### 1. NDVI Distribution 
-Dataset for NDVI at each of the 5 UAV overflights and 3 hand measured traits (PH, EH, FT), as well as population structure information for each accession

-Script for plotting NDVI by group

### 2. NDVI Clustering And Population Structure
-Dataset for NDVI at each of the 5 UAV overflights

-Dataset for K-means clustering result

-Dataset for SNP set used for tSNE analysis

-Script for K-means clustering analysis

-Scirpt for tSNE analysis on NDVI and SNP data

-Script for ploting growth curve, clustering result and tSNE result

### 3. P-Spline Modeling NDVI growth

-Dataset for P-Spling modeling Parameters

-Dataset for observed and predicted NDVI values

-Script for P-Spline modeling of NDVI across 5 UAV overflights and prediction of NDVI at specified timepoints

-Script for re-format predicted NDVI value

-Script for plotting model fitted growth curve, growth rate, and correlation between observed and predicted NDVI values

### 4. GWAS of NDVI and Pspline Curve Parameters

-Process for genotype data processing

-Dataset for filtered GWAS result of observed NDVI and growth curve parameters

-Dataset for NDVI candidate gene list

-Script for coverting vcf file to hmp file

-Script for plotting manhattan plot for GWAS result of observed NDVI and growth curve parameters

### 5. Dynamic Changes of Allelic Effect
-Dataset for SNP allelic effect

-Script for plotting SNP effect change across growth stage

