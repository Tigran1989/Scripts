#!/bin/bash

# Number of failed login attempts to trigger an alert
threshold=5

while true
do
    # Get the number of failed login attempts from the auth.log file
    num_failed=$(grep "Failed password" /var/log/auth.log | wc -l)

    # If the number of failed login attempts exceeds the threshold, send an alert
    if [ $num_failed -ge $threshold ]
    then
        echo "WARNING: $num_failed failed login attempts detected!" | mail -s "Failed Login Attempt Alert" your@email.com
    fi

    # Wait for 5 minutes before checking again
    sleep 300
done
