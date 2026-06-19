#!/bin/bash

greet() {
  echo "Hello $1"
}

read -p "Enter your name: " name

greet $name