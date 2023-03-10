pipeline{
    agent any
    
    stages{
        stage('start'){
            steps{
                sh 'npm install'
            }
        }
        stage('run build.sh'){
            steps{
                checkout scmGit(branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/satheeka/reactjs-demo.git']])
                 sh 'npm run build'
                 sh 'chmod +x ./build.sh'
                 sh './build.sh'
            }
        }
        stage('push Dev Repo'){
             when {
              expression { BRANCH_NAME == 'dev' }
            }
            steps{
                DOCKERHUB_CREDENTIALS=credentials('dockerid') {
                sh 'chmod 777 ./deploy.sh'
                sh './deploy.sh'
                }
            }
        }
        stage('push Prod repo'){
            when {
              expression { BRANCH_NAME == 'master' }
            }
            steps {
                DOCKERHUB_CREDENTIALS=credentials('dockerid') {
                 sh 'sudo docker login -u satheeka -p satheesh1'
                 sh 'sudo docker tag react-app:latest satheeka/prod:latest'
                 sh 'sudo docker push satheeka/prod:latest'
                }           
            }
        }    
    }
}
