#!/bin/bash

# Simple Interest Calculator
# Author: Your Name
# Date: 2024
# Description: This script calculates Simple Interest based on
#              user input for Principal, Rate of Interest, and Time Period.
#
# Formula: Simple Interest = (Principal * Rate * Time) / 100

echo "***********************************************"
echo "         Simple Interest Calculator           "
echo "***********************************************"
echo ""

# Input: Principal Amount
echo "Enter the Principal amount (in dollars):"
read principal

# Input: Rate of Interest
echo "Enter the Rate of Interest (% per year):"
read rate

# Input: Time Period
echo "Enter the Time Period (in years):"
read time

# Validate inputs are not empty
if [ -z "$principal" ] || [ -z "$rate" ] || [ -z "$time" ]; then
    echo "Error: All fields are required. Please enter valid values."
    exit 1
fi

# Validate inputs are positive numbers
if (( $(echo "$principal <= 0" | bc -l) )) || \
   (( $(echo "$rate <= 0" | bc -l) )) || \
   (( $(echo "$time <= 0" | bc -l) )); then
    echo "Error: All values must be greater than zero."
    exit 1
fi

# Calculate Simple Interest
# SI = (Principal * Rate * Time) / 100
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate Total Amount
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

# Display Results
echo ""
echo "***********************************************"
echo "                  RESULTS                     "
echo "***********************************************"
echo "Principal Amount     : $ $principal"
echo "Rate of Interest     : $rate %"
echo "Time Period          : $time years"
echo "-----------------------------------------------"
echo "Simple Interest      : $ $simple_interest"
echo "Total Amount         : $ $total_amount"
echo "***********************************************"
