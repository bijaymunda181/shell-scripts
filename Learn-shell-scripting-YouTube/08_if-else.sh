#!/bin/bash

read -p "Enter your total Marks: " Marks

if [ $Marks -gt 40 ]
then
  echo "You are passed!!!"
  else
    echo "you are failed!!!!!!!!!!!!!!!!!"