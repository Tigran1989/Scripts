#!/bin/bash

# Script to create users

USERFILE=$1

if [ "$USERFILE" = "" ]; then
    echo "Please specify an input file!"
    exit 10
elif [ -e "$USERFILE" ]; then
    for user in $(cat "$USERFILE"); do
        echo "Creating the $user user..."
        #useradd -m "$user"
        useradd -m $user ; echo "$user:linux" | chpasswd #this will asssign default password
    done
    exit 20
else
    echo "Invalid input file specified!"
    exit 30
fi
