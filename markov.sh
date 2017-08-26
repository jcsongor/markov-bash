#!/bin/bash
words=`tr '\n' ' ' < $1|sed 's/[^[:alnum:][:space:]]\+//g'| tr '[:upper:]' '[:lower:]'`
index=$((2 + RANDOM % `echo $words|wc -w`))
pattern=`echo $words|cut -f$index-$((index+1)) -d' '`
echo -n $pattern
for i in `seq $2`;do
	candidates=''
	for word in $words;do
		if [ -n "${word2}" -a -n "${word1}" -a "${word2} ${word1}" = "${pattern}" ];then
			candidates="${candidates} ${word}"
		fi
		word2=$word1
		word1=$word
	done
	nextword=`shuf -e -n1 $candidates`
	pattern=`echo $pattern|sed 's/.* //g'`" ${nextword}"
	echo -n " ${nextword}"
done
