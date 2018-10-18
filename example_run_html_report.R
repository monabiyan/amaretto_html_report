rm(list=ls(all=TRUE))  # To Remove Everything
install.packages("/Users/mohsennabian/Dropbox/Harvard/amaretto/AMARETTO-develop-Jay", repos = NULL, type = "source")
library("AMARETTO")
source('./AMARETTO_html_report.R')
########################################################
# Demo data
########################################################
data(Driver_Genes)
data(ProcessedDataLAML)
MA_matrix<-data.matrix(ProcessedDataLAML$MA_TCGA)
CNV_matrix<-data.matrix(ProcessedDataLAML$CNV_TCGA)
MET_matrix<-data.matrix(ProcessedDataLAML$MET_TCGA)

NrModules <- 10
VarPercentage <- 20
########################################################
# LIHC Data : these 3 Data files must be in the same dirctory or change their address
########################################################
MA_matrix <- data.matrix(read_gct('/Users/mohsennabian/Dropbox/Harvard/amaretto/TCGA_LIHC_Expression.gct'))
CNV_matrix <-data.matrix(read_gct('/Users/mohsennabian/Dropbox/Harvard/amaretto/TCGA_LIHC_CNV.gct'))
MET_matrix <-data.matrix(read_gct('/Users/mohsennabian/Dropbox/Harvard/amaretto/TCGA_LIHC_Methylation.gct'))
#MA_matrix <- data.matrix(read_gct('/Users/mohsennabian/Dropbox/Harvard/amaretto/TCGA_GBM_Expression.gct'))
#CNV_matrix <-data.matrix(read_gct('/Users/mohsennabian/Dropbox/Harvard/amaretto/TCGA_GBM_CNV.gct'))
#MET_matrix <-data.matrix(read_gct('/Users/mohsennabian/Dropbox/Harvard/amaretto/TCGA_GBM_Methylation.gct'))


NrModules <- 150
VarPercentage <- 75
########################################################
# Running AMARETTO
########################################################
AMARETTOinit<-AMARETTO_Initialize(MA_matrix=MA_matrix,CNV_matrix=CNV_matrix,MET_matrix=MET_matrix, NrModules=NrModules,VarPercentage=VarPercentage,NrCores=4)

AMARETTOresults<-AMARETTO_Run(AMARETTOinit)
########################################################
# Saving AMARETTO Results
########################################################
#save(AMARETTOinit,file="hyper_geo_test/AMARETTOinit.Rda")
#save(AMARETTOresults,file="hyper_geo_test/AMARETTOresults.Rda")

#save(AMARETTOinit,file="/Users/mohsennabian/Dropbox/Harvard/amaretto/GBM_AMARETTO_RESULTS/AMARETTOinit.Rda")
#save(AMARETTOresults,file="/Users/mohsennabian/Dropbox/Harvard/amaretto/GBM_AMARETTO_RESULTS/AMARETTOresults.Rda")
########################################################
# Loading AMARETTO Results
########################################################

#load(file="hyper_geo_test/AMARETTOinit.Rda")
#load(file="hyper_geo_test/AMARETTOresults.Rda")
########################## LIHC
#load(file="/Users/mohsennabian/Dropbox/Harvard/amaretto/GBM_AMARETTO_RESULTS/AMARETTOinit.Rda")
#load(file="/Users/mohsennabian/Dropbox/Harvard/amaretto/GBM_AMARETTO_RESULTS/AMARETTOresults.Rda")

load(file="/Users/mohsennabian/Dropbox/Harvard/amaretto/LIHC_AMARETTO_RESULTS/AMARETTOinit.Rda")
load(file="/Users/mohsennabian/Dropbox/Harvard/amaretto/LIHC_AMARETTO_RESULTS/AMARETTOresults.Rda")
#################################

########################################################
# Running the HTML Report for AMARETTO
########################################################

res<-amaretto_html_report(AMARETTOinit,AMARETTOresults,CNV_matrix,MET_matrix,VarPercentage,hyper_geo_test_bool=TRUE,wordcloud_bool=FALSE,output_address='/Users/mohsennabian/Desktop/amaretto_reports/',output_name='LIHC')





