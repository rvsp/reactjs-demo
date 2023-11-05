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
                        userRemoteConfigs: [[url: 'https://github.com/adnaan-s/project.git']]
                    ])
                }
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Run the build script
                    sh 'docker build -t demo .'

                    // Tag the image
                    sh 'docker tag demo:latest adnaansidd/dev:lts'
                    
                    // Push the image to the development Docker Hub repository
                    sh 'docker login -u adnaansidd -p 26122001As@'
                    sh 'docker push adnaansidd/dev:lts'
                }
            }
        }
    }

    post {
        success {
            script {
                // Check if the current branch is 'main' (indicating a production release)
                def currentBranch = sh(script: 'git rev-parse --abbrev-ref HEAD', returnStatus: true).trim()
                if (currentBranch == 'main') {
                    // Build the Docker image
                    sh 'docker build -t demo2 .'
                    
                    // Tag the image
                    sh 'docker tag demo2:latest adnaansidd/prod:lts'
                    
                    // Push the image to the production Docker Hub repository
                    sh 'docker login -u adnaansidd -p 26122001As@'
                    sh 'docker push adnaansidd/prod:lts'
                }
            }
        }
    }

}
