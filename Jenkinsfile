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

    stage('image') {
      steps {
        sh 'docker build -t webserver:vy .'
      }
    }

    stage('container') {
      steps {
        sh 'docker run -d --name WebServerCI -p 55:80 webserver:vy'
      }
    }

    stage('status') {
      parallel {
        stage('status') {
          steps {
            echo 'checking info'
          }
        }

        stage('imgen') {
          steps {
            sh 'docker images'
          }
        }

        stage('container') {
          steps {
            sh 'docker ps'
          }
        }

      }
    }

    stage('complete') {
      steps {
        echo 'Ci complete'
      }
    }

    stage('push') {
      steps {
        sh 'docker push e1rubs/webserver:vy'
      }
    }

  }
}