# Load the bioconductor installer. 
source("https://bioconductor.org/biocLite.R")

# Install the packages
biocLite("RTCGA")
biocLite("RTCGA.clinical")
biocLite("RTCGA.mRNA")

# Load the packages
library(RTCGA)
library(RTCGA.clinical)

# Explore the data
dim(BRCA.clinical)
names(BRCA.clinical)

# Create the clinical data object
clin <- survivalTCGA(BRCA.clinical, OV.clinical, GBM.clinical, 
                     extract.cols="admin.disease_code")
# Show the head
head(clin, 5)

# Create table by the outcome
xtabs(~admin.disease_code+patient.vital_status, data=clin) %>% addmargins()

# Run Cox model
coxph(Surv(times, patient.vital_status)~admin.disease_code, data=clin)

# Fit the survival curve
sfit <- survfit(Surv(times, patient.vital_status)~admin.disease_code, data=clin)
summary(sfit, times=seq(0,365*5,365))
ggsurvplot(sfit, conf.int=TRUE, pval=TRUE)

