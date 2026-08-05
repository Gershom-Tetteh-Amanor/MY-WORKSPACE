library(sampling) #Functions to draw random samples using different sampling schemes are available. Functions are also provided to obtain (generalized) calibration weights, different estimators, as well some variance estimators.

# install.packages("openxlsx)
library(openxlsx) # For importing and exporting excel files

library(dplyr) #We covered a lot of great functions within the R package called dplyr. This package has functions used for the manipulation and display of data within a data frame (two-dimensional data structure in R).

#reading the sampling frame file
GLSS8_Listed_Households_main <- read.xlsx("GLSS8_Listed Households.xlsx", sheet = 1, startRow = 1, colNames = TRUE,detectDates = FALSE)
GLSS8_Listed_Households <- GLSS8_Listed_Households_main

### If you want to check the variables in the data set, you can use:
### (1). type ls(name of the object/ dataset / filament) - gives the variable names in alphabetical order
### (2): type names(name of the object/ dataset / file name) - gives the variable names in the order in which they appeared in the dataset.



#################################################################################
###                        CLUSTER SAMPLING                                   ###
#################################################################################
# Cluster sampling using simple random without replacement
cls <- cluster(GLSS8_Listed_Households,clustername = c("Cluster.No"),size=20,method = 'srswor',description=TRUE)
 samp.cls <- getdata(GLSS8_Listed_Households,cls)

### Exporting the result
cluster.result <- write.xlsx(samp.cls,'cluster results.xlsx')





#################################################################################
###                         HOUSEHOLD SAMPLING                                ###
#################################################################################
# Total households
total_hh<-sum(GLSS8_Listed_Households$Household.Size.Total)


#Group by Cluster.No
freq_table_frame_byCluster.No <- GLSS8_Listed_Households %>%
  # Create tibble with frequencies
  group_by(Cluster.No) %>%
  summarise(n_Cluster.No = n(), tothh_Cluster.No=sum(Household.Size.Total)) %>%
  mutate(dist_count_Cluster.No = n_Cluster.No / length(GLSS8_Listed_Households$Cluster.No),
         dist_tothh_Cluster.No=tothh_Cluster.No/total_hh)


#selecting a stratified sample with equal sizes (stratum.size.equal)
#computing inclusion probabilities
inclusion_prob_const_allocation<-freq_table_frame_byCluster.No%>%
  mutate(p_const_alloc=20/n_Cluster.No)%>%
  select(Cluster.No,p_const_alloc) 


GLSS8_Listed_Households<-left_join(GLSS8_Listed_Households,inclusion_prob_const_allocation, by ="Cluster.No")

### Clusters with fewer than 20 households
incompletes <- GLSS8_Listed_Households[(GLSS8_Listed_Households$Cluster.No %in%c(734,870,1043,1046,1048,1052,1055,1070,1081,1083,1126, 1385, 1388, 1408, 1411, 1412, 1434, 1445, 1493,1494, 1544, 1545, 1546, 1548, 1605)),]


### Since some of the house holds are less than 20, we want to take them off from the data set 
GLSS8_Listed_Households <- GLSS8_Listed_Households[!(GLSS8_Listed_Households$Cluster.No %in% c(734,870,1043,1046,1048,1052,1055,1070,1081,1083,1126, 1385, 1388, 1408, 1411, 1412, 1434, 1445, 1493,1494, 1544, 1545, 1546, 1548, 1605)),]



# For duplicating or repeating or replicating the same size for the 1701-25 clusters
# since now ten cluster which have observations less than 20 has been taken out
strat_sys_constant <- strata(GLSS8_Listed_Households,stratanames=c("Cluster.No"),size=rep(20,times=(1701-25)),method="systematic",pik=GLSS8_Listed_Households$p_const_alloc)


#Attaching the Cluster.No to the samples units
strat_sys_constant_Id<-data.frame(getdata(GLSS8_Listed_Households,strat_sys_constant))%>%
  select(Unique_ID)

#Adding the frame variables to the sample
strat_sys_constant_framevars<-left_join(strat_sys_constant_Id,GLSS8_Listed_Households,by="Unique_ID")


### Exporting the results for Clusters with sufficient house holds
write.xlsx(strat_sys_constant_framevars,"Clusters with enough households.xlsx")

### Adding the incomplete dataset
strat_sys_constant_framevars_all <- rbind.data.frame(strat_sys_constant_framevars,incompletes)

### Exporting the results for the selection for the equal stratum of sizes stratum.size.equal each, amounting to a sample of size 480 in all(stratum.size.equalx16) using systematic sampling method
write.xlsx(strat_sys_constant_framevars_all,"Clusters with enough HH and Those without enough HH.xlsx")

