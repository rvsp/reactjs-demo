#!/bin/bash
IMAGE_NAME="nginx"
TAG="latest"
CONTAINER_NAME="my-container"
docker stop "$CONTAINER_NAME" >/dev/null 2>&1
docker rm "$CONTAINER_NAME" >/dev/null 2>&1
docker run -d --name "$CONTAINER_NAME" -p 80:80 "$IMAGE_NAME:$TAG"
if [[ "$(docker ps -aqf "name=$CONTAINER_NAME" 2>/dev/null)" == "" ]]; then
  echo "Failed to deploy the Docker container."
  exit 1
fi
echo "Docker container '$CONTAINER_NAME' was deployed successfully."

