echo "Building docker images"

docker build -t pradeep .

docker run -itd -p 80:80 pradeep