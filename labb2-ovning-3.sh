#!/bin/bash
read -p "Ge mig ett namn:" Name # get user input

if [ -f namn.txt ]; then # check if file exists
    echo $Name >> namn.txt # send the variable to the file
else
    echo "Error, file does not exist"
fi
