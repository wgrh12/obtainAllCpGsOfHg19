#!/bin/bash

counter=1
while [ $counter -le 22 ]
do
   echo $counter
   scp -i ~/textFiles/wei_key.txt hg19_chr$counter\_CpGs.csv wei@54.226.90.106:/home/wei/vol/age/padlock/hg19_allCpGs_chr1toXYM/
   ((counter++))
done

scp -i ~/textFiles/wei_key.txt hg19_chrX_CpGs.csv wei@54.226.90.106:/home/wei/vol/age/padlock/hg19_allCpGs_chr1toXYM/
scp -i ~/textFiles/wei_key.txt hg19_chrY_CpGs.csv wei@54.226.90.106:/home/wei/vol/age/padlock/hg19_allCpGs_chr1toXYM/
scp -i ~/textFiles/wei_key.txt hg19_chrM_CpGs.csv wei@54.226.90.106:/home/wei/vol/age/padlock/hg19_allCpGs_chr1toXYM/

echo All done
