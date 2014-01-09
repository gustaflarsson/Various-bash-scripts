#!/bin/bash 

# This script will open the file in vim if the file have the +w flag for the current user.
# If not it will just cat the file if the file is readable.

Bin_vim=/usr/bin/vim
Bin_cat=/bin/cat

print_usage() {
    echo "Usage: ./ovning1.sh <file>"
    exit 2
}

# check so we have a input value
if [ -z $1 ]; then
    print_usage # print some stupid usage info...
else # if we have an input value, set it.. ^^,
    File=$1
fi

# check if the file exists
if [ -e $File ]; then

    if [ -w $File ]; then # check if the file is writeable
        $Bin_vim $File # open it in vim
        exit 0 # time to exit the "real" way
    elif [ -r $File ]; then # check if the file is readable if its not writeable
        $Bin_cat $File # print the file with cat
        exit 0 # time to exit the "real" way
    else # we cant read or write to the file
        print_usage
        echo "Error, the file are not readable."
    fi

else
    print_usage
fi
