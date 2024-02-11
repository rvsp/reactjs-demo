pipeline {

   agent any

   stages {

     stage('Install Dependencies') {
        steps {
           sh 'npm install'
           sh 'npm audit fix --force'
           sh 'npm run build'
        }
     }

     stage('Test') {
        steps {
           sh 'echo "testing application..."'
        }
      }

         stage("Deploy npm cloud application") {
         steps {
           sh 'echo "deploying application..."'
         }

     }

        }

   }
