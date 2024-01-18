echo "starting the deployment"

docker tag pradeep:latest pradeepansrsp/capstone-prod:pradeep

docker login -u pradeepansrsp -p 123Subbu#

docker push pradeepansrsp/capstone-prod:pradeep
