#!/bin/bash 

File="/home/larsson/while.dat"

while [ ! -f $File ]; do
    echo "Waiting for the file "$File
done

echo "Success! the file $File does now exist!"
