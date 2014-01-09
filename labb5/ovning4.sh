#!/bin/bash 

File=$1
sum=0

Grade_VG=48
Grade_G=30

if [ -z $File ]; then # user input check...
    echo "Usage: ./script fil.txt"
    exit 1
fi  

for point in `cat $File`; do # loop through all the lines in the text file..
    sum=$(( sum + point )) # add the current line in the loop into the total sum variable
done

echo $sum

if [ $sum -lt $Grade_G ]; then # check if the result is lower then 30 ( G limit )
    echo "This student failed the test.. IG."
elif [ $sum -ge $Grade_VG ]; then # check if the result is greater then or equal to 48, the VG limit.
    echo "This student got a VG!"
else # if above statements are false, we know the student got a G :)
    echo "This student got a G."
fi
