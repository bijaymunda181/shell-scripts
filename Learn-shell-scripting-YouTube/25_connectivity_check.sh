#!/bin/bash

read -p "which site you want to check? " site

ping -c 1 $site >> connectivity.log

if [ $? -eq 0 ]; then
  echo "connection is successful"
else
    echo "failed to connect"
fi