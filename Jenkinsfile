pipeline {
    agent any

    stages {
        stage('Build and Push Docker Image') {
            when {
                branch 'dev'
            }
            steps {
                script {myfirstpush-reactjs-demo
                    def dockerImage = docker.build('suganyamadhan1996/:dev-${env.BUILD_NUMBER}')
                    
                    withDockerRegistry([dockerhub: 'docker-hub-credentials', url: '']) {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Push to Prod Repository') {
            when {
                branch 'master'
            }
            steps {
                script {
                    def dockerImage = docker.image('suganyamadhan1996/myfirstpush-reactjs-demo:dev-${env.BUILD_NUMBER}')
                    
                    dockerImage.push('suganyamadhan1996/myfirstpush-reactjs-demo:prod-${env.BUILD_NUMBER}')
                }
            }
        }
    }
}
