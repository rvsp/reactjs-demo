pipeline {
    agent any

    stages {
        stage('Build and Push Docker Image') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    def dockerImage = docker.build('your-dockerhub-suganyamadhan1996/myfirstpush-reactjs-demo:dev-${env.BUILD_NUMBER}')
                    
                    withDockerRegistry([dockerhub: 'docker-hub-credentials', url: '']) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
