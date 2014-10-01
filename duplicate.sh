#!/bin/bash
# Directory containing all files
FILES=~/duplicate/*
for f in $FILES
do
	sum1=$(md5sum $f)
	sum2=${sum1:0:31}
	# Parse through the text file containing all of
	# the md5s of files you know you already have
	cat duplicates.txt | while read line
	do
		linehash=${line:0:31}
		# If the md5sum of the file is the same 
		# as the sum of any lines in the list
		if [ "$sum2" == "$linehash" ]
		then echo "Duplicate detected with md5 hash $sum2"
		rm $f
		fi
	done
done
