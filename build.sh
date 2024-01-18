echo "Building docker images"

docker build -t pradeep .

docker stop pradeep

docker run -itd -p 80:80 pradeep

