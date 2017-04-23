#!/bin/sh

devpi user -c $DEVPI_USERNAME password=$DEVPI_PASSWORD
devpi login $DEVPI_USERNAME --password $DEVPI_PASSWORD
devpi index -c master volatile=True
devpi index -c featuretest volatile=True
devpi index -c prod volatile=False
