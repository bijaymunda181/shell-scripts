#!/bin/bash

if [ $# -eq 0 ]; then
  echo "kindly provide atleast one argument "
  exit 1
fi

#Accessing the arguments
echo "First argument is $1"
echo "second argument is $2"

echo "No of argument are $#"
echo "All the arguments are $@"

for arg  in $@
do
  echo "Argument is $arg"
done