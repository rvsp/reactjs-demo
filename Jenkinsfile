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
                chmod +x build.sh
                ./build.sh
                '''
            }
        }
    }
}

