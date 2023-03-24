#!/bin/bash

# Website log file path
log_file="/var/log/apache2/access.log"

# Number of visitors to display in the alert message
num_visitors=10

while true
do
    # Get the IP addresses of the most recent visitors from the log file
    visitors=$(tail -n 100 $log_file | awk '{print $1}' | sort | uniq -c | sort -nr | head -n $num_visitors)

    # If there are visitors, send an alert message
    if [ -n "$visitors" ]
    then
        echo "Recent visitors to your website:" >> /tmp/website_alert.txt
        echo "$visitors" >> /tmp/website_alert.txt
        mail -s "Website Visitor Alert" your@email.com < /tmp/website_alert.txt
        rm /tmp/website_alert.txt
    fi

    # Wait for 5 minutes before checking again
    sleep 300
done
