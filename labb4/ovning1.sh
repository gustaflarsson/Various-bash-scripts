#!/bin/bash 

print_usage() {
    echo "Usage: ./script <number1> <number2>"
}

func_addition() {
    echo $((number1+number2))
}

func_multi() {
    echo $((number1*number2))
}

func_div() {
    echo $((number1/number2)) " rest " $((number1%number2))
}

func_sub() {
    echo $((number1-number2))
}


# check all arguments so we have only numbers in it, had to use sed here for the regex to work because the arguments use spaces
# there is probably a million other ways to do it, but this is my way. Atleast this time :>
# Besides, this way we keep all those nasty float numbers away.
if ! [ `echo $@ | sed 's/ //g' | egrep '^[0-9]+$'` ]; then
    print_usage # if there is not only numbers in the arguments print the usage...
    exit # and exit obviously..
fi

number1=$1
number2=$2

func_addition
func_multi
func_div
func_sub
