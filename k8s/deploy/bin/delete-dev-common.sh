#!/bin/bash
#
# delete-dev-common.sh
#
# Deletes kubernetes environment: dev-common
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

kubectl delete -f dev-common/persistent-volume.yml --namespace=dev-common
kubectl delete -f dev-common/persistent-volume-claim.yml --namespace=dev-common
kubectl delete -f dev-common/mongo-headless-svc.yml --namespace=dev-common
kubectl delete -f dev-common/mongo-watch.yml --namespace=dev-common
# Delete statefulset on own then delete pods (as stated in k8s docs)
kubectl delete -f dev-common/mongo-statefulset.yml --namespace=dev-common  --cascade=false
kubectl delete pods -l role=mongo --namespace=dev-common

echo "Delete all from yml files"
kubectl delete -f dev-common/ --namespace=dev-common

echo "Lazily delete all other components"
kubectl delete deployment --all --namespace=dev-common
kubectl delete daemonset --all --namespace=dev-common
kubectl delete replicationcontroller --all --namespace=dev-common
kubectl delete services --all --namespace=dev-common
kubectl delete pods --all --namespace=dev-common
kubectl delete configmap --all --namespace=dev-common
kubectl delete statefulset --all --namespace=dev-common
kubectl delete jobs --all --namespace=dev-common
