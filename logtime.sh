#!/bin/bash

read -r -p "Enter the user's UID: " uid
user_name=$(id -u --name "$uid")

# last returns a listing of last logged in user
# grep -c calculates lines of output containing the 
# user_name obtained above. This count corresponds to
# the number of times the user logged in to the machine
login_time=$(last | grep -c "^$user_name")

# Display the login count
printf "\n%-10s %-20s %-10s\n" "UID" "User name" "Login count"
printf "%-10s %-20s %-10s\n" "$uid" "$user_name" "$login_time"

