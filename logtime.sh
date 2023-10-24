#!/bin/bash

# Get the UID from the user
read -p "Enter the user's UID: " uid

# Count the number of times the user is logged in
# The `who` command will get the currently logged in users
# `grep "^$uid"` will get the lines in which the user with the
# provided uid is logged in
# `wc -l` will return the count of these lines
login_count=$(who -a | grep "^$uid" | wc -l)

# Display the login count
echo "The user with UID $uid is logged in $login_count time(s)."
