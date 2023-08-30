set -e
#making dir for jenkins volume
mkdir -p work

echo "Building docker image named test"
docker build -t test .
echo "Successfully built docker image"
docker images
