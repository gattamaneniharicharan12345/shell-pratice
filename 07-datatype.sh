#!/bin/bash

number1=100
number2=200

TIME_STAMP=$(date)

echo "shell excecuteing on:$TIME_STAMP"

sum=$(($number1+$number2))

echo "sum of $number1 and $number2: $sum"
