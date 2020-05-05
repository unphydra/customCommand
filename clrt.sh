#! /bin/bash

runFile='tests/test.c'
executable=$1

rm -rf *.o

list=($(ls))
for file in ${list[*]};
do 
  if [ $file != *$executable* ] && [[ $file == *".c"* ]]
    then 
        gcc -c $file
  fi
done
gcc -c $runFile
gcc -o main *.o
./main
rm -rf *.o main