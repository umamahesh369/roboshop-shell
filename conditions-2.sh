#!/bin/bash

NUMBER=$1  # No space around the equals sign

if [[ $NUMBER -gt 100 ]]; 

then
    echo "Given number $NUMBER is greater than 100"
else
    echo "Given number $NUMBER is less than or equal to 100"
fi
