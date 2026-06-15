#!/bin/bash

echo "choose an option"
echo "a= To Print the current date"
echo " b= To print the current working directory "
echo " c = To print all files in current directory"

read choose

case $choose in
      a) date;;
      b) pwd;;
      c) ls -a;;
      *) echo "Invalid option"
