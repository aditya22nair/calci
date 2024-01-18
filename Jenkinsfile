pipeline {
  environment {
    dockerimagename = "vue-app"
    dockerImage = ""
  }
  agent any
  stages {

    stage('Build image') {
      steps{
        script {
          container('docker') {
                dockerImage = docker.build dockerimagename
            }
        }
      }
    }
    stage('Pushing Image') {
      environment {
          registryCredential = 'dockerhub'
           }
      steps{
        script {
          docker.withRegistry( 'https://hub.docker.com', registryCredential ) {
            dockerImage.push("latest")
          }
        }
      }
    }
    stage('Deploy to Minikube') {
        steps {
            script {
                    // Set Minikube Docker environment
                    sh 'eval $(minikube docker-env)'

                    // Apply Kubernetes Deployment
                    sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
  }
}