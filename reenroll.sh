#!/bin/bash
JAMF="/usr/local/jamf/bin/jamf"
pkg="/toolz/j/quickadd.pkg"
JSS="jamfbutt.jamfcloud.com"

if [[ $JAMF ]];
	then
		echo "`date -u` Looks Good" >> logfile
    	exit 0 # jamf binary found
	elif [ "`ping -c 1 $JSS`" ];
    then
    	installer -pkg $pkg -target /
    	echo "`date -u` Jamf Re-Enrolled" >> /toolz/logfile
	else
        echo "`date -u` JSS unreachable" >> /toolz/logfile
        exit 1
fi
exit 0