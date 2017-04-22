# docker-grpc-tools

Available from docker hub as [newtonsystems/tools/docker-grpc-tools](https://hub.docker.com/r/newtonsystems/tools/docker-grpc-tools)

#### Supported tags and respective `Dockerfile` links

-    [`v0.0b1`, `latest` (/Dockerfile*)](https://github.com/newtonsystems/devops/tools/docker-grpc-tools/blob/master/Dockerfile)

# What is docker-grpc-tools?

A base docker image to be used for circleci for compiling and building grpc services.


## How to use with circleci

- Add image to `image:` in circleci config

``` yml
version: 2.0
jobs:
  build:
    docker:
      - image: newtonsystems/tools/docker-grpc-tools:0.0.1
```

## Future

- Keep an eye on: [grpc-docker-library](https://github.com/grpc/grpc-docker-library/tree/master/1.0)
- Get alpine version working