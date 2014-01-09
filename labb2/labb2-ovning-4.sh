#!/bin/bash

read -t 5 -p "Vilken är din favoritfärg:" Color # user input- time limit 5s
Color=${Color:="Röd"} # if no input, set standard color
echo -e "\nDin favoritfärg är $Color" # print the input
