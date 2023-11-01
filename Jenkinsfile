pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(changelog: true, url: 'https://github.com/adnaan-sidd/myproject.git', branch: 'Dev', poll: true)
      }
    }

    stage('Build') {
      agent any
      steps {
        sh '''ls -lh
pwd'''
      }
    }

  }
}