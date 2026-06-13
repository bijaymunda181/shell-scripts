#!/bin/bash

declare -A myarray
myarray=( [name]=Bijay [city]=Jamshedpur [age]=24 )

echo "${myarray['name']}"

echo "${myarray['city']}"

echo "${myarray['age']}"