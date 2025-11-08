#!/bin/bash

# Service name to check
SERVICE="nginx"

# Check if the service is active
if systemctl is-active --quiet $SERVICE
then
echo "$SERVICE is running."
else
echo "$SERVICE is not running. Restarting..."
systemctl restart $SERVICE

    # Check if restart was successful
    if systemctl is-active --quiet $SERVICE
    then
        echo "$SERVICE restarted successfully!"
    else
        echo "Failed to restart $SERVICE."
    fi
fi

