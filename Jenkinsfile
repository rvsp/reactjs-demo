pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Check out the code from the 'dev' branch in the GitHub repository
                checkout([$class: 'GitSCM',
                          branches: [[name: 'dev']],
                          userRemoteConfigs: [[url: 'https://github.com/suganyaanbalagan123/reactjs-demo.git']]])
            }
        }
        stage('Build and Push Docker Image') {
            steps {
                // Build the Docker image and tag it
                script {
                    def imageName = "suganyamadhan1996/dev:myfirstpush-reactjs-demo"
                    def imageTag = "latest"

                    // Build the Docker image
                    docker.build(imageName + ":" + imageTag, ".")

                    // Log in to Docker Hub with your credentials
                    withDockerRegistry([credentialsId: "234"]) {
                        // Push the Docker image to Docker Hub
                        docker.withRegistry("", "dockerhub") {
                            dockerImage.push()
                        }
                    }
                }
            }
        }
    }
}
