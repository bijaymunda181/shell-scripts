#!/bin/bash

#Arrays
myArrays=( 1 10.5 Raju "Hey Buddy!" Bow )

for value in ${myArrays[*]}
do
  echo "value is $value"
done