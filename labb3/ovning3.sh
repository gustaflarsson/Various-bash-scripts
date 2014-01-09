#!/bin/bash 


read -p "Input a number between 1 and 10: " Num


if [ $Num -lt 10 -a $Num -gt 1 ]; then
    echo "YEY! you did it.. You must have increadibly high IQ... ^^,"
else
    echo "wtf, go see a doctor?"
fi
