#!/bin/sh
# $Id: rmfig.sh 217 2010-12-10 02:10:07Z soohyunc $

# delete all figures
for i in $( ls $PWD/fig/*.eps ); do
	echo "deleting: $i"
	rm -f $i
done 2> /dev/null
