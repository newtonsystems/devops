#!/usr/bin/env bash

if [ -z "$DEVPI_USERNAME" ]; then
    echo "You have not set the environment variable DEVPI_USERNAME"
    exit 1
fi

if [ -z "$DEVPI_PASSWORD" ]; then
    echo "You have not set the environment variable DEVPI_USERNAME"
    exit 1
fi

if [ -z "$DEVPI_HOST" ]; then
    echo "You have not set the environment variable DEVPI_HOST"
    exit 1
fi

# Lazy python sorry chap!
# Note: When we increment we want it to be the latest package 
#       when we try and use it. 
# i.e. 0.1.dev89 would not be suitable as `devpi install <package_name>` would not install it
VERSION=$(python -c "import os; from $CIRCLE_PROJECT_REPONAME import __version__; major, minor, patch = __version__.split('.'); print '%s.%s.%s' % (major, minor, os.getenv('CIRCLE_BUILD_NUM'))")

echo -e "__version__ = '$VERSION'" > $CIRCLE_PROJECT_REPONAME/__init__.py

# build package and upload to private pypi index
devpi use $DEVPI_HOST
devpi login $DEVPI_USERNAME --password $DEVPI_PASSWORD
devpi use $DEVPI_USERNAME/$CIRCLE_BRANCH

# Upload package to devpi
if [ -d "./docs" ]; then
    echo "Found docs/ folder will upload with documentation ... "
    devpi upload
    devpi upload --with-docs --formats bdist_wheel
else
    devpi upload
    devpi upload --formats bdist_wheel
fi
