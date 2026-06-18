#!/bin/bash

counter=10

until [ $counter -eq 1 ]; do
  echo "counter is $counter"
  let counter--
    
done