#!/bin/bash

source config.sh
docker rmi $img_tag
docker build --build-arg arch=$(uname -m) -t $img_tag -f Dockerfile .
docker push $img_tag
