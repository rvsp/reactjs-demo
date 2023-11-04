#!/bin/bash

# Define the name for your Docker image
IMAGE_NAME="practice"

# Build the Docker image
docker build -t $IMAGE_NAME .

# Check if the build was successful
if [ $? -eq 0 ]; then
  echo "Docker image build successful: $IMAGE_NAME"
else
  echo "Docker image build failed"
fi

