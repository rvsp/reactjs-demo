pipeline {
    agent any
    
    tools {
        nodejs 'nodejs'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Check out the code from the 'dev' branch in GitHub
                    checkout([$class: 'GitSCM',
                        branches: [[name: 'dev']], 
                        userRemoteConfigs: [[url: 'https://github.com/adnaan-sidd/myproject.git']]
                    ])
                }
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Run the build script
                    sh 'docker build -t myproject .'

                    // Tag the image
                    sh 'docker tag demo:latest adnaansidd/dev:lts'
                    
                    // Push the image to the development Docker Hub repository
                    sh 'docker login -u adnaansidd -p 26122001As@'
                    sh 'docker push adnaansidd/dev:lts'
                }
            }
        }
    }
}
