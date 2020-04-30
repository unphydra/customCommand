#!/bin/bash

filename=$1
rm -rf bin
mkdir bin
file=`echo $filename |rev | cut -d "/" -f 1|rev| sed "s/.c$//"`

gcc ./$filename -o bin/$file
./bin/$file

rm -rf bin