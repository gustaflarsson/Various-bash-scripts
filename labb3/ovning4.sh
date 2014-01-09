#!/bin/bash  

print_usage() {
    echo "Usage: ./script <files>"
}

check_filetype() {
    unset File_type # clear the variable

    if [ -d $File ]; then # check if directory  
        File_type="Directory"
    elif [ -b $File ]; then # check if blockdevice
        File_type="Block Device"
    elif [ -f  $File ]; then # check if regular file
        File_type="Regular file"
    elif [ -h $File ]; then # check if Symlink
        File_type="Symlink"
    else
        # ok, we dont know what filetype it is, print error and continue the loop onto the next element in the list.
        echo "Error: Unable to determine filetype of $File, moving on..."
        continue # move on...
    fi
}

if [ ! $1 ]; then # check that we have arguments.. if not print usage and exit..
    print_usage
    exit
fi  

echo "Checking that the files exists..."

for File in "$@"; do # loop through all arguments passed onto the script

    if [ -e $File ]; then # check if the file exists
        check_filetype # 
        echo $File "is a" $File_type
    else # the file does not exist by this point, print error and move on to the next element in the list.
        echo "$File does not exists, skipping the check on this file."
        continue # move on...
    fi

done
