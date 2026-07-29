#!/bin/bash
# simple-interest.sh
# Calculates simple interest from user-supplied Principal, Rate, and Time.
# Formula: SI = (P x R x T) / 100

echo "=========================================="
echo "        Simple Interest Calculator"
echo "=========================================="

read -p "Enter Principal amount        : " principal
read -p "Enter Rate of Interest (% p.a): " rate
read -p "Enter Time period (years)     : " time

# Basic numeric validation (integers or decimals, no negatives)
numeric_re='^[0-9]+([.][0-9]+)?$'
if ! [[ $principal =~ $numeric_re ]] || \
   ! [[ $rate =~ $numeric_re ]] || \
   ! [[ $time =~ $numeric_re ]]; then
    echo ""
    echo "Error: Principal, Rate, and Time must all be positive numbers."
    exit 1
fi

# Compute simple interest (use bc for decimal-safe math)
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

echo ""
echo "------------------------------------------"
echo " Principal        : $principal"
echo " Rate of Interest : $rate%"
echo " Time Period       : $time year(s)"
echo " Simple Interest   : $simple_interest"
echo " Total Amount      : $total_amount"
echo "------------------------------------------"
