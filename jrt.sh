#! /bin/bash

if [ -d "./src/test/com/$1" ]
then
  ./jcr.sh $1
  javac -cp ./jar/\*:./out/main -d ./out/main src/test/com/$1/*.java
fi;


if [[ ! -z "$2" ]]
then
  ar=($@);
  list=(${ar[@]:1})
  for i in ${!list[@]}
  do
    list[i]=" com.$1.${list[i]}"
  done
else
  list=($(ls out/main/com/$1/*Test*\.class))
  for i in ${!list[@]}
  do
    list[i]=`echo ${list[i]} | sed "s/.class$//; s/out\/main\///; s/\//\./g"`
  done
fi;
  java -cp ./jar/\*:./out/main/ org.junit.runner.JUnitCore ${list[@]}