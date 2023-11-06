pipeline {
    agent any

    tools{
        nodejs 'nodejs'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from your Git repository
                script {
                    def scmVars = checkout scm
                    env.GIT_BRANCH = scmVars.GIT_BRANCH
                }
            }
        }

        stage('Build and Test') {
            when {
                expression { env.GIT_BRANCH ==~ /master/ }
            }
            steps {
                // Add your build and test steps for the main/master branch here
                sh 'docker build -t myproject2' // Example build step
                sh 'docker tag myproject2:latest adnaansidd/prod:lts' // tag
                sh "docker login -u adnaansidd -p 26122001As@"
                sh "docker push adnaansidd/prod:lts"
            }
        }

        stage('Build for Feature Branch') {
            when {
                expression { env.GIT_BRANCH !=~ /dev/ }
            }
            steps {
                // Add specific build steps for feature branches here
                sh 'docker build -t myproject .' // Example build step for feature branches
                sh "docker tag myproject:latest adnaansidd/dev:lts"
                sh "docker login -u adnaansidd -p 26122001As@"
                sh "docker push adnaansidd/dev:lts"
            }
        }

        stage('Deploy') {
            when {
                expression { currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            steps {
                // Add deployment steps here
                sh "docker run -d -p 80:80 --name app adnaansidd/prod:lts"
                // Deploy to production, staging, or other environments
            }
        }
    }
}
