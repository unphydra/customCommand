#! /bin/zsh

if [ ! -d "./out/main" ]
then
  mkdir -p ./out/main
fi;
javac -d ./out/main src/main/com/$1/*.java;
if  [[ ! -z "$2" ]]
then
  java -cp ./out/main com.$1.$2
fi;