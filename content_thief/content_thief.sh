#!/bin/bash 

Url=$1
Filetype=$2

WebContent=`curl $1`

for i in `echo $WebContent | egrep -o 'http://[0-9A-Za-z./_-]+' | grep $Filetype`; do
    wget $i
done
