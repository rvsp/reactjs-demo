pipeline {
    agent any

    stages {
        stage('Initialize Docker') {
            steps {
                script {
                    def dockerHome = tool 'docker'
                    env.PATH = "${dockerHome}/bin:${env.PATH}"
                }
            }
        }

        stage('Checkout') {
            steps {
                script {
                    checkout([$class: 'GitSCM',
                        branches: [[name: dev]], // Use the branch from the webhook payload
                        userRemoteConfigs: [[url: https://github.com/adnaan-s/project.git]] // Use the URL from the webhook payload
                    ])
                }
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t practice .'
            }
        }
    }
}

