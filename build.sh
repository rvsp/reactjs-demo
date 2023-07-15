#!/bin/bash

# Set the Docker image name and tag
IMAGE_NAME="nginx"
TAG="latest"

# Build the Docker image
docker build -t "$IMAGE_NAME:$TAG" .

# Check if the image was successfully built
if [[ "$(docker images -q "$IMAGE_NAME:$TAG" 2>/dev/null)" == "" ]]; then
  echo "Failed to build the Docker image."
  exit 1
fi

echo "Docker image '$IMAGE_NAME:$TAG' was built successfully."

