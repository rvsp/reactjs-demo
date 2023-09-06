#!/bin/bash

if [ "$GIT_BRANCH" == "origin/dev" ]; then
    # Build and push to public DockerHub repo for dev branch
    docker build -t oootuxed0ooo/dev:test .
    docker push oootuxed0ooo/dev:test
elif [ "$GIT_BRANCH" == "origin/master" ]; then
    # Build and push to private DockerHub repo for master branch
    docker build -t your-image-name:master .
    docker login -u your-dockerhub-user -p your-dockerhub-password
    docker push your-dockerhub-user/your-private-repo:master
fi

