#!/bin/bash

apt-get update&& apt install docker.io -y
docker --version
read -p "image version: " option
docker build -t reactapp:$option .
dokcker images
