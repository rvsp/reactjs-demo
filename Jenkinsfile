pipeline {
    agent any

    // Define environment variables (update these with your credentials)
    environment {
        DOCKER_HUB_USERNAME = 'suganyamadhan1996'
        DOCKER_HUB_PASSWORD = credentials('567') // Jenkins credential ID for Docker Hub password
        DOCKER_HUB_REPO = 'suganyamadhan1996/dev'
        IMAGE_TAG = "${env.BUILD_NUMBER}" // Using Jenkins build number as the Docker image tag
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub "dev" branch
                checkout([$class: 'GitSCM', branches: [[name: 'dev']], userRemoteConfigs: [[url: 'https://github.com/suganyaanbalagan123/reactjs-demo.git']]])
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                // Set the build context to the directory containing docker-compose.yml
               dir('/var/lib/jenkins/workspace/reactjs_demo/reactjs-demo') {
 {
                    // Build the Docker image using docker-compose
                    sh 'docker-compose build myapp'
                }
                script {
                    docker.withRegistry('https://index.docker.io/v1/', '567') {
                        // Tag and push the Docker image to Docker Hub
                        sh "docker tag reactjs-demo_myapp ${DOCKER_HUB_USERNAME}/${DOCKER_HUB_REPO}:${IMAGE_TAG}"
                        sh "docker push ${DOCKER_HUB_USERNAME}/${DOCKER_HUB_REPO}:${IMAGE_TAG}"
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
