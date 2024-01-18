echo "starting the deployment"

docker tag pradeep pradeepansrsp/capstone-prod

docker login -u pradeepansrsp -p 123Subbu#

docker push pradeepansrsp/capstone-prod
