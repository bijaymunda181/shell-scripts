#!/bin/bash

# Defining Variables
name="Bijay"
age=25
echo "my name is  $name and my age is $age"
#or
echo "my name is ${name} and my age is ${age}"



# Print the output of any linux command.
HOSTNAME=$(hostname)
PWD=$(pwd)
echo "my server name is $HOSTNAME"
echo "my current working directory is $PWD"
