echo "Building docker images"

docker build -t pradeepansrsp/capstone-prod .

docker-compose down || true

docker-compose up -d
