pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(changelog: true, url: 'https://github.com/adnaan-sidd/myproject.git', branch: '^Dev|master. *$', poll: true)
      }
    }

    stage('Build') {
      steps {
        sh '''ls -lh
pwd'''
      }
    }

  }
}