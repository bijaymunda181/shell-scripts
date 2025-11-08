#!/bin/bash

# Service name to check
SERVICE="nginx"

# Check if the service is active
if systemctl is-active --quiet $SERVICE
then
echo -e "\e[32m$SERVICE is running.\e[0m"
else
echo -e "\e[32m$SERVICE is not running. Restarting...\e[0m"
systemctl restart $SERVICE

    # Check if restart was successful
    if systemctl is-active --quiet $SERVICE
    then
        echo -e "\e[32m$SERVICE restarted successfully!\[0m"
    else
        echo -e "\e[31mFailed to restart $SERVICE.\e[0m"
    fi
fi

