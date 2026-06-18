#!/bin/bash

FILE="/root/shell-scripts/Learn-shell-scripting-YouTube/server.txt"
for server in $(cat $FILE)
do
  echo "server is $server"
  done
