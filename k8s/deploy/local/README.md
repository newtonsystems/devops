# Kubernete configuration for running services locally via minikube

- Based on https://github.com/linkerd/linkerd-examples  (Keep an eye on changes in case there is anything we can change for the better)

## Noticeable differences between other environments

- We do NOT use `imagePullPolicy` in case we update the images when in development