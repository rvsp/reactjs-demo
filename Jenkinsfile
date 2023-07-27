pipeline {
    agent any

    // Define environment variables (update these with your credentials)
    environment {
        DOCKER_HUB_USERNAME = 'suganyamadhan1996'
        DOCKER_HUB_REPO = 'suganyamadhan1996/dev'
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
                // Set the build context to the 'reactjs_pipeline' directory
                dir('/var/lib/jenkins/workspace/reactjs_demo/') {
                    // Build the Docker image using docker-compose
                    sh 'docker-compose build myapp'
                }
                
                // Authenticate and push the Docker image to Docker Hub
                withDockerRegistry(credentialsId: '567', url: 'https://hub.docker.com/') {
                    // Tag and push the Docker image to Docker Hub
                    sh "docker tag reactjs_demo_myapp ${DOCKER_HUB_USERNAME}/${DOCKER_HUB_REPO}:${BUILD_NUMBER}"
                    
                    // Use --password-stdin to securely provide the password
                    sh "echo \$dckr_pat_2nxtl_DFKNmGcUV2mWHfSODdZnQ | docker login -u \$DOCKER_HUB_USERNAME --password-stdin https://hub.docker.com/"
                    
                    sh "docker push ${DOCKER_HUB_USERNAME}/${DOCKER_HUB_REPO}:${BUILD_NUMBER}"
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
