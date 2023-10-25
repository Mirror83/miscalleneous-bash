#!/bin/bash

sum=0
iterations=0

echo "Sum 5"
while [ $iterations -lt 5 ];
do
    read -r -p "Enter value $((iterations + 1)): " num
    sum=$((sum + num))
    iterations=$((iterations + 1))
done

echo "Sum: $sum"
