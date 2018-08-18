#!/bin/bash
# Usage: $0 genomeVersion chromNum
# For example: thisScriptName hg19 22  OR  mm10 19  

counter=1
while [ $counter -le $2 ]
do
   echo $counter
   awk -v cnt="$counter" '{print "chr"cnt","$1","$1}' $1_chr$counter\_CpGs.csv > tmp
   mv tmp $1_chr$counter\_CpGs.csv
   cat $1_chr$counter\_CpGs.csv >> $1_all_CpGs.csv
   ((counter++))
done

awk '{print "chrX,"$1","$1}' $1_chrX_CpGs.csv > tmp
mv tmp $1_chrX_CpGs.csv
cat $1_chrX_CpGs.csv >> $1_all_CpGs.csv

awk '{print "chrY,"$1","$1}' $1_chrY_CpGs.csv > tmp
mv tmp $1_chrY_CpGs.csv
cat $1_chrY_CpGs.csv >> $1_all_CpGs.csv

awk '{print "chrM,"$1","$1}' $1_chrM_CpGs.csv > tmp
mv tmp $1_chrM_CpGs.csv
cat $1_chrM_CpGs.csv >> $1_all_CpGs.csv

echo All done
