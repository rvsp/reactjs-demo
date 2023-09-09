#!/bin/bash
set -e
current_dir="$(cd "$(dirname "$0")" && pwd)"
cd "$current_dir"
echo "Building the docker container React"
output=$(docker ps --format '{{.Names}}' | grep "React" || true)
if  [[ "$output" == *"React"* ]];
then
	echo "React container already exist"
	docker ps -a
	echo "Do you want to remove the previous React-App service?y/n"
	read input 
	if [[ "$input" == "y" ]];
	 then 
	        echo "Stopping React-App service"
         	docker-compose stop React-App
	 	echo "Removing React-App service"
	 	docker-compose rm React-App
		docker-compose up -d  React-App
	elif [[ "$input" == "n" ]];
	then	
	        echo "The container are"
 	 	docker-compose restart React-App
		docker ps -a
	else
		echo "Incorrect input"
	fi

else
	echo "React container not found"
	echo "Starting the container"
	docker-compose up -d  React-App
        docker ps -a
fi

