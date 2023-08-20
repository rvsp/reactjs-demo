set -e
echo "Do you wish to install Docker and Docker compose? y/n"
read input
if [[ "$input" == "y" ]]
then 
	echo "Updating sysytem"
	sudo apt update

	echo "Installing docker"
	sudo apt install docker.io

	echo "Installing docker-compose"
	sudo apt install docker-compose -y

else 
	echo "Exiting the docker installing process"
fi

echo "Building docker image named test"
docker build -t test .
echo "Successfully built docker image"
docker images
