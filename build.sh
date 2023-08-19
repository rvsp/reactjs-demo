#! /bin/bash

# check whether the docker is install

if ! command -v docker &>/dev/null;
then 
echo " Docker is not installed "
exit 1
fi 

# Build the docker images 

#dockerfile_path = pwd

echo " Building the docker images"
docker build -t  reactjs:lts .