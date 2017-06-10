#!/bin/sh

# export DEVPI_HOST=https://devpi.newtonsystems.co.uk
# export DEVPI_USERNAME=newtonsystems
# export DEVPI_PASSWORD=gloucester12

if [ -z "$DEVPI_HOST" ]; then
    echo "You have not set the environment variable DEVPI_HOST"
    exit 1
fi

if [ -z "$DEVPI_USERNAME" ]; then
    echo "You have not set the environment variable DEVPI_USERNAME"
    exit 1
fi

if [ -z "$DEVPI_PASSWORD" ]; then
    echo "You have not set the environment variable DEVPI_USERNAME"
    exit 1
fi


devpi use $DEVPI_HOST
devpi user -c $DEVPI_USERNAME password=$DEVPI_PASSWORD
devpi login $DEVPI_USERNAME --password $DEVPI_PASSWORD
devpi index -c master volatile=True
devpi index -c featuretest volatile=True
devpi index -c prod volatile=False
