#!/bin/bash

greet() {
  echo "Hello $1"
  echo "city is $3"
  echo "age is $2"
}

read -p "Enter your name: " name

greet $name 24 Jamshedpur
