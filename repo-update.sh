#/bin/bash
git fetch
git pull
git submodule foreach --recursive git reset --hard
git submodule update --init --recursive
