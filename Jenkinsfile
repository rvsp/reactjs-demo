pipeline {
    agent any
 stages {
     stage('Pull Code') {
         steps {
          // Pull code from GitHub repository
            git 'https://github.com/Deepika94/reactjs-demo'
        }
      }

     stage('Grant Permissions') {
        steps {
         // Grant executable permissions to a file
           sh 'chmod +x build.sh'
           sh 'chmod +x deploy.sh'
        }
      }

     stage('Build') {
         steps {
        // Run build script
          sh './build.sh'
         }
     }

     stage('Docker Push to dev') {
        steps {
        // Docker push based on branch name
         withCredentials([usernamePassword(credentialsId: 'docker-id', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
           sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
           sh "docker tag reactjs:lts deepikajag/dev:lts"
           sh "docker push deepikajag/dev:lts"
          }
       }
    } 
     stage('Docker Push to prod') {
      steps {
         withCredentials([usernamePassword(credentialsId: 'docker-id', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
           sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
           sh "docker tag reactjs:lts deepikajag/dev:lts"
           sh "docker push deepikajag/dev:lts"
          }
        }
    }
     stage('Deploy') {
        steps {
        // Run deploy script
          sh './deploy.sh'
        }
     }
    }                                

       
}
