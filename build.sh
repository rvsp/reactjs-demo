#!/bin/bash
IMAGE_NAME="nginx"
TAG="latest"
docker build -t "$IMAGE_NAME:$TAG" .
if [[ "$(docker images -q "$IMAGE_NAME:$TAG" 2>/dev/null)" == "" ]]; then
  echo "Failed to build the Docker image."
  exit 1
fi
echo "Docker image '$IMAGE_NAME:$TAG' was built successfully."

