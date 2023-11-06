pipeline {
    agent any
    
    tools{
        nodejs 'nodejs'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/adnaan-sidd/myproject.git'
            }
        }
    }
    
    stage('Build and Test') {
            steps {
                // Add your build and test steps for the main/master branch here
                sh 'docker build -t deployment .' // Corrected the Docker build command
                sh 'docker tag deployment:latest adnaansidd/prod:lts'
                sh 'docker login -u adnaansidd -p 26122001As@'
                sh 'docker push adnaansidd/prod:lts'
            }
        }
    }
}
