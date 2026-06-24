#!/bin/bash

# Example os break in a loop

num=6

fir  i in 1 2 3 4 5 6 7 8 9
do
  # Break the loop if num found
  if [ $num -eq $i ]; then
    echo "$num is found"
    break
  fi
  echo "Number is $i"
done