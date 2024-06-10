#!/bin/bash

if [ $1 ]
    then
	if [ -e $1 ]
	    then
		echo 'Directory exists , deleting files if thay are in folder'
    		cd $1
	        rm -v *.bak *.tmp *.backup
		exit 0
	    else
		echo 'Error: Enter CORRECT folder name please!'
		exit 2
	fi
	    
    else
        echo 'Error: Enter folder name please!'
        exit 1
fi
