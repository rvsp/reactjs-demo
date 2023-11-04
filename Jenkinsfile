pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                script {
                    // Check out the repository from a specific branch
                    checkout([$class: 'GitSCM', 
                        branches: [[name: 'dev']], 
                        userRemoteConfigs: [[url: 'https://github.com/adnaan-s/project.git']]
                    ])
                }
            }
        }

        stage('build') {
            steps {
                sh ''' 
                docker build -t practice .
                '''
            }
        }

        stage('Initialize') {
            steps {
                script {
                    def dockerHome = tool 'docker'
                    env.PATH = "${dockerHome}/bin:${env.PATH}"
                }
            }
        }
    }
}

