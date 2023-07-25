
pipeline {
    agent any

    environment {
        DOCKER_REGISTRY = 'docker.io'  // Replace with the appropriate Docker registry
        DOCKER_USERNAME = credentials('suganyamadhan1996')  // Replace 'docker-hub-username' with your Docker Hub credentials ID
        DOCKER_PASSWORD = credentials('Suman#123')  // Replace 'docker-hub-password' with your Docker Hub credentials ID
        IMAGE_NAME = 'suganyamadhan1996/dev:myfirstpush-reactjs-demo'  // Replace with your Docker Hub username and image name
        IMAGE_TAG = 'latest'  // You can set a specific tag or use 'latest'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.withRegistry("${DOCKER_REGISTRY}", "${DOCKER_USERNAME}") {
                        sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry("${DOCKER_REGISTRY}", "${DOCKER_USERNAME}") {
                        sh "docker push ${IMAGE_NAME}:${IMAGE_TAG}"
                    }
                }
            }
        }
    }
}
