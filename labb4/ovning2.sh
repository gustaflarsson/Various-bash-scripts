#!/bin/bash

# Currency rates
USD_to_SEK=6
SEK_to_USD=0.15

read -p "Convert to USD or SEK [USD|SEK]" Choice # get user input

proc_usdtosek() {
    result=`echo "$Amount*$USD_to_SEK" | bc` # do the math :)
    echo $result "SEK"
}

proc_sektousd() {
    result=`echo "$Amount*$SEK_to_USD" | bc` # do the math...
    echo $result
}

# Check for the correct answer.
if [ $Choice = "USD" -o $Choice = "SEK" ]; then
    read -p "How much do you wish to convert: " Amount # get user input for how much to Convert.

    if [ $Choice = "SEK" ]; then
        proc_usdtosek
    else
        proc_sektousd
    fi

else
    echo "wrong answer ..."
    exit 0
fi
