#! /bin/bash

# The grep command extracts the email addresses using the email regex in email-regex.txt,
# xargs formats the lines of output produced
# by grep into a single line, with each line delimited by spaces and finally
# tr converts those spaces into commas
recepients=$(grep -E -o -f email-regex.txt ./mail-merge/recepients.txt | xargs | tr " " ",")

subject="Invitation to Innovation Incubation Webinar"

# Encode the message using urlencoding so as to handle special symbols well
message=$(jq -sRr @uri < "mail-merge/message.txt")


# Build the mailto url
mailto_url="mailto:$recepients?subject=$subject&body=$message"

# Pass in the mailto url to the address bar of the default browser and navigate to it
x-www-browser "$mailto_url"
