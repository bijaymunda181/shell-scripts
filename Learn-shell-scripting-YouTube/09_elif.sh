#!/bin/bash

read -p "Enter you Total marks: " marks

if [ $marks -ge 60 ]; then
  echo "Fist Division"

 elif [ $marks -ge 45 ]; then
    echo "second Division"

 elif [ $marks -ge 30 ]; then
    echo "Third division"

 else
    echo "Failed!!!!!!!!!!!!!!!!!!!!!!!!!"
fi