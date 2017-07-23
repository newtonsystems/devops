# How to deploy featuretest information

- Use rancher create kubernetes environment
- create hosts (AWS) make sure odd number (kubernetes like odd numbers)
- use common folder to install namespaces 

``` 
e.g.
    kubectl create -f ../common/
```