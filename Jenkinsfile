pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'dev', credentialsId: '85e6ca37-e41f-41d6-9134-1129e9a5d7e9', url: 'https://github.com/adnaan-s/project.git'
            }
        }

        stage('Initialize Docker') {
            steps {
                script {
                    def dockerHome = tool 'docker'
                    env.PATH = "${dockerHome}/bin:${env.PATH}"
                }
            }
        }

        stage('Build') {
            steps {
                sh "docker build -t practice ."
            }
        }
    }
}

