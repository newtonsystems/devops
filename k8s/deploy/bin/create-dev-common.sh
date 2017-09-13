#!/bin/bash
#
# create-dev-common.sh
#
# Creates kubernetes environment: dev-common
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

echo "Setting up mongo replica set"
kubectl apply -f dev-common/persistent-volume.yml --namespace=dev-common
sleep 10
kubectl apply -f dev-common/persistent-volume-claim.yml --namespace=dev-common
kubectl apply -f dev-common/mongo-headless-svc.yml --namespace=dev-common
kubectl apply -f dev-common/mongo-watch.yml --namespace=dev-common
sleep 20
kubectl get pvc --namespace=master
sleep 30
kubectl get services --namespace=dev-common
kubectl apply -f dev-common/mongo-statefulset.yml --namespace=dev-common 
sleep 30
kubectl get statefulSet --namespace=dev-common
kubectl describe statefulSet --namespace=dev-common
sleep 60
kubectl get pods --namespace=dev-common | grep watch | awk '{print $1}' | xargs kubectl logs -f --namespace=dev-common

echo "Checking the status of the replica set"
sleep 60
kubectl run mongoshell0 --image=marcob/mongo-watch -i -t --rm --restart=OnFailure -- mongo --host mongo-0.mongo --quiet workload --eval "rs.status()" --namespace=dev-common

echo "Adding external connection to mongo"
kubectl apply -f dev-common/mongo-external.yml --namespace=dev-common

echo "Lazily adding any others just in case ..."
kubectl apply -f dev-common/ --namespace=dev-common
