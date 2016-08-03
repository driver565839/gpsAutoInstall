#!/bin/bash
clear
echo "Hello World"
echo "Commencing ntp printing loop"

while true; do
ntpq -p
sleep 15
done
