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
        sh 'docker build -t e1rubs/webserver:vz .'
      }
    }

    stage('container') {
      steps {
        sh 'docker run -d --name WebServerCIz -p 56:80 e1rubs/webserver:vz'
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
        sh 'docker push e1rubs/webserver:vz'
      }
    }

    stage('CD') {
      steps {
        echo 'Starting CD'
      }
    }

    stage('Deploy') {
      steps {
        sh 'kubectl create deployment mi-webserverz --image=e1rubs/webserver:vz'
      }
    }

    stage('Expose') {
      steps {
        sh '''Kubectl expose deployment mi-webserverz --type=NodePort --port=80
'''
      }
    }

    stage('Delivery') {
      steps {
        sh '''Minikube service mi-webserverz --url
'''
      }
    }

  }
}