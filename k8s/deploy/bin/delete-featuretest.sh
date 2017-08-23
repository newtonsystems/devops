#!/bin/bash
#
# delete-featuretest.sh
#
# Deletes kubernetes environment: featuretest
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
kubectl delete -f featuretest/ --namespace=featuretest

echo "Lazily delete all other components"
kubectl delete deployment --all --namespace=featuretest
kubectl delete daemonset --all --namespace=featuretest
kubectl delete replicationcontroller --all --namespace=featuretest
kubectl delete services --all --namespace=featuretest
kubectl delete pods --all --namespace=featuretest
kubectl delete configmap --all --namespace=featuretest
kubectl delete statefulset --all --namespace=featuretest
kubectl delete jobs --all --namespace=featuretest
