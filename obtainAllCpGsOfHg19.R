#!/usr/bin/Rscript --slave 
source("http://bioconductor.org/biocLite.R")
biocLite("BSgenome.Hsapiens.UCSC.hg19")

library(BSgenome.Hsapiens.UCSC.hg19)
# Filter out the "upstream" chromosomes
chrs <- names(Hsapiens)[!grepl("upstream", names(Hsapiens))]  
CGs <- lapply(chrs, function(x) start(matchPattern("CG", Hsapiens[[x]])))   
# Peek at contents of CGs
str(CGs)  
## Write contents to files
for(i in c(1:22)) {write.csv(CGs[[i]],paste0("hg19_chr",i,"_CpGs.csv"),row.names=F)}
write.csv(CGs[[23]],"hg19_chrX_CpGs.csv",row.names=F)
write.csv(CGs[[24]],"hg19_chrY_CpGs.csv",row.names=F)
write.csv(CGs[[25]],"hg19_chrM_CpGs.csv",row.names=F)   
