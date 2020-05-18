pipeline {
  agent any
  stages {
    stage('content') {
      parallel {
        stage('content') {
          steps {
            sh 'ls -ltr'
          }
        }

        stage('versions') {
          steps {
            sh 'git --version'
            sh 'docker --version'
          }
        }

      }
    }

    stage('message') {
      steps {
        echo 'Starting CI'
      }
    }

  }
}