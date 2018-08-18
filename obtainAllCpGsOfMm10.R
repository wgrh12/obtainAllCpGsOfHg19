#!/usr/bin/Rscript --slave 
source("http://bioconductor.org/biocLite.R")
biocLite("BSgenome.Mmusculus.UCSC.mm10")

library(BSgenome.Mmusculus.UCSC.mm10)
# Filter out the "upstream" chromosomes
chrs <- names(Mmusculus)[!grepl("upstream", names(Mmusculus))]  
CGs <- lapply(chrs, function(x) start(matchPattern("CG", Mmusculus[[x]])))   
# Peek at contents of CGs
str(CGs)  
## Write contents to files
for(i in c(1:19)) {write.csv(CGs[[i]],paste0("mm10_chr",i,"_CpGs.csv"),row.names=F)}
write.csv(CGs[[20]],"mm10_chrX_CpGs.csv",row.names=F)
write.csv(CGs[[21]],"mm10_chrY_CpGs.csv",row.names=F)
write.csv(CGs[[22]],"mm10_chrM_CpGs.csv",row.names=F)  
