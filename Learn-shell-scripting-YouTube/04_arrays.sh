#!/bin/bash

##Arrays
#An Array is a varible that can store multiple values insted of just one value.

myArrays=(Bijay Amit 1 3.6 "Bijay Munda")

echo "${myArrays[0]}"
echo "${myArrays[3]}"
echo "${myArrays[2]}"
echo "${myArrays[5]}"

##Print all variables
echo "${myArrays[@]}"


##Print Array length
echo "${#myArrays[@]}"

##Print Range of values from Array
echo "value from index 1-3 ${myArrays[*]:1:3}"

##Updating Array
myArrays+=(New 10 20 cool)
echo "all values in my array is ${myArrays[*]}"

##Editing array
myArrays[1]=sumit
echo "all value in my array is = ${myArrays[*]}"

## Deleting a value from array
unset myArrays[0]
echo "all value in my array is = ${myArrays[*]}"
