#!/bin/bash 

# read the values from the user
read -p "Number1: " Number1
read -p "Number2: " Number2

if [ $Number1 -eq $Number2 ]; then
    echo "The numbers are equal"
else
    echo "The numbers are not equal"

    # check less then / greater than
    if [ $Number1 -lt $Number2 ]; then
        echo "$Number1 is less then $Number2"
    else 
        echo "$Number2 is less then $Number1"
    fi

    # check greater then
    if [ $Number1 -gt $Number2 ]; then
        echo "$Number1 is greater then $Number2"
    else
        echo "$Number2 is greater then $Number1"
    fi
fi
