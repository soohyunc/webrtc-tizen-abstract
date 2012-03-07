#!/bin/sh
# $Id: rmlog.sh 217 2010-12-10 02:10:07Z soohyunc $

TARGET=$1

# delete all log files
for i in $( ls $PWD/$TARGET.ps ); do
	echo "deleting: $i"
	rm -f $i
done 2> /dev/null

for i in $( ls $PWD/$TARGET.pdf ); do
	echo "deleting: $i"
	rm -f $i
done 2> /dev/null

for i in $( ls $PWD/$TARGET.dvi ); do
	echo "deleting: $i"
	rm -f $i
done 2> /dev/null

for i in $( ls $PWD/$TARGET.aux ); do
	echo "deleting: $i"
	rm -f $i
done 2> /dev/null

for i in $( ls $PWD/$TARGET.lo* ); do
	echo "deleting: $i"
	rm -f $i
done 2> /dev/null

for i in $( ls $PWD/$TARGET.out ); do
	echo "deleting: $i"
	rm -f $i
done 2> /dev/null

for i in $( ls $PWD/$TARGET.bbl ); do
	echo "deleting: $i"
	rm -f $i
done 2> /dev/null

for i in $( ls $PWD/$TARGET.bl* ); do
	echo "deleting: $i"
	rm -f $i
done 2> /dev/null

for i in $( ls $PWD/$TARGET.brf ); do
	echo "deleting: $i"
	rm -f $i
done 2> /dev/null

for i in $( ls $PWD/$TARGET.toc ); do
	echo "deleting: $i"
	rm -f $i
done 2> /dev/null

for i in $( ls $PWD/$TARGET.cb ); do
	echo "deleting: $i"
	rm -f $i
done 2> /dev/null


