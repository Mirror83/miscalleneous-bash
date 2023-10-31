#! /bin/bash


usage="usage: ./mail-merge.sh recepients-file message-file subject
    recepients-file - Path to the file containing the recepients of the email
    message-file - Path to the file containing the content of the email
    subject - A string denoting the subject of the email. 
    Tip: Enclose subject in quotation marks."

if [ $# -ne 3 ]; then
    echo "$0: Supports strictly 3 arguments"
    echo "$usage"
    exit 1
elif [ ! -e "$1" ]; then  # The -e option checks whether a string is the path to a file 
    echo "$0: $1 is not a path to a file!"
    echo "$usage"
    exit 2
elif [ ! -e "$2" ]; then
    echo "$0: $2 is not a path to a file!"
    echo "$usage"
    exit 2
fi


# The grep command extracts the email addresses using the email regex in email-regex.txt,
# xargs formats the lines of output produced
# by grep into a single line, with each line delimited by spaces and finally
# tr converts those spaces into commas
recepients=$(grep -E -o "[A-Za-z0-9._]+@[A-Za-z0-9.]+\.[a-zA-Z]{2,4}" "$1" | xargs | tr " " ",")

subject="$3"

# Encode the message using urlencoding so as to handle special symbols well
message=$(jq -sRr @uri < "$2")


# Build the mailto url
mailto_url="mailto:$recepients?subject=$subject&body=$message"

# Pass in the mailto url to the address bar of the default browser and navigate to it
x-www-browser "$mailto_url"
