#!/bin/bash

echo "Check you are eligible for work"

read -p "What is your age: " age

if [ $age -ge 18 ] && [ $age -le 60 ]; then
  echo "You can work"
else
  echo "Sorry you are not eligible for work"
fi