pipeline {
    agent any
    
    tools{
        nodejs 'nodejs'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'dev', url: 'https://github.com/adnaan-sidd/myproject.git'
            }
        }
        
        stage('Build&Push') {
            steps {
                sh 'docker build -t myproject .' // Corrected the Docker build command
                sh 'docker tag myproject:latest adnaansidd/dev:lts'
                sh 'docker login -u adnaansidd -p 26122001As@'
                sh 'docker push adnaansidd/dev:lts'
            }
        }
    }
}
