pipeline {
    agent any
    
    // Define environment variables (update these with your credentials)
    environment {
        DOCKER_HUB_USERNAME = 'suganyamadhan1996'
        DOCKER_HUB_PASSWORD = credentials('dckr_pat_2nxtl_DFKNmGcUV2mWHfSODdZnQ') // Jenkins credential ID for Docker Hub password
        DOCKER_HUB_REPO = 'suganyamadhan1996/dev'
        IMAGE_TAG = "${env.BUILD_NUMBER}" // Using Jenkins build number as the Docker image tag
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from GitHub
                git 'https://github.com/suganyaanbalagan123/reactjs-demo.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Build the Docker image
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        docker.build("${DOCKER_HUB_USERNAME}/${DOCKER_HUB_REPO}:${IMAGE_TAG}")
                    }
                }
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                // Push the Docker image to Docker Hub
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        docker.image("${DOCKER_HUB_USERNAME}/${DOCKER_HUB_REPO}:${IMAGE_TAG}").push()
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
