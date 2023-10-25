#!/bin/bash

# Get the UID from the user
#! /bin/bash

read -r -p "Enter the user's UID: " uid
user_name=$(id -u --name "$uid")

# Calculate login count
login_time=$(last | grep -c "^$user_name")

# Display the login count
printf "\n%-10s %-20s %-10s\n" "UID" "User name" "Login count"
printf "%-10s %-20s %-10s\n" "$uid" "$user_name" "$login_time"

