echo "Building docker images"

docker build -t pradeep .

docker-compose down || true

docker-compose up -d
