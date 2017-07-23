kubectl --namespace=master delete -f master/
kubectl --namespace=featuretest delete -f featuretest/
kubectl --namespace=dev-common delete -f dev-common/
