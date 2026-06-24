#!/bin/bash

# Example os continue in a loop

num=6

for i in 1 2 3 4 5 6 7 8 9
do
  # Continue the loop if num found
  if [ $num -eq $i ]; then
    echo "$num is found"
    continue
  fi
  echo "Number is $i"
done