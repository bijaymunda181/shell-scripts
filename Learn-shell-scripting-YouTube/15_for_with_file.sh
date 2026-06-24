#!/bin/bash

FILE="/root/shell-scripts/Learn-shell-scripting-YouTube/server.txt"

if  [ ! -f $FILE ]; then
  echo "file is not found!!!"
  exit 1
fi

for server in $(cat $FILE)
do
  echo "server is $server"
  done
