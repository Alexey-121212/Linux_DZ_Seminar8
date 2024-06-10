#!/bin/bash

if [ $1 ]
    then
        if [ -e $1 ]
            then
                echo 'Directory exists , Doing  .... '
                cd $1
		dir=$(ls -l | tr -s ' ' '\t' | cut -f '3' | sort -u)
		for i in $dir; do
		    mkdir -p $i
		done
		dirfile=$(ls -l | tr -s ' ' '\t' | cut -f '3 9')
		count=0
		for i in $dirfile; do
		    count=$((count+1))
		    if (($count%2))
			then
			    dir=$i
			else
			    if [ -f ./$i ]
				then
				    cp ./$i ./$dir/$i
				    chown $dir ./$dir/$i
			    fi
		    fi
		done
		exit 0
	    else
		echo 'Error: Enter CORRECT folder name please!'
		exit 2
	fi

	else
	echo 'Error: Enter folder name please!'
	exit 1
fi
