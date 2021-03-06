#!/bin/bash
#
# delete-envs.sh
#
# Deletes kubernetes environments
#
# Make sure you have NEWTON_PATH set 
#
if [ -z $NEWTON_PATH ]; then
    echo "You have not set the environment variable NEWTON_PATH. Please set."
    echo ""
    echo "For example:"
    echo "    export NEWTON_PATH=/Users/danvir/Masterbox/sideprojects/github/newtonsystems/"
    echo ""
    exit
fi

cd $NEWTON_PATH/devops/k8s/deploy

./bin/delete-master.sh
./bin/delete-featuretest.sh
./bin/delete-dev-common.sh
