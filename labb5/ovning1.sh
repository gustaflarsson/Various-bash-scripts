#!/bin/bash 

read -p "Skriv ett tal mellan 10 och 100: " Input

if [ $Input -lt 10 -o $Input -gt 100 ]; then
    echo "fel..."
    exit 1
fi

until [ $Input -lt 1 ]; do
    echo $Input
    Input=$(( Input-1 ))
done
