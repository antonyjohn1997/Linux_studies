#!/bin/bash

declare -i number1
declare -i number2
declare -i total

echo "enter number1"
read number1
echo "enter number2"
read number2

total=$number1*$number2
echo "the product is " $total
exit 0

