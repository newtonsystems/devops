#!/bin/bash
#
# delete-master.sh
#
# Deletes kubernetes environment: master
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


echo "Delete all from yml files"
kubectl delete -f master/ --namespace=master

echo "Lazily delete all other components"
kubectl delete deployment --all --namespace=master
kubectl delete daemonset --all --namespace=master
kubectl delete replicationcontroller --all --namespace=master
kubectl delete services --all --namespace=master
kubectl delete pods --all --namespace=master
kubectl delete configmap --all --namespace=master
kubectl delete statefulset --all --namespace=master
kubectl delete jobs --all --namespace=master
