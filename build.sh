set -e
#making dir for jenkins volume
mkdir -p work

echo "Do you wish to install Docker and Docker compose? y/n"
read input

if [[ "$input" == "y" ]];
then 
	echo "Updating sysytem"
	sudo apt update

	echo "Installing docker"
	sudo apt install docker.io

	echo "Installing docker-compose"
	sudo apt install docker-compose -y

elif [[ "$input" == "n" ]];
then 	
	echo "Exiting the docker installing process"
else
    echo "Invalid input. Exiting the Docker installation process"
fi

echo "Building docker image named test"
docker build -t test .
echo "Successfully built docker image"
docker images