### Checking for the missing Cluster Numbers
mising_cluster.No <- (1:1712)[!(1:1712 %in% GLSS8_Listed_Households_main$Cluster.No)]

mising_cluster.No


### Codes to open the results in excel
openXL("Clusters with enough HH and Those without enough HH.xlsx")
openXL("Clusters with enough households.xlsx")
















#############################################################################             ###                         GCAS++ CODES                                  ###
#############################################################################

library(sampling)
# install.packages("openxlsx)
library(openxlsx)
library(dplyr)

#reading the sampling frame file
GCAS_AGHHS_main <- read.xlsx("GCAS++_AGHHS.xlsx", sheet = 1, startRow = 1, colNames = TRUE)
GCAS_AGHHS <- GCAS_AGHHS_main

### If you want to check the variables in the data set, you can use:
### (1). type ls(name of the object/ dataset / filament) - gives the variable names in alphabetical order
### (2): type names(name of the object/ dataset / file name) - gives the variable names in the order in which they appeared in the dataset.



#################################################################################
###                        CLUSTER SAMPLING                                   ###
#################################################################################
# Cluster sampling using simple random without replacement
cls <- cluster(GCAS_AGHHS,clustername = c("Cluster.No"),size=15,method = 'srswor')
samp.cls <- getdata(GCAS_AGHHS,cls)

### Exporting the result
cluster.result <- write.xlsx(samp.cls,'cluster results.xlsx')


### To view the variable names you can use names("the variable name")
### e.g: names("GCAS_AGHHS")


#################################################################################
###                      AGRIC HOUSEHOLD SAMPLING                                   ###
#################################################################################
# Total households
total_hh<-sum(GCAS_AGHHS$`Household.Size.-.Total`)


#Group by Cluster.No
freq_table_frame_byCluster.No<-GCAS_AGHHS %>%
  # Create tibble with frequencies
  group_by(Cluster.No) %>%
  summarise(n_Cluster.No = n(), tothh_Cluster.No=sum(`Household.Size.-.Total`)) %>%
  mutate(dist_count_Cluster.No = n_Cluster.No / length(GCAS_AGHHS$Cluster.No),
         dist_tothh_Cluster.No=tothh_Cluster.No/total_hh)


#selecting a stratified sample with equal sizes (stratum.size.equal)
#computing inclusion probabilties
inclusion_prob_const_allocation<-freq_table_frame_byCluster.No%>%
  mutate(p_const_alloc=15/n_Cluster.No)%>%
  select(Cluster.No,p_const_alloc) 


GCAS_AGHHS<-left_join(GCAS_AGHHS,inclusion_prob_const_allocation, by ="Cluster.No")

### Clusters with fewer than 15 households
less <- c(24,26,27,94,95,196,198,202,210,214,219,221,222,226,229,233,234,235,237,238,241,242,246,247,299,306,309,314,704,705,706,709,710,723,724,728,197,286,701,1333)


incompletes <- GCAS_AGHHS[(GCAS_AGHHS$Cluster.No %in% less),] # Where less is a vector of Agric households less than 15


### Since some of the households are less than 15, we want to take them off from the data set 
GCAS_AGHHS <- GCAS_AGHHS[!(GCAS_AGHHS$Cluster.No %in% less),] # Where less is a vector of Agric households less than 15


# For duplicating or repeating or replicating the same size for the 1375-38 clusters
# since now 37 clusters which have observations less than 15 has been taken out
strat_sys_constant <- strata(GCAS_AGHHS,stratanames=c("Cluster.No"),size=rep(15,times=(1375-40)),method="systematic",pik=GCAS_AGHHS$p_const_alloc)


#Attaching the Cluster.No to the samples units
strat_sys_constant_Id<-data.frame(getdata(GCAS_AGHHS,strat_sys_constant))%>%
  select(Unique_ID)

#Adding the frame variables to the sample
strat_sys_constant_framevars<-left_join(strat_sys_constant_Id,GCAS_AGHHS,by="Unique_ID")


### Exporting the results for Clusters with sufficinet house holds
write.xlsx(strat_sys_constant_framevars,"Clusters with sufficient households.xlsx")

### Adding the incomplete dataset
strat_sys_constant_framevars_all <- rbind.data.frame(strat_sys_constant_framevars,incompletes)

### Exporting the results for the selection for the equal stratum of sizes stratum.size.equal each, amounting to a sample of size 480 in all(stratum.size.equalx16) using systematic sampling method
write.xlsx(strat_sys_constant_framevars_all,"Final selection with and without 15 HH.xlsx")


### Codes to open the results in excel
openXL("Final selection with and without 15 HH.xlsx")
openXL("Clusters with sufficient households.xlsx")